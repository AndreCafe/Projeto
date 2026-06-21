unit uWakeOnLan;
{
    ResourceString: Dario 13/03/13
}

interface

uses
   WinTypes, Messages, SysUtils, Classes, IdBaseComponent,
   IdComponent, IdUDPBase, IdUDPClient;

procedure WakeUPComputer(aMacAddress: string);

implementation 

function HexToInt(S:String): integer;
const
  DecDigits: Set Of '0'..'9' = ['0'..'9'];
  HexVals: Array [0..$F] Of Integer =
    (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, $A, $B, $C, $D, $E, $F);

 UpCaseHexLetters: Set Of 'A'..'F' = ['A'..'F'];
 LowCaseHexLetters: Set Of 'a'..'f' = ['a'..'f'];
var
  v: LongInt;
  i: integer;
  LookUpIndex: integer;
begin
  if length(S) <= 8 then begin
    v := 0;
    for i := 1 to length(S) do begin
      {$R-}
      v := v Shl 4;
      {$R+}
      if S[i] in DecDigits then
        LookUpIndex := Ord(S[i]) - Ord('0')
      else 
      if S[i] in UpCaseHexLetters then 
        LookUpIndex := Ord(S[i]) - Ord('A') + $A
      else  
      if S[i] in LowCaseHexLetters then 
        LookUpIndex := Ord(S[i]) - Ord('a') + $A
      else  
        LookUpIndex := 0;
      v := v Or HexVals[LookUpIndex];
    end;
    result := v;
  end else 
    result := 0;
end;

procedure WakeUPComputer(aMacAddress: string);
var
   i, j: Byte;
   lBuffer: array[1..116] of Byte;
   lUDPClient: TidUDPClient;
begin
  try
    for i := 1 to 6 do 
      lBuffer[i] := HexToInt(aMacAddress[(i * 2) - 1] + aMacAddress[i * 2]);


    lBuffer[7] := $00;
    lBuffer[8] := $74;
    lBuffer[9] := $FF;
    lBuffer[10] := $FF;
    lBuffer[11] := $FF;
    lBuffer[12] := $FF;
    lBuffer[13] := $FF;
    lBuffer[14] := $FF;
    
    for j := 1 to 16 do 
      for i := 1 to 6 do 
        lBuffer[15 + (j - 1) * 6 + (i - 1)] := lBuffer[i];


    lBuffer[116] := $00;
    lBuffer[115] := $40;
    lBuffer[114] := $90;
    lBuffer[113] := $90;
    lBuffer[112] := $00;
    lBuffer[111] := $40;
    
    lUDPClient := TIdUDPClient.Create(nil);
    try
      lUDPClient.BroadcastEnabled := true;
      lUDPClient.Host := '255.255.255.255';   // do not localize
      lUDPClient.Port := 2050;
      lUDPClient.SendBuffer(lBuffer, 116);
    finally
      lUDPClient.Free;
    end;
  except
  end;
end;

end.



