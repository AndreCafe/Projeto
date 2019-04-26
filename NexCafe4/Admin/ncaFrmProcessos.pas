unit ncaFrmProcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Buttons,
  PngSpeedButton, StdCtrls, ExtCtrls, nxdb, cxContainer, cxLabel;

type
  TFrmProcessos = class(TForm)
    Panel1: TPanel;
    btnFechar: TPngSpeedButton;
    btnAtualizar: TPngSpeedButton;
    btnFecharProc: TPngSpeedButton;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    Tab: TnxTable;
    TabClienteID: TIntegerField;
    TabRequest: TIntegerField;
    TabProcessID: TIntegerField;
    TabExeName: TStringField;
    DS: TDataSource;
    TVProcessID: TcxGridDBColumn;
    TVExeName: TcxGridDBColumn;
    Timer1: TTimer;
    Label1: TcxLabel;
    lbMaq: TcxLabel;
    procedure btnAtualizarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnFecharProcClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FMaq: Integer;
    { Private declarations }

    procedure OnTimerAtualiza(Sender: TObject);
  public
    procedure Mostrar(aMaq: Integer);
    { Public declarations }
  end;

var
  FrmProcessos: TFrmProcessos;

implementation

uses ncaDM;

{$R *.dfm}

procedure TFrmProcessos.btnAtualizarClick(Sender: TObject);
var Req: Integer;
begin
  Tab.SetRange([Dados.CM.Handle], [Dados.CM.Handle]);
  Tab.DeleteRecords;
  Req := Dados.CM.ObtemProcessos(FMaq);
  Tab.SetRange([Dados.CM.Handle, Req], [Dados.CM.Handle, Req]);
  Timer1.Enabled := True;
  Label1.Visible := True;
end;

procedure TFrmProcessos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProcessos.btnFecharProcClick(Sender: TObject);
begin
  if Pos('NEXGUARD.EXE', UpperCase(TabExeName.Value))>0 then Exit;
  Dados.CM.FinalizaProcesso(FMaq, TabProcessID.Value);
  with TTimer.Create(Self) do begin
    Interval := 1000;
    OnTimer := OnTimerAtualiza;
    Enabled := True;
  end;
end;

procedure TFrmProcessos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Tab.SetRange([Dados.CM.Handle], [Dados.CM.Handle]);
  Tab.DeleteRecords;
  Action := caFree;
end;

procedure TFrmProcessos.FormCreate(Sender: TObject);
begin
  Tab.Open;
end;

procedure TFrmProcessos.FormShow(Sender: TObject);
begin
  btnAtualizarClick(nil);
end;

procedure TFrmProcessos.Mostrar(aMaq: Integer);
begin
  FMaq := aMaq;
  lbMaq.Caption := 'Maq: '+IntToStr(aMaq);
  ShowModal;
end;

procedure TFrmProcessos.OnTimerAtualiza(Sender: TObject);
begin
  try
    btnAtualizarClick(nil);
  finally
    Sender.Free;
  end;
end;

procedure TFrmProcessos.Timer1Timer(Sender: TObject);
begin
  Tab.Refresh;
  if not Tab.IsEmpty then begin
    Timer1.Enabled := False;
    Label1.Visible := False;
  end;
end;

end.
