unit ncaFrmCHorario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxDBEdit, cxContainer, cxLabel, cxClasses,
  cxDropDownEdit, cxColorComboBox, ncClassesBase,
  LMDPNGImage, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton;

type
  TFrmCHorario = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxLabel1: TcxLabel;
    edNome: TcxTextEdit;
    lbCH1: TcxLabel;
    lbCH2: TcxLabel;
    lbCH3: TcxLabel;
    lbCH4: TcxLabel;
    panHorarios: TLMDSimplePanel;
    panDiasHoras: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    hora723: TLMDSpeedButton;
    hora722: TLMDSpeedButton;
    hora721: TLMDSpeedButton;
    hora720: TLMDSpeedButton;
    hora719: TLMDSpeedButton;
    hora718: TLMDSpeedButton;
    hora717: TLMDSpeedButton;
    hora716: TLMDSpeedButton;
    hora715: TLMDSpeedButton;
    hora714: TLMDSpeedButton;
    hora70: TLMDSpeedButton;
    hora71: TLMDSpeedButton;
    hora72: TLMDSpeedButton;
    hora73: TLMDSpeedButton;
    hora74: TLMDSpeedButton;
    hora75: TLMDSpeedButton;
    hora76: TLMDSpeedButton;
    hora77: TLMDSpeedButton;
    hora78: TLMDSpeedButton;
    hora79: TLMDSpeedButton;
    hora710: TLMDSpeedButton;
    hora711: TLMDSpeedButton;
    hora712: TLMDSpeedButton;
    hora713: TLMDSpeedButton;
    LMDLabel5: TLMDLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    hora623: TLMDSpeedButton;
    hora622: TLMDSpeedButton;
    hora621: TLMDSpeedButton;
    hora620: TLMDSpeedButton;
    hora619: TLMDSpeedButton;
    hora618: TLMDSpeedButton;
    hora617: TLMDSpeedButton;
    hora616: TLMDSpeedButton;
    hora615: TLMDSpeedButton;
    hora614: TLMDSpeedButton;
    hora60: TLMDSpeedButton;
    hora61: TLMDSpeedButton;
    hora62: TLMDSpeedButton;
    hora63: TLMDSpeedButton;
    hora64: TLMDSpeedButton;
    hora65: TLMDSpeedButton;
    hora66: TLMDSpeedButton;
    hora67: TLMDSpeedButton;
    hora68: TLMDSpeedButton;
    hora69: TLMDSpeedButton;
    hora610: TLMDSpeedButton;
    hora611: TLMDSpeedButton;
    hora612: TLMDSpeedButton;
    hora613: TLMDSpeedButton;
    LMDLabel1: TLMDLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    hora523: TLMDSpeedButton;
    hora522: TLMDSpeedButton;
    hora521: TLMDSpeedButton;
    hora520: TLMDSpeedButton;
    hora519: TLMDSpeedButton;
    hora518: TLMDSpeedButton;
    hora517: TLMDSpeedButton;
    hora516: TLMDSpeedButton;
    hora515: TLMDSpeedButton;
    hora514: TLMDSpeedButton;
    hora50: TLMDSpeedButton;
    hora51: TLMDSpeedButton;
    hora52: TLMDSpeedButton;
    hora53: TLMDSpeedButton;
    hora54: TLMDSpeedButton;
    hora55: TLMDSpeedButton;
    hora56: TLMDSpeedButton;
    hora57: TLMDSpeedButton;
    hora58: TLMDSpeedButton;
    hora59: TLMDSpeedButton;
    hora510: TLMDSpeedButton;
    hora511: TLMDSpeedButton;
    hora512: TLMDSpeedButton;
    hora513: TLMDSpeedButton;
    LMDLabel2: TLMDLabel;
    LMDSimplePanel5: TLMDSimplePanel;
    hora423: TLMDSpeedButton;
    hora422: TLMDSpeedButton;
    hora421: TLMDSpeedButton;
    hora420: TLMDSpeedButton;
    hora419: TLMDSpeedButton;
    hora418: TLMDSpeedButton;
    hora417: TLMDSpeedButton;
    hora416: TLMDSpeedButton;
    hora415: TLMDSpeedButton;
    hora414: TLMDSpeedButton;
    hora40: TLMDSpeedButton;
    hora41: TLMDSpeedButton;
    hora42: TLMDSpeedButton;
    hora43: TLMDSpeedButton;
    hora44: TLMDSpeedButton;
    hora45: TLMDSpeedButton;
    hora46: TLMDSpeedButton;
    hora47: TLMDSpeedButton;
    hora48: TLMDSpeedButton;
    hora49: TLMDSpeedButton;
    hora410: TLMDSpeedButton;
    hora411: TLMDSpeedButton;
    hora412: TLMDSpeedButton;
    hora413: TLMDSpeedButton;
    LMDLabel3: TLMDLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    hora323: TLMDSpeedButton;
    hora322: TLMDSpeedButton;
    hora321: TLMDSpeedButton;
    hora320: TLMDSpeedButton;
    hora319: TLMDSpeedButton;
    hora318: TLMDSpeedButton;
    hora317: TLMDSpeedButton;
    hora316: TLMDSpeedButton;
    hora315: TLMDSpeedButton;
    hora314: TLMDSpeedButton;
    hora30: TLMDSpeedButton;
    hora31: TLMDSpeedButton;
    hora32: TLMDSpeedButton;
    hora33: TLMDSpeedButton;
    hora34: TLMDSpeedButton;
    hora35: TLMDSpeedButton;
    hora36: TLMDSpeedButton;
    hora37: TLMDSpeedButton;
    hora38: TLMDSpeedButton;
    hora39: TLMDSpeedButton;
    hora310: TLMDSpeedButton;
    hora311: TLMDSpeedButton;
    hora312: TLMDSpeedButton;
    hora313: TLMDSpeedButton;
    LMDLabel4: TLMDLabel;
    LMDSimplePanel8: TLMDSimplePanel;
    hora223: TLMDSpeedButton;
    hora222: TLMDSpeedButton;
    hora221: TLMDSpeedButton;
    hora220: TLMDSpeedButton;
    hora219: TLMDSpeedButton;
    hora218: TLMDSpeedButton;
    hora217: TLMDSpeedButton;
    hora216: TLMDSpeedButton;
    hora215: TLMDSpeedButton;
    hora214: TLMDSpeedButton;
    hora20: TLMDSpeedButton;
    hora21: TLMDSpeedButton;
    hora22: TLMDSpeedButton;
    hora23: TLMDSpeedButton;
    hora24: TLMDSpeedButton;
    hora25: TLMDSpeedButton;
    hora26: TLMDSpeedButton;
    hora27: TLMDSpeedButton;
    hora28: TLMDSpeedButton;
    hora29: TLMDSpeedButton;
    hora210: TLMDSpeedButton;
    hora211: TLMDSpeedButton;
    hora212: TLMDSpeedButton;
    hora213: TLMDSpeedButton;
    LMDLabel6: TLMDLabel;
    LMDSimplePanel9: TLMDSimplePanel;
    hora123: TLMDSpeedButton;
    hora122: TLMDSpeedButton;
    hora121: TLMDSpeedButton;
    hora120: TLMDSpeedButton;
    hora119: TLMDSpeedButton;
    hora118: TLMDSpeedButton;
    hora117: TLMDSpeedButton;
    hora116: TLMDSpeedButton;
    hora115: TLMDSpeedButton;
    hora114: TLMDSpeedButton;
    hora10: TLMDSpeedButton;
    hora11: TLMDSpeedButton;
    hora12: TLMDSpeedButton;
    hora13: TLMDSpeedButton;
    hora14: TLMDSpeedButton;
    hora15: TLMDSpeedButton;
    hora16: TLMDSpeedButton;
    hora17: TLMDSpeedButton;
    hora18: TLMDSpeedButton;
    hora19: TLMDSpeedButton;
    hora110: TLMDSpeedButton;
    hora111: TLMDSpeedButton;
    hora112: TLMDSpeedButton;
    hora113: TLMDSpeedButton;
    LMDLabel7: TLMDLabel;
    LMDSimplePanel13: TLMDSimplePanel;
    btnNenhum: TLMDSpeedButton;
    btnTodos: TLMDSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure hora10Click(Sender: TObject);
    procedure hora10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
  private
    { Private declarations }
  public
    FNome: ^String;
    FH1 : ^Integer;
    FH2 : ^Integer;
    FH3 : ^Integer;
    FH4 : ^Integer;
    FH5 : ^Integer;
    FH6 : ^Integer;
    FH7 : ^Integer;
    
    function Editar(var aNome: String; var a1, a2, a3, a4, a5, a6, a7: Integer): Boolean;
    { Public declarations }
  end;

