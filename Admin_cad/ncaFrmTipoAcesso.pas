unit ncaFrmTipoAcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxDBEdit, cxContainer, cxLabel, cxClasses;

type
  TFrmTipoAcesso = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    Tab: TkbmMemTable;
    dsTab: TDataSource;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    TabID: TWordField;
    TabNome: TStringField;
    cxLabel1: TcxLabel;
    edNome: TcxDBMaskEdit;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab : TnxTable;
    procedure Editar(aTab: TnxTable);
    procedure Novo(aTab: TnxTable);
    { Public declarations }
  end;

var
  FrmTipoAcesso: TFrmTipoAcesso;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos;

{$R *.DFM}

{ TFrmPacote }

procedure TFrmTipoAcesso.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
  Tab.Insert;
  TabID.Value := FTab.FieldByName('ID').AsInteger;
  TabNome.Value := FTab.FieldByName('Nome').AsString;  
  Tab.Post;
  Tab.Edit;  
  ShowModal;
end;

procedure TFrmTipoAcesso.cmGravarClick(Sender: TObject);
begin
  Tab.Post;
  if FNovo then
    FTab.Insert
  else  
    FTab.Edit;
  FTab.FieldByName('ID').AsInteger := TabID.Value;
  FTab.FieldByName('Nome').AsString := TabNome.Value;
  FTab.Post;
  Close;
end;

procedure TFrmTipoAcesso.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTipoAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTipoAcesso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmTipoAcesso.Novo(aTab: TnxTable);
begin
  FNovo := True;
  FTab := aTab;
  Tab.Insert;
  FTab.Last;
  if FTab.IsEmpty then
    TabID.Value := 1
  else begin
    FTab.Last;
    TabID.Value := FTab.FieldByName('ID').AsInteger + 1;
  end;
  Tab.Post;
  Tab.Edit;
  ShowModal;
end;

procedure TFrmTipoAcesso.FormShow(Sender: TObject);
begin
  cmGravar.Enabled := Permitido(daCFGPrecos);
end;

end.
