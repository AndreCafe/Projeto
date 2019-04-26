unit ncaFrmTipoAcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, 
  ExtCtrls, dxBar, nxdb, cxStyles, cxGraphics, cxEdit,
  cxTextEdit, cxMaskEdit, cxCurrencyEdit, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, dxBarExtItems, cxDBEdit, cxContainer, cxLabel, cxClasses,
  cxDropDownEdit, cxColorComboBox, ncClassesBase,
  LMDPNGImage, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmTipoAcesso = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxLabel1: TcxLabel;
    edNome: TcxTextEdit;
    cxLabel2: TcxLabel;
    edCor: TcxColorComboBox;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    cxLabel3: TcxLabel;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTipoAcesso : TncTipoAcesso;
    procedure Editar(aTipoAcesso: TncTipoAcesso);
    procedure Novo;
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

procedure TFrmTipoAcesso.Editar(aTipoAcesso: TncTipoAcesso);
begin
  FNovo := False;
  FTipoAcesso := aTipoAcesso;
  edNome.Text := aTipoAcesso.Nome;
  edCor.ColorValue := aTipoAcesso.TarifaPadrao;
  ShowModal;
end;

procedure TFrmTipoAcesso.cmGravarClick(Sender: TObject);
begin
  if Trim(edNome.Text)='' then begin
    ShowMessage('É necessário informar o nome do grupo');
    Exit;
  end;

  if edCor.ColorValue=clWhite then begin
    ShowMessage('É necessário selecionar uma tarifa');
    Exit;
  end;

  FTipoAcesso.AtualizaCache;

  FTipoAcesso.Nome := edNome.Text;
  FTipoAcesso.TarifaPadrao := edCor.ColorValue;

//  Dados.tbTipoAcesso.Refresh;
  
  with Dados do
  if FNovo then begin
    if tbTipoAcesso.IsEmpty then
      FTipoAcesso.ID := 0
    else begin  
      tbTipoAcesso.IndexName := 'IID';
      tbTipoAcesso.Last;
      FTipoAcesso.ID := tbTipoAcessoID.Value + 1;
    end;
    CM.SalvaAlteracoesObj(FTipoAcesso, True);
  end else
    CM.SalvaAlteracoesObj(FTipoAcesso, False);
    
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

procedure TFrmTipoAcesso.FormCreate(Sender: TObject);
var I: Integer;
begin
  with edCor do 
  with Properties do begin
    CustomColors.Clear;
    for I := 0 to gTarifas.Count - 1 do
      with CustomColors.Add do begin
        Color := gTarifas[I].Cor;
        Description := gTarifas[I].Descricao;
      end;
  end;
end;

procedure TFrmTipoAcesso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmTipoAcesso.Novo;
begin
  FNovo := True;
  FTipoAcesso := TncTipoAcesso.Create;
  try
    ShowModal;
  finally
    FTipoAcesso.Free;
  end;
end;

procedure TFrmTipoAcesso.FormShow(Sender: TObject);
begin
  cmGravar.Enabled := Permitido(daCFGPrecos);
end;

end.
