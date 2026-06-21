unit uFrmForms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, DB,
  ffdb, dxCntner, Buttons, ExtCtrls, DBCtrls, ComCtrls, dcsystem, dcparser,
  dccommon, dcmemo, dcdbmemo, kbmMemTable, kbmMWCustomConnectionPool,
  kbmMWCustomDataset, kbmMWClientDataset, kbmMWCustomTransport,
  kbmMWClient, kbmMWTCPIPIndyTransport, kbmMWStreamFormat,
  kbmMWBinaryStreamFormat;

type
  TfrmGridForms = class(TForm)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    lbNome: TLabel;
    edNome: TEdit;
    DelphiParser1: TDelphiParser;
    DFMParser1: TDFMParser;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Grid: TdxDBGrid;
    GridNome: TdxDBGridMaskColumn;
    GridModulo: TdxDBGridMaskColumn;
    GridCriadoEm: TdxDBGridDateColumn;
    TabSheet2: TTabSheet;
    DCDBMemo1: TDCDBMemo;
    TabSheet3: TTabSheet;
    DCDBMemo2: TDCDBMemo;
    TabSheet4: TTabSheet;
    DBMemo3: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tabFormsAfterScroll(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
  private
    FResultado: String;
    { Private declarations }
  public
    function ObtemNome(Salvar: Boolean; Nome: String): String;
    { Public declarations }
  end;

var
  frmGridForms: TfrmGridForms;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmGridForms.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmGridForms.ObtemNome(Salvar: Boolean; Nome: String): String;
begin
  Nome := ExtractFileName(Nome);
  if Salvar then begin
    Caption := 'Salvar Como ' + Nome;
    FResultado := Nome;
    edNome.Text := Nome;
  end else begin
    Caption := 'Abrir Formulário';
    edNome.Visible := False;
    lbNome.Visible := False;
  end;
  
  ShowModal;
  Result := FResultado;
end;

procedure TfrmGridForms.btnOkClick(Sender: TObject);
begin
  if Copy(Caption, 1, 6)='Salvar' then
    FResultado := edNome.Text
  else
    FResultado := dmTouche.qFormsNome.Value;
  Close;
end;

procedure TfrmGridForms.btnCancelarClick(Sender: TObject);
begin
  FResultado := '';
  Close;
end;

procedure TfrmGridForms.tabFormsAfterScroll(DataSet: TDataSet);
begin
  edNome.Text := dmTouche.qFormsNome.Value;
end;

procedure TfrmGridForms.GridDblClick(Sender: TObject);
begin
  edNome.Text := dmTouche.qFormsNome.Value;
  btnOkClick(nil);
end;

end.
