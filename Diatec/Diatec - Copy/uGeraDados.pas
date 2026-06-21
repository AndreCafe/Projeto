unit uGeraDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcPF, OvcBase, OvcEF, OvcPB, OvcNF, StdCtrls, ComCtrls, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxsdServerEngine,
  nxreRemoteServerEngine, Db, nxdb, nxllComponent;

type
  TForm1 = class(TForm)
    Button1: TButton;
    PB: TProgressBar;
    edProj: TEdit;
    Label1: TLabel;
    edCliI: TOvcNumericField;
    OvcController1: TOvcController;
    Cliente: TLabel;
    Label3: TLabel;
    edCliF: TOvcNumericField;
    Label4: TLabel;
    edData: TOvcPictureField;
    Label5: TLabel;
    Label2: TLabel;
    edFase: TEdit;
    edHoraI: TOvcPictureField;
    edHoraF: TOvcPictureField;
    Label6: TLabel;
    Label7: TLabel;
    Session: TnxSession;
    DB: TnxDatabase;
    tOS: TnxTable;
    RSE: TnxRemoteServerEngine;
    Transp: TnxWinsockTransport;
    tOSFase: TnxTable;
    tOSCliente: TStringField;
    tOSProjeto: TStringField;
    tOSTecnico: TStringField;
    tOSData: TDateTimeField;
    tOSID: TWordField;
    tOSInicio: TDateTimeField;
    tOSTermino: TDateTimeField;
    tOSTranslado: TDateTimeField;
    tOSAbono: TDateTimeField;
    tOSMotivoAbon: TStringField;
    tOSSync: TBooleanField;
    tOSAssinou: TStringField;
    tOSLocal: TStringField;
    tOSEntrou: TStringField;
    tOSDataComp: TDateTimeField;
    tOSNumAtend: TStringField;
    tOSLogID: TIntegerField;
    tOSDownOk: TBooleanField;
    tOSGeraReemb: TBooleanField;
    tOSTipoReemb: TStringField;
    tOSOutroLocal: TStringField;
    tOSKmDestino: TFloatField;
    tOSPedagio1: TFloatField;
    tOSPedagio2: TFloatField;
    tOSPedagio3: TFloatField;
    tOSPedagio4: TFloatField;
    tOSMotivo: TStringField;
    tOSFaseCliente: TStringField;
    tOSFaseProjeto: TStringField;
    tOSFaseData: TDateTimeField;
    tOSFaseOS: TSmallintField;
    tOSFaseItem: TIntegerField;
    tOSFaseFase: TStringField;
    tOSFaseTecnico: TStringField;
    tOSFaseHoras: TDateTimeField;
    tOSFaseSync: TBooleanField;
    tOSFaseTipoHora: TStringField;
    tOSFaseOcorrencia: TStringField;
    tOSFaseRevisao: TStringField;
    tOSFaseLogID: TIntegerField;
    tOSFaseDownOk: TBooleanField;
    tOSFaseDesc: TnxTable;
    tOSFaseDescCliente: TStringField;
    tOSFaseDescProjeto: TStringField;
    tOSFaseDescFase: TStringField;
    tOSFaseDescTecnico: TStringField;
    tOSFaseDescItem: TIntegerField;
    tOSFaseDescPos: TWordField;
    tOSFaseDescTexto: TStringField;
    tOSFaseDescSync: TBooleanField;
    tOSFaseDescData: TDateTimeField;
    tOSFaseDescOS: TSmallintField;
    tOSFaseDescLogID: TIntegerField;
    tOSFaseDescDownOk: TBooleanField;
    edTec: TEdit;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var I : Integer;

procedure GeraRegistros;
var P : Integer;
begin
  Label8.Caption := IntToStr(i);
  tOS.Insert;
  tOSID.Value := StrToIntDef(FormatDateTime('hhmm', edHoraI.AsDateTime), 0);
  tOSData.Value := edData.AsDateTime;
  tOSInicio.Value := edHoraI.AsDateTime;
  tOSTermino.Value := edHoraF.AsDateTime;
  tOSCliente.Value := IntToStr(I);
  tOSProjeto.Value := edProj.Text;
  tOSTecnico.Value := edTec.Text;
  tOSSync.Value:= True;
  tOSAssinou.Value := 'JOAO-TESTE';
  tOSLocal.Value := 'C';
  tOSEntrou.Value := 'N';
  tOSDownOk.Value := False;
  tOSGeraReemb.Value := True;
  tOSTipoReemb.Value := '1';
  tOS.Post;

  tOSFase.Insert;
  tOSFaseCliente.Value := IntToStr(I);
  tOSFaseProjeto.Value := edProj.Text;
  tOSFaseTecnico.Value := edTec.Text;
  tOSFaseFase.Value := edFase.Text;
  tOSFaseData.Value := edData.AsDateTime;
  tOSFaseItem.Value := 1;
  tOSFaseHoras.Value := edHoraF.AsDateTime - edHoraI.AsDateTime;
  tOSFaseSync.Value := True;
  tOSFaseTipoHora.Value := '05.0067';
  tOSFaseOS.Value := tOSID.Value;
  tOSFaseDownOK.Value := False;
  tOSFaseRevisao.Value := '01';
  tOSFase.Post;

  for P := 1 to 5 do begin
    tOSFaseDesc.Insert;
    tOSFaseDescCliente.Value := IntToStr(I);
    tOSFaseDescProjeto.Value := edProj.Text;
    tOSFaseDescTecnico.Value := edTec.Text;
    tOSFaseDescData.Value := edData.AsDateTime;
    tOSFaseDescItem.Value := 1;
    tOSFaseDescPos.Value := P-1;
    tOSFaseDescFase.Value := edFase.Text;
    tOSFaseDescTexto.Value := 'TEXTO LINHA '+IntToStr(P)+' - CLI '+IntToStr(I);
    tOSFaseDescOS.Value := tOSID.Value;
    tOSFaseDescSync.Value := True;
    tOSFaseDescDownOK.Value := False;
    tOSFaseDesc.Post;
  end;
end;

begin
  Button1.Enabled := False;
  PB.Max := edCliF.AsInteger;
  PB.Min := edCliI.AsInteger;
  PB.Position := PB.Min;
  try
    try
      for I := edCliI.AsInteger to edCliF.AsInteger do begin
        if not DB.InTransaction then
          DB.StartTransactionWith([tOS, tOSFase, tOSFaseDesc]);
        GeraRegistros;
        Application.ProcessMessages;
        if (I mod 200)=0 then
          DB.Commit;
        PB.Position := I;
      end;
      if DB.InTransaction then
        DB.Commit;
    except
      DB.Rollback;
      Raise;
    end;
    if DB.InTransaction then DB.Commit;
  finally
    Button1.Enabled := True;
  end;
end;

end.
