unit ufmFormBase;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGrid, ExtCtrls, dxBar, cxControls, cxPC, ufmFrmBasePai,   
  dxBarExtItems, cxGridCustomPopupMenu, cxGridPopupMenu, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
//  cxCustomPivotGrid,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, DB, cxClasses, dxRibbon,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxPivotGridLnk, uParentedPanel, ncClassesBase;

type

  TFormManager = class;

  TGridArray = Array of TcxGrid;
  
  TFrmBase = class(TFrmBasePai)
    panPri: TParentedPanel;
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
    MenuGrid: TcxGridPopupMenu;
    CP: TdxComponentPrinter;
    dlgExp: TSaveDialog;
    cmLayout: TdxBarLargeButton;
    pmLay: TdxBarPopupMenu;
    pmPeriodo: TdxBarPopupMenu;
    cmPeriodo: TdxBarLargeButton;
    dxBarDockControl1: TdxBarDockControl;
    cmUltimas24h: TdxBarButton;
    cmCfg: TdxBarLargeButton;
    procedure cmHojeClick(Sender: TObject);
    procedure cmEstaSemanaClick(Sender: TObject);
    procedure cmEsteMesClick(Sender: TObject);
    procedure cmEsteAnoClick(Sender: TObject);
    procedure cmTudoClick(Sender: TObject);
    procedure cmDigitarPeriodoClick(Sender: TObject);
    procedure cmLayRestaurarClick(Sender: TObject);
    procedure cmLaySalvarClick(Sender: TObject);
    procedure cmLayCustomizeClick(Sender: TObject);
    procedure cmAtualizarClick(Sender: TObject);
    procedure cmImprimirClick(Sender: TObject); virtual;
    procedure cmExportarClick(Sender: TObject); virtual;
    procedure cmLayoutClick(Sender: TObject);
    procedure cmPeriodoClick(Sender: TObject);
    procedure cmUltimas24hClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
  private
    { Private declarations }
    FFormMgr : TFormManager;
    FFiltro  : Variant;
    FTabSheet: TcxTabSheet;
    FOperacao: Integer;
    FDataI, 
    FDataF: TDateTime;
    procedure SetFiltro(const Value: Variant);
    
  protected  
    procedure SetOperacao(const Value: Integer); virtual;
    procedure CloseDatasets; virtual;

    procedure wmAtualizaDireitosConfig(var Msg: TMessage);
      message wm_atualizadireitosconfig;  
  public
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;

    class procedure GetStringsOperacoes(ST : TStrings);
    class function Descricao: String; virtual; abstract;
    class function Modulo: Integer; virtual; abstract;
    class function GetOperacoes(AIDOper: Integer;
                                var ADescricao: String): Boolean; virtual;
                                
    function ToolbarIsRibbonGroup(aBar: TdxBar): Boolean; virtual;

    function IncludeGridNameLayout: Boolean; virtual;
    
    function  GetGrid: TcxGrid; virtual;
    function  GetGrids: TGridArray; virtual;
