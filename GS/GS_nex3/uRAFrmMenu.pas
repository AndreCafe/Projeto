unit uRAFrmMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxMaskEdit, cxRadioGroup, cxMemo,
  cxDropDownEdit, cxSpinEdit, cxImageComboBox, cxVGrid, cxDBVGrid,
  cxControls, cxInplaceContainer, dxBar, dxBarExtItems, cxDBLookupComboBox;

type
  TFrmMenu = class(TForm)
    BarMgr: TdxBarManager;
    cmCancelar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    cmSalvar: TdxBarLargeButton;
    VG: TcxDBVerticalGrid;
    VGDescricao: TcxDBEditorRow;
    VGNomeForm: TcxDBEditorRow;
    VGNomeOper: TcxDBEditorRow;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VGNomeFormEditPropertiesChange(Sender: TObject);
  private
    procedure LeOperacoes;
    { Private declarations }
  public
    procedure Novo;
    procedure Editar;
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

uses uRAPri, uRADM, DB, ufmFormBase, ufmImagens;

{$R *.dfm}

procedure TFrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if DM.qMenu.State in [dsEdit, dsInsert] then begin
    DM.qMenu.Cancel;
    DM.qMenu.Rollback;
  end;  
end;

procedure TFrmMenu.cmSalvarClick(Sender: TObject);
begin
  if DM.qMenu.State in [dsEdit, dsInsert] then
    DM.qMenu.Post;
  Close;  
end;

procedure TFrmMenu.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMenu.Editar;
begin
  DM.qMenu.Edit;
  LeOperacoes;
  ShowModal;
end;

procedure TFrmMenu.Novo;
begin
  DM.qMenu.Insert;
  ShowModal;
end;

procedure TFrmMenu.FormCreate(Sender: TObject);
var 
  Item: TcxImageComboBoxItem;
  I   : Integer;
begin
  with TcxImageComboBoxProperties(VGNomeForm.Properties.EditProperties) do begin
    Items.Clear;
    Item := TcxImageComboBoxItem(Items.Add);
    Item.Description := 'Nenhum';
    Item.Tag := 0;
    Item.Value := '';
    
    with FrmPri.FM do 
    for I := 0 to FrmPri.FM.Count-1 do with Forms[I]^ do begin
      Item := TcxImageComboBoxItem(Items.Add);
      Item.Description := fiClass.Descricao;
      Item.Tag := Integer(fiClass);
      Item.Value := fiClass.ClassName;
    end;
  end;  
end;

procedure TFrmMenu.LeOperacoes;
var 
  Item: TcxImageComboBoxItem;
  I   : Integer;
  C   : PFrmBaseClass;
  S   : String;
begin
  with TcxImageComboBoxProperties(VGNomeOper.Properties.EditProperties) do begin
    Items.Clear;
    C := FrmPri.FM.ClassByName(Dm.qMenuForm.Value);
    if C = nil then Exit;
    I := 0;
    while C^.GetOperacoes(I, S) do begin
      Item := TcxImageComboBoxItem(Items.Add);
      Item.Description := S;
      Item.Tag := I;
      Item.Value := I;
      Inc(I);
    end;
  end;  
end;

procedure TFrmMenu.VGNomeFormEditPropertiesChange(Sender: TObject);
begin
  LeOperacoes;
end;

end.




                                                                                        
