unit ncaFrmPopUpEditBase;

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
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, cxNavigator,
  dxPScxPivotGridLnk, uNexTransResourceStrings_PT, ufmFormBase,
  cxPCdxBarPopupMenu, cxPC, cxButtons, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, ncaMethodList,
  uParentedPanel;

type
  TPopUpStatus = (puBrowse, puEdit, puInsert, puDelete);

  TFrmPopUpEditBase = class(TFrmBasePai)
    PopupMenu1: TPopupMenu;
    BarMgr: TdxBarManager;
    BarMgrBar1: TdxBar;
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
    dxBarDockControl1: TdxBarDockControl;
    Query: TnxQuery;
    pageControlEditar: TcxPageControl;
    tsGrid: TcxTabSheet;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVDescricao: TcxGridDBColumn;
    TVFor: TcxGridDBTableView;
    TVForNome: TcxGridDBColumn;
    GL: TcxGridLevel;
    tsEdit: TcxTabSheet;
    dsValores: TDataSource;
    panEdit: TLMDSimplePanel;
    butOk: TcxButton;
    buCancel: TcxButton;
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure buCancelClick(Sender: TObject);
    procedure edItemKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure butOkClick(Sender: TObject);
    procedure pageControlEditarChange(Sender: TObject);
    procedure TVDblClick(Sender: TObject);
    procedure TVKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    fMethodList : TMethodList;
    { Private declarations }
  protected
    fResult  : Boolean;
    fStatus  : TPopUpStatus;
    fInicializado : boolean;
    fPopUp : TcxDBPopupEdit;
    fTabelaPrincipal: TDataset;
    fDescricao         : string;
    fCannotDeleteText  : string;
    fCannotEditText    : string;
    fNomeTabelaPrincipal : string;
    fNomeCampoTabelaPrincipal : string;
    fNomeTabelaValores : string;
    fNomeCampoTabelaValores : string;
    function  SetStatus(newStatus:TPopUpStatus):boolean;
    procedure fPopUpOnClick(Sender: TObject);
    procedure fPopUpOnCloseUp(Sender: TObject);
    procedure fPopUpOnEditing(Sender: TObject; var CanEdit:Boolean);
    procedure fPopUpOnInitPopup(Sender: TObject);
    procedure fPopUpOnPopup(Sender: TObject);
    procedure fPopUpOnCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure fPopUpOnEnter(Sender: TObject);
    procedure fPopUpOnValidate(Sender: TObject; var DisplayValue: Variant;
      var ErrorText: TCaption; var Error: Boolean);
    procedure fPopUpOnEditValueChanged(Sender: TObject);
    function  doBeforeDelete: boolean; virtual; abstract;
    function  doBeforeEdit: boolean; virtual; abstract;
    procedure doAfterDelete; virtual; abstract;
    procedure doOnPageControlEditarChange; virtual;
    procedure InitPopup;     virtual;
    procedure AtualizaDireitos; virtual;
    procedure FiltraDados;   virtual;
    procedure cancelarEdit;  virtual;
    procedure confirmouEdit; virtual;
    procedure selecionou;    virtual;
    procedure cancelou;      virtual;
    procedure mostraPainelEdicao; virtual;
    procedure escondePainelEdicao; virtual;
    function  ItemsExistentesEmTabelaPrincipal(aItem:string):integer;
    procedure Inicializar(aPopUp : TcxDBPopupEdit; aTabela:tDataset); virtual;
    procedure InicializaDados; virtual; abstract;
    { Protected declarations }
  public
    property Result:boolean read FResult;
    { Public declarations }
  end;

var
  FrmPopUpEditBase: TFrmPopUpEditBase;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, 
  ncaFrmPass, ncIDRecursos, ncaFrmZerarTempo,
  ncaFrmSenha, ncaFrmCadCli, ncaFrmCadFornecedor,
  ncaFrmProduto2, TypInfo, dxLayoutControl;

{$R *.dfm}

procedure TFrmPopUpEditBase.FrmBasePaiCreate(Sender: TObject);
begin
    inherited;
    fInicializado := False;
    buCancel.OnClick := buCancelClick;
    butOk.OnClick    := butOkClick;
    fMethodList := TMethodList.create;
end;

procedure TFrmPopUpEditBase.FrmBasePaiDestroy(Sender: TObject);
begin
   fMethodList.Free;
   inherited;
