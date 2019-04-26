unit ncaFrmPopUpEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFrmBasePai, dxBar, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxMaskEdit, cxCurrencyEdit, cxTextEdit, cxCalendar, cxMemo, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid,  cxDropDownEdit,
  nxdb, ncClassesBase, dxBarExtItems, cxDBEdit,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxInplaceContainer,
  cxVGrid, cxDBVGrid, cxImageComboBox, cxTimeEdit, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  cxContainer, cxLabel, Buttons, PngSpeedButton, StdCtrls, cxRadioGroup, Menus,
  cxLookAndFeels, cxLookAndFeelPainters, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, uParentedPanel, cxNavigator,
  dxPScxPivotGridLnk, uNexTransResourceStrings_PT, ufmFormBase,
  cxPCdxBarPopupMenu, cxPC, cxButtons, ncaFrmPopUpEditBase, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmPopUpEdit = class(TFrmPopUpEditBase)
    edItem: TcxTextEdit;
    TabValores: TnxTable;
    procedure TVDescricaoCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas:
        TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure TVDescricaoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
  private
    function  ItemsExistentesEmTabelaValores(aItem:string): integer;
    function  SubstituiItemEmTabelaPrincipal(aNewItem:string):boolean;
    { Private declarations }
  protected
    function  doBeforeDelete: boolean; override;
    function  doBeforeEdit: boolean; override;
    procedure doAfterDelete;     override;
    procedure InitPopup;         override;
    procedure AtualizaDireitos;  override;
    procedure FiltraDados;       override;
    procedure cancelarEdit;      override;
    procedure confirmouEdit;     override;
    procedure selecionou;        override;
    procedure cancelou;          override;
    procedure mostraPainelEdicao; override;
    procedure Inicializar(aPopUp : TcxDBPopupEdit; aTabela:tDataset); override;
    procedure InicializaDados; override;
    { Protected declarations }
  public
    { Public declarations }
  end;

var
  FrmPopUpEdit: TFrmPopUpEdit;

implementation

uses ncaDM, ufmImagens, ncaFrmPri,
  ncaFrmPass, ncIDRecursos, ncaFrmZerarTempo,
  ncaFrmSenha, ncaFrmCadCli, ncaFrmCadFornecedor,
  ncaFrmProduto, TypInfo;

{$R *.dfm}

procedure TFrmPopUpEdit.FiltraDados;
begin
    if not TabValores.Active then TabValores.Active := True;

    inherited;

    dsValores.dataset := TabValores;
    TV.DataController.DataSource := dsValores;
end;

procedure TFrmPopUpEdit.Inicializar(aPopUp : TcxDBPopupEdit; aTabela:tDataset);
begin
    inherited;

    if not fInicializado then
        InicializaDados;

    TVDescricao.OnCustomDrawCell := TVDescricaoCustomDrawCell;
    TVDescricao.OnGetDisplayText := TVDescricaoGetDisplayText;

    AtualizaDireitos;
    FiltraDados;

    FResult := false;
end;

procedure TFrmPopUpEdit.InicializaDados;
var
  sItem : string;
begin
    TabValores.Tablename := fNomeTabelaValores;
    TabValores.active := true;
    try
        query.SQL.Text := 'Select Distinct("'+fNomeCampoTabelaPrincipal+'") From "'+fNomeTabelaPrincipal+'"'; // do not localize
        query.Open;
        while not query.Eof do begin
            sItem := '';
            if not query.Fields[0].isnull then
                sItem := query.Fields[0].Value;
            if (trim(sItem)<>'') and
               (not TabValores.Locate(fNomeCampoTabelaValores, sItem, [loCaseInsensitive])) then
                TabValores.InsertRecord([sItem]);
            query.Next;
        end;
        query.close;
        if not TabValores.Locate(fNomeCampoTabelaValores, '', [loCaseInsensitive]) then
            TabValores.InsertRecord(['']);

        edItem.Properties.MaxLength :=
            fTabelaPrincipal.FieldByName(fNomeCampoTabelaPrincipal).Size;

    finally
        fInicializado := True;
    end;
end;

procedure TFrmPopUpEdit.AtualizaDireitos;
begin
      inherited;

      if TabValores.Active then TabValores.Refresh;
end;

procedure TFrmPopUpEdit.mostraPainelEdicao;
begin
    inherited;

    edItem.text := '';
    if fStatus=puEdit then begin
       if trim(TabValores.FieldByName(fNomeCampoTabelaValores).asstring)>'' then
           edItem.text := TabValores.FieldByName(fNomeCampoTabelaValores).asstring;
       edItem.SelectAll;
    end;

end;

procedure TFrmPopUpEdit.cancelarEdit;
begin
    inherited;
