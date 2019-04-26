unit ncaFrmPopupPrecoAuto;

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
  StdCtrls, cxButtons, uNexTransResourceStrings_PT, ncaFrmPopUpEditBase,
  kbmMemTable, ncClassesBase, cxLabel, TypInfo, cxCheckBox, cxCurrencyEdit;

type

  TFrmPopupPrecoAuto = class(TFrmPopUpEditBase)
    tabValores: TkbmMemTable;
    tabValoresDescricao: TStringField;
    tabValoresvalor: TBooleanField;
    dsPrincipal: TDataSource;
    LMDSimplePanel1: TLMDSimplePanel;
    edPodeAlterarPreco: TcxDBCheckBox;
    cxLabel1: TcxLabel;
    tabResult: TkbmMemTable;
    dsResult: TDataSource;
    tabResultValor: TCurrencyField;
    panEdMargem: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    edMargem: TcxCurrencyEdit;
    panEdPreco: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    edPreco: TcxCurrencyEdit;
    procedure butOkClick(Sender: TObject);
  private
    fValue : double;
    fTabPrincipalAfterScroll : TMethod;
    fTabPrincipal            : TDataSet;
    fNomeCampoTabelaValoresValor : string;
    fIniValueOk : boolean;
    fIniValue : variant;
    fIniValuePodeAlterar : variant;
    procedure tabValoresAfterScroll(DataSet: TDataSet);
    procedure tabPrincipalAfterScroll(DataSet: TDataSet);
    procedure SetIniValue;
    procedure CalcularValor;
    { Private declarations }
  protected
    procedure InitPopup; override;
    function  doBeforeDelete: boolean; override;
    function  doBeforeEdit: boolean;   override;
    procedure doAfterDelete;           override;
    procedure InicializaDados;    override;
    procedure selecionou;         override;
    procedure cancelou;           override;
    procedure confirmouEdit;      override;
    procedure mostraPainelEdicao; override;
    procedure doOnPageControlEditarChange; override;
  public
    procedure Inicializar(aPopUp : TcxDBPopupEdit; aTabGeral:tDataset); override;
    { Public declarations }
  end;

var
  FrmPopupPrecoAuto: TFrmPopupPrecoAuto;

implementation

uses ncaDM, ncaFrmPri, ncIDRecursos;

{$R *.dfm}

procedure TFrmPopupPrecoAuto.butOkClick(Sender: TObject);
begin
    confirmouEdit;
end;

{ TFrmPopupCategoria }

procedure TFrmPopupPrecoAuto.doAfterDelete;
begin
    inherited
end;

function TFrmPopupPrecoAuto.doBeforeDelete: boolean;
begin
  result := inherited doBeforeDelete;
end;

function TFrmPopupPrecoAuto.doBeforeEdit: boolean;
begin
        fStatus := puEdit;
        result := true;
        mostraPainelEdicao;
end;

procedure TFrmPopupPrecoAuto.doOnPageControlEditarChange;
begin
   if pageControlEditar.ActivePage = tsGrid then
       Grid.SetFocus;
end;

procedure TFrmPopupPrecoAuto.InicializaDados;
var
  s1, s2 : string;
