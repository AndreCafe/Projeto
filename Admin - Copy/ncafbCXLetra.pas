unit ncafbCXLetra;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxCurrencyEdit, cxTextEdit, cxCalendar, cxMemo, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid,  cxDropDownEdit,
  nxdb, ncClassesBase, 
  dxBarExtItems, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, cxGridCustomPopupMenu, cxGridPopupMenu, cxInplaceContainer,
  cxVGrid, cxDBVGrid, cxImageComboBox, cxTimeEdit, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, ncafbPesqCli,
  cxContainer, cxLabel, Buttons, StdCtrls, cxRadioGroup, Menus,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  kbmMemTable, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  cxLookAndFeels, cxLookAndFeelPainters, uParentedPanel, cxNavigator,
  dxPScxPivotGridLnk;

type
  TfbCXLetra = class(TFrmBase)
    pmTempo: TdxBarPopupMenu;
    pmSenha: TdxBarPopupMenu;
    PopupMenu1: TPopupMenu;
    LMDSimplePanel1: TLMDSimplePanel;
    Timer1: TTimer;
    cmOk: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    LMDSimplePanel2: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVNome: TcxGridDBColumn;
    GL: TcxGridLevel;
    Tab: TkbmMemTable;
    DS: TDataSource;
    TabCampo: TStringField;
    TabCaixa: TWordField;
    TVCaixa: TcxGridDBColumn;
    TabNome: TStringField;
    cmApplyNow: TdxBarButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TVKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmApplyNowClick(Sender: TObject);
  private
    { Private declarations }
    FValues : PString;
    FEditControl : TcxCustomDropDownEdit;

  public
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    procedure ParentChanged; override;

    procedure PreparaBusca(aValues: PString; aFields: TStrings; aEditControl: TcxCustomDropDownEdit);
    
    
    { Public declarations }
  end;

var
  fbCXLetra: TfbCXLetra;
  PesqFrmH : HWND = 0;
  RealActiveFrmH : HWND =0;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncIDRecursos, ncaFrmFornecedor;

// START resource string wizard section
resourcestring
  SDesejaRealmenteContinuarSeHouver = 'Deseja realmente continuar? Se houver campos que deixaram de ter a ';
  SOpçãoLivreDeDigitaçãoNãoHaveráCo = 'opção livre de digitação, não haverá como recuperar o formato';
  SOriginalDosDadosNoFuturo = ' original dos dados no futuro.';
  SUpdateClienteSet = 'Update Cliente set ';
  SDadosPadronizadosComSucesso = 'Dados padronizados com sucesso!';
  SConfiguraçãoMaiúsculaMinúscula = 'Configuração Maiúscula / Minúscula';

// END resource string wizard section


{$R *.dfm}


procedure TfbCXLetra.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  Tab.Open;
end;

procedure TfbCXLetra.FrmBasePaiDestroy(Sender: TObject);
begin
  inherited;
  fbCXLetra := nil;
end;

procedure TfbCXLetra.btnCancelarClick(Sender: TObject);
begin
  inherited;
  FValues := nil;
  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;
end;

procedure TfbCXLetra.btnOKClick(Sender: TObject);
begin
  inherited;
  if Tab.State in [dsEdit] then Tab.Post;

  FValues^ := '';
  Tab.DisableControls;
  try
    Tab.First;
    while not Tab.Eof do begin
      if FValues^>'' then FValues^:=FValues^+sLineBreak;
      FValues^ := FValues^ + TabCampo.Value + '=' + TabCaixa.AsString;
      Tab.Next;
    end;
  finally
    Tab.EnableControls;
  end;
  
  if FEditControl<>nil then begin
    FEditControl.DroppedDown := False;
    FEditControl := nil;
  end;
end;

procedure TfbCXLetra.cmApplyNowClick(Sender: TObject);
var 
  Q: TnxQuery;
  S : String;
begin
  inherited;

  if not SimNao(SDesejaRealmenteContinuarSeHouver+
            SOpçãoLivreDeDigitaçãoNãoHaveráCo+
            SOriginalDosDadosNoFuturo) then Exit;

  Q := TnxQuery.Create(Self);
  try
    Q.Database := Dados.db;
    Q.Timeout := 240000;
    S := '';
    Tab.First;
    while not Tab.Eof do begin
      if TabCaixa.Value <> 0 then
        if S>'' then S := S + ', ';
      case TabCaixa.Value of
        1 : S := S + TabCampo.Value + ' = Upper(' + TabCampo.Value+ ')'; // do not localize
        2 : S := S + TabCampo.Value + ' = Lower(' + TabCampo.Value+ ')'; // do not localize
      end;
      Tab.Next;
    end;
    Q.SQL.Text := SUpdateClienteSet + S;
    Q.ExecSQL;

    ShowMessage(SDadosPadronizadosComSucesso);
  finally
    Q.Free;
  end;

end;

class function TfbCXLetra.Descricao: String;
begin
  Result := SConfiguraçãoMaiúsculaMinúscula;
end;

procedure TfbCXLetra.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : Tab.Prior;
    VK_Down : Tab.Next;
    VK_Return : btnOkClick(nil);
    VK_Escape : btnCancelarClick(nil);
  end;
end;

procedure TfbCXLetra.TVKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    13 : btnOkClick(nil);
    27 : btnCancelarClick(nil);
  end;
end;

procedure TfbCXLetra.AtualizaDireitos;
begin
end;

procedure TfbCXLetra.ParentChanged;
begin
end;

procedure TfbCXLetra.PreparaBusca(aValues: PString; aFields: TStrings;
  aEditControl: TcxCustomDropDownEdit);
var 
  SL : TStrings; I, P : Integer;
begin
  RealActiveFrmH := Application.ActiveFormHandle;
  FValues := aValues;
  FEditControl := aEditControl;
  Tab.DisableControls;
  SL := TStringList.Create;
  try
    SL.Text := aValues^;
    Tab.EmptyTable;
    for I := 0 to aFields.Count-1 do begin
      Tab.Append;
      TabCampo.Value := aFields.Names[i];
      TabNome.Value := aFields.ValueFromIndex[i];
      P := StrToIntDef(SL.Values[TabCampo.Value], 0);
      if not P in [0..2] then P := 0;
      TabCaixa.Value := P;
      Tab.Post;
    end;
  finally
    SL.Free;
    Tab.EnableControls;
  end;
end;

end.