//    function  GetPGrid: TcxCustomPivotGrid; virtual; 
    function  GetDataSource: TDataSource; virtual;
    function  GetDataset: TDataset; virtual;
    procedure ParentChanged; virtual;
    procedure FiltraDados; virtual;
    procedure AtualizaDireitos; virtual; 
    procedure AjustaLayoutLargeButton(B : TdxBarLargeButton); virtual;
    procedure ClearFM;

    property FormMgr: TFormManager
      read FFormMgr;
      
    property TabSheet: TcxTabSheet
      read FTabSheet;

    property Operacao: Integer
      read FOperacao write SetOperacao;  

    property Filtro: Variant
      read FFiltro write SetFiltro;  

    property DataI: TDateTime
      read FDataI write FDataI;

    property DataF: TDateTime
      read FDataF write FDataF;  
    { Public declarations }
  end;

  TLayoutProc = procedure (AGrid: TObject; ALayout: String; AUsuario: String = 'todos');
  PLayoutProc = ^TLayoutProc;
  
  TFrmBaseClass = Class of TFrmBase;
  PFrmBaseClass = ^TFrmBaseClass;

  TfmFormInfo = record
    fiClass : TFrmBaseClass;
    fiInstance : TFrmBase;
    fiRibTab : TdxRibbonTab;
  end;

  PfmFormInfo = ^TfmFormInfo;

  TGetTabSheetEvent = procedure (Sender: TObject; aClass: TFrmBaseClass; var aTabSheet: TcxTabSheet) of object;
  
  TFormManager = class (TComponent)
  private
    FBarMgr       : TdxBarManager;
    FPageControl  : TcxPageControl;
    FFormAtivo    : TFrmBase;
    FList         : TList;
    FOnPageControlChange: TNotifyEvent;
    FOnRibbonTabChange: TNotifyEvent;
    FOnChange     : TNotifyEvent;
    FClearing     : Boolean;
    FRibbon       : TdxRibbon;
    FOnGetTabSheetEv : TGetTabSheetEvent;

    procedure fPageControlChange(Sender: TObject);
    procedure fRibbonTabChanged(Sender: TdxCustomRibbon);
    
    procedure SetPageControl(const Value: TcxPageControl);
    function GetCount: Integer;
    function GetForm(AIndex: Integer): PfmFormInfo;
    procedure FreeFormInstance(FI: PfmFormInfo; ADestroy: Boolean);
    

    procedure RemoveBotoesComuns;
    //procedure AdicionaBotoesComuns;

    procedure RemoveBotoesTabSheet(AForm : TFrmBase);
    procedure AddBotoesTabSheet(aForm : TFrmBase; aRibTab: TdxRibbonTab);
    procedure SetFormAtivo(AInstance: TFrmBase);
    procedure SetRibbon(const Value: TdxRibbon);
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Clear;                                            
    procedure AtualizaDireitos;

    procedure RegistraForm(aClass: TFrmBaseClass; aRibTab: TdxRibbonTab = nil);

    procedure FormDestroyed(aInstance: TFrmBase);

    procedure Mostrar(AClass: TFrmBaseClass; AOperID: Integer; AFiltro: Variant; ARefreshLater: Boolean = False); overload;
    procedure Mostrar(AClass: TFrmBaseClass; ARefreshLater: Boolean = False); overload;
    procedure MostrarFI(FI: PfmFormInfo; ARefreshLater: Boolean = False);
    procedure MostrarTab(AClass: TFrmBaseClass);
    procedure Esconder(AClass: TFrmBaseClass);
    procedure Desativar(AClass: TFrmBaseClass);
    procedure Fechar(AClass: TFrmBaseClass);
    procedure AllParentChanged;

    function FormByClass(AClass: TFrmBaseClass): PfmFormInfo;
    function FormByInstance(AInstance: TFrmBase): PfmFormInfo;
    function FormByTabSheet(ATabSheet: TcxTabSheet): PfmFormInfo;
    function FormByRibbonTab(aRibTab: TdxRibbonTab): PfmFormInfo;
    function ClassByName(AClassName: String): PFrmBaseClass;

    procedure GetStringsForm(ST: TStrings);

    property Count: Integer
      read GetCount;

    property Forms[AIndex: Integer]: PfmFormInfo
      read GetForm;
  published    
    property BarMgr: TdxBarManager
      read FBarMgr write FBarMgr;

    property PageControl: TcxPageControl
      read FPageControl write SetPageControl;

    property FormAtivo: TFrmBase
      read FFormAtivo;

    property OnPageControlChange: TNotifyEvent
      read FOnPageControlChange write FOnPageControlChange;  

    property OnRibbonTabChange: TNotifyEvent
      read FOnRibbonTabChange write FOnRibbonTabChange;  

    property OnChange: TNotifyEvent
      read FOnChange write FOnChange;

    property OnGetTabSheet: TGetTabSheetEvent
      read FOnGetTabSheetEv write FOnGetTabSheetEv;    

    property Ribbon: TdxRibbon
      read FRibbon write SetRibbon;  
  End;

  procedure LeLayoutDef(AGrid: TObject; ALayout: String; AUsuario: String = 'todos');
  procedure SalvaLayoutDef(AGrid: TObject; ALayout: String; AUsuario: String = 'todos');
  function ItemLinkScreenPoint(IL: TdxBarItemLink): TPoint;

const
  barComum = 'BarraComum';
  barTabSheet = 'BarraTabSheet';

var
  FrmBase: TFrmBase;
  LeLayoutProc : TLayoutProc;
  SalvaLayoutProc : TLayoutProc;
  MostrarTextoBotoes: Boolean;

  PeriodoStr : String = 'Período';

  GridClassName_IncludeGridName : Boolean = False;
  

implementation

uses cxGridTableView, ufmImagens, ufmFrmPeriodo, cxGridExportlink;

// START resource string wizard section
resourcestring
  SClasse = 'Classe ';
  SNãoRegistrada = ' não registrada';
  SMostrar = 'Mostrar';
  SPeríodoHoje = 'Período: Hoje';
  SPeríodoEstaSemana = 'Período: Esta Semana';
  SPeríodoEsteMês = 'Período: Este Mês';
  SPeríodoEsteAno = 'Período: Este Ano';
  SPeríodoTudo = 'Período: Tudo';
  SPeríodo = 'Período: ';
  SDdMmYyyyHhMm = 'dd/mm/yyyy hh:mm';

// END resource string wizard section


{$R *.dfm}

{ TFormManager }

function ItemLinkScreenPoint(IL: TdxBarItemLink): TPoint;
begin
  Result.X := IL.ItemRect.Left;
  Result.Y := IL.ItemRect.Bottom;
  Result := IL.BarControl.ClientToScreen(Result);
