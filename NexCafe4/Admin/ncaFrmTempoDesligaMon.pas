unit ncaFrmTempoDesligaMon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, StdCtrls, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  LMDPNGImage, ExtCtrls, cxRadioGroup;

type
  TFrmTempoDesligaMon = class(TForm)
    Image1: TImage;
    cxLabel1: TcxLabel;
    edMin: TcxSpinEdit;
    Button1: TButton;
    Button2: TButton;
    rbNao: TcxRadioButton;
    rbSim: TcxRadioButton;
    cxLabel2: TcxLabel;
    lbMin: TcxLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbSimClick(Sender: TObject);
    procedure rbNaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    function Editar(var T: Word): Boolean;
    { Public declarations }
  end;

var
  FrmTempoDesligaMon: TFrmTempoDesligaMon;

implementation

{$R *.dfm}

procedure TFrmTempoDesligaMon.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmTempoDesligaMon.Button2Click(Sender: TObject);
begin
  Close;
end;

function TFrmTempoDesligaMon.Editar(var T: Word): Boolean;
begin
  edMin.Value := T;
  if T>0 then
    rbSim.Checked := True else
    rbNao.Checked := True;
  edMin.Enabled := (T>0);
  lbMin.Enabled := (T>0);
    
  ShowModal;
  Result := (ModalResult=mrOk);
  if Result then
  if rbSim.Checked then
    T := edMin.Value else
    T := 0;
end;

procedure TFrmTempoDesligaMon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTempoDesligaMon.rbNaoClick(Sender: TObject);
begin
  edMin.Enabled := False;
  lbMin.Enabled := False;
end;

procedure TFrmTempoDesligaMon.rbSimClick(Sender: TObject);
begin
  edMin.Enabled := True;
  lbMin.Enabled := True;
end;

end.
