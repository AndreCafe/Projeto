unit uCMFrmUsuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, ExtCtrls,
  dxInspct, dxDBInsp, ComCtrls, Db, kbmMemTable, dxInspRw, dxDBInRw, dxTL,
  dxDBCtrl, dxDBGrid, LMDCustomScrollBox, LMDScrollBox, lmdsplt,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, dxBarExtItems,
  cmListaID, cmIDRecursos, dxExEdtr;

type
  TFrmUsuario = class(TForm)
    Panel1: TPanel;
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    mtUsuario: TkbmMemTable;
    mtUsuarioUsername: TStringField;
    mtUsuarioNome: TStringField;
    mtUsuarioAdmin: TBooleanField;
    mtUsuarioSenha: TStringField;
    mtUsuarioGrupos: TMemoField;
    mtUsuarioDireitos: TMemoField;
    mtUsuarioNumClientes: TIntegerField;
    dsUsuario: TDataSource;
    Paginas: TPageControl;
    tsDados: TTabSheet;
    tsGrupo: TTabSheet;
    Insp: TdxDBInspector;
    mtUsuarioConfirmaSenha: TStringField;
    InspUsername: TdxInspectorDBMaskRow;
    InspNome: TdxInspectorDBMaskRow;
    InspAdmin: TdxInspectorDBCheckRow;
    InspSenha: TdxInspectorDBMaskRow;
    InspConfirmaSenha: TdxInspectorDBMaskRow;
    InspRow9: TdxInspectorComplexRow;
    LMDSplitterPanel1: TLMDSplitterPanel;
    LMDSplitterPane2: TLMDSplitterPane;
    LBGrupos: TListBox;
    dxBarDockControl1: TdxBarDockControl;
    LMDSplitterPane1: TLMDSplitterPane;
    gridGrupos: TdxDBGrid;
    dxBarDockControl2: TdxBarDockControl;
    dxBarStatic1: TdxBarStatic;
    cmGrupo2: TdxBarStatic;
    cmRemover: TdxBarButton;
    cmAdicionar: TdxBarButton;
    mtGrupo: TkbmMemTable;
    mtGrupoNome: TStringField;
    dsGrupo: TDataSource;
    gridGruposNome: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure mtGrupoFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cmAdicionarClick(Sender: TObject);
    procedure cmRemoverClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FUsername : String;
    FGrupos   : String;
    procedure Incluir;
    procedure Editar;
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

uses uCMDados, uCMFrmPri, cmClassesBase, cmCompCliente;

{$R *.DFM}

procedure TFrmUsuario.Incluir;
begin
  try
    FUsername := '';
    mtUsuario.Append;
  except
    Free;
    Raise;
  end;
  ShowModal;  
end;

procedure TFrmUsuario.Editar;
var 
  I : Integer;
  F : TField;
begin
  FUsername := Dados.mtUsuarioUsername.Value;
  try
    InspUsername.ReadOnly := True;
    mtUsuario.Active := True;
    mtUsuario.Append;
    with mtUsuario do
    for I := 0 to pred(FieldCount) do begin
      F := Dados.mtUsuario.FindField(Fields[I].FieldName);
      if F <> nil then Fields[I].Value := F.Value;
    end;  
    mtUsuario.Post;
    mtUsuario.Edit;  
    FGrupos := mtUsuarioGrupos.Value;
    LBGrupos.Items.Text := FGrupos;
    mtGrupo.Refresh;
  except
    Free;
    Raise;
  end;
  ShowModal;  
end;

procedure TFrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmUsuario.cmGravarClick(Sender: TObject);
var U : TCMUsuario;
begin
  mtUsuario.Post;
  mtUsuario.Edit;
  if mtUsuarioSenha.Value <> mtUsuarioConfirmaSenha.Value then begin
    ShowMessage('Senhas diferentes');
    Exit;
  end;  
  if FUsername <> '' then 
    U := Dados.CM.Usuarios.PorUsername[FUsername]
  else 
    U := TCMUsuario.Create;
       
  if U <> nil then begin
    try
      mtUsuarioGrupos.Value := FGrupos;
      U.LeDataset(mtUsuario);
      Dados.CM.SalvaAlteracoesObj(U, (FUsername=''));
    finally  
      if FUsername='' then U.Free;
    end;  
  end;
  mtUsuario.Post;
  Close;
end;

procedure TFrmUsuario.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmUsuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmUsuario.FormCreate(Sender: TObject);
begin
  mtUsuario.Open;
  mtGrupo.Open;
  dados.mtGrupo.First;
  while not dados.mtGrupo.Eof do begin
    mtGrupo.Append;
    mtGrupoNome.Value := dados.mtGrupoNome.Value;
    mtGrupo.Post;
    dados.mtGrupo.Next;
  end;
end;

procedure TFrmUsuario.mtGrupoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := not ListaContemStr(FGrupos, mtGrupoNome.Value);
end;

procedure TFrmUsuario.cmAdicionarClick(Sender: TObject);
begin
  if mtGrupo.RecordCount=0 then Exit;
  LBGrupos.Items.Add(mtGrupoNome.Value);
  FGrupos := LBGrupos.Items.Text;
  mtGrupo.Refresh;
end;

procedure TFrmUsuario.cmRemoverClick(Sender: TObject);
begin
  if LBGrupos.ItemIndex<0 then Exit;
  LBGrupos.Items.Delete(LBGrupos.ItemIndex);
  FGrupos := LBGrupos.Items.Text;
  mtGrupo.Refresh;
end;

procedure TFrmUsuario.FormShow(Sender: TObject);
begin
  mtUsuarioConfirmaSenha.Value := mtUsuarioSenha.Value;
end;

end.
