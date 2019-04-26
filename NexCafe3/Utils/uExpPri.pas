unit uExpPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxProgressBar, StdCtrls, cxButtons,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxLabel, DB, nxdb, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllComponent, nxsdServerEngine, nxreRemoteServerEngine,
  Grids, DBGrids;

type
  TFrmPri = class(TForm)
    cxLabel1: TcxLabel;
    edServ: TcxTextEdit;
    edDataI: TcxDateEdit;
    edDataF: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    btnExp: TcxButton;
    btnFechar: TcxButton;
    PB: TcxProgressBar;
    nxRSE: TnxRemoteServerEngine;
    nxSession: TnxSession;
    nxTCP: TnxWinsockTransport;
    nxDB: TnxDatabase;
    Q: TnxQuery;
    lbArq: TcxLabel;
    DS: TDataSource;
    LB: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExpClick(Sender: TObject);
  private
    FSlConfig : TStrings;
    FSLExp : TStrings;

    procedure AbreConn;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

{$R *.dfm}

function configname: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'NexExpValor.ini';
end;

procedure TFrmPri.AbreConn;
begin
  if nxTCP.Active then Exit;
  nxTCP.ServerName := edServ.Text;
  nxTCP.Open;

  edServ.Enabled := False;
  

  FSlConfig.Values['servidor'] := edServ.Text;
  FSLConfig.SaveToFile(configname);

  nxRSE.Active := True;
  nxSession.Active := True;
  nxDB.Active := True;
end;

function DStr(D: Double): String;
begin
  Str(D:0:2, Result);
{  while Copy(Result, Length(Result), 1)='0' do Delete(Result, Length(Result), 1);
  if Result[Length(Result)] = '.' then
    Result := Result + '0';}
end;

procedure TFrmPri.btnExpClick(Sender: TObject);
begin
  AbreConn;
  btnExp.Enabled := False;
  btnFechar.Enabled := False;
  try
    Q.Active := False;
    Q.ParamByName('datai').Value := edDataI.Date;
    Q.ParamByName('dataf').Value := edDataF.Date+1;
    Q.Open;
    FSLExp.Clear;
    PB.Properties.Max := Q.RecordCount;
    PB.Position := 0;
    while not Q.Eof do begin
      PB.Position := PB.Position + 1;
      Application.ProcessMessages;
      FSLExp.Add(Q.FieldByName('cliente').AsString+';'+
                 FormatDateTime('yyyymmdd hh:mm:ss', Q.FieldByName('datahora').AsDateTime)+';'+
                 DStr(Q.FieldByName('pago').AsFloat));
      Q.Next;
    end;
    FSLExp.SaveToFile(lbArq.Caption);
    LB.Items.Text := FSLExp.Text;
  finally
    btnExp.Enabled := True;
    btnFechar.Enabled := True;
  end;
end;

procedure TFrmPri.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  lbArq.Caption := ExtractFilePath(ParamStr(0))+'exp.txt';
  FSLConfig := TStringList.Create;
  if FileExists(configname) then
    FSLConfig.LoadFromFile(configname);

  edServ.Text := FSLConfig.Values['servidor'];
  FSLExp := TStringList.Create;
  edDataI.Date := Date - 30;
  edDataF.Date := Date;
end;

procedure TFrmPri.FormDestroy(Sender: TObject);
begin
  FSLConfig.Free;
  FSLExp.Free;
end;

end.
