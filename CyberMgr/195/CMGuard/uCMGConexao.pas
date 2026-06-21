unit uCMGConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, StdCtrls, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxSpinEdit, dxBar, dxBarExtItems, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, ExtCtrls;

type
  TFrmConexao = class(TForm)
    dxBarManager1: TdxBarManager;
    cmOk: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    lbErro: TLMDLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    edMaq: TcxSpinEdit;
    Label2: TLabel;
    edServidor: TcxTextEdit;
    Label1: TLabel;
    Timer1: TTimer;
    procedure cmCancelarClick(Sender: TObject);
    procedure cmOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConexao: TFrmConexao;

implementation

uses uCMGPri;

{$R *.dfm}

procedure TFrmConexao.cmCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFrmConexao.cmOkClick(Sender: TObject);
begin
  with FrmPri do begin
    slConfig.Values['Maquina'] := edMaq.Value;
    slConfig.Values['Servidor'] := edServidor.Text;
    slConfig.SaveToFile(IniFName);

    if (not CM.Ativo) and (not tmReconectar.Enabled) then
      tmConectar.Enabled := True;
  end;
  Close;
  ModalResult := mrOk;
end;

procedure TFrmConexao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if (ModalResult<>mrOk) and (not FrmPri.CM.Ativo) then
    FrmPri.FecharCMGuard;
end;

procedure TFrmConexao.FormCreate(Sender: TObject);
begin
  edServidor.Text := FrmPri.slConfig.Values['Servidor'];
  edMaq.Value := StrToIntDef(FrmPri.slConfig.Values['Maquina'], 0);
end;

procedure TFrmConexao.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  lbErro.AutoSize := False;
  lbErro.AutoSize := True;
end;

end.
