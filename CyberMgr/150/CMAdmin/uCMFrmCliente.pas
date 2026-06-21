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
  uCMfbgAcessos,
  uCMfbgPedidos,
  dxBarExtItems, 
  lmdbtn, lmdstdcS, dxDBTLCl, dxGrClms, Mask, dxInspRw, dxDBInRw, dxInspct,
  dxDBInsp, dxLayout, dxInRwEx, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, uCMFrmAguarde, LMDFormDisplay;

type
  TFrmCliente = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    Paginas: TPageControl;
    tsNome: TTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    tsResidencia: TTabSheet;
    LMDSimplePanel2: TLMDSimplePanel;
    Image2: TImage;
    Label22: TLabel;
    tsPedidos: TTabSheet;
    tsAcessos: TTabSheet;
    tCli: TnxTable;
    dsCli: TDataSource;
    InspRes: TdxDBInspector;
    InspResBairro: TdxInspectorDBMaskRow;
    InspResCEP: TdxInspectorDBMaskRow;
    InspResEndereco: TdxInspectorDBMaskRow;
    InspResUF: TdxInspectorDBPickRow;
    LMDSimplePanel8: TLMDSimplePanel;
    GridLayouts: TdxDBGridLayoutList;
    layoutCidade: TdxDBGridLayout;
    LMDSimplePanel9: TLMDSimplePanel;
    InspNome: TdxDBInspector;
    InspNomeNome: TdxInspectorDBMaskRow;
    InspNomeObs: TdxInspectorDBMemoRow;
    LMDSimplePanel5: TLMDSimplePanel;
    cmHistorico: TdxBarButton;
    Timer1: TTimer;
    InspNomeUsername: TdxInspectorDBRow;
    InspNomeSenha: TdxInspectorDBRow;
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
    InspResCidade: TdxInspectorDBRow;
    InspNomeTelefone: TdxInspectorDBRow;
    InspNomeRow7: TdxInspectorDBMemoRow;
    Label1: TLabel;
    edHoras: TOvcPictureField;
    OvcController1: TOvcController;
    tCliTempoInicial: TIntegerField;
    tCliUltVisita: TDateTimeField;
    Label2: TLabel;
    edMin: TOvcPictureField;
    InspNomeIsento: TdxInspectorDBPickRow;
    fdPedidos: TLMDFormDisplay;
    fdAcessos: TLMDFormDisplay;
    InspNomeRow8: TdxInspectorDBRow;
    tAux: TnxTable;
    tCliDebito: TCurrencyField;
    tCliEscola: TStringField;
    tCliNickName: TStringField;
    InspResRow6: TdxInspectorDBRow;
    InspResRow7: TdxInspectorDBCurrencyRow;
    InspNomeNickname: TdxInspectorDBRow;
    InspNomeRow10: TdxInspectorDBRow;
    tCliDataNasc: TDateTimeField;
    tCliCelular: TStringField;
    InspNomeNasc: TdxInspectorDBDateRow;
    InspNomeCel: TdxInspectorDBRow;
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
    FLog: TfbgAcessos;
    FPed: TfbgPedidos;
    FAguarde : TFrmAguarde;
    FRgAnt : String;
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
  cmListaID, uCMFrmCredito;


{$R *.DFM}

procedure TFrmCliente.Editar(Codigo: Integer);
begin
  try
    if not tCli.FindKey([Codigo]) then Exit;
    tCli.Edit;
    if tCliIsento.IsNull then
      tCliIsento.Value := False;

    TI := tCliTempoInicial.Value;
    
    edHoras.AsInteger := TI div (60 * 60);
    TI := TI mod (60 * 60);
    edMin.AsInteger := TI div 60;
    
    cmHistorico.Visible := ivAlways;
    cmGravar.Enabled := Permitido(reClientes, taCliEditar);
    
    ShowModal;
  finally
    Free;
  end;  
end;

procedure TFrmCliente.cmGravarClick(Sender: TObject);
var Gravar : Boolean;
begin
  with tCli do begin
    Paginas.ActivePageIndex := 0;
    edHoras.SetFocus;
    Application.ProcessMessages;
    
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
  FPed := nil;
  tsPedidos.TabVisible := False;
  tsAcessos.TabVisible := False;
end;

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  Nome := tCliNome.Value;
  Paginas.ActivePage := tsResidencia;
  Paginas.ActivePage := tsNome;
  tsNome.Refresh;
  InspNome.SetFocus;
  InspNome.FocusedField := tCliObs;
  InspNome.FocusedField := tCliNome;
  InspNomeIsento.ReadOnly := not Permitido(reClientes, taCliMarcarIsento);
  Paginas.ActivePage:= TsNome;
end;

function TFrmCliente.Novo: Integer;
begin
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
  FrmAguarde.PB.Max := 0;
  FrmAguarde.Show;
end;

procedure TFrmCliente.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  try
    FrmAguarde.PB.Position := 1;
    FrmAguarde.lbModulo.Caption := 'Montando Lista de Acessos ...';
    tsAcessos.TabVisible := True;
    Application.ProcessMessages;
    FLog := TfbgAcessos.Create(Self);
    FLog.Inicializar(True, FiltroCliente, tCli.FieldByName('Codigo').AsInteger);
    fdAcessos.AddForm(FLog, True);
    Application.ProcessMessages;
    Paginas.ActivePage := tsAcessos;
  
    FrmAguarde.PB.Position := FrmAguarde.PB.Position + 1;
    FrmAguarde.lbModulo.Caption := 'Montando Lista de Pedidos ...';
    tsPedidos.TabVisible := True;
    Application.ProcessMessages;
    FPed := TfbgPedidos.Create(Self);
    FPed.Inicializar(True, FiltroCliente, tCli.FieldByName('Codigo').AsInteger);
    fdPedidos.AddForm(FPed, True);
    Application.ProcessMessages;
  
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
end;

procedure TFrmCliente.tCliAfterEdit(DataSet: TDataSet);
begin
  FRgAnt := tCliRG.Value;
end;

end.
