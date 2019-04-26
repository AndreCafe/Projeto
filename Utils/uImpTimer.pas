
unit uImpTimer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, ADODB, DBTables, nxreRemoteServerEngine;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    nxSE: TnxServerEngine;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliSexo: TStringField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliMinutos: TFloatField;
    tCliMinutosUsados: TFloatField;
    tCliMinutosIniciais: TFloatField;
    tCliIsento: TBooleanField;
    tCliUsername: TStringField;
    tCliPai: TStringField;
    tCliMae: TStringField;
    tCliSenha: TStringField;
    tCliUltVisita: TDateTimeField;
    tCliDebito: TCurrencyField;
    tCliEscola: TStringField;
    tCliEscolaHI: TDateTimeField;
    tCliEscolaHF: TDateTimeField;
    tCliNickName: TStringField;
    tCliDataNasc: TDateTimeField;
    tCliCelular: TStringField;
    tCliTemDebito: TBooleanField;
    tCliLimiteDebito: TCurrencyField;
    tCliFoto: TGraphicField;
    tCliIncluidoEm: TDateTimeField;
    tCliAlteradoEm: TDateTimeField;
    tCliIncluidoPor: TStringField;
    tCliAlteradoPor: TStringField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliValorCred: TCurrencyField;
    PB: TProgressBar;
    Button1: TButton;
    tCliObs: TMemoField;
    tCliEmail: TMemoField;
    dVC: TnxTable;
    nxDB2: TnxDatabase;
    dVCCodigo_Ace: TStringField;
    dVCNick: TStringField;
    tCliPassaportes: TFloatField;
    tCliTitEleitor: TStringField;
    tCliFidPontos: TFloatField;
    tCliFidTotal: TFloatField;
    tCliFidResg: TFloatField;
    tCliAniversario: TStringField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    tCA: TADOTable;
    tCACodigo_Acesso: TWideStringField;
    tCAstatus: TWideStringField;
    tCAValor_Disponivel: TWideStringField;
    tCAData_Criacao: TWideStringField;
    tCAURL: TWideStringField;
    tCATipo_Codigo: TWideStringField;
    tCAVendido: TBooleanField;
    tCAVinculado: TBooleanField;
    tVC: TADOTable;
    tVCCodigo: TFloatField;
    tVCData: TWideStringField;
    tVCHora: TWideStringField;
    tVCCodigo_Acesso: TWideStringField;
    tVCNome: TWideStringField;
    tVCNick: TWideStringField;
    tVCValor: TWideStringField;
    tVCRecarregamento: TBooleanField;
    tVCAvulsa: TBooleanField;
    tVCDesconto: TWideStringField;
    tVCMotivo_Desconto: TWideStringField;
    tVCID_Caixa: TFloatField;
    tF: TADOTable;
    tFCodigo: TFloatField;
    tFNome: TWideStringField;
    tFData_Nasc: TWideStringField;
    tFRua: TWideStringField;
    tFNumero: TWideStringField;
    tFComplemento: TWideStringField;
    tFBairro: TWideStringField;
    tFCidade: TWideStringField;
    tFUF: TWideStringField;
    tFTel_Residencial: TWideStringField;
    tFTel_Comercial: TWideStringField;
    tFTel_Celular: TWideStringField;
    tFE_mail: TWideStringField;
    tFObs: TWideMemoField;
    tFCEP: TWideStringField;
    tFGrupo: TWideStringField;
    tFNick: TWideStringField;
    tFFiliacao: TWideStringField;
    tFDocumento: TWideStringField;
    tFAutorizado: TBooleanField;
    ADOConnection1: TADOConnection;
    Label2: TLabel;
    Label1: TLabel;
    tP: TADOTable;
    tPCodigo: TFloatField;
    tPData: TWideStringField;
    tPHora: TWideStringField;
    tPDescr: TWideStringField;
    tPQuantidade: TWideStringField;
    tPEstoque_Min: TWideStringField;
    tPValor_Unitario: TWideStringField;
    tPFornecedor: TWideStringField;
    tPCod: TWideStringField;
    tPServico: TBooleanField;
    tPCardapio: TBooleanField;
    tPCod_Barra: TWideStringField;
    tPCategoria: TWideStringField;
    tProd: TnxTable;
    tProdID: TAutoIncField;
    tProdCodigo: TStringField;
    tProdDescricao: TStringField;
    tProdUnid: TStringField;
    tProdPreco: TCurrencyField;
    tProdObs: TnxMemoField;
    tProdImagem: TGraphicField;
    tProdCategoria: TStringField;
    tProdFornecedor: TIntegerField;
    tProdSubCateg: TStringField;
    tProdEstoqueAtual: TFloatField;
    tProdCustoUnitario: TCurrencyField;
    tProdEstoqueACE: TFloatField;
    tProdEstoqueACS: TFloatField;
    tProdPodeAlterarPreco: TBooleanField;
    tProdNaoControlaEstoque: TBooleanField;
    tProdEstoqueMin: TFloatField;
    tProdEstoqueMax: TFloatField;
    tProdAbaixoMin: TBooleanField;
    tProdAbaixoMinDesde: TDateTimeField;
    tProdEstoqueRepor: TFloatField;
    tProdAtivo: TBooleanField;
    tProdFidelidade: TBooleanField;
    tProdFidPontos: TIntegerField;
    tCliCotaImpEspecial: TBooleanField;
    tCliCotaImpDia: TIntegerField;
    tCliCotaImpMes: TIntegerField;
    tCliSemFidelidade: TBooleanField;
    tCliCHorario: TIntegerField;
    tCliOpCHorario: TWordField;
    tCliFornecedor: TBooleanField;
    tMovEst: TnxTable;
    tMovEstID: TAutoIncField;
    tMovEstTran: TIntegerField;
    tMovEstProduto: TIntegerField;
    tMovEstQuant: TFloatField;
    tMovEstUnitario: TCurrencyField;
    tMovEstTotal: TCurrencyField;
    tMovEstCustoU: TCurrencyField;
    tMovEstItem: TWordField;
    tMovEstDesconto: TCurrencyField;
    tMovEstPago: TCurrencyField;
    tMovEstPagoPost: TCurrencyField;
    tMovEstDescPost: TCurrencyField;
    tMovEstDataHora: TDateTimeField;
    tMovEstEntrada: TBooleanField;
    tMovEstCancelado: TBooleanField;
    tMovEstEstoqueAnt: TFloatField;
    tMovEstCliente: TIntegerField;
    tMovEstCaixa: TIntegerField;
    tMovEstCategoria: TStringField;
    tMovEstNaoControlaEstoque: TBooleanField;
    tMovEstITran: TIntegerField;
    tMovEstTipoTran: TWordField;
    tMovEstSessao: TIntegerField;
    tMovEstplusID: TGuidField;
    tMovEstplusTran: TBooleanField;
    tMovEstFidResgate: TBooleanField;
    tMovEstFidPontos: TFloatField;
    cbImpProd: TCheckBox;
    cbImpEst: TCheckBox;
    nxSession2: TnxSession;
    nxRSE: TnxRemoteServerEngine;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

