unit uCustomWebBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, OleCtrls, SHDocVw;

type
  TfrmCustomWebBrowser = class(TdxFrame)
    WebBrowser: TWebBrowser;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{$R *.dfm}

end.
