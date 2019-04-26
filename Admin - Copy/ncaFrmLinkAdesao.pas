unit ncaFrmLinkAdesao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaPlusAPI, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBar, cxClasses, OleCtrls, SHDocVw_EWB, EwbCore,
  EmbeddedWB, cxPC;

type
  TFrmLinkAdesao = class(TFrmPlus)
    dxBarManager1: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Mostrar; 
  end;

var
  FrmLinkAdesao: TFrmLinkAdesao;

implementation

uses ncaFrmPri;

{$R *.dfm}

procedure TFrmLinkAdesao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmLinkAdesao.FormCreate(Sender: TObject);
begin
  inherited;
  FPodeFechar := True;
end;

procedure TFrmLinkAdesao.FormShow(Sender: TObject);
begin
  inherited;
  NavegaURL;
end;

procedure TFrmLinkAdesao.Mostrar;
begin
  FadesaoFechar := True;
  FURL := gAdesaoURLParceiro;
  ShowModal;
end;

end.