var
  FrmCHorario: TFrmCHorario;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos;

{$R *.DFM}

{ TFrmForncedor }


procedure TFrmCHorario.btnNenhumClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    SB.Color := clRed;
    SB.Font.Color := clWhite;
  end;
end;

procedure TFrmCHorario.btnTodosClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    SB.Color := clGreen;
    SB.Font.Color := clWhite;
  end;
end;

procedure TFrmCHorario.cmCancelarClick(Sender: TObject);
begin
  Close;
end;


procedure TFrmCHorario.cmGravarClick(Sender: TObject);

procedure SalvaDia(Dia: Integer; var HP : Integer);
var 
  H : Integer;
  SB : TLmdSpeedButton;
begin
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    HP := SetBit(HP, BitsH[H], (SB.Color=clGreen));
  end;
end;

begin
  edNome.PostEditValue;
  if Trim(edNome.Text)='' then
    Raise Exception.Create('É necessário informar o nome do fornecedor');
  FNome^ := edNome.Text;  
  SalvaDia(1, FH1^);
  SalvaDia(2, FH2^);
  SalvaDia(3, FH3^);
  SalvaDia(4, FH4^);
  SalvaDia(5, FH5^);
  SalvaDia(6, FH6^);
  SalvaDia(7, FH7^);
  
  ModalResult := mrOk;
