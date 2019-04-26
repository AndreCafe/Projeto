unit ncaFrmProcessos;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Buttons,
  StdCtrls, ExtCtrls, nxdb, cxContainer, cxLabel,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarExtItems, dxBar, cxNavigator;

type
  TFrmProcessos = class(TForm)
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
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    btnFechar: TdxBarLargeButton;
    lbMaq: TdxBarStatic;
    btnAtualizar: TdxBarLargeButton;
    btnFecharProc: TdxBarLargeButton;
    cmObtendo: TdxBarStatic;
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

uses ncaDM, ncaFrmPri, ufmImagens;

// START resource string wizard section
const
  SNEXGUARDEXE = 'NEXGUARD.EXE';

// END resource string wizard section


// START resource string wizard section
resourcestring
  SMaq = 'Maq: ';

// END resource string wizard section


{$R *.dfm}

procedure TFrmProcessos.btnAtualizarClick(Sender: TObject);
var Req: Integer;
begin
  Tab.SetRange([Dados.CM.Handle], [Dados.CM.Handle]);
  Tab.DeleteRecords;
  Req := Dados.CM.ObtemProcessos(FMaq);
  Tab.SetRange([Dados.CM.Handle, Req], [Dados.CM.Handle, Req]);
  Timer1.Enabled := True;
  cmObtendo.Visible := ivAlways;
end;

procedure TFrmProcessos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProcessos.btnFecharProcClick(Sender: TObject);
begin
  if Pos(SNEXGUARDEXE, UpperCase(TabExeName.Value))>0 then Exit;
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
  lbMaq.Caption := SMaq+IntToStr(aMaq);
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
    cmObtendo.Visible := ivNever;
  end;
end;

end.

