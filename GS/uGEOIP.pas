unit uGEOIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, DB, nxdb, nxsdServerEngine, nxreRemoteServerEngine, nxllComponent,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, ComCtrls,
  ExtCtrls;

type
  TForm11 = class(TForm)
    H: TIdHTTP;
    PB: TProgressBar;
    nxTCP: TnxWinsockTransport;
    nxRSE: TnxRemoteServerEngine;
    nxSE: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    btnGeoIP: TButton;
    tCliCodigo: TAutoIncField;
    tCliTipo: TWordField;
    tCliSenha: TStringField;
    tCliCadastroEm: TDateTimeField;
    tCliCadastroPor: TStringField;
    tCliAtualizadoEm: TDateTimeField;
    tCliAtualizadoPor: TStringField;
    tCliLoja: TStringField;
    tCliRazaoSocial: TStringField;
    tCliPais: TStringField;
    tCliCidade: TStringField;
    tCliCidade_geoip: TStringField;
    tCliUF_geoip: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliBairro: TStringField;
    tCliSerieHD: TStringField;
    tCliCodEquip: TStringField;
    tCliNumMaq: TWordField;
    tCliCNPJ: TStringField;
    tCliIE: TStringField;
    tCliObs: TnxMemoField;
    tCliEmailReg: TnxMemoField;
    tCliFormaPagto: TnxMemoField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliManInicio: TDateField;
    tCliManVenc: TDateField;
    tCliGerente: TStringField;
    tCliTipoLoja: TWordField;
    tCliEmailTec: TnxMemoField;
    tCliValor: TCurrencyField;
    tCliValorRec: TCurrencyField;
    tCliEmitirNF: TBooleanField;
    tCliMessenger: TnxMemoField;
    tCliICQ: TnxMemoField;
    tCliUObtemLic: TDateTimeField;
    tCliUVersao: TStringField;
    tCliCAno: TWordField;
    tCliCMes: TWordField;
    tCliCDia: TWordField;
    tCliAAno: TWordField;
    tCliAMes: TWordField;
    tCliADia: TWordField;
    tCliUAno: TWordField;
    tCliUMes: TWordField;
    tCliUDia: TWordField;
    tCliUDias: TWordField;
    tCliMotivoDesist: TStringField;
    tCliLastAdminPopup: TDateTimeField;
    tCliCampanha: TStringField;
    tCliutmccn: TIntegerField;
    tCliutmctr: TIntegerField;
    tCliutmcct: TIntegerField;
    tCliutmcsr: TIntegerField;
    tCliutmcmd: TIntegerField;
    tCliNegociacao: TWordField;
    tCliContatarEm: TDateTimeField;
    tCliPrograma: TWordField;
    tCliBloqueado: TBooleanField;
    tCliCliente: TBooleanField;
    tCliAtivado: TBooleanField;
    tCliCodAtivacao: TStringField;
    tCliEmailConta: TStringField;
    tCliAtivadoEm: TDateTimeField;
    tCliTipoConta: TWordField;
    tCliPremiumAte: TDateTimeField;
    tCliCodDesc: TStringField;
    tCliRedirT: TIntegerField;
    tCliRedirI: TDateTimeField;
    tCliConfirmouLocal: TBooleanField;
    Memo1: TMemo;
    Timer1: TTimer;
    tIP: TnxTable;
    tIPIP: TStringField;
    tIPLoja: TIntegerField;
    tIPDH: TDateTimeField;
    lbQtd: TLabel;
    Button1: TButton;
    tCli2: TnxTable;
    tCli2Codigo: TAutoIncField;
    tCli2UObtemLic: TDateTimeField;
    tCliContaTrocada: TBooleanField;
    tCli2CodEquip: TStringField;
    Button2: TButton;
    tCliContatoCC: TBooleanField;
    tCli2EmailConta: TStringField;
    tCli2ContatoCC: TBooleanField;
    tCliOrigem: TStringField;
    tCli2Origem: TStringField;
    tCliCadastroCompleto: TBooleanField;
    tCliCadastroCompletoEm: TDateTimeField;
    tCliRegistroEm: TDateTimeField;
    tCliTels: TnxMemoField;
    tCliProp: TnxMemoField;
    tCliProprietario: TStringField;
    tCliTel1: TStringField;
    tCliTel2: TStringField;
    tCliTel3: TStringField;
    tCliTel4: TStringField;
    tCliTipoTel1: TWordField;
    tCliTipoTel2: TWordField;
    tCliTipoTel3: TWordField;
    tCliTipoTel4: TWordField;
    tCliUpdateCad: TIntegerField;
    tCliUpdateMkt: TIntegerField;
    tCliUpdateContato: TIntegerField;
    tCliDBounce: TDateTimeField;
    tCliDInativo: TDateTimeField;
    tCliInstalouEm: TDateTimeField;
    tCliBounce: TBooleanField;
    tCliInativo: TBooleanField;
    tCliPreRegistro: TBooleanField;
    tCliPreRegistroIP: TStringField;
    tCliPreRegistroEm: TDateTimeField;
    tCliStatusDesde: TDateTimeField;
    tCliRecente: TBooleanField;
    tCliParouRedir: TBooleanField;
    tCliPremium: TBooleanField;
    tCliFezRedir: TBooleanField;
    tCliRedirU: TDateTimeField;
    tCliRedirD: TWordField;
    tCliUsou: TBooleanField;
    tCliSaiu: TBooleanField;
    tCliVaiVoltar: TBooleanField;
    tCliVaiVoltarAte: TDateTimeField;
    tCliCCContatoOk: TBooleanField;
    tCliCCContatoFail: TBooleanField;
    tCliCCPContatoOk: TDateTimeField;
    tCliCCPContatoFail: TDateTimeField;
    tCliCCUContatoOk: TDateTimeField;
    tCliCCUContatoFail: TDateTimeField;
    tCliCCQContatoOK: TIntegerField;
    tCliCCQContatoFail: TIntegerField;
    tCliCCAgente: TIntegerField;
    tCliEndereco: TStringField;
    tCliStatus: TWordField;
    tEstL: TnxTable;
    tEst: TnxTable;
    tEstH: TnxTable;
    tEstData: TDateField;
    tEstIP: TStringField;
    tEstH2: TWordField;
    tEstLoja: TIntegerField;
    tEstW: TWordField;
    tEstQtd: TIntegerField;
    tEstAno: TWordField;
    tEstMes: TWordField;
    tEstDia: TWordField;
    tEstLLoja: TIntegerField;
    tEstLAno: TWordField;
    tEstLMes: TWordField;
    tEstLDia: TWordField;
    tEstHH: TWordField;
    tEstHAno: TWordField;
    tEstHMes: TWordField;
    tEstHDia: TWordField;
    Button3: TButton;
    tEstLQtd: TWordField;
    tEstHQtd: TIntegerField;
    Button4: TButton;
    tCliA: TnxTable;
    tCliACodigo: TAutoIncField;
    tCliATipoTel: TWordField;
    Button5: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure btnGeoIPClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    procedure ConverteTels;
  public
    FQtd : Integer;
    { Public declarations }
  end;

  TEstado = record
    esNome: String;
    esUF : String;
  end;