end;

procedure LeLayoutDef(AGrid: TObject; ALayout: String; AUsuario: String='todos'); // do not localize
begin
end;

procedure SalvaLayoutDef(AGrid: TObject; ALayout: String; AUsuario: String='todos'); // do not localize
begin
end;

constructor TFormManager.Create(AOwner: TComponent);
begin
  inherited;
  FClearing := False;
  FList := TList.Create;
  FBarMgr := nil;
  FPageControl := nil;
  FFormAtivo := nil;
  FOnPageControlChange := nil;
  FOnRibbonTabChange := nil;
  FOnChange := nil;
  FOnGetTabSheetEv := nil;
  FRibbon := nil;
end;

destructor TFormManager.Destroy;
begin
  PageControl := nil;
  Ribbon := nil;
  Clear;
  FList.Free;
  inherited;
end;

procedure TFormManager.RegistraForm(aClass: TFrmBaseClass; aRibTab: TdxRibbonTab = nil);
var FI : PfmFormInfo;
begin
  FI := FormByClass(AClass);
  if FI <> nil then Exit;
  New(FI);
  FI^.fiClass := AClass;
  FI^.fiInstance := nil;
  FI^.fiRibTab := aRibTab;
  FList.Add(FI);
end;

procedure TFormManager.FormDestroyed(aInstance: TFrmBase);
var FI : PfmFormInfo;
begin
  try
    FI := FormByInstance(AInstance);
    if FI<>nil then 
      FreeFormInstance(FI, False);
  except
  end;
end;

procedure TFormManager.fPageControlChange(Sender: TObject);
var FI: PfmFormInfo;
begin
  if FClearing then Exit;
  FI := FormByTabSheet(FPageControl.ActivePage);
  if (FI<>nil) then
    MostrarFI(FI)
  else
  if FFormAtivo <> nil then
    Desativar(TFrmBaseClass(FFormAtivo.ClassType));    

  if Assigned(FOnPageControlChange) then
    FOnPageControlChange(FRibbon);
end;

procedure TFormManager.Clear;
var 
  I : Integer;
begin
  FClearing := True;
  try
    FOnPageControlChange := nil;
    for I := 0 to Count-1 do 
    if Forms[I]^.fiInstance<>nil then
      Forms[I]^.fiInstance.ClearFM;
    
    while Count > 0 do begin
      FreeFormInstance(Forms[0], True);
      Dispose(Forms[0]);
      FList.Delete(0);
    end;
  finally
    FClearing := False;
  end;  
end;
 
procedure TFormManager.fRibbonTabChanged(Sender: TdxCustomRibbon);
var FI: PfmFormInfo;
begin
  if FClearing then Exit;
  if Count=0 then Exit;
  
  FI := FormByRibbonTab(FRibbon.ActiveTab);
  if (FI<>nil) then
    MostrarFI(FI) 
  else
  if FFormAtivo <> nil then
    Desativar(TFrmBaseClass(FFormAtivo.ClassType));    

  if Assigned(FOnRibbonTabChange) then
    FOnRibbonTabChange(FRibbon);
end;

procedure TFormManager.SetPageControl(const Value: TcxPageControl);
begin
  if FPageControl=Value then Exit;
  if FPageControl<>nil then
    FPageControl.OnChange := nil;
    
  FPageControl := Value;
  
  if FPageControl<>nil then 
    FPageControl.OnChange := fPageControlChange;
end;

procedure TFormManager.SetRibbon(const Value: TdxRibbon);
begin
  if FRibbon = Value then Exit;
  if FRibbon <> nil then
    FRibbon.OnTabChanged := nil;
  FRibbon := Value;
  if FRibbon<>nil then
    FRibbon.OnTabChanged := fRibbonTabChanged;
end;

function TFormManager.FormByClass(AClass: TFrmBaseClass): PfmFormInfo;
var I : Integer;
begin
  for I := 0 to Count-1 do 
    if Forms[I]^.fiClass=AClass then begin
      Result := Forms[I];
      Exit;
    end;  

  Result := nil;  
end;

function TFormManager.FormByInstance(AInstance: TFrmBase): PfmFormInfo;
var I : Integer;
begin
  for I := 0 to Count-1 do 
    if Forms[I]^.fiInstance=AInstance then begin
      Result := Forms[I];
      Exit;
    end;  

  Result := nil;  
end;

function TFormManager.FormByRibbonTab(aRibTab: TdxRibbonTab): PfmFormInfo;
var I : Integer;
begin
  for I := 0 to Count-1 do with Forms[I]^ do 
  if (fiRibTab=aRibTab) then
  begin
    Result := Forms[I];
    Exit;
  end;  

  Result := nil;  
end;

function TFormManager.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TFormManager.GetForm(AIndex: Integer): PfmFormInfo;
begin
  Result := PfmFormInfo(FList[AIndex]);
