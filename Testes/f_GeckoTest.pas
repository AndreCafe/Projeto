unit f_GeckoTest;

{
  Gecko demo application for Delphi 4.  This demo dynamically creates
  the Mozilla control rather than simply dropping it on form at design
  time.  This approach is done for two reasons: first, load time is
  substantially faster since the browser object isn't created until
  it's first used; and second, it provides a better way to trap when
  the browser object can't be created (which will happen if Gecko isn't
  installed, for example).

  In order to use this demo, you should first make sure to correctly
  install Gecko and register the Mozilla control.  Once this is done,
  follow these steps to use it in Delphi:

         1. Select "Import Type Library" from Delphi's Project menu
         2. Choose "MozillaControl" in the type library list and click OK

  Delphi's ActiveX VCL toolbar should now contain a "MozillaBrowser"
  component.

  Please note that this demo is provided "as is" and is unsupported.
  In other words, please do not contact me asking Gecko- or Delphi-
  related questions!

  Nick Bradbury
  November 1999
  www.bradsoft.com
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Variants, OleCtrls, comobj, MOZILLACONTROLLib_TLB, ExtCtrls, ComCtrls;

type
  TfGeckoTest = class(TForm)
    txtURL: TEdit;
    btnGo: TButton;
    lblInstruct: TLabel;
    staMain: TStatusBar;
    pnlGeckoContainer: TPanel;
    btnPrev: TButton;
    btnNext: TButton;
    procedure btnGoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
  private
    FGecko : TMozillaBrowser;
    procedure GeckoNav(sURL: string);
    function  CreateGeckoObject: boolean;
    procedure DoStatusChange(Sender: TObject; const Text: WideString);
    procedure DoCmdStateChange(Sender: TObject; Command: Integer; Enable: WordBool);
  public

  end;

var
  fGeckoTest: TfGeckoTest;

implementation

{$R *.DFM}

procedure TfGeckoTest.FormDestroy(Sender: TObject);
begin
     if Assigned(FGecko) then FGecko.Free;
end;

procedure TfGeckoTest.btnGoClick(Sender: TObject);
begin
     GeckoNav(txtURL.Text);
end;

procedure TfGeckoTest.btnPrevClick(Sender: TObject);
begin
     if Assigned(FGecko) then FGecko.GoBack;
end;

procedure TfGeckoTest.btnNextClick(Sender: TObject);
begin
     if Assigned(FGecko) then FGecko.GoForward;
end;

// main navigation routine
procedure TfGeckoTest.GeckoNav(sURL: string);
var
   Flags, TargetFrameName, PostData, Headers : OleVariant;
begin
     // dynamically create the browser object
     if not CreateGeckoObject then
        exit;
        
     TargetFrameName := null;
     Headers := null;
     PostData := null;
     Flags := null;

     // do the actual navigation
     FGecko.Navigate(sURL, Flags, TargetFrameName, PostData, Headers);
end;

// create the browser object if it hasn't already been created
function TfGeckoTest.CreateGeckoObject: boolean;
begin
     // already created, so nothing to do
     if Assigned(FGecko) then
     begin
          Result := True;
          exit;
     end;

     Result := False;

     screen.Cursor := crHourglass;
     try
         try
            FGecko := TMozillaBrowser.Create(self);
            with FGecko do
            begin
                 // place it inside the panel
                 ParentWindow := pnlGeckoContainer.Handle;
                 SetBounds(1, 1, pnlGeckoContainer.Width-1, pnlGeckoContainer.Height-1);
                 // dynamically assign the events
                 OnStatusTextChange := DoStatusChange;
                 OnCommandStateChange := DoCmdStateChange;
            end;

            // the object must have been successfully created to get this far, so return True
            Result := True;
         except
             // this exception may mean that Gecko is incorrectly installed, or not installed at all.  
             on EOleError do
             begin
                  MessageDlg('Unable to create Gecko object.', mtError, [mbOK], 0);
             end;
         end;
     finally
        screen.Cursor := crDefault;
     end;
end;

// fired whenever Gecko wishes to update the status bar text
procedure TfGeckoTest.DoStatusChange(Sender: TObject; const Text: WideString);
begin
     staMain.SimpleText := Text;
end;

// fired when user navigates within the browser - use this to enable/disable the navigation buttons
procedure TfGeckoTest.DoCmdStateChange(Sender: TObject; Command: Integer; Enable: WordBool);
const
  // from SHDocVw_TLB
  CSC_NAVIGATEFORWARD = $00000001;
  CSC_NAVIGATEBACK = $00000002;
begin
     if Command = CSC_NAVIGATEFORWARD then
        btnNext.Enabled := Enable
     else if Command = CSC_NAVIGATEBACK then
         btnPrev.Enabled := Enable;
end;

end.
