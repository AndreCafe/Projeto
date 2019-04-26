unit ncafbListaEspera;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxBar,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems, ExtCtrls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, nxdb,
  Buttons, cxTextEdit, cxTimeEdit, cxSpinEdit, LMDControl,
  cxLookAndFeelPainters, cxContainer, cxGroupBox, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLookAndFeels,
  cxNavigator, dxPScxPivotGridLnk, uParentedPanel;

type
  TfbListaEspera = class(TFrmBase)
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    Tab: TnxTable;
    TabPos: TIntegerField;
    TabCliente: TIntegerField;
    TabNomeCliente: TStringField;
    TabPrevisao: TDateTimeField;
    TabPrevMaq: TWordField;
    TabID: TAutoIncField;
    TabDataHora: TDateTimeField;
    TabPrevSessao: TIntegerField;
    TabCartao: TStringField;
    DS: TDataSource;
    TVPos: TcxGridDBColumn;
    TVNomeCliente: TcxGridDBColumn;
    TVPrevisao: TcxGridDBColumn;
    TVPrevMaq: TcxGridDBColumn;
    TVObs: TcxGridDBColumn;
    TVCartao: TcxGridDBColumn;
    TabTemCartao: TBooleanField;
    TabObs: TStringField;
    Timer1: TTimer;
    TabUsername: TStringField;
    TVCod: TcxGridDBColumn;
    TVUsername: TcxGridDBColumn;
    cmEdit: TdxBarLargeButton;
    cmRemover: TdxBarLargeButton;
    cmUp: TdxBarLargeButton;
    cmDown: TdxBarLargeButton;
    procedure TabCalcFields(DataSet: TDataSet);
    procedure btnAddClick(Sender: TObject);
    procedure btnUPClick(Sender: TObject);
    procedure btnApagaClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    procedure RefreshLE(aSoMaq: Boolean = False);
  
    class function Descricao: String; override;
    class function Modulo: Integer; override;

    { Public declarations }
  end;

var
  fbListaEspera: TfbListaEspera;

implementation

uses ncaDM, ufmImagens, ncaFrmPri, ncaFrmEspera, ncListaEspera, ncDMServ,
  ncClassesBase, ncafbMaquinas, ncSessao;

// START resource string wizard section
resourcestring
  SDesejaRealmenteEliminarAReservaD = 'Deseja realmente eliminar a reserva de ';
  SListaDeEspera = 'Lista de Espera';

// END resource string wizard section


{$R *.dfm}

procedure TfbListaEspera.AtualizaDireitos;
begin
  inherited;

end;

procedure TfbListaEspera.btnAddClick(Sender: TObject);
var LE : TncItemListaEspera;
begin
  inherited;
  LE := TncItemListaEspera.Create;
  try
    if TFrmEspera.Create(nil).Editar(True, LE) then
    begin
      Tab.Insert;
      LE.ilDataHora := Now;
      LE.SaveToDataset(Tab, Tab.RecordCount+1);
      Tab.Post;
      RefreshLE;
    end;
  finally
    LE.Free;
  end;
end;

procedure TfbListaEspera.btnApagaClick(Sender: TObject);
begin
  inherited;
  if Tab.IsEmpty then Exit;
  
  if SimNao(SDesejaRealmenteEliminarAReservaD + TabNomeCliente.Value + '? ') then
  begin
    Tab.Delete;
    RefreshLE;
  end;
end;

procedure TfbListaEspera.btnDownClick(Sender: TObject);
var A, B: TncItemListaEspera;
begin
  inherited;
  if TabPos.Value>=Tab.RecordCount then Exit;
  A := TncItemListaEspera.Create;
  B := TncItemListaEspera.Create;
  Tab.DisableControls;
  try
    A.LoadFromDataset(Tab);
    Tab.Next;
    B.LoadFromDataset(Tab);
    Tab.Edit;
    TabCliente.Value := A.ilCliente;
    TabNomeCliente.Value := A.ilNomeCliente;
    Tab.Post;

    Tab.Prior;
    
    Tab.Edit;
    TabCliente.Value := B.ilCliente;
    TabNomeCliente.Value := B.ilNomeCliente;
    Tab.Post;

    Tab.Next;
  finally
    A.Free;
    B.Free;
    Tab.EnableControls;
  end;
  RefreshLE(True);
end;

procedure TfbListaEspera.btnEditClick(Sender: TObject);
var Esp: TncItemListaEspera;
begin
  inherited;
  if Tab.IsEmpty then Exit;
  Esp := TncItemListaEspera.Create;
  try
    Esp.LoadFromDataset(Tab);
    if TFrmEspera.Create(nil).Editar(False, Esp) then begin
      Tab.Edit;
      TabCliente.Value := Esp.ilCliente;
      TabNomeCliente.Value := Esp.ilNomeCliente;
      TabCartao.Value := Esp.ilCartao;
      TabObs.Value := Esp.ilObs;
      Tab.Post;
    end;

  finally
    Esp.Free;
  end;
end;

procedure TfbListaEspera.btnUPClick(Sender: TObject);
var A, B: TncItemListaEspera;
begin
  inherited;
  if TabPos.Value<2 then Exit;
  A := TncItemListaEspera.Create;
  B := TncItemListaEspera.Create;
  Tab.DisableControls;
  try
    A.LoadFromDataset(Tab);
    Tab.Prior;
    B.LoadFromDataset(Tab);
    Tab.Edit;
    TabCliente.Value := A.ilCliente;
    TabNomeCliente.Value := A.ilNomeCliente;
    TabObs.Value := A.ilObs;
    TabCartao.Value := a.ilCartao;
    Tab.Post;

    Tab.Next;
    
    Tab.Edit;
    TabCliente.Value := B.ilCliente;
    TabNomeCliente.Value := B.ilNomeCliente;
    TabObs.Value := B.ilObs;
    TabCartao.Value := B.ilCartao;
    Tab.Post;

    Tab.Prior;
  finally
    A.Free;
    B.Free;
    Tab.EnableControls;
  end;
  RefreshLE(True);
end;

class function TfbListaEspera.Descricao: String;
begin
  Result := SListaDeEspera;
end;

class function TfbListaEspera.Modulo: Integer;
begin
  Result := -1;
end;

procedure TfbListaEspera.FiltraDados;
begin
  inherited;
  if not Tab.Active then
    Tab.Open else
    Tab.Refresh;
end;

procedure TfbListaEspera.RefreshLE(aSoMaq: Boolean = False);
var FI: PfmFormInfo;
begin
  if not aSoMaq then begin
    Dados.CM.RefreshEspera;
    Tab.Refresh;
  end;
  DM.tEsp.Refresh;
  FI  := FrmPri.FM.FormByClass(TfbMaquinas);
  if (FI<>nil) and (FI^.fiInstance<>nil) then 
    TfbMaquinas(FI^.fiInstance).Timer2.Enabled := True;
end;

procedure TfbListaEspera.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabTemCartao.Value := (TabCartao.Value>'');
end;

end.