end;

function TFormManager.FormByTabSheet(ATabSheet: TcxTabSheet): PfmFormInfo;
var I : Integer;
begin
  for I := 0 to Count-1 do with Forms[I]^ do 
  if (fiInstance<>nil) and (fiInstance.FTabSheet=ATabSheet) then 
  begin
    Result := Forms[I];
    Exit;
  end;  

  Result := nil;  
end;

procedure TFormManager.FreeFormInstance(FI: PfmFormInfo; ADestroy: Boolean);
var TS: TcxTabSheet;
begin
  with FI^ do 
  if fiInstance<>nil then begin
    if FFormAtivo=fiInstance then
      SetFormAtivo(nil);
    RemoveBotoesTabSheet(fiInstance);  
    TS := fiInstance.TabSheet;
    fiInstance.FTabSheet := nil;
    fiInstance.FFormMgr := nil;
    if ADestroy then begin
      fiInstance.Free;
      if TS<>nil then
      try
        TS.Free;
      except
      end;
    end;
    FI^.fiInstance := nil;  
  end;
end;

procedure TFormManager.Desativar(AClass: TFrmBaseClass);
var FI: PfmFormInfo;                               
begin
  FI := FormByClass(AClass);
  if (FI <> nil) and (FI^.fiInstance<>nil) then 
  begin
    RemoveBotoesComuns;
    if FFormAtivo = FI^.fiInstance then
      SetFormAtivo(nil);
    // ReRemover bars form
    if FPageControl.HideTabs then 
    if not FI^.fiInstance.CacheInstance then
      FreeFormInstance(FI, True);
  end;
end;

procedure TFormManager.Esconder(AClass: TFrmBaseClass);
var FI: PfmFormInfo;
begin
  FI := FormByClass(AClass);
  if (FI <> nil) and (FI^.fiInstance<>nil) then 
  begin
    if FI^.fiInstance=FFormAtivo then
      RemoveBotoesComuns;
      
    if (not FPageControl.HideTabs) or (FI^.fiInstance.CacheInstance) then begin
      if FPageControl.HideTabs then
        FI^.fiInstance.panPri.Parent := FI^.fiInstance;
      if FFormAtivo=FI^.fiInstance then
        SetFormAtivo(nil);
      try
        FI^.fiInstance.FTabSheet.TabVisible := False;
      except
      end;
    end else
      FreeFormInstance(FI, True);
  end;
  
end;

procedure TFormManager.Fechar(AClass: TFrmBaseClass);
var FI: PfmFormInfo;
begin
  FI := FormByClass(AClass);
  if (FI <> nil) and (FI^.fiInstance<>nil) then 
    FreeFormInstance(FI, True);
end;

procedure TFormManager.Mostrar(AClass: TFrmBaseClass; ARefreshLater: Boolean = False);
begin
  Mostrar(AClass, 0, null, ARefreshLater);
end;

procedure TFormManager.MostrarFI(FI: PfmFormInfo; ARefreshLater: Boolean = False);
begin
  FBarMgr.LockUpdate := True;
  try  
    if (FFormAtivo <> nil) and (FFormAtivo.ClassType <> FI^.fiClass) then
      Desativar(TFrmBaseClass(FFormAtivo.ClassType));
  
    with FI^ do
    if fiInstance = nil then begin
      fiInstance := fiClass.Create(Self.Owner);
      fiInstance.FFormMgr := Self;
      if Assigned(FOnGetTabSheetEv) then
        FOnGetTabSheetEv(Self, fiClass, fiInstance.FTabSheet);
      if fiInstance.FTabSheet = nil then begin
        fiInstance.FTabSheet := TcxTabSheet.Create(Self.Owner);
        fiInstance.FTabSheet.PageControl := FPageControl;
        fiInstance.FTabSheet.Caption := fiInstance.Descricao;
      end;
      fiInstance.panPri.Parent := fiInstance.FTabSheet;
      if not ARefreshLater then begin
        fiInstance.FiltraDados;
        fiInstance.AtualizaDireitos;
      end;
      
      if fiRibTab<>nil then 
        AddBotoesTabSheet(fiInstance, fiRibTab);
      fiInstance.ParentChanged;
    end;
  
    SetFormAtivo(FI^.fiInstance);
    FFormAtivo.FTabSheet.TabVisible := True;
//    AdicionaBotoesComuns;
  
    FPageControl.ActivePage := FFormAtivo.FTabSheet;  
  finally
    FBarMgr.LockUpdate := False;
  end;  

end;

procedure TFormManager.Mostrar(AClass: TFrmBaseClass; AOperID: Integer; AFiltro: Variant; ARefreshLater: Boolean = False);
var 
  FI : PfmFormInfo;
