unit ncaFrmPopupUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmPopUpEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, nxdb, dxBarExtItems, dxBar,
  cxClasses, Menus, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, ExtCtrls, uParentedPanel,
  cxDBEdit, cxContainer, cxTextEdit, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxPCdxBarPopupMenu, cxPC,
  StdCtrls, cxButtons, uNexTransResourceStrings_PT;

type
  TFrmPopupUnidade = class(TFrmPopUpEdit)
  private
    { Private declarations }
  public
    procedure Inicializar(aPopUp : TcxDBPopupEdit; aTabGeral:tDataset); override;
    { Public declarations }
  end;

var
  FrmPopupUnidade: TFrmPopupUnidade;

implementation

{$R *.dfm}

{ TFrmCategoria }

procedure TFrmPopupUnidade.Inicializar(aPopUp: TcxDBPopupEdit;
  aTabGeral: tDataset);
begin

  fNomeTabelaPrincipal      := 'produto';      // do not localize
  fNomeCampoTabelaPrincipal := 'unid';      // do not localize
  fNomeTabelaValores        := 'unidade';      // do not localize
  fNomeCampoTabelaValores   := 'descricao';    // do not localize
  fDescricao                := SncaFrmPopupUnidade_Unidade;
  fCannotDeleteText         := SncaFrmPopupUnidade_NãoéPossívelA;
  fCannotEditText           := SncaFrmPopupUnidade_EstaUnidadeJá;

  inherited;

end;

end.

