{
*** Get MAC Adress ***
*** by Filip Skalka, fip@post.cz ***
*** September 2002 ***
}

unit MACAdress;
interface
uses classes;

function GetMACAdresses(const Adresses:TStringList;const MachineName:string=''):integer;
function GetMACAdress(const MachineName:string=''):string;

implementation

uses NB30,sysutils;

type
 ENetBIOSError=class(Exception);

function NetBiosCheck(const b:char):char;
begin
 if b<>chr(NRC_GOODRET) then raise ENetBIOSError.create('NetBios error'#13#10'Error code '+inttostr(ord(b)));
 result:=b;
end;

function AdapterToString(const Adapter:PAdapterStatus):string;
begin
 with Adapter^ do Result :=Format('%2.2x-%2.2x-%2.2x-%2.2x-%2.2x-%2.2x',[Integer(adapter_address[0]),Integer(adapter_address[1]),Integer(adapter_address[2]), Integer(adapter_address[3]),Integer(adapter_address[4]), Integer(adapter_address[5])]);
end;

procedure MachineNameToAdapter(Name:string;var AdapterName:array of char);
begin
 if Name='' then Name:='*' else Name:=ansiuppercase(Name);
 Name:=Name+StringOfChar(' ',length(AdapterName)-Length(Name));
 move(Name[1],AdapterName[0],length(AdapterName));
end;

function GetMACAdresses(const Adresses:TStringList;const MachineName:string=''):integer;
var i:integer;
    NCB: PNCB;
    Adapter:PAdapterStatus;
    Lenum:PLanaEnum;
    RetCode:char;
begin
 Adresses.clear;

 New(NCB);
 New(Adapter);
 New(Lenum);
 try
  Fillchar(NCB^,SizeOf(TNCB),0);
  fillchar(Lenum^,SizeOf(TLanaEnum),0);
  NCB.ncb_command:=chr(NCBENUM);
  NCB.ncb_buffer:=Pointer(Lenum);
  NCB.ncb_length:=SizeOf(Lenum);
  NetBiosCheck(Netbios(NCB));
  result:=ord(Lenum.Length);

  for i:=0 to result-1 do
  begin
   Fillchar(NCB^,SizeOf(TNCB),0);
   Ncb.ncb_command:=chr(NCBRESET);
   Ncb.ncb_lana_num:=lenum.lana[i];
   NetBiosCheck(Netbios(Ncb));

   FillChar(NCB^,SizeOf(TNCB),0);
   FillChar(Adapter^,SizeOf(TAdapterStatus),0);

   Ncb.ncb_command:=chr(NCBASTAT);
   Ncb.ncb_lana_num:=lenum.lana[i];
   MachineNameToAdapter(MachineName,Ncb.ncb_callname);
   Ncb.ncb_buffer:=Pointer(Adapter);
   Ncb.ncb_length:=SizeOf(TAdapterStatus);
   RetCode:=Netbios(NCB);
   if RetCode in [chr(NRC_GOODRET),chr(NRC_INCOMP)] then Adresses.add(AdapterToString(Adapter));
  end;
 finally
  Dispose(NCB);
  Dispose(Adapter);
  Dispose(Lenum);
 end;
end;

function GetMACAdress(const MachineName:string=''):string;
var stringlist:tstringlist;
begin
 stringlist:=tstringlist.create;
 try
  if GetMACAdresses(stringlist,MachineName)=0 then result:='' else result:=stringlist[0];
 finally
  stringlist.destroy;
 end;
end;

end.