begin
  try
      fTabPrincipal := fPopUp.DataBinding.DataSource.DataSet;
      fTabPrincipalAfterScroll := GetMethodProp(fTabPrincipal, 'AfterScroll');
      fTabPrincipal.AfterScroll := tabPrincipalAfterScroll;
      dsPrincipal.DataSet := fTabPrincipal;

      fPopUp.DataBinding.DataSource := nil;
      fPopUp.Properties.LookupItems.Clear;
      {fPopUp.Properties.LookupItems.add(s);
      fPopUp.Properties.LookupItems.add('Sim');
      fPopUp.Properties.LookupItems.add('Não');
      fPopUp.Properties.IncrementalSearch := false;  }

      //fPopUp.DataBinding.DataSource := dsValores;
      //fPopUp.DataBinding.DataField := fNomeCampoTabelaValores;
      tabResult.active := true;
      tabResult.AppendRecord([0]);
      fPopUp.DataBinding.DataSource := dsResult;
      fPopUp.DataBinding.DataField := 'valor';
      CalcularValor;

      SetIniValue;

      if gConfig.PrecoAuto then
         s1 := ' (margem '+FormatFloat('##0.00', gConfig.Margem)+'%)'
      else
         s1 := ': MANUALMENTE para CADA protudo';
      s1 := 'Seguir padrão da loja'+ s1 ;

      if (fTabelaPrincipal.FieldByName('PrecoAuto').value=true) and
         (not fTabelaPrincipal.FieldByName('margem').isNull) then
         s2 := ' (' + FormatFloat('##0.00', fTabelaPrincipal.FieldByName('margem').asFloat)+'%)'
      else
         s2 := ' (margem a definir)';
      s2 := 'Preço fixado pela MARGEM para este produto'+ s2 ;

      tabValores.AfterScroll := nil;
      TabValores.active := true;
      tabValores.AppendRecord([s1, nil]);
      tabValores.AppendRecord([s2, true]);
      tabValores.AppendRecord(['Preço fixado MANUALMENTE para este produto', false]);
      tabValores.AfterScroll := tabValoresAfterScroll;

      edPodeAlterarPreco.OnDblClick := TVDblClick;
      edPodeAlterarPreco.OnKeyUp := TVKeyUp;
      edPodeAlterarPreco.Properties.ReadOnly := not Permitido(daProEditarPreco);

      edMargem.OnKeyUp := TVKeyUp;
      edPreco.OnKeyUp := TVKeyUp;

      TabValores.Locate(fNomeCampoTabelaValoresValor, fIniValue, [loCaseInsensitive]);
  finally
      fInicializado := True;
  end;
end;

procedure TFrmPopupPrecoAuto.Inicializar(aPopUp: TcxDBPopupEdit;
  aTabGeral: tDataset);
begin

    fNomeTabelaPrincipal      := 'produto';      // do not localize
    fNomeCampoTabelaPrincipal := 'PrecoAuto';    // do not localize
    fNomeTabelaValores        := '';    // do not localize
    fNomeCampoTabelaValores   := 'descricao';    // do not localize
    fNomeCampoTabelaValoresValor  := 'valor';    // do not localize
    //fDescricao                := SncaFrmPopupCategoria_Categoria;
    //fCannotDeleteText         := SncaFrmPopupCategoria_NãoéPossíve;
    //fCannotEditText           := SncaFrmPopupCategoria_EstaCategor;

    inherited;


    Height := 150;
    Width  := 500;
    fPopUp.Properties.PopupAutoSize := false;
    fPopUp.Properties.PopupWidth := Width;
    fPopUp.Properties.PopupHeight := Height;
    panPri.Padding.Top := 0;


    dxBarDockControl1.Visible := false;
    dxBarDockControl1.Align := dalBottom;

    dsValores.dataset := TabValores;
    TV.DataController.DataSource := dsValores;

end;

procedure TFrmPopupPrecoAuto.InitPopup;
begin
    pageControlEditar.ActivePage := tsGrid;
    CalcularValor;
    TabValores.Locate(fNomeCampoTabelaValoresValor, fTabelaPrincipal.FieldByName('PrecoAuto').value, [loCaseInsensitive]);

    fIniValueOk := true;
end;

procedure TFrmPopupPrecoAuto.mostraPainelEdicao;
begin
    inherited;

    edMargem.Value := 0;
    edPreco.Value := 0;
    if fStatus=puEdit then begin
        panEdMargem.visible := TabValores.FieldByName(fNomeCampoTabelaValoresValor).value = true;
        panEdPreco.visible := not panEdMargem.visible;
        if panEdMargem.visible then begin
            if not fTabPrincipal.FieldByName('margem').IsNull then
                edMargem.Value := fTabPrincipal.FieldByName('margem').value;
            //edMargem.SetFocus;
            edMargem.SelectAll;
        end;
        if panEdPreco.visible then begin
            if not fTabPrincipal.FieldByName('preco').IsNull then
                edPreco.Value := fTabPrincipal.FieldByName('preco').value;
            //edPreco.SetFocus;
            edPreco.SelectAll;
        end;
    end;

end;

procedure TFrmPopupPrecoAuto.selecionou;
begin
    if not (TabValores.IsEmpty) then begin
        fTabelaPrincipal.FieldByName('PrecoAuto').value :=
           TabValores.FieldByName(fNomeCampoTabelaValoresValor).value;
    end;
    inherited;
end;

procedure TFrmPopupPrecoAuto.SetIniValue;
begin
    fIniValue := fTabelaPrincipal.FieldByName('PrecoAuto').value;
    fIniValuePodeAlterar := fTabelaPrincipal.FieldByName('PodeAlterarPreco').value;
