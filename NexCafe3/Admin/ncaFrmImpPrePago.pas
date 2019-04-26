unit ncaFrmImpPrePago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, frxClass, DB, nxdb,
  ncClassesBase, cxRadioGroup, frxDesgn, frxDCtrl, frxCross, frxChBox,
  frxBarcode, frxRich, frxDBSet, cxGraphics, Menus, frxExportRTF, frxExportMail,
  frxExportPDF, ncPassaportes;

type
  TFrmImpPrePago = class(TForm)
    edTipo: TcxLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edQuant: TcxSpinEdit;
    btnImprimir: TcxButton;
    btnFechar: TcxButton;
    btnEditar: TcxButton;
    tPass: TnxTable;
    dbPassaporte: TfrxDBDataset;
    tPassID: TAutoIncField;
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
    tPassDataCompra: TDateTimeField;
    tPassMinutos: TIntegerField;
    frxRichObject1: TfrxRichObject;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxCrossObject1: TfrxCrossObject;
    frxDialogControls1: TfrxDialogControls;
    rbInvalido: TcxRadioButton;
    rbValido: TcxRadioButton;
    tPassValido: TBooleanField;
    tPassValor: TCurrencyField;
    Designer: TfrxDesigner;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRTFExport1: TfrxRTFExport;
    btnGerar: TcxButton;
    SaveDlg: TSaveDialog;
    tPassTran: TIntegerField;
    tPassSessao: TIntegerField;
    RP: TfrxReport;
    procedure btnGerarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure tPassCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImpPrePago: TFrmImpPrePago;

implementation

uses 
  ncaDM, 
  md5, 
  ncIDRecursos;

{$R *.dfm}

procedure TFrmImpPrePago.btnEditarClick(Sender: TObject);
begin
  RP.DesignReport;
end;

procedure TFrmImpPrePago.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmImpPrePago.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmImpPrePago.btnGerarClick(Sender: TObject);
var 
  P : TncPassaporte;
  I : Integer;
  Primeiro : Integer;
  Ultimo : Integer;
  Arq : TextFile;
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

  if not SaveDlg.Execute then Exit;
    
  if MessageDlg('Deseja realmente gerar códigos de cartões de tempo com as informações digitadas?',
                mtConfirmation, [mbYes, mbNo], 0)=mrNo then Exit;

                
  P := TncPassaporte.Create;
  try              
    P.LoadFromDataset(Dados.tbTipoPass);
  
    Primeiro := 0;
    tPass.CancelRange;
  
    for I := 1 to edQuant.EditValue do begin
      tPass.Insert;
      P.SaveToDataset(tPass);
      tPassID.Clear;
      tPass.Post;
      tPass.Edit;
      P.pcID := tPassID.Value;
      P.pcSenha := P.GeraSenha;
      P.pcValido := rbValido.Checked;
      P.SaveToDataset(tPass);
      tPass.Post;
      if Primeiro=0 then 
        Primeiro := P.pcID;
      Ultimo := P.pcID;
    end;
  finally
    P.Free;
  end;
  tPass.SetRange([Primeiro], [Ultimo]);
  try
    {$I-}
    AssignFile(Arq, SaveDlg.FileName);
    Reset(Arq);
    if IOResult<>0 then Rewrite(Arq);
    while not tPass.Eof do begin
      Write(Arq, tPassSenha.Value+';');
      tPass.Next;
    end;
  finally
    CloseFile(Arq);
  end;
  {$I+}
end;

procedure TFrmImpPrePago.FormCreate(Sender: TObject);
var S: String;
begin
  rbValido.Enabled := Permitido(daPPGImpPPValido);
  btnEditar.Enabled := Permitido(daPPGEditaFmtImpPP);
  Dados.tbTipoPass.Refresh;
  tPass.Open;
  S := ExtractFilePath(ParamStr(0)) + 'prepago.fr3';
  RP.FileName := S;
  if FileExists(S) then begin
    RP.LoadFromFile(S);
  end;
end;

procedure TFrmImpPrePago.btnImprimirClick(Sender: TObject);
var
  P : TncPassaporte;
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

  P := TncPassaporte.Create;
  try                
    P.LoadFromDataset(Dados.tbTipoPass);
  
    Primeiro := 0;
    tPass.CancelRange;
  
    for I := 1 to edQuant.EditValue do begin
      tPass.Insert;
      P.SaveToDataset(tPass);
      tPassID.Clear;
      tPass.Post;
      tPass.Edit;
      P.pcID := tPassID.Value;
      P.pcSenha := P.GeraSenha;
      P.pcValido := rbValido.Checked;
      P.SaveToDataset(tPass);
      tPass.Post;
      if Primeiro=0 then 
        Primeiro := P.pcID;
      Ultimo := P.pcID;      
    end;
  finally
    P.Free;
  end;

  tPass.SetRange([Primeiro], [Ultimo]);
  RP.ShowReport;
end;

procedure TFrmImpPrePago.tPassCalcFields(DataSet: TDataSet);
begin
  tPassMinutos.Value := tPassMaxSegundos.Value div 60;
end;

end.
