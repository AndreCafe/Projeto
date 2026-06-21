unit uCMfbgMaquinas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCMFrmBaseGrid, dxBar, dxBarExtItems, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  {$ifdef Ver150}
  Variants,
  {$endif}
  dxDBTLCl, dxGrClms, ExtCtrls, ImgList, Db, nxdb, dxExEdtr, Menus,
  am2000menuitem, am2000utils, am2000popupmenu, am2000, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, am2000mainmenu;

type
  TfbgMaquinas = class(TFrmBaseGrid)
    Timer1: TTimer;
    cmInicia: TdxBarLargeButton;
    cmFinalizar: TdxBarLargeButton;
    ImageList1: TImageList;
    cmCapturar: TdxBarLargeButton;
    cmParar: TdxBarLargeButton;
    cmTransferir: TdxBarLargeButton;
    cmDesligar: TdxBarLargeButton;
    cmEditarAcesso: TdxBarLargeButton;
    cmMaquinasDest: TdxBarListItem;
    pmTransf: TdxBarPopupMenu;
    cmVenda: TdxBarLargeButton;
    tAcesso: TnxTable;
    cmVendeTempo: TdxBarLargeButton;
    cmSubLayout: TdxBarSubItem;
    GridNumero: TdxDBGridMaskColumn;
    GridNome: TdxDBGridMaskColumn;
    GridInicio: TdxDBGridColumn;
    GridInicioTicks: TdxDBGridMaskColumn;
    GridAcesso: TdxDBGridMaskColumn;
    GridParado: TdxDBGridCheckColumn;
    GridLimiteTempo: TdxDBGridColumn;
    GridNomeTipoAcesso: TdxDBGridLookupColumn;
    GridSinal: TdxDBGridCurrencyColumn;
    GridObsAcesso: TdxDBGridColumn;
    GridAguardaPagto: TdxDBGridCheckColumn;
    GridConectado: TdxDBGridImageColumn;
    procedure GridInicioGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure GridNumeroCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure GridCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure cmIniciaClick(Sender: TObject);
    procedure cmFinalizarClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridValorGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure cmCapturarClick(Sender: TObject);
    procedure cmPararClick(Sender: TObject);
    procedure cmEditarAcessoClick(Sender: TObject);
    procedure cmTransferirClick(Sender: TObject);
    procedure cmMaquinasDestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmDesligarClick(Sender: TObject);
    procedure cmVendaClick(Sender: TObject);
    procedure cmVendeTempoClick(Sender: TObject);
    procedure GridStatusGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
  private
    { Private declarations }
  public
    procedure Novo; override;
    procedure Apagar; override;
    procedure Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant); override;
    procedure AplicaDireitosUsuario; Override;
    
    
    { Public declarations }
  end;

var
  fbgMaquinas: TfbgMaquinas;

implementation

uses cmIDRecursos, uCMFrmCredito, uCMDados, cmClassesBase, uCMFrmCapt, uCMFrmAcesso,
  uCMFrmPri, uCMAShutdown, uCMFrmVendaPac, uLicenca;

{$R *.DFM}

procedure TfbgMaquinas.GridInicioGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
  inherited;
  if AText = '00:00:00' then
    AText := '';
end;

procedure TfbgMaquinas.GridNumeroCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  V : Variant;
  M : TCMMaquina;  
begin
  inherited;
  V := ANode.Values[GridNumero.Index];
  if (V = null) or (V=0) then Exit;
  M := Dados.CM.Maquinas.PorNumero[V];
  if M=nil then Exit;
  with Dados.CM.Config do
  if M.Acesso>0 then begin
    if M.Parado or M.ParadoPacote then begin
      AColor := CorPausado;
      AFont.Color := CorFPausado;
    end else  
    if M.AguardaPagto then begin
      AColor := CorAguardaPagto;
      AFont.Color := CorFAguardaPagto;
    end else begin
      if (M.CreditoTotal>5000) or (M.Sinal>0.0009) then begin
        AColor := CorUsoPrePago;
        AFont.Color := CorFUsoPrePago;
      end else begin
        AColor := CorUsoPosPago;
        AFont.Color := CorFUsoPosPago;
      end;  
    end;  
  end else
  if M.Manutencao then begin
    AColor := CorManutencao;
    AFont.Color := CorFManutencao;
  end else begin
    AColor := CorLivre;
    AFont.Color := CorFLivre;
  end;  
