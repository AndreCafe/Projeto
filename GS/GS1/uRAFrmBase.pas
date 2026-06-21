unit uRAFrmBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGrid, ExtCtrls, uRADMForms;

const
  RACmd_Novo      = 1;
  RACmd_Editar    = 2;
  RACmd_Excluir   = 3;
  RACmd_Atualizar = 4;

  // Modos de Execução de Formulário
  mefModal  = 0;
  mefTabSep = 1;  // Tab separado na tela principal
  mefTabPri = 2;  // Tab principal da ela principal
  
  
type

  TFrmBase = class(TForm)
    panPri: TPanel;
  private
    { Private declarations }
    FFormsNotified: Boolean;
    FOperacao: Integer;
  protected 
    procedure SetOperacao(const Value: Integer); virtual;  
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure ExecBotao(AIDBotao: Integer); virtual; abstract;

    class function Descricao: String; virtual; abstract;
    class function ModoExecucao: Integer; virtual;    
    class function CacheInstance: Boolean; virtual; 
    class function Modulo: Integer; virtual; abstract;
    class function GetBotoes(AIDBotao: Integer; 
                             var ACaption: String; 
                             var ABeginGroup: Boolean;
                             var AImageIndex: Integer): Boolean; virtual;
    class function GetOperacoes(AIDOper: Integer;
                                var ADescricao: String): Boolean; virtual;
    
    function  GetGrid: TcxGrid; virtual; 

    property Operacao: Integer
      read FOperacao write SetOperacao;
    { Public declarations }
  end;

  TFrmBaseClass = Class of TFrmBase;

  TFormBaseProc = procedure (AForm: TFrmBase) of Object;

  TFrmBaseList = class
  private
    FMostrarForm: TFormBaseProc;
    FEsconderForm: TFormBaseProc;
  public
    constructor Create;
    destructor Destroy; override;

    procedure FreeInstances;

    procedure RegistraForm(aClass: TFrmBaseClass);

    procedure Executar(AIDOper: Integer);
    procedure Esconder(aInstance: TFrmBase);
    procedure FormDestroyed(aInstance: TFrmBase);
  published    
    property MostrarFormProc: TFormBaseProc
      read FMostrarForm write FMostrarForm;

    property EsconderFormProc: TFormBaseProc
      read FEsconderForm write FEsconderForm; 
  end;
      

var
  FrmBase: TFrmBase;
  FrmList: TFrmBaseList;

implementation

{$R *.dfm}

{ TFrmBaseList }

constructor TFrmBaseList.Create;
begin
  FMostrarForm := nil;
  FEsconderForm := nil;
end;

destructor TFrmBaseList.Destroy;
begin
  FreeInstances;
  inherited;
end;

procedure TFrmBaseList.Esconder(aInstance: TFrmBase);
begin
  with dmForm do begin
    if Assigned(FEsconderForm) then
      FEsconderForm(aInstance)
    else
      Raise Exception.Create('EsconderFormProc não informada');  
  
    if not aInstance.CacheInstance and mtInstance.FindKey([Integer(aInstance)]) then
    begin
      mtInstance.Delete;
      aInstance.FFormsNotified := True;
      aInstance.Free;
    end;  
  end;    
end;

procedure TFrmBaseList.Executar(AIDOper: Integer);
var Inst: TFrmBase;
begin
  with dmForm do begin
    if not mtOper.FindKey([AIDOper]) then
      Raise Exception.Create('Operação '+IntToStr(AIDOper)+' não encontrada!');
    
    if not mtForm.Locate('ClassName', mtOperForm.Value, []) then
      Raise Exception.Create('Formulário '+mtOperForm.Value+' não encontrado!');
      
    if not mtInstance.Locate('Form', mtFormClass.Value, []) then begin
      mtInstance.Insert;
      mtInstanceForm.Value := mtFormClass.Value;
      Inst := TFrmBaseClass(mtFormClass.Value).Create(nil);
      mtInstanceInstance.Value := Integer(Inst);
      mtInstance.Post;
    end;

    Inst.Operacao := AIDOper;
    
    if Assigned(FMostrarForm) then
      FMostrarForm(Inst)
    else
      Raise Exception.Create('MostrarFormProc não informada');  
  end;    
end;

procedure TFrmBaseList.RegistraForm(aClass: TFrmBaseClass);
var 
  S: String;
  I, ImgIndex: Integer;
  BeginGroup: Boolean;
begin
  with dmForm do begin
    mtForm.Insert;
    mtFormClass.Value := Integer(aClass);
    mtFormDescricao.Value := aClass.Descricao;
    mtFormModulo.Value := aClass.Modulo;
    mtFormClassName.Value := aClass.ClassName;
    mtForm.Post;

    I := 0;
    while aClass.GetOperacoes(I, S) do begin
      mtOper.Insert;
      mtOperForm.Value := aClass.ClassName;
      mtOperOperID.Value := I;
      mtOperDescricao.Value := S;
      mtOper.Post;
      Inc(I);
    end;

    I := 0;
    while aClass.GetBotoes(I, S, BeginGroup, ImgIndex) do begin
      ImgIndex := -1;
      BeginGroup := False;
      mtBotao.Insert;
      mtBotaoBtnID.Value := I;
      mtBotaoCaption.Value := S;
      mtBotaoForm.Value := Integer(aClass);
      mtBotaoImageIndex.Value := ImgIndex;
      mtBotaoBeginGroup.Value := BeginGroup;
      mtBotao.Post;
      Inc(I);
    end;  
  end;  
end;

procedure TFrmBaseList.FormDestroyed(aInstance: TFrmBase);
begin
  with dmForm do 
  if mtInstance.FindKey([Integer(aInstance)]) then
    mtInstance.Delete;
end;

procedure TFrmBaseList.FreeInstances;
begin
  with dmForm do begin
    mtInstance.First;
    while not (mtInstance.Eof and mtInstance.Bof) do begin
      with TFrmBase(mtInstanceInstance.Value) do begin
        FFormsNotified := True;
        Free;
      end;  
      mtInstance.Delete;
      mtInstance.First;
    end;
  end;  
end;
 
{ TFrmBase }

procedure TFrmBase.AfterConstruction;
begin
  inherited;
  FOperacao := -1;
  FFormsNotified := False;
end;

procedure TFrmBase.BeforeDestruction;
begin
  inherited;
  if not FFormsNotified then
    FrmList.FormDestroyed(Self);
end;

class function TFrmBase.CacheInstance: Boolean;
begin
  Result := True;
end;

class function TFrmBase.GetBotoes(AIDBotao: Integer; var ACaption: String;
  var ABeginGroup: Boolean; var AImageIndex: Integer): Boolean;
begin
  Result := False;
end;

function TFrmBase.GetGrid: TcxGrid;
var I : Integer;
begin
  for I := 0 to ComponentCount-1 do 
  if Components[I] is TcxGrid then begin
    Result := TcxGrid(Components[I]);
    Exit;
  end;  
  Result := nil;
end;

class function TFrmBase.GetOperacoes(AIDOper: Integer;
  var ADescricao: String): Boolean;
begin
  Result := False;
end;

class function TFrmBase.ModoExecucao: Integer;
begin
  Result := mefTabPri;
end;

procedure TFrmBase.SetOperacao(const Value: Integer);
begin
  FOperacao := Value;
end;

initialization
  FrmList := TFrmBaseList.Create;

finalization
  FrmList.Free;  

end.
