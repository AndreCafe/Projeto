unit uTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncCompCliente, ncClassesBase, ncServRemoto, StdCtrls, lmdcont,
  StShlCtl, SsBase, StShrtCt, dxBarExtItems, dxBar, LMDSysInfo, ASGCapture,
  LMDVersionInfo, LMDCustomComponent, LMDStarter, WindowList, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, pngimage, LMDSimplePanel,
  ComCtrls, LMDCustomScrollBox, LMDScrollBox, lmdsplt, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel;

type
  TForm1 = class(TForm)
    LMDSplitterPanel1: TLMDSplitterPanel;
    spDesktop: TLMDSplitterPane;
    lvDesktop: TStShellListView;
    spChat: TLMDSplitterPane;
    panHChat: TLMDSimplePanel;
    Image1: TImage;
    cxLabel1: TcxLabel;
    CM: TClienteNexCafe;
    tmCronometro: TTimer;
    CMRem: TncServidorRemoto;
    wlInicio: TWinList;
    WL: TWinList;
    Starter: TLMDStarter;
    Version: TLMDVersionInfo;
    tmPiscaTempo: TTimer;
    ASG: TASGScreenCapture;
    tmCapturar: TTimer;
    VI: TLMDVersionInfo;
    tmWinList: TTimer;
    SysInfo: TLMDSysInfo;
    tmAvisoTempo: TTimer;
    BarMgr: TdxBarManager;
    cmEncerrar: TdxBarButton;
    cmTempo: TdxBarStatic;
    cmValor: TdxBarStatic;
    cmDesktop: TdxBarLargeButton;
    cmMaq: TdxBarStatic;
    cmFechar: TdxBarButton;
    cmNoNet: TdxBarStatic;
    cmNomeCli: TdxBarStatic;
    dxBarLargeButton1: TdxBarLargeButton;
    cmAlterarSenha: TdxBarButton;
    tmReconectar: TTimer;
    tmFirstConn: TTimer;
    TimerTaskMgr: TTimer;
    SC: TStShortcut;
    SE: TStShellEnumerator;
    GenList: TLMDGenericList;
    TimerDesktop: TTimer;
    TimerLogin: TTimer;
    TimerChat: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure NCAoAtivar(Sender: TObject);
    procedure NCAoDesativar(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CMAoAtivar(Sender: TObject);
    procedure CMAoDesativar(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure cmEncerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  CM.Ativo := not CM.Ativo;
end;

procedure TForm1.NCAoAtivar(Sender: TObject);
begin
  Caption := 'Ativou';
end;

procedure TForm1.NCAoDesativar(Sender: TObject);
begin
  Caption := 'Desativou';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  CM.Free;
end;

procedure TForm1.CMAoAtivar(Sender: TObject);
begin
  Caption := 'ATIVOU';
end;

procedure TForm1.CMAoDesativar(Sender: TObject);
begin
  Caption := 'Desativou';
end;

procedure TForm1.cmFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.cmEncerrarClick(Sender: TObject);
begin
  CM.Ativo := not CM.Ativo;
end;

end.