function StrToCurrency(S: String): Currency;
var 
  Code, I : Integer;
  Res: Double;
  S2 : String;
begin
  Result := 0;
  S2 := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9', ',', '.'] then
    if S[I]=',' then
      S2 := S2 + '.' else
      S2 := S2 + S[I];
      
  S := S2;
    
  if (Trim(S)>'') then begin
    Val(S, Res, Code);
    if Code=0 then
      REsult := Res;
  end;
end;

function CodStr(I: Integer): String;
begin
  Result := IntToStr(I);
  while length(result)<3 do
    result := '0'+result;
end;

function FiltroCEP(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I]  in ['0'..'9', '-'] then
      Result := Result + S[I];
end;

function SoDig(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I]  in ['0'..'9'] then
      Result := Result + S[I];
end;


function FiltraEnd(S: String): String;
var i: integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if not (S[I] in [' ', '-']) then
      Result := Result + S[I];
  if Result<>'' then
    Result := Trim(S);   
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, Min, Cod, Qtd, Erros: Integer;
  S: String;
  Mon : Currency;

function ProxCampo: String;
var P: Integer;
begin
  P := Pos(';', S);
  if P>0 then begin
    Result := Trim(Copy(S, 1, P-1));
    Delete(S, 1, P);
  end else begin
    Result := Trim(S);
    S := '';
  end;  
  if Copy(Result, 1, 1)='"' then
    Delete(Result, 1, 1);
  if Copy(Result, Length(Result), 1)='"' then
    Delete(Result, Length(Result), 1);
end;  

