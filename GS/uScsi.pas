unit uScsi;

interface

uses Windows, Sysutils;

function GetSCSISerial(Drive: Char): String;

implementation

function GetDeviceHandle( sDeviceName : String ) : THandle;
begin
	Result := CreateFile( PChar('\\.\'+sDeviceName), GENERIC_READ or GENERIC_WRITE,
				FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0 )
end;

//-------------------------------------------------------------
function ScsiHddSerialNumber( DeviceHandle : THandle ) : String;
{$ALIGN ON}
type
	TScsiPassThrough = record
		Length             : Word;
		ScsiStatus         : Byte;
		PathId             : Byte;
		TargetId           : Byte;
		Lun                : Byte;
		CdbLength          : Byte;
		SenseInfoLength    : Byte;
		DataIn             : Byte;
		DataTransferLength : ULONG;
		TimeOutValue       : ULONG;
		DataBufferOffset   : DWORD;
		SenseInfoOffset    : ULONG;
		Cdb                : Array[0..15] of Byte;
	end;
	TScsiPassThroughWithBuffers = record
		spt : TScsiPassThrough;
		bSenseBuf : Array[0..31] of Byte;
		bDataBuf : Array[0..191] of Byte;
	end;
{ALIGN OFF}
var	dwReturned : DWORD;
    len : DWORD;
		Buffer : Array[0..SizeOf(TScsiPassThroughWithBuffers)+SizeOf(TScsiPassThrough)-1] of Byte;
		sptwb : TScsiPassThroughWithBuffers absolute Buffer;
begin
{$I crypt_start.inc}
	Result := '';
	FillChar(Buffer,SizeOf(Buffer),#0);
	with sptwb.spt do
	begin
		Length   := SizeOf(TScsiPassThrough);
		CdbLength := 6; // CDB6GENERIC_LENGTH
		SenseInfoLength := 24;
		DataIn := 1; // SCSI_IOCTL_DATA_IN
		DataTransferLength := 192;
		TimeOutValue := 2;
		DataBufferOffset := PChar(@sptwb.bDataBuf)-PChar(@sptwb);
		SenseInfoOffset := PChar(@sptwb.bSenseBuf)-PChar(@sptwb);
		Cdb[0] := $12; //	OperationCode := SCSIOP_INQUIRY;
		Cdb[1] := $01; //	Flags := CDB_INQUIRY_EVPD;  Vital product data
		Cdb[2] := $80; //	PageCode            Unit serial number
		Cdb[4] := 192; // AllocationLength
	end;
	len := sptwb.spt.DataBufferOffset+sptwb.spt.DataTransferLength;
	if DeviceIoControl( DeviceHandle, $0004d004, @sptwb, SizeOf(TScsiPassThrough), @sptwb, len, dwReturned, nil )
		and ((PChar(@sptwb.bDataBuf)+1)^=#$80)
	then SetString( Result, PChar(@sptwb.bDataBuf)+4, Ord((PChar(@sptwb.bDataBuf)+3)^) );
{$I crypt_end.inc}
end;


//=============================================================
function GetSCSISerial(Drive: Char): String;
var
	hDevice : THandle;
	sSerNum : String;
begin
   Result := '';
	hDevice := GetDeviceHandle( Drive);
	if hDevice<>INVALID_HANDLE_VALUE then
   try
	  Result := ScsiHddSerialNumber(hDevice);
   finally
	  CloseHandle(hDevice);
	end;
end;
      
end.
