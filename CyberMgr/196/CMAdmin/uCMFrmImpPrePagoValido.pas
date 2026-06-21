unit uCMFrmImpPrePagoValido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, FR_Class, DB, nxdb,
  fr2_NexusDB1DB, FR_DSet, FR_DBSet, FR_Desgn, cmClassesBase, FR_DCtrl,
  FR_Cross, FR_ChBox, FR_Shape, FR_BarC, FR_Rich, cxRadioGroup;

type
  TFrmImpPrePagoValido = class(TForm)
    edTipo: TcxLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edQuant: TcxSpinEdit;
    btnImprimir: TcxButton;
    btnFechar: TcxButton;
    btnEditar: TcxButton;
    RP: TfrReport;
    tPass: TnxTable;
    dbPassaporte: TfrDBDataSet;
    tPassNumero: TAutoIncField;
    tPassTipoPass: TIntegerField;
    tPassCliente: TIntegerField;
    tPassExpirou: TBooleanField;
    tPassSenha: TStringField;
    tPassPrimeiroUso: TDateTimeField;
    tPassTipoAcesso: TIntegerField;
    tPassTipoExp: TWordField;
    tPassExpirarEm: TDateTimeField;
    tPassMaxSegundos: TIntegerField;
    tPassSegundos: TIntegerField;
    tPassAcessos: TIntegerField;
    tPassDia1: TIntegerField;
    tPassDia2: TIntegerField;
    tPassDia3: TIntegerField;
    tPassDia4: TIntegerField;
    tPassDia5: TIntegerField;
    tPassDia6: TIntegerField;
    tPassDia7: TIntegerField;
    tPassTransacao: TIntegerField;
    tPassDataCompra: TDateTimeField;
    frnxComponents1: TfrnxComponents;
    tPassMinutos: TIntegerField;
    frRichObject1: TfrRichObject;
    frBarCodeObject1: TfrBarCodeObject;
    frShapeObject1: TfrShapeObject;
    frCheckBoxObject1: TfrCheckBoxObject;
    frCrossObject1: TfrCrossObject;
    frDialogControls1: TfrDialogControls;
    rbInvalido: TcxRadioButton;
    rbValido: TcxRadioButton;
    tPassValido: TBooleanField;
    tPassValor: TCurrencyField;
    Designer: TfrDesigner;
    procedure btnEditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure tPassCalcFields(DataSet: TDataSet);
    procedure tPassValorGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpPrePagoValido: TFrmImpPrePagoValido;

implementation

uses uCMDados, md5, cmIDRecursos;

{$R *.dfm}

procedure TFrmImpPrePagoValido.btnEditarClick(Sender: TObject);
begin
  RP.DesignReport;
end;

procedure TFrmImpPrePagoValido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmImpPrePagoValido.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmImpPrePagoValido.FormCreate(Sender: TObject);
var S: String;
begin
  rbValido.Enabled := Permitido(daPPGImpPPValido);
  btnEditar.Enabled := Permitido(daPPGEditaFmtImpPP);
  Dados.tbTipoPass.Refresh;
  tPass.Open;
  S := ExtractFilePath(ParamStr(0)) + 'prepago.frf';
  RP.FileName := S;
  if FileExists(S) then begin
    RP.LoadFromFile(S);
  end;
end;

procedure TFrmImpPrePagoValido.btnImprimirClick(Sender: TObject);
var 
  P : TPassaporte;
  I : Integer;
  Primeiro : Integer;
  Ultimo : Integer;
begin
  if (edTipo.EditValue=Null) or (edTipo.EditValue=0) then begin
    Beep;
    ShowMessage('É necessário selecionar um tipo de passaporte');
    Exit;
  end;

  if (edQuant.Value=Null) or (edQuant.Value=0) then begin
    Beep;
    ShowMessage('É necessário informar uma quantidade maior que zero');
    Exit;
  end;  
    
  if MessageDlg('Deseja realmente imprimir cartões pré-pagos conforme as informações digitadas?',
                mtConfirmation, [mbYes, mbNo], 0)=mrNo then Exit;

  P.LoadFromDataset(Dados.tbTipoPass);

  Primeiro := 0;
  tPass.CancelRange;

  for I := 1 to edQuant.EditValue do begin
    tPass.Insert;
    P.SaveToDataset(tPass);
    tPassNumero.Clear;
    tPass.Post;
    tPass.Edit;
    P.pcNumero := tPassNumero.Value;
    P.pcSenha := P.GeraSenha;
    P.pcValido := rbValido.Checked;
    P.SaveToDataset(tPass);
    tPass.Post;
    if Primeiro=0 then 
      Primeiro := P.pcNumero;
    Ultimo := P.pcNumero;  
  end;              

  tPass.SetRange([Primeiro], [Ultimo]);
  RP.ShowReport;
end;

procedure TFrmImpPrePagoValido.tPassCalcFields(DataSet: TDataSet);
begin
  tPassMinutos.Value := tPassMaxSegundos.Value div 60;
end;

procedure TFrmImpPrePagoValido.tPassValorGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FloatToStrF(Sender.AsCurrency, ffCurrency, 0, 2);
end;

end.
