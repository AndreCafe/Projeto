unit uCMFrmGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, dxCntner, dxEditor, dxEdLib, dxDBELib, StdCtrls, ExtCtrls,
  dxInspct, dxDBInsp, ComCtrls, Db, kbmMemTable, dxInspRw, dxDBInRw,
  dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, LMDCustomScrollBox,
  LMDScrollBox, lmdsplt, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, cmListaID, cmIDRecursos, dxBarExtItems;

type
  TFrmGrupo = class(TForm)
    Panel1: TPanel;
    BM: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    Paginas: TPageControl;
    tsDados: TTabSheet;
    tsGrupo: TTabSheet;
    tsDireitos: TTabSheet;
    Insp: TdxDBInspector;
    InspNome: TdxInspectorDBMaskRow;
    LMDSplitterPanel1: TLMDSplitterPanel;
    LMDSplitterPane1: TLMDSplitterPane;
    LMDSplitterPane2: TLMDSplitterPane;
    gridUsuarios: TdxDBGrid;
    cmAdicionar: TdxBarButton;
    cmRemover: TdxBarButton;
    LBUsuarios: TListBox;
    gridUsuariosNome: TdxDBGridMaskColumn;
    dsUsuario: TDataSource;
    mtUsuario: TkbmMemTable;
    mtUsuarioUsername: TStringField;
    mtUsuarioNome: TStringField;
    mtGrupo: TkbmMemTable;
    dsGrupo: TDataSource;
    mtGrupoNome: TStringField;
    mtGrupoUsuarios: TMemoField;
    mtGrupoDireitos: TMemoField;
    cmUsuarios: TdxBarStatic;
    dxBarDockControl2: TdxBarDockControl;
    dxBarDockControl1: TdxBarDockControl;
    cmUsuarios2: TdxBarStatic;
    LMDSplitterPanel2: TLMDSplitterPanel;
    LMDSplitterPane3: TLMDSplitterPane;
    dxBarDockControl3: TdxBarDockControl;
    LMDSplitterPane4: TLMDSplitterPane;
    gridModulos: TdxDBGrid;
    dxBarDockControl4: TdxBarDockControl;
    cmAddAcesso: TdxBarButton;
    cmRemoveAcesso: TdxBarButton;
    cmAcessos1: TdxBarStatic;
    cmAcesso2: TdxBarStatic;
    mtDireito: TkbmMemTable;
    mtDireitoAcessos: TMemoField;
    cmEditarAcesso: TdxBarButton;
    dsAcesso: TDataSource;
    mtDireitoModulo: TStringField;
    mtDireitoPermissoes: TMemoField;
    gridDireito: TdxDBGrid;
    gridDireitoModulo: TdxDBGridMaskColumn;
    gridDireitoPermissoes: TdxDBGridMemoColumn;
    mtModulo: TkbmMemTable;
    mtModuloID: TIntegerField;
    mtModuloNome: TStringField;
    dsModulo: TDataSource;
    gridModulosNome: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mtUsuarioFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure cmAdicionarClick(Sender: TObject);
    procedure cmRemoverClick(Sender: TObject);
    procedure mtModuloFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cmAddAcessoClick(Sender: TObject);
    procedure cmEditarAcessoClick(Sender: TObject);
    procedure cmRemoveAcessoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    FNome : String;
    Usuarios : String;
    Direitos : String;
    procedure Incluir;
    procedure Editar;
    procedure RefreshDireitos;
    { Public declarations }
  end;

  function TraduzUsername(S: String): String;

var
  FrmGrupo: TFrmGrupo;

implementation

uses uCMDados, uCMFrmPri, cmClassesBase, cmCompCliente, uCMFrmDireito;

{$R *.DFM}

procedure TFrmGrupo.Incluir;
begin
  try
    FNome := '';
    mtGrupo.Append;
  except
    Free;
    Raise;
  end;
  ShowModal;  
end;

procedure TFrmGrupo.Editar;
var 
  I : Integer;
  F : TField;
begin
  FNome := Dados.mtGrupoNome.Value;
  try
    InspNome.ReadOnly := True;
    mtGrupo.Active := True;
    mtGrupo.Append;
    with mtGrupo do
    for I := 0 to pred(FieldCount) do begin
      F := Dados.mtGrupo.FindField(Fields[I].FieldName);
      if F <> nil then Fields[I].Value := F.Value;
    end;  
    mtGrupo.Post;
    mtGrupo.Edit;  
    Usuarios := mtGrupoUsuarios.Value;
    Direitos := mtGrupoDireitos.Value;
    RefreshDireitos;
    LBUsuarios.Items.Text := ListaTraduz(Usuarios, TraduzUsername);
    mtUsuario.Refresh;
  except
    Free;
    Raise;
  end;
  ShowModal;
end;

procedure TFrmGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmGrupo.cmGravarClick(Sender: TObject);
var G : TCMGrupo;
begin
  mtGrupo.Post;
  mtGrupo.Edit;
  if FNome <> '' then 
    G := Dados.CM.Grupos.PorNome[FNome]
  else 
    G := TCMGrupo.Create;
       
  if G <> nil then begin
    try
      mtGrupoUsuarios.Value := Usuarios;
      mtGrupoDireitos.Value := Direitos;
      G.LeDataset(mtGrupo);
      Dados.CM.SalvaAlteracoesObj(G, (FNome=''));
    finally
      if FNome='' then 
        G.Free;
    end;  
  end;
  if mtGrupo.State in [dsEdit, dsInsert] then
    mtGrupo.Post;
  Close;
