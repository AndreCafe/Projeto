unit uDTDBFTabs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Dbf, Db, kbmMemTable;

type
  TdmDBF = class(TDataModule)
    tAmarraFase: TDBF;
    tCliente: TDBF;
    tFase: TDBF;
    tFaseTec: TDBF;
    tMotivo: TDBF;
    tOcorrencia: TDBF;
    tOS: TDBF;
    tOSFase: TDBF;
    tOSFaseDesc: TDBF;
    tProjeto: TDBF;
    tSolicita: TDBF;
    tSolicitaDesc: TDBF;
    tTecnico: TDBF;
    tTipoHora: TDBF;
    tAmarraFaseCLIENTE: TStringField;
    tAmarraFasePROJETO: TStringField;
    tAmarraFaseFASEPAI: TStringField;
    tAmarraFaseFASEFILHO: TStringField;
    tAmarraFaseTIPO: TStringField;
    tMotivoID: TStringField;
    tMotivoNOME: TStringField;
    tProjetoCLIENTE: TStringField;
    tProjetoID: TStringField;
    tProjetoNOME: TStringField;
    tProjetoLOCAPLA: TStringField;
    tProjetoLOCAREC: TStringField;
    tProjetoNOTURNO: TStringField;
    tProjetoFIMSEM: TStringField;
    tProjetoABONO: TStringField;
    tProjetoTRANSLADO: TStringField;
    tProjetoMOTABONO: TStringField;
    tProjetoOSABON: TStringField;
    tProjetoTIPO: TStringField;
    tClienteID: TStringField;
    tClienteNOME: TStringField;
    tClienteTRANSLADO: TStringField;
    tClienteASSINOU: TStringField;
    tClienteNOTURNO: TStringField;
    tClienteFIMSEM: TStringField;
    tClienteABONO: TStringField;
    tClienteMOTABONO: TStringField;
    tOcorrenciaID: TStringField;
    tOcorrenciaDESCRICAO: TStringField;
    tSolicitaCLIENTE: TStringField;
    tSolicitaPROJETO: TStringField;
    tSolicitaTECNICO: TStringField;
    tSolicitaDATA: TStringField;
    tSolicitaITEM: TFloatField;
    tSolicitaTIPO: TStringField;
    tSolicitaORIGEM: TStringField;
    tSolicitaNOMERESP: TStringField;
    tSolicitaSYNC: TBooleanField;
    tSolicitaDATART: TStringField;
    tSolicitaNOMERT: TStringField;
    tOSCLIENTE: TStringField;
    tOSPROJETO: TStringField;
    tOSTECNICO: TStringField;
    tOSDATA: TStringField;
    tOSID: TFloatField;
    tOSINICIO: TStringField;
    tOSTERMINO: TStringField;
    tOSTRANSLADO: TStringField;
    tOSABONO: TStringField;
    tOSMOTIVOABON: TStringField;
    tOSSYNC: TBooleanField;
    tOSASSINOU: TStringField;
    tOSDATACOMP: TStringField;
    tOSLOCAL: TStringField;
    tOSENTROU: TStringField;
    tOSNUMATEND: TStringField;
    tOSDATAPROC: TStringField;
    tSolicitaDescTIPO: TStringField;
    tSolicitaDescCLIENTE: TStringField;
    tSolicitaDescPROJETO: TStringField;
    tSolicitaDescTECNICO: TStringField;
    tSolicitaDescDATA: TStringField;
    tSolicitaDescITEM: TFloatField;
    tSolicitaDescPOS: TFloatField;
    tSolicitaDescTEXTO: TStringField;
    tSolicitaDescSYNC: TBooleanField;
    tFaseCLIENTE: TStringField;
    tFasePROJETO: TStringField;
    tFaseID: TStringField;
    tFaseFASEPAI: TStringField;
    tFaseNOME: TStringField;
    tFaseINICIO: TStringField;
    tFaseTERMINO: TStringField;
    tFaseHORAS: TFloatField;
    tFaseHORASREAL: TFloatField;
    tFasePERCEST: TFloatField;
    tFaseSYNC: TBooleanField;
    tFaseIDRETAG: TStringField;
    tFaseSUMARIO: TBooleanField;
    tFaseSTATUS: TStringField;
    tFaseVALIDADOR: TStringField;
    tFaseDATREI: TStringField;
    tFaseDATREF: TStringField;
    tFaseDATAVLD: TStringField;
    tFaseREVISAO: TStringField;
    tFaseNOVOHOR: TFloatField;
    tFaseNOVOINI: TStringField;
    tFaseNOVOFIM: TStringField;
    tFaseJUSTIFIC: TStringField;
    tFaseTECSUG: TStringField;
    tFaseMOTSUG: TStringField;
    tFaseFLAGSUG: TStringField;
    tFaseCLISUG: TStringField;
    tFaseDATASUG: TStringField;
    tFaseIDSUG: TStringField;
    tTecnicoID: TStringField;
    tTecnicoNOME: TStringField;
    tTecnicoSENHA: TStringField;
    tTecnicoEMPRESA: TStringField;
    tTecnicoLISTAPROJ: TStringField;
    tFaseTecCLIENTE: TStringField;
    tFaseTecPROJETO: TStringField;
    tFaseTecFASE: TStringField;
    tFaseTecTECNICO: TStringField;
    tFaseTecSTATUS: TStringField;
    tFaseTecSYNC: TBooleanField;
    tTipoHoraID: TStringField;
    tTipoHoraDESCRICAO: TStringField;
    tTipoHoraTIPO: TStringField;
    tOSGERAREEMB: TBooleanField;
    tOSTIPOREEMB: TStringField;
    tOSCLIREEMB: TStringField;
    tOSKMDESTINO: TFloatField;
    tOSPEDAGIO1: TFloatField;
    tOSPEDAGIO2: TFloatField;
    tOSPEDAGIO3: TFloatField;
    tOSPEDAGIO4: TFloatField;
    tOSMOTIVO: TStringField;
    tOSFaseCLIENTE: TStringField;
    tOSFasePROJETO: TStringField;
    tOSFaseDATA: TStringField;
    tOSFaseOS: TFloatField;
    tOSFaseITEM: TStringField;
    tOSFaseFASE: TStringField;
    tOSFaseTECNICO: TStringField;
    tOSFaseHORAS: TStringField;
    tOSFaseSYNC: TBooleanField;
    tOSFaseTIPOHORA: TStringField;
    tOSFaseOCORRENCIA: TStringField;
    tOSFaseREVISAO: TStringField;
    tOSFaseDescCLIENTE: TStringField;
    tOSFaseDescPROJETO: TStringField;
    tOSFaseDescFASE: TStringField;
    tOSFaseDescTECNICO: TStringField;
    tOSFaseDescITEM: TStringField;
    tOSFaseDescPOS: TFloatField;
    tOSFaseDescTEXTO: TStringField;
    tOSFaseDescSYNC: TBooleanField;
    tOSFaseDescDATA: TStringField;
    tOSFaseDescOS: TSmallintField;
    tOSVEICPROP: TStringField;
    tProjetoHORASPREV: TFloatField;
    tProjetoHORASREAL: TFloatField;
    tProjetoPOSICAO: TStringField;
    tFeriado: TDbf;
    Data: TStringField;
    DESCRICAO: TStringField;
    tFaseOBS: TStringField;
    tClienteVLPEDAG: TFloatField;
    tClientePGALIM: TBooleanField;
    tClientePGHOSP: TBooleanField;
    tClienteCIDADE: TStringField;
    tClienteKM: TFloatField;
    tProjetoVERSAOPROJ: TStringField;
    tProjetoAPAGAR: TStringField;
    tOSVERSAOPROJ: TStringField;
    tOSAPAGAR: TStringField;
    tOSFaseAPAGAR: TStringField;
    tOSFaseDescAPAGAR: TStringField;
    tClienteValorKM: TFloatField;
    tProjetoAPSEMOS: TStringField;
    tOSABONAINT: TStringField;
    tOSOBRIGAINT: TStringField;
    tOSIINT: TStringField;
    tOSFINT: TStringField;
    tProjetoABONAINT: TStringField;
    tOSVLTRANS: TFloatField;
    tTipoHoraSEMTRANS: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ChecaTabelas(Path: String);
    { Public declarations }
  end;

