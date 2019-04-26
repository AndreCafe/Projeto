unit uJuntaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxdb, nxsdServerEngine, nxsrServerEngine, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent, cxProgressBar,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit, LMDBrowseEdit, cxControls,
  cxContainer, cxEdit, cxLabel, Buttons, nxreRemoteServerEngine,
  Grids, DBGrids, StdCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxButtons;

type
  TForm18 = class(TForm)
    nxSession1: TnxSession;
    nxDBD: TnxDatabase;
    nxTCP: TnxWinsockTransport;
    tDCli: TnxTable;
    btnProcessar: TcxButton;
    cxLabel1: TcxLabel;
    edDir: TLMDBrowseEdit;
    PB: TcxProgressBar;
    lbProgresso: TcxLabel;
    nxDBO: TnxDatabase;
    nxRSE: TnxRemoteServerEngine;
    tOCli: TnxTable;
    tOPass: TnxTable;
    tDPass: TnxTable;
    tDPassID: TAutoIncField;
    tDPassNome: TStringField;
    tDPassTipoPass: TIntegerField;
    tDPassCliente: TIntegerField;
    tDPassExpirou: TBooleanField;
    tDPassSenha: TStringField;
    tDPassPrimeiroUso: TDateTimeField;
    tDPassTipoAcesso: TIntegerField;
    tDPassTipoExp: TWordField;
    tDPassExpirarEm: TDateTimeField;
    tDPassMaxSegundos: TIntegerField;
    tDPassSegundos: TIntegerField;
    tDPassAcessos: TIntegerField;
    tDPassDia1: TIntegerField;
    tDPassDia2: TIntegerField;
    tDPassDia3: TIntegerField;
    tDPassDia4: TIntegerField;
    tDPassDia5: TIntegerField;
    tDPassDia6: TIntegerField;
    tDPassDia7: TIntegerField;
    tDPassTran: TIntegerField;
    tDPassDataCompra: TDateTimeField;
    tDPassValido: TBooleanField;
    tDPassValor: TCurrencyField;
    tDPassSessao: TIntegerField;
    tOPassID: TAutoIncField;
    tOPassNome: TStringField;
    tOPassTipoPass: TIntegerField;
    tOPassCliente: TIntegerField;
    tOPassExpirou: TBooleanField;
    tOPassSenha: TStringField;
    tOPassPrimeiroUso: TDateTimeField;
    tOPassTipoAcesso: TIntegerField;
    tOPassTipoExp: TWordField;
    tOPassExpirarEm: TDateTimeField;
    tOPassMaxSegundos: TIntegerField;
    tOPassSegundos: TIntegerField;
    tOPassAcessos: TIntegerField;
    tOPassDia1: TIntegerField;
    tOPassDia2: TIntegerField;
    tOPassDia3: TIntegerField;
    tOPassDia4: TIntegerField;
    tOPassDia5: TIntegerField;
    tOPassDia6: TIntegerField;
    tOPassDia7: TIntegerField;
    tOPassTran: TIntegerField;
    tOPassDataCompra: TDateTimeField;
    tOPassValido: TBooleanField;
    tOPassValor: TCurrencyField;
    tOPassSessao: TIntegerField;
    DBGrid1: TDBGrid;
    Button1: TButton;
    tOCliID: TAutoIncField;
    tOCliNome: TStringField;
    tOCliEndereco: TStringField;
    tOCliBairro: TStringField;
    tOCliCidade: TStringField;
    tOCliUF: TStringField;
    tOCliCEP: TStringField;
    tOCliSexo: TStringField;
    tOCliObs: TnxMemoField;
    tOCliCpf: TStringField;
    tOCliRg: TStringField;
    tOCliTelefone: TStringField;
    tOCliEmail: TnxMemoField;
    tOCliMinutos: TFloatField;
    tOCliPassaportes: TFloatField;
    tOCliMinutosUsados: TFloatField;
    tOCliMinutosIniciais: TFloatField;
    tOCliIsento: TBooleanField;
    tOCliUsername: TStringField;
    tOCliPai: TStringField;
    tOCliMae: TStringField;
    tOCliSenha: TStringField;
    tOCliUltVisita: TDateTimeField;
    tOCliDebito: TCurrencyField;
    tOCliEscola: TStringField;
    tOCliEscolaHI: TDateTimeField;
    tOCliEscolaHF: TDateTimeField;
    tOCliNickName: TStringField;
    tOCliDataNasc: TDateTimeField;
    tOCliCelular: TStringField;
    tOCliTemDebito: TBooleanField;
    tOCliLimiteDebito: TCurrencyField;
    tOCliFoto: TGraphicField;
    tOCliIncluidoEm: TDateTimeField;
    tOCliAlteradoEm: TDateTimeField;
    tOCliIncluidoPor: TStringField;
    tOCliAlteradoPor: TStringField;
    tOCliTitEleitor: TStringField;
    tOCliFidPontos: TFloatField;
    tOCliFidTotal: TFloatField;
    tOCliFidResg: TFloatField;
    tOCliAniversario: TStringField;
    tOCliCotaImpEspecial: TBooleanField;
    tOCliCotaImpDia: TIntegerField;
    tOCliCotaImpMes: TIntegerField;
    tOCliSemFidelidade: TBooleanField;
    tOCliNaoGuardarCredito: TBooleanField;
    tOCliPermiteLoginSemCred: TBooleanField;
    tOCliCHorario: TIntegerField;
    tOCliOpCHorario: TWordField;
    tOCliHP1: TIntegerField;
    tOCliHP2: TIntegerField;
    tOCliHP3: TIntegerField;
    tOCliHP4: TIntegerField;
    tOCliHP5: TIntegerField;
    tOCliHP6: TIntegerField;
    tOCliHP7: TIntegerField;
    tOCliInativo: TBooleanField;
    tOCliTipoAcessoPref: TIntegerField;
    tOCliFornecedor: TBooleanField;
    tOCliValorCred: TCurrencyField;
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
    tMovEstFidResgate: TBooleanField;
    tMovEstFidPontos: TFloatField;
    tDeb: TnxTable;
    tDebData: TDateTimeField;
    tDebCliente: TIntegerField;
    tDebValor: TCurrencyField;
    tDebTipo: TWordField;
    tDebID: TIntegerField;
    tDCliID: TAutoIncField;
    tDCliNome: TStringField;
    tDCliEndereco: TStringField;
    tDCliBairro: TStringField;
    tDCliCidade: TStringField;
    tDCliUF: TStringField;
    tDCliCEP: TStringField;
    tDCliSexo: TStringField;
    tDCliObs: TnxMemoField;
    tDCliCpf: TStringField;
    tDCliRg: TStringField;
    tDCliTelefone: TStringField;
    tDCliEmail: TnxMemoField;
    tDCliMinutos: TFloatField;
    tDCliPassaportes: TFloatField;
    tDCliMinutosUsados: TFloatField;
    tDCliMinutosIniciais: TFloatField;
    tDCliIsento: TBooleanField;
    tDCliUsername: TStringField;
    tDCliPai: TStringField;
    tDCliMae: TStringField;
    tDCliSenha: TStringField;
    tDCliUltVisita: TDateTimeField;
    tDCliDebito: TCurrencyField;
    tDCliEscola: TStringField;
    tDCliEscolaHI: TDateTimeField;
    tDCliEscolaHF: TDateTimeField;
    tDCliNickName: TStringField;
    tDCliDataNasc: TDateTimeField;
    tDCliCelular: TStringField;
    tDCliTemDebito: TBooleanField;
    tDCliLimiteDebito: TCurrencyField;
    tDCliFoto: TGraphicField;
    tDCliIncluidoEm: TDateTimeField;
    tDCliAlteradoEm: TDateTimeField;
    tDCliIncluidoPor: TStringField;
    tDCliAlteradoPor: TStringField;
    tDCliTitEleitor: TStringField;
    tDCliFidPontos: TFloatField;
    tDCliFidTotal: TFloatField;
    tDCliFidResg: TFloatField;
    tDCliAniversario: TStringField;
    tDCliCotaImpEspecial: TBooleanField;
    tDCliCotaImpDia: TIntegerField;
    tDCliCotaImpMes: TIntegerField;
    tDCliSemFidelidade: TBooleanField;
    tDCliNaoGuardarCredito: TBooleanField;
    tDCliPermiteLoginSemCred: TBooleanField;
    tDCliCHorario: TIntegerField;
    tDCliOpCHorario: TWordField;
    tDCliHP1: TIntegerField;
    tDCliHP2: TIntegerField;
    tDCliHP3: TIntegerField;
    tDCliHP4: TIntegerField;
    tDCliHP5: TIntegerField;
    tDCliHP6: TIntegerField;
    tDCliHP7: TIntegerField;
    tDCliInativo: TBooleanField;
    tDCliTipoAcessoPref: TIntegerField;
    tDCliFornecedor: TBooleanField;
    tDCliValorCred: TCurrencyField;
    procedure btnProcessarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

