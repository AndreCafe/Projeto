unit uChecaTabela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, DBTables;

type
  TForm1 = class(TForm)
    Table1: TTable;
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Database1: TDatabase;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uChecaDBF;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ChecaTabela(Table1, True, True);
  Table1.Open;
end;

end.




