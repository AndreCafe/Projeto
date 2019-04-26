unit uFrmConsultaBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, LMDPNGImage, ExtCtrls, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, kbmMemTable, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxBar,
  cxImageComboBox, cxMaskEdit, ImgList, uRSAss;

type
  TFrmConsultaBol = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    LMDSimplePanel2: TLMDSimplePanel;
    btnTodos: TcxButton;
    btnEmAberto: TcxButton;
    lbConta: TcxLabel;
    edSenha: TcxTextEdit;
    lbEsqueci: TcxLabel;
    lbSenha: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    BarMgr: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BarMgrBar1: TdxBar;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    MT: TkbmMemTable;
    MTID: TIntegerField;
    MTSituacao: TIntegerField;
    MTValor: TCurrencyField;
    MTDescr: TStringField;
    cxButton2: TcxButton;
    DS: TDataSource;
    TVValor: TcxGridDBColumn;
    TVSituacao: TcxGridDBColumn;
    TVAssinatura: TcxGridDBColumn;
    TVCompradoEm: TcxGridDBColumn;
    TVPagoEm: TcxGridDBColumn;
    MTPagamento: TDateTimeField;
    lbLista: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxImageList1: TcxImageList;
    MTLancamento: TDateTimeField;
    TVPedido: TcxGridDBColumn;
    cmVer: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEmAbertoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cmVerClick(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TVValorCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    FBoletos : TArrayBoleto;
    { Private declarations }
  public
    procedure AjustaBtn;
    procedure AjustaVis(Ativar: Boolean);
    { Public declarations }
  end;

var
  FrmConsultaBol: TFrmConsultaBol;

implementation

uses ncServAtualizaLic, uDMBol, uLicEXECryptor;

{$R *.dfm}

const
  sbEmAberto  = 0;
  sbPago      = 1;
  sbCancelado = 2;

procedure TFrmConsultaBol.AjustaBtn;
begin
  cmCancelar.Enabled := (not MT.IsEmpty) and (MTSituacao.Value=sbEmAberto);
end;

procedure TFrmConsultaBol.AjustaVis(Ativar: Boolean);
begin
  if not Ativar then
    MT.EmptyTable;
    
  if Ativar then
    cxStyle1.TextColor := clBlack else
    cxStyle1.TextColor := clGray;

  cmVer.Enabled := Ativar;
  AjustaBtn;
  lbLista.Enabled := Ativar;  
end;

procedure TFrmConsultaBol.btnEmAbertoClick(Sender: TObject);
var 
  dmLic: TdmAtualizaLic;
  I : Integer;
begin
  AjustaVis(False);
  dmLic := TdmAtualizaLic.Create(Self);
  try
    dmLic.ObtemBoletos(lbConta.Caption, edSenha.Text, (Sender=btnEmAberto), DadosEmissao, FBoletos);

    if (Sender=btnEmAberto) then
      lbLista.Caption := 'Boletos em Aberto' else
      lbLista.Caption := 'Todos Boletos';

    AjustaVis(True);
    edSenha.Enabled := False;
    lbSenha.Enabled := False;
    lbEsqueci.Enabled := False;
    TVPagoEm.Visible := False;
    
    MT.DisableControls;
    try
      for I := 0 to High(FBoletos) do with FBoletos[I] do 
      begin
        MT.Append;
        MTLancamento.Value := dbLanc;
        MTID.Value := dbNum;
        if (dbCanceladoEm=0) and (dbPagoEm>0) then begin
          MTPagamento.Value := dbPagoEm;
          TVPagoEm.Visible := True;
        end;
        MTDescr.Value := dbDescr;
        MTValor.Value := dbValor;
        if dbCanceladoEm>0 then
          MTSituacao.Value := sbCancelado 
        else
        if dbBaixou then
          MTSituacao.Value := sbPago
        else
          MTSituacao.Value := sbEmAberto;
        MT.Post;
      end;
      MT.First;
      AjustaBtn;
    finally
      MT.EnableControls;
    end;
  finally
    dmLic.Free;
  end;
end;

function SimNaoH(S: String; H : HWND): Boolean;
begin
  Result := (MessageBox(H, PChar(S), 'Atenção',
             MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL + MB_DEFBUTTON2) = IDYES)
end;                


procedure TFrmConsultaBol.cmCancelarClick(Sender: TObject);
var 
  dmLic: TdmAtualizaLic;
  I, C : Integer;
  D : TDateTime;
begin
  if MTSituacao.Value<>sbEmAberto then begin
    Beep;
    ShowMessage('Só possível cancelar a compra de boletos que ainda não foram pagos');
    Exit;
  end;
  if not SimNaoH('Deseja realmente cancelar essa compra?', Handle) then Exit;
    
  dmLic := TdmAtualizaLic.Create(Self);
  try
    D := dmLic.CancelaBoleto(lbConta.Caption, edSenha.Text, MTID.Value);
    MT.Edit;
    MTSituacao.Value := sbCancelado;
    MT.Post;

    C := 0;

    for I := 0 to High(FBoletos) do begin
      if FBoletos[I].dbNum = MTID.Value then begin
        FBoletos[I].dbCanceladoEm := D;
        FBoletos[I].dbBaixou := True;
        Exit;
      end;
      if not FBoletos[I].dbBaixou then
        Inc(C);
    end;
    RegistroGlobal.BoletosPendentes := C;
    RegistroGlobal.SalvaArqPadrao;
  finally
    dmLic.Free;
  end;
end;

procedure TFrmConsultaBol.cmVerClick(Sender: TObject);
var I : Integer;
begin
  for I := 0 to High(FBoletos) do
    if FBoletos[I].dbNum = MTID.Value then begin
      dmBol.Atualiza(FBoletos[I]);
      dmBol.Mostra(False);
      Exit;
    end;
end;

procedure TFrmConsultaBol.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsultaBol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConsultaBol.FormCreate(Sender: TObject);
begin
  SetLength(FBoletos, 0);
  lbConta.Caption := RegistroGlobal.Conta;
end;

procedure TFrmConsultaBol.TVDblClick(Sender: TObject);
begin
  if not MT.IsEmpty then
    cmVer.Click;
end;

procedure TFrmConsultaBol.TVFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  AjustaBtn;
end;

procedure TFrmConsultaBol.TVValorCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant;
begin
  V := AViewInfo.GridRecord.Values[tvSituacao.Index];
  if (V<>null) and (V=sbCancelado) then
    ACanvas.Font.Style := [fsStrikeOut];
end;

end.
