unit ncaBiometria;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, cxContainer, cxEdit,
  cxProgressBar, cxPC, cxControls, pngimage, ExtCtrls, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, DB, nxdb, cxCheckBox, ncafbPesqCli,
  LMDControl;

type
  TFrmBio = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    Paginas: TcxPageControl;
    tsSearch: TcxTabSheet;
    tsNew: TcxTabSheet;
    PB: TcxProgressBar;
    cxLabel1: TcxLabel;
    edCli: TcxPopupEdit;
    lbPrompt: TcxLabel;
    btnOk: TcxButton;
    cxButton2: TcxButton;
    Timer1: TTimer;
    edOutroCli: TcxCheckBox;
    LMDSimplePanel2: TLMDSimplePanel;
    Image1: TImage;
    lbQld: TcxLabel;
    cxLabel3: TcxLabel;
    Timer2: TTimer;
    cxTabSheet1: TcxTabSheet;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    tBio: TnxTable;
    tBioID: TAutoIncField;
    tBioCliente: TIntegerField;
    tBioTemplate: TBlobField;
    tBioUAcesso: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edOutroCliClick(Sender: TObject);
    procedure edCliPropertiesInitPopup(Sender: TObject);
    procedure edCliPropertiesCloseUp(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    idCliFound : Integer;
    FTpt: PChar;
    FTptSize: Integer;
    FDadosCli : TDadosCliente;
//    FActiveH : HWND;
    procedure Search;
    function GetIdCli: Integer;
    procedure SetIdCli(const Value: Integer);
    { Private declarations }
  public
    procedure SearchTPT(aTpt: PChar; aTptSize: Integer; aQld: Byte);

    property idCli: Integer
      read GetIdCli write SetIdCli;
    { Public declarations }
  end;

var
  FrmBio: TFrmBio = nil;
  BioFrmH : HWND = 0;

implementation

uses ncaDM, ncaFrmPri, GrFinger;

{$R *.dfm}

procedure TFrmBio.btnOkClick(Sender: TObject);
var 
  S: TMemoryStream;
  I: Integer;
begin
  if idCli=0 then 
    Raise ENexCafe.Create('Você não selecionou um cliente para essa digital');

  if idCli<>idCliFound then begin
    S := TMemoryStream.Create;
    try  
      S.Write(FTpt^, FTptSize);
      S.Position := 0;
      
      if idCliFound>0 then 
        tBio.Edit else
        tBio.Insert;
      tBioTemplate.LoadFromStream(S);
      tBioCliente.Value := idCli;
      tBioUAcesso.Value := Now;
      tBio.Post;
    finally
      S.Free;
    end;
  end;

  PostMessage(BioFrmH, wm_biometria, idCli, 0);
  Close;
end;

procedure TFrmBio.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBio.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBio.edCliPropertiesCloseUp(Sender: TObject);
begin
  edCli.Text := FDadosCli.dcNome;
  idCli := FDadosCli.dcCodigo;
end;

procedure TFrmBio.edCliPropertiesInitPopup(Sender: TObject);
begin
  edCli.Properties.PopupControl := fbPesqCli;
  fbPesqCli.PreparaBusca(@FDadosCli, TcxCustomDropDownEdit(Sender));
end;

procedure TFrmBio.edOutroCliClick(Sender: TObject);
begin
  edCli.Enabled := edOutroCli.Checked;
  if edCli.Enabled then
    lbPrompt.Caption := 'Selecione o cliente para essa digital' else
    lbPrompt.Caption := 'Digital encontrado - Cliente:';
end;

procedure TFrmBio.FormCreate(Sender: TObject);
begin
  FTpt := StrAlloc(GR_MAX_SIZE_TEMPLATE);
  FTptSize := 0;
  Paginas.HideTabs := True;
  Paginas.ActivePageIndex := 0;
  tBio.Open;
end;

function TFrmBio.GetIdCli: Integer;
begin
  Result := FDadosCli.dcCodigo;
end;

procedure TFrmBio.Search;
var 
  T : PChar;
  S : TMemoryStream;
begin
  T := StrAlloc(GR_MAX_SIZE_TEMPLATE);
  S := TMemoryStream.Create;
  try
    tBio.IndexName := 'IUAcesso';
    idCli := 0;
    idCliFound := 0;
    edCli.Text := '';
    PB.Properties.Max := tBio.RecordCount;
    tBio.First;
    while not tBio.Eof do begin
      S.Size := 0;
      tBioTemplate.SaveToStream(S);
      Move(S.Memory^, T^, S.Size);
      if FrmPri.FingRead.Match(T)>0 then begin
        tBio.Edit;
        tBioUAcesso.Value := Now;
        tBio.Post;
        idCli := tBioCliente.Value;
        idCliFound := idCli;
        with Dados do 
        if tbCli.Locate('ID', idCli, []) then
          FDadosCli.dcNome := tbCliNome.Value else
          FDadosCli.dcNome := '';
        Break;
      end;
      PB.Position := PB.Position + 1;
      Application.ProcessMessages;
      tBio.Next;
    end;

    edOutroCli.Checked := False;
    if idCli=0 then begin
      lbPrompt.Caption := 'Selecione o cliente para essa digital';
      edOutroCli.Visible := False;
      edCli.Enabled := True;
    end else begin
      lbPrompt.Caption := 'Digital encontrada - Cliente:';
      edOutroCli.Visible := True;
      edCli.Text := FDadosCli.dcNome;
      edCli.Enabled := False;
    end;
    Timer2.Enabled := True;
  finally
    S.Free;
    StrDispose(T);
  end;
end;

procedure TFrmBio.SearchTPT(aTPT: PChar; aTPTSize: Integer; aQld: Byte);
begin
  Timer2.Enabled := False;
  case aQld of
    0 : begin
      lbQld.Caption := 'Baixa';
      lbQld.Style.TextColor := clRed;
      btnOk.Enabled := False;
      Paginas.ActivePageIndex := 2;
      Exit;
    end;
    1 : begin
      lbQld.Caption := 'Média';
      lbQld.Style.TextColor := clBlack;
      btnOk.Enabled := True;
    end;
    2 : begin
      lbQld.Caption := 'Alta';
      lbQld.Style.TextColor := clGreen;
      btnOk.Enabled := True;
    end;
  end;
  Move(aTpt^, FTpt^, aTPTSize);
  FTptSize := aTptSize;
  PB.Position := 0;
  idCli := 0;
  idCliFound := 0;
  edCli.Text := '';
  Paginas.ActivePageIndex := 0;
  Timer1.Enabled := True;
  if not Visible then begin
{    FActiveH := Application.ActiveFormHandle;
    if FActiveH=PesqFrmH then
      FActiveH := RealActiveFrmH;}
    ShowModal;
  end;
end;

procedure TFrmBio.SetIdCli(const Value: Integer);
begin
  FDadosCli.dcCodigo := Value;
  if Value=0 then
    FDadosCli.dcNome := '';
  btnOk.Enabled := (Value>0);  
end;

procedure TFrmBio.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Search;
end;

procedure TFrmBio.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  Paginas.ActivePageIndex := 1;
end;

end.
