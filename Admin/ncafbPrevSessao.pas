unit ncafbPrevSessao;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, DB, nxdb,
  dxBar, dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, cxClasses, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxSpinEdit, cxTextEdit, cxTimeEdit,
  cxContainer, cxLabel, LMDPNGImage, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxLookAndFeels,
  cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, cxNavigator, dxPScxPivotGridLnk, uParentedPanel;

type
  TfbPrevSessao = class(TFrmBase)
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    TVNumero: TcxGridDBColumn;
    TVSessaoObj: TcxGridDBColumn;
    TVPrev: TcxGridDBColumn;
    TVRestam: TcxGridDBColumn;
    TVInicio: TcxGridDBColumn;
    TVStatus: TcxGridDBColumn;
    Timer1: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    lbInfo: TcxLabel;
    procedure TVPrevCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVPrevGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVRestamGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    class function Modulo: Integer; override;
  
    { Public declarations }
  end;

var
  fbPrevSessao: TfbPrevSessao;

implementation

uses ncaDM, ncSessao;

// START resource string wizard section
resourcestring
  SPrevisãoDeTérmino = 'Previsão de Término';
  SFimDeTempo = 'Fim de Tempo';
  STerminou = 'Terminou';

// END resource string wizard section


{$R *.dfm}

{ TfbPrevSessao }


class function TfbPrevSessao.Descricao: String;
begin
  Result := SPrevisãoDeTérmino;
end;

class function TfbPrevSessao.Modulo: Integer;
begin
  Result := -1;
end;

procedure TfbPrevSessao.Timer1Timer(Sender: TObject);
begin
  inherited;
  Grid.Invalidate(True);
  Grid.Refresh;
end;

procedure TfbPrevSessao.TVPrevCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant; I: Integer; S: TncSessao;
begin
  inherited;
  V := AviewInfo.GridRecord.Values[TVSessaoObj.Index];
  if V<>null then begin
    I := V;
    S := TncSessao(I);
    if S.MotivoPausa=mpPausaFimTempo then begin
      AViewInfo.Text := SFimDeTempo;
      ACanvas.Brush.Color := clYellow;
      ACanvas.Font.Color := clBlack;
    end else begin
      V := AViewInfo.GridRecord.Values[TVStatus.Index];
      if V<>null then begin
        I := V;
        case I of
          stprev_emuso   : begin
            ACanvas.Brush.Color := clRed;
            ACanvas.Font.Color := clWhite;
          end;
          stprev_semprev : begin
            Acanvas.Brush.Color := clSilver;
            ACanvas.Font.Color := clBlack;
          end;
        end;
      end;
      
    end;
  end else begin
    ACanvas.Brush.Color :=  clGreen;
    ACanvas.Font.Color := clWhite;
  end;
end;

procedure TfbPrevSessao.TVPrevGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant; I: Integer; S: TncSessao;
begin
  inherited;
  V := ARecord.Values[TVSessaoObj.Index];
  if V<>null then begin
    I := V;
    S := TncSessao(I);
    if S.MotivoPausa=mpPausaFimTempo then
      AText := STerminou;
  end;
end;

procedure TfbPrevSessao.TVRestamGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant; I: Integer; S: TncSessao;
begin
  inherited;
  V := ARecord.Values[TVSessaoObj.Index];
  if V<>null then begin
    I := V;
    S := TncSessao(I);
    if S.TempoMaximo.Ticks>0 then 
      AText := S.Tarifador.CronometroStr;
  end;
end;

end.

