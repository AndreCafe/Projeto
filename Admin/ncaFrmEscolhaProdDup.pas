unit ncaFrmEscolhaProdDup;
{
    ResourceString: Dario 11/03/13
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, DB, cxDBData, cxTextEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, StdCtrls, cxButtons, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, nxdb, cxImage, cxLabel,
  cxMemo, ExtCtrls;

Const
   kMinImageHeight = 60;
   kMaxImageHeight = 100;

type
  TFrmEscolhaProdDup = class(TForm)
    dsTab: TDataSource;
    Tab: TnxTable;
    TabID: TAutoIncField;
    TabCodigo: TStringField;
    TabUnid: TStringField;
    TabPreco: TCurrencyField;
    TabObs: TMemoField;
    TabImagem: TGraphicField;
    TabDescricao: TStringField;
    TabCategoria: TStringField;
    TabSubCateg: TStringField;
    Tabplus: TBooleanField;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    cxButton1: TcxButton;
    Grid: TcxGrid;
    TVprod: TcxGridDBTableView;
    TVprodID: TcxGridDBColumn;
    TVDescr: TcxGridDBColumn;
    TVprodPreco: TcxGridDBColumn;
    GL: TcxGridLevel;
    TVprodUnid: TcxGridDBColumn;
    TVprodImagem: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure TVprodGetCellHeight(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
    procedure TVprodCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Fid : integer;
    FIniH : integer;
    FNewH : integer;
    //FRealH  : integer;
    //fsl : TStringList;
    //Fcalcular, fok : boolean;
    { Private declarations }
  public
    function Mostrar(aCodigo: string):integer;
    { Public declarations }
  end;

var
  FrmEscolhaProdDup: TFrmEscolhaProdDup;

implementation

{$R *.dfm}

uses
   ncaFrmPri;

{ TFrmEscolhaProdDup }

procedure TFrmEscolhaProdDup.cxButton1Click(Sender: TObject);
begin
   Fid := TabID.AsInteger;
   Close;
end;

procedure TFrmEscolhaProdDup.cxButton2Click(Sender: TObject);
begin
   Fid := -1;
   Close;
end;

procedure TFrmEscolhaProdDup.FormCreate(Sender: TObject);
begin
   //fsl := TStringList.create;
end;

procedure TFrmEscolhaProdDup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Esc   : begin
                    Fid := -1;
                    Close;
                end;
    Key_Enter : begin
                    Fid := TabID.AsInteger;;
                    Close;
                end;
  end;

end;

function TFrmEscolhaProdDup.Mostrar(aCodigo: string):integer;
begin
   Fid := -1;
   TVprod.DataController.DataSource := nil;

   tab.filter := '(plus <> true) and (codigo='''+trim(aCodigo)+''')'; // do not localize
   tab.Filtered := true;
   tab.Open;

   FIniH := height - grid.height ;
   while not tab.Eof do begin
       if TabImagem.IsNull then
           FNewH := FNewH + kMinImageHeight + 1
       else
           FNewH := FNewH + kMaxImageHeight + 1;
       tab.Next;
   end;
   
   TVprod.OptionsView.HeaderHeight := 19;
   Height := FIniH + FNewH + (2*TVprod.OptionsView.HeaderHeight) + 2;    //50;

   tab.First;
   TVprod.DataController.DataSource := dsTab;

   //Fcalcular := true;
   ShowModal;
   tab.Close;
   result := Fid;
end;

procedure TFrmEscolhaProdDup.TVprodCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    ADone := false;
{
    if fsl.indexof(inttostr(AViewInfo.RecordViewInfo.Index))=-1 then  begin
    //if fsl.indexof(inttostr(AViewInfo.Item.ID))=-1 then  begin
        fsl.add (inttostr(AViewInfo.RecordViewInfo.Index));
        //fsl.add (inttostr(AViewInfo.Item.ID));
        //AViewInfo.Item.ID;
        FRealH := FRealH + AViewInfo.Height;
    end; // else
    if fsl.count = tab.RecordCount then
       Timer1.enabled:=true;
}
end;

procedure TFrmEscolhaProdDup.TVprodGetCellHeight(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
begin
    //if ARecord.ViewData. then
    //if not Fcalcular then exit;
    

    if AHeight>kMaxImageHeight then
        AHeight := kMaxImageHeight;
    if AHeight<kMinImageHeight then
        AHeight := kMinImageHeight;

    {if fsl.indexof(inttostr(ARecord.Index))=-1 then  begin
        fsl.add (inttostr(ARecord.Index));
        if TabImagem.IsNull then
           FNewH := FNewH + kMinImageHeight + 1
        else
           FNewH := FNewH + kMaxImageHeight + 1;
        FRealH := FRealH + AHeight;
    end; // else
    if (not fok) and (fsl.count = tab.RecordCount) then  begin
        Height := FIniH + FRealH + (2*TVprod.OptionsView.HeaderHeight) + 2;    //50;
        fok := true;//Timer1.enabled:=true;
        Fcalcular := false;
    end;  }
end;

end.