var
  Form11: TForm11;

  arrEstado : Array of TEstado;

implementation

{$R *.dfm}

procedure AddEstado(aNome, aUf: String);
var I : Integer;
begin
  I := Length(arrEstado);
  SetLength(arrEstado, I+1);
  arrEstado[I].esNome := aNome;
  arrEstado[I].esUF := AnsiUpperCase(aUF);
end;

function ObtemUF(aNome: String): String;
var I : Integer;
begin            
  for I := low(arrEstado) to High(arrEstado) do 
    if SameText(arrEstado[I].esNome, aNome) then begin
      Result := arrEstado[I].esUF;
      Exit;
    end;
  Result := '';  
end;

procedure TForm11.btnGeoIPClick(Sender: TObject);
begin
  tCli.Open;
  tIP.Open;
  PB.Max := tCli.RecordCount;
  tCli.Last;
  FQtd := 0;
  PB.Position := 0;
  Memo1.Lines.Clear;
  Timer1.Enabled := True;
end;

procedure TForm11.ConverteTels;
var 
  sl : TStrings;
  i, t: integer;
begin
  sl := TStringList.Create;
  try
    t := 0;
    sl.Text := tCliTels.Value;
    for I := 0 to sl.Count-1 do begin
      if Trim(sl[I])>'' then begin
        Inc(t);
        if t=5 then Exit;
        case t of
          1 : tCliTel1.Value := Trim(sl[I]);
          2 : tCliTel2.Value := Trim(sl[I]);
          3 : tCliTel2.Value := Trim(sl[I]);
          4 : tCliTel2.Value := Trim(sl[I]);
        end;
      end;
    end;
  finally
    sl.free;
  end;
