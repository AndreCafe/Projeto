unit uRAfbLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox,
  cxMaskEdit, cxDBLookupComboBox, cxCheckBox, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxBar;

type
  TfbLog = class(TFrmBase)
    Grid: TcxGrid;
    tvLog: TcxGridDBTableView;
    tvLogNum: TcxGridDBColumn;
    tvLogOperacao: TcxGridDBColumn;
    tvLogDataHora: TcxGridDBColumn;
    tvLogLoja: TcxGridDBColumn;
    tvLogNomeLoja: TcxGridDBColumn;
    tvLogOk: TcxGridDBColumn;
    tvLogHD: TcxGridDBColumn;
    tvLogDetalhes: TcxGridDBColumn;
    tvLogIP: TcxGridDBColumn;
    glLog: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Atualizar;
  public
    class function Descricao: String; override;
    
    { Public declarations }
  end;

var
  fbLog: TfbLog;

implementation

uses uRAPri, uRADM;

{$R *.dfm}

{ TfbLog }

procedure TfbLog.Atualizar;
begin
  with DM do begin
    qLog.Close;
    qLog.Query.Text := 'Select * From "Log" Where DataHora >= ' +
                  QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now-((1/24)*3)));
    qLog.Open;               
    qLog.Last; 
  end;  
end;

class function TfbLog.Descricao: String;
begin
  Result := 'Log';
end;

procedure TfbLog.FormCreate(Sender: TObject);
begin
  Atualizar;
end;

end.
