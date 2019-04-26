unit ncaFrmLabelPopUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFrmBasePai, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxCurrencyEdit, cxTextEdit, cxCalendar, cxMemo, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid,  cxDropDownEdit,
  nxdb, ncClassesBase, dxBarExtItems, cxDBEdit,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxInplaceContainer,
  cxVGrid, cxDBVGrid, cxImageComboBox, cxTimeEdit, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  cxContainer, cxLabel, Buttons, PngSpeedButton, StdCtrls, cxRadioGroup, Menus,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, uParentedPanel, cxNavigator,
  dxPScxPivotGridLnk, uNexTransResourceStrings_PT, ufmFormBase,
  cxPCdxBarPopupMenu, cxPC, cxButtons, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, ncaMethodList,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, ncaFrmConfigPrecoAuto, LMDPNGImage,
  cxImage;

type
  TFrmLabelPopUp = class(TFrmBasePai)
    PopupMenu1: TPopupMenu;
    BarMgr: TdxBarManager;
    cmNovo: TdxBarLargeButton;
    cmEditar: TdxBarLargeButton;
    cmApagar: TdxBarLargeButton;
    cmAtualizar: TdxBarLargeButton;
    cmHoje: TdxBarButton;
    cmEstaSemana: TdxBarButton;
    cmEsteMes: TdxBarButton;
    cmEsteAno: TdxBarButton;
    cmTudo: TdxBarButton;
    cmDigitarPeriodo: TdxBarButton;
    cmLayCustomize: TdxBarButton;
    cmLaySalvar: TdxBarButton;
    cmLayRestaurar: TdxBarButton;
    cmExportar: TdxBarLargeButton;
    cmImprimir: TdxBarLargeButton;
    cmLayout: TdxBarLargeButton;
    cmPeriodo: TdxBarLargeButton;
    cmUltimas24h: TdxBarButton;
    cmCfg: TdxBarLargeButton;
    cmOk: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    container_panBusca: TdxBarControlContainerItem;
    panPri: TParentedPanel;
    Query: TnxQuery;
    dsValores: TDataSource;
    lbCusto: TcxLabel;
    edCusto: TcxCurrencyEdit;
    edMargemDeLucro: TcxCurrencyEdit;
    lbMargemDeLucro: TcxLabel;
    lbPrecoVenda: TcxLabel;
    edPrecoVenda: TcxCurrencyEdit;
    cbUsarMargemEspecifica: TcxCheckBox;
    cxLabel1: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    rbNaoUsarPadraoDeMargemDeLucro: TcxRadioButton;
    rbUsarPadraoDeMargemDeLucro: TcxRadioButton;
    cbSeguirPadraoDaLoja: TcxCheckBox;
    butOk: TcxButton;
    buCancel: TcxButton;
    sbConfig1: TLMDSpeedButton;
    sbConfig2: TLMDSpeedButton;
    panelMessage: TLMDSimplePanel;
    lbMessage: TcxLabel;
    butCloseMessage: TcxButton;
    imgIndicadorUp: TcxImage;
    imgIndicadorDown: TcxImage;
    imgAtencao: TcxImage;
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure buCancelClick(Sender: TObject);
    procedure butOkClick(Sender: TObject);
    procedure cbUsarMargemEspecificaClick(Sender: TObject);
    procedure cbSeguirPadraoDaLojaClick(Sender: TObject);
    procedure rbUsarPadraoDeMargemDeLucroClick(Sender: TObject);
    procedure FrmBasePaiActivate(Sender: TObject);
    procedure FrmBasePaiDeactivate(Sender: TObject);
    procedure sbConfig2Click(Sender: TObject);
    procedure butCloseMessageClick(Sender: TObject);
    procedure CurrencyEditValueChanged(Sender: TObject);
  private
    fMethodList : TMethodList;
    fIniCustoUnitario : double;
    fIniPreco         : double;
    fIniMargem        : double;
    fIniPrecoAuto     : boolean;
    procedure calcularPreco;
    procedure salvarValores;
    procedure ligarEventos;
    procedure desligarEventos;
    function  calcularPrecoSegundoRegraLocal: double;
    function  checkNullAndZero(aV: variant):integer;
    procedure MessageOnControl(aControl : TControl; aMsg:string; const aMinWidth:integer = 120);
    procedure resetMessageWindow;
    procedure setUsarMargemEspecifica(aValue:boolean; const aForce:boolean=false);
    procedure setSeguirPadraoDaLoja(aValue:boolean; const aForce:boolean=false);
    procedure checkSeguirPadraoDaLoja(aValue:boolean);
    procedure checkUsarMargemEspecifica(aValue:boolean);
    procedure setUsarPadraoDeMargemDeLucro(aValue:boolean);
    procedure SetCusto(aValue:double);
    procedure SetMargemDeLucro(aValue:double);
    procedure SetPrecoVenda(aValue:double);

    { Private declarations }
  protected
    fInicializado : boolean;
    fCxTextEdit : TcxTextEdit;
    fTabelaPrincipal: TDataset;
    fDescricao         : string;
    fCannotDeleteText  : string;
    fCannotEditText    : string;
    fNomeTabelaPrincipal : string;
    fNomeCampoTabelaPrincipal : string;
    fNomeTabelaValores : string;
    fNomeCampoTabelaValores : string;
    procedure fCxTextEditOnClick(Sender: TObject);
    procedure fCxTextEditOnEnter(Sender: TObject);
    procedure fCxTextEditOnKeyUp(Sender: TObject; var Key: Word; Shift:
    TShiftState);
    procedure AtualizaDireitos;
    procedure FiltraDados;
    procedure cancelarEdit;
    procedure confirmouEdit;
    procedure InicializaDados;
    procedure MostrarPopup;
    { Protected declarations }
  public
    procedure Inicializar(acxTextEdit : TcxTextEdit; aTabela:tDataset); virtual;
    { Public declarations }
  end;

