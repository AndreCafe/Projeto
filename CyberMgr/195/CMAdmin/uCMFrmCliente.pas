unit uCMFrmCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxCntner, dxEditor, dxEdLib, dxDBELib, OvcBase, OvcRLbl, OvcPLb,
  dxExEdtr, dxDBEdtr, dxBar, StdCtrls, OvcEditF, OvcEdPop, OvcEdCal,
  OvcDbDat, DBCtrls, OvcPB, OvcPF, OvcDbPF, OvcEF, OvcSF, OvcDbSF, ExtCtrls,
  lmdcctrl, lmdctrl, lmdeditb, lmdeditc, Lmddbedit, dxTL, dxDBCtrl,
  dxDBGrid, ComCtrls, Db, kbmMemTable, ToolWin, nxdb, OvcNF, OvcDbNF,
  uCMFrmPri, 
  uCMfbgTran,
  uCMfbgPassaportes,
  dxBarExtItems, 
  lmdbtn, lmdstdcS, dxDBTLCl, dxGrClms, Mask, dxInspRw, dxDBInRw, dxInspct,
  dxDBInsp, dxLayout, dxInRwEx, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, uCMFrmAguarde, LMDFormDisplay,
  dxPageControl;

type
  TFrmCliente = class(TForm)
    BarMgr: TdxBarManager;
    tCli: TnxTable;
    dsCli: TDataSource;
    GridLayouts: TdxDBGridLayoutList;
    layoutCidade: TdxDBGridLayout;
    LMDSimplePanel5: TLMDSimplePanel;
    cmHistorico: TdxBarButton;
    Timer1: TTimer;
    tCliCodigo: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliNasc: TDateTimeField;
    tCliSexo: TStringField;
    tCliObs: TMemoField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliemail: TMemoField;
    tCliCreditoM: TIntegerField;
    tCliIsento: TBooleanField;
    tCliUsername: TStringField;
    tCliSenha: TStringField;
    tCliTelefone: TStringField;
    tCliTempoTotal: TIntegerField;
    OvcController1: TOvcController;
    tCliTempoInicial: TIntegerField;
    tCliUltVisita: TDateTimeField;
    tAux: TnxTable;
    tCliDebito: TCurrencyField;
    tCliEscola: TStringField;
    tCliNickName: TStringField;
    tCliDataNasc: TDateTimeField;
    tCliCelular: TStringField;
    Paginas: TdxPageControl;
    tsNome: TdxTabSheet;
    tsEndereco: TdxTabSheet;
    tsTran: TdxTabSheet;
    InspNome: TdxDBInspector;
    InspNomeNome: TdxInspectorDBMaskRow;
    InspNomeObs: TdxInspectorDBMemoRow;
    InspNomeUsername: TdxInspectorDBRow;
    InspNomeSenha: TdxInspectorDBRow;
    InspNomeTelefone: TdxInspectorDBRow;
    InspNomeRow7: TdxInspectorDBMemoRow;
    InspNomeIsento: TdxInspectorDBPickRow;
    InspNomeRow8: TdxInspectorDBRow;
    InspNomeNickname: TdxInspectorDBRow;
    InspNomeNasc: TdxInspectorDBDateRow;
    InspNomeCel: TdxInspectorDBRow;
    LMDSimplePanel9: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    edHoras: TOvcPictureField;
    edMin: TOvcPictureField;
    InspRes: TdxDBInspector;
    InspResBairro: TdxInspectorDBMaskRow;
    InspResCEP: TdxInspectorDBMaskRow;
    InspResEndereco: TdxInspectorDBMaskRow;
    InspResUF: TdxInspectorDBPickRow;
    InspResCidade: TdxInspectorDBRow;
    InspResRow6: TdxInspectorDBRow;
    fdAcessos: TLMDFormDisplay;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    tsPass: TdxTabSheet;
    fdPass: TLMDFormDisplay;
    InspCod: TdxInspectorDBRow;
    tCliTemDebito: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    InspNomeTA: TdxInspectorDBImageRow;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmHistoricoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tCliBeforePost(DataSet: TDataSet);
    procedure tCliAfterInsert(DataSet: TDataSet);
    procedure tCliAfterEdit(DataSet: TDataSet);

    { Private declarations }
  public
    Nome, Empresa, Apelido: String;
    Resultado: Integer;
    FLog: TfbgTran;
    FPass: TfbgPassaportes;
    FAguarde : TFrmAguarde;
    FRgAnt : String;
    FUsername : String;
    TI : Cardinal;
    function Novo: Integer;
    procedure Editar(Codigo: Integer);
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

uses 
  uCMFrmConfig, 
  uCMDados,
  cmClassesBase,
  cmIDRecursos,
  cmListaID,
  uCMFrmCredito;

{$R *.DFM}

procedure TFrmCliente.Editar(Codigo: Integer);
begin
  try
    if not tCli.FindKey([Codigo]) then Exit;
    tCli.Edit;
    FUsername := tCliUsername.Value;
    if tCliIsento.IsNull then
      tCliIsento.Value := False;

    TI := tCliTempoInicial.Value;
    
    edHoras.AsInteger := TI div (60 * 60);
    TI := TI mod (60 * 60);
    edMin.AsInteger := TI div 60;
    
    cmHistorico.Visible := ivAlways;
    cmGravar.Enabled := Permitido(daCliCadastrar);
    
    ShowModal;
  finally
    Free;
  end;  
end;

