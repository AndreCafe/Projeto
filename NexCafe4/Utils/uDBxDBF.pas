unit uDBxDBF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, BDE, DBTables, StdCtrls, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, nxdb, nxsdServerEngine,
  nxsrServerEngine, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllComponent, ComCtrls, LMDControl, DBCtrls, dbf;

type
  TForm5 = class(TForm)
    Tab: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    LMDSimplePanel1: TLMDSimplePanel;
    Button1: TButton;
    PB: TProgressBar;
    Button2: TButton;
    Database1: TDatabase;
    Session1: TSession;
    TabDBF: TDbf;
    TabCodCliente: TIntegerField;
    TabNomeCliente: TStringField;
    TabEnderecoCliente: TStringField;
    TabBairroCliente: TStringField;
    TabCepCliente: TStringField;
    TabCidadeCliente: TStringField;
    TabEstadoCliente: TStringField;
    TabDDDFoneCliente: TStringField;
    TabFoneCliente: TStringField;
    TabCategoriaCliente: TIntegerField;
    TabNumeroUltimoPedido: TIntegerField;
    TabDataNasc: TDateField;
    TabCredito: TFloatField;
    TabDBFCODCLIENTE: TIntegerField;
    TabDBFNOMECLIENT: TStringField;
    TabDBFENDERECOCL: TStringField;
    TabDBFBAIRROCLIE: TStringField;
    TabDBFCEPCLIENTE: TStringField;
    TabDBFCIDADECLIE: TStringField;
    TabDBFESTADOCLIE: TStringField;
    TabDBFDDDFONECLI: TStringField;
    TabDBFFONECLIENT: TStringField;
    TabDBFCATEGORIAC: TIntegerField;
    TabDBFNUMEROULTI: TIntegerField;
    TabDBFDATANASC: TDateField;
    TabDBFCREDITO: TFloatField;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button2Click(Sender: TObject);
begin
  Tab.Open;
  TabDBF.Open;
  while not Tab.Eof do begin
    TabDBF.Append;
      TabDBFCodCliente.Value := TabCodCliente.Value;
      TabDBFNomeClient.Value := TabNomeCliente.Value;
      TabDBFEnderecoCl.Value := TabEnderecoCliente.Value;
      TabDBFBairroClie.Value := TabBairroCliente.value;
      TabDBFCEPCliente.Value := TabCepCliente.Value;
      TabDBFCidadeClie.Value := TabCidadeCliente.Value;
      TabDBFEstadoClie.Value := TabEstadoCliente.Value;
      TabDBFDDDFoneCli.Value := TabDDDFoneCliente.Value;
      TabDBFFoneClient.Value := TabFoneCliente.Value;
      TabDBFCategoriaC.Value := TabCategoriaCliente.Value;
      TabDBFNumeroUlti.Value := TabNumeroUltimoPedido.Value;
      TabDBFDataNasc.Value   := TabDataNasc.Value;
      TabDBFCredito.Value    := TabCredito.Value;
    TabDBF.Post;
  
    Tab.Next;
  end;
  ShowMessage('Pronto!');
end;

end.
