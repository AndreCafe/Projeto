unit ncgFrameShellFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxContainer, cxEdit, cxLabel, ComCtrls, ShellControls,
  LMDCustomScrollBox, LMDScrollBox, LMDSplt, cxPC, cxControls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxPCdxBarPopupMenu, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TFrameShellFilter = class(TFrame)
    panPri: TLMDSimplePanel;
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    LMDSplitterPanel1: TLMDSplitterPanel;
    LMDSplitterPane1: TLMDSplitterPane;
    LMDSplitterPane2: TLMDSplitterPane;
    cxLabel2: TcxLabel;
    cxTabSheet2: TcxTabSheet;
    LMDSplitterPanel2: TLMDSplitterPanel;
    LMDSplitterPane3: TLMDSplitterPane;
    LMDSplitterPane4: TLMDSplitterPane;
    cxLabel1: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
