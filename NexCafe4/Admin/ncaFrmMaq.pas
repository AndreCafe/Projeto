unit ncaFrmMaq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, kbmMemTable, dxBar, dxBarExtItems, cxClasses, cxTextEdit,
  cxMaskEdit, cxDBEdit, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  cxCheckBox, cxStyles, cxBarEditItem, cxGraphics, cxDropDownEdit,
  cxImageComboBox, cxMemo, ncClassesBase;

type
  TFrmMaq = class(TForm)
    panPri: TPanel;
    BarMgr: TdxBarManager;
    BarMgrBar1: TdxBar;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    beMaq: TcxBarEditItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cmMaq: TdxBarStatic;
    cbEmManut: TcxCheckBox;
    cxLabel2: TcxLabel;
    lbTarifaEsp: TcxLabel;
    edNome: TcxTextEdit;
    edTarifa: TcxImageComboBox;
    edObs: TcxMemo;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    lbPatro: TcxLabel;
    cbPatro: TcxImageComboBox;
    cbAvisaFimTempo: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Editar(M: TncMaquina);
    { Public declarations }
  end;

var
  FrmMaq: TFrmMaq;

implementation

uses ncaDM, ncaFrmPri, ncVersoes;

{$R *.dfm}

procedure TFrmMaq.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMaq.cmGravarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmMaq.Editar(M: TncMaquina);
begin
  edTarifa.Properties.ReadOnly := (not Dados.CM.UA.Admin);
  edNome.Properties.ReadOnly := (not Dados.CM.UA.Admin);
  Caption := 'Máquina '+IntToStr(M.Numero);
  edNome.Text := M.Nome;
  cbEmManut.Checked := M.EmManutencao;
  cbAvisaFimTempo.Checked := M.AvisaFimTempo;
  edTarifa.EditValue := M.TipoAcesso;
  edObs.Text := M.Obs;
  cbPatro.EditValue:= M.Patrocinio;
  cbPatro.Properties.ReadOnly := (not Dados.CM.UA.Admin);
  ShowModal;

  if ModalResult=mrOk then begin
    M.AtualizaCache;
    M.Nome := edNome.Text;
    M.Obs := edObs.Text;
    M.TipoAcesso := edTarifa.EditValue;
    M.EmManutencao := cbEmManut.Checked;
    M.Patrocinio := cbPatro.EditValue;
    M.AvisaFimTempo := cbAvisaFimTempo.Checked;
    Dados.CM.SalvaAlteracoesObj(M, False);
  end;
end;

procedure TFrmMaq.FormCreate(Sender: TObject);
begin
  lbTarifaEsp.Enabled := ncVersoes.Versoes.PodeUsar(idre_tipoacessomaq);
  edTarifa.Enabled := lbTarifaEsp.Enabled;
  with Dados, edTarifa.Properties do begin
    tbTipoAcesso.First;
    while not tbTipoAcesso.Eof do with Items.Add do 
    begin
      Value := tbTipoAcessoID.Value;
      Description := tbTipoAcessoNome.Value;
      tbTipoAcesso.Next;
    end;
  end;

  with Dados, cbPatro.Properties do begin
    tbPatro.First;
    while not tbPatro.Eof do with Items.Add do 
    begin
      Value := tbPatroNome.Value;
      Description := tbPatroNome.Value;
      tbPatro.Next;
    end;
  end;

  if (not sametext('P', ParamStr(1))) then begin
    lbPatro.Visible := False;
    cbPatro.Visible := False;
  end;
  
  
  edTarifa.Enabled := (Dados.tbTipoAcesso.RecordCount>1) and Dados.CM.UA.Admin;
end;

end.
