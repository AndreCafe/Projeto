unit uTestePagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, StdCtrls, cxTextEdit, cxCurrencyEdit, ncEspecie;

type
  TForm6 = class(TForm)
    edValor: TcxCurrencyEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    P: TncPagEspecies;
    First: Boolean;
    CredUsado, Desconto: Currency;
  
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses ncaFrmPagEspecie;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  P.TotalPagar := edValor.Value;
  TFrmPagEspecie.Create(Self).Editar(First, P, 10, CredUsado, Desconto);
  First := False;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  P := TncPagEspecies.Create;
  First := True;
  CredUsado := 0;
  Desconto := 0;

  with gEspecies.NewItem do begin
    Tipo := tipoesp_dinheiro;
    Nome := 'Dinheiro';
    ID := 1;
    Img := 1;
  end;

  with gEspecies.NewItem do begin
    Tipo := tipoesp_cartao;
    Nome := 'Cartão de Crédito';
    ID := 2;
    Img := 2;
  end;

  with gEspecies.NewItem do begin
    Tipo := tipoesp_cartao;
    Nome := 'Cartão de Débito';
    ID := 3;
    Img := 3;
  end;

  with gEspecies.NewItem do begin
    Tipo := tipoesp_cheque;
    ID := 4;
    Img := 4;
    Nome := 'Cheque';
  end;
  

end;

end.