begin
  if (FFormAtivo<>nil) and 
     (FFormAtivo.ClassType = AClass) and 
     (FFormAtivo.Operacao=AOperID) and
     (FFormAtivo.Filtro=AFiltro) then Exit;

  FI := FormByClass(AClass);

  if FI=nil then
    Raise Exception.Create(SClasse + AClass.ClassName + SNãoRegistrada);

  FBarMgr.LockUpdate := True;
  try  
  
    if (FFormAtivo <> nil) and (FFormAtivo.ClassType <> AClass) then
      Desativar(TFrmBaseClass(FFormAtivo.ClassType));
  
    with FI^ do
    if fiInstance = nil then begin
      fiInstance := AClass.Create(Self.Owner);
      fiInstance.FFormMgr := Self;
      if Assigned(FOnGetTabSheetEv) then
        FOnGetTabSheetEv(Self, fiClass, fiInstance.FTabSheet);
      if not Assigned(FOnGetTabSheetEv) then begin
        fiInstance.FTabSheet := TcxTabSheet.Create(Self.Owner);
        fiInstance.FTabSheet.PageControl := FPageControl;
        fiInstance.FTabSheet.Caption := fiInstance.Descricao;
      end;
      fiInstance.panPri.Parent := fiInstance.FTabSheet;
      fiInstance.ParentChanged;
      fiInstance.Operacao := AOperID;
      fiInstance.Filtro := AFiltro;
      fiInstance.AtualizaDireitos;
      if (not ARefreshLater) and (fiInstance.Filtro=null) then
        fiInstance.FiltraDados;
        
      if fiRibTab<>nil then
        AddBotoesTabSheet(fiInstance, fiRibTab);
      // Cria bars tabsheet
    end;
    SetFormAtivo(FI^.fiInstance);
    FFormAtivo.FTabSheet.TabVisible := True;
    FFormAtivo.Operacao := AOperID;
    FFormAtivo.Filtro := AFiltro;
//    AdicionaBotoesComuns;
  
    FPageControl.ActivePage := FFormAtivo.FTabSheet;  
  finally
    FBarMgr.LockUpdate := False;
  end;  
end;

{procedure TFormManager.AdicionaBotoesComuns;
var 
  F, D: TdxBar;
  I : Integer;
begin
  if FormAtivo=nil then Exit;
  D := FBarMgr.BarByOldName(barComum);
  if D = nil then Exit;
  F := FFormAtivo.BarMgr.BarByOldName(barComum);
  if F = nil then Exit;
  D.LockUpdate := True;
  try
    for I := 0 to F.ItemLinks.Count-1 do 
      if not D.ItemLinks.HasItem(F.ItemLinks[I].Item) then with D.ItemLinks.Add do begin
        Assign(F.ItemLinks[I]);
        if I=0 then
          BeginGroup := True;
      end;  
  finally
    D.LockUpdate := False;
  end;  
end; }

procedure TFormManager.AllParentChanged;
var I : Integer;
begin
  for I := 0 to Count-1 do with Forms[I]^ do
  if fiInstance<>nil then
    fiInstance.ParentChanged;
end;

procedure TFormManager.RemoveBotoesComuns;
var 
  B: TdxBar;
  I : Integer;
begin
  if FFormAtivo=nil then Exit;
  B := FBarMgr.BarByOldName(barComum);
  if B = nil then Exit;
  B.LockUpdate := True;
  try
    for I := B.ItemLinks.Count-1 downto 0 do 
      if B.ItemLinks[I].Item.Owner = FFormAtivo then
      try
        B.ItemLinks[I].Free;
      except
      end;   
  finally
    B.LockUpdate := False;
  end;  
end;

procedure TFormManager.AddBotoesTabSheet(AForm: TFrmBase; aRibTab: TdxRibbonTab);
var 
  F, D: TdxBar;
  I : Integer;
begin
  if AForm = nil then Exit;
  
  for I := 0 to pred(AForm.BarMgr.Bars.Count) do 
  if AForm.ToolbarIsRibbonGroup(AForm.BarMgr.Bars[I]) then begin
    F := AForm.BarMgr.Bars[I];
    
    D := FBarMgr.Bars.Add;
    D.Name := 'bar' + AForm.ClassName + barTabSheet + IntToStr(I); // do not localize
    D.UseRecentItems := False;
    D.UseRestSpace := True;
    D.Assign(F);
    D.BorderStyle := bbsSingle;
    aRibTab.AddToolBar(D);
    D.Visible := True;

    F.Visible := False;
  end;  
end;

procedure TFormManager.RemoveBotoesTabSheet(AForm: TFrmBase);
var 
  //B : TdxBar;
  S : String;
  I : Integer;
begin  
  if AForm = nil then Exit;
  S := 'bar' + AForm.ClassName + barTabSheet; // do not localize
  with FBarMgr.Bars do
  for I := Count-1 downto 0 do 
    if Pos(S, Items[I].Name)=1 then
      Items[I].Free;
