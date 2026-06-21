unit uCMFrmCorPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxInspRw, dxDBInRw,
  dxInspct, dxCntner, dxDBInsp, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, dxBar, dxBarDBNav, dxBarExtItems,
  Db, kbmMemTable;

type
  TFrmCorPreco = class(TForm)
    BarMgr: TdxBarManager;
    cmNovoPreco: TdxBarButton;
    cmApagar: TdxBarButton;
    cmCancelar: TdxBarLargeButton;
    cmGravar: TdxBarLargeButton;
    dxBarDBNavDelete1: TdxBarDBNavButton;
    dxBarDBNavInsert1: TdxBarDBNavButton;
    dxBarDBNavCancel1: TdxBarDBNavButton;
    dxBarDBNavPost1: TdxBarDBNavButton;
    dxBarDockControl1: TdxBarDockControl;
    LMDSimplePanel1: TLMDSimplePanel;
    Insp: TdxDBInspector;
    InspDescricao: TdxInspectorDBMaskRow;
    LMDSimplePanel2: TLMDSimplePanel;
    Grid: TdxDBGrid;
    GridValor: TdxDBGridCurrencyColumn;
    GridTempo: TdxDBGridTimeColumn;
    GridTolerancia: TdxDBGridTimeColumn;
    GridValorMin: TdxDBGridCurrencyColumn;
    dxBarDockControl2: TdxBarDockControl;
    InspReinicia: TdxInspectorDBImageRow;
    ColD: TColorDialog;
    InspCor: TdxInspectorDBButtonRow;
    InspCorFonte: TdxInspectorDBButtonRow;
    tCor: TkbmMemTable;
    tCorTipoAcesso: TWordField;
    tCorCor: TIntegerField;
    tCorCorFonte: TIntegerField;
    tCorDescricao: TStringField;
    tCorReinicia: TBooleanField;
    dsCor: TDataSource;
    tCorPrecos: TkbmMemTable;
    dsCorPrecos: TDataSource;
    tCorPrecosTipoAcesso: TWordField;
    tCorPrecosCor: TIntegerField;
    tCorPrecosCorFonte: TIntegerField;
    tCorPrecosValor: TCurrencyField;
    tCorPrecosTempo: TDateTimeField;
    tCorPrecosValorMin: TCurrencyField;
    tCorPrecosTolerancia: TDateTimeField;
    tCorPrecosPos2: TAutoIncField;
    procedure cmGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmCancelarClick(Sender: TObject);
    procedure InspCorButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure InspCorFonteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure tCorAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cmNovoPrecoClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure InspCorDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas;
      ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure InspCorDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas;
      ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
  private
    FIncluir : Boolean;
    { Private declarations }
    procedure LePrecos;
    procedure SalvaPrecos;
  public
    { Public declarations }
    procedure Novo;
    procedure Editar;
  end;

var
  FrmCorPreco: TFrmCorPreco;

implementation

uses uCMFrmHoraCor, uCMDados;

{$R *.DFM}

procedure TFrmCorPreco.cmGravarClick(Sender: TObject);
begin
  if tCorPrecos.State in [dsEdit, dsInsert] then
    tCorPrecos.Post;
  
  if tCorPrecos.RecordCount=0 then begin
    Beep;
    ShowMessage('Não foi definido nenhum preço!');
    Exit;
  end;  
  if Trim(tCorDescricao.Value)='' then begin
    Beep;
    ShowMessage('Não foi digitado a descrição!');
    Exit;
  end;  
  if tCorCor.Value = clSilver then begin
    Beep;
    ShowMessage('Você não selecionou a cor');
    Exit;
  end;  
  if tCorCorFonte.Value = tCorCor.Value then begin
    Beep;
    ShowMessage('Cor da fonte não deve ser igual a cor de fundo');
    Exit;
  end;

  tCorPrecos.First;
  while not tCorPrecos.Eof do begin
    if (tCorPrecosValor.Value>0) and (tCorPrecosValorMin.Value < 0.0001) then 
      Raise Exception.Create('Valor da fração mínima não pode ser zero !');

    if (tCorPrecosValor.Value<tCorPrecosValorMin.Value) then 
      Raise Exception.Create('Valor da fração mínima não pode ser maior que o preço !');
        
    if FormatDateTime('hh:mm:ss', tCorPrecosTempo.Value) < '00:00:01' then
      Raise Exception.Create('Tempo não pode ser zero!');
    
    tCorPrecos.Next;
  end;

  if tCor.State in [dsEdit, dsInsert] then tCor.Post;

  if FIncluir then 
    FrmHoraCor.mtCor.Insert
  else
    FrmHoraCor.mtCor.Edit;
    
  TransfDados(tCor, FrmHoraCor.mtCor); 
  try 
    FrmHoraCor.mtCor.Post;
  except
    Raise Exception.Create('Cor Repetida!');
  end;  
  SalvaPrecos;
  Close;
