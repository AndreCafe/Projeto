unit ncafbDiaHora;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, cxGraphics, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxColorComboBox, cxControls, cxContainer, cxEdit, cxLabel,
  LMDPNGImage, ExtCtrls, dxBar, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, dxPSCore, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxClasses, cxPC, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxPCdxBarPopupMenu,
  cxLookAndFeels, cxLookAndFeelPainters, uParentedPanel, dxPScxPivotGridLnk;

type
  TfbTarDiaHora = class(TFrmBase)
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure cmSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FLoaded : Boolean;
    procedure OnAlterou(Sender: TObject);
  public
    procedure CriaTipoAcesso(aID: Word; aNome: String);
    procedure AtualizaDireitos; override;
    procedure FiltraDados; override;
    procedure Load;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbTarDiaHora: TfbTarDiaHora;

implementation

uses ncaFrmPri, ncClassesBase, ncaFrmHorario, ncIDRecursos, ncaDM, ufmImagens;

// START resource string wizard section
resourcestring
  STarifaPorDiaEHorário = 'Tarifa por Dia e Horário';

// END resource string wizard section


{$R *.dfm}

{ TFrmBase1 }

procedure TfbTarDiaHora.AtualizaDireitos;
var I: Integer;

function FormExiste(aTA: Integer): Boolean;
var p: Integer;
begin
  for p := 0 to Paginas.PageCount - 1 do
    with TFrmHorario(Paginas.Pages[p].Tag) do
    if TA=aTA then begin
      Paginas.Pages[p].Caption := gTiposAcesso.PorCodigo[aTA].Nome;
      RefreshTarifas;
      Result := True;
      Exit;
    end;
  Result := False;  
end;

begin
  if FLoaded then begin
    for I := Paginas.PageCount - 1 downto 0 do
      if not gTiposAcesso.Existe(TFrmHorario(Paginas.Pages[I].Tag).TA) then
        Paginas.Pages[I].Free;
    for I := 0 to gTiposAcesso.Count-1 do 
      if not FormExiste(gTiposAcesso[I].ID) then 
        CriaTipoAcesso(gTiposAcesso[I].ID, gTiposAcesso[I].Nome);
  end else
    Load;

  Paginas.HideTabs := (Paginas.PageCount<2);  
end;

procedure TfbTarDiaHora.cmCancelarClick(Sender: TObject);
var I : Integer;
begin
  inherited;
  cmCancelar.Enabled := False;
  cmSalvar.Enabled := False;
  for I := 0 to Paginas.PageCount - 1 do
    TFrmHorario(Paginas.Pages[I].Tag).Load;
end;

procedure TfbTarDiaHora.cmSalvarClick(Sender: TObject);
var I : Integer;
begin
  inherited;
  for I := 0 to Paginas.PageCount - 1 do
    TFrmHorario(Paginas.Pages[I].Tag).Save;
  cmCancelar.Enabled := False;
  cmSalvar.Enabled := False;

end;

procedure TfbTarDiaHora.CriaTipoAcesso(aID: Word; aNome: String);
var 
  T : TcxTabSheet;
  F : TFrmHorario;
begin
  T := TcxTabSheet.Create(Self);
  T.PageControl := Paginas;
  T.Caption := aNome;
  F := TFrmHorario.Create(T);
  F.Init(aID, OnAlterou, T);
  T.Tag := Integer(F);
end;

class function TfbTarDiaHora.Descricao: String;
begin
  Result := STarifaPorDiaEHorário;
end;

procedure TfbTarDiaHora.FiltraDados;
begin
  inherited;
  if not FLoaded then
    Load;
end;

procedure TfbTarDiaHora.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  FLoaded := False;
end;

procedure TfbTarDiaHora.Load;
var I : Integer;
begin
  FLoaded := True;
  cmSalvar.Enabled := False;
  cmCancelar.Enabled := False;
  while Paginas.PageCount>0 do
    Paginas.Pages[0].Free;

  for I := 0 to gTiposAcesso.Count - 1 do 
    CriaTipoAcesso(gTiposAcesso[I].ID, gTiposAcesso[I].Nome);

  Paginas.HideTabs := (Paginas.PageCount<2);

  Paginas.ActivePageIndex := 0;
end;

procedure TfbTarDiaHora.OnAlterou(Sender: TObject);
begin
  cmSalvar.Enabled := Permitido(daCFGPrecos);
  cmCancelar.Enabled := True;
end;

end.

