unit ncaFrmDesliga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxRadioGroup, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxLabel, pngimage, Buttons, PngSpeedButton, PngBitBtn,
  cxLookAndFeelPainters, cxButtons, Menus, cxGroupBox, LMDGraph, LMDPNGImage, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDTypes, LMDBevel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmDesliga = class(TForm)
    panDesligar: TLMDSimplePanel;
    Image1: TImage;
    panReiniciar: TLMDSimplePanel;
    panLogoff: TLMDSimplePanel;
    Image3: TImage;
    panFecharNex: TLMDSimplePanel;
    Image4: TImage;
    LMDSimplePanel5: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    LMDSimplePanel7: TLMDSimplePanel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    LMDSimplePanel8: TLMDSimplePanel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    rbLivres: TcxRadioButton;
    rbMaq: TcxRadioButton;
    rbTodas: TcxRadioButton;
    btnCancelar: TcxButton;
    btnOk: TcxButton;
    Image5: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure panDesligarClick(Sender: TObject);
    procedure panReiniciarClick(Sender: TObject);
    procedure panLogoffClick(Sender: TObject);
    procedure panFecharNexClick(Sender: TObject);
    procedure panReiniciarMouseEnter(Sender: TObject);
    procedure panReiniciarMouseExit(Sender: TObject);
  private
    { Private declarations }
    FSelected: Integer;
  public
    { Public declarations }
    procedure Selecionar(const Value: Integer);
    procedure Mostrar(aMaq: Integer; aOpcao: Byte);
  end;

var
  FrmDesliga: TFrmDesliga;

implementation

uses 
  ncaDM, 
  ncaFrmUsuario, 
  ncIDRecursos;

{$R *.dfm}

const
  SelColor : Array[Boolean] of TColor = (clBtnFace, clWhite);

procedure TFrmDesliga.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDesliga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDesliga.FormCreate(Sender: TObject);
begin
  FSelected := 2;
end;

procedure TFrmDesliga.btnOkClick(Sender: TObject);
begin
  with Dados.CM do   
  if rbMaq.Checked then 
    ShutDownMaq(rbMaq.Tag, FSelected)
  else
  if rbLivres.Checked then
    ShutdownMaq(High(Word), FSelected)
  else  
    ShutDownMaq(0, FSelected);
         
  Close;
end;

procedure TFrmDesliga.Mostrar(aMaq: Integer; aOpcao: Byte);
begin
  if not Permitido(daMaqFecharCMGuard) then
    panFecharNex.Visible := False;

  Height := Height - panFecharNex.Height;  

  rbMaq.Tag := AMaq;
  rbMaq.Caption := 'Máquina ' + IntToStr(AMaq);
  Selecionar(aOpcao);
  ShowModal;
end;

procedure TFrmDesliga.panDesligarClick(Sender: TObject);
begin
  Selecionar(panDesligar.Tag);
end;

procedure TFrmDesliga.panFecharNexClick(Sender: TObject);
begin
  Selecionar(panFecharNex.Tag);
end;

procedure TFrmDesliga.panLogoffClick(Sender: TObject);
begin
  Selecionar(panLogoff.Tag);
end;

procedure TFrmDesliga.panReiniciarClick(Sender: TObject);
begin
  Selecionar(panReiniciar.Tag);
end;

procedure TFrmDesliga.panReiniciarMouseEnter(Sender: TObject);
begin
  TLMDSimplePanel(Sender).Color := clWhite;
end;

procedure TFrmDesliga.panReiniciarMouseExit(Sender: TObject);
begin
  with TLMDSimplePanel(Sender) do 
    Color := SelColor[(FSelected=Tag)];
end;

procedure TFrmDesliga.Selecionar(const Value: Integer);

procedure SetProp(P: TLMDSimplePanel);
begin
  P.Color := SelColor[(P.Tag=Value)];
  if P.Tag=Value then 
    P.Bevel.Mode:= bmEdge else
    P.Bevel.Mode := bmStandard;
end;

begin
  FSelected := Value;
  SetProp(panDesligar);
  SetProp(panReiniciar);
  SetProp(panLogoff);
  SetProp(panFecharNex);
end;

end.