end;

procedure TFrmPopUpEditBase.FiltraDados;
begin
    cmNovo.Enabled := Permitido(daCliCadastrar);
    cmEditar.Enabled := Permitido(daCliCadastrar);
    cmApagar.Enabled := Permitido(daCliCadastrar);

    TV.DataController.DataSource := dsValores;
end;

procedure TFrmPopUpEditBase.fPopUpOnClick(Sender: TObject);
begin
    fPopUp.DroppedDown := true;

    if fMethodList.assigned('OnClick') then begin                               // do not localize
        SetMethodProp(fPopUp, 'OnClick', fMethodList.byName('OnClick'));        // do not localize
        try
            fPopUp.OnClick(self);
        finally
            fPopUp.OnClick   := fPopUpOnClick;
        end;
    end;
end;

procedure TFrmPopUpEditBase.fPopUpOnEnter(Sender: TObject);
begin
    fPopUp.DroppedDown := true;
    if fMethodList.assigned('OnEnter') then begin                               // do not localize
        SetMethodProp(fPopUp, 'OnEnter', fMethodList.byName('OnEnter'));        // do not localize
        try
            fPopUp.OnEnter(self);
        finally
            fPopUp.OnEnter   := fPopUpOnEnter;
        end;
    end;
end;

procedure TFrmPopUpEditBase.fPopUpOnEditing(Sender: TObject; var CanEdit:Boolean);
begin
    fPopUp.DroppedDown := true;
    CanEdit := false;

    if fMethodList.assigned('OnEditing') then begin                             // do not localize
        SetMethodProp(fPopUp, 'OnEditing', fMethodList.byName('OnEditing'));    // do not localize
        try
            fPopUp.OnEditing(self, CanEdit);
        finally
            fPopUp.OnEditing   := fPopUpOnEditing;
        end;
    end;

    CanEdit := false;
end;

procedure TFrmPopUpEditBase.fPopUpOnCloseUp(Sender: TObject);
begin
    if fMethodList.assigned('Properties.OnCloseUp') then begin                             // do not localize
        SetMethodProp(fPopUp.Properties, 'OnCloseUp', fMethodList.byName('Properties.OnCloseUp'));    // do not localize
        try
            fPopUp.Properties.OnCloseUp(self);
        finally
            fPopUp.Properties.OnCloseUp   := fPopUpOnCloseUp;
        end;
    end;

    if FResult then
       if (fPopUp.parent is TdxLayoutControl) and
          (fPopUp.owner is TFrmProduto) then
            TFrmProduto(fPopUp.owner).FocusNextControl(fPopUp)
       else
         TControl(fPopUp.owner).Perform(Wm_NextDlgCtl,0,0);
end;

procedure TFrmPopUpEditBase.InitPopup;
begin
end;

procedure TFrmPopUpEditBase.fPopUpOnInitPopup(Sender: TObject);
begin
    SetStatus(puBrowse);

    InitPopup;

    if fMethodList.assigned('Properties.OnInitPopup') then begin                             // do not localize
        SetMethodProp(fPopUp.Properties, 'OnInitPopup', fMethodList.byName('Properties.OnInitPopup'));  // do not localize
        try
            fPopUp.Properties.OnInitPopup(self);
        finally
            fPopUp.Properties.OnInitPopup   := fPopUpOnInitPopup;
        end;
    end;

end;

procedure TFrmPopUpEditBase.fPopUpOnPopup(Sender: TObject);
begin
    doOnPageControlEditarChange;

    if fMethodList.assigned('Properties.OnPopup') then begin                               // do not localize
        SetMethodProp(fPopUp.Properties, 'OnPopup', fMethodList.byName('Properties.OnPopup'));        // do not localize
        try
            fPopUp.Properties.OnPopup(self);
        finally
            fPopUp.Properties.OnPopup   := fPopUpOnPopup;
        end;
    end;

end;

procedure TFrmPopUpEditBase.fPopUpOnCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

    if CanClose and fMethodList.assigned('Properties.OnCloseQuery') then begin                                // do not localize
        SetMethodProp(fPopUp.Properties, 'OnCloseQuery', fMethodList.byName('Properties.OnCloseQuery'));    // do not localize
        try
            fPopUp.Properties.OnCloseQuery(self, CanClose);
        finally
            fPopUp.Properties.OnCloseQuery   := fPopUpOnCloseQuery;
        end;
    end;