end;

procedure TfbgMaquinas.Timer1Timer(Sender: TObject);
begin
  try
    Grid.Refresh;
  except
  end;  
end;

procedure TfbgMaquinas.GridCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  V : Variant; 
  Maq : TCMMaquina;
  Valor : Double;
  Tempo, TempoCobrado, CredUsado : Cardinal;
  TA : TCMTipoAcesso;
begin
  inherited;
  if (AColumn <> GridTempo) then Exit;
  AText := '';
  V := ANode.Values[GridNumero.Index];
  if (V = null) or (V=0) then Exit;
  Maq := Dados.CM.Maquinas.PorNumero[V];
  if Maq=nil then Exit;
    
  Tempo := Maq.NumTicks;
  if Maq.Acesso>0 then with Dados.CM do begin
    TA := TiposAcesso.PorCodigo[Maq.TipoAcesso];
    if TA = nil then
      AText := 'ERRO'
    else begin
      Maq.Calculo(Tempo, TempoCobrado, CredUsado, Valor, 
                  TA.PHoraCor^, CorPrecos, Config.PacoteTempoReal);
      if Config.MostraPrePagoDec then
      if (Maq.LimiteTempo>0) and (Tempo<=Maq.LimiteTempo) and (Maq.CreditoTotal<10000) then
        Tempo := Maq.LimiteTempo - Tempo;
    end;              
  end;  

  if (Maq.Acesso>0) or Maq.Manutencao then
    AText := TicksToHMSSt(Tempo);
end;

procedure TfbgMaquinas.cmIniciaClick(Sender: TObject);
var M : TCMMaquina;
begin
  inherited;
  with Dados do begin
    M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
    if (M<>nil) and (M.Acesso>0) then begin
      if M.Parado then begin
        CM.PararMaq(M.Numero, False);
        Exit;
      end else
      if M.ParadoPacote then begin
        CM.LiberarAlemPacote(M.Numero);
        Exit;
      end;
    end;  
  end;  
    
  with Dados do
  if mtMaquinaAcesso.Value > 0 then begin
    Beep;
    if mtMaquinaAguardaPagto.Value then 
      ShowMessage('Para iniciar um novo acesso nessa máquina é necessário registrar o pagamento. '+
                  'Você poderá registrar o pagamento através do duplo-clique ou do botão "Editar"')
                  
    else
      ShowMessage('Já existe um acesso em andamento na máquina '+mtMaquinaNumero.AsString);
    Exit;
  end;
      
  TFrmAcesso.Create(Self).Iniciar;
end;

