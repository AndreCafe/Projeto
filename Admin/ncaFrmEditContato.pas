unit ncaFrmEditContato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, PngImage, ExtCtrls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Menus,
  StdCtrls, cxButtons, ImgList, ncMyImage, ncaFrmCliPesq2, ncDebCredValidator;

type
  TFrmEditContato = class(TForm)
    panPri: TLMDSimplePanel;
    lbNome: TcxLabel;
    imgs: TcxImageList;
    Img: TMyImage;
    cxImageList1: TcxImageList;
    lbRemove: TcxLabel;
    panDeb: TLMDSimplePanel;
    lbDebito: TcxLabel;
    lbValorDebito: TcxLabel;
    panFid: TLMDSimplePanel;
    lbPontos: TcxLabel;
    lbQuantPontos: TcxLabel;
    panCred: TLMDSimplePanel;
    lbCredito: TcxLabel;
    lbValorCredito: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure lbNomeClick(Sender: TObject);
    procedure ImgClick(Sender: TObject);
    procedure imgRemoverCliClick(Sender: TObject);
    procedure lbRemoveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FID: Integer;
    FNome: String;
    FFornecedor: Boolean;
    FFidPontos: Double;
    FCredito: Currency;
    FDebito: Currency;
    FLimiteDeb: Variant;
    FMostrarCred: Boolean;
    FDCValidator : TncDebCredValidator;
    FOnChange: TNotifyEvent;
    procedure SetID(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetFornecedor(const Value: Boolean);
    procedure SetFidPontos(const Value: Double);
    procedure UpdateInfos;
    procedure SetDCValidator(const Value: TncDebCredValidator);
  protected    
    procedure Atualiza; virtual;
    procedure AtualizaValidator;
    
  public
    procedure Pesquisa;

    property DCValidator: TncDebCredValidator
      read FDCValidator write SetDCValidator;

    property Debito: Currency
      read FDebito;

    property LimiteDeb: Variant
      read FLimiteDeb;

    property Credito: Currency
      read FCredito;
    
    { Private declarations }
    property ID: Integer read FID write SetID;

    property MostrarCred: Boolean
      read FMostrarCred write FMostrarCred;
      
    property Nome: String
      read FNome write SetNome;

    property Fornecedor: Boolean
      read FFornecedor write SetFornecedor;  

    property FidPontos: Double
      read FFidPontos write SetFidPontos;

    property OnChange: TNotifyEvent
      read FOnChange write FOnChange;  
  end;

var
  FrmEditContato: TFrmEditContato;


resourcestring
  rsF5Cliente = 'Selecione um cliente (F5)';
  rsF5Fornecedor = 'Selecione um fornecedor (F5)';  

implementation

uses ncaDM, ncaFrmCadCli, ncaFrmCadFornecedor, ncaFrmPesqFor, ncClassesBase;

{$R *.dfm}

{ TFrmEditContato }

procedure TFrmEditContato.AtualizaValidator;
begin
  if FDCValidator<>nil then 
    FDCValidator.SetNewCli(FID, FDebito, FCredito, FLimiteDeb);
end;

procedure TFrmEditContato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEditContato.FormCreate(Sender: TObject);
begin
  FID := 0;
  FFidPontos := 0;
  FCredito := 0;
  FDebito := 0;
  FNome := '';
  FOnChange := nil;
  FFornecedor := False;
  FMostrarCred := True;
  FDCValidator := nil;
end;

procedure TFrmEditContato.ImgClick(Sender: TObject);
begin
  with Dados do 
  if ID=0 then
    Pesquisa
  else
  if tbCli.Locate('ID', FID, []) then begin
    if not FFornecedor then begin
      TFrmCadCli.Create(Self).Editar(tbCli, nil);
      Nome := tbCliNome.Value;
      FidPontos := tbCliFidPontos.Value;
      FCredito := tbCliValorCred.Value;
      FDEbito := tbCliDebito.Value;
    end else begin
      TFrmCadFornecedor.Create(Self).Editar(tbCli, nil);
      Nome := tbCliNome.Value;
      FCredito := 0;
      FDebito := 0;
      FidPontos := 0;
    end;
  end; 
end;

procedure TFrmEditContato.imgRemoverCliClick(Sender: TObject);
begin
  ID := 0;
end;

procedure TFrmEditContato.lbNomeClick(Sender: TObject);
begin
  Pesquisa;
  lbNome.Invalidate;
  lbNome.Update;
end;

procedure TFrmEditContato.lbRemoveClick(Sender: TObject);
begin
  ID := 0;
end;

procedure TFrmEditContato.Pesquisa;
var 
  cliPesq: TFrmCliPesq2;
  forPesq: TFrmPesqFor;
begin
  if not FFornecedor then begin
    cliPesq := gCliPesq2List.GetFrm;
    try
      if cliPesq.Pesquisar(FID, FNome, FFidPontos, FCredito, FDebito) then ID := FID;
    finally
      gCliPesq2List.ReleaseFrm(cliPesq);
    end;
  end else begin
    forPesq := gPesqForList.GetFrm;
    try
      if forPesq.Pesquisar(FID, FNome, FFidPontos) then Atualiza;
    finally
      gPesqForList.ReleaseFrm(forPesq);
    end;
  end;
end;

procedure TFrmEditContato.SetDCValidator(const Value: TncDebCredValidator);
begin
  FDCValidator := Value;
end;

procedure TFrmEditContato.SetFidPontos(const Value: Double);
begin
  FFidPontos := Value;
end;

procedure TFrmEditContato.SetFornecedor(const Value: Boolean);
begin
  Img.ImageIndex := Integer(Value);
  FFornecedor := Value;
  Atualiza;
end;

procedure TFrmEditContato.SetID(const Value: Integer);
begin
  FID := Value;
  with Dados do
  if Value=0 then begin
    FFidPontos := 0;
    FNome := '';
    FCredito := 0;
    FDebito := 0;
    FLimiteDeb := null;
    panDeb.Visible := False;
  end else 
  if tbCli.Locate('ID', Value, []) then begin
    FNome := tbCliNome.Value;
    FFidPontos := tbCliFidPontos.Value;
    FCredito := tbCliValorCred.Value;
    FDebito := tbCliDebito.Value;
    FLimiteDeb := tbCliLimiteDebito.AsVariant;
  end;
  Atualiza;
  AtualizaValidator;

  if Assigned(FOnChange) then FOnChange(Self);
  
end;

procedure TFrmEditContato.SetNome(const Value: String);
begin
  FNome := Value;
  Atualiza;
end;

procedure TFrmEditContato.Atualiza;
begin
  if FID>0 then begin
    lbNome.Caption := FNome;
    lbNome.Style.TextColor := clBlack;
    lbNome.Style.TextStyle := [];
    lbNome.StyleHot.TextStyle := [fsUnderline];
    lbNome.Style.Font.Size := 16;
    Img.MouseOffDrawMode := idmNormal;
    lbRemove.Style.TextColor := clSilver;
  end else begin
    lbNome.Style.TextColor := $004E4E4E;
    lbNome.Style.TextStyle := [];
    lbNome.StyleHot.TextStyle := [fsUnderline];
    lbNome.Style.Font.Size := 12;
    Img.MouseOffDrawMode := idmFaded;
    if FFornecedor then
      lbNome.Caption := rsF5Fornecedor else
      lbNome.Caption := rsF5Cliente;
    lbRemove.Style.TextColor := clBtnFace;
  end;
  UpdateInfos;
end;

function LabelWidth(L: TcxLabel): Integer;
begin
  Result := cxTextWidth(L.Style.Font, L.Caption);
  if L.AlignWithMargins then
    Result := Result + L.Margins.Left + L.Margins.Right;
end;

function BiggerInt(A, B: Integer): Integer;
begin
  if A>B then
    Result := A else
    Result := B;
end;

function BiggerWidth(A, B: TcxLabel): Integer;
begin
  Result := BiggerInt(LabelWidth(A), LabelWidth(B));
end;

procedure TFrmEditContato.UpdateInfos;
begin
  lbValorDebito.Caption := CurrencyToStr(FDebito);
  panDeb.Visible := FDebito>0.001;
  panDeb.Width := lbDebito.Width + lbValorDebito.Width + 10;

  lbValorCredito.Caption := CurrencyToStr(FCredito);
  panCred.Visible := (FCredito>0.001) and FMostrarCred;
//  panCred.Width := BiggerWidth(lbCredito, lbValorCredito);

  lbQuantPontos.Caption := PontosFidToStr(FFidPontos);
  panFid.Visible := FFidPontos>=0.1;
//  panFid.Width := BiggerWidth(lbQuantPontos, lbPontos);
end;

end.