end;

procedure TFrmPopUpEditBase.fPopUpOnValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
    if fMethodList.assigned('Properties.OnValidate') then begin                                // do not localize
        SetMethodProp(fPopUp.Properties, 'OnValidate', fMethodList.byName('Properties.OnValidate'));    // do not localize
        try
            fPopUp.Properties.OnValidate(self, DisplayValue, ErrorText, Error);
        finally
            fPopUp.Properties.OnValidate   := fPopUpOnValidate;
        end;
    end;
end;

procedure TFrmPopUpEditBase.fPopUpOnEditValueChanged(Sender: TObject);
begin
    if fMethodList.assigned('Properties.OnEditValueChanged') then begin                                // do not localize
        SetMethodProp(fPopUp.Properties, 'OnEditValueChanged', fMethodList.byName('Properties.OnEditValueChanged'));    // do not localize
        try
            fPopUp.Properties.OnEditValueChanged(self);
        finally
            fPopUp.Properties.OnEditValueChanged   := fPopUpOnEditValueChanged;
        end;
    end;
end;

procedure TFrmPopUpEditBase.Inicializar(aPopUp : TcxDBPopupEdit; aTabela:tDataset);
var
    PropInfo: PPropInfo;
    clss  : TClass;
    Props : TcxPopupEditProperties;
begin
    fTabelaPrincipal := aTabela;
    fPopUp           := aPopUp;
    fStatus          := puBrowse;
    name := copy(classname,2,maxint)+ fPopUp.Name;

    pageControlEditar.OnChange := nil;
    pageControlEditar.ActivePage := tsGrid;
    pageControlEditar.OnChange := pageControlEditarChange;

    fPopUp.Properties.IncrementalSearch := false;
    fPopUp.Properties.ImmediateDropDownWhenActivated := true;
    fPopUp.Properties.ImmediateDropDownWhenKeyPressed := true;
    fPopUp.Properties.AutoSelect := false;
    //fPopUp.Properties.PopupControl := panPri;
    fPopUp.Properties.PopupAutoSize := false;
    fPopUp.Properties.PopupWidth  := fPopUp.Width;
    fPopUp.Properties.PopupHeight := 200;

    fMethodList.new('OnClick',GetMethodProp(fPopUp, 'OnClick'));   // do not localize
    fMethodList.new('OnEnter',GetMethodProp(fPopUp, 'OnEnter'));   // do not localize
    fMethodList.new('OnEditing',GetMethodProp(fPopUp, 'OnEditing'));   // do not localize
    fPopUp.OnClick   := fPopUpOnClick;
    fPopUp.OnEnter   := fPopUpOnEnter;
    //fPopUp.OnEditing := fPopUpOnEditing;

    PropInfo := GetPropInfo(fPopUp, 'Properties'); // do not localize
    if Assigned(PropInfo) then begin
        clss := GetObjectPropClass(fPopUp, 'Properties'); // do not localize
        if Assigned(clss) then begin
            Props := TcxPopupEditProperties(GetObjectProp(fPopUp, 'Properties', clss)); // do not localize
            if Assigned(Props) then begin

                fMethodList.new('Properties.OnCloseUp',GetMethodProp(Props, 'OnCloseUp'));   // do not localize
                fMethodList.new('Properties.OnInitPopup',GetMethodProp(Props, 'OnInitPopup'));   // do not localize
                fMethodList.new('Properties.OnPopup',GetMethodProp(Props, 'OnPopup'));   // do not localize
                fMethodList.new('Properties.OnCloseQuery',GetMethodProp(Props, 'OnCloseQuery'));   // do not localize
                fMethodList.new('Properties.OnValidate',GetMethodProp(Props, 'OnValidate'));   // do not localize
                fMethodList.new('Properties.OnEditValueChanged',GetMethodProp(Props, 'OnEditValueChanged'));   // do not localize

                fPopUp.Properties.OnCloseUp     := fPopUpOnCloseUp;
                fPopUp.Properties.OnInitPopup   := fPopUpOnInitPopup;
                fPopUp.Properties.OnPopup       := fPopUpOnPopup;
                //fPopUp.Properties.OnCloseQuery  := fPopUpOnCloseQuery;
                //fPopUp.Properties.OnValidate          := fPopUpOnValidate;
                //fPopUp.Properties.OnEditValueChanged  := fPopUpOnEditValueChanged;
            end;
        end;
    end;


    if not fInicializado then
        InicializaDados;

    AtualizaDireitos;
    FiltraDados;

    FResult := false;
