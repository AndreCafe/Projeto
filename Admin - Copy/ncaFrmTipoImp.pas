unit ncaFrmTipoImp;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, ncErros, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxDBEdit, cxContainer, cxLabel,
  cxDropDownEdit, LMDCustomComponent, LMDSysInfo, cxClasses, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxImageComboBox, StdCtrls, cxButtons, ncTipoImp,
  LMDThemedComboBox, LMDCustomComboBox, LMDPrinterComboBox;

type
  TFrmTipoImp = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxLabel1: TcxLabel;
    edDescr: TcxTextEdit;
    edValor: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    lbImp: TcxLabel;
    LMDSysInfo1: TLMDSysInfo;
    lbDevMode: TcxLabel;
    btnDevMode: TcxButton;
    cxLabel5: TcxLabel;
    edImg: TcxImageComboBox;
    cxLabel6: TcxLabel;
    edImp: TLMDPrinterComboBox;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edImpPropertiesCloseUp(Sender: TObject);
    procedure btnDevModeClick(Sender: TObject);
  private
    { Private declarations }
    procedure EnableDevMode;
  public
    FTab : TnxTable;
    FDados : TncTipoImp;
    FRes : Boolean;
    FNexPrinter : Boolean;
    FLastDev : String;
    function Editar(aDados: TncTipoImp; aNexPrinter: Boolean): Boolean;
    { Public declarations }
  end;

var
  FrmTipoImp: TFrmTipoImp;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncIDRecursos, ncImgImp, ncPrinterInfo8, ncClassesBase, ufmImagens;

// START resource string wizard section
resourcestring
  SÉObrigatórioQueATarifaTenhaUmNom = 'É obrigatório que a tarifa tenha um nome';
  SÉNecessárioEscolherUmaImpressora = 'É necessário escolher uma impressora';
  SÉNecessárioConfigurarAsPreferênc = 'É necessário configurar as preferências de impressão';

// END resource string wizard section


{$R *.DFM}

{ TFrmPacote }

procedure TFrmTipoImp.btnDevModeClick(Sender: TObject);
var 
  S: String;
begin
  S := edImp.SelectedPrinter;
  if FDados.DevModeStream.Size>0 then
    RestorePrinterInfo8(PChar(S), FDados.DevModeStream);
    
  if CapturePrinterInfo8(Self, PChar(S), FDados.DevModeStream) then 
    FLastDev := edImp.Text;

  if FDados.DevModeStream.Size>0 then
    RestorePrinterInfo8(PChar(S), FDados.DevModeStream);
end;

procedure TFrmTipoImp.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTipoImp.cmGravarClick(Sender: TObject);
begin
  if Trim(edDescr.Text)='' then
    Raise ENexCafe.Create(SÉObrigatórioQueATarifaTenhaUmNom);

  if FNexPrinter then begin
    if Dados.CM.MesmoCompServ and (edImp.ItemIndex<0) then 
      Raise Exception.Create(SÉNecessárioEscolherUmaImpressora);
      
    if (FLastDev<>edImp.SelectedPrinter) then
      Raise Exception.Create(SÉNecessárioConfigurarAsPreferênc);
  end;
    
  FDados.Nome := edDescr.Text;
  FDados.ImgId := edImg.ItemIndex;
  FDados.Valor := edValor.Value;
  if FNexPrinter then begin
    if Dados.CM.MesmoCompServ then 
      FDados.Impressora := edImp.SelectedPrinter;
  end else
      FDados.Impressora := edImp.SelectedPrinter;
  
  FRes := True;
  Close;
end;

procedure TFrmTipoImp.edImpPropertiesCloseUp(Sender: TObject);
begin
  EnableDevMode;
  if edImp.Text <> FLastDev then begin
    FDados.DevModeStream.Size := 0;
    FLastDev := '';
  end;
end;

function TFrmTipoImp.Editar(aDados: TncTipoImp; aNexPrinter: Boolean): Boolean;
begin
  FNexPrinter := aNexPrinter;
  if not FNexPrinter then begin
    Height := 315;
    lbDevMode.Enabled := False;
    btnDevMode.Enabled := False;
  end; 
  
  FDados := aDados;
  FRes := False;
  edDescr.Text := FDados.Nome;
  edValor.Value := FDados.Valor;
  edImg.ItemIndex := FDados.ImgID;
  
  if (aDados.DevModeStream.Size=0) then 
    FLastDev := '' else
    FLastDev := FDados.Impressora;
    
  if Dados.CM.MesmoCompServ then begin
    edImp.SelectedPrinter := FDados.Impressora;
  end else begin
    edImp.Enabled := False;
    lbImp.Enabled := False;
    try
      edImp.SelectedPrinter := FDados.Impressora;
    except
    end;
    btnDevMode.Enabled := False;
    lbDevMode.Enabled := False;
  end;
  ShowModal;
  Result := FRes;
end;

procedure TFrmTipoImp.EnableDevMode;
begin
  lbDevMode.Enabled := FNexPrinter and Dados.CM.MesmoCompServ and (edImp.ItemIndex>=0);
  btnDevMode.Enabled := lbDevMode.Enabled;
end;

procedure TFrmTipoImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTipoImp.FormCreate(Sender: TObject);
begin
  FLastDev := '';
  FNexPrinter := False;
end;

procedure TFrmTipoImp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmTipoImp.FormShow(Sender: TObject);
begin
  cmGravar.Enabled := Permitido(daCFGPrecos);
end;

end.

