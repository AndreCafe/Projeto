unit uCMFrmPesqCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxTL, dxDBCtrl, dxDBGrid, dxCntner, dxBar, lmdcompo, lmdclass, lmdformA,
  dxDBTLCl, dxGrClms, Db, ffdb, dxEditor, dxExEdtr, dxDBEdtr, dxDBELib,
  lmdcctrl, lmdctrl,lmdextcS, lmdsplt,lmdbtn,
  lmdGraph,lmdNonVs, StdCtrls, lmdstdcS, LMDCustomComponent,
  LMDWndProcComponent, LMDFormShadow, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomSimpleLabel,
  LMDSimpleLabel, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel;

type
  TFrmPesqCli = class(TForm)
    LMDFormShadow1: TLMDFormShadow;
    dxBarManager1: TdxBarManager;
    cmEditar: TdxBarButton;
    cmFechar: TdxBarButton;
    cmNovo: TdxBarButton;
    qCli: TffQuery;
    dsCli: TDataSource;
    qCliCodigo: TIntegerField;
    qCliNome: TStringField;
    qCliBairro: TStringField;
    qCliCidade: TStringField;
    qCliUF: TStringField;
    qCliCEP: TStringField;
    qCliNasc: TDateTimeField;
    qCliSexo: TStringField;
    qCliObs: TMemoField;
    LMDSimplePanel1: TLMDSimplePanel;
    Gd: TdxDBGrid;
    GdCodigo: TdxDBGridMaskColumn;
    GdNome: TdxDBGridMaskColumn;
    GdBairro: TdxDBGridMaskColumn;
    GdCidade: TdxDBGridMaskColumn;
    GdUF: TdxDBGridMaskColumn;
    GdNasc: TdxDBGridDateColumn;
    GdSexo: TdxDBGridMaskColumn;
    GdObs: TdxDBGridMemoColumn;
    GdCEP: TdxDBGridMaskColumn;
    btnAchou: TdxBarButton;
    qCliUNome: TStringField;
    qCliEndereco: TStringField;
    GdEndereco: TdxDBGridMaskColumn;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDSimpleLabel1: TLMDSimpleLabel;
    edPesq: TEdit;
    procedure cmEditarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure GdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAchouClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPesqChange(Sender: TObject);
  private
    { Private declarations }
  public
    Resultado: Integer;
    function Procura: Integer;
    { Public declarations }
  end;

var
  FrmPesqCli: TFrmPesqCli;

implementation

uses uCMDados, uCMFrmCliente, uCMFrmPri;
{$R *.DFM}

function TFrmPesqCli.Procura: Integer;
begin
  Resultado := -1;
  ShowModal;
  Result := Resultado;
end;

procedure TFrmPesqCli.cmEditarClick(Sender: TObject);
begin
  with Dados.tbCli do 
  if RecordCount > 0 then begin
    TFrmCliente.Create(Self).Editar(FieldByName('Codigo').AsInteger);
    Refresh;
  end;
end;

procedure TFrmPesqCli.cmNovoClick(Sender: TObject);
var Novo : Integer;
begin
  Novo := TFrmCliente.Create(Self).Novo;
  with Dados.tbCli do
  if Novo > 0 then begin
    IndexName := 'ICodigo';
    Refresh;
    FindKey([Novo]);
    edPesq.Text:= FieldByName('Nome').AsString;
    edPesqChange(Sender);
    btnAchouClick(Sender);
  end;  
end;



procedure TFrmPesqCli.cmFecharClick(Sender: TObject);
begin
close;
end;

procedure TFrmPesqCli.GdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    btnAchouClick(Application);
end;

procedure TFrmPesqCli.btnAchouClick(Sender: TObject);
begin
  if not (qCli.Eof and qCli.Bof) then
    Resultado := qCli.FieldByName('Codigo').AsInteger;
  Close;  
end;

procedure TFrmPesqCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : begin
      btnAchouClick(nil);
      Key := 0;
    end;  
    Key_Esc   : begin
      Close;
      Key := 0;
    end;  
  end;
end;

procedure TFrmPesqCli.edPesqChange(Sender: TObject);
begin
  With qCli.Sql do
  begin
     Clear;
     Add('Select Upper(Nome) as UNome,          ');
     Add('       Codigo, Nome, Endereco, Bairro,');
     Add('       Cidade,UF,CEP,Nasc,Sexo,OBs    ');
     Add(' From Contato');
     if Trim(edPesq.Text)<>'' then
       Add('Where  Upper(Nome) like '+QuotedStr('%'+UpperCase(Trim(edPesq.Text))+'%'));
     Add('Order by Nome');
  end;
  qCli.Open;
end;

end.
