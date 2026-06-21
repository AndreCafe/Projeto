unit uCMfbgPacotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  dxDBTLCl, dxGrClms, Db, ffdb;

type
  TfbgPacotes = class(TFrmBaseGrid)
    Tab: TffTable;
    TabValorTotal: TCurrencyField;
    TabHoras: TIntegerField;
    dsTab: TDataSource;
    GridValorTotal: TdxDBGridCurrencyColumn;
    GridHoras: TdxDBGridColumn;
    GridDescr: TdxDBGridColumn;
    TabDescr: TStringField;
    TabCodigo: TWordField;
    GridCod: TdxDBGridColumn;
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure Editar; override;
    procedure Novo; override;
    procedure Apagar; override;
    { Public declarations }
  end;

var
  fbgPacotes: TfbgPacotes;

implementation

uses uCMFrmPacote;

{$R *.DFM}

{ TfbgPacotes }

procedure TfbgPacotes.Apagar;
begin
  inherited;
  if MessageDlg('Confirma a exclusão do pacote de '+TabHoras.AsString+' horas ?', 
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then Tab.Delete;
end;

procedure TfbgPacotes.Editar;
begin
  inherited;
  
  if Tab.RecordCount > 0 then
    TFrmPacote.Create(Self).Editar(Tab);
end;

procedure TfbgPacotes.FiltraDados;
begin
  inherited;
  Tab.Open;
end;

procedure TfbgPacotes.Novo;
begin
  inherited;
  TFrmPacote.Create(Self).Novo(Tab);
end;

end.
