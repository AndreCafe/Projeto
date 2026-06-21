// =============================================================================
// Source auto-created 20/11/2003 17:31:39 by FFCodeGun v.4.13a
// 
// Main Source
// 
// !!Do not forget to have ffxJFNutils units
// in your project library path!!
// =============================================================================
// FFTable format supported: FF2
// 
// Procedural Mode - Common Table Creation Settings:
// - Call procedure     : None
// - Field Constants    : False
// - Interface          : False
// - Routine            : Dictionary function
// 
// =============================================================================

function ffTblAcessoDict : TffDataDictionary;
  // Acesso.FF2

var
  FldArray : TffFieldList;
  FldVCheck : TffVCheckDescriptor;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Numero', '', fftAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Caixa', '', fftInt32, 0, 0, False, nil);

// 2
Result.AddField('Aberto', '', fftBoolean, 0, 0, False, nil);

// 3
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('16318464', fftWord16, FldVCheck.vdMinVal);
// SetVCheckVal('16121856', fftWord16, FldVCheck.vdMaxVal);
SetVCheckVal('16121856', fftWord16, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('TipoAcesso', '', fftWord16, 0, 0, False, @FldVCheck);

// 4
Result.AddField('Inicio', '', fftDateTime, 0, 0, False, nil);

// 5
Result.AddField('Fim', '', fftDateTime, 0, 0, False, nil);

// 6
Result.AddField('DataPagto', '', fftDateTime, 0, 0, False, nil);

// 7
Result.AddField('Contato', '', fftWord32, 0, 0, False, nil);

// 8
Result.AddField('Nome', '', fftNullAnsiStr, 40, 0, False, nil);

// 9
Result.AddField('Maquina', '', fftByte, 0, 0, False, nil);

// 10
Result.AddField('Tipo', '', fftByte, 0, 0, False, nil);

// 11
Result.AddField('FuncI', '', fftNullAnsiStr, 10, 0, False, nil);

// 12
Result.AddField('FuncF', '', fftNullAnsiStr, 40, 0, False, nil);

// 13
Result.AddField('Tempo', '', fftDateTime, 0, 0, False, nil);

// 14
Result.AddField('TempoCobrado', '', fftDateTime, 0, 0, False, nil);

// 15
Result.AddField('CredUsado', '', fftWord32, 0, 0, False, nil);

// 16
Result.AddField('CredAnterior', '', fftWord32, 0, 0, False, nil);

// 17
Result.AddField('Desconto', '', fftCurrency, 0, 0, False, nil);

// 18
Result.AddField('Produtos', '', fftCurrency, 0, 0, False, nil);

// 19
Result.AddField('MotivoDesc', '', fftByte, 0, 0, False, nil);

// 20
Result.AddField('Valor', '', fftCurrency, 0, 0, False, nil);

// 21
Result.AddField('Obs', '', fftBLOBMemo, 0, 0, False, nil);

// 22
Result.AddField('Isento', '', fftBoolean, 0, 0, False, nil);

// 23
Result.AddField('FormaPagto', '', fftNullAnsiStr, 20, 0, False, nil);

// 24
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('False', fftBoolean, FldVCheck.vdMinVal);
// SetVCheckVal('False', fftBoolean, FldVCheck.vdMaxVal);
SetVCheckVal('False', fftBoolean, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('NaoUsarPacote', '', fftBoolean, 0, 0, False, @FldVCheck);

// 25
Result.AddField('CodPacote', '', fftWord16, 0, 0, False, nil);

// 26
Result.AddField('Sinal', '', fftCurrency, 0, 0, False, nil);

// 27
Result.AddField('AcessoPago', '', fftWord32, 0, 0, False, nil);

// 28
Result.AddField('ValorFinalAcesso', '', fftCurrency, 0, 0, False, nil);

// 29
Result.AddField('DescontoProduto', '', fftCurrency, 0, 0, False, nil);

// 30
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('False', fftBoolean, FldVCheck.vdMinVal);
// SetVCheckVal('False', fftBoolean, FldVCheck.vdMaxVal);
SetVCheckVal('False', fftBoolean, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('Manutencao', '', fftBoolean, 0, 0, False, @FldVCheck);

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

function ffTblCaixaDict : TffDataDictionary;
  // Caixa.FF2

var
  FldArray : TffFieldList;
  FldVCheck : TffVCheckDescriptor;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Numero', '', fftAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Abertura', '', fftDateTime, 0, 0, False, nil);

// 2
Result.AddField('Fechamento', '', fftDateTime, 0, 0, False, nil);

// 3
Result.AddField('Usuario', '', fftNullAnsiStr, 10, 0, False, nil);

// 4
Result.AddField('LancExtrasE', '', fftCurrency, 0, 0, False, nil);

// 5
Result.AddField('LancExtrasS', '', fftCurrency, 0, 0, False, nil);

// 6
Result.AddField('Descontos', '', fftCurrency, 0, 0, False, nil);

// 7
Result.AddField('Internet', '', fftCurrency, 0, 0, False, nil);

// 8
Result.AddField('Pacotes', '', fftCurrency, 0, 0, False, nil);

// 9
Result.AddField('Vendas', '', fftCurrency, 0, 0, False, nil);

// 10
Result.AddField('SaldoAnt', '', fftCurrency, 0, 0, False, nil);

// 11
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('False', fftBoolean, FldVCheck.vdMinVal);
// SetVCheckVal('False', fftBoolean, FldVCheck.vdMaxVal);
SetVCheckVal('False', fftBoolean, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('Aberto', '', fftBoolean, 0, 0, False, @FldVCheck);

// 12
Result.AddField('Obs', '', fftBLOBMemo, 0, 0, False, nil);

// 13
Result.AddField('AguardandoPagto', '', fftCurrency, 0, 0, False, nil);

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

function ffTblCategoriaDict : TffDataDictionary;
  // Categoria.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Descricao', '', fftNullString, 20, 0, False, nil);

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

function ffTblConfigDict : TffDataDictionary;
  // Config.FF2

var
  FldArray : TffFieldList;
  FldVCheck : TffVCheckDescriptor;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('NumSeq', '', fftAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Modulos', '', fftBLOBMemo, 0, 0, False, nil);

// 2
Result.AddField('TiposLancExtra', '', fftBLOBMemo, 0, 0, False, nil);

// 3
Result.AddField('ProgramasPermitidos', '', fftBLOBMemo, 0, 0, False, nil);

// 4
Result.AddField('JanelasExplorer', '', fftBLOBMemo, 0, 0, False, nil);

// 5
Result.AddField('FecharProgramas', '', fftBoolean, 0, 0, False, nil);

// 6
Result.AddField('AutoExecutar', '', fftNullAnsiStr, 200, 0, False, nil);

// 7
Result.AddField('LimiteTempoPadrao', '', fftDateTime, 0, 0, False, nil);

// 8
Result.AddField('PacoteTempoReal', '', fftBoolean, 0, 0, False, nil);

// 9
Result.AddField('PermiteLoginSemCred', '', fftBoolean, 0, 0, False, nil);

// 10
Result.AddField('PausarFimPacote', '', fftBoolean, 0, 0, False, nil);

// 11
Result.AddField('ProdutoImpressao', '', fftNullAnsiStr, 15, 0, False, nil);

// 12
Result.AddField('PermiteCapturaTela', '', fftBoolean, 0, 0, False, nil);

// 13
Result.AddField('AlertaFimTempo', '', fftDateTime, 0, 0, False, nil);

// 14
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('False', fftBoolean, FldVCheck.vdMinVal);
// SetVCheckVal('False', fftBoolean, FldVCheck.vdMaxVal);
SetVCheckVal('False', fftBoolean, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('VariosTiposAcesso', '', fftBoolean, 0, 0, False, @FldVCheck);

// 15
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('16318464', fftByte, FldVCheck.vdMinVal);
// SetVCheckVal('16121856', fftByte, FldVCheck.vdMaxVal);
SetVCheckVal('16121856', fftByte, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('ModoPagtoAcesso', '', fftByte, 0, 0, False, @FldVCheck);

// 16
Result.AddField('MostraPrePagoDec', '', fftBoolean, 0, 0, False, nil);

// 17
Result.AddField('TempoMaxAlerta', '', fftDateTime, 0, 0, False, nil);

// 18
Result.AddField('MostraCliCadAntesAvulso', '', fftBoolean, 0, 0, False, nil);

// 19
Result.AddField('Abre1', '', fftDateTime, 0, 0, False, nil);

// 20
Result.AddField('Abre2', '', fftDateTime, 0, 0, False, nil);

// 21
Result.AddField('Abre3', '', fftDateTime, 0, 0, False, nil);

// 22
Result.AddField('Abre4', '', fftDateTime, 0, 0, False, nil);

// 23
Result.AddField('Abre5', '', fftDateTime, 0, 0, False, nil);

// 24
Result.AddField('Abre6', '', fftDateTime, 0, 0, False, nil);

// 25
Result.AddField('Abre7', '', fftDateTime, 0, 0, False, nil);

// 26
Result.AddField('Fecha1', '', fftDateTime, 0, 0, False, nil);

// 27
Result.AddField('Fecha2', '', fftDateTime, 0, 0, False, nil);

// 28
Result.AddField('Fecha3', '', fftDateTime, 0, 0, False, nil);

// 29
Result.AddField('Fecha4', '', fftDateTime, 0, 0, False, nil);

// 30
Result.AddField('Fecha5', '', fftDateTime, 0, 0, False, nil);

// 31
Result.AddField('Fecha6', '', fftDateTime, 0, 0, False, nil);

// 32
Result.AddField('Fecha7', '', fftDateTime, 0, 0, False, nil);

// 33
Result.AddField('CorLivre', '', fftInt32, 0, 0, False, nil);

// 34
Result.AddField('CorFLivre', '', fftInt32, 0, 0, False, nil);

// 35
Result.AddField('CorUsoPrePago', '', fftInt32, 0, 0, False, nil);

// 36
Result.AddField('CorFUsoPrePago', '', fftInt32, 0, 0, False, nil);

// 37
Result.AddField('CorUsoPosPago', '', fftInt32, 0, 0, False, nil);

// 38
Result.AddField('CorFUsoPosPago', '', fftInt32, 0, 0, False, nil);

// 39
Result.AddField('CorAguardaPagto', '', fftInt32, 0, 0, False, nil);

// 40
Result.AddField('CorFAguardaPagto', '', fftInt32, 0, 0, False, nil);

// 41
Result.AddField('CorManutencao', '', fftInt32, 0, 0, False, nil);

// 42
Result.AddField('CorFManutencao', '', fftInt32, 0, 0, False, nil);

// 43
Result.AddField('CorPausado', '', fftInt32, 0, 0, False, nil);

// 44
Result.AddField('CorFPausado', '', fftInt32, 0, 0, False, nil);

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

function ffTblContatoDict : TffDataDictionary;
  // Contato.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', fftAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Nome', '', fftNullAnsiStr, 40, 0, False, nil);

// 2
Result.AddField('Endereco', '', fftNullAnsiStr, 50, 0, False, nil);

// 3
Result.AddField('Bairro', '', fftNullAnsiStr, 20, 0, False, nil);

// 4
Result.AddField('Cidade', '', fftNullAnsiStr, 30, 0, False, nil);

// 5
Result.AddField('UF', '', fftNullAnsiStr, 2, 0, False, nil);

// 6
Result.AddField('CEP', '', fftNullAnsiStr, 10, 0, False, nil);

// 7
Result.AddField('Nasc', '', fftDateTime, 0, 0, False, nil);

// 8
Result.AddField('Sexo', 'M=Masculo, F=Feminino', fftChar, 1, 0, False, nil);

// 9
Result.AddField('Obs', '', fftBLOBMemo, 0, 0, False, nil);

// 10
Result.AddField('Cpf', '', fftNullAnsiStr, 14, 0, False, nil);

// 11
Result.AddField('Rg', '', fftNullAnsiStr, 14, 0, False, nil);

// 12
Result.AddField('Telefone', '', fftNullAnsiStr, 15, 0, False, nil);

// 13
Result.AddField('Email', '', fftBLOBMemo, 0, 0, False, nil);

// 14
Result.AddField('CreditoM', '', fftWord32, 10, 0, False, nil);

// 15
Result.AddField('TempoTotal', '', fftWord32, 10, 0, False, nil);

// 16
Result.AddField('TempoInicial', '', fftWord32, 10, 0, False, nil);

// 17
Result.AddField('Isento', '', fftBoolean, 0, 0, False, nil);

// 18
Result.AddField('Username', '', fftNullAnsiStr, 40, 0, False, nil);

// 19
Result.AddField('Senha', '', fftNullAnsiStr, 10, 0, False, nil);

// 20
Result.AddField('UltVisita', '', fftDateTime, 0, 0, False, nil);

// 21
Result.AddField('Debito', '', fftCurrency, 0, 0, False, nil);

// 22
Result.AddField('Escola', '', fftNullAnsiStr, 40, 0, False, nil);

// 23
Result.AddField('NickName', '', fftNullAnsiStr, 30, 0, False, nil);

// 24
Result.AddField('DataNasc', '', fftDateTime, 0, 0, False, nil);

// 25
Result.AddField('Celular', '', fftNullAnsiStr, 15, 0, False, nil);

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

function ffTblCorDict : TffDataDictionary;
  // Cor.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('TipoAcesso', '', fftWord16, 0, 0, False, nil);

// 1
Result.AddField('Cor', '', fftInt32, 0, 0, False, nil);

// 2
Result.AddField('CorFonte', '', fftInt32, 0, 0, False, nil);

// 3
Result.AddField('Descricao', '', fftNullAnsiStr, 30, 0, False, nil);

// 4
Result.AddField('Reinicia', '', fftBoolean, 0, 0, False, nil);

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

function ffTblCorPrecoDict : TffDataDictionary;
  // CorPreco.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('TipoAcesso', '', fftWord16, 0, 0, False, nil);

// 1
Result.AddField('Cor', '', fftInt32, 0, 0, False, nil);

// 2
Result.AddField('CorFonte', '', fftInt32, 0, 0, False, nil);

// 3
Result.AddField('Preco', '', fftCurrency, 0, 0, False, nil);

// 4
Result.AddField('Tempo', '', fftDateTime, 0, 0, False, nil);

// 5
Result.AddField('ValorI', '', fftCurrency, 0, 0, False, nil);

// 6
Result.AddField('ToleranciaI', '', fftDateTime, 0, 0, False, nil);

// 7
Result.AddField('ValorA', '', fftCurrency, 0, 0, False, nil);

// 8
Result.AddField('ToleranciaA', '', fftDateTime, 0, 0, False, nil);

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

function ffTblCorPrecosDict : TffDataDictionary;
  // CorPrecos.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('TipoAcesso', '', fftWord16, 0, 0, False, nil);

// 1
Result.AddField('Cor', '', fftInt32, 0, 0, False, nil);

// 2
Result.AddField('Pos', '', fftWord16, 0, 0, False, nil);

// 3
Result.AddField('Valor', '', fftCurrency, 0, 0, False, nil);

// 4
Result.AddField('Tempo', '', fftDateTime, 0, 0, False, nil);

// 5
Result.AddField('ValorMin', '', fftCurrency, 0, 0, False, nil);

// 6
Result.AddField('Tolerancia', '', fftDateTime, 0, 0, False, nil);

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

function ffTblEntregadorDict : TffDataDictionary;
  // Entregador.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', fftAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Nome', '', fftNullAnsiStr, 30, 0, False, nil);

// 2
Result.AddField('Obs', '', fftBLOBMemo, 0, 0, False, nil);

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

function ffTblFormPagtoDict : TffDataDictionary;
  // FormPagto.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Descricao', '', fftNullAnsiStr, 20, 0, False, nil);

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

function ffTblGrupoDict : TffDataDictionary;
  // Grupo.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Nome', '', fftNullAnsiStr, 20, 0, False, nil);

// 1
Result.AddField('Usuarios', '', fftBLOBMemo, 0, 0, False, nil);

// 2
Result.AddField('Direitos', '', fftBLOBMemo, 0, 0, False, nil);

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

function ffTblHoraCorDict : TffDataDictionary;
  // HoraCor.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('TipoAcesso', '', fftWord16, 0, 0, False, nil);

// 1
Result.AddField('Dia', '', fftByte, 0, 0, False, nil);

// 2
Result.AddField('Hora', '', fftByte, 0, 0, False, nil);

// 3
Result.AddField('Cor', '', fftInt32, 0, 0, False, nil);

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

function ffTblHoraPrecoDict : TffDataDictionary;
  // HoraPreco.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('TipoAcesso', '', fftWord16, 0, 0, False, nil);

// 1
Result.AddField('Dia', '', fftByte, 0, 0, False, nil);

// 2
Result.AddField('Hora', '', fftByte, 0, 0, False, nil);

// 3
Result.AddField('Cor', '', fftInt32, 0, 0, False, nil);

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

function ffTblImpressaoDict : TffDataDictionary;
  // Impressao.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('IDSeq', '', fftAutoInc, 10, 0, False, nil);

// 1
Result.AddField('DataHora', '', fftDateTime, 0, 0, False, nil);

// 2
Result.AddField('Computador', '', fftNullAnsiStr, 200, 0, False, nil);

// 3
Result.AddField('Maquina', '', fftWord16, 5, 0, False, nil);

// 4
Result.AddField('Paginas', '', fftInt32, 0, 0, False, nil);

// 5
Result.AddField('Impressora', '', fftNullAnsiStr, 200, 0, False, nil);

// 6
Result.AddField('Documento', '', fftBLOBMemo, 0, 0, False, nil);

// 7
Result.AddField('Acesso', '', fftWord32, 0, 0, False, nil);

// 8
Result.AddField('Resultado', '0-Completou, 1-Erro', fftByte, 0, 0, False, nil);

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

function ffTblItensMEDict : TffDataDictionary;
  // ItensME.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('NumSeq', '', fftAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Emissor', '', fftWord32, 0, 0, False, nil);

// 2
Result.AddField('Serie', '', fftNullAnsiStr, 2, 0, False, nil);

// 3
Result.AddField('Numero', '', fftWord32, 0, 0, False, nil);

// 4
Result.AddField('Produto', '', fftNullAnsiStr, 15, 0, False, nil);

// 5
Result.AddField('Quant', '', fftDouble, 0, 0, False, nil);

// 6
Result.AddField('Unitario', '', fftCurrency, 0, 0, False, nil);

// 7
Result.AddField('Total', '', fftCurrency, 0, 0, False, nil);

// 8
Result.AddField('Item', '', fftByte, 0, 0, False, nil);

// 9
Result.AddField('Desconto', '', fftCurrency, 0, 0, False, nil);

// 10
Result.AddField('Data', '', fftDateTime, 0, 0, False, nil);

// 11
Result.AddField('MovEst', '', fftBoolean, 0, 0, False, nil);

// 12
Result.AddField('Entrada', '', fftBoolean, 0, 0, False, nil);

// 13
Result.AddField('Cancelado', '', fftBoolean, 0, 0, False, nil);

// 14
Result.AddField('EstoqueAnt', '', fftDouble, 0, 0, False, nil);

// 15
Result.AddField('TipoMov', '', fftNullAnsiStr, 15, 0, False, nil);

// 16
Result.AddField('Contato', '', fftWord32, 10, 0, False, nil);

// 17
Result.AddField('Caixa', '', fftInt32, 0, 0, False, nil);

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

function ffTblLancExtraDict : TffDataDictionary;
  // LancExtra.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Numero', '', fftAutoInc, 10, 0, False, nil);

// 1
Result.AddField('Dia', '', fftDateTime, 0, 0, False, nil);

// 2
Result.AddField('Caixa', '', fftInt32, 0, 0, False, nil);

// 3
Result.AddField('Usuario', '', fftNullAnsiStr, 10, 0, False, nil);

// 4
Result.AddField('Entrada', '', fftBoolean, 0, 0, False, nil);

// 5
Result.AddField('Tipo', '', fftNullAnsiStr, 30, 0, False, nil);

// 6
Result.AddField('Descricao', '', fftNullAnsiStr, 40, 0, False, nil);

// 7
Result.AddField('Valor', '', fftCurrency, 0, 0, False, nil);

// 8
Result.AddField('Obs', '', fftBLOBMemo, 0, 0, False, nil);

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

function ffTblLayoutDict : TffDataDictionary;
  // Layout.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Usuario', '', fftNullAnsiStr, 10, 0, False, nil);

// 1
Result.AddField('Grid', '', fftNullAnsiStr, 40, 0, False, nil);

// 2
Result.AddField('Nome', '', fftNullAnsiStr, 100, 0, False, nil);

// 3
Result.AddField('Publico', '', fftBoolean, 0, 0, False, nil);

// 4
Result.AddField('Layout', '', fftBLOB, 0, 0, False, nil);

// 5
Result.AddField('Filtro', '', fftBLOB, 0, 0, False, nil);

// 6
Result.AddField('Usuarios', '', fftBLOBMemo, 0, 0, False, nil);

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

function ffTblLogDict : TffDataDictionary;
  // Log.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('NumSeq', '', fftAutoInc, 10, 0, False, nil);

// 1
Result.AddField('DiaHora', '', fftDateTime, 0, 0, False, nil);

// 2
Result.AddField('Maquina', '', fftWord16, 0, 0, False, nil);

// 3
Result.AddField('Usuario', '', fftNullAnsiStr, 30, 0, False, nil);

// 4
Result.AddField('Programa', '0=nenhum, 1=cmguard, 2=cmadmin, 3=cmserver', fftByte, 3, 0, False, nil);

// 5
Result.AddField('Operacao', '', fftNullAnsiStr, 70, 0, False, nil);

// 6
Result.AddField('Horas', '', fftDateTime, 0, 0, False, nil);

// 7
Result.AddField('Dias', '', fftWord16, 0, 0, False, nil);

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

function ffTblMaquinaDict : TffDataDictionary;
  // Maquina.FF2

var
  FldArray : TffFieldList;
  FldVCheck : TffVCheckDescriptor;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Numero', '', fftWord16, 0, 0, False, nil);

// 1
Result.AddField('Nome', '', fftNullAnsiStr, 30, 0, False, nil);

// 2
Result.AddField('Inicio', '', fftDateTime, 0, 0, False, nil);

// 3
Result.AddField('Contato', '', fftWord32, 10, 0, False, nil);

// 4
Result.AddField('TipoAcesso', '', fftWord16, 0, 0, False, nil);

// 5
Result.AddField('NomeContato', '', fftNullAnsiStr, 40, 0, False, nil);

// 6
Result.AddField('InicioTicks', '', fftWord32, 10, 0, False, nil);

// 7
Result.AddField('Acesso', '', fftInt32, 0, 0, False, nil);

// 8
Result.AddField('CreditoCli', '', fftWord32, 10, 0, False, nil);

// 9
Result.AddField('Isento', '', fftBoolean, 0, 0, False, nil);

// 10
Result.AddField('Menu', '', fftBLOBMemo, 0, 0, False, nil);

// 11
Result.AddField('Recursos', '', fftBLOBMemo, 0, 0, False, nil);

// 12
Result.AddField('Sinal', '', fftCurrency, 0, 0, False, nil);

// 13
Result.AddField('Vendas', '', fftCurrency, 0, 0, False, nil);

// 14
Result.AddField('ObsAcesso', '', fftBLOBMemo, 0, 0, False, nil);

// 15
Result.AddField('LimiteTempo', '', fftWord32, 0, 0, False, nil);

// 16
Result.AddField('LiberaAlemPacote', '', fftBoolean, 0, 0, False, nil);

// 17
Result.AddField('TicksParadoPac', '', fftWord32, 0, 0, False, nil);

// 18
Result.AddField('ComputerName', '', fftNullAnsiStr, 200, 0, False, nil);

// 19
Result.AddField('AguardaPagto', '', fftBoolean, 0, 0, False, nil);

// 20
FldVCheck.vdHasMinVal := False;
FldVCheck.vdHasMaxVal := False;
FldVCheck.vdHasDefVal := True;
// SetVCheckVal('False', fftBoolean, FldVCheck.vdMinVal);
// SetVCheckVal('False', fftBoolean, FldVCheck.vdMaxVal);
SetVCheckVal('False', fftBoolean, FldVCheck.vdDefVal);
FldVCheck.vdPicture := '';

Result.AddField('Manutencao', '', fftBoolean, 0, 0, False, @FldVCheck);

// 21
Result.AddField('Caixa', '', fftInt32, 0, 0, False, nil);

// 22
Result.AddField('UsuarioI', '', fftNullString, 30, 0, False, nil);

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

function ffTblMEDict : TffDataDictionary;
  // ME.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Serie', '', fftNullAnsiStr, 2, 0, False, nil);

// 1
Result.AddField('Numero', '', fftWord32, 0, 0, True, nil);

// 2
Result.AddField('Caixa', '', fftWord32, 0, 0, False, nil);

// 3
Result.AddField('DiaHora', '', fftDateTime, 0, 0, False, nil);

// 4
Result.AddField('Tipo', '', fftNullAnsiStr, 15, 0, False, nil);

// 5
Result.AddField('Entrada', '', fftBoolean, 0, 0, False, nil);

// 6
Result.AddField('MovEst', '', fftBoolean, 0, 0, False, nil);

// 7
Result.AddField('Chamada', '', fftInt32, 0, 0, False, nil);

// 8
Result.AddField('Contato', '', fftInt32, 0, 0, False, nil);

// 9
Result.AddField('Usuario', '', fftNullAnsiStr, 10, 0, False, nil);

// 10
Result.AddField('Entregar', '', fftBoolean, 0, 0, False, nil);

// 11
Result.AddField('Entregador', '', fftWord16, 0, 0, False, nil);

// 12
Result.AddField('Cancelado', 'Null=Nao, Data = Sim', fftBoolean, 0, 0, False, nil);

// 13
Result.AddField('FormaPagto', '', fftNullAnsiStr, 15, 0, False, nil);

// 14
Result.AddField('Total', '', fftCurrency, 0, 0, False, nil);

// 15
Result.AddField('Desconto', '', fftCurrency, 0, 0, False, nil);

// 16
Result.AddField('Obs', '', fftBLOBMemo, 0, 0, False, nil);

// 17
Result.AddField('EndEnt', '', fftNullAnsiStr, 50, 0, False, nil);

// 18
Result.AddField('BaiEnt', '', fftNullAnsiStr, 25, 0, False, nil);

// 19
Result.AddField('CidEnt', '', fftNullAnsiStr, 25, 0, False, nil);

// 20
Result.AddField('UFEnt', '', fftNullAnsiStr, 2, 0, False, nil);

// 21
Result.AddField('Emissor', '', fftWord32, 2, 0, False, nil);

// 22
Result.AddField('DtMovimentacao', '', fftDateTime, 0, 0, False, nil);

// 23
Result.AddField('Situacao', '', fftNullAnsiStr, 20, 0, False, nil);

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

function ffTblMotivoDict : TffDataDictionary;
  // Motivo.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', fftByte, 0, 0, False, nil);

// 1
Result.AddField('Descricao', '', fftNullAnsiStr, 30, 0, False, nil);

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

function ffTblPacoteDict : TffDataDictionary;
  // Pacote.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', fftWord16, 0, 0, False, nil);

// 1
Result.AddField('Horas', '', fftWord16, 0, 0, False, nil);

// 2
Result.AddField('ValorTotal', '', fftCurrency, 0, 0, False, nil);

// 3
Result.AddField('Descr', '', fftNullAnsiStr, 30, 0, False, nil);

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

function ffTblProdutoDict : TffDataDictionary;
  // Produto.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', fftNullAnsiStr, 15, 0, False, nil);

// 1
Result.AddField('Descricao', '', fftNullAnsiStr, 40, 0, False, nil);

// 2
Result.AddField('Unid', '', fftNullAnsiStr, 5, 0, False, nil);

// 3
Result.AddField('Preco', '', fftCurrency, 5, 0, False, nil);

// 4
Result.AddField('Obs', '', fftBLOBMemo, 0, 0, False, nil);

// 5
Result.AddField('Imagem', '', fftBLOBGraphic, 0, 0, False, nil);

// 6
Result.AddField('Categoria', '', fftNullAnsiStr, 20, 0, False, nil);

// 7
Result.AddField('EstoqueAtual', '', fftExtended, 0, 0, False, nil);

// 8
Result.AddField('CustoUnitario', '', fftCurrency, 0, 0, False, nil);

// 9
Result.AddField('EstoqueACE', '', fftExtended, 0, 0, False, nil);

// 10
Result.AddField('EstoqueACS', '', fftExtended, 0, 0, False, nil);

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

function ffTblTipoAcessoDict : TffDataDictionary;
  // TipoAcesso.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Codigo', '', fftWord16, 5, 0, False, nil);

// 1
Result.AddField('Nome', '', fftNullAnsiStr, 30, 0, False, nil);

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

function ffTblTipoMovDict : TffDataDictionary;
  // TipoMov.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Nome', '', fftNullAnsiStr, 15, 0, False, nil);

// 1
Result.AddField('MovEst', '', fftBoolean, 0, 0, False, nil);

// 2
Result.AddField('Entrada', '', fftBoolean, 0, 0, False, nil);

// 3
Result.AddField('Serie', '', fftNullAnsiStr, 2, 0, False, nil);

// 4
Result.AddField('PermiteAlterarSerie', '', fftBoolean, 0, 0, False, nil);

// 5
Result.AddField('NumeroAutomatico', '', fftBoolean, 0, 0, False, nil);

// 6
Result.AddField('ConfirmarMovEstoque', '', fftBoolean, 0, 0, False, nil);

// 7
Result.AddField('AtualizaCusto', '', fftBoolean, 0, 0, False, nil);

// 8
Result.AddField('Situacoes', '', fftBLOBMemo, 0, 0, False, nil);

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

function ffTblUsuarioDict : TffDataDictionary;
  // Usuario.FF2

var
  FldArray : TffFieldList;
  FldIHList : TffFieldIHList;
  
begin
Result := TffDataDictionary.Create(4096);
{- encryption def ----------}
Result.IsEncrypted := False;

{- field defs ----------}
// 0
Result.AddField('Username', '', fftNullAnsiStr, 10, 0, False, nil);

// 1
Result.AddField('Nome', '', fftNullAnsiStr, 30, 0, False, nil);

// 2
Result.AddField('Admin', '', fftBoolean, 0, 0, False, nil);

// 3
Result.AddField('Senha', '', fftNullAnsiStr, 10, 0, False, nil);

// 4
Result.AddField('Grupos', '', fftBLOBMemo, 0, 0, False, nil);

// 5
Result.AddField('Direitos', '', fftBLOBMemo, 0, 0, False, nil);

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