procedure TFrmCliente.cmGravarClick(Sender: TObject);
var Gravar : Boolean;
begin
  PostInspectors(Self);
  with tCli do begin
    Paginas.ActivePageIndex := 0;
    edHoras.SetFocus;
    Application.ProcessMessages;
    if (FUsername <> tCliUsername.Value) and
       (tCliUsername.Value <> '') and
       Dados.tbCli.Locate('Username', tCliUsername.Value, [loCaseInsensitive]) then
    begin
      Beep;
      ShowMessage('Já existe outro cliente cadastrado com esse mesmo Username!');
      Exit;
    end;   

    Gravar := (State = dsEdit) or (State=dsInsert);
    if State in [dsEdit, dsInsert] then begin
      if Gravar then begin
        TI := (edHoras.AsInteger * (60 * 60)) +
              (edMin.AsInteger * 60);
        tCliTempoTotal.Value := tCliTempoTotal.Value - 
                                tCliTempoInicial.Value + TI; 
        tCliTempoInicial.Value := TI;      
        if tCliCreditoM.Value<0 then 
          tCliCreditoM.Value := ObtemCred(tCliCreditoM.Value);                  
        Post;
        Dados.tbCli.Refresh;
      end else
        Cancel;
    end;    
    if Gravar then 
      Resultado := FieldByName('Codigo').AsInteger;
  end;
  Close;
end;

procedure TFrmCliente.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tCli.Cancel;
  Action := caFree;
end;

procedure TFrmCliente.FormCreate(Sender: TObject);
begin
  TI := 0;
  FrmCliente := Self;
  tCli.Open;
  tAux.Open;
  Paginas.ActivePageIndex:= 0;
  FLog := nil;
  FPass := nil;
  tsTran.TabVisible := False;
  tsPass.TabVisible := False;
  
  InspNomeTA.Values.Clear;
  InspNomeTA.ImageIndexes.Clear;
  InspNomeTA.Descriptions.Clear;
  InspNomeTA.Values.Add('-1');
  InspNomeTA.ImageIndexes.Add('-1');
  InspNomeTA.Descriptions.Add('Livre');

  with Dados do begin
    if tbTipoAcesso.RecordCount<2 then 
      InspNomeTA.Visible := False;

    tbTipoAcesso.First;
    while not tbTipoAcesso.Eof do begin
      InspNomeTA.Values.Add(tbTipoAcessoCodigo.AsString);
      InspNomeTA.ImageIndexes.Add(tbTipoAcessoCodigo.AsString);
      InspNomeTA.Descriptions.Add(tbTipoAcessoNome.Value);
      tbTipoAcesso.Next;
    end;
  end;
  
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  Nome := tCliNome.Value;
  Paginas.ActivePage := tsEndereco;
  Paginas.ActivePage := tsNome;
  tsNome.Refresh;
  InspNome.SetFocus;
  InspNome.FocusedField := tCliObs;
  InspNome.FocusedField := tCliNome;
  InspNomeIsento.ReadOnly := not Permitido(daCliMarcarIsento);
  Paginas.ActivePage:= TsNome;
end;

function TFrmCliente.Novo: Integer;
begin
  FUsername := '';
  tCli.Append;
  tCliIsento.Value := False;
  Resultado := -1;
  try
    ShowModal;
  finally
    Result := Resultado;
    Free;
  end;  
end;

procedure TFrmCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmCliente.cmHistoricoClick(Sender: TObject);
begin
  cmHistorico.Visible := ivNever;
  Timer1.Enabled := True;
  FrmAguarde := TFrmAguarde.Create(Self);
  FrmAguarde.PB.Max := 2;
  FrmAguarde.Show;
end;

procedure TFrmCliente.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  try
    FrmAguarde.PB.Position := 1;
    FrmAguarde.lbModulo.Caption := 'Montando Lista de Transações ...';
    tsTran.TabVisible := True;
    Application.ProcessMessages;
    FLog := TfbgTran.Create(Self);
    FLog.Inicializar(True, FiltroCliente, tCli.FieldByName('Codigo').AsInteger);
    fdAcessos.AddForm(FLog, True);
    Application.ProcessMessages;

    FrmAguarde.PB.Position := 2;
    FrmAguarde.lbModulo.Caption := 'Montando Lista de Passaportes ...';
    tsPass.TabVisible := True;
    Application.ProcessMessages;
    FPass := TfbgPassaportes.Create(Self);
    FPass.Inicializar(True, 1, tCli.FieldByName('Codigo').AsInteger);
    fdPass.AddForm(FPass, True);
    Application.ProcessMessages;

    Paginas.ActivePage := tsTran;
  finally
    FrmAguarde.Free;
  end;    
end;

procedure TFrmCliente.tCliBeforePost(DataSet: TDataSet);
begin
  if tCliNome.Value = '' then
    Raise Exception.Create('Nome não pode ser deixado em branco !');

  if (FRgAnt<>tCliRg.Value) and (tCliRg.AsString>'') and tAux.FindKey([tCliRG.Value]) then
    Raise Exception.Create('Já existe um cliente cadastrado com esse RG');
  
end;

procedure TFrmCliente.tCliAfterInsert(DataSet: TDataSet);
begin
  FRgAnt := '';
  tCliTipoAcessoPref.Value := -1;
end;

procedure TFrmCliente.tCliAfterEdit(DataSet: TDataSet);
begin
  FRgAnt := tCliRG.Value;
end;

end.
