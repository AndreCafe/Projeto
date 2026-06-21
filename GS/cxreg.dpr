program cxreg;

uses
  Forms,
  SysUtils,
  uFrmRegistro in 'uFrmRegistro.pas' {FrmRegistro},
  uLicenca in 'uLicenca.pas',
  uScsi in 'uScsi.pas',
  ucxregPri in 'ucxregPri.pas' {FrmPri},
  uCXRegDMServ in 'uCXRegDMServ.pas' {dmServ: TDataModule},
  uCXRegDMCli in 'uCXRegDMCli.pas' {dmCli: TDataModule};

{$R *.res}

var
  Oper : Byte;
  EServ: Boolean;
  S, param1: String;

const
  opClient   = 0;
  opServer   = 1;  

procedure GravaArq;
var A: TextFile;
begin
  Assign(A, 'c:\cxregres.txt');
  Rewrite(A);
  if LicencaGlobal.SenhaOk then begin
    Writeln(A, 'S');
    Writeln(A, LicencaGlobal.CodLojaAsString);
    Writeln(A, LicencaGlobal.liSerialHD);
  end else
    Writeln(A, 'N');  
  Close(A);  
end;

begin
  Application.Initialize;
  Application.Title := 'Registro Control-X';
  param1 := ParamStr(1);

  EServ := SameText('C:', Copy(ParamStr(0), 1, 2));
  

  if (not SameText('checareg', param1)) and EServ then 
    Oper := opServer
  else
    Oper := opClient;
      
  if Oper=opClient then begin
    if EServ then begin 
      LicencaGlobal.LeArquivoPadrao;
      if not FileExists(pathlic+LicArq) then
        LicencaGlobal.SalvaArquivoPadrao;  
      LicencaGlobal.LeSerialHD;
    end;  
    
    dmCli := TdmCli.Create(nil);
    try
      S := dmCli.ObtemLicenca;
      if (S<>'') or (not EServ) then
        LicencaGlobal.AsString := S;
    finally
      dmCli.Free;
    end;
    GravaArq;  
  end else begin
    LicencaGlobal.LeArquivoPadrao;
    if not FileExists(pathlic+LicArq) then
      LicencaGlobal.SalvaArquivoPadrao;  
    LicencaGlobal.LeSerialHD;
    Application.CreateForm(TFrmPri, FrmPri);
    Application.CreateForm(TdmServ, dmServ);
  end;  
  Application.Run;
end.
