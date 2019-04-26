unit uMostraSenhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, ncClassesBase, ClasseCS;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    LMDSimplePanel1: TLMDSimplePanel;
    Button1: TButton;
    OpenDlg: TOpenDialog;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function CriaClasseCS(TipoClasse: Integer): TClasseCS;
    
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

function Pad(S: String; T: Integer): String;
begin
  Result := S;
  while Length(Result)<T do Result := Result + ' ';
end;

procedure TForm4.Button1Click(Sender: TObject);
const
  BStr : Array[Boolean] of String = ('  Admin=Não', 
                                     '  Admin=Sim');
var 
  U : TncListaUsuarios;
  I : Integer;
begin
  if not OpenDlg.Execute then Exit;
  Memo1.Lines.Clear;
  U := TncListaUsuarios.Create;
  try
    U.CriaClasse := CriaClasseCS;
    U.LeArquivo(OpenDlg.FileName);
    for I := 0 to U.Count-1 do 
      Memo1.Lines.Add('Username='+Pad(U.Itens[I].Username, 20)+'  Senha='+Pad(U.Itens[I].Senha, 30)+BStr[U.Itens[i].Admin]);
  finally
    U.Free;
  end;
end;

function TForm4.CriaClasseCS(TipoClasse: Integer): TClasseCS;
begin
  Result := TncUsuario.Create;
end;

end.