end;

procedure TFrmGrupo.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmGrupo.FormCreate(Sender: TObject);
var I : Integer;
begin
  Paginas.ActivePageIndex := 0;
  Usuarios := '';
  Direitos := '';
  mtDireito.Open;
  mtGrupo.Open;
  mtUsuario.Open;
  dados.mtUsuario.First;
  while not dados.mtUsuario.Eof do begin
    mtUsuario.Append;
    mtUsuarioUsername.Value := dados.mtUsuarioUsername.Value;
    mtUsuarioNome.Value := dados.mtUsuarioNome.Value;
    mtUsuario.Post;
    dados.mtUsuario.Next;
  end;  

  mtModulo.Open;
  for I := 1 to NumRecursos do begin
    mtModulo.Append;
    mtModuloID.Value := I;
    mtModuloNome.Value := StringRecurso(I);
    mtModulo.Post;
  end;
  
end;

procedure TFrmGrupo.mtUsuarioFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := not ListaContemStr(Usuarios, mtUsuarioUsername.Value);
end;

procedure TFrmGrupo.cmAdicionarClick(Sender: TObject);
begin
  Usuarios := ListaAddStr(Usuarios, mtUsuarioUsername.Value);
  LBUsuarios.Items.Text := ListaTraduz(Usuarios, TraduzUsername);
  mtUsuario.Refresh;
end;

function TraduzUsername(S: String): String;
begin
  if Dados.mtUsuario.Findkey([S]) then
    Result := Dados.mtUsuarioNome.Value
  else
    Result := S;  
end;

procedure TFrmGrupo.cmRemoverClick(Sender: TObject);
begin
  if LBUsuarios.ItemIndex<0 then Exit;
  Usuarios := ListaRemoveLinha(Usuarios, LBUsuarios.ItemIndex+1);
  LBUsuarios.Items.Text := ListaTraduz(Usuarios, TraduzUsername);
  mtUsuario.Refresh;
end;

procedure TFrmGrupo.RefreshDireitos;
var 
  S, S2, L : String;
begin      
  mtDireito.Active := True;
  mtDireito.EmptyTable;                         
  S := '';
  S2 := '';
  L := Direitos;
  while L>'' do begin
    if Pos(L[1], DelimitaString)=0 then
      S := S + L[1]
    else
      S2 := S2 + L[1];
    Delete(L, 1, 1);
    if (L='') or (S2=DelimitaString) then begin
      if S > '' then begin
        mtDireito.Append;
        mtDireitoAcessos.Value := S;
        mtDireitoModulo.Value := CampoTraduzido(S, StringRecurso);
        mtDireitoPermissoes.Value := LITraduzTipoAcesso(EliminaCampo(S), StrToIntDef(ObtemCampo(S), 0), StringTipoAcesso);
        mtDireito.Post;
      end;
      S2 := '';
      S := '';
    end;
  end;    
end;

procedure TFrmGrupo.mtModuloFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (ObtemValor(Direitos, mtModuloID.AsString)='');
end;

procedure TFrmGrupo.cmAddAcessoClick(Sender: TObject);
var S : String;
begin
  if (Direitos > '') and 
     (Copy(Direitos, Length(Direitos)-1, 2)<>DelimitaString)
  then 
    Direitos  := Direitos + DelimitaString;
    
  S := '';
  S := LIAddID(S, AcessoMinimo(mtModuloID.Value));
  mtDireito.Append;
  mtDireitoAcessos.Value    := mtModuloID.AsString+'='+S;
  mtDireitoModulo.Value     := StringRecurso(mtModuloID.Value);
  mtDireitoPermissoes.Value := LITraduzTipoAcesso(S, mtModuloID.Value, StringTipoAcesso);
  mtDireito.Post;
  SetaValor(Direitos, mtModuloID.AsString, S);
  mtModulo.Refresh;
  cmEditarAcessoClick(nil);
end;

procedure TFrmGrupo.cmEditarAcessoClick(Sender: TObject);
var 
  M : Integer;
  S : String;
begin
  M := StrToIntDef(ObtemCampo(mtDireitoAcessos.Value), 0);
  S := EliminaCampo(mtDireitoAcessos.Value);
  if M > 0 then begin
    S := TFrmDireito.Create(Self).EditaDireitos(M, S);
    mtDireito.Edit;
    mtDireitoAcessos.Value := IntToStr(M)+'='+S;
    mtDireitoPermissoes.Value := LITraduzTipoAcesso(S, M, StringTipoAcesso);
    mtDireito.Post;
    SetaValor(Direitos, IntToStr(M), S);
  end;  
end;

procedure TFrmGrupo.cmRemoveAcessoClick(Sender: TObject);
begin
  Direitos := ListaRemoveStr(Direitos, mtDireitoAcessos.Value);
  mtDireito.Delete;
  mtModulo.Refresh;
  gridModulos.Refresh;
end;

procedure TFrmGrupo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : 
    if ssCtrl in Shift then 
      cmGravarClick(nil) 
    else 
    if gridDireito.Focused then
      cmEditarAcessoClick(nil);  

    Key_Ins   : 
    if Paginas.ActivePageIndex=2 then
      cmAddAcessoClick(nil);
      
    Key_Del   : 
    if Paginas.ActivePageIndex=2 then
      cmRemoveAcessoClick(nil);
    
    Key_Esc   : Close;
  end;
end;

end.