end;

procedure TForm11.Button1Click(Sender: TObject);
var trocada: Boolean;
begin
  tCli.Open;
  tCli2.Open;
  PB.Max := tCli.RecordCount;
  tCli.First;
  FQtd := 0;
  PB.Position := 0;
  Memo1.Lines.Clear;
  while not tCli.Eof do begin
    trocada := false;
    if (tCliCodEquip.Value>'') then begin
      tCli2.SetRange([tCliCodEquip.Value], [tCliCodEquip.Value]);
      while (not Trocada) and (not tCli2.Eof) do begin
        Trocada := (tCli2Codigo.Value <> tCliCodigo.Value) and (tCli2UObtemLic.Value>tCliUObtemLic.Value);
        if Trocada then begin
          Inc(FQtd);
          lbQtd.Caption := IntToStr(FQtd) + ' trocadas';
        end;
        tCli2.Next;
      end;
    end;
    tCli.Edit;
    tCliContaTrocada.Value := Trocada;
//    if (tCliTel1.Value='') and (tCliTels.Value>'') then ConverteTels;
    tCli.Post;
    tCli.Next;
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
  end;
  ShowMessage('Zé fini');
end;

procedure TForm11.Button2Click(Sender: TObject);
var 
  sl : TStrings;
  i : INteger;
  s, sConta, sOrigem : String;
begin
  sl := TStringList.Create;
  try
    sl.LoadFromFile(ExtractFilePath(ParamStr(0))+'cc.csv');
    PB.max := sl.Count;
    PB.Position := 1;
    tCli.Open;
    tCli2.Open;
    tCli.IndexName := 'IEmailConta';
    for I := 1 to sl.count-1 do begin
      s := sl[i];
      sConta := Copy(s, 1, Pos(';', s)-1);
      Delete(S, 1, Pos(';', s));
      sOrigem := Copy(s, 1, Pos(';', s)-1);
      Delete(s, 1, Pos(';', s));
      
      if (SameText(sOrigem, 'NexCafé') or SameText(sOrigem, 'quest. nao respondido')) and (Trim(S)>'') then 
        sOrigem := s;

      if SameText(sOrigem, 'quest. nao respondido') then
        sOrigem := '';
      
      if tCli.FindKey([sConta]) then begin
        tCli.Edit;
        tCliContatoCC.Value := True;
        tCliOrigem.Value := sOrigem;
        tCli.Post;

        if tCliCodEquip.Value>''  then begin
          tCli2.SetRange([tCliCodEquip.Value], [tCliCodEquip.Value]);
          while not tCli2.Eof do begin
            if tCliEmailConta.Value <> tCli2EmailConta.Value then begin
              tCli2.Edit;
              tCli2ContatoCC.Value := True;
              tCli2Origem.Value := sOrigem;
              tCli2.Post;
            end;
            tCli2.Next;
          end;
        end;
      end;
      PB.Position := PB.Position + 1;
      Application.ProcessMessages;
    end;
    ShowMessage('CC.csv processado com sucesso');
  finally
    sl.Free;
  end;
end;


procedure InitTran(aDB: TnxDatabase;
                   const aTables : array of TnxTable;
                   aWith : Boolean);
var I : Integer;
begin
  if aDB.InTransaction then Exit;
  I := 10;
  while I > 0 do begin
    try
      if aWith then
        aDB.StartTransactionWith(aTables)
      else
        aDB.StartTransaction;
      I := 0;
    except
      Dec(I);
      Random(500);
    end
  end;
end;

