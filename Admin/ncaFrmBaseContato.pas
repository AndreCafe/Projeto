unit ncaFrmBaseContato;
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
  cxButtonEdit, Menus, SpTBXFormPopupMenu, SpTBXItem, SpTBXControls, ncaFrmCliPesq2,
  dxBarExtItems, uNexTransResourceStrings_PT, PngImage;

type
  TFrmBaseContato = class(TForm)
    panPri: TLMDSimplePanel;
    panFoto: TLMDSimplePanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    pmCli: TSpTBXFormPopupMenu;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    pgFoto: TcxPageControl;
    tsComFoto: TcxTabSheet;
    imFoto: TImage;
    tsSemFoto: TcxTabSheet;
    imgSemFoto: TImage;
    edCad: TcxButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure imFotoClick(Sender: TObject);
    procedure edCadFocusChanged(Sender: TObject);
  private
    FSaveSt: String;
    FPopped : Boolean;
    FPesq : TFrmCliPesq2;
    FCliCad : Integer;
    FIgnoreChange: Boolean;
    FOnMudouCliente : TNotifyEvent;
    FFirstCliEnter : Boolean;
    FReadOnly : Boolean;
    
    
    
    { Private declarations }
    
    procedure UpdateCliCadInfo(aUpdateEdit: Boolean = False);
    procedure SetCliCad(const Value: Integer);
    procedure SetReadOnly(const Value: Boolean);

  public
    procedure UpdateCliCadEdit(aSelectAll: Boolean);

    procedure Reset;

    procedure Init(aCodigo: Integer; aNome: String; aParent: TWinControl);

    function Codigo: Integer;
    function FidPontos: Double;
    function Nome: String;

    property Pesq: TFrmCliPesq2 
      read FPesq;

    function TipoAcessoPref: Integer;

    property ReadOnly: Boolean
      read FReadOnly write SetReadOnly;

    property OnMudouCliente: TNotifyEvent
      read FOnMudouCliente write FOnMudouCliente;  

    property IgnoreChange: Boolean
      read FIgnoreChange;

    property Popped: Boolean
      read FPopped;  

    property CliCad: Integer
      read FCliCad write SetCliCad;
    { Public declarations }
  end;

  TFrmContatoList = class
  private
    FItens : TThreadList;
  public
    constructor Create;
    destructor Destroy; override;

    function GetFrm: TFrmBaseContato;
    procedure ReleaseFrm(aFrm: TFrmBaseContato);  
  end;

const
  tcComCad = 0;
  tcSemCad = 1;  
  tcFunc   = 2;

var
  FrmBaseContato: TFrmBaseContato;
  gContatoList : TFrmContatoList;

  

implementation

uses ncaFrmPri, ufmImagens, ncaFrmCadCli, ncaDM, ncClassesBase;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

function TFrmBaseContato.Codigo: Integer;
begin
  Result := FCliCad;
end;

procedure TFrmBaseContato.edCadEnter(Sender: TObject);
begin
  if FFirstCliEnter then Timer1.Enabled := True;
  FFirstCliEnter := False;
  Timer2.Enabled := True;
end;

procedure TFrmBaseContato.edCadFocusChanged(Sender: TObject);
begin
  if edCad.Focused then
    panPri.Color := FrmPri.cxEditStyleController1.StyleFocused.Color else
    panPri.Color := clBtnFace;
end;

procedure TFrmBaseContato.edCadKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FSaveSt := edCad.EditingText;
end;

procedure TFrmBaseContato.edCadKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (edCad.EditingText <> FSaveSt) and (not FPopped) then Timer1.Enabled := True;
  FPesq.processKey(Key);
end;

procedure TFrmBaseContato.edCadPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Timer1.Enabled := True;
end;

procedure TFrmBaseContato.edCadPropertiesChange(Sender: TObject);
begin
  if edCad.Focused and (not FIgnoreChange) then
    FPesq.Procurar := edCad.EditingText;
end;

function TFrmBaseContato.FidPontos: Double;
begin
  if Codigo>0 then 
    Result := FPesq.TabFidPontos.Value else
    Result := 0;
end;

procedure TFrmBaseContato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmBaseContato.Reset;
begin
  if GShutingdown then exit;

  FIgnoreChange := True;
  try
    panPri.Parent := Self;
    FFirstCliEnter := True;
    FOnMudouCliente := nil;
    FCliCad := 0;
    FPopped := False;
    ReadOnly := False;
    FPesq.Reset;
    edCad.Clear;
  finally
   FIgnoreChange := False;
  end;
end;

procedure TFrmBaseContato.FormCreate(Sender: TObject);
begin
  FPesq := TFrmCliPesq2.Create(Self);
  pmCli.PopupForm := FPesq;
  FReadOnly := False;
  Reset;
