unit uTesteEspeciePri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, StdCtrls, cxTextEdit, cxCurrencyEdit, ncEspecie;

type
  TForm2 = class(TForm)
    edValor: TcxCurrencyEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses ncaFrmPagEspecie;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var 
  PE: TncPagEspecies; i : Integer;
  aCredUsado, aDesconto : Currency;
begin
  PE := TncPagEspecies.Create;
  PE.TotalPagar := edValor.Value;
  aCredUsado := 0;
  aDesconto := 0;
  TFrmPagEspecie.Create(Self).Editar(False, PE, -11.5, aCredUsado, aDesconto);
    
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  with gEspecies.NewItem do begin
    ID := 1;
    Tipo := tipoesp_dinheiro;
    Nome := 'Dinheiro';
    PermiteTroco := True;
    PermiteVarios := False;
    Img := 0;
  end;

  with gEspecies.NewItem do begin
    ID := 2;
    Tipo := tipoesp_cartao;
    Nome := 'Cartão Crédito';
    PermiteTroco := False;
    PermiteVarios := True;
    Img := 1;
  end;

  with gEspecies.NewItem do begin
    ID := 3;
    Tipo := tipoesp_cartao;  
    Nome := 'Cartão Débito';
    PermiteTroco := False;
    PermiteVarios := True;
    Img := 2;
  end;

  with gEspecies.NewItem do begin
    ID := 4;
    Tipo := tipoesp_cheque;
    Nome := 'Cheque';
    PermiteTroco := False;
    PermiteVarios := True;
    Img := 3;
  end;
end;

end.
