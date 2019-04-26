unit ncafbMaq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, cxGrid,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxControls, cxPC, cxClasses, OleCtrls, SHDocVw_EWB, EwbCore,
  EmbeddedWB, cxContainer, cxEdit, cxLabel, ncaFrmWebTab;

type
  TfbMaq = class(TFrmBase)
    Paginas: TcxPageControl;
    FM: TFormManager;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure FMPageControlChange(Sender: TObject);
    procedure PaginasDrawTabEx(AControl: TcxCustomTabControl; ATab: TcxTab;
      Font: TFont);
  private
    { Private declarations }
  public
    function  GetGrid: TcxGrid; override;

    procedure AddWebTab(S: String);
    
    procedure AtualizaDireitos; override;
    procedure FiltraDados; override;
    procedure REfreshBotoes;
    procedure RefreshCacheMaq;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbMaq: TfbMaq;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncafbMaquinas, 
  ncafbMaqConfig, 
  ncafbPrevSessao,
  ncaFrmMaq, ncClassesBase;

{$R *.dfm}

{ TFrmBase1 }

procedure TfbMaq.AddWebTab(S: String);
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

  aCaption := GetNextStrDelim(S, '=');
  if aCaption='' then Exit;

  aUrl := GetNextStrDelim(S, ',');
  if aUrl = '' then Exit;

  aFontBold := StringToBool(GetNextStrDelim(S, ','));
  aFontCor := StrToIntDef(GetNextStrDelim(S, ','), clBlack);

  aparamConta := StringToBool(GetNextStrDelim(S, ','));
  aparamAdmin := StringToBool(GetNextStrDelim(S, ','));
  aShowAddress := StringToBool(GetNextStrDelim(S, ','));
  aShowToolbar := StringToBool(GetNextStrDelim(S, ','));
  aShowURL := StrToIntDef(GetNextStrDelim(S, ','), suNao);

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
    F.panPri.Parent := T;
    T.Caption := aCaption;
    T.Tag := Integer(F);
    T.PageControl := Paginas;
    
    F.Navigate;
  except
    if F<>nil then F.Free;
    if T<>nil then T.Free;
  end;
end;

procedure TfbMaq.AtualizaDireitos;
begin
  inherited;
  if FM.FormAtivo<>nil then
    FM.FormAtivo.AtualizaDireitos;
end;

class function TfbMaq.Descricao: String;
begin
  Result := 'Tarifas';
end;

procedure TfbMaq.FiltraDados;
begin
  inherited;
  if Assigned(FM.FormAtivo) then 
    FM.FormAtivo.FiltraDados;
end;

procedure TfbMaq.FMPageControlChange(Sender: TObject);
begin
  inherited;
  Dados.mtMaquina.Filtered := (Paginas.ActivePageIndex=2) or SameText(slConfig.Values['RemoveAddMaq'], 'S');
  if FM.Count>1 then
  try
    TfbPrevSessao(FM.Forms[1]^.fiInstance).Timer1.Enabled := (Paginas.ActivePageIndex=1);
  except
  end;
end;

procedure TfbMaq.FrmBasePaiCreate(Sender: TObject);
begin
  BarMgr.Bars[0].Free;
  FM.RegistraForm(TfbMaquinas);
  FM.RegistraForm(TfbPrevSessao);
  FM.RegistraForm(TfbMaqConfig);
  FM.Mostrar(TfbMaquinas);
  FM.Mostrar(TfbPrevSessao);
  FM.Mostrar(TfbMaqConfig);
  Paginas.ActivePageIndex := 0;
end;

procedure TfbMaq.FrmBasePaiDestroy(Sender: TObject);
begin
  FM.Clear;
  inherited;
end;

function TfbMaq.GetGrid: TcxGrid;
begin
  if FM.FormAtivo<>nil then
    Result := FM.FormAtivo.GetGrid;
end;

procedure TfbMaq.PaginasDrawTabEx(AControl: TcxCustomTabControl; ATab: TcxTab;
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

procedure TfbMaq.REfreshBotoes;
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if (F is TfbMaquinas) then
    TfbMaquinas(F).RefreshBotoes;
end;

procedure TfbMaq.RefreshCacheMaq;
var
  FI : PfmFormInfo;
begin
  FI := FM.FormByClass(TfbMaquinas);
  if (FI <> nil) and (FI^.fiInstance<>nil) then
    TfbMaquinas(FI^.fiInstance).RefreshCacheMaq;
end;

end.
 