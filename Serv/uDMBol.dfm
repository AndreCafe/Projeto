object dmBol: TdmBol
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 96
  Width = 183
  object FBI: TFreeBoletoImagem
    DestruirBoletos = False
    TrackBarDelay = 0
    Left = 56
    Top = 18
  end
  object FB: TFreeBoleto
    Cedente.Nome = 'NEXTAR TECNOLOGIA DE SOFTWARE LTDA'
    Cedente.CodigoBanco = '341'
    Cedente.Agencia = '0125'
    Cedente.ContaCorrente = '58079'
    Cedente.DigitoContaCorrente = '5'
    Cedente.Banco001.Convenio = '1168094'
    Sacado.Nome = 'Andr'#233' Borges'
    Sacado.Endereco = 'R. Laurindo Janu'#225'rio da Silveira 5530 sl 5'
    Sacado.Cidade = 'Florian'#243'polis'
    Sacado.Estado = 'SC'
    Sacado.Cep = '88062200'
    Sacado.Pessoa = pFisica
    Sacado.CNPJ_CPF = '16392012893'
    Vencimento = 39161.000000000000000000
    Valor = 150.000000000000000000
    NossoNumero = '115'
    LocalPagamento = 'QUALQUER BANCO AT'#201' O VENCIMENTO'
    DataDocumento = 39161.000000000000000000
    Documento = '254910'
    Especie = 'R$'
    EspecieDoc = 'DS'
    Aceite = 'N'
    Carteira = '109'
    Instrucoes.Strings = (
      'SOFTWARE NEXCAF'#201)
    Left = 24
    Top = 18
  end
end