end;

procedure TFrmBaseContato.FormDestroy(Sender: TObject);
begin
  FPesq.Free;
end;

procedure TFrmBaseContato.imFotoClick(Sender: TObject);
begin
  if clicad>0 then 
    FPesq.cmEditar.Click;
end;

procedure TFrmBaseContato.Init(aCodigo: Integer; aNome: String; aParent: TWinControl);
begin
  CliCad := aCodigo;
  if aCodigo>0 then 
    UpdateCliCadEdit(False);
    
  if aParent<>nil then begin
    aParent.Height := panPri.Height;
    panPri.Parent := aParent;
  end;
end;

function TFrmBaseContato.Nome: String;
begin
  FPesq.TabNome.Value;
end;

procedure TFrmBaseContato.pmCliClosePopup(Sender: TObject; Selected: Boolean);
begin
  FPopped := False;
  if FCliCad>0 then UpdateCliCadEdit(False);
end;

procedure TFrmBaseContato.pmCliPopup(Sender: TObject);
begin
  FPopped := True;
end;

procedure TFrmBaseContato.SetCliCad(const Value: Integer);
var SaveIgnore, Alterou : Boolean;
begin
  SaveIgnore := FIgnoreChange;
  FIgnoreChange := True;
  try
    Alterou := (FCliCad<>Value);
    if (Value>0) and (FPesq.TabID.Value <> Value) then begin
      FPesq.Tab.CancelRange;
      if not FPesq.Tab.Locate('ID', Value, []) then  // do not localize
        Raise Exception.Create(SncaFrmCli_Cliente+IntToStr(Value)+SncaFrmCli_NãoEncontradoNoBancoDeDados);
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

procedure TFrmBaseContato.SetReadOnly(const Value: Boolean);
begin
  if FReadOnly = Value then Exit;
  FReadOnly := Value;
  edCad.Enabled := not Value;
end;

procedure TFrmBaseContato.Timer1Timer(Sender: TObject);
var P : TPoint;
begin
  Timer1.Enabled := False;
  P.X := 0;
  P.Y := edCad.Height;
  P := edCad.ClientToScreen(P);
  pmCli.Popup(P.X, P.Y);
end;

procedure TFrmBaseContato.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if edCad.Focused then 
    edCad.SelectAll;
end;

procedure TFrmBaseContato.Timer3Timer(Sender: TObject);
begin
  Timer3.Enabled := False;
  edCad.SetFocus;
end;

function TFrmBaseContato.TipoAcessoPref: Integer;
begin
  if Codigo>0 then
    Result := FPesq.TabTipoAcessoPref.Value else
    Result := -1;
end;

procedure TFrmBaseContato.UpdateCliCadEdit(aSelectAll: Boolean);
begin
  FIgnoreChange := True;
  try
    edCad.Text := FPesq.CampoBusca;
    if aSelectAll then Timer2.Enabled := True;
  finally
    FIgnoreChange := False;
  end;
end;

procedure TFrmBaseContato.UpdateCliCadInfo(aUpdateEdit: Boolean = False);
var s: String;

procedure SemFoto;
begin
  pgFoto.ActivePage := tsSemFoto;
  panFoto.Width := 65;
  panPri.Parent.Height := 52;
  panPri.Height := 52;
end;

procedure ComFoto;
begin
  try
    S := ExtractFilePath(ParamStr(0))+'temp.jpg'; // do not localize
    FPesq.TabFoto.SaveToFile(S);
    imFoto.Picture.LoadFromFile(S);    
    panFoto.Width := 84;
    panPri.Parent.Height := 84;
    panPri.Height := 84;
    pgFoto.ActivePage := tsComFoto;
  except
    SemFoto;
  end;
end;

begin
  if (FCliCad<=0) or FPesq.TabFoto.IsNull then 
    SemFoto else
    ComFoto;
end;

{ TFrmContatoList }

constructor TFrmContatoList.Create;
begin
  FItens := TThreadList.Create;
end;

destructor TFrmContatoList.Destroy;
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

function TFrmContatoList.GetFrm: TFrmBaseContato;
begin
  with FItens.LockList do 
  try 
    if Count>0 then begin
      Result := TFrmBaseContato(Items[0]);
      Result.OnMudouCliente := nil;
      Delete(0);
    end else 
      Result := TFrmBaseContato.Create(nil);
  finally
    FItens.UnlockList;
  end;
end;

procedure TFrmContatoList.ReleaseFrm(aFrm: TFrmBaseContato);
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
  gContatoList := TFrmContatoList.Create;

finalization
  gContatoList.Free;  

end.

