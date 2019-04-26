unit ncaFrmFornecedor;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxDBEdit, cxContainer, cxLabel, cxClasses,
  cxDropDownEdit, cxColorComboBox, ncClassesBase,
  LMDPNGImage, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxLookAndFeels, cxLookAndFeelPainters;

type
  TFrmFornecedor = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxLabel1: TcxLabel;
    edNome: TcxTextEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FNome: ^String;
    function Editar(var aNome: String): Boolean;
    { Public declarations }
  end;

var
  FrmFornecedor: TFrmFornecedor;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos, ufmImagens;

// START resource string wizard section
resourcestring
  SÉNecessárioInformarONomeDoFornec = 'É necessário informar o nome do fornecedor';

// END resource string wizard section


{$R *.DFM}

{ TFrmForncedor }


procedure TFrmFornecedor.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFornecedor.cmGravarClick(Sender: TObject);
begin
  edNome.PostEditValue;
  if Trim(edNome.Text)='' then
    Raise Exception.Create(SÉNecessárioInformarONomeDoFornec);
  FNome^ := edNome.Text;  
  ModalResult := mrOk;
end;

function TFrmFornecedor.Editar(var aNome: String): Boolean;
begin
  FNome := @aNome;
  edNome.Text := aNome;
  ShowModal;
  Result := (ModalResult=mrOk);
end;

procedure TFrmFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : cmGravarClick(nil);
    Key_Esc   : cmCancelarClick(nil);
  end;
end;

end.

