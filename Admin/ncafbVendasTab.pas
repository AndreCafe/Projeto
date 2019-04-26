unit ncafbVendasTab;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, cxGrid,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxControls, cxPC, cxClasses, OleCtrls, SHDocVw_EWB, EwbCore,
  EmbeddedWB, cxContainer, cxEdit, cxLabel, ncaFrmWebTab, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  cxPCdxBarPopupMenu, dxPScxGridLnk, dxPScxGridLayoutViewLnk, 
  dxPScxPivotGridLnk, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TfbVendasTab = class(TFrmBase)
    Paginas: TcxPageControl;
    FM: TFormManager;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure PaginasDrawTabEx(AControl: TcxCustomTabControl; ATab: TcxTab;
      Font: TFont);
  private
    { Private declarations }
  public
    function  GetGrid: TcxGrid; override;

    function FindWebTab(aTitulo: String): TFrmWebTab;

    function CriaWebTab(aTitulo, aUrl: String): TFrmWebTab;

    procedure AddWebTab(S: String);

    procedure OpenRefreshWebTab(aTitulo, aUrl: String);
    
    procedure AtualizaDireitos; override;
    procedure FiltraDados; override;
    procedure REfreshBotoes;
    procedure RefreshCacheMaq;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbVendasTab: TfbVendasTab;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncafbMesas,
  ncafbVendas2,
  ncClassesBase, ufmImagens;

// START resource string wizard section
resourcestring
  STarifas = 'Tarifas';

// END resource string wizard section


{$R *.dfm}

{ TFrmBase1 }

procedure TfbVendasTab.AddWebTab(S: String);
var 
  aCaption, aUrl : String;
  aFontBold : Boolean;
  aFontCor : TColor;
  aparamConta : Boolean;
  aparamAdmin : Boolean;
  ashowAddress : Boolean;
  ashowToolbar : Boolean;
  ashowURL     : Byte;
  p : Integer;
  T : TcxTabSheet;
  F : TFrmWebTab;
begin
  p := Pos('=', S);
  if p=0 then Exit;

  aCaption := GetNextStrDelimCustom(S, '=');
  if aCaption='' then Exit;

  aUrl := GetNextStrDelimCustom(S, ',');
  if aUrl = '' then Exit;

  aFontBold := StringToBool(GetNextStrDelimCustom(S, ','));
  aFontCor := StrToIntDef(GetNextStrDelimCustom(S, ','), clBlack);

  aparamConta := StringToBool(GetNextStrDelimCustom(S, ','));
  aparamAdmin := StringToBool(GetNextStrDelimCustom(S, ','));
  aShowAddress := StringToBool(GetNextStrDelimCustom(S, ','));
  aShowToolbar := StringToBool(GetNextStrDelimCustom(S, ','));
  aShowURL := StrToIntDef(GetNextStrDelimCustom(S, ','), suNao);

  F := nil;
  T := nil;

  T := TcxTabSheet.Create(Self);
  try
    F := TFrmWebTab.Create(T);
    F.Caption := aCaption;
    F.URL := aURL;
    F.FontBold := aFontBold;
    F.FontCor := aFontCor;
    F.paramConta := aparamConta;
    F.paramAdmin := aparamAdmin;
    F.showAddress := aShowAddress;
    F.showToolbar := aShowToolbar;
    F.showURL := aShowURL;
    F.RefreshParams;
    F.Paginas.Parent := T;
    T.Caption := aCaption;
    T.Tag := Integer(F);
    T.PageControl := Paginas;
    
    F.NavegaURL;
  except
    if F<>nil then F.Free;
    if T<>nil then T.Free;
  end;
end;

procedure TfbVendasTab.AtualizaDireitos;
begin
  inherited;
  if FM.FormAtivo<>nil then
    FM.FormAtivo.AtualizaDireitos;
end;

function TfbVendasTab.CriaWebTab(aTitulo, aUrl: String): TFrmWebTab;
var T: TcxTabSheet;
begin
  T := nil;
  Result := nil;

  T := TcxTabSheet.Create(Self);
  try
    Result := TFrmWebTab.Create(T);
    Result.Caption := aTitulo;
    T.Caption := aTitulo;
    Result.URL := aURL;
    Result.showURL := suNao;
    Result.RefreshParams;
    Result.Paginas.Parent := T;
    Result.Caption := aTitulo;
    T.Tag := Integer(Result);
    T.PageControl := Paginas;
  except
    if Result<>nil then Result.Free;
    if T<>nil then T.Free;
  end;
end;

class function TfbVendasTab.Descricao: String;
begin
  Result := STarifas;
end;

procedure TfbVendasTab.FiltraDados;
begin
  inherited;
  if Assigned(FM.FormAtivo) then 
    FM.FormAtivo.FiltraDados;
end;

function TfbVendasTab.FindWebTab(aTitulo: String): TFrmWebTab;
var I : Integer;
begin
  for I := 0 to Paginas.PageCount-1 do 
    with Paginas.Pages[I] do 
      if (Tag<>0) and SameText(Caption, aTitulo) then begin
        Result := TFrmWebTab(Tag);
        Exit;
      end;
  Result := nil;
end;

procedure TfbVendasTab.FrmBasePaiCreate(Sender: TObject);
begin
  BarMgr.Bars[0].Free;
  FM.RegistraForm(TfbMesas);
  FM.RegistraForm(TfbVendas2);
  FM.Mostrar(TfbMesas);
  FM.Mostrar(TfbVendas2);
  Paginas.ActivePageIndex := 0;
end;

procedure TfbVendasTab.FrmBasePaiDestroy(Sender: TObject);
begin
  FM.Clear;
  inherited;
end;

function TfbVendasTab.GetGrid: TcxGrid;
begin
  if FM.FormAtivo<>nil then
    Result := FM.FormAtivo.GetGrid;
end;

procedure TfbVendasTab.OpenRefreshWebTab(aTitulo, aUrl: String);
var F: TFrmWebTab;
begin
  F := FindWebTab(aTitulo);
  if F=nil then 
    F := CriaWebTab(aTitulo, aUrl) else
    F.URL := aURL;
  Paginas.ActivePage := TcxTabSheet(F.Paginas.Parent);
  try F.NavegaURL; except end;
end;

procedure TfbVendasTab.PaginasDrawTabEx(AControl: TcxCustomTabControl; ATab: TcxTab;
  Font: TFont);
var
  T: TcxTabSheet; 
  F: TFrmWebTab; 
begin
  inherited;
  T := Paginas.Pages[ATab.Index];
  if (T<>nil) and (T.Tag<>0) then begin
    F := TFrmWebTab(T.Tag);
    if F.FontBold then 
      Font.Style := [fsBold];
    Font.Color := F.FontCor;  
  end;
end;

procedure TfbVendasTab.REfreshBotoes;
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if (F is TfbMesas) then
    TfbMesas(F).RefreshBotoes;
end;

procedure TfbVendasTab.RefreshCacheMaq;
var
  FI : PfmFormInfo;
begin
  FI := FM.FormByClass(TfbMesas);
  if (FI <> nil) and (FI^.fiInstance<>nil) then
    TfbMesas(FI^.fiInstance).RefreshCacheMaq;
end;

end.
 
 