{$R *.dfm}

procedure TransfDados(F, D: TDataset);
var 
  I : Integer;
  DF : TField;
begin
  for I := 0 to F.FieldCount - 1 do begin
    DF := D.FindField(F.Fields[I].FieldName);
    if DF<>nil then 
      DF.Value := F.Fields[I].Value;
  end;
end;

procedure TForm18.btnProcessarClick(Sender: TObject);
var 
  S: String;
  aNovo : Boolean;
begin
  btnProcessar.Enabled := False;

  PB.Visible := True;
  PB.Position := 0;
  nxTCP.Active := False;
  nxDBO.AliasName := '';
  nxDBO.AliasPath := edDir.Path;


  try
    nxTCP.Active := True;
    nxDBD.Open;
  except
    Raise Exception.Create('Não foi possível se conectar ao servidor NexCafé');
    Exit;
  end;
  
  try
    nxDBO.Open;
  except
    Raise Exception.Create('A pasta informada não existe');
  end;
  
  tOCli.Open;
//  tOPass.Open;

//  tOCli.setRange([true], [true]);
  
  tDCli.Open;
  tDPass.Open;
  tMovEst.Open;
  tDeb.Open;
  
  PB.Properties.Max := tOCli.RecordCount;

//  nxDBD.StartTransactionWith([tDCli, tDPass]);
  try
    while not tOCli.Eof do begin
      S := '';

      if (not tOCliRG.isNull) and 
         (Trim(tOCliRG.Value)>'') and 
         TDCli.Locate('RG', tOCliRG.Value, []) then 
      begin
        tDCli.Edit;
        tDCliMinutos.Value := tDCliMinutos.Value + tOCliMinutos.Value;
        tDCliValorCred.Value := tDCliValorCred.Value + tOCliValorCred.Value;