end;

procedure TFormManager.GetStringsForm(ST: TStrings);
var I : Integer;
begin
  ST.Clear;
  for I := 0 to Count-1 do with Forms[I]^ do
    ST.AddObject(fiClass.ClassName+'='+fiClass.Descricao, TObject(Integer(fiClass)));
end;

function TFormManager.ClassByName(AClassName: String): PFrmBaseClass;
var I : Integer;
begin
  Result := nil;
  for I := 0 to Count-1 do with Forms[I]^ do
    if fiClass.ClassName = AClassName then begin
      Result := @fiClass;
      Exit;
    end;  
end;

procedure TFormManager.SetFormAtivo(AInstance: TFrmBase);
begin
  if AInstance<>FFormAtivo then begin
    FFormAtivo := AInstance;
    if (FFormAtivo<>nil) then 
      FFormAtivo.AtualizaDireitos;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;    
end;

procedure TFormManager.AtualizaDireitos;
var I : Integer;
begin
  for I := 0 to Count-1 do 
    if Forms[I]^.fiInstance<>nil then
      Forms[I]^.fiInstance.AtualizaDireitos;
end;

procedure TFormManager.MostrarTab(AClass: TFrmBaseClass);
var 
  FI : PfmFormInfo;
begin
  FI := FormByClass(AClass);
  if FI = nil then
    Raise Exception.Create(SClasse + AClass.ClassName + SNãoRegistrada);
  FBarMgr.LockUpdate := True;
  try  
    with FI^ do
    if fiInstance = nil then begin
      fiInstance := fiClass.Create(Self.Owner);
      fiInstance.FFormMgr := Self;
      if Assigned(FOnGetTabSheetEv) then
        FOnGetTabSheetEv(Self, fiClass, fiInstance.FTabSheet);
      if not Assigned(FOnGetTabSheetEv) then begin
        fiInstance.FTabSheet := TcxTabSheet.Create(Self.Owner);
        fiInstance.FTabSheet.PageControl := FPageControl;
        fiInstance.FTabSheet.Caption := fiInstance.Descricao;
      end;
      fiInstance.panPri.Parent := fiInstance.FTabSheet;
      fiInstance.ParentChanged;
      fiInstance.AtualizaDireitos;
      if fiRibTab<>nil then
        AddBotoesTabSheet(fiInstance, fiRibTab);
      // Cria bars tabsheet
    end else
      fiInstance.TabSheet.TabVisible := True;
    FPageControl.ActivePage := FI^.fiInstance.FTabSheet;
  finally
    FBarMgr.LockUpdate := False;
  end;  
end;

procedure TFormManager.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (AComponent=fPageControl) and (Operation=opRemove) then
    FPageControl := nil;
  if (AComponent=FRibbon) and (Operation=opRemove) then
    FRibbon := nil;  
end;

{ TFrmBase }
procedure TFrmBase.BeforeDestruction;
begin
  inherited;
  if FFormMgr<>nil then
    FFormMgr.FormDestroyed(Self); 
end;

function TFrmBase.GetDataset: TDataset;
var I : Integer;
begin
  for I := 0 to ComponentCount-1 do 
  if Components[I] is TDataset then begin
    Result := TDataset(Components[I]);
    Exit;
  end;  
  Result := nil;
end;

function TFrmBase.GetDataSource: TDataSource;
var I : Integer;
begin
  for I := 0 to ComponentCount-1 do 
  if Components[I] is TDataSource then begin
    Result := TDataSource(Components[I]);
    Exit;
  end;  
  Result := nil;
end;

function TFrmBase.GetGrid: TcxGrid;
var I : Integer;
begin
  for I := 0 to ComponentCount-1 do
  if Components[I] is TcxGrid then begin
    Result := TcxGrid(Components[I]);
    Exit;
  end;  
  Result := nil;
end;

function TFrmBase.GetGrids: TGridArray;
var I, T: Integer;
begin
  SetLength(Result, 0); T := 0;
  for I := 0 to ComponentCount-1 do 
  if Components[I] is TcxGrid then begin
    SetLength(Result, T+1);
    Result[T] := TcxGrid(Components[I]);
    Inc(T);
  end;  
end;

class function TFrmBase.GetOperacoes(AIDOper: Integer;
  var ADescricao: String): Boolean;
begin
  if AIDOper=0 then begin
    ADescricao := SMostrar;
    Result := True;
  end else
    Result := False;  
end;

{function TFrmBase.GetPGrid: TcxCustomPivotGrid;
var I : Integer;
begin
  for I := 0 to ComponentCount-1 do 
  if Components[I] is TcxCustomPivotGrid then begin
    Result := TcxCustomPivotGrid(Components[I]);
    Exit;
  end;  
  Result := nil;
end;}

