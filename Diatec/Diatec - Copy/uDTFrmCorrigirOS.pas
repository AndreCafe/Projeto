unit uDTFrmCorrigirOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, cxMaskEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxTextEdit, StdCtrls,
  cxButtons, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxContainer, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxPC, cxButtonEdit, kbmMemTable;

type
  TFrmCorrigirOS = class(TForm)
    cxPageControl1: TcxPageControl;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edNovoProj: TcxLookupComboBox;
    btnSalvar: TcxButton;
    cxButton1: TcxButton;
    edProjAtual: TcxTextEdit;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVHoras1: TcxGridDBColumn;
    TVNomeFase1: TcxGridDBColumn;
    GL: TcxGridLevel;
    TVColumn1: TcxGridDBColumn;
    cxLabel3: TcxLabel;
    MT: TkbmMemTable;
    MTHoras: TDateTimeField;
    MTFase: TStringField;
    MTItem: TIntegerField;
    MTNomeFase: TStringField;
    MTNovaFase: TStringField;
    MTNomeNovaFase: TStringField;
    DS: TDataSource;
    procedure edNovoProjPropertiesPopup(Sender: TObject);
    procedure edNovoProjPropertiesCloseUp(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure TVColumn1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FNovoProj : String;

    procedure LoadItens;
    procedure SaveItens;
  public
    procedure Editar;
    { Public declarations }
  end;

var
  FrmCorrigirOS: TFrmCorrigirOS;

implementation

uses uDTDM, uNovaFase;

{$R *.dfm}

procedure TFrmCorrigirOS.btnSalvarClick(Sender: TObject);
begin
  if edNovoProj.EditValue=null then begin
    edNovoProj.SetFocus;
    Raise Exception.Create('É necessário selecionar um novo projeto');
  end;

  MT.First;
  while not MT.Eof do begin
    if MTNovaFase.Value='' then
      raise exception.create('É necessário selecionar a nova fase de cada apontamento');
    MT.Next;
  end;

  with DM do begin
    nxDB.StartTransaction;
    try
      tOS.Edit;
      tOSProjeto.Value := FNovoProj;
      tOS.Post;

      SaveItens;
    
      nxDB.Commit;
    except
      nxDB.Rollback;
      Raise;
    end;
  end;

  Close;
end;

procedure TFrmCorrigirOS.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCorrigirOS.Editar;
begin
  with DM do
  try
    if tOS.IsEmpty then raise exception.Create('Não há uma OS para corrigir');

    if not qCli.Locate('ID', tOSCliente.Value, []) then Exit;
    if not tProj.Locate('Cliente;ID', VarArrayOf([tOSCliente.Value, tOSProjeto.Value]), []) then Exit;

    edProjAtual.Text := tProjNome.Value;

    LoadItens;
    
    ShowModal;
  except
    Free;
    Raise;
  end;
end;

procedure TFrmCorrigirOS.edNovoProjPropertiesCloseUp(Sender: TObject);
begin
  if DM.tProjID.Value<>FNovoProj then begin
    MT.First;
    while not MT.Eof do begin
      MT.Edit;
      MTNovaFase.Clear;
      MTNomeNovaFase.Clear;
      MT.Post;
      MT.Next;
    end;
  end;
end;

procedure TFrmCorrigirOS.edNovoProjPropertiesPopup(Sender: TObject);
begin
  FNovoProj := DM.tProjID.Value;
end;

procedure TFrmCorrigirOS.FormCreate(Sender: TObject);
begin
  FNovoProj := '';
  MT.Active := True;
end;

procedure TFrmCorrigirOS.LoadItens;
begin
  with DM do begin
    tOSItens.First;
    MT.EmptyTable;
    while not tOSItens.Eof do begin
      MT.Append;
      MTHoras.Value := tOSItensHoras.Value;
      MTItem.Value := tOSItensItem.Value;
      MTFase.Value := tOSItensFase.Value;
      MTNomeFase.AsVariant := tFase.Lookup('Cliente;Projeto;ID', VarArrayOf([tOSItensCliente.Value, tOSItensProjeto.Value, tOSItensFase.Value]), 'Nome');
      MT.Post;
      tOSItens.Next;
    end;
  end;
end;

procedure TFrmCorrigirOS.SaveItens;
begin
  with DM do begin
    tOSItens.First;
    MT.First;
    while not tOSItens.Eof do begin
      tOSItens.Edit;
      tOSItensProjeto.Value := FNovoProj;
      tOSItensFase.Value := MTNovaFase.Value;
      tOSItens.Post;
      
      tOSItens.Next;
      MT.Next;
    end;
  end;
end;

procedure TFrmCorrigirOS.TVColumn1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var S: String;  
begin
  if FNovoProj='' then raise exception.Create('É necessário definir o novo projeto');
  
  with DM do 
    if not tOSItens.Locate('Cliente;Projeto;Fase;Tecnico;Item',
                           VarArrayOf([tProjCliente.Value,
                                       tProjID.Value,
                                       MTFase.Value,
                                       tOSTecnico.Value,
                                       MTItem.Value]), []) then
      raise Exception.Create('Erro: Apontamento não encontrado!');
                                             
  S := TFrmNovaFase.Create(Self).ObtemFase;
  if S<>'' then begin
    MT.Edit;
    MTNovaFase.Value := S;
    MTNomeNovaFase.Value := DM.tFaseNome.Value;
    MT.Post;
  end;

end;

end.
