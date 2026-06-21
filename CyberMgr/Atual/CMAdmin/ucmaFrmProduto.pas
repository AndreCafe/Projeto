unit ucmaFrmProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, 
  ExtCtrls, 
  Db, nxdb, ComCtrls,
  lmdcctrl, lmdctrl, 
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  LMDFormDisplay, cxPC, cxControls, cxStyles, cxGraphics,
  cxEdit, cxMaskEdit, cxCurrencyEdit, cxDropDownEdit, cxMemo, cxVGrid,
  cxDBVGrid, cxInplaceContainer, dxBar, ufmFormBase, dxBarExtItems,
  kbmMemTable, cxCheckBox, cxImage;

type
  TFrmProduto = class(TForm)
    BarMgr: TdxBarManager;
    QCat: TnxQuery;
    dsMT: TDataSource;
    cmKardex: TdxBarButton;
    LMDSimplePanel2: TLMDSimplePanel;
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    VG: TcxDBVerticalGrid;
    VGCodigo: TcxDBEditorRow;
    VGDescricao: TcxDBEditorRow;
    VGPreco: TcxDBEditorRow;
    VGCategoria: TcxDBEditorRow;
    VGObs: TcxDBEditorRow;
    FMgr: TFormManager;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    MT: TkbmMemTable;
    MTCodigo: TStringField;
    MTDescricao: TStringField;
    MTPreco: TCurrencyField;
    MTObs: TMemoField;
    MTImagem: TGraphicField;
    MTCategoria: TStringField;
    VGCustoUnit: TcxDBEditorRow;
    MTCustoUnitario: TCurrencyField;
    MTPodeAlterarPreco: TBooleanField;
    MTNaoControlaEstoque: TBooleanField;
    VGPodeAlterarPreco: TcxDBEditorRow;
    vgNaoControlaEstoque: TcxDBEditorRow;
    VGDBEditorRow3: TcxDBEditorRow;
    procedure vgNaoControlaEstoquePropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure VGPodeAlterarPrecoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure VGPrecoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
     Tab : TnxTable;
     CodAnt : String;
    { Public declarations }
    procedure Editar(aTab: TnxTable);
    procedure Incluir(aTab: TnxTable);
  end;

var
  FrmProduto: TFrmProduto;
  
implementation

uses 
  cmIDRecursos, ucmaDM, ufmImagens, ucmaPri, ucmafbMovEst;


{$R *.DFM}

procedure TFrmProduto.Editar(aTab: TnxTable);
begin
  Tab := aTab;
  MT.Insert;
  TransfDados(Tab, MT);
  MT.Post;
  MT.Edit;
  CodAnt := Tab.FieldByName('Codigo').AsString;
  cmKardex.Visible := ivAlways;
  cmGravar.Enabled := Permitido(daProCadastrar);
  VGPreco.Properties.EditProperties.ReadOnly := not Permitido(daProEditarPreco);
  ShowModal;
end;

procedure TFrmProduto.Incluir(aTab: TnxTable);
begin
  Tab := aTab;  
  MT.Insert;
  MT.Post;
  MT.Edit;
  ShowModal;
  CodAnt := '';
end;
    
procedure TFrmProduto.vgNaoControlaEstoquePropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daProEditarPreco);
end;

procedure TFrmProduto.VGPodeAlterarPrecoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daProEditarPreco);
end;

procedure TFrmProduto.VGPrecoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daProEditarPreco);
end;

procedure TFrmProduto.cmGravarClick(Sender: TObject);
var 
  Cat: String;
  DS : TDataSource;
begin
  VG.DataController.PostEditingData;
  if (MT.FieldByName('Codigo').AsString)='' then begin
    Beep;
    ShowMessage('Campo código não pode ser deixado em branco!');
    Exit;
  end;  
  if (MTCodigo.Value <> CodAnt) then 
  if Dados.tbPro.Locate('Codigo', MTCodigo.Value, [loCaseInsensitive]) then begin
    Beep;
    ShowMessage('Já existe um produto cadastrado com esse código');
    Exit;
  end;
  if (MT.FieldByName('Descricao').AsString)='' then begin
    Beep;
    ShowMessage('Campo descrição não pode ser deixado em branco!');
    Exit;
  end;  
  with Dados, tbCat do begin
    DB.StartTransaction;
    try
      Cat := Trim(MT.FieldByName('categoria').AsString);
      if (Cat <> '') and (not Findkey([MT.FieldByName('categoria').AsString])) 
      then begin
        Append;
        FieldByName('Descricao').AsString := 
          MT.FieldByName('categoria').AsString;
        Post;
      end;
      if CodAnt='' then
        Tab.Insert
      else
        Tab.Edit;
      TransfDados(MT, Tab);
      if (CodAnt<>'') and (CodAnt<>Tab.FieldByName('Codigo').AsString) then begin
        QCat.Close;
        QCat.SQL.Clear;
        QCat.SQL.Add('update movest' +
                     ' set produto = ' + QuotedStr(Tab.FieldByName('Codigo').AsString) +
                     ' where produto = ' + QuotedStr(CodAnt));
        ShowMessage(QCat.SQL.Text);             
        QCat.ExecSQL;
        QCat.Close;
      end;               
      Tab.Post;  
      DB.Commit;
    except
      DB.Rollback;
      Raise;
    end;  
  end;  
  Close;
end;

procedure TFrmProduto.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  FVen:= nil;
  FMgr.Clear;
  Action:= CaFree;
end;

procedure TFrmProduto.FormShow(Sender: TObject);
begin
//  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  qCat.Open;
  while not(Qcat.eof) do
  begin
    if Trim(qCat.FieldbyName('Descricao').AsString)<>'' then
      TcxComboBoxProperties(VGCategoria.Properties.EditProperties).Items.Add(qCat.FieldbyName('Descricao').AsString);
    qCat.Next;
  end;
  qCat.Close;

  FMgr.Mostrar(TfbMovEst, 0, MT.FieldByName('Codigo').AsString);
  Paginas.ActivePageIndex := 0;
  VG.SetFocus;
end;

procedure TFrmProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmProduto.FormCreate(Sender: TObject);
begin
  CodAnt := '';
  FMgr.RegistraForm(TfbMovEst);
end;

end.