end;

procedure TFrmPopUpEdit.confirmouEdit;
begin
    FResult := false;
    if ItemsExistentesEmTabelaValores(edItem.text)=0 then begin

        if fStatus = puInsert then begin
            TabValores.InsertRecord([edItem.text]);
            fTabelaPrincipal.FieldByName(fNomeCampoTabelaPrincipal).asstring := edItem.text;
            FResult := true;
        end else begin
            if SubstituiItemEmTabelaPrincipal(edItem.text) then begin
                TabValores.edit;
                TabValores.FieldByName(fNomeCampoTabelaValores).asstring := edItem.text;
                TabValores.post;
                fTabelaPrincipal.FieldByName(fNomeCampoTabelaPrincipal).asstring := edItem.text;
                FResult := true;
            end;
        end;

        if FResult then begin
            escondePainelEdicao;
            fStatus := puBrowse;
        end;

    end else begin
        ShowMsg(fCannotEditText);
        edItem.Setfocus;
    end;

end;

function TFrmPopUpEdit.ItemsExistentesEmTabelaValores(aItem:string): integer;
begin
    result := 0;
    try
        query.SQL.Text := 'Select count("'+fNomeCampoTabelaValores+'") From "'+ // do not localize
            fNomeTabelaValores+'" where '+fNomeCampoTabelaValores+'=:par1'; // do not localize
        query.ParamByName('par1').AsString := aItem; // do not localize
        query.open;
        result := query.fields[0].asInteger;
        query.close;
    except
    end;
end;


function  TFrmPopUpEdit.SubstituiItemEmTabelaPrincipal(aNewItem:string):boolean;
begin
    result := true;
    try
        query.SQL.Text := 'update "'+fNomeTabelaPrincipal+'" set "'+    // do not localize
            fNomeCampoTabelaPrincipal+'"=:parNewValue where "'+         // do not localize
            fNomeCampoTabelaPrincipal+'"=:parOldValue';                 // do not localize
        query.ParamByName('parOldValue').AsString := fTabelaPrincipal.FieldByName(fNomeCampoTabelaPrincipal).asstring; // do not localize
        query.ParamByName('parNewValue').AsString := aNewItem; // do not localize
        query.execSql;
    except
        result := false;
    end;
end;

procedure TFrmPopUpEdit.selecionou;
begin
    if not (TabValores.FieldByName(fNomeCampoTabelaValores).IsNull or
            TabValores.IsEmpty) then begin
        fTabelaPrincipal.FieldByName(fNomeCampoTabelaPrincipal).asstring :=
           TabValores.FieldByName(fNomeCampoTabelaValores).asstring;
    end;
    inherited;
end;

procedure TFrmPopUpEdit.cancelou;
begin
    inherited;
end;

procedure TFrmPopUpEdit.TVDescricaoCustomDrawCell(Sender:
    TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo:
    TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.DisplayValue='' then begin
        ACanvas.Brush.Color := clYellow;
        if AViewInfo.Selected then
           ACanvas.Font.Color := clNavy;
    end;
end;

procedure TFrmPopUpEdit.TVDescricaoGetDisplayText(Sender:
    TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
    if AText='' then  AText := '('+SncaFrmPopUpEdit_ProdutoSem+fDescricao+')';

end;

procedure TFrmPopUpEdit.InitPopup;
begin

    if not (fTabelaPrincipal.FieldByName(fNomeCampoTabelaPrincipal).IsNull or
            TabValores.IsEmpty) then begin
        TabValores.Locate(fNomeCampoTabelaValores, fTabelaPrincipal.FieldByName(fNomeCampoTabelaPrincipal).asstring, [loCaseInsensitive]);
    end;

end;

procedure TFrmPopUpEdit.doAfterDelete;
begin
        TabValores.Delete;
end;

function TFrmPopUpEdit.doBeforeDelete: boolean;
var
    valorItem : string;
begin
    result := false;
    valorItem := TabValores.FieldByName(fNomeCampoTabelaValores).asstring;
    if (not TabValores.IsEmpty) and
       (SimNao( SncaFrmCliPesq_ConfirmaAExclusãoDe +
                valorItem + ' ?')
       ) then begin
          if ItemsExistentesEmTabelaPrincipal(valorItem)<2 then begin
              result := true;
          end else begin
              ShowMsg(fCannotDeleteText);
          end;
       end;
end;

function TFrmPopUpEdit.doBeforeEdit: boolean;
begin
    result := false;
    if (trim(TabValores.FieldByName(fNomeCampoTabelaValores).asstring)>'') then begin
        fStatus := puEdit;
        result := true;
        mostraPainelEdicao;
    end;
end;

end.


