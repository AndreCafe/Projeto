unit ncaFrmEditContatoValidar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmEditContatoPeq, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls, cxButtons,
  ImgList, ncMyImage, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, ncDebCredValidator;

type
  TFrmEditContatoValidar = class(TFrmEditContatoPeq)
    lbMsg: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FVal : TncDebCredValidator;
  protected
    procedure Atualiza; override;
  public
    function Editar(aValidator: TncDebCredValidator): Boolean;
    { Public declarations }
  end;

var
  FrmEditContatoValidar: TFrmEditContatoValidar;

resourcestring
  rsPrecisaCliente = 'É necessário informar um cliente';
  rsLimiteDeb = 'Limite de débito ultrapassado';
  rsCredMenorZero = 'Não há crédito disponível na conta do cliente para realizar essa operação';  

implementation

{$R *.dfm}

{ TFrmEditContatoValidar }

procedure TFrmEditContatoValidar.Atualiza;
begin
  inherited;
  if FVal.Selecionar then
    lbMsg.Caption := rsPrecisaCliente
  else
  if not FVal.DebitoOk then
    lbMsg.Caption := rsLimiteDeb
  else
  if not FVal.CreditoOk then
    lbMsg.Caption := rsCredMenorZero
  else
    lbMsg.Caption := '';
end;

function TFrmEditContatoValidar.Editar(
  aValidator: TncDebCredValidator): Boolean;
begin
  FVal.Assign(aValidator);
  DCValidator := FVal;
  ID := FVal.NewCli;
  ShowModal;
  if ModalResult=mrOk then
    aValidator.Assign(FVal);
end;

procedure TFrmEditContatoValidar.FormCreate(Sender: TObject);
begin
  inherited;
  FVal := TncDebCredValidator.Create;
end;

procedure TFrmEditContatoValidar.FormDestroy(Sender: TObject);
begin
  inherited;
  FVal.Free;
end;

end.
