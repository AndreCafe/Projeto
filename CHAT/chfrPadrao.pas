unit chfrPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, chfrBase, cxLookAndFeelPainters, cxSplitter, cxMemo, StdCtrls,
  cxButtons, cxLabel, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Buttons, ExtCtrls, cxControls, cxPC, chpcConversas,
  Menus, cxImageComboBox, LMDCustomScrollBox, LMDScrollBox, lmdsplt,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, cxGraphics;

type
  TchFramePadrao = class(TchFrameBase)
    PopupMenu1: TPopupMenu;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    btnMsgPend: TcxButton;
    cxLabel1: TcxLabel;
    cbPara: TcxImageComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    btnEnviar: TcxButton;
    meEnviar: TcxMemo;
    procedure btnEnviarClick(Sender: TObject);
    procedure Panel5Resize(Sender: TObject);
    procedure cbParaPropertiesChange(Sender: TObject);
    procedure ConversasChange(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
  private
    { Private declarations }
    FSincContato,
    FSincConversa: Boolean;
    function GetNodeIDAtivo: String;
    procedure SetNodeIDAtivo(const Value: String);
  protected
     procedure fOnMsg(Sender: TObject; ANodeID: String; AMsg: String); override;
     procedure fOnNodeLogin(Sender: TObject; ANodeID: String); override;
     procedure fOnNodeLogout(Sender: TObject; ANodeID: String); override;
     procedure fOnLogin(Sender: TObject); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure AjustaBtnEnviar;
    procedure SincronizaContato;
    procedure SincronizaConversa;
    property NodeIDAtivo: String
      read GetNodeIDAtivo write SetNodeIDAtivo;
    { Public declarations }
  end;

  procedure Register;

var
  chFramePadrao: TchFramePadrao;

implementation

uses 
  chBase, chfrConversaRV, chfrConversa;

{$R *.dfm}

procedure TchFramePadrao.AjustaBtnEnviar;
var NI: TchNodeInfo;
begin
  btnEnviar.Enabled := ClienteChat.Conectado and 
                       (cbPara.ItemIndex<>-1) and
                       ClienteChat.GetNodeInfo(NodeIDAtivo, NI) and
                       (NI.niStatus<>stOffLine);
  spConversas.Visible := (Conversas.PageCount>0);                       
end;

procedure TchFramePadrao.btnEnviarClick(Sender: TObject);
begin
  if (cbPara.EditValue<>Null) and (cbPara.EditValue>'') and
     (meEnviar.Lines.Text>'') then
    EnviaMsg(cbPara.EditValue, meEnviar.Lines.Text);
  meEnviar.Clear;
  meEnviar.SetFocus;  
  spConversas.Visible := (Conversas.PageCount>0);
end;

constructor TchFramePadrao.Create(AOwner: TComponent);
begin
  inherited;
  FSincContato := False;
  FSincConversa:= False;
  Conversas.ClasseFrameConversa := TchFrameConversaRV;
end;

procedure TchFramePadrao.fOnLogin(Sender: TObject);
var 
  Item : TcxImageComboBoxItem;
begin
  with ClienteChat.Nodes do begin
    First;
    cbPara.Properties.Items.Clear;
    while not Eof do begin
      Item := TcxImageComboBoxItem(cbPara.Properties.Items.Add);
      Item.Value := FieldByName('NodeID').AsString;
      Item.Description := FieldByName('Nome').AsString;
      if Trim(Item.Description) = '' then  
        Item.Description := '(Desconhecido)';
      Next;
    end;
  end;  
  inherited;
  if cbPara.ItemIndex=-1 then
    cbPara.ItemIndex := 0;
end;

procedure TchFramePadrao.fOnNodeLogin(Sender: TObject; ANodeID: String);
var 
  Item : TcxImageComboBoxItem;
  NI : TchNodeInfo;
begin
  if not ClienteChat.GetNodeInfo(ANodeID, NI) then Exit;
  cbPara.Properties.BeginUpdate;
  try
    Item := TcxImageComboBoxItem(cbPara.Properties.Items.Add);
    Item.Value := ANodeID;
    Item.Description := NI.niNome;
    if Trim(Item.Description) = '' then  
      Item.Description := '(Desconhecido)';
  finally
    cbPara.Properties.EndUpdate(False);
  end;   
  inherited;  
  if cbPara.ItemIndex=-1 then
    cbPara.ItemIndex := 0; 
end;

procedure TchFramePadrao.fOnNodeLogout(Sender: TObject; ANodeID: String);
var 
  I : Integer;
  C : TchFrameConversa;
begin
  with cbPara.Properties do
  for I := 0 to Items.Count-1 do 
    with TcxImageComboBoxItem(Items[I]) do
      if Value = ANodeID then begin
        C := Conversas.ConversaPorNodeID(ANodeID);
        if (C=nil) or C.Vazia then begin
          Items.Delete(I);
          if C<>nil then C.Fechar;
          Conversas.Refresh;
        end else
        if C<>nil then 
          C.AtualizaNodeInfo;
        AjustaBtnEnviar;  
        Exit;
      end; 
  inherited;     
end;

procedure Register;
begin
  RegisterComponents('Standard', [TchFramePadrao]);
end;

procedure TchFramePadrao.Panel5Resize(Sender: TObject);
begin
  inherited;
  btnEnviar.Top := (Panel5.Height - btnEnviar.Height) div 2;
end;

procedure TchFramePadrao.cbParaPropertiesChange(Sender: TObject);
begin
  inherited;
  SincronizaConversa;
  AjustaBtnEnviar;
end;

procedure TchFramePadrao.ConversasChange(Sender: TObject);
begin
  SincronizaContato;
  spConversas.Visible := (Conversas.PageCount>0);
end;

procedure TchFramePadrao.SincronizaConversa;
begin
  if FSincConversa then Exit;
  FSincConversa := True;
  try
    if (cbPara.EditValue<>Null) and (cbPara.EditValue>'') then 
      Conversas.MostraNodeID(cbPara.EditValue, (Conversas.PageCount>0));
    spConversas.Visible := (Conversas.PageCount>0);  
  finally
    FSincConversa := False;
  end;
end;

procedure TchFramePadrao.SincronizaContato; 
begin
  if FSincContato then Exit;
  FSincContato := True;
  try
    if Conversas.ActiveNodeID>'' then
      cbPara.EditValue := Conversas.ActiveNodeID
    else
    if cbPara.Properties.Items.Count>0 then
      cbPara.ItemIndex := 0
    else
      cbPara.ItemIndex := -1;   
    AjustaBtnEnviar;
  finally
    FSincContato := False;
  end;      
end;

function TchFramePadrao.GetNodeIDAtivo: String;
begin
  Result := cbPara.EditValue;
end;

procedure TchFramePadrao.SetNodeIDAtivo(const Value: String);
begin
  if Value = cbPara.EditValue then Exit;
  
end;

procedure TchFramePadrao.fOnMsg(Sender: TObject; ANodeID, AMsg: String);
begin
  inherited;
  spConversas.Visible := (Conversas.PageCount>0);
end;

procedure TchFramePadrao.Panel3Resize(Sender: TObject);
begin
  inherited;
  cbPara.Width := Panel3.Width - 78;
  btnMsgPend.Left := Panel3.Width - 31;
end;

end.