class procedure TFrmBase.GetStringsOperacoes(ST: TStrings);
var 
  I : Integer;
  S : String;
begin
  ST.Clear;
  I := 0;
  while GetOperacoes(I, S) do 
    ST.Add(S);
end;

function TFrmBase.IncludeGridNameLayout: Boolean;
begin
  Result := False;
end;

procedure TFrmBase.ParentChanged;
//var P: TcxCustomPivotGrid;
var 
  G: TGridArray;
  I: Integer;
begin
  GridClassName_IncludeGridName := IncludeGridNameLayout;
  
  G := GetGrids;
  for I := 0 to High(G) do
    LeLayoutProc(G[i], 'usuario');  // do not localize
end;

procedure TFrmBase.AfterConstruction;
var 
  G: TGridArray; I: Integer;
//  P: TcxCustomPivotGrid;
begin
  inherited;
  FFiltro := Null;
  G := GetGrids;
  GridClassName_IncludeGridName := IncludeGridNameLayout;
  
  for I := 0 to High(G) do begin
    SalvaLayoutProc(G[i], 'padrao'); // do not localize
    LeLayoutProc(G[i], 'usuario'); // do not localize
  end;
{  if (G<>nil) then begin
    MenuGrid.Grid := G;
    SalvaLayoutProc(G, 'padrao');
    LeLayoutProc(G, 'usuario');
  end;}
  
  FTabSheet := nil;
  FFormMgr  := nil;
  FDataI := Date;
  FDataF := FDataI + 0.999999999;
{  if cmLayout.LinkCount>0 then begin
    with cmLayout.ItemLinks.Add do begin
      if cmLayout.ItemLinks.Count > 1 then
        BeginGroup := True;
      Item := cmLayCustomize;
    end;  
    cmLayout.ItemLinks.Add.Item := cmLaySalvar;
    cmLayout.ItemLinks.Add.Item := cmLayRestaurar;
  end;}
end;

procedure TFrmBase.SetOperacao(const Value: Integer);
begin
  FOperacao := Value;
end;

function TFrmBase.ToolbarIsRibbonGroup(aBar: TdxBar): Boolean;
begin
  Result := False;
end;

procedure TFrmBase.wmAtualizaDireitosConfig(var Msg: TMessage);
begin
  AtualizaDireitos;
end;

procedure TFrmBase.FiltraDados;
begin
  // ----------
end;

procedure TFrmBase.FrmBasePaiCreate(Sender: TObject);
begin
  FOperacao := 0;
  FFiltro := null;
  
end;

procedure TFrmBase.cmHojeClick(Sender: TObject);
begin
  FDataI := Date;
  FDataF := FDataI + 0.999999999;
  cmPeriodo.Caption := SPeríodoHoje;
  FiltraDados;
end;

procedure TFrmBase.cmEstaSemanaClick(Sender: TObject);
begin
  FDataI := Date - (DayOfWeek(Date)-1);
  FDataF := Date + 0.999999999;
  cmPeriodo.Caption := SPeríodoEstaSemana;
  FiltraDados;
end;

procedure TFrmBase.cmEsteMesClick(Sender: TObject);
var D, M, Y : Word;
begin
  FDataF := Date + 0.999999999;
  DecodeDate(Date, Y, M, D);
  FDataI := EncodeDate(Y, M, 1);
  cmPeriodo.Caption := SPeríodoEsteMês;
  FiltraDados;
end;

procedure TFrmBase.cmEsteAnoClick(Sender: TObject);
var D, M, Y : Word;
begin
  FDataF := Date + 0.999999999;
  DecodeDate(Date, Y, M, D);
  FDataI := EncodeDate(Y, 1, 1);
  cmPeriodo.Caption := SPeríodoEsteAno;
  FiltraDados;
end;

procedure TFrmBase.cmTudoClick(Sender: TObject);
begin
  FDataI := 1;
  FDataF := EncodeDate(3000, 1, 1);
  cmPeriodo.Caption := SPeríodoTudo;
  FiltraDados;
end;

procedure TFrmBase.cmDigitarPeriodoClick(Sender: TObject);
begin
  if TFrmPeriodo.Create(Self).ObtemPeriodo(FDataI, FDataF) then begin
    cmPeriodo.Caption := SPeríodo + FormatDateTime(SDdMmYyyyHhMm, FDataI) + ' a ' +
                                       FormatDateTime(SDdMmYyyyHhMm, FDataF);
    FiltraDados;
  end;  
end;

procedure TFrmBase.cmLayRestaurarClick(Sender: TObject);
var 
  G: TcxGrid;
//  P: TcxCustomPivotGrid;
begin
  GridClassName_IncludeGridName := IncludeGridNameLayout;

  G := GetGrid;
  try
    if (G<>nil) then 
      LeLayoutProc(G, 'padrao') // do not localize
    else begin
  {    P := GetPGrid;
      if P<>nil then
        LeLayoutProc(P, 'padrao');}
    end;
  finally
    AtualizaDireitos;
  end;
