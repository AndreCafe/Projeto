unit ucmaFrmChat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ucmaFrmBaseCHAT, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxMemo, Menus,
  cxLookAndFeelPainters, cxLookAndFeels, StdCtrls, cxButtons, cxContainer,
  cxMaskEdit, cxDropDownEdit, LMDSimplePanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, LMDCustomScrollBox, LMDScrollBox,
  lmdsplt, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxRichEdit, RVStyle, RVScroll,
  RichView, ExtCtrls;

type
  TFrmChat = class(TFrmBaseChat)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    procedure btnEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TVDizCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChat: TFrmChat;

implementation

uses ucmaDM;

{$R *.dfm}

procedure TFrmChat.btnEnviarClick(Sender: TObject);
begin
  inherited;
  with Dados do begin
    tbChat.Insert;
    tbChatDataHora.Value := Now;
    tbChatDe.Value := 0;
    tbChatPara.AsString := edMaq.Text;
    tbChatTexto.Value := meTexto.Lines.Text;
    tbChat.Post;
  end;
end;

procedure TFrmChat.FormCreate(Sender: TObject);
var I : Integer;
begin
  inherited;
  edMaq.Properties.Items.Clear;
  with Dados do 
  for I := 0 to CM.Maquinas.Count - 1 do
    edMaq.Properties.Items.Add(IntToStr(CM.Maquinas[I].Numero));
  edMaq.ItemIndex := 0;
end;

procedure TFrmChat.TVDizCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Canvas.Font.Style := [fsBold];
end;

end.
