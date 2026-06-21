unit uRADMForms;

interface

uses
  SysUtils, Classes, DB, kbmMemTable;

type
  TdmForm = class(TDataModule)
    mtForm: TkbmMemTable;
    mtFormClassName: TStringField;
    mtFormClass: TIntegerField;
    mtFormDescricao: TStringField;
    mtFormModulo: TWordField;
    mtOper: TkbmMemTable;
    mtOperForm: TStringField;
    mtOperID: TAutoIncField;
    mtOperOperID: TWordField;
    mtOperDescricao: TStringField;
    mtInstance: TkbmMemTable;
    mtInstanceInstance: TIntegerField;
    mtInstanceForm: TIntegerField;
    dsForm: TDataSource;
    dsOper: TDataSource;
    dsInstance: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmForm: TdmForm;

implementation

{$R *.dfm}

procedure TdmForm.DataModuleCreate(Sender: TObject);
begin
  mtForm.Open;
  mtOper.Open;
  mtInstance.Open;
end;

initialization
  dmForm := TdmForm.Create(nil);

finalization
  FreeAndNil(dmForm);

end.
