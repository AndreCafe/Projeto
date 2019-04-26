unit uJuntaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxdb, nxsdServerEngine, nxsrServerEngine, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent, cxProgressBar,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit, LMDBrowseEdit, cxControls,
  cxContainer, cxEdit, cxLabel, Buttons, PngSpeedButton, nxreRemoteServerEngine,
  Grids, DBGrids, StdCtrls;

type
  TForm18 = class(TForm)
    nxSession1: TnxSession;
    nxDBD: TnxDatabase;
    nxTCP: TnxWinsockTransport;
    tDCli: TnxTable;
    btnProcessar: TPngSpeedButton;
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
    DataSource1: TDataSource;
    Button1: TButton;
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
var S: String;
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
  
  try
    tOCli.Open;
    tOPass.Open;
  except
    Raise Exception.Create('Os arquivos CLIENTE.NX1 e PASSAPORTE.NX1 não foram encontrados na pasta informada');
  end;
  
  tDCli.Open;
  tDPass.Open;
  
  PB.Properties.Max := tOCli.RecordCount;

//  nxDBD.StartTransactionWith([tDCli, tDPass]);
  try
    while not tOCli.Eof do begin
      S := '';
      if (not tOCli.FieldByName('Username').IsNull) and (tOCli.FieldByName('Username').AsString>'') then begin
        S := tOCli.FieldByName('Username').AsString;
        while tDCli.FindKey([S]) do S := S + '2';
      end;

      tDCli.Insert;
      TransfDados(tOCli, tDCli);
      tDCli.FieldByName('ID').Clear;
      tDCli.FieldByName('Debito').Clear;
      if S='' then
        tDCli.FieldByName('Username').Clear else
        tDCli.FieldByName('Username').AsString := S;
      tDCli.Post;

{      if tOCli.FieldByName('ID').AsInteger <> tDCli.FieldByName('ID').AsInteger then begin
        tOPass.SetRange([tOCli.FieldByName('ID').Value], [tOCli.FieldByName('ID').Value]);
        tOPass.First;
        while not tOPass.Eof do begin
          tDPass.Insert;
          TransfDados(tOPass, tDPass);
          tDPassID.Clear;
          tDPassCliente.Value := tDCli.FieldByName('ID').AsInteger;
          tDPass.Post;

          tOPass.Next;
        end;
      end;}
      
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
