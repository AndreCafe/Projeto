unit uNRfbTarefas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxBar,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems, ExtCtrls,
  cxGraphics, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxCalendar, cxMemo, cxImageComboBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, nxdb, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxTextEdit, cxSpinEdit, cxMaskEdit, cxDropDownEdit,
  cxContainer, cxCheckBox, Buttons, PngSpeedButton, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxDBLookupComboBox,
  StdCtrls, cxRadioGroup, cxLabel, Menus;

type
  TfbTarefas = class(TFrmBase)
    panFiltro: TLMDSimplePanel;
    btnFiltro: TPngSpeedButton;
    panFil: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    dsTab: TDataSource;
    TVID: TcxGridDBColumn;
    TVDataHora: TcxGridDBColumn;
    TVPor: TcxGridDBColumn;
    TVPara: TcxGridDBColumn;
    TVLoja: TcxGridDBColumn;
    TVTexto: TcxGridDBColumn;
    TVPendente: TcxGridDBColumn;
    TVResolvidoEm: TcxGridDBColumn;
    dxBarCombo1: TdxBarCombo;
    teste: TcxCheckBox;
    cbMinhasTarefas: TcxCheckBox;
    cxLabel1: TcxLabel;
    rgPendente: TcxRadioButton;
    rgResolvida: TcxRadioButton;
    rgQualquer: TcxRadioButton;
    TVRealizarEm: TcxGridDBColumn;
    Tab: TnxTable;
    TabID: TAutoIncField;
    TabDataHora: TDateTimeField;
    TabPor: TStringField;
    TabPara: TStringField;
    TabLoja: TIntegerField;
    TabTexto: TMemoField;
    TabPendente: TBooleanField;
    TabResolvidoEm: TDateTimeField;
    TabRealizarEm: TDateTimeField;
    TabNomeLoja: TStringField;
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure cbMinhasTarefasClick(Sender: TObject);
    procedure TVPendenteCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure _Query;
  public
    procedure FiltraDados; override;

    class function Descricao: String; override;
    
  end;

var
  fbTarefas: TfbTarefas;

implementation

uses uNexRegPri, uNexRegDM, uFrmTar;

{$R *.dfm}

{ TfbTarefas }

procedure TfbTarefas.btnFiltroClick(Sender: TObject);
begin
  inherited;
  _Query;
end;

procedure TfbTarefas.cbMinhasTarefasClick(Sender: TObject);
begin
  inherited;
  _Query;
end;

procedure TfbTarefas.cmApagarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente apagar essa tarefa ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
  if MessageDlg('Confirma realmente que deseja apagar essa tarefa ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
    Tab.Delete;
end;

procedure TfbTarefas.cmEditarClick(Sender: TObject);
begin
  inherited;
  Tab.Edit;
  TFrmTar.Create(Self).Editar(Tab);
end;

procedure TfbTarefas.cmNovoClick(Sender: TObject);
begin
  inherited;
  Tab.Insert;
  TabDataHora.Value := Now;
  TabPendente.Value := True;
  TabPor.Value := UsuarioLogin;
  TabPara.Value := UsuarioLogin;
  TFrmTar.Create(Self).Editar(Tab);
end;

class function TfbTarefas.Descricao: String;
begin
  Result := 'Tarefas';
end;

procedure TfbTarefas.FiltraDados;
begin
  inherited;
  _Query;
end;

procedure TfbTarefas.TVPendenteCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  with AViewInfo do 
  if (Value<>null) then begin
    ACanvas.Font.Color := clWhite;
    if (Value=True) then 
      ACanvas.Brush.Color := clRed else
      ACanvas.Brush.Color := clGreen;
  end;
end;

procedure TfbTarefas._Query;
var S: String;
begin
  FrmPri.DisableDatasets;
  try
    S := '';
    if not Tab.Active then Tab.Open;
    if not btnFiltro.Down then begin
      Tab.IndexName := 'IDataHora';
      Tab.CancelRange;
    end else
    if cbMinhasTarefas.Checked then begin
      Tab.IndexName := 'IPara';
      if rgQualquer.Checked then
        Tab.SetRange([UsuarioLogin], [UsuarioLogin]) else
        Tab.SetRange([UsuarioLogin, rgPendente.Checked], [UsuarioLogin, rgPendente.Checked]); 
    end else begin
      if rgQualquer.Checked then begin
        Tab.IndexName := 'IDataHora';
        Tab.CancelRange;
      end else begin
        Tab.IndexName := 'IPendente';
        Tab.SetRange([rgPendente.Checked], [rgPendente.Checked]);
      end;
    end;
  finally
    FrmPri.EnableDatasets;
  end;
end;

end.
