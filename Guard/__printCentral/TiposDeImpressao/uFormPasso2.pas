unit uFormPasso2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer,
  cxEdit, dxGDIPlusClasses, cxImage, cxLabel, cxTextEdit, udmTipodeImpressao,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TCheckNameEvent = function (Sender: TObject; aNomeTipo:string):boolean of object;

  TFormPasso2 = class(TForm)
    Panel2: TPanel;
    cxImagePrinter: TcxImage;
    cxLabelTittle: TcxLabel;
    cxButtonEliminar: TcxButton;
    cxButtonContinuar: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    cxTextEditNome: TcxTextEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Nome: TcxGridDBColumn;
    cxGrid1DBTableView1Impressora: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel2: TcxLabel;
    cxLabelExiste: TcxLabel;
    cxLabelNome: TcxLabel;
    cxButtonVoltar: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxTextEditNomePropertiesChange(Sender: TObject);
    procedure cxButtonContinuarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fonCheckName : TCheckNameEvent;
    { Private declarations }
  public
    property onCheckName : TCheckNameEvent read fonCheckName write fonCheckName;
    { Public declarations }
  end;

var
  FormPasso2: TFormPasso2;

implementation

uses uTiposDeImpressao;

{$R *.dfm}

procedure TFormPasso2.FormCreate(Sender: TObject);
begin
    cxTextEditNome.Properties.OnChange := cxTextEditNomePropertiesChange;
end;

procedure TFormPasso2.cxButton1Click(Sender: TObject);
begin
    close
end;

procedure TFormPasso2.cxButtonContinuarClick(Sender: TObject);
begin
    if cxTextEditNome.Style.Color <> clred then
        FormTipoDeImpressao.tipoImpressaoName := cxTextEditNome.text;
end;

procedure TFormPasso2.cxTextEditNomePropertiesChange(Sender: TObject);
var
    r : boolean;
    s : string;
    p : integer;
begin
    if not assigned(fonCheckName) then exit;

    with dmTipodeImpressao do begin
        r := fonCheckName(self, cxTextEditNome.text);
        if FormTipoDeImpressao.IdTipoImpressao>0 then
            r := r and not sametext(cxTextEditNome.text, FormTipoDeImpressao.tipoImpressaoName);
        cxLabelExiste.Visible := r;
        if r then begin
          cxTextEditNome.Style.Color := clred;
          cxTextEditNome.Style.Font.Color := clWhite;
        end else begin
          cxTextEditNome.Style.Color := clWindow;
          cxTextEditNome.Style.Font.Color := clWindowText;
        end;
    end;
    cxButtonContinuar.Enabled := (cxTextEditNome.text<>'') and (not r);
    s := cxTextEditNome.text;
    p := cxTextEditNome.SelStart;
    if p=1 then begin
       s[1] := AnsiUpperCase(s[1])[1];
       cxTextEditNome.text := s;
       cxTextEditNome.SelStart := p;
    end;
end;

procedure TFormPasso2.FormShow(Sender: TObject);
begin
    cxLabelExiste.Visible := false;
    cxButtonContinuar.Enabled := false;
    cxTextEditNome.setfocus;
    if FormTipoDeImpressao.IdTipoImpressao=-1
        then cxLabelNome.Caption := ''
        else cxLabelNome.caption := FormTipoDeImpressao.tipoImpressaoName;
    if FormTipoDeImpressao.IdTipoImpressao=-1
        then cxTextEditNome.Text := ''
        else cxTextEditNome.Text := FormTipoDeImpressao.tipoImpressaoName;
    if FormTipoDeImpressao.IdTipoImpressao=-1
        then cxLabelTittle.Caption := kCriarTipoDeImpressaoTittle
        else cxLabelTittle.caption := kModificarTipoDeImpressaoTittle;
    if FormTipoDeImpressao.IdTipoImpressao>0 then
        cxTextEditNome.SelStart := length(cxTextEditNome.text);
    cxTextEditNomePropertiesChange(nil);
end;


end.
