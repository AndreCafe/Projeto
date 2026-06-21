unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, StdCtrls, dxBar, ExtCtrls;

type
  TFrmTeste = class(TFrmBase)
    Memo1: TMemo;
    cmBotao1: TdxBarButton;
    cmBotao2: TdxBarButton;
    cmBotao3: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    procedure dxBarButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  FrmTeste: TFrmTeste;

implementation

{$R *.dfm}

{ TFrmTeste }

class function TFrmTeste.Descricao: String;
begin
  Result := 'Formulário Teste';
end;

procedure TFrmTeste.dxBarButton1Click(Sender: TObject);
begin
  inherited;
  ShowMessage('clicou tabsheet 1');
end;

end.