end;

procedure TFrmPopUpEditBase.AtualizaDireitos;
begin
    inherited;
    cmNovo.Enabled  := Permitido(daProCadastrar);
    cmEditar.Enabled := Permitido(daProCadastrar);
    cmApagar.Enabled := Permitido(daProApagar);
end;


procedure TFrmPopUpEditBase.mostraPainelEdicao;
begin
    cmNovo.Enabled   := false;
    cmEditar.Enabled := false;
    cmApagar.Enabled := false;

    pageControlEditar.ActivePage := tsEdit;

end;

procedure TFrmPopUpEditBase.escondePainelEdicao;
begin
    cmNovo.Enabled   := Permitido(daProCadastrar);
    cmEditar.Enabled := Permitido(daProCadastrar);
    cmApagar.Enabled := Permitido(daProApagar);
    pageControlEditar.ActivePage := tsGrid;
end;


function TFrmPopUpEditBase.SetStatus(newStatus: TPopUpStatus): boolean;
begin
    result := false;

    if newStatus<>fStatus then begin
        if (fStatus=puBrowse) then begin
            if newStatus = puDelete then begin
                result := doBeforeDelete;
                exit;
            end else
            if (newStatus = puedit) then begin
                result := doBeforeEdit;
            end else
            if (newStatus = puInsert) then begin
                fStatus := puInsert;
                result := true;
                mostraPainelEdicao;
            end;

            if not result then
                fStatus := puBrowse;

        end else begin
            result := true;
            fStatus := puBrowse;
        end;
    end;
end;

procedure TFrmPopUpEditBase.cmEditarClick(Sender: TObject);
begin
    SetStatus(puEdit);
end;

procedure TFrmPopUpEditBase.cmNovoClick(Sender: TObject);
begin
    SetStatus(puInsert);
end;

procedure TFrmPopUpEditBase.cmApagarClick(Sender: TObject);
begin
    if SetStatus(puDelete) then
        doAfterDelete;
end;

procedure TFrmPopUpEditBase.butOkClick(Sender: TObject);
begin
    confirmouEdit;
end;

procedure TFrmPopUpEditBase.buCancelClick(Sender: TObject);
begin
    CancelarEdit;
end;

procedure TFrmPopUpEditBase.cancelarEdit;
begin
    FResult := false;
    escondePainelEdicao;
    fStatus:=puBrowse;
end;

procedure TFrmPopUpEditBase.confirmouEdit;
begin
    FResult := false;
end;

procedure TFrmPopUpEditBase.pageControlEditarChange(Sender: TObject);
begin
    doOnPageControlEditarChange;
end;


procedure TFrmPopUpEditBase.doOnPageControlEditarChange;
begin
   if pageControlEditar.ActivePage = tsGrid then
       Grid.SetFocus
   else
       panEdit.SetFocus;
end;

function TFrmPopUpEditBase.ItemsExistentesEmTabelaPrincipal(aItem:string): integer;
begin
    result := 0;
    try
        query.SQL.Text := 'Select count("'+fNomeCampoTabelaPrincipal+'") From "'+ // do not localize
            fNomeTabelaPrincipal+'" where '+fNomeCampoTabelaPrincipal+'=:par1'; // do not localize
        query.ParamByName('par1').AsString := aItem; // do not localize
        query.open;
        result := query.fields[0].asInteger;
        query.close;
    except
    end;
end;

procedure TFrmPopUpEditBase.edItemKeyUp(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
    if key=13 then begin
        confirmouEdit;
        fPopUp.DroppedDown := false;
    end;
    if key=27 then begin
        cancelarEdit;
        fPopUp.DroppedDown := false;
    end;
end;

procedure TFrmPopUpEditBase.TVDblClick(Sender: TObject);
begin
    selecionou;
end;

procedure TFrmPopUpEditBase.TVKeyUp(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
    if key=13 then
        selecionou;
    if key=27 then
        cancelou;
end;

procedure TFrmPopUpEditBase.selecionou;
begin
    FResult := true;
    fPopUp.DroppedDown := false;
end;

procedure TFrmPopUpEditBase.cancelou;
begin
    FResult := false;
    fPopUp.DroppedDown := false;
end;



end.


