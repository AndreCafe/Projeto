unit ncafbTarifas2;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxNavBarCollns,
  dxNavBarBase, cxControls, dxNavBar, dxBar, dxPSCore, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxClasses, ExtCtrls, cxGraphics, Menus, 
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxColorComboBox, cxContainer, cxEdit, cxLabel, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxPC,
  LMDPNGImage, ImgList, cxRadioGroup, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDBaseControl, LMDBaseGraphicControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, 
  ncafbTarBasica, 
  ncafbPass, 
  ncafbCartoes,
  ncafbDiaHora,
  ncafbTiposAcesso,
  ncafbTipoPass, cxCheckBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxGridCustomTableView, cxGridTableView, cxGridCustomView,
  cxGridLevel, cxGrid, cxGroupBox, ncafbPacotes, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLookAndFeels,
  cxPCdxBarPopupMenu, dxPScxPivotGridLnk, dxBarBuiltInMenu, uParentedPanel;

type
  TfbTarifas2 = class(TFrmBase)
    nbTar: TdxNavBar;
    nbgTarAcesso: TdxNavBarGroup;
    nbgCred: TdxNavBarGroup;
    nbgCredControl: TdxNavBarGroupControl;
    nbgTarAcessoControl: TdxNavBarGroupControl;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    nbgCartaoTempo: TdxNavBarGroup;
    nbgCartaoTempoControl: TdxNavBarGroupControl;
    LMDSimplePanel2: TLMDSimplePanel;
    Image2: TImage;
    LMDSimplePanel3: TLMDSimplePanel;
    Image3: TImage;
    cxImageList1: TcxImageList;
    LMDSimplePanel5: TLMDSimplePanel;
    BarMgrBar2: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    Paginas: TcxPageControl;
    tsTarifas: TcxTabSheet;
    gbOpcoes: TcxGroupBox;
    cbHorario: TcxCheckBox;
    cbGrupo: TcxCheckBox;
    cxLabel2: TcxLabel;
    tsGrupo: TcxTabSheet;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    tsHorario: TcxTabSheet;
    pgTar: TcxPageControl;
    tsSemTar: TcxTabSheet;
    tsTarOk: TcxTabSheet;
    cxLabel1: TcxLabel;
    btnCriarTarifa: TcxButton;
    cxLabel6: TcxLabel;
    nbgPacote: TdxNavBarGroup;
    nbgPacoteControl: TdxNavBarGroupControl;
    LMDSimplePanel6: TLMDSimplePanel;
    Image5: TImage;
    cxLabel7: TcxLabel;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure btnCriarTarifaClick(Sender: TObject);
    procedure nbgTarAcessoExpanded(Sender: TObject);
    procedure cbHorarioClick(Sender: TObject);
    procedure cbGrupoClick(Sender: TObject);
  private
    { Private declarations }
    fbTarBas : TfbTarBasica;
    fbCartoes : TfbCartoes;
    fbPass : TfbTiposPass;
    fbTA : TfbTiposAcesso;
    fbDH : TfbTarDiaHora;
    fbgPacotes : TfbPacotes;
    FLoading : Boolean;
  public
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbTarifas2: TfbTarifas2;

implementation

uses ncaFrmTarifa, ncClassesBase, ncaFrmPri, ncaDM, ncIDRecursos, ufmImagens;

// START resource string wizard section
resourcestring
  SConfirmaADesativaçãoDoGrupoDeTar = 'Confirma a Desativação do Grupo de Tarifas ?';
  SConfirmaADesativaçãoDeTarifasPor = 'Confirma a Desativação de Tarifas por Dia e Horário?';
  STarifas = 'Tarifas';

// END resource string wizard section


{$R *.dfm}

{ TfbTarifas2 }

procedure TfbTarifas2.AtualizaDireitos;
begin
  inherited;
  FLoading := True;
  try
    gbOpcoes.Enabled := Permitido(daCFGPrecos);
    if gTarifas.Count=0 then begin
      pgTar.ActivePageIndex := 0;
      gbOpcoes.Visible := False;
      Paginas.ActivePageIndex := 0;
    end else begin
      pgTar.ActivePageIndex := 1;
      gbOpcoes.Visible := True;
    end;
  
    cbGrupo.Checked := gConfig.VariosTiposAcesso;
    cbHorario.Checked := gConfig.TarifaPorHorario;
    tsGrupo.Enabled := cbGrupo.Checked;
    tsHorario.Enabled := cbHorario.Checked;
    if not Paginas.ActivePage.Enabled then
      Paginas.ActivePageIndex := 0;
    fbCartoes.AtualizaDireitos;
    fbTarBas.AtualizaDireitos;
    fbTA.AtualizaDireitos;
    fbDH.AtualizaDireitos;
    Self.fbPass.AtualizaDireitos;
    fbgPacotes.AtualizaDireitos;
  finally
    FLoading := False;
  end;