procedure TForm11.Button3Click(Sender: TObject);
var Ano: Word; I, T : Cardinal;
begin
  tEst.Open;
  tEstL.Open;
  tEstH.Open;
  T := tEst.RecordCount;
  PB.Max := T;
  PB.Position := 0;
  I := 0;
  Caption := 'Total = ' + IntToStr(T);
  Application.ProcessMessages;
  while not tEst.Eof do begin
    Ano := tEstAno.Value;
    if Ano>2000 then 
      Ano := Ano - 2000 else
      Ano := 0;

    InitTran(nxDB, [tEstL, tEstH], True);
    try
      if not tEstL.FindKey([tEstLoja.Value, Ano, tEstMes.Value, tEstDia.Value]) then
      begin
        tEstL.Insert;
        tEstLAno.Value := Ano;
        tEstLMes.Value := tEstMes.Value;
        tEstLDia.Value := tEstDia.Value;
        tEstLLoja.Value := tEstLoja.Value;
      end else 
        tEstL.Edit;
      tEstLQtd.Value := tEstLQtd.Value + tEstQtd.Value;
      tEstL.Post;
  
      if not tEstH.FindKey([Ano, tEstMes.Value, tEstDia.Value, tEstH2.Value]) then
      begin
        tEstH.Insert;
        tEstHAno.Value := Ano;
        tEstHMes.Value := tEstMes.Value;
        tEstHDia.Value := tEstDia.Value;
        tEstHH.Value := tEstH2.Value;
      end else 
        tEstH.Edit;
      tEstHQtd.Value := tEstHQtd.Value + tEstQtd.Value;
      tEstH.Post;
      nxDB.Commit;
    except
      nxDB.Rollback;
      raise;
    end;
      
    tEst.Next;
    Inc(I);
    if (I mod 10) = 0 then begin
      PB.Position := PB.Position + 10;
      lbQtd.Caption := IntToStr(I);
      Application.ProcessMessages;
    end;
  end;
  ShowMessage('Fim!');
end;

procedure TForm11.Button4Click(Sender: TObject);
var 
  I, U : TDateTime;
  D    : Integer;

begin
  tEstL.Open;
  pb.position := 0;
  pb.visible := true;
  tCli.IndexName := 'ICodigo';
  tCli.Open;
  tCli.First;
  pb.max := tCli.RecordCount;
  while not tCli.Eof do begin
    tEstL.SetRange([tCliCodigo.Value], [tCliCodigo.Value]);
    D := tEstL.RecordCount;
    if D>0 then begin
      tEstL.First;
      I := EncodeDate(tEstLAno.Value+2000, tEstLMes.Value, tEstLDia.Value);
      tEstL.Last;
      U := EncodeDate(tEstLAno.Value+2000, tEstLMes.Value, tEstLDia.Value);
      tCli.Edit;
      if Int(tCliRedirU.Value)<>U then begin
        tCliRedirU.Value := U;
        Dec(D);
      end;
      if Int(tCliRedirI.Value)<>I then 
        tCliRedirI.Value := I;
      tCliRedirD.Value := D;
      tCli.Post;  
    end;
    pb.position := pb.position + 1;
    if (pb.position mod 10)=0 then application.ProcessMessages;
    tCli.Next;
  end;
  ShowMessage('Terminou cara!');
end;

procedure TForm11.Button5Click(Sender: TObject);
var I : Integer;
begin
  tIP.Open;
  pb.position := 0;
  pb.visible := true;
  tCli.IndexName := 'ICodigo';
  tCli.Open;
  tCli.First;
  pb.max := tCli.RecordCount;
  while not tCli.Eof do begin
    tIP.SetRange([tCliCodigo.Value], [tCliCodigo.Value]);
    tIP.First;
    if Int(tIPDH.Value) > Int(tCliUObtemLic.Value) then begin
      InitTran(nxDB, [tCli], True);
      try
        tCli.Edit;
        tCliUObtemLic.Value := tIPDH.Value;
        tCli.Post;
        nxDb.Commit;
      finally
        if nxDB.InTransaction then nxDB.Rollback;
      end;
    end;
    pb.position := pb.position + 1;
    if (pb.position mod 10)=0 then application.ProcessMessages;
    tCli.Next;
  end;
  ShowMessage('Terminou cara!');
end;

procedure TForm11.Timer1Timer(Sender: TObject);
var S, S2, sCidade, sUF, sPais : String;
D: TDateTime;