{



Function to return the MAC address of a
remote or local machine in the format 'XX-XX-XX-XX-XX-XX'



The returned MAC address is a Unique ID that can be used in various
ways. One way is as a parameter to my Wake On Lan function.(See article
"http://www.delphi3000.com/articles/article_3847.asp")



Example :



ShowMessage(GetMacAddress('\\MHEYDON');



Output = '00-02-08-E7-99-6B'

Answer:



//
======================================================================

// Return the MAC address of Machine identified by AServerName

// Format of AServerName is '\\ServerName' or 'ServerName'

// If AServerName is a null String then local machine MAC address

// is returned.

// Return string is in format 'XX-XX-XX-XX-XX-XX'

//
======================================================================



function GetMacAddress(const AServerName : string) : string;

type

      TNetTransportEnum = function(pszServer : PWideChar;

                                   Level : DWORD;

                                   var pbBuffer : pointer;

                                   PrefMaxLen : LongInt;

                                   var EntriesRead : DWORD;

                                   var TotalEntries : DWORD;

                                   var ResumeHandle : DWORD) : DWORD;
stdcall;



      TNetApiBufferFree = function(Buffer : pointer) : DWORD; stdcall;



      PTransportInfo = ^TTransportInfo;

      TTransportInfo = record

                        quality_of_service : DWORD;

                        number_of_vcs : DWORD;

                        transport_name : PWChar;

                        transport_address : PWChar;

                        wan_ish : boolean;

                      end;



var E,ResumeHandle,

     EntriesRead,

     TotalEntries : DWORD;

     FLibHandle : THandle;

     sMachineName,

     sMacAddr,

     Retvar : string;

     pBuffer : pointer;

     pInfo : PTransportInfo;

     FNetTransportEnum : TNetTransportEnum;

     FNetApiBufferFree : TNetApiBufferFree;

     pszServer : array[0..128] of WideChar;

     i,ii,iIdx : integer;

begin

   sMachineName := trim(AServerName);

   Retvar := '00-00-00-00-00-00';



   // Add leading \\ if missing

   if (sMachineName <> '') and (length(sMachineName) >= 2) then
begin

     if copy(sMachineName,1,2) <> '\\' then

       sMachineName := '\\' + sMachineName

   end;



   // Setup and load from DLL

   pBuffer := nil;

   ResumeHandle := 0;

   FLibHandle := LoadLibrary('NETAPI32.DLL');



   // Execute the external function

   if FLibHandle <> 0 then begin

     @FNetTransportEnum :=
GetProcAddress(FLibHandle,'NetWkstaTransportEnum');

     @FNetApiBufferFree := GetProcAddress(FLibHandle,'NetApiBufferFree');

     E :=
FNetTransportEnum(StringToWideChar(sMachineName,pszServer,129),0,


pBuffer,-1,EntriesRead,TotalEntries,Resumehandle);



     if E = 0 then begin

       pInfo := pBuffer;



       // Enumerate all protocols - look for TCPIP

       for i := 1 to EntriesRead do begin

         if pos('TCPIP',UpperCase(pInfo^.transport_name)) <> 0
then begin

           // Got It - now format result 'xx-xx-xx-xx-xx-xx'

           iIdx := 1;

           sMacAddr := pInfo^.transport_address;



           for ii := 1 to 12 do begin

             Retvar[iIdx] := sMacAddr[ii];

             inc(iIdx);

             if iIdx in [3,6,9,12,15] then inc(iIdx);

           end;

         end;



         inc(pInfo);

       end;

       if pBuffer <> nil then FNetApiBufferFree(pBuffer);

     end;



     try

       FreeLibrary(FLibHandle);

     except

       // Silent Error

     end;

   end;



   Result := Retvar;

end;




This procedure will switch on a machine
that is connected to a LAN. The MAC address of the machine is needed to
be known.


See my article
("http://www.delphi3000.com/articles/article_3867.asp")
for a function
GetMacAddress() that returns a MAC Address String.




The "Wake On Lan" feature of the machine's BIOS must be enabled.




The procedure works by broadcasting a UDP packet containing the
"Magic Number" to all machines on the LAN. The machine with the MAC
address, if switched of and BIOS WOL enabled will wake up and boot.




The MAC address required is a "-" delimited 17 char string.


Example :




WakeOnLan('00-D0-B7-E2-A1-A0');
Answer:



uses idUDPClient;




//
==========================================================================


// Wakes a machine on lan


// AMacAddress is 17 char MAC address.


// eg. '00-C0-4F-0A-3A-D7'


//
==========================================================================




procedure WakeOnLan(const AMacAddress : string);


type


      TMacAddress = array [1..6] of byte;




      TWakeRecord = packed record


        Waker : TMACAddress;


        MAC : array[0..15] of TMACAddress;


      end;




var i : integer;


     WR : TWakeRecord;


     MacAddress : TMacAddress;


     UDP : TIdUDPClient;


     sData : string;


begin


   // Convert MAC string into MAC array


   fillchar(MacAddress,SizeOf(TMacAddress),0);


   sData := trim(AMacAddress);




   if length(sData) = 17 then begin


     for i := 1 to 6 do begin


       MacAddress[i] := StrToIntDef('$' + copy(sData,1,2),0);


       sData := copy(sData,4,17);


     end;


   end;




   for i := 1 To 6 do WR.Waker[i] := $FF;
   for i := 0 to 15 do WR.MAC[i] := MacAddress;

   // Create UDP and Broadcast data structure
   UDP := TIdUDPClient.Create(nil);

   UDP.Host := '255.255.255.255';

   UDP.Port := 32767;


   UDP.BroadCastEnabled := true;


   UDP.SendBuffer(WR,SizeOf(TWakeRecord));


   UDP.BroadcastEnabled := false;


   UDP.Free;


end;

Let us know what you think Email us!

Copyright 2008 © Tamarack Associates 
www.TamarackA.com 	6/10/2008 7:42:36 AM, Generated in 94ms 	www.FullTextSearch.com
unit Unit1;

interface

implementation

end.
