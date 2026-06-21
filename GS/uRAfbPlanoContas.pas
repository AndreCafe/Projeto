unit uRAfbPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, 
  ExtCtrls, DB, dxBar, dxBarExtItems, cxGridCustomPopupMenu,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, cxCheckBox,
  cxInplaceContainer, cxDBTL, cxControls, cxTLData, cxGridPopupMenu;

type
  TfbPC = class(TFrmBase)
    cmOk: TdxBarButton;
    cmCancelar: TdxBarButton;
    TL: TcxDBTreeList;
    cxDBTreeList1Nome: TcxDBTreeListColumn;
    cxDBTreeList1Sintetico: TcxDBTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    procedure TLDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cmEditarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmAtualizarClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmOkClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FrmBasePaiClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FID    : ^Integer;
    FNome  : ^String;
  public  
    class function Descricao: String; override;
    
    procedure Atualizar; 
    procedure Localizar(var ID: Integer; var Nome: String);
    { Public declarations }
  end;

var
  fbPC: TfbPC;

implementation

uses uRADM, uRAPri, uRAFrmPC;

{$R *.dfm}

{ TfbPC }

procedure TfbPC.Atualizar;
begin
  inherited;
  with DM.qPC do begin
    DisableControls;
    try
      if State in [dsEdit, dsInsert] then
        Post;

      Close;
      Open;
    
      if not Locate('ID', 0, []) then begin
        Insert;
        FieldByName('ID').AsInteger := 0;
        FieldByName('Pai').AsInteger := 0;
        FieldByName('Nome').AsString := 'Plano de Contas';
        FieldByName('Sintetico').AsBoolean := True;
        Post;
      end;
    finally
      EnableControls;
    end;    
  end;  
  TL.FullExpand;  
end;

class function TfbPC.Descricao: String;
begin
  Result := 'Plano de Contas';
end;

procedure TfbPC.TLDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (DM.qPCID.Value<>0);
end;

procedure TfbPC.cmEditarClick(Sender: TObject);
begin
  inherited;
  if DM.qPCID.Value <> 0 then
    TFrmPC.Create(Self).Editar;
end;

procedure TfbPC.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmPC.Create(Self).Novo;
end;

procedure TfbPC.cmApagarClick(Sender: TObject);
begin
  inherited;
  if DM.qPCID.Value <> 0 then
    DM.qPC.Delete;
end;

procedure TfbPC.cmAtualizarClick(Sender: TObject);
begin
  inherited;
  Atualizar;
end;

procedure TfbPC.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  Atualizar;
  FID := nil;
  FNome := nil;
end;

procedure TfbPC.Localizar(var ID: Integer; var Nome: String);
begin
  FID := @ID;
  FNome := @Nome;
  if ID>0 then 
    DM.qPC.Locate('ID', ID, []);
  BarMgr.BarByName('BarraComum').Visible := False;  
  ShowModal;
end;

procedure TfbPC.cmOkClick(Sender: TObject);
begin
  inherited;
  Close;
  FID^ := DM.qPCID.Value;
  FNome^ := DM.qPCNome.Value;
end;

procedure TfbPC.cmCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfbPC.FrmBasePaiClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