end;

procedure TFrmCorPreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCorPreco.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCorPreco.InspCorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if not (tCor.State in [dsInsert, dsEdit]) then tCor.Edit;
  ColD.Color := tCorCor.Value;
  if ColD.Execute then 
    tCorCor.Value := ColD.Color;
end;

procedure TFrmCorPreco.InspCorFonteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  if not (tCor.State in [dsInsert, dsEdit]) then tCor.Edit;
  ColD.Color := tCorCorFonte.Value;
  if ColD.Execute then 
    tCorCorFonte.Value := ColD.Color;
end;

procedure TFrmCorPreco.tCorAfterInsert(DataSet: TDataSet);
begin
  tCorTipoAcesso.Value := FrmHoraCor.TipoAcesso;
  tCorCor.Value := clSilver;
  tCorCorFonte.Value := clBlack;
  tCorReinicia.Value := False;
end;

procedure TFrmCorPreco.Editar;
begin
  FIncluir := False;
  tCor.Insert;
  TransfDados(FrmHoraCor.mtCor, tCor);
  tCor.Post;
  LePrecos;
  ShowModal;
end;

procedure TFrmCorPreco.Novo;
begin
  FIncluir := True;
  tCor.Insert;
  ShowModal;
end;

procedure TFrmCorPreco.LePrecos;
begin
  with FrmHoraCor do begin
    mtCorPrecos.First;
    while not mtCorPrecos.Eof do begin
      tCorPrecos.Append;
      TransfDados(mtCorPrecos, tCorPrecos);
      tCorPrecos.Post;
      mtCorPrecos.Next;
    end;
  end;    
end;

procedure TFrmCorPreco.SalvaPrecos;
var I: Integer;
begin
  with FrmHoraCor do begin
    mtCorPrecos.First;
    while not (mtCorPrecos.Eof and mtCorPrecos.Bof) do 
      mtCorPrecos.Delete;
      
    tCorPrecos.First;
    I := 0;
    while not tCorPrecos.Eof do begin
      Inc(I);
      mtCorPrecos.Insert;
      TransfDados(tCorPrecos, mtCorPrecos);
      mtCorPrecosTipoAcesso.Value := TipoAcesso;
      mtCorPrecosCor.Value := tCorCor.Value;
      mtCorPrecosPos.Value := I;
      mtCorPrecos.Post;
      tCorPrecos.Next;
    end;
  end;    
end;

procedure TFrmCorPreco.FormCreate(Sender: TObject);
begin
  tCor.Open;
  tCorPrecos.Open;
end;

procedure TFrmCorPreco.cmNovoPrecoClick(Sender: TObject);
begin
  tCorPrecos.Append;
end;

procedure TFrmCorPreco.cmApagarClick(Sender: TObject);
begin
  if tCorPrecos.RecordCount > 0 then
    tCorPrecos.Delete;
end;

procedure TFrmCorPreco.InspCorDrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AColor := tCorCor.Value;
  AFont.Color := tCorCorFonte.Value;
end;

procedure TFrmCorPreco.InspCorDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AText := '';
end;

end.
