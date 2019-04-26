unit uDMBol;

interface

uses
  SysUtils, Classes, uFreeBoleto, uFreeBoletoImage, uRSAss;

type
  TdmBol = class(TDataModule)
    FBI: TFreeBoletoImagem;
    FB: TFreeBoleto;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Atualiza(var B: TDadosBoleto);
    procedure Mostra(aMostraCompra: Boolean);
    { Public declarations }
  end;

var
  dmBol: TdmBol;
  DadosEmissao : TDadosEmissaoBol;

implementation

{$R *.dfm}

function ApenasDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  if (S[I] in  ['0'..'9']) then
    Result := Result + S[I];
end;

procedure TdmBol.Atualiza(var B: TDadosBoleto);
begin
  FB.Vencimento := B.dbVenc;
  FB.DataDocumento := B.dbLanc;
  FB.Valor := B.dbValor;
  FB.NossoNumero := IntToStr(B.dbNum);
  FB.Documento := FB.NossoNumero;
  FB.Instrucoes.Text := B.dbDescr;

  with DadosEmissao do begin
    FB.Cedente.Nome := deCedente;
    FB.Sacado.Nome := deNome;
    if Length(ApenasDig(deCNPJ))>11 then
      FB.Sacado.Pessoa := pJuridica else
      FB.Sacado.Pessoa := pFisica;
    FB.Sacado.CNPJ_CPF := ApenasDig(deCNPJ);
    FB.Sacado.Endereco := deEnd;
    FB.Sacado.Estado := deUF;
    FB.Sacado.Cidade := deCidade;
    FB.Sacado.Cep  := '';
    FB.Sacado.Bairro := '';
  end;
  FB.Preparar;
end;

procedure TdmBol.DataModuleCreate(Sender: TObject);
begin
  FBI.ListaBoletos.Add(FB);
end;

procedure TdmBol.Mostra(aMostraCompra: Boolean);
begin
  FBI.ShowPreview(aMostraCompra);
end;

end.
