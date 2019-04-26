unit uImpDBF_LanManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nx1xAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, Dbf;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    nxSE: TnxServerEngine;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliNasc: TDateTimeField;
    tCliSexo: TStringField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliMinutos: TFloatField;
    tCliMinutosUsados: TFloatField;
    tCliMinutosIniciais: TFloatField;
    tCliIsento: TBooleanField;
    tCliUsername: TStringField;
    tCliPai: TStringField;
    tCliMae: TStringField;
    tCliSenha: TStringField;
    tCliUltVisita: TDateTimeField;
    tCliDebito: TCurrencyField;
    tCliEscola: TStringField;
    tCliEscolaHI: TDateTimeField;
    tCliEscolaHF: TDateTimeField;
    tCliNickName: TStringField;
    tCliDataNasc: TDateTimeField;
    tCliCelular: TStringField;
    tCliTemDebito: TBooleanField;
    tCliLimiteDebito: TCurrencyField;
    tCliFoto: TGraphicField;
    tCliIncluidoEm: TDateTimeField;
    tCliAlteradoEm: TDateTimeField;
    tCliIncluidoPor: TStringField;
    tCliAlteradoPor: TStringField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliValorCred: TCurrencyField;
    PB: TProgressBar;
    Button1: TButton;
    tF: TDbf;
    DBGrid1: TDBGrid;
    DS: TDataSource;
    tCliObs: TMemoField;
    tCliEmail: TMemoField;
    tCliPassaportes: TFloatField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    tFCOD: TFloatField;
    tFINCLUSAO: TDateField;
    tFNOME: TStringField;
    tFNASCIMENTO: TDateField;
    tFNACIONALID: TStringField;
    tFNATURALIDA: TStringField;
    tFPROFISSAO: TStringField;
    tFRG: TStringField;
    tFCPF: TStringField;
    tFENDERECO: TStringField;
    tFBAIRRO: TStringField;
    tFCEP: TStringField;
    tFTELEFONE: TStringField;
    tFCIDADE: TStringField;
    tFUF: TStringField;
    tFENDCOM: TStringField;
    tFBAIRROCOM: TStringField;
    tFCEPCOM: TStringField;
    tFCIDCOM: TStringField;
    tFTELCOM: TStringField;
    tFUFCOM: TStringField;
    tFLIBERADO: TBooleanField;
    tFLOGADO: TBooleanField;
    tFINICIO: TDateField;
    tFHORA: TDateField;
    tFESTIMADO: TFloatField;
    tFJOGADAS: TFloatField;
    tFGRATIS: TFloatField;
    tFSENHA: TStringField;
    tFDESCR: TStringField;
    tFMAIL: TStringField;
    tFICQ: TStringField;
    tFVISITA: TDateField;
    tFNICK: TStringField;
    tFSENSIBILID: TFloatField;
    tFFRENTE: TStringField;
    tFTRAS: TStringField;
    tFDIREITA: TStringField;
    tFESQUERDA: TStringField;
    tFGIRARDIREI: TStringField;
    tFGIRARESQUE: TStringField;
    tFAGACHAR: TStringField;
    tFLENTO: TStringField;
    tFPULAR: TStringField;
    tFATIRAR: TStringField;
    tFZOMM: TStringField;
    tFTROCA: TStringField;
    tFARMA1: TStringField;
    tFARMA2: TStringField;
    tFARMA3: TStringField;
    tFARMA4: TStringField;
    tFARMA5: TStringField;
    tFRECARREGAR: TStringField;
    tFITENS: TStringField;
    tFLANTERNA: TStringField;
    tFSPRAY: TStringField;
    tFCHAT1: TStringField;
    tFCHAT2: TStringField;
    tFPRIVILEGIO: TFloatField;
    tFFUNCIONARI: TFloatField;
    tFLOGOF: TBooleanField;
    tFDATAOF: TDateField;
    tFHORAOF: TDateField;
    tFBLOQUEADO: TBooleanField;
    tFMOTIVO: TMemoField;
    tFFUNC2: TFloatField;
    tFMODOACESSO: TFloatField;
    tFHORASPRE: TFloatField;
    tFFECHAAUTO: TBooleanField;
    tFVIP: TBooleanField;
    tFLIMITE: TFloatField;
    tFFUNC: TStringField;
    tFPACOTE: TBooleanField;
    tFIDPACOTE: TFloatField;
    tFADMINISTRA: TBooleanField;
    tFALTERADO: TBooleanField;
    tFUSANDOPRE: TBooleanField;
    tFID_TARIFA: TFloatField;
    tFLIBERADOPO: TBooleanField;
    tFCONVENIO: TFloatField;
    tFAVISADO: TBooleanField;
    tFSEMPRELOGA: TBooleanField;
    tFMASCULINO: TBooleanField;
    tFLOGIN: TStringField;
    tFGRUPOTARIF: TFloatField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I: Integer;
  S: String;

function ProxCampo: String;
var P: Integer;
begin
  P := Pos(';', S);
  if P>0 then begin
    Result := Trim(Copy(S, 1, P-1));
    Delete(S, 1, P);
  end else begin
    Result := Trim(S);
    S := '';
  end;  
  if Copy(Result, 1, 1)='"' then
    Delete(Result, 1, 1);
  if Copy(Result, Length(Result), 1)='"' then
    Delete(Result, Length(Result), 1);
end;  

begin
  tF.Open;
  SL := TStringList.Create;
  PB.Max := tF.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
  while not tF.Eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliNome.Value := tFNome.Value;
    tCliUsername.Value := TFLogin.Value;
    tCliDataNAsc.Value := TFNascimento.Value;
    tCliIncluidoEm.Value := TFInclusao.Value;
    tCliInativo.Value := False;
    tCliIsento.Value := False;
    tCliIncluidoPor.Value := 'admin';
    tCli.Post;
    tF.Next;
  end;
end;

end.
