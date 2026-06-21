unit uFFTeste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxTL, dxDBCtrl, dxDBGrid, dxCntner, DBCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    dxDBGrid1: TdxDBGrid;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    dxDBGrid1Telefone: TdxDBGridMaskColumn;
    dxDBGrid1EspLogradouro: TdxDBGridMaskColumn;
    dxDBGrid1Logradouro: TdxDBGridMaskColumn;
    dxDBGrid1Numero: TdxDBGridMaskColumn;
    dxDBGrid1Complemento: TdxDBGridMaskColumn;
    dxDBGrid1Zona: TdxDBGridMaskColumn;
    dxDBGrid1Nome: TdxDBGridMaskColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uFFSEMgr;

{$R *.DFM}

end.
