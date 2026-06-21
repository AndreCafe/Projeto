unit cmTotCaixa;

interface

uses
  cmClassesBase,
  SysUtils,
  nxdb;

function TotalizaCaixa(DB: TnxDatabase;
                       Num, CaixaI, CaixaF: Integer;
                       var Acesso,
                           AcessoNaoPago,
                           AcessoDebPago,
                           Venda,
                           VendaNaoPago,
                           VendaDebPago,
                           Suprimento,
                           Sangria,
                           Descontos,
                           TempoAcesso,
                           TempoManut : Extended;
                       var
                           QuantAcesso,
                           QuantVenda : Integer): Boolean;


implementation

function TotalizaCaixa(DB: TnxDatabase;
                       Num, CaixaI, CaixaF: Integer;
                       var Acesso,
                           AcessoNaoPago,
                           AcessoDebPago,
                           Venda,
                           VendaNaoPago,
                           VendaDebPago,
                           Suprimento,
                           Sangria,
                           Descontos,
                           TempoAcesso,
                           TempoManut : Extended;
                       var
                           QuantAcesso,
                           QuantVenda : Integer): Boolean;
var
  Q : TnxQuery;
begin
  Q := TnxQuery.Create(nil);
  try
    Q.Database := DB;
    Q.Active := False;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT ' +
              '  Tipo, StatusPagto, ' +
              '  Count(*) as Quant, ' +
              '  Sum(ValorFinalAcesso) as Acesso, ' +
              '  Sum(Valor) as Valor, ' +
              '  Sum(Desconto) as DescAcesso, ' +
              '  Sum(Produtos) as Produtos, ' +
              '  Sum(DescontoProduto) as DescProd, ' +
              '  Sum(Cast(Tempo as FLOAT)) as Tempo ' +
              'FROM ' +
              '  Transacao ');
    if Num>0 then
      Q.SQL.Add('WHERE ' +
                '  ((CaixaP='+IntToStr(Num)+') AND (StatusPagto=2)) OR'+
                '  ((CaixaF='+IntToStr(Num)+') AND (StatusPagto=3)) ')
    else
      Q.SQL.Add('WHERE ' +
                '  (CaixaF>='+IntToStr(CaixaI)+') AND (CaixaF<='+IntTOStr(CaixaF)+')');
    Q.SQL.Add('GROUP BY ' +
              '  Tipo, StatusPagto');
    Q.Open;

    Acesso        := 0;
    AcessoNaoPago := 0;
    AcessoDebPago := 0;
    Venda         := 0;
    VendaNaoPago  := 0;
    VendaDebPago  := 0;
    Suprimento    := 0;
    Sangria       := 0;
    Descontos     := 0;
    TempoAcesso   := 0;
    TempoManut    := 0;
    QuantAcesso   := 0;
    QuantVenda    := 0;

    Q.First;
    while not Q.Eof do begin
      case Q.FieldByName('Tipo').AsInteger of
        ttAcesso,
        ttAcessoVenda,
        ttEstVenda :
        begin
          Acesso := Acesso + Q.FieldByName('Acesso').AsFloat;
          Venda := Venda + Q.FieldByName('Produtos').AsFloat - Q.FieldByName('DescProd').AsFloat;
          if Q.FieldByName('StatusPagto').AsInteger=spDebitado then begin
            AcessoNaoPago := AcessoNaoPago + Q.FieldByName('Acesso').AsFloat;
            VendaNaoPago := VendaNaoPago + Q.FieldByName('Produtos').AsFloat - Q.FieldByName('DescProd').AsFloat;
          end;
          Descontos := Descontos + Q.FieldByName('DescAcesso').AsFloat +
                                   Q.FieldByName('DescProd').AsFloat;

          if Q.FieldByName('Tipo').AsInteger <> ttEstVenda then begin
            TempoAcesso := TempoAcesso + Q.FieldByName('Tempo').AsFloat;
            QuantAcesso := QuantAcesso + Q.FieldByName('Quant').AsInteger;
          end;

          if Q.FieldByName('Tipo').AsInteger <> ttAcesso then
            QuantVenda := QuantVenda + Q.FieldByName('Quant').AsInteger;
        end;

        ttSinal,
        ttVendaPacote,
        ttCreditoTempo :
        begin
          Acesso := Acesso + Q.FieldByName('Valor').AsFloat - Q.FieldByName('DescAcesso').AsFloat;
          if Q.FieldByName('StatusPagto').AsInteger=spDebitado then
            AcessoNaoPago := AcessoNaoPago + Q.FieldByName('Valor').AsFloat - Q.FieldByName('DescAcesso').AsFloat;
          Descontos := Descontos + Q.FieldByName('DescAcesso').AsFloat;
        end;

        ttManutencao        : TempoManut := TempoManut + Q.FieldByName('Tempo').AsFloat;

        ttPagtoDebito :
        begin
          VendaDebPago := VendaDebPago + Q.FieldByName('Produtos').AsFloat - Q.FieldByName('DescProd').AsFloat;
          AcessoDebPago := AcessoDebPago + Q.FieldByName('Acesso').AsFloat;
          Descontos := Descontos + Q.FieldByName('DescAcesso').AsFloat +
                                   Q.FieldByName('DescProd').AsFloat;
        end;

        ttSuprimentoCaixa   : Suprimento := Suprimento + Q.FieldByName('Valor').AsFloat;
        ttSangriaCaixa      : Sangria := Sangria + Q.FieldByName('Valor').AsFloat;
      end;
      Q.Next;
    end;
    Q.Close;
    TempoAcesso := TempoAcesso * 24;
    TempoManut := TempoManut * 24;
  finally
    Q.Free;
  end;
end;

end.
