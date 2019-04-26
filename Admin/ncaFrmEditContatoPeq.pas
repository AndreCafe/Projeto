unit ncaFrmEditContatoPeq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmEditContato, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, ImgList, StdCtrls,
  cxButtons, ncMyImage, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmEditContatoPeq = class(TFrmEditContato)
  private
    { Private declarations }
  protected    
    procedure Atualiza; override;
  public
    { Public declarations }
  end;

var
  FrmEditContatoPeq: TFrmEditContatoPeq;

implementation

uses ufmImagens;

{$R *.dfm}

{ TFrmEditContatoPeq }

procedure TFrmEditContatoPeq.Atualiza;
begin
  inherited;
  lbNome.Style.Font.Size := 12;
end;

end.
