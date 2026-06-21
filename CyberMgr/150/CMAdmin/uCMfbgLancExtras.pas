unit uCMfbgLancExtras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  Db, nxdb, dxDBTLCl, dxGrClms, ExtCtrls;

type
  TfbgLancExtras = class(TFrmBaseGrid)
    Tab: TnxTable;
    TabNumero: TAutoIncField;
    TabDia: TDateTimeField;
    TabCaixa: TIntegerField;
    TabUsuario: TStringField;
    TabEntrada: TBooleanField;
    TabTipo: TStringField;
    TabDescricao: TStringField;
    TabValor: TCurrencyField;
    TabObs: TMemoField;
    dsTab: TDataSource;
    GridDia: TdxDBGridDateColumn;
    GridCaixa: TdxDBGridMaskColumn;
    GridUsuario: TdxDBGridMaskColumn;
    GridTipo: TdxDBGridMaskColumn;
    GridDescricao: TdxDBGridMaskColumn;
    GridValor: TdxDBGridCurrencyColumn;
    TabValorFator: TCurrencyField;
    GridEntrada: TdxDBGridCheckColumn;
    procedure TabCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); override;
    procedure FiltraDados; override;

    procedure Novo; override;
    procedure Editar; override;
    procedure Apagar; override;
    procedure AplicaDireitosUsuario; override;
    { Public declarations }
  end;

var
  fbgLancExtras: TfbgLancExtras;

implementation

uses uCMFrmLancExtra, uCMDados, cmIDRecursos;

{$R *.DFM}

{ TfbgLancExtras }

procedure TfbgLancExtras.Apagar;
begin
  inherited;
  if NumAberto <> TabCaixa.Value then begin
    Beep;
    ShowMessage('Impossível apagar lançamento extra de um caixa que não está aberto!');
    Exit;
  end;
  
  if MessageDlg('Confirma a exclusão do lançamento extra ?', mtConfirmation,
                [mbYes, mbNo], 0) <> mrYes then Exit;
  
  with Dados do begin
    tbCaixa.IndexName := 'INumero';
      
    if not tbCaixa.FindKey([NumAberto]) then begin
      Beep;
      ShowMessage('Caixa não encontrado!');
      Exit;
    end;
  
    db.StartTransactionWith([tbCaixa, Tab]);
    try
      
      tbCaixa.Edit;
      
      with tbCaixa do
      if TabEntrada.Value then
        FieldByName('LancExtrasE').AsFloat := 
          FieldByName('LancExtrasE').AsFloat - 
          TabValor.Value
      else
        FieldByName('LancExtrasS').AsFloat := 
          FieldByName('LancExtrasS').AsFloat - 
          TabValor.Value;

      Tab.Delete;  

      tbCaixa.Post;
          
      db.Commit;
    except
      tbCaixa.Cancel;
      db.Rollback;
      raise;
    end;
  end;
end;

procedure TfbgLancExtras.AplicaDireitosUsuario;
begin
  inherited;
  cmApagar.Enabled := Permitido(reLancExtras, taLEXApagar);
  cmEditar.Enabled := Permitido(reLancExtras, taLEXCadastrar);
end;

procedure TfbgLancExtras.Editar;
begin
  TFrmLancExtra.Create(Self).Editar(Tab);
end;

procedure TfbgLancExtras.FiltraDados;
begin
  Tab.DisableControls;
  Fim := Int(Fim) + 0.9999999;
  try
    if not Tab.Active then Tab.Open;

    if Permitido(reCaixas, taCaiVerAntesOutros) then begin
      Tab.IndexName := 'IDia';
      Tab.SetRange([Inicio], [Fim]);
    end else begin
      Tab.IndexName := 'IUsuario';
      Tab.SetRange([Dados.CM.Username, Inicio], [Dados.CM.Username, Fim]);
    end;
    
    Tab.Refresh;
    Tab.Filtered := True;
    Tab.Last;

    if Grid.DataSource = nil then
      Grid.Datasource := dsTab;
  finally
    Tab.EnableControls;
  end;
end;

procedure TfbgLancExtras.Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant);
begin
  Grid.DataSource := nil;
  if Permitido(reCaixas, taCaiVerAntesOutros) or Permitido(reCaixas, taCaiVerAntes) then begin
    cm2DiasClick(cm1Semana);
    cmSubPeriodo.Visible := ivAlways;  
  end else begin
    cm2DiasClick(cmHoje);
    cmSubPeriodo.Visible := ivNever;
  end;
  
  inherited;
end;

procedure TfbgLancExtras.Novo;
begin
//  TFrmLancExtra.Create(Self).Novo(Tab);
end;

procedure TfbgLancExtras.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  if TabEntrada.Value then
    TabValorFator.Value := TabValor.Value
  else
    TabValorFator.Value := TabValor.Value * -1;  
end;

end.