end;

function TFrmCHorario.Editar(var aNome: String; var a1, a2, a3, a4, a5, a6, a7: Integer): Boolean;
begin
  FNome := @aNome;
  FH1 := @a1;
  FH2 := @a2;
  FH3 := @a3;
  FH4 := @a4;
  FH5 := @a5;
  FH6 := @a6;
  FH7 := @a7;
  
  edNome.Text := aNome;
  ShowModal;
  Result := (ModalResult=mrOk);
end;

procedure TFrmCHorario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCHorario.FormCreate(Sender: TObject);
var i: integer;
begin
  for i := 0 to componentcount -1 do 
    if (Components[i]<>btnTodos) and 
       (Components[i]<>btnNenhum) and
       (Components[i] is TLMDSpeedButton) 
    then begin
      TLMDSpeedButton(Components[i]).OnClick := Hora10Click;
      TLMDSpeedButton(Components[i]).OnMouseMove := Hora10MouseMove;
    end;
end;

procedure TFrmCHorario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : cmGravarClick(nil);
    Key_Esc   : cmCancelarClick(nil);
  end;
end;

procedure TFrmCHorario.FormShow(Sender: TObject);

procedure LeDia(Dia: Integer; Valor: Integer);
var 
  H : Integer;
  SB : TLmdSpeedButton;
begin
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    if BitIsSet(Valor, BitsH[H]) then
      SB.Color := clGreen else
      SB.Color := clRed;
    SB.Font.Color := clWhite;  
  end;
end;

begin
  LeDia(1, Fh1^);
  LeDia(2, Fh2^);
  LeDia(3, Fh3^);
  LeDia(4, Fh4^);
  LeDia(5, Fh5^);
  LeDia(6, Fh6^);
  LeDia(7, Fh7^);
end;

procedure TFrmCHorario.hora10Click(Sender: TObject);
begin
  with TLMDSpeedButton(Sender) do
  if Color=clGreen then
    Color := clRed else
    Color := clGreen;
end;

procedure TFrmCHorario.hora10MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssCtrl in Shift then 
    TLMDSpeedButton(Sender).Color := clGreen
  else
  if ssAlt in Shift then
    TLMDSpeedButton(Sender).Color := clRed;
end;

end.
