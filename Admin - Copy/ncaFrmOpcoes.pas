unit ncaFrmOpcoes;
{
    ResourceString: Dario 11/03/13
    Nada pra fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, StdCtrls, cxButtons, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxControls, cxScrollBox;

type
  TFrmOpcoes = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TcxButton;
    btCancelar: TcxButton;
    SB: TcxScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    FFrms : Array of TFrmBaseOpcao;
    { Private declarations }

    function Alterou: Boolean;
  public
    { Public declarations }
    procedure Editar(aTitulo: String; aOpcoes: Array of TFrmBaseOpcaoClass; const aMaximize: Boolean = False);
  end;

var
  FrmOpcoes: TFrmOpcoes;

implementation

uses ncClassesBase, ncaDM;

{$R *.dfm}

{ TFrmOpcoes }

function TFrmOpcoes.Alterou: Boolean;
var I : Integer;
begin
  Result := True;
  for I := 0 to High(FFrms) do
    if FFrms[I].Alterou then Exit;
  Result := False;
end;

procedure TFrmOpcoes.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmOpcoes.btnOkClick(Sender: TObject);
var I : Integer;
begin
  if Alterou then begin
    gConfig.AtualizaCache;
    for I := 0 to High(FFrms) do FFrms[I].Salvar;
    Dados.CM.SalvaAlteracoesObj(gConfig, False);
  end;
  Close;
end;

procedure TFrmOpcoes.Editar(aTitulo: String;
  aOpcoes: array of TFrmBaseOpcaoClass; const aMaximize: Boolean = False);
var I, N : Integer;  
begin
  if aMaximize then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
    
  if Length(aOpcoes)<2 then begin
    if Length(aOpcoes)=1 then
      aOpcoes[0].Create(Owner).Editar;
    Free;
    Exit;
  end;
  Caption := aTitulo;
  SetLength(FFrms, Length(aOpcoes));
  N := 1;
  for I := 0 to High(aOpcoes) do begin
    if I>0 then
    with TLMDSimplePanel.Create(Self) do begin
      Align := alTop;
      Height := 1;
      Color := clSilver;
      Parent := SB;
    end;   
    FFrms[I] := aOpcoes[I].Create(Self);
    with FFrms[I] do begin
      InicioNumItem := N;
      Renumera;
      N := N + NumItens; 
      panPri.Parent := SB;
    end;
  end;
  ShowModal;
end;

procedure TFrmOpcoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmOpcoes.FormCreate(Sender: TObject);
begin
  SetLength(FFrms, 0);
end;


procedure TFrmOpcoes.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
   SB.VertScrollBar.Position := SB.VertScrollBar.Position - (WheelDelta div 10);
   Handled := true;
end;

procedure TFrmOpcoes.FormShow(Sender: TObject);
begin
  Width := Width + 1;
end;


end.
