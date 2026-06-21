unit uFrmCad;

interface

uses
  Windows, Messages, DB, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, dxExEdtr, dxInspct, dxInspRw, dxDBInRw,
  dxCntner, dxDBInsp, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmCadastro = class(TForm)
    dxBarManager1: TdxBarManager;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    LMDSimplePanel1: TLMDSimplePanel;
    dxDBInspector1: TdxDBInspector;
    dxDBInspector1Nome: TdxInspectorDBMaskRow;
    dxDBInspector1Email: TdxInspectorDBMaskRow;
    dxDBInspector1Tel1: TdxInspectorDBMaskRow;
    dxDBInspector1Tel2: TdxInspectorDBMaskRow;
    dxDBInspector1Endereco: TdxInspectorDBMaskRow;
    dxDBInspector1Bairro: TdxInspectorDBMaskRow;
    dxDBInspector1Cidade: TdxInspectorDBMaskRow;
    dxDBInspector1CEP: TdxInspectorDBMaskRow;
    dxDBInspector1UF: TdxInspectorDBMaskRow;
    dxDBInspector1Contato: TdxInspectorDBMaskRow;
    dxDBInspector1Classificacao: TdxInspectorDBMaskRow;
    dxDBInspector1Row13: TdxInspectorComplexRow;
    cmNovo: TdxBarLargeButton;
    dxDBInspector1Row14: TdxInspectorDBRow;
    procedure cmSalvarClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastro: TFrmCadastro;

implementation

uses uDMFestas;

{$R *.dfm}

procedure TFrmCadastro.cmSalvarClick(Sender: TObject);
begin
  with DM do
  if tContato.State in [dsEdit, dsInsert] then
    tContato.Post;
  Close;  
end;

procedure TFrmCadastro.cmFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastro.cmCancelarClick(Sender: TObject);
begin
  with DM do 
  if tContato.State in [dsEdit, dsInsert] then
    tContato.Cancel;
  Close;
end;

procedure TFrmCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DM do begin
    if tContato.State in [dsEdit, dsInsert] then
    if tContato.Modified then 
    if (MessageDlg('Deseja gravar as alterações realizadas?', 
                  mtConfirmation,
                  [mbYes, mbNo], 0)=mrYes) 
    then
      tContato.Post;
    if tContato.State in [dsEdit, dsInsert] then
      tContato.Cancel;
  end;    
  Action := caFree;
end;

procedure TFrmCadastro.cmNovoClick(Sender: TObject);
begin
  DM.tContato.Insert;
end;

end.
