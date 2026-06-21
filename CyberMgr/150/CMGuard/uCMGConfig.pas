unit uCMGConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, StdCtrls,
  Buttons, ExtCtrls, ImgList, Db, kbmMemTable, DBCtrls, LMDCustomComponent,
  LMDVersionInfo, dxPageControl, OvcBase, OvcEF, OvcPB, OvcNF,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomBrowseEdit, LMDFileOpenEdit;

type
  TFrmConfig = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbTodas: TCheckBox;
    Imagens: TImageList;
    dsTab: TDataSource;
    mtTab: TkbmMemTable;
    mtTabNumItem: TIntegerField;
    mtTabArquivo: TStringField;
    mtTabDescricao: TStringField;
    Version: TLMDVersionInfo;
    OD: TOpenDialog;
    dxPageControl1: TdxPageControl;
    tsMenuIniciar: TdxTabSheet;
    tsRecursos: TdxTabSheet;
    Grid: TdxDBGrid;
    GridNumItem: TdxDBGridImageColumn;
    GridDescricao: TdxDBGridMaskColumn;
    GridArquivo: TdxDBGridButtonColumn;
    Panel3: TPanel;
    imSemIcone: TImage;
    DBNavigator1: TDBNavigator;
    cbDesktop: TCheckBox;
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
    OvcController1: TOvcController;
    cbResetar: TCheckBox;
    edFundoTela: TLMDFileOpenEdit;
    Label1: TLabel;
    cbStretch: TCheckBox;
    cbNoDownload: TCheckBox;
    Label2: TLabel;
    edStartPage: TEdit;
    procedure GridArquivoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure mtTabAfterInsert(DataSet: TDataSet);
    procedure mtTabBeforePost(DataSet: TDataSet);
    procedure mtTabBeforeDelete(DataSet: TDataSet);
    procedure mtTabAfterDelete(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbMenuIniciarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FSL : TStringList;
    procedure LeItens;
  public
    FItem, FItemDel : Integer;
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

implementation

uses uCMGPri;

{$R *.DFM}

procedure TFrmConfig.GridArquivoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  OD.FileName := mtTabArquivo.Value;
  if OD.Execute then begin
    if not (mtTab.State in [dsEdit, dsInsert]) then 
    if mtTab.RecordCount=0 then
      mtTab.Append
    else
      mtTab.Edit;  
      
    mtTabArquivo.Value := OD.FileName;
  end;  
end;

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
    tsMenuIniciar.TabVisible := Ativo;
  end;  
    
  FItem := -1;
end;

procedure TFrmConfig.mtTabAfterInsert(DataSet: TDataSet);
begin
  mtTabNumItem.Value := -1;
end;

procedure TFrmConfig.mtTabBeforePost(DataSet: TDataSet);
var Icon : TIcon;
begin
  Version.RetrieveFilename := ObtemEXE(mtTabArquivo.Value);
  Icon := nil;
  if Version.LargeIcons.Count > 0 then begin
    Icon := TIcon.Create;
    Version.LargeIcons.GetIcon(0, Icon);
  end;  
  
  if mtTab.State = dsInsert then begin
    Inc(FItem);
    mtTabNumItem.Value := FItem;
    if Icon <> nil then
      Imagens.AddIcon(Icon)
    else
      Imagens.AddIcon(imSemIcone.Picture.Icon);  
  end else begin
    if Icon <> nil then
      Imagens.ReplaceIcon(mtTabNumItem.Value, Icon)
    else
      Imagens.ReplaceIcon(mtTabNumItem.Value, imSemIcone.Picture.Icon);
  end;    

  if Icon <> nil then Icon.Free;
end;

procedure TFrmConfig.mtTabBeforeDelete(DataSet: TDataSet);
begin
  FItemDel := mtTabNumItem.Value;
end;

procedure TFrmConfig.mtTabAfterDelete(DataSet: TDataSet);
begin
  Imagens.Delete(FItemDel);
  while (not mtTab.Eof) and (mtTabNumItem.Value > FItemDel) do begin
    mtTab.Edit;
    mtTabNumItem.Value := mtTabNumitem.Value - 1;
    mtTab.Post;
    mtTab.Next;
  end;
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
  
  frmPri.slMenu.Clear;
  mtTab.First;
  with frmPri do 
  while not mtTab.Eof do begin
    slMenu.Values[mtTabDescricao.Value] := mtTabArquivo.Value;
    mtTab.Next;
  end;

  with FSL do begin
    Values['Desktop']       := TFSt[cbDesktop.Checked];
    Values['MenuIniciar']   := TFSt[cbMenuIniciar.Checked];
    Values['Tray']          := TFSt[cbTray.Checked];
    Values['Cronometro']    := TFSt[cbCronometro.Checked];
    Values['NoDownload']    := TFSt[cbNoDownload.Checked];
    Values['CtrlPanel']     := TFSt[cbCtrlPanel.Checked];
    Values['CtrlAltDel']    := TFSt[cbCtrlAltDel.Checked];
    Values['Resetar']       := TFSt[cbResetar.Checked];
    Values['Stretch']       := TFSt[cbStretch.Checked];
    Values['FundoTela']     := edFundoTela.Filename;
    Values['NoDownload']    := TFSt[cbNoDownload.Checked];
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

procedure TFrmConfig.LeItens;
var I : Integer;
begin
  mtTab.Active := True;
  with frmPri, slMenu do
  for I := 0 to pred(Count) do begin
    mtTab.Append;
    mtTabDescricao.Value := slMenu.Names[I];
    mtTabArquivo.Value := slMenu.Values[slMenu.Names[I]];
    mtTab.Post;
  end;  
end;

procedure TFrmConfig.FormShow(Sender: TObject);
begin
  if tsRecursos.TabVisible then
  with FSL do begin
    cbDesktop.Checked := (Values['Desktop']<>'F');
    cbMenuIniciar.Checked := (Values['MenuIniciar']<>'F');
    cbTray.Checked := (Values['Tray']<>'F');
    cbCronometro.Checked := (Values['Cronometro']<>'F');
    cbNoDownload.Checked := (Values['NoDownload']='T');
    cbCtrlPanel.Checked := (Values['CtrlPanel']='T');
    cbCtrlAltDel.Checked := (Values['CtrlAltDel']='T');
    cbResetar.Checked    := (Values['Resetar']= 'T');
    cbStretch.Checked := (Values['Stretch']='T');
    edStartPage.Text := Values['StartPage'];
    
    tsMenuIniciar.TabVisible := not cbMenuIniciar.Checked;
    edFundoTela.Filename := Values['FundoTela'];
  end;  
  
  LeItens;
end;

procedure TFrmConfig.cbMenuIniciarClick(Sender: TObject);
begin
  tsMenuIniciar.TabVisible := not cbMenuIniciar.Checked;
end;

procedure TFrmConfig.FormDestroy(Sender: TObject);
begin
  FSL.Free;
end;

end.