var
  dmDBF: TdmDBF;

implementation

uses
  uChecaTDBF, uDTSyncDef;

{$R *.DFM}

{ TdmDBF }

procedure TdmDBF.ChecaTabelas(Path: String);
var 
  I : Integer;
  T : TDBF;
begin
  for I := 0 to pred(ComponentCount) do
  if Components[I] is TDBF then begin
    T := Components[I] as TDBF;
    T.FilePath := Path;
    ChecaTabela(T, True, False);
    T.Active := False;
    T := Components[I] as TDBF;
    if T.Tag=1 then begin
      T.TableName := 'u' + T.TableName;
      ChecaTabela(T, True, False);
    end;
  end;
end;

procedure TdmDBF.DataModuleCreate(Sender: TObject);
begin
  tProjetoID.Size := cfgTamProjeto;
  tProjetoID.DisplayWidth := cfgTamProjeto;

  tAmarraFaseProjeto.Size := cfgTamProjeto;
  tAmarraFaseProjeto.DisplayWidth := cfgTamProjeto;

  tFaseProjeto.Size := cfgTamProjeto;
  tFaseProjeto.DisplayWidth := cfgTamProjeto;

  tFaseTecProjeto.Size := cfgTamProjeto;
  tFaseTecProjeto.DisplayWidth := cfgTamProjeto;

  tOSProjeto.Size := cfgTamProjeto;
  tOSProjeto.DisplayWidth := cfgTamProjeto;

  tOSFaseProjeto.Size := cfgTamProjeto;
  tOSFaseProjeto.DisplayWidth := cfgTamProjeto;

  tOSFaseDescProjeto.Size := cfgTamProjeto;
  tOSFaseDescProjeto.DisplayWidth := cfgTamProjeto;

  tSolicitaProjeto.Size := cfgTamProjeto;
  tSolicitaProjeto.DisplayWidth := cfgTamProjeto;

  tSolicitaDescProjeto.Size := cfgTamProjeto;
  tSolicitaDescProjeto.DisplayWidth := cfgTamProjeto;

end;

end.
