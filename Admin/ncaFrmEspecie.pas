unit ncaFrmEspecie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxCheckBox, cxTextEdit, cxDropDownEdit, cxMaskEdit,
  cxImageComboBox, cxLabel, dxBar, cxClasses, ncEspecie, nxdb, DB, kbmMemTable,
  cxDBEdit;

type
  TFrmEspecie = class(TForm)
    BarMgr: TdxBarManager;
    BarMgrBar1: TdxBar;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    Tab: TkbmMemTable;
    dsTab: TDataSource;
    TabID: TWordField;
    TabTipo: TWordField;
    TabNome: TStringField;
    TabPermiteTroco: TBooleanField;
    TabPermiteVarios: TBooleanField;
    TabPermiteCred: TBooleanField;
    TabImg: TWordField;
    TabRecVer: TIntegerField;
    edDBImg: TcxDBImageComboBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    procedure cmGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cmCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab : TnxTable;
    procedure Editar(aTab: TnxTable);
    procedure Novo(aTab: TnxTable);
    constructor Create(AOwner: TComponent); override;

    { Public declarations }
  end;

var
  FrmEspecie: TFrmEspecie;

implementation

uses
  ncaFrmPri,
  ncaDM,
  ncIDRecursos,
  ufmFormBase, ncaDMImgEsp;


{$R *.dfm}

resourcestring
  rsNomeEmBranco = 'Nome da forma de pagamento não pode ficar em branco';

{ TFrmEspecie }

procedure TFrmEspecie.cmCancelarClick(Sender: TObject);
begin
     close;
end;

procedure TFrmEspecie.cmGravarClick(Sender: TObject);
begin

  //  Validar!!!! rsNomeEmBranco;

  Tab.Post;
  if FNovo then
    FTab.Insert
  else
    FTab.Edit;
  TransfDados(Tab, FTab);
  FTab.Post;
  Close;

end;



procedure TFrmEspecie.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
  Tab.Insert;
  TransfDados(aTab, Tab);
  Tab.Post;
  Tab.Edit;
  ShowModal;
end;

procedure TFrmEspecie.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEspecie.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;

end;

constructor TFrmEspecie.Create(AOwner: TComponent);
var I:Integer;
begin
  inherited;

  edDBImg.Properties.Items.Clear;

  for I := 0 to dmImgEsp.imgs48.Count - 1 do
    with edDBImg.Properties.Items.Add do begin
      Value := I;
      ImageIndex := I;
    end;
end;

procedure TFrmEspecie.Novo(aTab: TnxTable);
begin
  FNovo := True;
  FTab := aTab;
  Tab.Insert;
  TabID.Value := aTab.RecordCount + 1;
  TabTipo.Value := 0;
  ShowModal;
end;


end.
