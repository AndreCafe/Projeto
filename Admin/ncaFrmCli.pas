unit ncaFrmCli;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPCdxBarPopupMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles, cxClasses, dxBar,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  StdCtrls, cxRadioGroup, LMDPNGImage, ExtCtrls, cxTextEdit, cxPC, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxLabel,
  cxButtonEdit, Menus, SpTBXFormPopupMenu, SpTBXItem, SpTBXControls, ncaFrmCliPesq,
  dxBarExtItems, uNexTransResourceStrings_PT, dxBarBuiltInMenu;

type
  TFrmCli = class(TForm)
    panCliente: TLMDSimplePanel;
    panFoto: TLMDSimplePanel;
    pgFoto: TcxPageControl;
    tsFotoCad: TcxTabSheet;
    imFoto: TImage;
    tsFotoAvulso: TcxTabSheet;
    imFotoAvulso: TImage;
    BarMgr: TdxBarManager;
    cmBuscar: TdxBarSubItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    barBotoes: TdxBar;
    cmNome: TdxBarButton;
    cmUsername: TdxBarButton;
    cmCod: TdxBarButton;
    cmNovo: TdxBarButton;
    cmEditar: TdxBarButton;
    pmCli: TSpTBXFormPopupMenu;
    Timer1: TTimer;
    Timer2: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    panTopo: TLMDSimplePanel;
    pgCli: TcxPageControl;
    tsCliCad: TcxTabSheet;
    panCad: TLMDSimplePanel;
    panEditCad: TLMDSimplePanel;
    tsAvulso: TcxTabSheet;
    edAvulso: TcxTextEdit;
    lbAvulso: TcxLabel;
    tsFunc: TcxTabSheet;
    lbFunc: TcxLabel;
    lbComCad: TcxLabel;
    lbSemCad: TcxLabel;
    Timer3: TTimer;
    edCad: TcxButtonEdit;
    lbNome: TcxLabel;
    panBotoes: TLMDSimplePanel;
    panDockLupa: TLMDSimplePanel;
    bdcBotoes: TdxBarDockControl;
    cxLabel1: TcxLabel;
    edFunc: TcxTextEdit;
    panCliInfo: TLMDSimplePanel;
    lbDebito: TcxLabel;
    lbBuscar: TcxLabel;
    cmFornecedor: TdxBarStatic;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmNomeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edCadEnter(Sender: TObject);
    procedure edCadPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edCadPropertiesChange(Sender: TObject);
    procedure edCadKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCadKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pmCliPopup(Sender: TObject);
    procedure pmCliClosePopup(Sender: TObject; Selected: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure lbSemCadClick(Sender: TObject);
    procedure lbComCadFocusChanged(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure cmFornecedorClick(Sender: TObject);
    procedure edCadExit(Sender: TObject);
    procedure imFotoClick(Sender: TObject);
  private
    FSaveSt: String;
    FPopped : Boolean;
    FPesq : TFrmCliPesq;
    FCliCad : Integer;
    FOrdemCli : Byte;
    FIgnoreChange: Boolean;
    FFornecedor : Boolean;
    FTipo : Byte;
    FOnMudouCliente : TNotifyEvent;
    FFirstCliEnter : Boolean;
    FReadOnly : Boolean;
    
    
    
    { Private declarations }
    
    procedure UpdateOrdemCliCad;
    procedure UpdateCliCadInfo(aUpdateEdit: Boolean = False);
    procedure SetCliCad(const Value: Integer);
    procedure SetOrdemCli(const Value: Byte);
    procedure SetFornecedor(const Value: Boolean);
    procedure SetTipo(const Value: Byte);
    procedure SetReadOnly(const Value: Boolean);

    property OrdemCli: Byte
      read FOrdemCli write SetOrdemCli;
  public
    procedure UpdateCliCadEdit(aSelectAll: Boolean);

    procedure Reset;

    procedure Init(aFornecedor, aShowFunc: Boolean; aCodigo: Integer; aNome, aNomeFunc: String; aTipo: Byte; aParent: TWinControl);

    function Codigo: Integer;
    function FidPontos: Double;
    function Nome: String;

    property Pesq: TFrmCliPesq 
      read FPesq;

    function TipoAcessoPref: Integer;

    property ReadOnly: Boolean
      read FReadOnly write SetReadOnly;

    property Tipo: Byte
      read FTipo write SetTipo;

    property OnMudouCliente: TNotifyEvent
      read FOnMudouCliente write FOnMudouCliente;  

    property IgnoreChange: Boolean
      read FIgnoreChange;

    property Popped: Boolean
      read FPopped;  

    property Fornecedor: Boolean
      read FFornecedor write SetFornecedor;  
    
    property CliCad: Integer
      read FCliCad write SetCliCad;
    { Public declarations }
  end;

  TFrmCliList = class
  private
    FItens : TThreadList;
  public
    constructor Create;
    destructor Destroy; override;

    function GetFrm: TFrmCli;
    procedure ReleaseFrm(aFrm: TFrmCli);  
  end;

const
  tcComCad = 0;
  tcSemCad = 1;  
  tcFunc   = 2;

var
  FrmCli: TFrmCli;
  gCliList : TFrmCliList;

  

implementation

uses ncaFrmPri, ufmImagens, ncaFrmCadCli, ncaDM, ncClassesBase;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

procedure TFrmCli.cmEditarClick(Sender: TObject);
begin
  if FFornecedor then begin
    FPesq.cmEditarClick(nil);
    Exit;
  end;

  FPesq.Tab.CancelRange;
  TFrmCadCli.Create(Self).Editar(FPesq.Tab, nil);
  UpdateCliCadInfo(True);
  Dados.tbCli.Refresh;
  Dados.tbCli.Locate('ID', FPesq.TabID.Value, []); // do not localize
end;

procedure TFrmCli.cmFornecedorClick(Sender: TObject);
begin
  edCad.SetFocus;
end;

procedure TFrmCli.cmNomeClick(Sender: TObject);
begin
  cmBuscar.Caption := TdxBarButton(Sender).Caption+':';
  OrdemCli := TdxBarButton(Sender).Tag;
  edCad.SetFocus;
end;

procedure TFrmCli.cmNovoClick(Sender: TObject);
var I : Integer;
begin
  if FFornecedor then begin
    FPesq.cmNovoClick(nil);
    Exit;
  end;
  FPesq.Tab.CancelRange;
  I := TFrmCadCli.Create(Self).Novo(FPesq.Tab, nil);
  if I > 0 then begin
    CliCad := I;
    edCad.SetFocus;
    Self.UpdateCliCadEdit(True);
    Dados.tbCli.Refresh;
    Dados.tbCli.Locate('ID', FPesq.TabID.Value, []); // do not localize
  end;
end;

function TFrmCli.Codigo: Integer;
begin
  if FTipo=0 then
    Result := FCliCad else
    Result := 0;
end;

procedure TFrmCli.edCadEnter(Sender: TObject);
begin
  if FFirstCliEnter then Timer1.Enabled := True;
  FFirstCliEnter := False;
  Timer2.Enabled := True;
  panEditCad.Color := $00B3FFFF;
  barBotoes.Color := $00B3FFFF;
end;

procedure TFrmCli.edCadExit(Sender: TObject);
begin
  panEditCad.Color := clWhite;
  barBotoes.Color := clWhite;
end;

procedure TFrmCli.edCadKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FSaveSt := edCad.EditingText;
end;

procedure TFrmCli.edCadKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (edCad.EditingText <> FSaveSt) and (not FPopped) then Timer1.Enabled := True;
  FPesq.edBuscaKeyUp(Sender, Key, Shift);
end;

procedure TFrmCli.edCadPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Timer1.Enabled := True;
end;

procedure TFrmCli.edCadPropertiesChange(Sender: TObject);
begin
  if edCad.Focused and (not FIgnoreChange) then
    FPesq.edBusca.EditValue := edCad.EditingText;
end;

function TFrmCli.FidPontos: Double;
begin
  if Codigo>0 then 
    Result := FPesq.TabFidPontos.Value else
    Result := 0;
end;

procedure TFrmCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCli.Reset;
begin
  if GShutingdown then exit;

  FIgnoreChange := True;
  try
    panCliente.Parent := Self;
    FFirstCliEnter := True;
    FOnMudouCliente := nil;
    FOrdemCli := 99;
    FCliCad := 0;
    FPopped := False;
    ReadOnly := False;
    FPesq.Reset;
    edCad.Clear;
    edAvulso.Clear;
    edFunc.Clear;
    OrdemCli := gConfig.CampoLocalizaCli;
    tsCliCad.TabVisible := True;
    tsAvulso.TabVisible := True;
    tsFunc.TabVisible := True;
    lbComCad.Visible := True;
    lbSemCad.Visible := True;
    lbFunc.Visible := True;
  finally
   FIgnoreChange := False;
  end;
end;

procedure TFrmCli.FormCreate(Sender: TObject);
begin
  FPesq := TFrmCliPesq.Create(Self);
  pmCli.PopupForm := FPesq;
  FReadOnly := False;
  Reset;
end;

procedure TFrmCli.FormDestroy(Sender: TObject);
begin
  FPesq.Free;
end;

procedure TFrmCli.imFotoClick(Sender: TObject);
begin
  if clicad>0 then 
    FPesq.cmEditar.Click;
end;

procedure TFrmCli.Init(aFornecedor, aShowFunc: Boolean; aCodigo: Integer; aNome, aNomeFunc: String; aTipo: Byte; aParent: TWinControl);
begin
  Fornecedor := aFornecedor;
  if aFornecedor then begin
    cmFornecedor.Visible := ivAlways;
    cmBuscar.Visible := ivNever;
    panBotoes.Width := 22;
  end;
  lbFunc.Visible := aShowFunc and (not aFornecedor);
  edFunc.Text := aNomeFunc;
  Tipo := aTipo; 
  if aTipo=1 then
    edAvulso.Text := aNome;
  CliCad := aCodigo;
  if aCodigo>0 then 
    UpdateCliCadEdit(False);
    
  if aParent<>nil then begin
    aParent.Height := panCliente.Height;
    panCliente.Parent := aParent;
  end;
end;

procedure TFrmCli.lbComCadFocusChanged(Sender: TObject);
begin
  Caption := FormatDateTime(SncaFrmCli_HhMmSs, Now);
end;

procedure TFrmCli.lbSemCadClick(Sender: TObject);
begin
  Tipo := TcxLabel(Sender).Tag;
  case FTipo of
    0 : edCad.SetFocus;
    1 : Timer3.Enabled := True;
  end;
  if Assigned(FOnMudouCliente) then
    FOnMudouCliente(Self);
end;

function TFrmCli.Nome: String;
begin
  case FTipo of
    0 : Result := FPesq.TabNome.Value;
    1 : Result := edAvulso.Text;
    2 : Result := edFunc.Text;
  end;
end;

procedure TFrmCli.pmCliClosePopup(Sender: TObject; Selected: Boolean);
begin
  FPopped := False;
  if FCliCad>0 then UpdateCliCadEdit(False);
end;

procedure TFrmCli.pmCliPopup(Sender: TObject);
begin
  FPopped := True;
end;

procedure TFrmCli.SetCliCad(const Value: Integer);
var SaveIgnore, Alterou : Boolean;
begin
  SaveIgnore := FIgnoreChange;
  FIgnoreChange := True;
  try
    Alterou := (FCliCad<>Value);
    if (Value>0) and (FPesq.TabID.Value <> Value) then begin
      FPesq.Tab.CancelRange;
      if not FPesq.Tab.Locate('ID', Value, []) then  // do not localize
        Raise Exception.Create(SncaFrmCli_Cliente+IntToStr(Value)+'Cliente Nãoo Encontrado');
    end;
      
    FCliCad := Value;

    if Alterou then begin
      UpdateCliCadInfo;
      if Assigned(FOnMudouCliente) then
        FOnMudouCliente(Self);
    end;

      
  finally
    FIgnoreChange := SaveIgnore;
  end;
end;

procedure TFrmCli.SetFornecedor(const Value: Boolean);
begin
  FFornecedor := Value;
  panFoto.Visible := (not FFornecedor);
  if FFornecedor then begin
    lbBuscar.Caption := SncaFrmCli_Fornecedor;
    lbComCad.Caption := SncaFrmCli_Fornecedor_1;
    lbSemCad.Visible := false;
    lbFunc.Visible := False;
    lbAvulso.Caption := SncaFrmCli_Nome;
    cmNome.Visible := ivNever;
    cmUsername.Visible := ivNever;
    cmCod.Visible := ivNever;
    pgCli.ActivePage := tsCliCad;
    FPesq.rgFornecedor.Checked := FFornecedor;
    panTopo.Visible := False;
    panCliente.Height := 60;
    panCliente.Parent.Height := 60;
  end else begin
    lbComCad.Caption := SncaFrmCli_ClienteCOMCadastro;
    lbSemCad.Caption := SncaFrmCli_ClienteSEMCadastro;
    lbAvulso.Caption := SncaFrmCli_Nome;
  end;
end;

procedure TFrmCli.SetOrdemCli(const Value: Byte);
begin
  if FOrdemCli = Value then Exit;
  FOrdemCli := Value;
  UpdateOrdemCliCad;
end;

procedure TFrmCli.SetReadOnly(const Value: Boolean);
begin
  if FReadOnly = Value then Exit;
  FReadOnly := Value;
  edCad.Enabled := not Value;
  lbComCad.Enabled := not Value;
  lbSemCad.Enabled := not Value;
  lbFunc.Enabled := not Value;
end;

procedure TFrmCli.SetTipo(const Value: Byte);

procedure SetUnderline(L: TcxLabel);
var B : Boolean;
begin
  B := (L.Tag=FTipo);
  with L do 
  if B then begin
    Style.TextStyle := [fsUnderline];
    Style.TextColor := clBlack;
  end else begin
    Style.TextStyle := [];
    Style.TextColor := $004B4B4B;
  end;
end;

begin
  FTipo := Value;
  if FFornecedor then
    pgCli.ActivePageIndex := 0
  else
    pgCli.ActivePageIndex := Value;
    
  if (Value=0) or FFornecedor then
    pgFoto.ActivePageIndex := 0 else
    pgFoto.ActivePageIndex := 1;
  SetUnderline(lbComCad);
  SetUnderline(lbSemCad);
  SetUnderline(lbFunc);
end;

procedure TFrmCli.Timer1Timer(Sender: TObject);
var P : TPoint;
begin
  Timer1.Enabled := False;
  P.X := 0;
  P.Y := edCad.Height;
  P := edCad.ClientToScreen(P);
  pmCli.Popup(P.X, P.Y);
end;

procedure TFrmCli.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if edCad.Focused then 
    edCad.SelectAll;
end;

procedure TFrmCli.Timer3Timer(Sender: TObject);
begin
  Timer3.Enabled := False;
  case pgCli.ActivePageIndex of
    0 : edCad.SetFocus;
    1 : edAvulso.SetFocus;
  end;
end;

function TFrmCli.TipoAcessoPref: Integer;
begin
  if Codigo>0 then
    Result := FPesq.TabTipoAcessoPref.Value else
    Result := -1;
end;

procedure TFrmCli.UpdateCliCadEdit(aSelectAll: Boolean);
begin
  FIgnoreChange := True;
  try
    if cmNome.Down or FFornecedor then
      edCad.Text := FPesq.TabNome.Value
    else
    if cmUsername.Down then
      edCad.Text := FPesq.TabUsername.Value 
    else
      edCad.Text := FPesq.TabID.AsString;
  
    if aSelectAll then Timer2.Enabled := True;
  finally
    FIgnoreChange := False;
  end;
end;

procedure TFrmCli.UpdateCliCadInfo(aUpdateEdit: Boolean = False);
var s: String;
begin
  if (FCliCad>0) then begin 
    if not FPesq.TabFoto.IsNull then begin
      S := ExtractFilePath(ParamStr(0))+'temp.jpg'; // do not localize
      FPesq.TabFoto.SaveToFile(S);
      try imFoto.Picture.LoadFromFile(S); except end;
    end else
      imFoto.Picture.Assign(imFotoAvulso.Picture);
    if FOrdemCli>0 then  
      lbNome.Caption := FPesq.TabNome.Value else
      lbNome.Caption := FPesq.TabUsername.Value;
    if FPesq.TabDebito.Value>0 then begin
      lbDebito.Caption := 'Débito é ' + FloatToStrF(FPesq.TabDebito.Value, ffCurrency, 10, 2);
      lbDebito.Visible := True;
    end else
      lbDebito.Visible := False;
    
    if aUpdateEdit then UpdateCliCadEdit(False);
    cmEditar.Enabled := True;
    lbNome.Visible := (FOrdemCli>0)
  end else begin
    cmEditar.Enabled := False;
    lbNome.Visible := False;
    lbDebito.Visible := False;
  end;
end;

procedure TFrmCli.UpdateOrdemCliCad;
begin
  UpdateCliCadInfo(True);

  if FPesq.Tab.active then begin

      FIgnoreChange := True;
      try
        FPesq.Tab.CancelRange;

        case FOrdemCli of
          0 : begin
            FPesq.rgNome.Checked := True;
            lbBuscar.Caption := SncaFrmCli_Nome;
            cmNome.Down := true;
          end;
          1 : begin
            FPesq.rgUsername.Checked := True;
            lbBuscar.Caption := SncaFrmCli_Username;
            cmUsername.Down := true;
          end;
          2 : begin
            FPesq.rgCod.Checked := True;
            lbBuscar.Caption := 'Código';
            cmCod.Down := True;
          end;
        end;

        CliCad := FCliCad;

        if edCad.Focused then Timer2.Enabled := True;

      finally
        FIgnoreChange := False;
      end;
  end;
end;

{ TFrmCliList }

constructor TFrmCliList.Create;
begin
  FItens := TThreadList.Create;
end;

destructor TFrmCliList.Destroy;
var I : Integer;
begin
  with FItens.LockList do begin
    while Count>0 do begin
      TObject(Items[0]).Free;
      Delete(0);
    end;
  end;

  FItens.Free;

  inherited;
end;

function TFrmCliList.GetFrm: TFrmCli;
begin
  with FItens.LockList do
  try 
    if Count>0 then begin
      Result := TFrmCli(Items[0]);
      Result.OnMudouCliente := nil;
      Delete(0);
    end else
      Result := TFrmCli.Create(nil);
  finally
    FItens.UnlockList;
  end;
end;

procedure TFrmCliList.ReleaseFrm(aFrm: TFrmCli);
begin
  with FItens.LockList do 
  try
    aFrm.pmCli.ClosePopup(False);
    
    aFrm.Reset;
    aFrm.CliCad := 0;
    
    
    Add(aFrm);
  finally
    FItens.UnlockList;
  end;
end;

initialization
  gCliList := TFrmCliList.Create;

finalization
  gCliList.Free;  

end.

