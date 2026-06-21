unit uCMFrmDireito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, Db, kbmMemTable, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cmListaID, cmIDRecursos;

type
  TFrmDireito = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    LMDSimplePanel1: TLMDSimplePanel;
    mtDireito: TkbmMemTable;
    dsDireito: TDataSource;
    mtDireitoID: TIntegerField;
    mtDireitoPermitir: TBooleanField;
    mtDireitoTipoAcesso: TStringField;
    Grid: TdxDBGrid;
    GridID: TdxDBGridMaskColumn;
    GridPermitir: TdxDBGridCheckColumn;
    GridTipoAcesso: TdxDBGridMaskColumn;
    lbModulo: TLMDLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    FDireitos : String;
    FModulo : Byte;
    function EditaDireitos(aModulo: Byte; aDireitos: String): String;
    { Public declarations }
  end;

var
  FrmDireito: TFrmDireito;

implementation

uses uCMFrmPri;

{$R *.DFM}

procedure TFrmDireito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmDireito.cmGravarClick(Sender: TObject);
begin
  FDireitos := '';
  if mtDireito.State = dsEdit then mtDireito.Post;
  mtDireito.First;
  while not mtDireito.Eof do begin
    if (AcessoMinimo(FModulo)=mtDireitoID.Value) or
       mtDireitoPermitir.Value then 
      FDireitos := LIAddID(FDireitos, mtDireitoID.Value); 
    mtDireito.Next;
  end;
  Close;
end;

function TFrmDireito.EditaDireitos(aModulo: Byte; aDireitos: String): String;
var 
  Valor: String;
  I : Integer;
begin
  FDireitos := aDireitos;
  FModulo := aModulo;
  lbModulo.Caption := 'Permissões em ' + StringRecurso(FModulo);
  Valor := EliminaCampo(FDireitos);
  mtDireito.Open;
  for I := 1 to 100 do 
  if TipoAcessoValido(aModulo, I) then begin
    mtDireito.Append;
    mtDireitoID.Value := I;
    mtDireitoTipoAcesso.Value := StringTipoAcesso(aModulo, I);
    mtDireitoPermitir.Value := LIContemID(Valor, I);
    mtDireito.Post;
  end;
  ShowModal;
  Result := FDireitos;
end;

procedure TFrmDireito.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDireito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
