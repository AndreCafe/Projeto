unit uCMGConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, StdCtrls,
  Buttons, ExtCtrls, ImgList, Db, kbmMemTable, DBCtrls, LMDCustomComponent,
  LMDVersionInfo, dxPageControl, OvcBase, OvcEF, OvcPB, OvcNF,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomBrowseEdit, LMDFileOpenEdit, dxExEdtr;

type
  TFrmConfig = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbTodas: TCheckBox;
    dxPageControl1: TdxPageControl;
    tsRecursos: TdxTabSheet;
    cbMenuIniciar: TCheckBox;
    cbTray: TCheckBox;
    cbCronometro: TCheckBox;
    cbCtrlPanel: TCheckBox;
    cbCtrlAltDel: TCheckBox;
    tsConexao: TdxTabSheet;
    edMaquina: TOvcNumericField;
    Label5: TLabel;
    Label4: TLabel;
    edServidor: TEdit;
    cbResetar: TCheckBox;
    edFundoTela: TLMDFileOpenEdit;
    Label1: TLabel;
    cbStretch: TCheckBox;
    cbNoDownload: TCheckBox;
    Label2: TLabel;
    edStartPage: TEdit;
    cbNoRunCmd: TCheckBox;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FSL : TStringList;
  public
    FItem, FItemDel : Integer;
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

implementation

uses uCMGPri, uCMGConfigDesktop;

{$R *.DFM}

procedure TFrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConfig.FormCreate(Sender: TObject);
begin

  FSL := TStringList.Create;
  
  with FrmPri, CM do begin
    edServidor.Text := slConfig.Values['Servidor'];
    edMaquina.AsInteger := StrToIntDef(slConfig.Values['Maquina'], 0);
  
    if Ativo then 
      FSL.Text := Maquinas.PorNumero[Maquina].Recursos;
    cbTodas.Visible := Ativo;
    tsRecursos.TabVisible := Ativo;
  end;  
    
  FItem := -1;
end;

procedure TFrmConfig.BitBtn1Click(Sender: TObject);
const
  TFSt : Array[Boolean] of Char = ('F', 'T');
var 
  I : Integer;
begin
  with FrmPri do begin
    slConfig.Values['Servidor'] := edServidor.Text;
    slConfig.Values['Maquina'] := IntToStr(edMaquina.AsInteger);
    slConfig.SaveToFile(IniFName);
  end;  

  if not tsRecursos.TabVisible then Exit;
  
  with FSL do begin
    Values['MenuIniciar']   := TFSt[cbMenuIniciar.Checked];
    Values['Tray']          := TFSt[cbTray.Checked];
    Values['Cronometro']    := TFSt[cbCronometro.Checked];
    Values['NoDownload']    := TFSt[cbNoDownload.Checked];
    Values['NoRunCmd']      := TFSt[cbNoRunCmd.Checked];
    Values['CtrlPanel']     := TFSt[cbCtrlPanel.Checked];
    Values['CtrlAltDel']    := TFSt[cbCtrlAltDel.Checked];
    Values['Resetar']       := TFSt[cbResetar.Checked];
    Values['Stretch']       := TFSt[cbStretch.Checked];
    Values['FundoTela']     := edFundoTela.Filename;
    Values['StartPage']     := Trim(edStartPage.Text);
  end;
  
  with FrmPri, CM.Maquinas do 
  for I := 0 to pred(Count) do 
  with Itens[I] do 
  if (Numero=CM.Maquina) or cbTodas.Checked then begin
    AtualizaCache;
    Menu := slMenu.Text;
    Recursos := FSL.Text;
    slRecursos.Text := FSL.Text;
    CM.SalvaAlteracoesObj(Itens[I], False);
  end;  
end;

procedure TFrmConfig.FormShow(Sender: TObject);
begin
  if tsRecursos.TabVisible then
  with FSL do begin
    cbMenuIniciar.Checked := (Values['MenuIniciar']<>'F');
    cbTray.Checked := (Values['Tray']<>'F');
    cbCronometro.Checked := (Values['Cronometro']<>'F');
    cbNoDownload.Checked := (Values['NoDownload']='T');
    cbNoRunCmd.Checked := (Values['NoRunCmd']='T');
    cbCtrlPanel.Checked := (Values['CtrlPanel']='T');
    cbCtrlAltDel.Checked := (Values['CtrlAltDel']='T');
    cbResetar.Checked    := (Values['Resetar']= 'T');
    cbStretch.Checked := (Values['Stretch']='T');
    edStartPage.Text := Values['StartPage'];
    edFundoTela.Filename := Values['FundoTela'];
  end;  
end;

procedure TFrmConfig.FormDestroy(Sender: TObject);
begin
  FSL.Free;
end;

procedure TFrmConfig.Button1Click(Sender: TObject);
begin
  with FrmPri do
    slMenu.Text := TFrmDesktop.Create(Self).ConfiguraDesktop(slMenu.Text);
end;

end.
