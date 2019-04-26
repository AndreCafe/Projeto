unit ncaFrmProdSemFid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, cxLabel, nxdb;

type
  TFrmProdSemFid = class(TForm)
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbProduto: TcxLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }  
    FTab: TnxTable;
  public
    { Public declarations }
    procedure Mostrar(aTab: TnxTable);
  end;

var
  Form1: TFrmProdSemFid;

implementation

uses ncaFrmProduto;

{$R *.dfm}

{ TFrmProdSemFid }

procedure TFrmProdSemFid.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmProdSemFid.cxButton2Click(Sender: TObject);
begin
  TFrmProduto.Create(Self).Editar(FTab);
  Close;
end;

procedure TFrmProdSemFid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmProdSemFid.Mostrar(aTab: TnxTable);
begin
  FTab := aTab;
  lbProduto.Caption := FTab.FieldByName('Descricao').AsString;
  Beep;
  ShowModal;
end;

end.