var
  FrmLabelPopUp: TFrmLabelPopUp;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncaFrmPass, ncIDRecursos, ncaFrmZerarTempo,
  ncaFrmSenha, ncaFrmCadCli, ncaFrmCadFornecedor,
  ncaFrmProduto, TypInfo;

{$R *.dfm}

procedure TFrmLabelPopUp.FrmBasePaiCreate(Sender: TObject);
begin
    inherited;
    fInicializado := False;
    fMethodList := TMethodList.create;
    desligarEventos;
end;

procedure TFrmLabelPopUp.FrmBasePaiDestroy(Sender: TObject);
begin
   fMethodList.Free;
   inherited;
end;

procedure TFrmLabelPopUp.desligarEventos;
begin
    OnActivate       := nil;
    OnCreate         := nil;
    OnDestroy        := nil;
    OnDeactivate     := nil;
    sbConfig1.OnClick := nil;
    sbConfig2.OnClick := nil;
    edCusto.Properties.OnEditValueChanged         := nil;
    edMargemDeLucro.Properties.OnEditValueChanged := nil;
    edPrecoVenda.Properties.OnEditValueChanged    := nil;
    rbNaoUsarPadraoDeMargemDeLucro.OnClick := nil;
    rbUsarPadraoDeMargemDeLucro.OnClick    := nil;
    cbSeguirPadraoDaLoja.OnClick    := nil;
    cbUsarMargemEspecifica.OnClick  := nil;
    butOk.OnClick    := nil;
    buCancel.OnClick := nil;
end;

procedure TFrmLabelPopUp.ligarEventos;
begin
    OnActivate       := FrmBasePaiActivate;
    OnCreate         := FrmBasePaiCreate;
    OnDestroy        := FrmBasePaiDestroy;
    OnDeactivate     := FrmBasePaiDeactivate;
    sbConfig1.OnClick := sbConfig2Click;
    sbConfig2.OnClick := sbConfig2Click;
    edCusto.Properties.OnEditValueChanged         := CurrencyEditValueChanged;
    edMargemDeLucro.Properties.OnEditValueChanged := CurrencyEditValueChanged;
    edPrecoVenda.Properties.OnEditValueChanged    := CurrencyEditValueChanged;
    rbNaoUsarPadraoDeMargemDeLucro.OnClick := rbUsarPadraoDeMargemDeLucroClick;
    rbUsarPadraoDeMargemDeLucro.OnClick    := rbUsarPadraoDeMargemDeLucroClick;
    cbSeguirPadraoDaLoja.OnClick    := cbSeguirPadraoDaLojaClick;
    cbUsarMargemEspecifica.OnClick  := cbUsarMargemEspecificaClick;
    butOk.OnClick    := butOkClick;
    buCancel.OnClick := buCancelClick ;
 end;


