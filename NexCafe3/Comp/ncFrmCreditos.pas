unit ncFrmCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxControls, cxGridCustomView,
  Buttons, PngSpeedButton, ExtCtrls, cxClasses, cxGridLevel, cxGrid,
  kbmMemTable, cxGridDBTableView, ncSessao, ncClassesBase, cxTextEdit, cxMemo,
  cxContainer, cxLabel, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, LMDControl;

type
  TFrmCreditos = class(TForm)
    MT: TkbmMemTable;
    DS: TDataSource;
    MTTipo: TStringField;
    MTValido: TStringField;
    MTInvalido: TStringField;
    MTTotal: TStringField;
    MTRestricoes: TMemoField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    LMDSimplePanel5: TLMDSimplePanel;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    TV: TcxGridDBBandedTableView;
    TVTipo: TcxGridDBBandedColumn;
    TVValido: TcxGridDBBandedColumn;
    TVInvalido: TcxGridDBBandedColumn;
    TVTotal: TcxGridDBBandedColumn;
    VColumn1: TcxGridDBBandedColumn;
    VColumn2: TcxGridDBBandedColumn;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    cxLabel5: TcxLabel;
    lbValido: TcxLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    lbInvalido: TcxLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    lbTotal: TcxLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    btnFechar: TcxButton;
    cxStyle7: TcxStyle;
    btnPass: TcxButton;
    MTIDPass: TIntegerField;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VColumn1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure VColumn2GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVTipoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVValidoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVInvalidoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnPassClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure TVDblClick(Sender: TObject);
  private
    { Private declarations }
    FOnEditPass : TNotifyEvent;
    FIDSessao : Integer;
  public
    procedure Mostra(S: TncSessao; aOnEditPass: TNotifyEvent = nil);
    property IDSessao : Integer
      read FIDSessao;
    { Public declarations }
  end;

var
  FrmCreditos: TFrmCreditos;

implementation

uses ncPassaportes;

{$R *.dfm}

{ TFrmCreditos }

procedure TFrmCreditos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCreditos.btnPassClick(Sender: TObject);
begin
  FOnEditPass(Self);
end;

procedure TFrmCreditos.DSDataChange(Sender: TObject; Field: TField);
begin
  btnPass.Enabled := (MTIDPass.Value>0);
end;

procedure TFrmCreditos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCreditos.Mostra(S: TncSessao; aOnEditPass: TNotifyEvent = nil);
var 
  I : Integer;
  TValido, TInvalido,
  Valido, Total : Double;
begin
  FIDSessao := S.ID;
  FOnEditPass := aOnEditPass;
  btnPass.Visible := Assigned(FOnEditPass);
  if (S.Tarifador.CreditoTotal.Ticks=0) and (S.Tarifador.TicksResPass<1000) then begin
    Free;
    Exit;
  end;
  S.Tarifador.CalculaCreditoTotal(False);
  TValido := 0;
  TInvalido := 0;
  try
    if S.Tarifador.CredValorETempo.Ticks>0 then begin
      MT.Append;
      MTValido.Value := MinutosToHMSStr(S.Tarifador.CredValorETempo.Minutos);
      MTTotal.Value := MTValido.Value;
      MTTipo.Value := 'Crédito de Tempo';
      MTRestricoes.Value := 'Nenhuma';
      TValido := S.Tarifador.CredValorETempo.Minutos;
      MT.Post;
    end;
    

    for I := 0 to S.Passaportes.Count-1 do with S.Passaportes.Itens[I] do begin
      pctExpirou := pcExpirou;
      if ExpirarEm(S.Inicio) > S.Inicio then begin
        MT.Append;
        MTIDPass.Value := pcID;
        if pcNome='' then
          MTTipo.Value := 'Passaporte' else
          MTTipo.Value := pcNome;
        Valido := pctUsadoMS/1000/60;
        MTValido.Value := MinutosToHMSStr(Valido);
        if pcMaxSegundos>pcSegundos then begin
          Total := (pcMaxSegundos-pcSegundos) / 60;
          MTTotal.Value := MinutosToHMSStr(Total);
          MTInvalido.Value := MinutosTOHMSStr(Total-Valido);
        end;
        TValido := TValido + Valido;
        TInvalido := TInvalido + (Total-Valido);
        MT.Post;
      end;
    end;

    lbValido.Caption := MinutosToHMSStr(TValido);
    lbInvalido.Caption := MinutosToHMSStr(TInvalido);
    lbTotal.Caption := MinutosToHMSStr((TInvalido+TValido));

    MT.First;  
  finally
    S.Tarifador.ZeraVars;
  end;

  ShowModal;
end;

procedure TFrmCreditos.TVDblClick(Sender: TObject);
begin
  if btnPass.Visible and btnPass.Enabled then
    btnPassClick(nil);
end;

procedure TFrmCreditos.TVInvalidoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ACanvas.Canvas.Font.Color := clGreen;
end;

procedure TFrmCreditos.TVTipoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ACanvas.Canvas.Font.Color := clBlack;
end;

procedure TFrmCreditos.TVValidoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ACanvas.Canvas.Font.Color := clRed;
end;

procedure TFrmCreditos.VColumn1GetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  AText := '    Tempo válido para uso nessa sessão';
end;

procedure TFrmCreditos.VColumn2GetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  AText := '    Tempo com restrições que impedem uso nessa sessão';
end;

end.
