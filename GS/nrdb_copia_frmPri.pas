unit nrdb_copia_frmPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, LMDPNGImage, DB, nxdb, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  nxsdServerEngine, nxreRemoteServerEngine, ComCtrls;

type
  TFrmPri = class(TForm)
    Button1: TButton;
    Image1: TImage;
    tAut: TnxTable;
    tCli: TnxTable;
    tRec: TnxTable;
    nxRSE: TnxRemoteServerEngine;
    nxTCPIPF: TnxWinsockTransport;
    nxSessionF: TnxSession;
    nxDBF: TnxDatabase;
    tFRec: TnxTable;
    tFCli: TnxTable;
    tFAut: TnxTable;
    Timer1: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    lbRec: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    lbAut: TLabel;
    Memo1: TMemo;
    PB: TProgressBar;
    tContato: TnxTable;
    tContatoCodigo: TAutoIncField;
    tContatoUObtemLic: TDateTimeField;
    tContatoUVersao: TStringField;
    tContatoXVersao: TWordField;
    tContatoRedirT: TIntegerField;
    tContatoRedirI: TDateTimeField;
    tContatoUpdateContato: TIntegerField;
    tContatoRedirU: TDateTimeField;
    tContatoRedirD: TWordField;
    tContatoUAno: TWordField;
    tContatoUMes: TWordField;
    tContatoUDia: TWordField;
    tContatoUDias: TWordField;
    tContatoLastAdminPopup: TDateTimeField;
    tContatoLicMaq: TWordField;
    lbContato: TLabel;
    Label3: TLabel;
    tFCon: TnxTable;
    tFConCodigo: TAutoIncField;
    tFConUObtemLic: TDateTimeField;
    tFConUVersao: TStringField;
    tFConXVersao: TWordField;
    tFConRedirT: TIntegerField;
    tFConRedirI: TDateTimeField;
    tFConUpdateContato: TIntegerField;
    tFConRedirU: TDateTimeField;
    tFConRedirD: TWordField;
    tFConUAno: TWordField;
    tFConUMes: TWordField;
    tFConUDia: TWordField;
    tFConUDias: TWordField;
    tFConLastAdminPopup: TDateTimeField;
    tFConLicMaq: TWordField;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    Fechar : Boolean;
    procedure TransfRecords(TF, TD: TDataset; aExceto: String = '');
    
  public
    procedure Atualizar;
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

  qcli : integer = 0;
  qrec : integer = 0;
  qaut : integer = 0;
  qcon : integer = 0;

implementation

uses uRSServBD_Copia;

{$R *.dfm}

procedure TransfDados(TF, TD: TDataset; aExceto: String = '');
var 
  I : Integer;
  F : TField;
begin
  aExceto := UpperCase(aExceto);
  with TD do
  for I := 0 to pred(Fields.Count) do with Fields[I] do begin
    F := TF.FindField(FieldName);
    if (F <> nil) and (Pos(';'+UpperCase(FieldName)+';', aExceto)<1) then 
      Value := F.Value;
  end;
end;

procedure TFrmPri.TransfRecords(TF, TD: TDataset; aExceto: String = '');
begin
  TF.First;
  while not TF.Eof do begin
    TD.Append;
    TransfDados(TF, TD, aExceto);
    TD.Post;

    inc(qaut);
    lbAut.Caption := IntToStr(qaut);
    TF.Next;
    Application.ProcessMessages;
  end;
end;

procedure TFrmPri.Atualizar;
var I: Integer;
begin
  Fechar := False;
  
  tFAut.Active := False;
  tFCli.Active := False;
  tFRec.Active := False;
  tFCon.Active := False;

  nxTCPIPF.Active := False;
  nxTCPIPF.Active := True;

  tFCon.BlockReadSize := 1024 * 1024;
  tFAut.BlockReadSize := 1024 * 1024;
  tFRec.BlockReadSize := 1024 * 1024;
  tFCli.BlockReadSize := 1024 * 1024;
  
  tFAut.Active := True;
  tFCli.Active := True;
  tFRec.Active := True;
  tFCon.Active := True;
  tAut.Last;
  I := tAut.FieldByname('ID').AsInteger+1;
  tFAut.SetRange([I], [High(Integer)]);
  TransfRecords(TFAut, tAut);

  tCli.IndexName := 'IUpdateCad';
  tCli.Last;
  I := tCli.FieldByName('UpdateCad').AsInteger+1;
  tFCli.SetRange([I+1], [High(Integer)]);
  PB.Max := tFCli.RecordCount;
  PB.Position := 0;

  tCli.IndexName := 'ICodigo';
  while (not tFCli.Eof) and (not Fechar) do begin
    PB.Position := PB.Position + 1;
    if tCli.FindKey([tFCli.FieldByName('Codigo').AsInteger]) then
      tCli.Edit else
      tCli.Insert;

    TransfDados(tFCli, tCli, ';UPDATECONTATO;');
    tCli.Post;

    Inc(qcli);
    lbCli.Caption := IntToStr(qcli);

    Application.ProcessMessages;
    
    tFCli.Next;
  end;

  tRec.IndexName := 'IUpdateID';
  tRec.Last;
  I := tRec.FieldByName('UpdateID').AsInteger+1;
  tFRec.SetRange([I+1], [High(Integer)]);
  PB.Position := 0;
  PB.Max := TFRec.RecordCount;

  tRec.IndexName := 'IID';
  while (not tFRec.Eof) and (not Fechar) do begin
    PB.Position := PB.Position + 1;
    if tRec.FindKey([tFRec.FieldByName('ID').AsInteger]) then
      tRec.Edit else
      tRec.Insert;

    TransfDados(tFRec, tRec);
    tRec.Post;

    Inc(qrec);
    lbRec.Caption := IntToStr(qrec);

    Application.ProcessMessages;
    
    tFRec.Next;
  end;

  
  tContato.IndexName := 'IUpdateContato';
  tContato.Last;
  I := tContatoUpdateContato.Value;
  tFCon.SetRange([I+1], [High(Integer)]);
  PB.Max := tFCon.RecordCount;
  PB.Position := 0;
  tFCon.First;

  tContato.IndexName := 'ICodigo';
  while (not tFCon.Eof) and (not Fechar) do begin
    PB.Position := PB.Position + 1;
    if tContato.FindKey([tFConCodigo.Value]) then
      tContato.Edit else
      tContato.Insert;

    TransfDados(tFCon, tContato, ';UPDATECAD;');
    tContato.Post;

    Inc(qcon);
    lbContato.Caption := IntToStr(qcon);

    Application.ProcessMessages;
    
    tFCon.Next;
  end;
  
  
end;

procedure TFrmPri.Button1Click(Sender: TObject);
begin
  Fechar := True;
  Close;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Interval := 10000;
  PB.Position := 0;
  PB.Visible := True;
  try
    Atualizar;
  except
    on E: Exception do Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', Now)+E.Message);
  end;  
  PB.Visible := False;
  Timer1.Enabled := True;
end;

end.