end;

procedure TfbTarifas2.btnCriarTarifaClick(Sender: TObject);
var T : TncTarifa;
begin
  inherited;
  T := TncTarifa.Create;
  try
    TFrmTarifa.Create(Self).Novo;
  finally
    T.Free;
  end;
end;

procedure TfbTarifas2.cbGrupoClick(Sender: TObject);
begin
  inherited;
  if FLoading then Exit;
  
  if cbGrupo.Checked then begin
    gConfig.AtualizaCache;
    gConfig.VariosTiposAcesso := True;
    Dados.CM.SalvaAlteracoesObj(gConfig, False);
    tsGrupo.Enabled := True;
    Paginas.ActivePageIndex := 2;
  end else begin
    if SimNao(SConfirmaADesativaçãoDoGrupoDeTar) then begin
      gConfig.AtualizaCache;
      gConfig.VariosTiposAcesso := False;
      Dados.CM.SalvaAlteracoesObj(gConfig, False);
      tsGrupo.Enabled := False;
      Paginas.ActivePageIndex := 0;
    end else begin
      FLoading := True;
      try
        cbGrupo.Checked := True;
      finally
        FLoading := False;
      end;
    end;
  end;
end;

procedure TfbTarifas2.cbHorarioClick(Sender: TObject);
begin
  inherited;
  if FLoading then Exit;
  
  if cbHorario.Checked then begin
    gConfig.AtualizaCache;
    gConfig.TarifaPorHorario := True;
    Dados.CM.SalvaAlteracoesObj(gConfig, False);
    tsHorario.Enabled := True;
    Paginas.ActivePageIndex := 1;
  end else begin
    if SimNao(SConfirmaADesativaçãoDeTarifasPor) then begin
      gConfig.AtualizaCache;
      gConfig.TarifaPorHorario := False;
      Dados.CM.SalvaAlteracoesObj(gConfig, False);
      tsHorario.Enabled := False;
      Paginas.ActivePageIndex := 0;
    end else begin
      FLoading := True;
      try
        cbHorario.Checked := True;
      finally
        FLoading := False;
      end;
    end;
  end;
end;

class function TfbTarifas2.Descricao: String;
begin
  Result := STarifas;
end;

procedure TfbTarifas2.FiltraDados;
begin
  inherited;
  fbTarBas.FiltraDados;
  fbCartoes.FiltraDados;
  fbTA.FiltraDados;
  fbDH.FiltraDados;
  Self.fbPass.FiltraDados;
  fbgPacotes.FiltraDados;
end;

procedure TfbTarifas2.FrmBasePaiCreate(Sender: TObject);
var I: integer;
begin
  inherited;
  Paginas.ActivePageIndex := 0;
  FLoading := False;
  
  with nbTar.Groups do
  for I := 0 to Count - 1 do
    Items[I].OptionsExpansion.Expanded := False;

  nbgTarAcesso.OptionsExpansion.Expanded := True;
    
  fbCartoes := TfbCartoes.Create(Self);
  fbCartoes.panPri.Parent := nbgCartaoTempoControl;

  fbTarBas := TfbTarBasica.Create(Self);
  fbTarBas.panPri.Parent := tsTarOk;

  fbTA := TfbTiposAcesso.Create(Self);
  fbTA.panPri.Parent := tsGrupo;

  Self.fbPass := TfbTiposPass.Create(Self);
  Self.fbPass.panPri.Parent := nbgCredControl;

  fbDH := TfbTarDiaHora.Create(Self);
  fbDH.panPri.Parent := tsHorario;

  fbgPacotes := TfbPacotes.Create(Self);
  fbgPacotes.panPri.Parent := nbgPacoteControl;
end;

procedure TfbTarifas2.nbgTarAcessoExpanded(Sender: TObject);
var I: integer;
begin
  inherited;
  with nbTar.Groups do
  for I := 0 to Count - 1 do
    Items[I].OptionsExpansion.Expanded := (Items[I]=Sender);
end;

end.