//        tDCliDebito.Value := tDCliDebito.Value + tOCliDebito.Value;
        tDCli.Post;
        
        aNovo := False;
      end else begin
        if (not tOCliUsername.IsNull) and 
           (tOCliUsername.AsString>'') and
           tDCli.FindKey([tOCliUsername.Value]) 
        then
          S := tOCliUsername.Value + 'l2';

        tDCli.Insert;
        TransfDados(tOCli, tDCli);
        if S>'' then tDCliUsername.Value := S;
        tDCliID.Clear;
        tDCliDebito.Value := 0;
        tDCli.Post;
        
        aNovo := True;
      
{        if (tOCliDebito.Value >= 0.01) then begin
 
          tMovEst.Insert;
          tMovEstDataHora.Value := Now;
          tMovEstTotal.Value := tOCliDEbito.Value;
          tMovEstDesconto.Value := 0;
          tMovEstPago.Value := 0;
          tMovEstCaixa.Value := -1;
          tMovEstTran.Value := -1;
          tMovEstQuant.Value := 1;
          tMovEstUnitario.Value := tOCliDebito.Value;
          tMovEstNaoControlaEstoque.Value := True;
          tMovEstTipoTran.Value := trEstVenda;
          tMovEstEntrada.Value := False;
          tMovEstCancelado.Value := False;
          tMovEstCliente.Value := tDCliID.Value;
          tMovEst.Post;
  
          tDeb.Insert;
          tDebCliente.Value := tDCliID.Value;
          tDebData.Value := tMovEstDataHora.Value;
          tDebValor.Value := tOCliDebito.Value;
          tDebID.Value := tMovEstID.Value;
          tDebTipo.Value := itMovEst;
          tDeb.Post;
        
        end;}
      
      end;
    
      PB.Position := PB.Position + 1;
      Application.ProcessMessages;
      
      tOCli.Next;
    end;
//    nxDBD.Commit;

    ShowMessage('Dados foram juntados com sucesso !');
    Close;
  except
//    nxDBD.Rollback;
    Raise;
  end;
end;

procedure TForm18.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
