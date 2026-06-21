unit RestClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Dialogs, StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc, ExtCtrls, ComCtrls,
  SHDocVw, IniFiles, DB, DBClient, Grids, DBGrids,Variants, IdUri, SHFolder,
  PngImage;

type
  TRestForm = class(TForm)
    XMLDoc: TXMLDocument;
    IdHTTP1: TIdHTTP;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Google: TTabSheet;
    Yahoo: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    btnUpdate: TButton;
    cbFeeds: TComboBox;
    ListBox1: TListBox;
    LbCities: TListBox;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    cdsTown: TClientDataSet;
    CDSCities: TClientDataSet;
    btnGeocoding: TButton;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Button1: TButton;
    lbCitiesY: TListBox;
    TabSheet2: TTabSheet;
    lbLangTo: TListBox;
    lbLangFrom: TListBox;
    Panel4: TPanel;
    edSourceText: TEdit;
    btnTraslate: TButton;
    Memo1: TMemo;
    procedure btnUpdateClick(Sender: TObject);
    procedure btnGeocodingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnTraslateClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetYahooKey;
    procedure GetGoogleKey;
  public
    { Public declarations }
    sListCity: tStringList;
    inifile: TMemIniFile;
    googleMapKey: string;
    yahooAppid: string;
    function GetIniFileName: string;
    procedure LoadCities;
  end;

var
  RestForm: TRestForm;

implementation

uses BabelGoogle;

{$R *.dfm}

const
  YahooBaseUrl = 'http://api.local.yahoo.com/MapsService/V1/';

function getChildNodes (node: IDOMNode): string;
var
  J: Integer;
begin
  Result := '';
  for J := 0 to node.childNodes.length - 1 do
    if (node.childNodes.item[J].nodeType = TEXT_NODE) or
        (node.childNodes.item[J].nodeType = CDATA_SECTION_NODE) then
      Result := Result + node.childNodes.item[J].nodeValue;
end;

procedure TRestForm.btnGeocodingClick(Sender: TObject);
var
  I: Integer;
  murl, strResponse, str1, str2: string;
  sList:TStringList;
begin
  cdsTown.Active := False;
  cdsTown.CreateDataSet;
  cdsTown.Active := True;
  sList := TStringList.Create;

  for I := 0 to 10 { sListCity.Count - 1 } do
  begin
    LbCities.ItemIndex := I;
    Application.ProcessMessages;
    if Length (sListCity.Names[I]) > 2 then
    begin

      murl := TIDUri.UrlEncode(
          'http://maps.google.com/maps/geo?q=' +
          (sListCity.Names[I]) + '&output=csv&key=' + googleMapKey);

      strResponse := IdHTTP1.Get(murl);
      sList.LineBreak := ',';
      sList.Text := strResponse;
      str1 := sList[2];
      str2 := sList[3];
      cdsTown.AppendRecord([sListCity.Names[I],
        StrToFloat (str1), StrToFloat (str2),
        Length (sListCity.ValueFromIndex[I])]);
//      Sleep (150);

    end;
//    break;
  end;
  sList.Free;

end;

procedure TRestForm.btnTraslateClick(Sender: TObject);
var
  strLangFrom, strLangTo: string;
begin
  if (lbLangFrom.ItemIndex > -1) and (lbLangTo.ItemIndex > -1) then
  begin
    strLangFrom := lbLangFrom.Items.Names[lbLangFrom.ItemIndex];
    strLangTo := lbLangTo.Items.Names[lbLangTo.ItemIndex];
    Memo1.Lines.Add (TBabelGoogleRest.
      Translate(edSourceText.Text, strLangFrom, strLangTo));
  end
  else
    ShowMessage ('Select a language');

end;

procedure TRestForm.btnUpdateClick(Sender: TObject);
var
  strXml, title, author: string;
  I: Integer;
  IDomSel: IDOMNodeSelect;
  Node: IDOMNode;
