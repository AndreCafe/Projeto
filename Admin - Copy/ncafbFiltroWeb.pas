unit ncafbFiltroWeb;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxBar,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, nxdb,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer,
  cxLabel, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDBaseGraphicControl,
  LMDPNGImage, ComCtrls, cxTextEdit, cxMaskEdit, Buttons, 
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  cxLookAndFeels, cxLookAndFeelPainters, uParentedPanel, dxPScxPivotGridLnk,
  cxNavigator;

type
  TfbFiltroWeb = class(TFrmBase)
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    Tab: TnxTable;
    DS: TDataSource;
    TabID: TAutoIncField;
    TabURL: TStringField;
    TabLiberar: TBooleanField;
    TVURL: TcxGridDBColumn;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    dxBarStatic1: TdxBarStatic;
    cmStatus: TdxBarStatic;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    btnAtivar: TdxBarButton;
    cmImportar: TdxBarLargeButton;
    dlgImp: TOpenDialog;
    PB: TProgressBar;
    panMostrar: TPanel;
    panBusca: TLMDSimplePanel;
    lbBusca: TcxLabel;
    edBusca: TcxMaskEdit;
    procedure cmApagarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure btnAtivarClick(Sender: TObject);
    procedure cmImportarClick(Sender: TObject);
    procedure btnAcharClick(Sender: TObject);
    procedure edBuscaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edBuscaPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;

    procedure AjustaLayoutLargeButton(B : TdxBarLargeButton); override;
    
  
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbFiltroWeb: TfbFiltroWeb;

implementation

uses ncaFrmPri, ufmImagens, ncaDM, ncaFrmSite, ncIDRecursos;

// START resource string wizard section
resourcestring
  SAtivo = 'Ativo.';
  SCliqueAquiParaDesativar = 'Clique aqui para Desativar';
  SInativo = 'Inativo.';
  SCliqueAquiParaAtivar = 'Clique aqui para Ativar';
  SDesejaRealmenteDesbloquearOSite = 'Deseja realmente desbloquear o site ';
  SFimDeImportação = 'Fim de importação. ';
  SSitesImportados = ' sites importados';
  SBloqueioDeSites = 'Bloqueio de Sites';

// END resource string wizard section


{$R *.dfm}

procedure TfbFiltroWeb.AjustaLayoutLargeButton(B: TdxBarLargeButton);
begin
//
end;

procedure TfbFiltroWeb.AtualizaDireitos;
begin
  inherited;
  if Dados.CM.Config.FiltrarWeb then begin
    cmStatus.Caption := SAtivo;
    cxStyle1.TextColor := clGreen;
    btnAtivar.Caption := SCliqueAquiParaDesativar;
  end else begin
    cmStatus.Caption := SInativo;
    cxStyle1.TextColor := clRed;
    btnAtivar.Caption := SCliqueAquiParaAtivar;
  end;
  cmImportar.Enabled := Dados.CM.UA.Admin;
  btnAtivar.Enabled := Dados.CM.UA.Admin;
  cmNovo.Enabled := Permitido(daFWAlterar);
  cmApagar.Enabled := cmNovo.Enabled;
  FiltraDados;
end;

procedure TfbFiltroWeb.btnAcharClick(Sender: TObject);
begin
  inherited;
  //btnAchar.Down := False;
  //btnAchar.Enabled := False;
  edBusca.Text := '';
end;

procedure TfbFiltroWeb.btnAtivarClick(Sender: TObject);
begin
  inherited;
  with Dados, CM do begin
    Config.AtualizaCache;
    Config.FiltrarWeb := not Config.FiltrarWeb;
    tbConfig.Edit;
    tbConfigFiltrarWeb.Value := Config.FiltrarWeb;
    tbConfig.Post;
    SalvaAlteracoesObj(Config, False);
    AtualizaDireitos;
  end;
end;

procedure TfbFiltroWeb.cmApagarClick(Sender: TObject);
begin
  inherited;
  if not Tab.IsEmpty then 
  if SimNao(SDesejaRealmenteDesbloquearOSite + TabURL.Value + ' ?') then
    Tab.Delete;
end;

procedure TfbFiltroWeb.cmImportarClick(Sender: TObject);
var SL : TStrings; I, C: Integer; S: String;
begin
  inherited;
  if not dlgImp.Execute(FrmPri.Handle) then Exit;
  SL := TStringList.Create;
  PB.Visible := True;
  Tab.DisableControls;
  DS.DataSet := nil;  C:= 0;
  try
    SL.LoadFromFile(dlgImp.FileName);
    PB.Max := SL.Count;
    PB.Position := 0;
    for I := 0 to SL.Count-1 do begin
      S := SL[i];
      if SameText(Copy(S, 1, 4), 'www.') then Delete(S, 1, 4); // do not localize
        if (not Tab.FindKey([S])) and (not Tab.FindKey(['www.'+S])) then // do not localize
      begin
        Inc(C);
        Tab.Insert;
        TabURL.Value := '#imp#'+S; // do not localize
        Tab.Post;
      end;
      PB.Position := PB.Position + 1;
      if (PB.Position mod 100)=0 then 
        Application.ProcessMessages;
        
      if Application.Terminated then Break;
    end;
    ShowMessage(SFimDeImportação+IntToStr(C)+SSitesImportados);
  finally
    DS.DataSet := Tab;
    Tab.EnableControls;
    PB.Visible := False;
    SL.Free;
  end;
end;

procedure TfbFiltroWeb.cmNovoClick(Sender: TObject);
var S: String;
begin
  inherited;
  S := TFrmSite.Create(nil).ObtemURL('');
  if S > '' then begin
    Tab.Insert;
    TabURL.Value := S;
    Tab.Post;
  end;
end;

class function TfbFiltroWeb.Descricao: String;
begin
  Result := SBloqueioDeSites;
end;

procedure TfbFiltroWeb.edBuscaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_UP : Tab.Prior;
    VK_Down : Tab.Next;
    VK_Escape : btnAcharClick(nil);
  end;
end;

procedure TfbFiltroWeb.edBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  if not Tab.Active then Exit;
  
  //btnAchar.Enabled := (Trim(edBusca.Text)>'');
  //btnAchar.Down := btnAchar.Enabled;
  
  if Trim(edBusca.Text)='' then 
    Tab.CancelRange else
    Tab.SetRange([edBusca.Text], [edBusca.Text+'zzzzzzzzzzzzzzzzzzzzz']); // do not localize
end;

procedure TfbFiltroWeb.FiltraDados;
begin
  if not Tab.Active then
    Tab.Open else
    Tab.Refresh;
end;

end.