function ProxCampo: String;
var p: integer;
begin
  P := Pos(',', S);
  if P>0 then begin
    Result := Copy(S, 1, P-1);
    Delete(S, 1, P);
  end else begin
    Result := S;
    S := '';
  end;
end;

begin
  Timer1.Enabled := False;
  try
    while not tCli.Bof do begin
      D := EncodeDate(2012, 3, 5);
      PB.Position := PB.Position + 1;
      Application.ProcessMessages;
      if (tCliUObtemLic.Value > D) then 
      if ((tCliCidade.Value='') or (tCliUF.Value='')) and (tCliCidade_geoip.Value='') and tIP.FindKey([tCliCodigo.Value]) then begin 
        S := UTF8ToAnsi(H.Get('http://freegeoip.net/csv/'+tIPIP.Value));
        S2 := S;
        ProxCampo;ProxCampo;
        sPais := ProxCampo;
        ProxCampo;
        sUF := ProxCampo;
        sCidade := ProxCampo;
        if SameText(sPais, 'Brazil') then begin
          sUF := ObtemUF(sUF);
          if (sUF>'') and (sCidade>'') then begin
            Inc(FQtd);
            lbQtd.Caption := IntToStr(FQtd) + ' geoips com sucesso';
            tCli.Edit;
            tCliPais.Value := 'Brasil';
            tCliCidade_geoip.Value := AnsiUpperCase(sCidade);
            tCliUF_geoip.Value := AnsiUpperCase(sUF);
            tCli.Post;
          end else begin
            Memo1.Lines.Add(S2);
            tCli.Edit;
            tCliPais.Value := 'Brasil';
            tCliCidade_geoip.Value := 'x';
            tCli.Post;
          end;  
        end else begin
          Inc(FQtd);
          lbQtd.Caption := IntToStr(FQtd) + ' geoips com sucesso';
          tCli.Edit;
          tCliPais.Value := sPais;
          
          if Trim(sCidade)='' then 
            sCidade := 'x'
          else 
          if sUF>'' then
            sCidade := sCidade +', '+sUF;
            
          tCliCidade_geoip.Value := AnsiUpperCase(sCidade);
          tCli.Post;
        end;  
        
        tCli.Prior;
        Exit;
      end;  
      tCli.Prior;
    end;
  finally
    Timer1.Enabled := not tCli.Bof;
    if not Timer1.Enabled then
      ShowMessage('Fim de GEO IPtização');
  end;
end;

initialization
  SetLength(arrEstado, 0);
  
  addestado('Acre', 'AC');
  addestado('Alagoas', 'AL');
  addestado('Amapá', 'AP');
  addestado('Amapa', 'AP');
  addestado('Amazonas', 'AM');
  addestado('Bahia', 'BA');
  addestado('Ceará', 'CE');
  addestado('Ceara', 'CE');
  addestado('Distrito Federal', 'DF');
  addestado('Espírito Santo', 'ES');
  addestado('Espirito Santo', 'ES');
  addestado('Goiás', 'GO');
  addestado('Goias', 'GO');
  addestado('Maranhão', 'MA');
  addestado('Maranhao', 'MA');
  addestado('Mato Grosso', 'MT');
  addestado('Mato Grosso do Sul', 'MS');
  addestado('Minas Gerais', 'MG');
  addestado('Pará', 'PA');
  addestado('Para', 'PA');
  addestado('Paraíba', 'PB');
  addestado('Paraiba', 'PB');
  addestado('Paraná', 'PR');
  addestado('Parana', 'PR');
  addestado('Pernambuco', 'PE');
  addestado('Piauí', 'PI');
  addestado('Piaui', 'PI');
  addestado('Rio de Janeiro', 'RJ');
  addestado('Rio Grande do Norte', 'RN');
  addestado('Rio Grande do Sul', 'RS');
  addestado('Rondônia', 'RO');
  addestado('Rondonia', 'RO');
  addestado('Roraima', 'RR');
  addestado('Santa Catarina', 'SC');
  addestado('São Paulo', 'SP');
  addestado('Sao Paulo', 'SP');
  addestado('Sergipe', 'SE');
  addestado('Tocantins', 'TO');
  
  
  
  addestado('Goias', 'GO');


end.