begin
  strXml := IdHTTP1.Get (cbFeeds.Text);
  XMLDoc.LoadFromXML(strXml);
  XMLDoc.Active := True;
  IDomSel := (XMLDoc.DocumentElement.DOMNode as IDOMNodeSelect);
  for I := 1 to 10 do
  begin
    Node := IDomSel.selectNode('/rss/channel/item[' + IntToStr (i) + ']/title');
    title := getChildNodes (Node);
    Node := IDomSel.selectNode('/rss/channel/item[' + IntToStr (i) + ']/pubDate');
    author := getChildNodes (Node);
    ListBox1.Items.Add(title + ' -- ' + author);
  end;
end;

procedure TRestForm.Button1Click(Sender: TObject);
var
  strResult: string;
  memStr: tFileStream;
begin                                                                                        {image_type=gif&}
  if lbCitiesY.itemIndex < 0  then
  begin
    ShowMessage ('Select an item in the listbox');
    Exit;
  end;

  strResult := IdHTTP1.Get(YahooBaseUrl +
    'mapImage?' +
    'appid=' + yahooAppid +
//    '&street=' + TIdURI.ParamsEncode ('Rua Joaquim Floriano 422') +
//    '&city=' + TIdURI.ParamsEncode ('São Paulo, SP, BR=*'));
    '&city=' + TIdURI.ParamsEncode (lbCitiesY.Items.Names[lbCitiesY.itemIndex]));

  XMLDoc.Active := False;
  XMLDoc.XML.Text := strResult;
  XMLDoc.Active := True;
  strResult := XMLDoc.DocumentElement.NodeValue;
  XMLDoc.Active := False;

  // now let's get the referred image
  memStr:= tFileStream.Create ('temp.png', fmCreate);
  IdHttp1.Get(strResult, memStr);
  memStr.Free;

  Image1.Picture.LoadFromFile('temp.png');

end;

procedure TRestForm.FormCreate(Sender: TObject);
begin
  LoadCities;

  GetYahooKey;
  GetGoogleKey;

  lbLangFrom.ItemIndex := 1;
  lbLangTo.ItemIndex   := 0;
end;

procedure TRestForm.GetGoogleKey;
var
  inifileName: string;
begin
  inifileName := 'GeoLocation.ini';
//  inifileName := GetIniFileName;
  inifile := TMemIniFile.Create (iniFilename);
  googleMapKey := inifile.ReadString('googlemap', 'devkey', '');
  if googleMapKey = '' then
    raise Exception.Create ('Missing dev key');
end;

function TRestForm.GetIniFileName: string;
var
  strFolder: string;
begin
  SetLength (strFolder, 250);
  ShGetFolderPath (0,
    CSIDL_PERSONAL, 0, 0, PChar(strFolder));
  SetLength (strFolder, StrLen(PChar(strFolder)));
  strFolder := strFolder + PathDelim;
  Result := strFolder +
    ChangeFileExt (ExtractFileName(ParamStr(0)), '.ini');

end;

procedure TRestForm.GetYahooKey;
var
  inifileName: string;
begin
  inifileName := 'YahooMap.ini';
  inifile := TMemIniFile.Create (iniFilename);
  yahooAppid := inifile.ReadString('yahoo', 'appid', '');
  if yahooAppid = '' then
    raise Exception.Create ('Missing appid key');
end;

procedure TRestForm.LoadCities;
var
  strCity: string;
  nPos: Integer;
begin
  NullStrictConvert := False;
  NullAsStringValue := '';

  if not Assigned (sListCity) then
    sListCity := tStringList.Create;
  sListCity.Clear;

  CDSCities.Open;
  while not CDSCities.EOF do
  begin
    strCity := CDSCities['City'] + ', ' + CDSCities['State'] +
      ', ' + CDSCities['Country'];
    if (strCity <> '') then
    begin
      nPos := sListCity.IndexOfName (strCity);
      if nPos >= 0 then
        sListCity.ValueFromIndex [nPos] := sListCity.ValueFromIndex [nPos] + '*'
      else
        sListCity.Add (strCity + '=*');
    end;
    CDSCities.Next;
  end;

  LbCities.Items := sListCity;
  lbCitiesY.Items := sListCity;

end;

end.
