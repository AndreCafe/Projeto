unit ncafbUsuarios;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit, cxCheckBox,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxContainer, cxLabel, LMDPNGImage,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, cxLookAndFeels, cxLookAndFeelPainters,
  cxNavigator, dxPScxPivotGridLnk, uNexTransResourceStrings_PT, cxImageComboBox,
  uParentedPanel;

type
  TfbUsuarios = class(TFrmBase)
    LMDSimplePanel1: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVImg: TcxGridDBColumn;
    TVUsername: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    TVAdmin: TcxGridDBColumn;
    GL: TcxGridLevel;
    procedure cmApagarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure TVImgGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVImgCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    procedure AtualizaDireitos; override;
    procedure FiltraDados; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbUsuarios: TfbUsuarios;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ncaFrmUsuario, 
  ncClassesBase, ufmImagens;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

{ TfbUsuarios }

class function TfbUsuarios.Descricao: String;
begin
  Result := SncafbUsuarios_Usuários;
end;

procedure TfbUsuarios.FiltraDados;
begin
end;

function VarDefault(V: Variant; aDefault: Variant): Variant;
begin
  if VarIsNull(V) then
    Result := aDefault else
    Result := V;
end;

procedure TfbUsuarios.TVImgCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if VarDefault(AViewInfo.GridRecord.Values[TVAdmin.Index], False) = True then
    ACanvas.Font.Style := [fsBold];
end;

procedure TfbUsuarios.TVImgGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := VarDefault(ARecord.Values[TVNome.Index], '') + ' (' + VarDefault(ARecord.Values[TVUsername.Index], '') + ')';
end;

procedure TfbUsuarios.AtualizaDireitos;
begin
  inherited;
  dxBarDockControl1.SunkenBorder := False;
end;

procedure TfbUsuarios.cmApagarClick(Sender: TObject);
var 
  U : TncUsuario;
  I, C: Integer;
begin
  with Dados do begin
    C := 0;
    for I := 0 to CM.Usuarios.Count-1 do
      if CM.Usuarios[I].Admin then Inc(C);

    if mtUsuarioAdmin.Value and (C<2) then
      Raise ENexCafe.Create(SncafbUsuarios_NãoéPossívelApagarOúnicoUsuárioA);
        
    if SimNaoH(SncafbUsuarios_ConfirmaAExclusãoDe+mtUsuarioNome.Value+'?', Handle) then begin
      U := CM.Usuarios.PorUsername[mtUsuarioUsername.Value];
      if U <> nil then CM.ApagaObj(U);
    end;  
  end;  
end;

procedure TfbUsuarios.cmNovoClick(Sender: TObject);
begin
  TFrmUsuario.Create(Self).Incluir;
end;

procedure TfbUsuarios.cmEditarClick(Sender: TObject);
begin
  if Dados.mtUsuario.RecordCount > 0 then
    TFrmUsuario.Create(Self).Editar;
end;

end.

