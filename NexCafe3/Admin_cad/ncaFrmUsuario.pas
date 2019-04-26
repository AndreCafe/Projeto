unit ncaFrmUsuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, StdCtrls, ExtCtrls,
  ComCtrls, Db, kbmMemTable, 
  LMDCustomScrollBox, LMDScrollBox, lmdsplt,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, dxBarExtItems,
  ncListaID, ncIDRecursos, cxCheckListBox, cxControls,
  cxContainer, cxEdit, cxLabel, cxCheckBox, cxDBEdit, cxTextEdit, cxGroupBox,
  cxMaskEdit, cxSpinEdit, cxClasses;

type
  TFrmUsuario = class(TForm)
    Panel1: TPanel;
    BarMgr: TdxBarManager;
    mtUsuario: TkbmMemTable;
    mtUsuarioUsername: TStringField;
    mtUsuarioNome: TStringField;
    mtUsuarioAdmin: TBooleanField;
    mtUsuarioSenha: TStringField;
    mtUsuarioDireitos: TMemoField;
    dsUsuario: TDataSource;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cmAlteraSenha: TdxBarLargeButton;
    Panel2: TPanel;
    lbDir: TcxLabel;
    cbItens: TcxCheckListBox;
    Panel3: TPanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edUsername: TcxDBTextEdit;
    edNome: TcxDBTextEdit;
    cbAdmin: TcxDBCheckBox;
    gbManut: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    mtUsuarioMaxTempoManut: TIntegerField;
    mtUsuarioMaxMaqManut: TIntegerField;
    edMaxMaq: TcxDBSpinEdit;
    edMaxTempo: TcxDBSpinEdit;
    procedure cbItensClickCheck(Sender: TObject; AIndex: Integer; APrevState,
      ANewState: TcxCheckBoxState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AjustaDir;
    procedure cbAdminClick(Sender: TObject);
    procedure cmAlteraSenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    FUsername : String;
    FItens : TStrings;
    procedure Incluir;
    procedure Editar;
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

uses 
  ncClassesBase, 
  ncCompCliente, 
  ncaDM, 
  ncaFrmSenha, 
  ncaFrmPri,
  ufmImagens;

{$R *.DFM}

procedure ChecaCaixa;
begin

end;

procedure TFrmUsuario.Incluir;
var I : Integer;
begin
  try
    FUsername := '';
    mtUsuario.Append;
    FItens.Text := '';
    mtUsuarioAdmin.Value := False;
    for I := 1 to daQuantidade do
      if I in daDefault then begin
        FItens.Values[IntToStr(I)] := 'S';
        cbItens.Items[I-1].Checked := True;
      end;  
        
    mtUsuarioDireitos.Value := FItens.Text;    
    AjustaDir;
  except
    Free;
    Raise;
  end;
  ShowModal;  
end;

procedure TFrmUsuario.Editar;
var 
  I, C : Integer;
  F : TField;
begin
  FUsername := Dados.mtUsuarioUsername.Value;
  try
    mtUsuario.Active := True;
    mtUsuario.Append;
    with mtUsuario do
    for I := 0 to pred(FieldCount) do begin
      F := Dados.mtUsuario.FindField(Fields[I].FieldName);
      if F <> nil then Fields[I].Value := F.Value;
    end;  
    mtUsuario.Post;
    mtUsuario.Edit;
    if mtUsuarioAdmin.Value then begin
      C := 0;
      with Dados do 
      for I := 0 to CM.Usuarios.Count-1 do
        if CM.Usuarios[I].Admin then Inc(C);
      if C<2 then cbAdmin.Enabled := False;    
    end;
    FItens.Text := mtUsuarioDireitos.Value;
    AjustaDir;
    for I := 1 to daQuantidade do
      cbItens.Items[I-1].Checked := ItemTrueSL(FItens, I);
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
var 
  U : TncUsuario;
  I : Integer;
begin
  mtUsuario.Post;
  mtUsuario.Edit;
  if FUsername <> '' then 
    U := Dados.CM.Usuarios.PorUsername[FUsername]
  else 
    U := TncUsuario.Create;
       
  if U <> nil then begin
    try
      for I := 1 to daQuantidade do
      if cbItens.Items[I-1].Checked then
        FItens.Values[IntToStr(I)] := 'S'
      else
        FItens.Values[IntToStr(I)] := 'N';  
        
      U.LeDataset(mtUsuario);
      U.Direitos := FItens.Text;
      U.LimpaCache;
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
var 
  I : Integer;
  Item : TcxCheckListBoxItem;
begin
  cbItens.Clear;
  FItens := TStringList.Create;
  for I := 1 to daQuantidade do begin
    Item := cbItens.Items.Add;
    Item.Text := IntToStr(I)+'. ' + daDescr[I];
    Item.Enabled := True;
    Item.Checked := False;
  end;  
  mtUsuario.Open;
end;

procedure TFrmUsuario.FormDestroy(Sender: TObject);
begin
  FItens.Free;
end;

procedure TFrmUsuario.AjustaDir;
begin
  cbItens.Enabled := not cbAdmin.Checked;
  if cbItens.Enabled then
    lbDir.Caption := 'Marque os itens que esse usuário tem direito de acessar:'
  else
    lbDir.Caption := 'Usuário Administrador. Não é necessário marcar os direitos abaixo';
end;

procedure TFrmUsuario.cbAdminClick(Sender: TObject);
begin
  AjustaDir;
end;

procedure TFrmUsuario.cbItensClickCheck(Sender: TObject; AIndex: Integer;
  APrevState, ANewState: TcxCheckBoxState);
begin
  if AIndex = (daMaqModoManutencao-1) then
    AjustaDir;
end;

procedure TFrmUsuario.cmAlteraSenhaClick(Sender: TObject);
begin
  mtUsuarioSenha.Value := TFrmAlteraSenha.Create(nil).Editar(mtUsuarioSenha.AsString, mtUsuarioNome.AsString);
end;

end.