end;

procedure TFrmPopupPrecoAuto.CalcularValor;
var
      campoPreco : variant;
      temPreco : boolean;
      //campoPrecoCalc : variant;
      //temPrecoCalc : boolean;
      campoMargem : variant;
      temMargem : boolean;
      temPrecoAuto : boolean;
      isGlobalAuto    : boolean;
      isProdutoND     : boolean;
      //isProdutoAuto   : boolean;
      isProdutoManual : boolean;
begin
      fValue := 0;

      temPreco := not fTabelaPrincipal.FieldByName('Preco').isNull;
      campoPreco := fTabelaPrincipal.FieldByName('Preco').value;
      temMargem := not fTabelaPrincipal.FieldByName('Margem').isNull;
      campoMargem := fTabelaPrincipal.FieldByName('Margem').value;
      //temPrecoCalc := not fTabelaPrincipal.FieldByName('PrecoCalc').isNull;
      //campoPrecoCalc := fTabelaPrincipal.FieldByName('PrecoCalc').value;
      temPrecoAuto := (not fTabelaPrincipal.FieldByName('PrecoAuto').isNull) and
                      (fTabelaPrincipal.FieldByName('PrecoAuto').asBoolean);

      isGlobalAuto    := gConfig.PrecoAuto = true;
      isProdutoND     := TabValores.FieldByName(fNomeCampoTabelaValoresValor).isNull;
      //isProdutoAuto   := TabValores.FieldByName(fNomeCampoTabelaValoresValor).value = true;
      isProdutoManual := TabValores.FieldByName(fNomeCampoTabelaValoresValor).value = false;

      try
          if (isGlobalAuto) then begin
              if ((not isProdutoManual) or isProdutoND) and (gConfig.Margem>0) and (temPreco)  then begin
                  fValue := campoPreco + ((campoPreco * gConfig.Margem) / 100);
                  exit;
              end;
          end else begin
              if (temPrecoAuto) and (temMargem) and (temPreco)  then begin
                  fValue := campoPreco + ((campoPreco * campoMargem) / 100);
                  exit;
              end;
              if (isProdutoManual) and (temPreco)  then begin
                  fValue := campoPreco ;
                  exit;
              end;

          end;
      finally
          tabResult.Edit;
          tabResult.FieldByName('valor').value := fValue;
          tabResult.Post;
      end;
end;

procedure TFrmPopupPrecoAuto.cancelou;
begin
    fTabelaPrincipal.FieldByName('PrecoAuto').value := fIniValue;
    fTabelaPrincipal.FieldByName('PodeAlterarPreco').value := fIniValuePodeAlterar;
    TabValores.Locate(fNomeCampoTabelaValoresValor, fIniValue, [loCaseInsensitive]);
    inherited;
end;

procedure TFrmPopupPrecoAuto.confirmouEdit;
begin
    fTabPrincipal.edit;
    if TabValores.FieldByName(fNomeCampoTabelaValoresValor).value = true then
        fTabPrincipal.FieldByName('margem').value := edMargem.value
    else
        fTabPrincipal.FieldByName('preco').value := edPreco.value;
    fTabelaPrincipal.FieldByName('PrecoAuto').value := true;
    fTabPrincipal.post;
    fTabPrincipal.edit;
    FResult := true;

    CalcularValor;
    escondePainelEdicao;
    fStatus := puBrowse;
    fPopUp.DroppedDown := false;
end;

procedure TFrmPopupPrecoAuto.tabPrincipalAfterScroll(DataSet: TDataSet);
begin
    if fTabPrincipalAfterScroll.code<>nil then begin
        SetMethodProp(fTabPrincipal, 'AfterScroll', fTabPrincipalAfterScroll);        // do not localize
        try
            fTabPrincipal.AfterScroll(DataSet);
        finally
            fTabPrincipal.AfterScroll   := tabPrincipalAfterScroll;
        end;
    end;
    TabValores.Locate(fNomeCampoTabelaValoresValor, fTabPrincipal.fieldByName('PrecoAuto').value, [loCaseInsensitive]);
end;

procedure TFrmPopupPrecoAuto.tabValoresAfterScroll(DataSet: TDataSet);
begin
    if (fIniValueOk) and (not TabValores.FieldByName(fNomeCampoTabelaValoresValor).isNull) then
       SetStatus(puEdit)
    else
       CalcularValor
end;

end.

