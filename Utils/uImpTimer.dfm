object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar dados do TimerCaf'#233
  ClientHeight = 312
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 17
    Top = 71
    Width = 209
    Height = 16
    Caption = '- As senhas n'#227'o s'#227'o importadas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 17
    Top = 32
    Width = 373
    Height = 19
    Caption = 'Importar clientes e PRODUTOS do Timer Caf'#233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PB: TProgressBar
    Left = 0
    Top = 0
    Width = 535
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 17
    Top = 134
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object cbImpProd: TCheckBox
    Left = 184
    Top = 128
    Width = 329
    Height = 17
    Caption = 'Importar Produtos (enviar PRODUTO.nx1)'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 2
  end
  object cbImpEst: TCheckBox
    Left = 184
    Top = 151
    Width = 329
    Height = 17
    Caption = 'Importar Saldo de Estoque (enviar MOVEST.nx1)'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 3
  end
  object nxSession1: TnxSession
    ServerEngine = nxSE
    Left = 128
    Top = 184
  end
  object nxDB: TnxDatabase
    Session = nxSession2
    AliasName = 'NexCafe'
    Left = 400
    Top = 48
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 400
    Top = 88
    object tCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tCliBairro: TStringField
      FieldName = 'Bairro'
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tCliCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tCliRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tCliTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tCliMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object tCliMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object tCliIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tCliUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tCliPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object tCliMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
    end
    object tCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tCliEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tCliEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object tCliEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object tCliNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tCliDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tCliCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object tCliTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object tCliLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object tCliFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object tCliIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tCliAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object tCliIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object tCliAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object tCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
    object tCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object tCliPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object tCliTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object tCliFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tCliFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object tCliFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object tCliAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object tCliNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tCliPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tCliHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tCliCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object tCliCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object tCliCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object tCliSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object tCliCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object tCliOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object tCliFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 496
    Top = 48
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
    Left = 160
    Top = 184
  end
  object dVC: TnxTable
    Database = nxDB2
    TableName = 'Venda_Codigos'
    Exclusive = True
    IndexName = 'ICodigo_Ace'
    Left = 192
    Top = 184
    object dVCCodigo_Ace: TStringField
      FieldName = 'Codigo_Ace'
      Size = 12
    end
    object dVCNick: TStringField
      FieldName = 'Nick'
      Size = 40
    end
  end
  object nxDB2: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\nexcafe'
    Left = 16
    Top = 216
  end
  object tCA: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Codigo_Acesso'
    Left = 80
    Top = 216
    object tCACodigo_Acesso: TWideStringField
      DisplayWidth = 20
      FieldName = 'Codigo_Acesso'
      Size = 12
    end
    object tCAstatus: TWideStringField
      DisplayWidth = 6
      FieldName = 'status'
      Size = 1
    end
    object tCAValor_Disponivel: TWideStringField
      DisplayWidth = 16
      FieldName = 'Valor_Disponivel'
      Size = 8
    end
    object tCAData_Criacao: TWideStringField
      DisplayWidth = 13
      FieldName = 'Data_Criacao'
      Size = 10
    end
    object tCAURL: TWideStringField
      DisplayWidth = 306
      FieldName = 'URL'
      Size = 255
    end
    object tCATipo_Codigo: TWideStringField
      DisplayWidth = 12
      FieldName = 'Tipo_Codigo'
      Size = 1
    end
    object tCAVendido: TBooleanField
      DisplayWidth = 8
      FieldName = 'Vendido'
    end
    object tCAVinculado: TBooleanField
      DisplayWidth = 9
      FieldName = 'Vinculado'
    end
  end
  object tVC: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Venda_Codigos'
    Left = 80
    Top = 184
    object tVCCodigo: TFloatField
      FieldName = 'Codigo'
    end
    object tVCData: TWideStringField
      FieldName = 'Data'
      Size = 10
    end
    object tVCHora: TWideStringField
      FieldName = 'Hora'
      Size = 8
    end
    object tVCCodigo_Acesso: TWideStringField
      FieldName = 'Codigo_Acesso'
      Size = 12
    end
    object tVCNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tVCNick: TWideStringField
      FieldName = 'Nick'
      Size = 35
    end
    object tVCValor: TWideStringField
      FieldName = 'Valor'
      Size = 8
    end
    object tVCRecarregamento: TBooleanField
      FieldName = 'Recarregamento'
    end
    object tVCAvulsa: TBooleanField
      FieldName = 'Avulsa'
    end
    object tVCDesconto: TWideStringField
      FieldName = 'Desconto'
      Size = 12
    end
    object tVCMotivo_Desconto: TWideStringField
      FieldName = 'Motivo_Desconto'
      Size = 30
    end
    object tVCID_Caixa: TFloatField
      FieldName = 'ID_Caixa'
    end
  end
  object tF: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Clientes'
    Left = 48
    Top = 184
    object tFCodigo: TFloatField
      FieldName = 'Codigo'
    end
    object tFNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tFData_Nasc: TWideStringField
      FieldName = 'Data_Nasc'
      Size = 10
    end
    object tFRua: TWideStringField
      FieldName = 'Rua'
      Size = 33
    end
    object tFNumero: TWideStringField
      FieldName = 'Numero'
      Size = 6
    end
    object tFComplemento: TWideStringField
      FieldName = 'Complemento'
      Size = 13
    end
    object tFBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 33
    end
    object tFCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 33
    end
    object tFUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object tFTel_Residencial: TWideStringField
      FieldName = 'Tel_Residencial'
      Size = 17
    end
    object tFTel_Comercial: TWideStringField
      FieldName = 'Tel_Comercial'
      Size = 17
    end
    object tFTel_Celular: TWideStringField
      FieldName = 'Tel_Celular'
      Size = 17
    end
    object tFE_mail: TWideStringField
      FieldName = 'E_mail'
      Size = 60
    end
    object tFObs: TWideMemoField
      FieldName = 'Obs'
      BlobType = ftWideMemo
    end
    object tFCEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tFGrupo: TWideStringField
      FieldName = 'Grupo'
      Size = 30
    end
    object tFNick: TWideStringField
      FieldName = 'Nick'
      Size = 35
    end
    object tFFiliacao: TWideStringField
      FieldName = 'Filiacao'
      Size = 255
    end
    object tFDocumento: TWideStringField
      FieldName = 'Documento'
      Size = 30
    end
    object tFAutorizado: TBooleanField
      FieldName = 'Autorizado'
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;User ID=Admin;Data Source=c:\n' +
      'excafe\timercafe.mdb;Mode=Read;Jet OLEDB:System database="";Jet ' +
      'OLEDB:Registry Path="";Jet OLEDB:Database Password=fad0001;Jet O' +
      'LEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=0;Jet OLEDB:G' +
      'lobal Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Je' +
      't OLEDB:New Database Password="";Jet OLEDB:Create System Databas' +
      'e=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Lo' +
      'cale on Compact=False;Jet OLEDB:Compact Without Replica Repair=F' +
      'alse;Jet OLEDB:SFP=False;Jet OLEDB:Support Complex Data=False;'
    LoginPrompt = False
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 16
    Top = 184
  end
  object tP: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Produtos'
    Left = 48
    Top = 216
    object tPCodigo: TFloatField
      FieldName = 'Codigo'
    end
    object tPData: TWideStringField
      FieldName = 'Data'
      Size = 10
    end
    object tPHora: TWideStringField
      FieldName = 'Hora'
      Size = 8
    end
    object tPDescr: TWideStringField
      FieldName = 'Descri'#231#227'o'
      Size = 50
    end
    object tPQuantidade: TWideStringField
      FieldName = 'Quantidade'
      Size = 6
    end
    object tPEstoque_Min: TWideStringField
      FieldName = 'Estoque_Min'
      Size = 6
    end
    object tPValor_Unitario: TWideStringField
      FieldName = 'Valor_Unitario'
      Size = 8
    end
    object tPFornecedor: TWideStringField
      FieldName = 'Fornecedor'
      Size = 50
    end
    object tPCod: TWideStringField
      FieldName = 'Cod'
      Size = 3
    end
    object tPServico: TBooleanField
      FieldName = 'Servico'
    end
    object tPCardapio: TBooleanField
      FieldName = 'Cardapio'
    end
    object tPCod_Barra: TWideStringField
      FieldName = 'Cod_Barra'
      Size = 13
    end
    object tPCategoria: TWideStringField
      FieldName = 'Categoria'
      Size = 40
    end
  end
  object tProd: TnxTable
    Database = nxDB
    TableName = 'Produto'
    Left = 432
    Top = 88
    object tProdID: TAutoIncField
      FieldName = 'ID'
    end
    object tProdCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object tProdDescricao: TStringField
      FieldName = 'Descricao'
      Size = 55
    end
    object tProdUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object tProdPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object tProdObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tProdImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tProdCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tProdFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object tProdSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tProdEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tProdCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tProdEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tProdEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tProdPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tProdNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tProdEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object tProdEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object tProdAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object tProdAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object tProdEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object tProdAtivo: TBooleanField
      FieldName = 'Ativo'
    end
    object tProdFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tProdFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
  end
  object tMovEst: TnxTable
    Database = nxDB
    TableName = 'MovEst'
    Left = 464
    Top = 88
    object tMovEstID: TAutoIncField
      FieldName = 'ID'
    end
    object tMovEstTran: TIntegerField
      FieldName = 'Tran'
    end
    object tMovEstProduto: TIntegerField
      FieldName = 'Produto'
    end
    object tMovEstQuant: TFloatField
      FieldName = 'Quant'
    end
    object tMovEstUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tMovEstTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMovEstCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tMovEstItem: TWordField
      FieldName = 'Item'
    end
    object tMovEstDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMovEstPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tMovEstPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tMovEstDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tMovEstDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tMovEstEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMovEstCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMovEstEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tMovEstCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tMovEstCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tMovEstCategoria: TStringField
      FieldName = 'Categoria'
    end
    object tMovEstNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tMovEstITran: TIntegerField
      FieldName = 'ITran'
    end
    object tMovEstTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tMovEstSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tMovEstplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
    object tMovEstplusTran: TBooleanField
      FieldName = 'plusTran'
    end
    object tMovEstFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tMovEstFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
  end
  object nxSession2: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 432
    Top = 48
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 464
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = tF
    Left = 296
    Top = 248
  end
end
