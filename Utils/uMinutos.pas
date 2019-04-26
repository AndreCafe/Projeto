unit uMinutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, 
  Menus, ComCtrls, StdCtrls, cxTextEdit, cxMaskEdit,
  cxSpinEdit, nxdb, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, DB, nxllComponent, nxsdServerEngine,
  nxreRemoteServerEngine;

type
  TForm14 = class(TForm)
    nxRSE: TnxRemoteServerEngine;
    tCli: TnxTable;
    tCliID: TAutoIncField;
    tCliMinutos: TFloatField;
    nxTCP: TnxWinsockTransport;
    nxDB: TnxDatabase;
    nxSession1: TnxSession;
    edMin: TcxSpinEdit;
    Label1: TLabel;
    Button1: TButton;
    PB: TProgressBar;
    PopupMenu1: TPopupMenu;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);
begin
  Button1.Enabled := False;
  tCLi.Open;
  tCli.First;
  PB.Max := tCli.RecordCount;
  while not tCli.Eof do begin
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
    tCli.Edit;
    tCliMinutos.Value := edMin.Value;
    tCli.Post;
    tCli.Next;
  end;
  ShowMessage('Pronto!');
  Close;
end;

end.
