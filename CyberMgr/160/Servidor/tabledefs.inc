// =============================================================================
// Source auto-created 20/11/2003 17:31:39 by FFCodeGun v.4.13a
// 
// Main Source
// 
// !!Do not forget to have ffxJFNutils units
// in your project library path!!
// =============================================================================
// nxTable format supported: FF2
// 
// Procedural Mode - Common Table Creation Settings:
// - Call procedure     : None
// - Field Constants    : False
// - Interface          : False
// - Routine            : Dictionary function
// 
// =============================================================================

function ffTblAcessoDict : TnxDataDictionary;
  // Acesso.FF2

var
  FldArray : TffFieldList;
  FldVCheck : TnxVCheckDescriptor;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Numero', '', nxtAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Caixa', '', nxtInt32, 0, 0, False, nil);

// 2
Result.AddField('Aberto', '', nxtBoolean, 0, 0, False, nil);

// 3
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('16318464', nxtWord16, FldVCheck.vdMinVal);
// SetVCheckVal('16121856', nxtWord16, FldVCheck.vdMaxVal);
SetVCheckVal('16121856', nxtWord16, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('TipoAcesso', '', nxtWord16, 0, 0, False, @FldVCheck);

// 4
Result.AddField('Inicio', '', nxtDateTime, 0, 0, False, nil);

// 5
Result.AddField('Fim', '', nxtDateTime, 0, 0, False, nil);

// 6
Result.AddField('DataPagto', '', nxtDateTime, 0, 0, False, nil);

// 7
Result.AddField('Contato', '', nxtWord32, 0, 0, False, nil);

// 8
Result.AddField('Nome', '', nxtNullAnsiStr, 40, 0, False, nil);

// 9
Result.AddField('Maquina', '', nxtByte, 0, 0, False, nil);

// 10
Result.AddField('Tipo', '', nxtByte, 0, 0, False, nil);

// 11
Result.AddField('FuncI', '', nxtNullAnsiStr, 10, 0, False, nil);

// 12
Result.AddField('FuncF', '', nxtNullAnsiStr, 40, 0, False, nil);

// 13
Result.AddField('Tempo', '', nxtDateTime, 0, 0, False, nil);

// 14
Result.AddField('TempoCobrado', '', nxtDateTime, 0, 0, False, nil);

// 15
Result.AddField('CredUsado', '', nxtWord32, 0, 0, False, nil);

// 16
Result.AddField('CredAnterior', '', nxtWord32, 0, 0, False, nil);

// 17
Result.AddField('Desconto', '', nxtCurrency, 0, 0, False, nil);

// 18
Result.AddField('Produtos', '', nxtCurrency, 0, 0, False, nil);

// 19
Result.AddField('MotivoDesc', '', nxtByte, 0, 0, False, nil);

// 20
Result.AddField('Valor', '', nxtCurrency, 0, 0, False, nil);

// 21
Result.AddField('Obs', '', nxtBLOBMemo, 0, 0, False, nil);

// 22
Result.AddField('Isento', '', nxtBoolean, 0, 0, False, nil);

// 23
Result.AddField('FormaPagto', '', nxtNullAnsiStr, 20, 0, False, nil);

// 24
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('False', nxtBoolean, FldVCheck.vdMinVal);
// SetVCheckVal('False', nxtBoolean, FldVCheck.vdMaxVal);
SetVCheckVal('False', nxtBoolean, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('NaoUsarPacote', '', nxtBoolean, 0, 0, False, @FldVCheck);

// 25
Result.AddField('CodPacote', '', nxtWord16, 0, 0, False, nil);

// 26
Result.AddField('Sinal', '', nxtCurrency, 0, 0, False, nil);

// 27
Result.AddField('AcessoPago', '', nxtWord32, 0, 0, False, nil);

// 28
Result.AddField('ValorFinalAcesso', '', nxtCurrency, 0, 0, False, nil);

// 29
Result.AddField('DescontoProduto', '', nxtCurrency, 0, 0, False, nil);

// 30
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('False', nxtBoolean, FldVCheck.vdMinVal);
// SetVCheckVal('False', nxtBoolean, FldVCheck.vdMaxVal);
SetVCheckVal('False', nxtBoolean, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('Manutencao', '', nxtBoolean, 0, 0, False, @FldVCheck);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Aberto');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Maquina');
FldIHList[1] := '';
Result.AddIndex('IAberto', '', 0, 2, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Contato');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Inicio');
FldIHList[1] := '';
Result.AddIndex('IContato', '', 0, 2, FldArray, FldIHList, True, True, True);

// 3
FldArray[0] := Result.GetFieldFromName('Inicio');
FldIHList[0] := '';
Result.AddIndex('IData', '', 0, 1, FldArray, FldIHList, True, True, True);

// 4
FldArray[0] := Result.GetFieldFromName('FuncI');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Inicio');
FldIHList[1] := '';
Result.AddIndex('IUsuario', '', 0, 2, FldArray, FldIHList, True, True, True);

// 5
FldArray[0] := Result.GetFieldFromName('Numero');
FldIHList[0] := '';
Result.AddIndex('INumero', '', 0, 1, FldArray, FldIHList, True, True, True);

// 6
FldArray[0] := Result.GetFieldFromName('Aberto');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('DataPagto');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Fim');
FldIHList[2] := '';
Result.AddIndex('IPagto', '', 0, 3, FldArray, FldIHList, True, False, True);

// 7
FldArray[0] := Result.GetFieldFromName('Fim');
FldIHList[0] := '';
Result.AddIndex('IFim', '', 0, 1, FldArray, FldIHList, True, True, True);

// 8
FldArray[0] := Result.GetFieldFromName('Caixa');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Inicio');
FldIHList[1] := '';
Result.AddIndex('ICaixa', '', 0, 2, FldArray, FldIHList, True, True, True);

// 9
FldArray[0] := Result.GetFieldFromName('CodPacote');
FldIHList[0] := '';
Result.AddIndex('ICodPac', '', 0, 1, FldArray, FldIHList, True, True, True);

// 10
FldArray[0] := Result.GetFieldFromName('Caixa');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Fim');
FldIHList[1] := '';
Result.AddIndex('ICaixaFim', '', 0, 2, FldArray, FldIHList, True, True, True);

// 11
FldArray[0] := Result.GetFieldFromName('AcessoPago');
FldIHList[0] := '';
Result.AddIndex('IAcessoPago', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblAcessoDict

function ffTblCaixaDict : TnxDataDictionary;
  // Caixa.FF2

var
  FldArray : TffFieldList;
  FldVCheck : TnxVCheckDescriptor;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Numero', '', nxtAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Abertura', '', nxtDateTime, 0, 0, False, nil);

// 2
Result.AddField('Fechamento', '', nxtDateTime, 0, 0, False, nil);

// 3
Result.AddField('Usuario', '', nxtNullAnsiStr, 10, 0, False, nil);

// 4
Result.AddField('LancExtrasE', '', nxtCurrency, 0, 0, False, nil);

// 5
Result.AddField('LancExtrasS', '', nxtCurrency, 0, 0, False, nil);

// 6
Result.AddField('Descontos', '', nxtCurrency, 0, 0, False, nil);

// 7
Result.AddField('Internet', '', nxtCurrency, 0, 0, False, nil);

// 8
Result.AddField('Pacotes', '', nxtCurrency, 0, 0, False, nil);

// 9
Result.AddField('Vendas', '', nxtCurrency, 0, 0, False, nil);

// 10
Result.AddField('SaldoAnt', '', nxtCurrency, 0, 0, False, nil);

// 11
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('False', nxtBoolean, FldVCheck.vdMinVal);
// SetVCheckVal('False', nxtBoolean, FldVCheck.vdMaxVal);
SetVCheckVal('False', nxtBoolean, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('Aberto', '', nxtBoolean, 0, 0, False, @FldVCheck);

// 12
Result.AddField('Obs', '', nxtBLOBMemo, 0, 0, False, nil);

// 13
Result.AddField('AguardandoPagto', '', nxtCurrency, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Numero');
FldIHList[0] := '';
Result.AddIndex('INumero', '', 0, 1, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Aberto');
FldIHList[0] := '';
Result.AddIndex('IAberto', '', 0, 1, FldArray, FldIHList, True, True, True);

// 3
FldArray[0] := Result.GetFieldFromName('Abertura');
FldIHList[0] := '';
Result.AddIndex('IDia', '', 0, 1, FldArray, FldIHList, True, True, True);

// 4
FldArray[0] := Result.GetFieldFromName('Usuario');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Abertura');
FldIHList[1] := '';
Result.AddIndex('IUsuario', '', 0, 2, FldArray, FldIHList, True, True, True);

end;// ffTblCaixaDict

function ffTblCategoriaDict : TnxDataDictionary;
  // Categoria.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Descricao', '', nxtNullString, 20, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Descricao');
FldIHList[0] := '';
Result.AddIndex('Nome', '', 0, 1, FldArray, FldIHList, False, True, True);

end;// ffTblCategoriaDict

function ffTblConfigDict : TnxDataDictionary;
  // Config.FF2

var
  FldArray : TffFieldList;
  FldVCheck : TnxVCheckDescriptor;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('NumSeq', '', nxtAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Modulos', '', nxtBLOBMemo, 0, 0, False, nil);

// 2
Result.AddField('TiposLancExtra', '', nxtBLOBMemo, 0, 0, False, nil);

// 3
Result.AddField('ProgramasPermitidos', '', nxtBLOBMemo, 0, 0, False, nil);

// 4
Result.AddField('JanelasExplorer', '', nxtBLOBMemo, 0, 0, False, nil);

// 5
Result.AddField('FecharProgramas', '', nxtBoolean, 0, 0, False, nil);

// 6
Result.AddField('AutoExecutar', '', nxtNullAnsiStr, 200, 0, False, nil);

// 7
Result.AddField('LimiteTempoPadrao', '', nxtDateTime, 0, 0, False, nil);

// 8
Result.AddField('PacoteTempoReal', '', nxtBoolean, 0, 0, False, nil);

// 9
Result.AddField('PermiteLoginSemCred', '', nxtBoolean, 0, 0, False, nil);

// 10
Result.AddField('PausarFimPacote', '', nxtBoolean, 0, 0, False, nil);

// 11
Result.AddField('ProdutoImpressao', '', nxtNullAnsiStr, 15, 0, False, nil);

// 12
Result.AddField('PermiteCapturaTela', '', nxtBoolean, 0, 0, False, nil);

// 13
Result.AddField('AlertaFimTempo', '', nxtDateTime, 0, 0, False, nil);

// 14
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('False', nxtBoolean, FldVCheck.vdMinVal);
// SetVCheckVal('False', nxtBoolean, FldVCheck.vdMaxVal);
SetVCheckVal('False', nxtBoolean, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('VariosTiposAcesso', '', nxtBoolean, 0, 0, False, @FldVCheck);

// 15
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('16318464', nxtByte, FldVCheck.vdMinVal);
// SetVCheckVal('16121856', nxtByte, FldVCheck.vdMaxVal);
SetVCheckVal('16121856', nxtByte, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('ModoPagtoAcesso', '', nxtByte, 0, 0, False, @FldVCheck);

// 16
Result.AddField('MostraPrePagoDec', '', nxtBoolean, 0, 0, False, nil);

// 17
Result.AddField('TempoMaxAlerta', '', nxtDateTime, 0, 0, False, nil);

// 18
Result.AddField('MostraCliCadAntesAvulso', '', nxtBoolean, 0, 0, False, nil);

// 19
Result.AddField('Abre1', '', nxtDateTime, 0, 0, False, nil);

// 20
Result.AddField('Abre2', '', nxtDateTime, 0, 0, False, nil);

// 21
Result.AddField('Abre3', '', nxtDateTime, 0, 0, False, nil);

// 22
Result.AddField('Abre4', '', nxtDateTime, 0, 0, False, nil);

// 23
Result.AddField('Abre5', '', nxtDateTime, 0, 0, False, nil);

// 24
Result.AddField('Abre6', '', nxtDateTime, 0, 0, False, nil);

// 25
Result.AddField('Abre7', '', nxtDateTime, 0, 0, False, nil);

// 26
Result.AddField('Fecha1', '', nxtDateTime, 0, 0, False, nil);

// 27
Result.AddField('Fecha2', '', nxtDateTime, 0, 0, False, nil);

// 28
Result.AddField('Fecha3', '', nxtDateTime, 0, 0, False, nil);

// 29
Result.AddField('Fecha4', '', nxtDateTime, 0, 0, False, nil);

// 30
Result.AddField('Fecha5', '', nxtDateTime, 0, 0, False, nil);

// 31
Result.AddField('Fecha6', '', nxtDateTime, 0, 0, False, nil);

// 32
Result.AddField('Fecha7', '', nxtDateTime, 0, 0, False, nil);

// 33
Result.AddField('CorLivre', '', nxtInt32, 0, 0, False, nil);

// 34
Result.AddField('CorFLivre', '', nxtInt32, 0, 0, False, nil);

// 35
Result.AddField('CorUsoPrePago', '', nxtInt32, 0, 0, False, nil);

// 36
Result.AddField('CorFUsoPrePago', '', nxtInt32, 0, 0, False, nil);

// 37
Result.AddField('CorUsoPosPago', '', nxtInt32, 0, 0, False, nil);

// 38
Result.AddField('CorFUsoPosPago', '', nxtInt32, 0, 0, False, nil);

// 39
Result.AddField('CorAguardaPagto', '', nxtInt32, 0, 0, False, nil);

// 40
Result.AddField('CorFAguardaPagto', '', nxtInt32, 0, 0, False, nil);

// 41
Result.AddField('CorManutencao', '', nxtInt32, 0, 0, False, nil);

// 42
Result.AddField('CorFManutencao', '', nxtInt32, 0, 0, False, nil);

// 43
Result.AddField('CorPausado', '', nxtInt32, 0, 0, False, nil);

// 44
Result.AddField('CorFPausado', '', nxtInt32, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('NumSeq');
FldIHList[0] := '';
Result.AddIndex('INumSeq', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblConfigDict

function ffTblContatoDict : TnxDataDictionary;
  // Contato.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', nxtAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Nome', '', nxtNullAnsiStr, 40, 0, False, nil);

// 2
Result.AddField('Endereco', '', nxtNullAnsiStr, 50, 0, False, nil);

// 3
Result.AddField('Bairro', '', nxtNullAnsiStr, 20, 0, False, nil);

// 4
Result.AddField('Cidade', '', nxtNullAnsiStr, 30, 0, False, nil);

// 5
Result.AddField('UF', '', nxtNullAnsiStr, 2, 0, False, nil);

// 6
Result.AddField('CEP', '', nxtNullAnsiStr, 10, 0, False, nil);

// 7
Result.AddField('Nasc', '', nxtDateTime, 0, 0, False, nil);

// 8
Result.AddField('Sexo', 'M=Masculo, F=Feminino', nxtChar, 1, 0, False, nil);

// 9
Result.AddField('Obs', '', nxtBLOBMemo, 0, 0, False, nil);

// 10
Result.AddField('Cpf', '', nxtNullAnsiStr, 14, 0, False, nil);

// 11
Result.AddField('Rg', '', nxtNullAnsiStr, 14, 0, False, nil);

// 12
Result.AddField('Telefone', '', nxtNullAnsiStr, 15, 0, False, nil);

// 13
Result.AddField('Email', '', nxtBLOBMemo, 0, 0, False, nil);

// 14
Result.AddField('CreditoM', '', nxtWord32, 10, 0, False, nil);

// 15
Result.AddField('TempoTotal', '', nxtWord32, 10, 0, False, nil);

// 16
Result.AddField('TempoInicial', '', nxtWord32, 10, 0, False, nil);

// 17
Result.AddField('Isento', '', nxtBoolean, 0, 0, False, nil);

// 18
Result.AddField('Username', '', nxtNullAnsiStr, 40, 0, False, nil);

// 19
Result.AddField('Senha', '', nxtNullAnsiStr, 10, 0, False, nil);

// 20
Result.AddField('UltVisita', '', nxtDateTime, 0, 0, False, nil);

// 21
Result.AddField('Debito', '', nxtCurrency, 0, 0, False, nil);

// 22
Result.AddField('Escola', '', nxtNullAnsiStr, 40, 0, False, nil);

// 23
Result.AddField('NickName', '', nxtNullAnsiStr, 30, 0, False, nil);

// 24
Result.AddField('DataNasc', '', nxtDateTime, 0, 0, False, nil);

// 25
Result.AddField('Celular', '', nxtNullAnsiStr, 15, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Codigo');
FldIHList[0] := '';
Result.AddIndex('ICodigo', '', 0, 1, FldArray, FldIHList, False, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Nome');
FldIHList[0] := '';
Result.AddIndex('INome', '', 0, 1, FldArray, FldIHList, True, True, True);

// 3
FldArray[0] := Result.GetFieldFromName('Username');
FldIHList[0] := '';
Result.AddIndex('IUsername', '', 0, 1, FldArray, FldIHList, True, True, True);

// 4
FldArray[0] := Result.GetFieldFromName('Rg');
FldIHList[0] := '';
Result.AddIndex('IRg', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblContatoDict

function ffTblCorDict : TnxDataDictionary;
  // Cor.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('TipoAcesso', '', nxtWord16, 0, 0, False, nil);

// 1
Result.AddField('Cor', '', nxtInt32, 0, 0, False, nil);

// 2
Result.AddField('CorFonte', '', nxtInt32, 0, 0, False, nil);

// 3
Result.AddField('Descricao', '', nxtNullAnsiStr, 30, 0, False, nil);

// 4
Result.AddField('Reinicia', '', nxtBoolean, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('TipoAcesso');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Cor');
FldIHList[1] := '';
Result.AddIndex('IPrim', '', 0, 2, FldArray, FldIHList, True, True, True);

end;// ffTblCorDict

function ffTblCorPrecoDict : TnxDataDictionary;
  // CorPreco.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('TipoAcesso', '', nxtWord16, 0, 0, False, nil);

// 1
Result.AddField('Cor', '', nxtInt32, 0, 0, False, nil);

// 2
Result.AddField('CorFonte', '', nxtInt32, 0, 0, False, nil);

// 3
Result.AddField('Preco', '', nxtCurrency, 0, 0, False, nil);

// 4
Result.AddField('Tempo', '', nxtDateTime, 0, 0, False, nil);

// 5
Result.AddField('ValorI', '', nxtCurrency, 0, 0, False, nil);

// 6
Result.AddField('ToleranciaI', '', nxtDateTime, 0, 0, False, nil);

// 7
Result.AddField('ValorA', '', nxtCurrency, 0, 0, False, nil);

// 8
Result.AddField('ToleranciaA', '', nxtDateTime, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('TipoAcesso');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Cor');
FldIHList[1] := '';
Result.AddIndex('IPrim', '', 0, 2, FldArray, FldIHList, True, True, True);

end;// ffTblCorPrecoDict

function ffTblCorPrecosDict : TnxDataDictionary;
  // CorPrecos.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('TipoAcesso', '', nxtWord16, 0, 0, False, nil);

// 1
Result.AddField('Cor', '', nxtInt32, 0, 0, False, nil);

// 2
Result.AddField('Pos', '', nxtWord16, 0, 0, False, nil);

// 3
Result.AddField('Valor', '', nxtCurrency, 0, 0, False, nil);

// 4
Result.AddField('Tempo', '', nxtDateTime, 0, 0, False, nil);

// 5
Result.AddField('ValorMin', '', nxtCurrency, 0, 0, False, nil);

// 6
Result.AddField('Tolerancia', '', nxtDateTime, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('TipoAcesso');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Cor');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Pos');
FldIHList[2] := '';
Result.AddIndex('IPrim', '', 0, 3, FldArray, FldIHList, True, True, True);

end;// ffTblCorPrecosDict

function ffTblEntregadorDict : TnxDataDictionary;
  // Entregador.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', nxtAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Nome', '', nxtNullAnsiStr, 30, 0, False, nil);

// 2
Result.AddField('Obs', '', nxtBLOBMemo, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Codigo');
FldIHList[0] := '';
Result.AddIndex('iCod', '', 0, 1, FldArray, FldIHList, False, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Nome');
FldIHList[0] := '';
Result.AddIndex('iNome', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblEntregadorDict

function ffTblFormPagtoDict : TnxDataDictionary;
  // FormPagto.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Descricao', '', nxtNullAnsiStr, 20, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Descricao');
FldIHList[0] := '';
Result.AddIndex('iDesc', '', 0, 1, FldArray, FldIHList, False, True, True);

end;// ffTblFormPagtoDict

function ffTblGrupoDict : TnxDataDictionary;
  // Grupo.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Nome', '', nxtNullAnsiStr, 20, 0, False, nil);

// 1
Result.AddField('Usuarios', '', nxtBLOBMemo, 0, 0, False, nil);

// 2
Result.AddField('Direitos', '', nxtBLOBMemo, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Nome');
FldIHList[0] := '';
Result.AddIndex('INome', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblGrupoDict

function ffTblHoraCorDict : TnxDataDictionary;
  // HoraCor.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('TipoAcesso', '', nxtWord16, 0, 0, False, nil);

// 1
Result.AddField('Dia', '', nxtByte, 0, 0, False, nil);

// 2
Result.AddField('Hora', '', nxtByte, 0, 0, False, nil);

// 3
Result.AddField('Cor', '', nxtInt32, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('TipoAcesso');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Dia');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Hora');
FldIHList[2] := '';
Result.AddIndex('IPrim', '', 0, 3, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('TipoAcesso');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Cor');
FldIHList[1] := '';
Result.AddIndex('ITipoAcessoCor', '', 0, 2, FldArray, FldIHList, True, True, True);

end;// ffTblHoraCorDict

function ffTblHoraPrecoDict : TnxDataDictionary;
  // HoraPreco.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('TipoAcesso', '', nxtWord16, 0, 0, False, nil);

// 1
Result.AddField('Dia', '', nxtByte, 0, 0, False, nil);

// 2
Result.AddField('Hora', '', nxtByte, 0, 0, False, nil);

// 3
Result.AddField('Cor', '', nxtInt32, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('TipoAcesso');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Dia');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Hora');
FldIHList[2] := '';
Result.AddIndex('IPrim', '', 0, 3, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('TipoAcesso');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Cor');
FldIHList[1] := '';
Result.AddIndex('ITipoAcessoCor', '', 0, 2, FldArray, FldIHList, True, True, True);

end;// ffTblHoraPrecoDict

function ffTblImpressaoDict : TnxDataDictionary;
  // Impressao.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('IDSeq', '', nxtAutoInc, 10, 0, False, nil);

// 1
Result.AddField('DataHora', '', nxtDateTime, 0, 0, False, nil);

// 2
Result.AddField('Computador', '', nxtNullAnsiStr, 200, 0, False, nil);

// 3
Result.AddField('Maquina', '', nxtWord16, 5, 0, False, nil);

// 4
Result.AddField('Paginas', '', nxtInt32, 0, 0, False, nil);

// 5
Result.AddField('Impressora', '', nxtNullAnsiStr, 200, 0, False, nil);

// 6
Result.AddField('Documento', '', nxtBLOBMemo, 0, 0, False, nil);

// 7
Result.AddField('Acesso', '', nxtWord32, 0, 0, False, nil);

// 8
Result.AddField('Resultado', '0-Completou, 1-Erro', nxtByte, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('IDSeq');
FldIHList[0] := '';
Result.AddIndex('IIDSeq', '', 0, 1, FldArray, FldIHList, True, False, True);

// 2
FldArray[0] := Result.GetFieldFromName('Acesso');
FldIHList[0] := '';
Result.AddIndex('IAcesso', '', 0, 1, FldArray, FldIHList, True, True, True);

// 3
FldArray[0] := Result.GetFieldFromName('Maquina');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('DataHora');
FldIHList[1] := '';
Result.AddIndex('IMaquina', '', 0, 2, FldArray, FldIHList, True, True, True);

// 4
FldArray[0] := Result.GetFieldFromName('Computador');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('DataHora');
FldIHList[1] := '';
Result.AddIndex('IComputador', '', 0, 2, FldArray, FldIHList, True, True, True);

// 5
FldArray[0] := Result.GetFieldFromName('DataHora');
FldIHList[0] := '';
Result.AddIndex('IDataHora', '', 0, 1, FldArray, FldIHList, True, False, True);

end;// ffTblImpressaoDict

function ffTblItensMEDict : TnxDataDictionary;
  // ItensME.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('NumSeq', '', nxtAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Emissor', '', nxtWord32, 0, 0, False, nil);

// 2
Result.AddField('Serie', '', nxtNullAnsiStr, 2, 0, False, nil);

// 3
Result.AddField('Numero', '', nxtWord32, 0, 0, False, nil);

// 4
Result.AddField('Produto', '', nxtNullAnsiStr, 15, 0, False, nil);

// 5
Result.AddField('Quant', '', nxtDouble, 0, 0, False, nil);

// 6
Result.AddField('Unitario', '', nxtCurrency, 0, 0, False, nil);

// 7
Result.AddField('Total', '', nxtCurrency, 0, 0, False, nil);

// 8
Result.AddField('Item', '', nxtByte, 0, 0, False, nil);

// 9
Result.AddField('Desconto', '', nxtCurrency, 0, 0, False, nil);

// 10
Result.AddField('Data', '', nxtDateTime, 0, 0, False, nil);

// 11
Result.AddField('MovEst', '', nxtBoolean, 0, 0, False, nil);

// 12
Result.AddField('Entrada', '', nxtBoolean, 0, 0, False, nil);

// 13
Result.AddField('Cancelado', '', nxtBoolean, 0, 0, False, nil);

// 14
Result.AddField('EstoqueAnt', '', nxtDouble, 0, 0, False, nil);

// 15
Result.AddField('TipoMov', '', nxtNullAnsiStr, 15, 0, False, nil);

// 16
Result.AddField('Contato', '', nxtWord32, 10, 0, False, nil);

// 17
Result.AddField('Caixa', '', nxtInt32, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Emissor');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Serie');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Numero');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('Item');
FldIHList[3] := '';
Result.AddIndex('IEmissor', '', 0, 4, FldArray, FldIHList, False, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Produto');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Data');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('NumSeq');
FldIHList[2] := '';
Result.AddIndex('iProd', '', 0, 3, FldArray, FldIHList, True, True, True);

// 3
FldArray[0] := Result.GetFieldFromName('Contato');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Data');
FldIHList[1] := '';
Result.AddIndex('IContato', '', 0, 2, FldArray, FldIHList, True, True, True);

// 4
FldArray[0] := Result.GetFieldFromName('Caixa');
FldIHList[0] := '';
Result.AddIndex('ICaixa', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblItensMEDict

function ffTblLancExtraDict : TnxDataDictionary;
  // LancExtra.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Numero', '', nxtAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Dia', '', nxtDateTime, 0, 0, False, nil);

// 2
Result.AddField('Caixa', '', nxtInt32, 0, 0, False, nil);

// 3
Result.AddField('Usuario', '', nxtNullAnsiStr, 10, 0, False, nil);

// 4
Result.AddField('Entrada', '', nxtBoolean, 0, 0, False, nil);

// 5
Result.AddField('Tipo', '', nxtNullAnsiStr, 30, 0, False, nil);

// 6
Result.AddField('Descricao', '', nxtNullAnsiStr, 40, 0, False, nil);

// 7
Result.AddField('Valor', '', nxtCurrency, 0, 0, False, nil);

// 8
Result.AddField('Obs', '', nxtBLOBMemo, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Dia');
FldIHList[0] := '';
Result.AddIndex('IDia', '', 0, 1, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Caixa');
FldIHList[0] := '';
Result.AddIndex('ICaixa', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblLancExtraDict

function ffTblLayoutDict : TnxDataDictionary;
  // Layout.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Usuario', '', nxtNullAnsiStr, 10, 0, False, nil);

// 1
Result.AddField('Grid', '', nxtNullAnsiStr, 40, 0, False, nil);

// 2
Result.AddField('Nome', '', nxtNullAnsiStr, 100, 0, False, nil);

// 3
Result.AddField('Publico', '', nxtBoolean, 0, 0, False, nil);

// 4
Result.AddField('Layout', '', nxtBlob, 0, 0, False, nil);

// 5
Result.AddField('Filtro', '', nxtBlob, 0, 0, False, nil);

// 6
Result.AddField('Usuarios', '', nxtBLOBMemo, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Publico');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Grid');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Usuario');
FldIHList[2] := '';
FldArray[3] := Result.GetFieldFromName('Nome');
FldIHList[3] := '';
Result.AddIndex('IPubGridUsuario', '', 0, 4, FldArray, FldIHList, True, True, True);

end;// ffTblLayoutDict

function ffTblLogDict : TnxDataDictionary;
  // Log.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('NumSeq', '', nxtAutoInc, 10, 0, False, nil);

// 1
Result.AddField('DiaHora', '', nxtDateTime, 0, 0, False, nil);

// 2
Result.AddField('Maquina', '', nxtWord16, 0, 0, False, nil);

// 3
Result.AddField('Usuario', '', nxtNullAnsiStr, 30, 0, False, nil);

// 4
Result.AddField('Programa', '0=nenhum, 1=cmguard, 2=cmadmin, 3=cmserver', nxtByte, 3, 0, False, nil);

// 5
Result.AddField('Operacao', '', nxtNullAnsiStr, 70, 0, False, nil);

// 6
Result.AddField('Horas', '', nxtDateTime, 0, 0, False, nil);

// 7
Result.AddField('Dias', '', nxtWord16, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('NumSeq');
FldIHList[0] := '';
Result.AddIndex('INumSeq', '', 0, 1, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('DiaHora');
FldIHList[0] := '';
Result.AddIndex('IDiaHora', '', 0, 1, FldArray, FldIHList, True, True, True);

// 3
FldArray[0] := Result.GetFieldFromName('NumSeq');
FldIHList[0] := '';
Result.AddIndex('IUsuarioNumSeq', '', 0, 1, FldArray, FldIHList, True, True, True);

// 4
FldArray[0] := Result.GetFieldFromName('Usuario');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('DiaHora');
FldIHList[1] := '';
Result.AddIndex('IUsuarioDiaHora', '', 0, 2, FldArray, FldIHList, True, True, True);

// 5
FldArray[0] := Result.GetFieldFromName('Programa');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Maquina');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('NumSeq');
FldIHList[2] := '';
Result.AddIndex('IProgramaMaq', '', 0, 3, FldArray, FldIHList, True, True, True);

end;// ffTblLogDict

function ffTblMaquinaDict : TnxDataDictionary;
  // Maquina.FF2

var
  FldArray : TffFieldList;
  FldVCheck : TnxVCheckDescriptor;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Numero', '', nxtWord16, 0, 0, False, nil);

// 1
Result.AddField('Nome', '', nxtNullAnsiStr, 30, 0, False, nil);

// 2
Result.AddField('Inicio', '', nxtDateTime, 0, 0, False, nil);

// 3
Result.AddField('Contato', '', nxtWord32, 10, 0, False, nil);

// 4
Result.AddField('TipoAcesso', '', nxtWord16, 0, 0, False, nil);

// 5
Result.AddField('NomeContato', '', nxtNullAnsiStr, 40, 0, False, nil);

// 6
Result.AddField('InicioTicks', '', nxtWord32, 10, 0, False, nil);

// 7
Result.AddField('Acesso', '', nxtInt32, 0, 0, False, nil);

// 8
Result.AddField('CreditoCli', '', nxtWord32, 10, 0, False, nil);

// 9
Result.AddField('Isento', '', nxtBoolean, 0, 0, False, nil);

// 10
Result.AddField('Menu', '', nxtBLOBMemo, 0, 0, False, nil);

// 11
Result.AddField('Recursos', '', nxtBLOBMemo, 0, 0, False, nil);

// 12
Result.AddField('Sinal', '', nxtCurrency, 0, 0, False, nil);

// 13
Result.AddField('Vendas', '', nxtCurrency, 0, 0, False, nil);

// 14
Result.AddField('ObsAcesso', '', nxtBLOBMemo, 0, 0, False, nil);

// 15
Result.AddField('LimiteTempo', '', nxtWord32, 0, 0, False, nil);

// 16
Result.AddField('LiberaAlemPacote', '', nxtBoolean, 0, 0, False, nil);

// 17
Result.AddField('TicksParadoPac', '', nxtWord32, 0, 0, False, nil);

// 18
Result.AddField('ComputerName', '', nxtNullAnsiStr, 200, 0, False, nil);

// 19
Result.AddField('AguardaPagto', '', nxtBoolean, 0, 0, False, nil);

// 20
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('False', nxtBoolean, FldVCheck.vdMinVal);
// SetVCheckVal('False', nxtBoolean, FldVCheck.vdMaxVal);
SetVCheckVal('False', nxtBoolean, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('Manutencao', '', nxtBoolean, 0, 0, False, @FldVCheck);

// 21
Result.AddField('Caixa', '', nxtInt32, 0, 0, False, nil);

// 22
Result.AddField('UsuarioI', '', nxtNullString, 30, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Numero');
FldIHList[0] := '';
Result.AddIndex('INumero', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblMaquinaDict

function ffTblMEDict : TnxDataDictionary;
  // ME.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Serie', '', nxtNullAnsiStr, 2, 0, False, nil);

// 1
Result.AddField('Numero', '', nxtWord32, 0, 0, True, nil);

// 2
Result.AddField('Caixa', '', nxtWord32, 0, 0, False, nil);

// 3
Result.AddField('DiaHora', '', nxtDateTime, 0, 0, False, nil);

// 4
Result.AddField('Tipo', '', nxtNullAnsiStr, 15, 0, False, nil);

// 5
Result.AddField('Entrada', '', nxtBoolean, 0, 0, False, nil);

// 6
Result.AddField('MovEst', '', nxtBoolean, 0, 0, False, nil);

// 7
Result.AddField('Chamada', '', nxtInt32, 0, 0, False, nil);

// 8
Result.AddField('Contato', '', nxtInt32, 0, 0, False, nil);

// 9
Result.AddField('Usuario', '', nxtNullAnsiStr, 10, 0, False, nil);

// 10
Result.AddField('Entregar', '', nxtBoolean, 0, 0, False, nil);

// 11
Result.AddField('Entregador', '', nxtWord16, 0, 0, False, nil);

// 12
Result.AddField('Cancelado', 'Null=Nao, Data = Sim', nxtBoolean, 0, 0, False, nil);

// 13
Result.AddField('FormaPagto', '', nxtNullAnsiStr, 15, 0, False, nil);

// 14
Result.AddField('Total', '', nxtCurrency, 0, 0, False, nil);

// 15
Result.AddField('Desconto', '', nxtCurrency, 0, 0, False, nil);

// 16
Result.AddField('Obs', '', nxtBLOBMemo, 0, 0, False, nil);

// 17
Result.AddField('EndEnt', '', nxtNullAnsiStr, 50, 0, False, nil);

// 18
Result.AddField('BaiEnt', '', nxtNullAnsiStr, 25, 0, False, nil);

// 19
Result.AddField('CidEnt', '', nxtNullAnsiStr, 25, 0, False, nil);

// 20
Result.AddField('UFEnt', '', nxtNullAnsiStr, 2, 0, False, nil);

// 21
Result.AddField('Emissor', '', nxtWord32, 2, 0, False, nil);

// 22
Result.AddField('DtMovimentacao', '', nxtDateTime, 0, 0, False, nil);

// 23
Result.AddField('Situacao', '', nxtNullAnsiStr, 20, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Chamada');
FldIHList[0] := '';
Result.AddIndex('IChamada', '', 0, 1, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Emissor');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Serie');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Numero');
FldIHList[2] := '';
Result.AddIndex('IEmissorSerieNum', '', 0, 3, FldArray, FldIHList, False, True, True);

// 3
FldArray[0] := Result.GetFieldFromName('DiaHora');
FldIHList[0] := '';
Result.AddIndex('IEmissao', '', 0, 1, FldArray, FldIHList, True, True, True);

// 4
FldArray[0] := Result.GetFieldFromName('Contato');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Serie');
FldIHList[1] := '';
FldArray[2] := Result.GetFieldFromName('Numero');
FldIHList[2] := '';
Result.AddIndex('IContatoSerieNum', '', 0, 3, FldArray, FldIHList, True, True, True);

// 5
FldArray[0] := Result.GetFieldFromName('DtMovimentacao');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('DiaHora');
FldIHList[1] := '';
Result.AddIndex('IMov', '', 0, 2, FldArray, FldIHList, True, True, True);

end;// ffTblMEDict

function ffTblMotivoDict : TnxDataDictionary;
  // Motivo.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', nxtByte, 0, 0, False, nil);

// 1
Result.AddField('Descricao', '', nxtNullAnsiStr, 30, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Codigo');
FldIHList[0] := '';
Result.AddIndex('ICodigo', '', 0, 1, FldArray, FldIHList, False, True, True);

end;// ffTblMotivoDict

function ffTblPacoteDict : TnxDataDictionary;
  // Pacote.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', nxtWord16, 0, 0, False, nil);

// 1
Result.AddField('Horas', '', nxtWord16, 0, 0, False, nil);

// 2
Result.AddField('ValorTotal', '', nxtCurrency, 0, 0, False, nil);

// 3
Result.AddField('Descr', '', nxtNullAnsiStr, 30, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Codigo');
FldIHList[0] := '';
FldArray[1] := Result.GetFieldFromName('Codigo');
FldIHList[1] := '';
Result.AddIndex('ICodigo', '', 0, 2, FldArray, FldIHList, True, True, True);

end;// ffTblPacoteDict

function ffTblProdutoDict : TnxDataDictionary;
  // Produto.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', nxtNullAnsiStr, 15, 0, False, nil);

// 1
Result.AddField('Descricao', '', nxtNullAnsiStr, 40, 0, False, nil);

// 2
Result.AddField('Unid', '', nxtNullAnsiStr, 5, 0, False, nil);

// 3
Result.AddField('Preco', '', nxtCurrency, 5, 0, False, nil);

// 4
Result.AddField('Obs', '', nxtBLOBMemo, 0, 0, False, nil);

// 5
Result.AddField('Imagem', '', nxtBLOBGraphic, 0, 0, False, nil);

// 6
Result.AddField('Categoria', '', nxtNullAnsiStr, 20, 0, False, nil);

// 7
Result.AddField('EstoqueAtual', '', nxtExtended, 0, 0, False, nil);

// 8
Result.AddField('CustoUnitario', '', nxtCurrency, 0, 0, False, nil);

// 9
Result.AddField('EstoqueACE', '', nxtExtended, 0, 0, False, nil);

// 10
Result.AddField('EstoqueACS', '', nxtExtended, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Codigo');
FldIHList[0] := '';
Result.AddIndex('ICodigo', '', 0, 1, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Descricao');
FldIHList[0] := '';
Result.AddIndex('IDescricao', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblProdutoDict

function ffTblTipoAcessoDict : TnxDataDictionary;
  // TipoAcesso.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', nxtWord16, 5, 0, False, nil);

// 1
Result.AddField('Nome', '', nxtNullAnsiStr, 30, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Codigo');
FldIHList[0] := '';
Result.AddIndex('ICodigo', '', 0, 1, FldArray, FldIHList, False, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Nome');
FldIHList[0] := '';
Result.AddIndex('INome', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblTipoAcessoDict

function ffTblTipoMovDict : TnxDataDictionary;
  // TipoMov.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Nome', '', nxtNullAnsiStr, 15, 0, False, nil);

// 1
Result.AddField('MovEst', '', nxtBoolean, 0, 0, False, nil);

// 2
Result.AddField('Entrada', '', nxtBoolean, 0, 0, False, nil);

// 3
Result.AddField('Serie', '', nxtNullAnsiStr, 2, 0, False, nil);

// 4
Result.AddField('PermiteAlterarSerie', '', nxtBoolean, 0, 0, False, nil);

// 5
Result.AddField('NumeroAutomatico', '', nxtBoolean, 0, 0, False, nil);

// 6
Result.AddField('ConfirmarMovEstoque', '', nxtBoolean, 0, 0, False, nil);

// 7
Result.AddField('AtualizaCusto', '', nxtBoolean, 0, 0, False, nil);

// 8
Result.AddField('Situacoes', '', nxtBLOBMemo, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Nome');
FldIHList[0] := '';
Result.AddIndex('INome', '', 0, 1, FldArray, FldIHList, False, True, True);

end;// ffTblTipoMovDict

function ffTblUsuarioDict : TnxDataDictionary;
  // Usuario.FF2

var
  FldArray : TffFieldList;
  FldIHList : TnxFieldIHList;
  
begin
Result := TnxDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Username', '', nxtNullAnsiStr, 10, 0, False, nil);

// 1
Result.AddField('Nome', '', nxtNullAnsiStr, 30, 0, False, nil);

// 2
Result.AddField('Admin', '', nxtBoolean, 0, 0, False, nil);

// 3
Result.AddField('Senha', '', nxtNullAnsiStr, 10, 0, False, nil);

// 4
Result.AddField('Grupos', '', nxtBLOBMemo, 0, 0, False, nil);

// 5
Result.AddField('Direitos', '', nxtBLOBMemo, 0, 0, False, nil);

{- external Blob files ----------}
// none

{- external indices files ----------}
// none

{- composite/user indices defs ----------}
// 0 : internal Seq. Access index
// 1
FldArray[0] := Result.GetFieldFromName('Username');
FldIHList[0] := '';
Result.AddIndex('IUsername', '', 0, 1, FldArray, FldIHList, True, True, True);

// 2
FldArray[0] := Result.GetFieldFromName('Nome');
FldIHList[0] := '';
Result.AddIndex('INome', '', 0, 1, FldArray, FldIHList, True, True, True);

end;// ffTblUsuarioDict