end;

procedure TFrmBase.cmLaySalvarClick(Sender: TObject);
var 
  G: TcxGrid;
//  P: TcxCustomPivotGrid;
begin
  GridClassName_IncludeGridName := IncludeGridNameLayout;
  
  G := GetGrid;
  if (G<>nil) then 
    SalvaLayoutProc(G, 'usuario') // do not localize
  else begin
  {  P := GetPGrid;
    SalvaLayoutProc(P, 'usuario');}
  end;
end;

procedure TFrmBase.cmLayCustomizeClick(Sender: TObject);
//var P: TcxCustomPivotGrid;
begin
  if GetGrid<>nil then begin
    with TcxGridTableController(GetGrid.Views[0].Controller) do 
      Customization := not Customization;
  end else begin
{    P := GetPGrid;
    if P<>nil then
      P.Customization.Visible := not P.Customization.Visible;}
  end;
end;

procedure TFrmBase.SetFiltro(const Value: Variant);
begin
  if Value <> FFiltro then begin
    FFiltro := Value;
    FiltraDados;
  end;  
end;

procedure TFrmBase.cmAtualizarClick(Sender: TObject);
begin
  FiltraDados;
end;

procedure TFrmBase.cmImprimirClick(Sender: TObject);
var 
  G: TcxGrid;
  Link : TBasedxReportLink;
begin
  G := GetGrid;
  if G=nil then Exit;
  Link := CP.LinkByName('cpl'+G.Name); // do not localize
  if Link=nil then begin
    Link := CP.AddLink(G);
    Link.Name := 'cpl'+G.Name; // do not localize
  end;
  CP.Preview(True, Link);
end;

procedure TFrmBase.ClearFM;
var I : Integer;
begin
  for I := ComponentCount-1 downto 0 do 
  if Components[I] is TFormManager then 
    TFormManager(Components[I]).Clear;
end;

procedure TFrmBase.AjustaLayoutLargeButton(B: TdxBarLargeButton);
begin
  Exit;
  B.ShowCaption := MostrarTextoBotoes;
  B.GlyphLayout := glTop;
end;

procedure TFrmBase.AtualizaDireitos;
var I : Integer;
begin
  try
    dxBarDockControl1.SunkenBorder := True;
    if BarMgr.Bars.Count>0 then
      BarMgr.Bars[0].BorderStyle := bbsSingle;
  except
  end;
  
  for I := ComponentCount-1 downto 0 do 
  if Components[I] is TFormManager then 
    TFormManager(Components[I]).AtualizaDireitos
  else
  if Components[I] is TdxBarLargeButton then 
    AjustaLayoutLargeButton(TdxBarLargeButton(Components[I]));
end;

procedure TFrmBase.cmExportarClick(Sender: TObject);
const
  Exts: Array[1..3] of String = ('xls', 'htm', 'txt');
begin
  if GetGrid=nil then Exit;
  if Pos('.', dlgExp.FileName)>0 then
    dlgExp.FileName := Copy(dlgExp.FileName, 1, Pos('.', dlgExp.FileName)-1);

  if not (dlgExp.FilterIndex in [1..3]) then
    dlgExp.FilterIndex := 1;
  
  if dlgExp.Execute and (dlgExp.FileName <> '') then begin
    if Pos('.', dlgExp.FileName)=0 then
      dlgExp.FileName := dlgExp.FileName + '.' + Exts[dlgExp.FilterIndex];
    case dlgExp.FilterIndex of
      1: ExportGridToExcel(dlgExp.FileName, GetGrid);
      2: ExportGridToHtml(dlgExp.FileName, GetGrid);
      3: ExportGridToText(dlgExp.FileName, GetGrid);
    end;
  end;
end;

procedure TFrmBase.cmLayoutClick(Sender: TObject);
var P : TPoint;
begin
  P := ItemLinkScreenPoint(cmLayout.ClickItemLink);
  pmLay.Popup(P.X, P.Y);
end;

procedure TFrmBase.cmPeriodoClick(Sender: TObject);
var P: TPoint;
begin
  P := ItemLinkScreenPoint(cmPeriodo.ClickItemLink);
  pmPeriodo.Popup(P.X, P.Y);
end;

procedure TFrmBase.cmUltimas24hClick(Sender: TObject);
begin
  FDataI := Now-1;
  FDataF := Now;
  cmPeriodo.Caption := PeriodoStr+': '+cmUltimas24h.Caption;
  FiltraDados;
end;

procedure TFrmBase.CloseDatasets;
//var G : TcxGrid;
begin
  {G := }GetGrid;
end;


initialization
  LeLayoutProc := LeLayoutDef;
  SalvaLayoutProc := SalvaLayoutDef;
  MostrarTextoBotoes := False;

end.