procedure TfbgMaquinas.cmFinalizarClick(Sender: TObject);
begin
  inherited;
  with Dados do begin
    if (mtMaquinaAcesso.Value < 1) and (not mtMaquinaManutencao.Value) then begin
      Beep;
      ShowMessage('Não existe acesso em andamento na máquina '+mtMaquinaNumero.AsString);
      Exit;
    end;

    if mtMaquinaAguardaPagto.Value then begin
      Beep;
      ShowMessage('O Acesso para essa máquina já foi finalizado e aguarda pagamento. '+
                  'Você poderá registrar o pagamento através do duplo-clique ou do botão "Editar"');
      Exit;
    end;
  
    if MessageDlg('Deseja realmente finalizar o acesso na máquina ' +
                  mtMaquinaNumero.AsString + ' ?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin
      if mtMaquinaManutencao.Value then
        CM.ModoManutencao(mtMaquinaNumero.Value, False)
      else begin              
        CM.LogoutMaq(mtMaquinaNumero.Value);
        ListaAcessoFin.Add(mtMaquinaAcesso.AsString);
      end;  
    end;  
  end;      
end;

procedure TfbgMaquinas.GridDblClick(Sender: TObject);
begin
  inherited;
  if NumAberto<1 then begin
    Beep;
    ShowMessage('Caixa está fechado!');
    Exit;
  end;
    
  with Dados do   
  if (not mtMaquinaManutencao.Value) and (mtMaquinaAcesso.Value < 1) then 
    cmIniciaClick(nil)
  else
  if mtMaquinaAguardaPagto.Value then begin
    if tAcesso.FindKey([mtMaquinaAcesso.Value]) then
      TFrmAcesso.Create(Self).Editar(Self.tAcesso, 2);
  end else  
    cmFinalizarClick(nil);
end;

procedure TfbgMaquinas.GridValorGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
var
  V : Variant; 
  Maq : TCMMaquina;
  Valor : Double;
  Tempo, TempoCobrado, CredUsado : Cardinal;
  TA : TCMTipoAcesso;
begin
  V := ANode.Values[GridAcesso.Index];
  if V = null then Exit;
  
  if V>0 then begin
    V := ANode.Values[GridNumero.Index];
    if V=null then Exit;
    Maq := Dados.CM.Maquinas.PorNumero[V];
    if Maq=nil then Exit;
    
    Tempo := Maq.NumTicks;
    with Dados.CM do begin  
      TA := TiposAcesso.PorCodigo[Maq.TipoAcesso];
      if TA=nil then 
        Valor := 0
      else  
        Maq.Calculo(Tempo, TempoCobrado, CredUsado, Valor, 
                    TA.PHoraCor^, CorPrecos, Config.PacoteTempoReal);
    end;  

    if Maq.Vendas > 0.00009 then
      Valor := Valor + Maq.Vendas;
      
    AText := FloatToStrF(Valor, ffCurrency, 10, 2);
//    while not (AText[1] in ['0'..'9']) do Delete(AText, 1, 1);
  end else
    AText := '';
end;

procedure TfbgMaquinas.Apagar;
var M : TCMMaquina;
begin
  inherited;
  with Dados do begin
    if mtMaquina.RecordCount=0 then Exit;
    if mtMaquinaAcesso.Value>0 then begin
      Beep;
      ShowMessage('Não é possível apagar uma máquina com acesso em andamento');
      Exit;
    end;  
    M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
    if M<>nil then
    if MessageDlg('Confirma a exclusão da Máquina '+mtMaquinaNumero.AsString, mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
      CM.ApagaObj(M);
  end;    
end;

procedure TfbgMaquinas.Novo;
var 
  Num: String;
  I  : Integer;
  M : TCMMaquina;
  sMenu : String;
begin
  inherited;
  with Dados do begin
    if LicencaGlobal.EmModoDemo and (CM.Maquinas.Count>1) then begin
      Beep;
      ShowMessage('O Cyber-Manager está sendo executado em modo Demonstração e estará limitado ao controle de duas máquinas.');  
      Exit;
    end;
    
    if CM.Maquinas.Count > 0 then
      M := CM.Maquinas[pred(CM.Maquinas.Count)]
    else
      M := nil;

        
    if (M<>nil) then begin
      Num := IntToStr(M.Numero+1);
      sMenu := M.Menu;
    end  else begin
      Num := '1';
      sMenu := '';
    end;
      
    if InputQuery(Application.Title, 'Número da nova máquina: ', Num) then begin
      I := StrToIntDef(Num, 0);
      if I=0 then Exit;
      M := TCMMaquina.Create(True);
      M.Numero := I;
      M.Menu := sMenu;
      try
        CM.SalvaAlteracoesObj(M, True);
      finally
        M.Free;
      end;    
    end;  
    
  end;    
end;

procedure TfbgMaquinas.cmCapturarClick(Sender: TObject);
begin
  inherited;
  with Dados do 
  if mtMaquinaConectado.Value then
    TFrmCapt.Create(Self).Capturar(mtMaquinaNumero.Value);
end;

procedure TfbgMaquinas.cmPararClick(Sender: TObject);
var M: TCMMaquina;
begin
  inherited;
  with Dados do begin
    M := CM.Maquinas.PorNumero[mtMaquinaNumero.Value];
    if (M=nil) or (M.Acesso=0) then Exit;
    CM.PararMaq(M.Numero, not M.Parado);
  end;  
end;

procedure TfbgMaquinas.cmEditarAcessoClick(Sender: TObject);
begin
  tAcesso.Refresh;
  with Dados do
  if (mtMaquinaAcesso.Value>0) and tAcesso.FindKey([mtMaquinaAcesso.Value]) then
  if mtMaquinaAguardaPagto.Value then
    TFrmAcesso.Create(Self).Editar(Self.tAcesso, 2)
  else  
    TFrmAcesso.Create(Self).Editar(Self.tAcesso, 0);
end;

procedure TfbgMaquinas.cmTransferirClick(Sender: TObject);
var I : Integer;
begin
  inherited;
  with Dados, CM do begin
    if (mtMaquinaAcesso.Value=0) or mtMaquinaAguardaPagto.Value then Exit;
    cmMaquinasDest.Items.Clear;
    for I := 0 to pred(Maquinas.Count) do with Maquinas.Itens[I] do
    if Acesso=0 then 
      cmMaquinasDest.Items.AddObject('Máquina '+IntToStr(Numero), TObject(Numero));
  end;
  pmTransf.PopupFromCursorPos;
end;

procedure TfbgMaquinas.cmMaquinasDestClick(Sender: TObject);
var NumD: Integer;
begin
  inherited;
  with cmMaquinasDest do
  NumD := Integer(Items.Objects[ItemIndex]);

  with Dados, CM do 
  if MessageDlg('Confirma transferência do acesso da máquina ' + 
                mtMaquinaNumero.AsString + ' para a máquina '+IntToStr(NumD)+' ?', 
                mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
    TransferirMaq(mtMaquinaNumero.Value, NumD);
end;

procedure TfbgMaquinas.FormCreate(Sender: TObject);
begin
  inherited;
  if not Dados.CM.Config.VariosTiposAcesso then begin
    GridNomeTipoAcesso.Visible := False;
    GridNomeTipoAcesso.DisableCustomizing := True;
  end;  
  tAcesso.Open;
end;

procedure TfbgMaquinas.Inicializar(DentroTab: Boolean; aTipoFiltro: Byte; aFiltro: Variant);
begin
  if Dados.CM.Config.PermiteCapturaTela and Permitido(daCapturar) then
    cmCapturar.Visible := ivAlways
  else
    cmCapturar.Visible := ivNever;
      
  inherited;
end;

procedure TfbgMaquinas.cmDesligarClick(Sender: TObject);
begin
  with TfrmShutdown.Create(Self) do begin
    NMaq := Dados.mtMaquinaNumero.Value;
    ShowModal;
  end;  
end;

procedure TfbgMaquinas.cmVendaClick(Sender: TObject);
begin
  tAcesso.Refresh;
  with Dados do
  if (mtMaquinaAcesso.Value>0) and tAcesso.FindKey([mtMaquinaAcesso.Value]) then
    TFrmAcesso.Create(Self).Editar(Self.tAcesso, 1);
end;

procedure TfbgMaquinas.AplicaDireitosUsuario;
begin
  inherited;
  cmNovo.Enabled := Permitido(daCfgParametros);
  cmApagar.Enabled := Permitido(daCfgParametros);
end;

procedure TfbgMaquinas.cmVendeTempoClick(Sender: TObject);
begin
  if NumAberto<1 then begin
    Beep;
    ShowMessage('Caixa está fechado');
    Exit;
  end;  
  tAcesso.Refresh;
  with Dados do
  if (mtMaquinaAcesso.Value>0) then begin
    if (mtMaquinaContato.Value>0) and tAcesso.FindKey([mtMaquinaAcesso.Value]) then
      TFrmCredito.Create(Self).Novo(tAcesso, mtMaquinaContato.Value, True);
  end else
    TFrmCredito.Create(Self).Novo(tAcesso, 0, True);
end;

procedure TfbgMaquinas.GridStatusGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
var
  V : Variant;
  M : TCMMaquina;  
begin
  inherited;
  V := ANode.Values[GridNumero.Index];
  if (V = null) or (V=0) then Exit;
  M := Dados.CM.Maquinas.PorNumero[V];
  if M=nil then Exit;
  if M.Acesso > 0 then begin
    V := ANode.Values[GridParado.Index];
    if V=null then Exit;
    if (V=True) or M.ParadoPacote then begin
      if M.ParadoPacote then 
        AText := 'Fim de Crédito'
      else
        AText := 'Pausado';  
    end else  
    if M.AguardaPagto then 
      AText := 'Aguarda Pagto.'
    else 
      AText := 'Em uso';
  end else
  if M.Manutencao then
    AText := 'Em Manutenção'
  else
    AText := 'Livre';  
end;

end.