begin
  TF.Open;
  tCli.Open;
  tCli.IndexName := 'IUsername';
  ShortDateFormat := 'DD-MM-yyyy';
  tMovEst.Open;
  tProd.Open;
  
  tCli.DeleteRecords;
  tMovEst.DeleteRecords;
  tProd.DeleteRecords;
  DecimalSeparator := ',';
  ThousandSeparator := '.';

  Button1.Enabled := False;

  PB.Max := TF.RecordCount;
  PB.Position := 0;
  if not dVC.Exists then dVC.CreateTable;

  Erros := 0;

  
  
  TVC.Open;
  TCA.Open;
  Cod := 100000;
  if cbImpProd.Checked then begin
    tP.Open;
    tProd.Open;
    tMovEst.Open;
    tMovEst.DeleteRecords;
  
    tProd.DeleteRecords;
    tP.First;
    while not tP.Eof do begin
      tProd.Insert;
      S := SoDig(tPCod_Barra.Value);
      if S>'' then
        tProdCodigo.Value := S else
        tProdCodigo.Value := Trim(tPCod.Value);
      tProdDescricao.Value := tPDescr.Value;
      tProdEstoqueMin.Value := StrToIntDef(tPEstoque_min.Value, 0);
      tProdPreco.Value := StrToFloatDef(tPValor_Unitario.Value, 0);
      tProdCategoria.Value := tPCategoria.Value;
      S := Trim(tPFornecedor.Value);
      tCli.IndexName := 'IFornecedorNome';
      if S>'' then begin
        if not tCli.FindKey([True, S]) then begin
          Inc(Cod);
          tCli.Insert;
          tCliID.Value := Cod;
          tCliNome.Value := tPFornecedor.Value;
          tCliFornecedor.Value := True;
          tCli.Post;
        end;
        tProdFornecedor.Value := tCliID.Value;
      end;
      if cbImpEst.Checked then begin
        Qtd := StrToIntDef(tPQuantidade.Value, 0);
        if Qtd > 0 then 
          tProdEstoqueAtual.Value := Qtd;
      end else
        Qtd := 0;
        
      tProd.Post;
      if Qtd>0 then begin
        tMovEst.Insert;
        tMovEstDataHora.Value := Date;
        tMovEstProduto.Value := tProdID.Value;
        tMovEstQuant.Value := Qtd;
        tMovEstEntrada.Value := True;
        tMovEstTipoTran.Value := 6;
        tMovEstEstoqueAnt.Value := 0;
        tMovEst.Post;
      end;
      tP.Next;
    end;
  end; 

  Cod := 0;
  tCli.IndexName := 'IID';

  Erros := 0;
  
  TF.First;
  while not TF.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    try
      tCli.Insert;
      tCliID.Value := Trunc(TFCodigo.Value);
      if tCliID.Value>Cod then Cod := tCliID.Value;
    
      tCliNome.Value := TFNome.Value;
      tCliEndereco.Value := Trim(TFRua.Value+' '+tFNumero.Value);
      if Trim(tFComplemento.Value)<>'------' then
        tCliEndereco.Value := Trim(tCliEndereco.Value+' '+tFComplemento.Value);
      tCliEndereco.Value := FiltraEnd(tCliEndereco.Value);
      tCliUsername.Value := TFNick.Value;
      tCliSenha.Value := '';
      tCliIncluidoEm.Value := Now;
      tCliAlteradoEm.Value := Now;
      tCliRG.Value := TFDocumento.Value;
      tCliSexo.Value := 'M';
      tCliBairro.Value := TFBairro.Value;
      tCliCidade.Value := TFCidade.Value;
      tCliCEP.Value := TFCep.Value;
      tCliUF.Value := TFUF.Value;
      tCliTelefone.Value := TFTel_Residencial.Value;
      tCliCelular.Value := TFTel_Celular.Value;
      tCliEmail.Value := TFE_mail.Value;
      tCliObs.Value := TFObs.Value;
      tCliCEP.Value := FiltroCEP(TFCEP.Value);
      tCliMae.Value := TFFiliacao.Value;
      try
        tCliDataNasc.AsVariant := TFData_Nasc.Value;
      except
        tCliDataNasc.Clear;
      end;  
      if tCliDataNasc.Value <= 1 then
        tCliDataNasc.Clear;
      tCliIncluidoPor.value := 'admin';
      tCliInativo.Value := False;
      tCli.Post;
    except
      Inc(Erros);
      tCli.Cancel;
    end;
    
    TF.Next;
  end;

  tCli.SetAutoIncValue(Cod);

  if Erros >0 then ShowMessage('Erro na importação de ' + IntToStr(Erros) + ' cliente(s)');

  dVC.Active := True;
  dVC.EmptyTable;
  
  tVC.Active := True;
  tVC.First;
  PB.Max := tVC.RecordCount;
  PB.Position := 1;
  Caption := 'Importando VC';
  while not tVC.Eof do begin
    dVC.Insert;
    dVCNick.Value := tVCNome.Value;
    dVCCodigo_Ace.Value := tVCCodigo_Acesso.Value;
    dVC.Post;
    tVC.Next;
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
  end;
  

  tCli.IndexName := 'IID';
  Caption := 'Importando CA';
  PB.Max := tCA.RecordCount;
  PB.Position := 1;
  tCA.First;
  Erros := 0;
  while not tCA.Eof do begin
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
    try
      Mon := StrToCurrency(tCAValor_Disponivel.Value);
      Cod := StrToIntDef(SoDig(tCACodigo_Acesso.Value), 0);
      if (S<>'') and (Mon>0) and (Cod>0) {and dVC.FindKey([S])} then
        if tCli.FindKey([Cod]) then begin
          tCli.Edit;
          tCliValorCred.Value := Mon;
          tCli.Post;
        end;
    except
      Inc(Erros);
    end;
    tCA.Next;
  end; 

  if Erros >0 then ShowMessage('Erro na importação do crédito de tempo de ' + IntToStr(Erros) + ' cliente(s)');
  

  ShowMessage('Fim de importacao - Zipar e enviar o arquivo CLIENTES.NX1 para o cliente');

  Close;
end;

procedure TForm16.FormCreate(Sender: TObject);
begin
  nxDB2.AliasPath := ExtractFilePath(ParamStr(0));
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
// Senha TimerCafe = fad0001