procedure TFrmLabelPopUp.FiltraDados;
begin
    cmNovo.Enabled := Permitido(daCliCadastrar);
    cmEditar.Enabled := Permitido(daCliCadastrar);
    cmApagar.Enabled := Permitido(daCliCadastrar);

end;

procedure TFrmLabelPopUp.fCxTextEditOnClick(Sender: TObject);
begin
    if fMethodList.assigned('OnClick') then begin                               // do not localize
        SetMethodProp(fCxTextEdit, 'OnClick', fMethodList.byName('OnClick'));        // do not localize
        try
            fCxTextEdit.OnClick(self);
        finally
            fCxTextEdit.OnClick   := fCxTextEditOnClick;
        end;
    end;

    MostrarPopup;
end;

procedure TFrmLabelPopUp.fCxTextEditOnEnter(Sender: TObject);
begin
    if fMethodList.assigned('OnEnter') then begin                               // do not localize
        SetMethodProp(fCxTextEdit, 'OnEnter', fMethodList.byName('OnEnter'));        // do not localize
        try
            fCxTextEdit.OnEnter(self);
        finally
            fCxTextEdit.OnEnter   := fCxTextEditOnEnter;
        end;
    end;

    MostrarPopup;
end;

procedure TFrmLabelPopUp.fCxTextEditOnKeyUp(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
    if fMethodList.assigned('OnKeyUp') then begin                               // do not localize
        SetMethodProp(fCxTextEdit.Properties, 'OnKeyUp', fMethodList.byName('OnKeyUp'));        // do not localize
        try
            fCxTextEdit.OnKeyUp(self, key, shift);
        finally
            fCxTextEdit.OnKeyUp   := fCxTextEditOnKeyUp;
        end;
    end;

    MostrarPopup;
end;

procedure TFrmLabelPopUp.butCloseMessageClick(Sender: TObject);
begin
    resetMessageWindow;
end;


procedure TFrmLabelPopUp.MessageOnControl(aControl: TControl; aMsg: string; const aMinWidth:integer = 120);
var
    pa, pb : TPoint;
    pos2 : boolean;
    indicador : TcxImage;
begin
    pos2 := false;

    pa := point(aControl.left,  aControl.top);
    pb := point(aControl.width, aControl.top);
    if aControl.width < aMinWidth then
        pb.x := aMinWidth;

    if pb.x + pa.x > width then begin
        pos2 := true;
        indicador := imgIndicadorUp;
    end else
        indicador := imgIndicadorDown;

    resetMessageWindow;
    panelMessage.width  := pb.x; // - lbMessage.Margins.left - lbMessage.Margins.right;
    panelMessage.Top  := 0;
    panelMessage.Left  := 0;
    panelMessage.Height  := Height;
    lbMessage.Properties.WordWrap := true;
    lbMessage.AutoSize := true;
    lbMessage.caption := aMsg;

    panelMessage.Height := lbMessage.Height + lbMessage.Margins.top + lbMessage.Margins.Bottom + 8;
    if not pos2 then begin
        lbMessage.Properties.Alignment.Horz := taLeftJustify;
        panelMessage.Left   := pa.X;
        panelMessage.Top    := pa.Y - panelMessage.Height - 5;
    end else begin
        lbMessage.Properties.Alignment.Horz := taRightJustify;
        panelMessage.Left   := pa.X - pb.x + (aControl.width div 2);
        panelMessage.Top    := pa.Y + aControl.Height + 5;
    end;

    butCloseMessage.Top  := panelMessage.Top - 6;
    if not pos2 then begin
        butCloseMessage.left := panelMessage.left + panelMessage.width - 10;
        indicador.left := panelMessage.left - 5;
        indicador.top  := panelMessage.Top + panelMessage.Height - 9;
    end else begin
        butCloseMessage.left := panelMessage.left - 6;
        indicador.left := panelMessage.left + panelMessage.width - 11;
        indicador.top  := panelMessage.Top - 8;
    end;
    indicador.visible := true;
    butCloseMessage.visible := true;
    panelMessage.visible := true;
    butCloseMessage.BringToFront;
    //showMessage(aMsg);
end;

procedure TFrmLabelPopUp.MostrarPopup;
var
  p : TPoint;
begin
        p := fCxTextEdit.ClientToScreen(point(0,fCxTextEdit.Height));
        Left := p.X;
        Top := p.Y;
        Width  := 575;
        Height := 280;

        showmodal;
end;

procedure TFrmLabelPopUp.salvarValores;
begin
    if cbUsarMargemEspecifica.Checked <> fIniPrecoAuto then
        fTabelaPrincipal.FieldByName('PrecoAuto').value := cbUsarMargemEspecifica.Checked;

    if edPrecoVenda.value <> fIniPreco then
        fTabelaPrincipal.FieldByName('Preco').value := edPrecoVenda.value;

    if edMargemDeLucro.value <> fIniMargem then
        fTabelaPrincipal.FieldByName('Margem').value := edMargemDeLucro.value;

    if edCusto.value <> fIniCustoUnitario then
        fTabelaPrincipal.FieldByName('CustoUnitario').value := edCusto.value;

end;

procedure TFrmLabelPopUp.InicializaDados;
begin
    resetMessageWindow;

    fIniPreco := 0;
    fIniMargem := 0;
    fIniCustoUnitario := 0;
    fIniPrecoAuto := false;
    try
        if not fTabelaPrincipal.FieldByName('PrecoAuto').isNull then
           fIniPrecoAuto :=  fTabelaPrincipal.FieldByName('PrecoAuto').value;
        cbUsarMargemEspecifica.checked := fIniPrecoAuto;
        if not fTabelaPrincipal.FieldByName('Margem').isNull then
           fIniMargem :=  fTabelaPrincipal.FieldByName('Margem').value;
        SetMargemDeLucro(fIniMargem);
        if not fTabelaPrincipal.FieldByName('Preco').isNull then
           fIniPreco :=  fTabelaPrincipal.FieldByName('Preco').value;
        SetPrecoVenda(fIniPreco);
        if not fTabelaPrincipal.FieldByName('CustoUnitario').isNull then
           fIniCustoUnitario :=  fTabelaPrincipal.FieldByName('CustoUnitario').value;
        SetCusto(fIniCustoUnitario);

        ligarEventos;
        setSeguirPadraoDaLoja(gConfig.PrecoAuto, true);
    finally
        fInicializado := true;
    end;
end;

procedure TFrmLabelPopUp.Inicializar(acxTextEdit : TcxTextEdit; aTabela:tDataset);
begin
    fTabelaPrincipal := aTabela;
    fCxTextEdit      := acxTextEdit;

    fCxTextEdit.Properties.ReadOnly := true;

    if not fInicializado then
        InicializaDados;

    AtualizaDireitos;
    FiltraDados;

end;

procedure TFrmLabelPopUp.AtualizaDireitos;
begin
    if Dados.CM.UA.Admin then begin
        fMethodList.new('OnClick',GetMethodProp(fCxTextEdit, 'OnClick'));   // do not localize
        fMethodList.new('OnEnter',GetMethodProp(fCxTextEdit, 'OnEnter'));   // do not localize
        fMethodList.new('OnKeyUp',GetMethodProp(fCxTextEdit, 'OnKeyUp'));   // do not localize

        fCxTextEdit.OnClick   := fCxTextEditOnClick;
        fCxTextEdit.OnEnter   := fCxTextEditOnEnter;
        fCxTextEdit.OnKeyUp   := fCxTextEditOnKeyUp;
    end else begin
        fCxTextEdit.OnClick   := nil;
        fCxTextEdit.OnEnter   := nil;
        fCxTextEdit.OnKeyUp   := nil;
    end;
end;

procedure TFrmLabelPopUp.butOkClick(Sender: TObject);
begin
    confirmouEdit;
end;

procedure TFrmLabelPopUp.buCancelClick(Sender: TObject);
begin
    CancelarEdit;
end;

procedure TFrmLabelPopUp.cancelarEdit;
begin
    modalresult := mrOk;
end;

function  TFrmLabelPopUp.checkNullAndZero(aV: variant):integer;
begin
    if aV=null then
        result := -1
    else
    if aV=0 then
        result := 0
    else
        result := 1;
end;

procedure TFrmLabelPopUp.setUsarPadraoDeMargemDeLucro(aValue: boolean);
begin
    rbUsarPadraoDeMargemDeLucro.OnClick    := nil;
    rbNaoUsarPadraoDeMargemDeLucro.OnClick := nil;
    try
        rbUsarPadraoDeMargemDeLucro.checked := aValue;
        rbNaoUsarPadraoDeMargemDeLucro.checked := not aValue;
    finally
        rbUsarPadraoDeMargemDeLucro.OnClick    := rbUsarPadraoDeMargemDeLucroClick;
        rbNaoUsarPadraoDeMargemDeLucro.OnClick := rbUsarPadraoDeMargemDeLucroClick;
    end;
end;

procedure TFrmLabelPopUp.checkSeguirPadraoDaLoja(aValue:boolean);
begin
    cbSeguirPadraoDaLoja.OnClick    := nil;
    try
        cbSeguirPadraoDaLoja.checked := aValue;
    finally
        cbSeguirPadraoDaLoja.OnClick    := cbSeguirPadraoDaLojaClick;
    end;
end;

procedure TFrmLabelPopUp.checkUsarMargemEspecifica(aValue:boolean);
begin
    cbUsarMargemEspecifica.OnClick    := nil;
    try
        cbUsarMargemEspecifica.checked := aValue;
    finally
        cbUsarMargemEspecifica.OnClick    := cbUsarMargemEspecificaClick;
    end;
end;

procedure TFrmLabelPopUp.SetCusto(aValue: double);
begin
    if edCusto.Value <> aValue then begin
        edCusto.Properties.OnEditValueChanged    := nil;
        try
            if aValue>0 then
                edCusto.Value :=  aValue
            else begin
                edCusto.Value :=  aValue;
                edCusto.Text :=  '';
            end;
        finally
            edCusto.Properties.OnEditValueChanged    := CurrencyEditValueChanged;
        end;
        //resetMessageWindow;
        //calcularPreco;
    end;
end;

procedure TFrmLabelPopUp.SetMargemDeLucro(aValue: double);
begin
    if edMargemDeLucro.Value <> aValue then begin
        edMargemDeLucro.Properties.OnEditValueChanged    := nil;
        try
            edMargemDeLucro.Value :=  aValue;
            imgAtencao.Visible := aValue<=0;
        finally
            edMargemDeLucro.Properties.OnEditValueChanged    := CurrencyEditValueChanged;
        end;
        //resetMessageWindow;
        //calcularPreco;
    end;
end;

procedure TFrmLabelPopUp.SetPrecoVenda(aValue: double);
begin
    if edPrecoVenda.Value <> aValue then begin
        edPrecoVenda.Properties.OnEditValueChanged    := nil;
        try
            edPrecoVenda.Value :=  aValue;
        finally
            edPrecoVenda.Properties.OnEditValueChanged    := CurrencyEditValueChanged;
        end;
        //resetMessageWindow;
        //calcularPreco;
    end;
end;

procedure TFrmLabelPopUp.setSeguirPadraoDaLoja(aValue: boolean;
  const aForce: boolean);
begin
    checkSeguirPadraoDaLoja(aValue);
    setUsarPadraoDeMargemDeLucro(aValue);
    if aValue then begin
        if gConfig.PrecoAuto then begin
            SetUsarMargemEspecifica(false, aForce);
            setMargemDeLucro(gConfig.margem);
            resetMessageWindow;
            calcularPreco;
        end else begin
            //SetUsarMargemEspecifica(true, aForce);
            edMargemDeLucro.enabled := true;
            lbMargemDeLucro.enabled := true;
        end;
    end else
        setUsarMargemEspecifica(checkNullAndZero(fTabelaPrincipal.FieldByName('PrecoAuto').value)>0, aForce);
end;

procedure TFrmLabelPopUp.setUsarMargemEspecifica(aValue: boolean; const aForce:boolean=false);
begin

    //if aForce or (aValue <> cbUsarMargemEspecifica.checked) then begin

        if not aValue then begin
            if checkNullAndZero(fTabelaPrincipal.FieldByName('PrecoAuto').value)>0 then
                checkUsarMargemEspecifica(fTabelaPrincipal.FieldByName('PrecoAuto').asBoolean)
            else
                checkUsarMargemEspecifica(gConfig.PrecoAuto);
            if gConfig.Margem>0 then
                setMargemDeLucro(gConfig.Margem);
        end else begin
            if checkNullAndZero(fTabelaPrincipal.FieldByName('Margem').value)>0 then begin
                SetMargemDeLucro( fTabelaPrincipal.FieldByName('Margem').value);
            end;
        end;

    //end;
    edMargemDeLucro.enabled := aValue;
    lbMargemDeLucro.enabled := aValue;
    checkUsarMargemEspecifica(aValue);
    cbUsarMargemEspecifica.visible := aValue;
    resetMessageWindow;
    calcularPreco;
end;


procedure TFrmLabelPopUp.cbUsarMargemEspecificaClick(Sender: TObject);
begin
    SetUsarMargemEspecifica(cbUsarMargemEspecifica.checked, true);
end;

function TFrmLabelPopUp.calcularPrecoSegundoRegraLocal: double;
begin
    result := 0;
    if cbUsarMargemEspecifica.checked then begin
        if (edMargemDeLucro.Value=0) then begin
            if fInicializado then begin
                edMargemDeLucro.enabled := true;
                MessageOnControl(edMargemDeLucro, 'Ingressar a margem de lucro');
                edMargemDeLucro.setFocus;
                exit;
            end;
        end else
        if (edCusto.Value=0) then begin
            if fInicializado then begin
                edCusto.enabled := true;
                MessageOnControl(edCusto, 'Ingressar o custo do produto');
                edCusto.setFocus;
                exit;
            end;
        end else
            result := edCusto.value *
                      ( 1 + ( edMargemDeLucro.value/100) );
    end else
        if edPrecoVenda.value=0 then begin
            if fInicializado then begin
                edPrecoVenda.enabled := true;
                MessageOnControl(edPrecoVenda, 'Ingressar o preço de venda');
                edPrecoVenda.setFocus;
                exit;
            end;
        end else begin
            if edCusto.value>0 then
                setMargemDeLucro(-(100-(edPrecoVenda.value/edCusto.value)*100));
            result := edPrecoVenda.value;
        end;
end;

procedure TFrmLabelPopUp.calcularPreco;
var
    pv : double;
begin
    pv := 0;
    if cbSeguirPadraoDaLoja.checked then begin
        if gConfig.PrecoAuto then begin
            if (edCusto.Value>0) and (gConfig.Margem>0) then
                pv := edCusto.value *
                      ( 1 + ( gConfig.Margem/100) )
            else
            if fInicializado then begin
                if (gConfig.Margem<=0) then begin
                    MessageOnControl(sbConfig2, 'Alterar opções do sistema. Ingressar a margem de lucro', 250);
                    exit;
                end;
                if (edCusto.Value<=0) then begin
                    edPrecoVenda.enabled := true;
                    MessageOnControl(edPrecoVenda, 'Ingressar o preço de venda');
                    edPrecoVenda.setFocus;
                    exit;
                end;
            end;
        end else
            pv := calcularPrecoSegundoRegraLocal;
    end else
        pv := calcularPrecoSegundoRegraLocal;

    SetPrecoVenda(pv);

    fCxTextEdit.Text :=  FloatToStrF(pv, ffCurrency, 15, 2);
end;

procedure TFrmLabelPopUp.cbSeguirPadraoDaLojaClick(Sender: TObject);
begin
    resetMessageWindow;
    setSeguirPadraoDaLoja(cbSeguirPadraoDaLoja.checked);
end;

procedure TFrmLabelPopUp.rbUsarPadraoDeMargemDeLucroClick(Sender: TObject);
begin
    SetUsarMargemEspecifica(rbUsarPadraoDeMargemDeLucro.checked)
end;

procedure TFrmLabelPopUp.confirmouEdit;
begin
    modalresult := mrCancel;
end;

procedure TFrmLabelPopUp.CurrencyEditValueChanged(Sender: TObject);
begin
    resetMessageWindow;
    calcularPreco;
end;

procedure TFrmLabelPopUp.FrmBasePaiActivate(Sender: TObject);
begin
    setSeguirPadraoDaLoja(gConfig.PrecoAuto, true);
    //SetUsarMargemEspecifica(fIniPrecoAuto, true);
    //calcularPreco;
end;

procedure TFrmLabelPopUp.FrmBasePaiDeactivate(Sender: TObject);
begin
    salvarValores;
end;

procedure TFrmLabelPopUp.sbConfig2Click(Sender: TObject);
begin
    resetMessageWindow;
    TFrmConfigPrecoAuto.Create(self).ShowModal;
    checkSeguirPadraoDaLoja(gConfig.PrecoAuto);
    if (gConfig.PrecoAuto) and (gConfig.Margem>0) then
        SetMargemDeLucro(gConfig.Margem);
    calcularPreco;
end;

procedure TFrmLabelPopUp.resetMessageWindow;
begin
    imgIndicadorDown.visible := false;
    imgIndicadorUp.visible := false;
    butCloseMessage.visible := false;
    panelMessage.visible := false;
end;


end.


