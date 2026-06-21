#Include "TOPCONN.CH"
#include "RWMAKE.CH"
#Include "TBICONN.CH"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡ao    ³ DT_UPL         ³Autor³ Siga RP            ³Data ³09/09/2002³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Upload DIATEC                              v07             ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³                                                            ³±±
±±³Empresa   ³ Siga Campinas                                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
Alteracoes :
Cireli - 16/10/2002 - Alteracoes efetuadas em funcao de versao nova do Diatec  
Cireli - 24/10/2002 - Incluida validacao para campo memo vazio    
Cireli - 18/11/2002 - Inclusao do abono no total de horas  
Cireli - 19/11/2002 - Acerto na gravacao do AFF  
Cireli - 21/11/2002 - Inclusao da gravacao arquivos de seguranca 
Cireli - 10/12/2002 - Gravacao do campo ZZO_OCORRE
*/

User Function DT_Upl()
	If File(_cPathD+"UPPEND.SEM")
		ConOut("*v07                       UPLOAD Iniciado                                    *")
	   FRename(_cPathD+"UPPEND.SEM",_cPathD+"PROTHEUS.SEM")
	   _cArquivo := _cPathD+"PROTHEUS.SEM"
	   USE &_cArquivo EXCLUSIVE ALIAS "CTRL" VIA "DBFCDXADS" NEW
       AcertaTec()
	   Begin Transaction
  	   	Le_Apont()
	   	Le_Fase()  
        Le_OS()
	   	Le_Solic()    
	   End Transaction    
	   Gv_arqs()  // Grava arquivos de seguranca                             
	   ZAPALL()                                     
	   PMSACAFC()      	   
	   dbCloseArea("CTRL")
	   FRename(_cPathD+"PROTHEUS.SEM",_cPathD+"LIBERADO.SEM")
	   ConOut("*                          UPLOAD Finalizado                                  *")
	Else              
	   ConOut("*      Sem Uploads a Processar - Tentativa na proxima execucao do Scheduller  *")
	EndIf
Return(.T.)
//------------------------------------------------------------------

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡ao    ³ Gv_arqs         ³Autor³ Siga Campinas      ³Data ³21/11/2002³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³ Upload DIATEC                              v01             ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³                                                            ³±±
±±³Empresa   ³ Siga Campinas                                              ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
Static Function Gv_arqs() 
Local _cArquivo1 := STRZERO(DAY(DDATABASE),2)+SUBSTR(TIME(),1,2)+;
                                   SUBSTR(TIME(),4,2)+SUBSTR(TIME(),7,2)+".DBF"                          
Local _cArquivo := ""                                   
dbSelectArea("DT_MEMO")
_cArquivo := _cPathD+"ARQS\MEMO" + _cArquivo1
copy to &_cArquivo
dbSelectArea("DT_FOS")
_cArquivo := _cPathD+"ARQS\FOS" + _cArquivo1
copy to &_cArquivo
dbSelectArea("DT_FSE")
_cArquivo := _cPathD+"ARQS\FSE" + _cArquivo1
copy to &_cArquivo
dbSelectArea("DT_OS")
_cArquivo := _cPathD+"ARQS\OS" + _cArquivo1
copy to &_cArquivo
dbSelectArea("DT_USOL")
_cArquivo := _cPathD+"ARQS\USOL" + _cArquivo1
copy to &_cArquivo
dbSelectArea("DT_USDESC")
_cArquivo := _cPathD+"ARQS\DESC" + _cArquivo1
copy to &_cArquivo
Return(Nil)

//Le tabela de fases do projeto
Static Function Le_Fase()
Local i:=0                   
Local j:=0
SET CENTURY ON                                    
_cArquivo := _cPathD+"UFASE.DBF"
USE &_cArquivo EXCLUSIVE ALIAS "DT_FSE" VIA "DBFCDXADS" NEW
dbSelectArea("DT_FSE")
DbGoTop()
Do While !EOF()
   
   dbSelectArea("AF9")
   dbSeek(xFilial()+DT_FSE->PROJETO+DT_FSE->REVISAO+DT_FSE->ID+"  ",.F.)
   If Found()          
   
      RecLock("AF9",.F.)
      AF9->AF9_FILIAL  := xFilial()
	  AF9->AF9_STATUS  := IIF(Empty(DT_FSE->STATUS),"P",DT_FSE->STATUS)
	  AF9->AF9_VALID   := DT_FSE->VALIDADOR
	  AF9->AF9_DTATUI  := CTOD(DT_FSE->DATREI)  
      AF9->AF9_DTATUF  := CTOD(DT_FSE->DATREF) 
      AF9->AF9_DTVLD   := CTOD(DT_FSE->DATAVLD)
      AF9->AF9_PERCST  := IIF(DT_FSE->PERCEST > 100,100,DT_FSE->PERCEST)
      AF9->AF9_NOVOHR  := IIF(DT_FSE->FLAGSUG=="NP",IIF(DT_FSE->NOVOHOR > 0, DT_FSE->NOVOHOR, DT_FSE->HORAS),0)
      AF9->AF9_NOVOIN  := IIF(DT_FSE->FLAGSUG=="NP",IIF(Empty(CTOD(DT_FSE->DATREI)),IIF(EMPTY(CTOD(DT_FSE->NOVOINI)),CTOD(DT_FSE->INICIO),CTOD(DT_FSE->NOVOINI)),CTOD(DT_FSE->DATREI)),CTOD("  /  /  "))
      AF9->AF9_NOVOFI  := IIF(DT_FSE->FLAGSUG=="NP",IIF(Empty(CTOD(DT_FSE->NOVOFIM)),CTOD(DT_FSE->TERMINO),CTOD(DT_FSE->NOVOFIM)),CTOD("  /  /  "))
      AF9->AF9_JUSTIF  := DT_FSE->JUSTIFIC
      AF9->AF9_TECSUG  := DT_FSE->TECSUG
      AF9->AF9_MOTSUG  := IIF(!EMPTY(DT_FSE->MOTSUG),DT_FSE->MOTSUG,"N") 
      AF9->AF9_FLAGSU  := IIF(DT_FSE->FLAGSUG=="NP","AN",IIF(EMPTY(AF9->AF9_FLAGSU),"NN",IIF(AF9->AF9_FLAGSU=="LN","LN",DT_FSE->FLAGSUG)))
      AF9->AF9_CLISUG  := DT_FSE->CLISUG
      AF9->AF9_DATSUG  := CTOD(DT_FSE->DATASUG)
      MsUnlock()
   Else
      ConOut("ERRO - Fase não encontrada - Projeto: "+DT_FSE->PROJETO+"-Revisao: "+DT_FSE->REVISAO+ "-Fase: "+DT_FSE->ID)
   EndIf

   //Se houve solicitacao na fase grava o ZZU
   dbSelectArea("ZZU")
   dbSeek(xFilial("ZZU")+DT_FSE->PROJETO+DT_FSE->ID+"  "+DT_FSE->TECSUG+DTOS(CTOD(DT_FSE->DATASUG)),.T.)
   Do While (AllTrim(DT_FSE->PROJETO)==AllTrim(ZZU->ZZU_PROJET)).AND.(AllTrim(DT_FSE->ID)==AllTrim(ZZU->ZZU_FASE)).AND.(AllTrim(DT_FSE->TECSUG)==AllTrim(ZZU->ZZU_TECNIC)).AND.(CTOD(DT_FSE->DATASUG)==ZZU->ZZU_DTSOL).AND.!Eof()
      dbSkip()
   EndDo
   dbSkip(-1)
   If (AllTrim(DT_FSE->PROJETO)==AllTrim(ZZU->ZZU_PROJET)).AND.(AllTrim(DT_FSE->ID)==AllTrim(ZZU->ZZU_FASE)).AND.(AllTrim(DT_FSE->TECSUG)==AllTrim(ZZU->ZZU_TECNIC)).AND.(CTOD(DT_FSE->DATASUG)==ZZU->ZZU_DTSOL) 
      cSeq := StrZero(Val(ZZU->ZZU_SEQ)+1,2)
   Else
      cSeq := "01"
   EndIf
      
   If DT_FSE->MOTSUG <> 'N' .AND. DT_FSE->FLAGSUG == "NP"

      dbSelectArea("ZZU")
      RecLock("ZZU",.T.)
      ZZU->ZZU_FILIAL := xFilial("ZZU")
      ZZU->ZZU_PROJET := DT_FSE->PROJETO 
      ZZU->ZZU_FASE   := DT_FSE->ID
      ZZU->ZZU_REVISA := DT_FSE->REVISAO
      ZZU->ZZU_DTIANT := CTOD(DT_FSE->INICIO)
      ZZU->ZZU_DTFANT := CTOD(DT_FSE->TERMINO)
      ZZU->ZZU_HRANT  := StrZero(Int(DT_FSE->HORAS),2)+":"+IIF(DT_FSE->HORAS-Int(DT_FSE->HORAS)>0,StrZero((DT_FSE->HORAS-Int(DT_FSE->HORAS))*60,2),"00")
      ZZU->ZZU_DTIPR  := IIF(Empty(CTOD(DT_FSE->DATREI)),IIF(EMPTY(CTOD(DT_FSE->NOVOINI)),CTOD(DT_FSE->INICIO),CTOD(DT_FSE->NOVOINI)),CTOD(DT_FSE->DATREI))
      ZZU->ZZU_DTFPR  := IIF(Empty(CTOD(DT_FSE->NOVOFIM)),CTOD(DT_FSE->TERMINO),CTOD(DT_FSE->NOVOFIM))
      ZZU->ZZU_HRPR   := IIF(!EMPTY(DT_FSE->NOVOHOR),StrZero(Int(DT_FSE->NOVOHOR),2)+":"+IIF(DT_FSE->HORAS-Int(DT_FSE->NOVOHOR)>0,StrZero((DT_FSE->HORAS-Int(DT_FSE->NOVOHOR))*60,2),"00"),;
                                                     StrZero(Int(DT_FSE->HORAS),2)+":"+IIF(DT_FSE->HORAS-Int(DT_FSE->HORAS)>0,StrZero((DT_FSE->HORAS-Int(DT_FSE->HORAS))*60,2),"00"))
      ZZU->ZZU_DTIREA := CTOD(DT_FSE->DATREI)
      ZZU->ZZU_DTFREA := CTOD(DT_FSE->DATREF)
      ZZU->ZZU_HRREA  := StrZero(Int(DT_FSE->HORASREAL),2)+":"+IIF(DT_FSE->HORASREAL-Int(DT_FSE->HORASREAL)>0,StrZero((DT_FSE->HORASREAL-Int(DT_FSE->HORASREAL))*60,2),"00")
      ZZU->ZZU_PERCST := DT_FSE->PERCEST
      ZZU->ZZU_PERCRE := (DT_FSE->HORASREAL/DT_FSE->HORAS)*100
      ZZU->ZZU_SOLIC  := DT_FSE->JUSTIFIC
      ZZU->ZZU_TIPO   := DT_FSE->MOTSUG
      ZZU->ZZU_TECNICO:= DT_FSE->TECSUG
      ZZU->ZZU_SOLCLI := DT_FSE->CLISUG
      ZZU->ZZU_ENTDOC := "N" 
      ZZU->ZZU_EXGDOC := IIF(DT_FSE->MOTSUG=="C","S","N") 
      ZZU->ZZU_DTSOL  := CTOD(DT_FSE->DATASUG)
      ZZU->ZZU_SEQ    := cSeq
      msUnlock()         

      j++
   EndIf   
   
   dbSelectArea("DT_FSE")
   dbSkip() 
   i++
   
EndDo              

ConOut("Fases:           "+STRZERO(i,3)+" Registros")  
ConOut("Sol.Alt.Fase:    "+STRZERO(j,3)+" Registros") 
SET CENTURY OFF

Return(Nil)           


//Le tabela de apontamentos por fase
Static Function AcertaTec()
SET CENTURY ON
_cArquivo := _cPathD+"UOS.DBF"                          
USE &_cArquivo EXCLUSIVE ALIAS "AC1" VIA "DBFCDXADS" NEW
dbSelectArea("AC1")
DbGoTop()
Do While !EOF()   
   AC1->TECNICO := UPPER(AC1->TECNICO)
   dbSkip()
Enddo
dbSelectArea("AC1")
DBCloseArea("AC1")

_cArquivo := _cPathD+"UOSFASE.DBF"                          
USE &_cArquivo EXCLUSIVE ALIAS "AC2" VIA "DBFCDXADS" NEW
dbSelectArea("AC2")
DbGoTop()
Do While !EOF()   
   AC2->TECNICO := UPPER(AC2->TECNICO)
   dbSkip()
Enddo
dbSelectArea("AC2")
DBCloseArea("AC2")

_cArquivo := _cPathD+"UFASE.DBF"                          
USE &_cArquivo EXCLUSIVE ALIAS "AC3" VIA "DBFCDXADS" NEW
dbSelectArea("AC3")
DbGoTop()
Do While !EOF()   
   AC3->TECSUG := UPPER(AC3->TECSUG)
   dbSkip()
Enddo
dbSelectArea("AC3")
DBCloseArea("AC3")

_cArquivo := _cPathD+"USOLICITA.DBF"
USE &_cArquivo EXCLUSIVE ALIAS "AC4" VIA "DBFCDXADS" NEW                                     

dbSelectArea("AC4")
DbGoTop()
Do While !EOF()
   AC4->TECNICO := UPPER(AC4->TECNICO)
   dbSkip()
EndDo
dbSelectArea("AC4")
DBCloseArea("AC4")

Return(Nil)

//----------------------------------
//Le tabela de apontamentos por fase

Static Function Le_Apont()
Local i := 0 
Local j := 0
Local cQry             
Local aDesc  := {}
Local aDesc2 := {}
Local cDesc := "" 
Local nHrAcu := 0

SET CENTURY ON
_cArquivo := _cPathD+"UOSFASE.DBF"                          
_cArqNTX  := _cPathD+"OSFASE.NTX"                          

USE &_cArquivo EXCLUSIVE ALIAS "DT_FOS" VIA "DBFCDXADS" NEW
INDEX ON CLIENTE+PROJETO+FASE+TECNICO+STR(ITEM,5,0) TO &_cArqNTX
_cArquivo := _cPathD+"UOSFASEDESC.DBF"                                                   
_cArqNTX  := _cPathD+"OSFSEDC.NTX"
USE &_cArquivo EXCLUSIVE ALIAS "DT_MEMO" VIA "DBFCDXADS" NEW
INDEX ON CLIENTE+PROJETO+FASE+TECNICO+STR(ITEM,5,0)+STR(POS,5,0) TO &_cArqNTX
dbSelectArea("DT_MEMO")                          
dbSelectArea("DT_FOS")
DbGoTop()
Do While !EOF()   

   dbSelectArea("DT_MEMO")
   dbGoTop()
   Do While !Eof()
      If UPPER(DT_MEMO->CLIENTE) == UPPER(DT_FOS->CLIENTE) .And. DT_MEMO->PROJETO == DT_FOS->PROJETO .And. DT_MEMO->FASE == DT_FOS->FASE .And.;
         UPPER(DT_MEMO->TECNICO) == UPPER(DT_FOS->TECNICO) .And. DT_MEMO->ITEM == DT_FOS->ITEM
         AADD(aDesc2,AllTrim(DT_MEMO->TEXTO)+"\13\10")
      EndIf  
      dbSkip()
   EndDo

   dbSelectArea("AFF")
   dbSetOrder(2)
   nHrAcu := 0
   //Posiciona no primeiro apontamento para acumular as horas
   
   dbSeek(xFilial()+DT_FOS->PROJETO+DT_FOS->REVISAO+DT_FOS->FASE,.T.)
   Do While AFF->AFF_FILIAL==xFilial() .And. ;
            AllTrim(AFF->AFF_PROJET) == Alltrim(DT_FOS->PROJETO) .And. ;
            AllTrim(AFF->AFF_REVISA) == AllTrim(DT_FOS->REVISAO) .And. ;
            AllTrim(AFF->AFF_TAREFA) == Alltrim(DT_FOS->FASE) .And. !Eof()
      nHrAcu := nHrAcu + AFF->AFF_HRAPT
      dbSkip()
   EndDo   
   
   nHrAcu := nHrAcu+(Val(Subs(DT_FOS->HORAS,1,2))+Val(Subs(DT_FOS->HORAS,4,2))/60)
   
   RecLock("AFF",.T.)
   AFF->AFF_FILIAL := xFilial()
   AFF->AFF_PROJET := DT_FOS->PROJETO
   AFF->AFF_DATA   := CTOD(DT_FOS->DATA)   
   /*CONOUT(STRZERO(DT_FOS->OS,4))*/
   If DT_FOS->OS <> -1
      AFF->AFF_OS  := DT_FOS->CLIENTE+DT_FOS->TECNICO+;
                      DTOS(CTOD(AllTrim(DT_FOS->DATA)))+;
                      STRZERO(DT_FOS->OS,4)
   EndIf
   AFF->AFF_TAREFA := DT_FOS->FASE
   AFF->AFF_TECNIC := DT_FOS->TECNICO
   AFF->AFF_QUANT  := nHrAcu
   AFF->AFF_HRAPT  := Val(Subs(DT_FOS->HORAS,1,2))+Val(Subs(DT_FOS->HORAS,4,2))/60
   AFF->AFF_TPHR   := Iif(Alltrim(DT_FOS->TIPOHORA)=="05.9999","05.0065",DT_FOS->TIPOHORA)
   AFF->AFF_REVISA := DT_FOS->REVISAO  
   AFF->AFF_OCORRE := DT_FOS->OCORRENCIA
   AFF->AFF_USER   := "000001" //Grava como usuario Administrador 
   AFF->AFF_ITEM   := StrZero(DT_FOS->ITEM,2)
   
   If Len(aDesc2) > 0
  	  MSMM(,70,,"XXXXX",1,,,"AFF","AFF_CODMEM")      
   else 
	  	//------------------------------------	 
      cMensagem := "<hr>"
      cMensagem := cMensagem + "<p align='center'><b><font face='Courier New' color='#FF0000' size='4'>"
	  cMensagem := cMensagem + "CAMPO MEMO VAZIO -->" + AFF->AFF_OS + " " + DTOC(Date())+"-"+Time() 
	  cMensagem := cMensagem + "</font></b></p><hr>"
	  U_EmailTo(_cServD,_cEmailA,"010101","Job WFL",{_cEmailA},{},{},"CAMPO MEMO VAZIO",cMensagem,{},.F.)
	  dbSelectArea("DT_MEMO")
	  _cArquivo1 := STRZERO(DAY(DDATABASE),2)+SUBSTR(TIME(),1,2)+;
	                                                           SUBSTR(TIME(),4,2)+SUBSTR(TIME(),7,2)+".DBF"                          
	  _cArquivo := _cPathD + "D" + _cArquivo1
	  copy to &_cArquivo
	  dbSelectArea("DT_FOS")
	  _cArquivo := _cPathD + "F" + _cArquivo1
	  copy to &_cArquivo
	  dbSelectArea("AFF")   
	  //------------------------------------			     
	  
	EndIf    
	
	PMSAvalAFF("AFF",1)
	MsUnlock()
	If Len(aDesc2) > 0
		GravaMemo(aDesc2)
	EndIf    

   cDesc := ""
   aDesc  := {}
   aDesc2 := {}
   dbSelectArea("DT_FOS")
   dbSkip() 
   j++
EndDo 

ConOut("Apontamentos:    "+STRZERO(j,3)+" Registros")

Return(Nil)

//---------------------------------------------------------------------------------------------------------------
// Gera tabela de Ordens de Servico
Static Function Le_OS()
Local i := 0
Local _cStatus := ""

SET CENTURY ON   
_cArquivo := _cPathD+"UOS.DBF" 
USE &_cArquivo EXCLUSIVE ALIAS "DT_OS" VIA "DBFCDXADS" NEW
If select("DT_FOS")== 0  //  !USED("DT_FOS")        
   _cArquivo := _cPathD+"UOSFASE.DBF"
   USE &_cArquivo EXCLUSIVE ALIAS "DT_FOS" VIA "DBFCDXADS" NEW                 
EndIf   
dbSelectArea("SA1")
dbSetOrder(1)      //Cliente
dbSelectArea("SA9")
dbSetOrder(1)      //Tecnico
dbSelectArea("ZZO")
dbSetOrder(2)    //Tecnico+DataOS+HrEntra
dbSelectArea("DT_OS")
DbGoTop()
Do While !EOF()    

   dbSelectArea("ZZO")
   dbSeek(xFilial("ZZO")+DT_OS->CLIENTE+DT_OS->TECNICO+DTOS(CTOD(DT_OS->DATA))+DT_OS->INICIO,.F.)
   If Found()
      ConOut("ERRO - Resincronismo-OS: "+StrZero(DT_OS->ID,2)+"-Data: "+DT_OS->DATA)      
   Else
      //Posiciona um dos apontamentos da OS para buscar o produto
      dbSelectArea("DT_FOS")
      dbGoTop()
      lAchou := .F.
      Do While !lAchou .and. !Eof()
      
         IF DT_OS->CLIENTE == DT_FOS->CLIENTE .and. DT_OS->TECNICO == DT_FOS->TECNICO .and. DT_OS->DATA == DT_FOS->DATA .and. STRZERO(DT_OS->ID,6) == STRZERO(DT_FOS->OS,6)
            lAchou := .T.
         Else   
            dbSkip()
         EndIf      
      EndDo              
      
      //Posiciona a tabela de motivos de abono para buscar a descrição do abono
      dbSelectArea("SX5")
      dbSeek(xFilial("SX5")+"73"+DT_OS->MOTIVOABON,.T.)
      
      //Posiciona a tabela de CLIENTES
      dbSelectArea("SA1")
      dbSeek(xFilial("SA1")+DT_OS->CLIENTE)

      //Posiciona a tabela de Tecnicos
      dbSelectArea("SA9")
      dbSeek(xFilial("SA9")+DT_OS->TECNICO)
//	  If SA9->A9_FLAG == "S" .and. AllTrim(DT_OS->CLIENTE)=="PAIOM"
//	  	 _cStatus := "OK"
// 	  Else
		_cStatus := "ERR"
//	  EndIf                             
		
	  If Upper(Substr(SA1->A1_NOME,1,8)) == "TRAILLER"
		dbSkip()
		Loop
	  Endif
      
      //Posiciona a tabela de ocorrências de apontamentos
      dbSelectArea("AE7")
      dbSetOrder(1)
      dbSeek(xFilial("AE7")+DT_FOS->OCORRENCIA,.T.)
            
      dbSelectArea("ZZO")          
      RecLock("ZZO",.T.)
      ZZO->ZZO_FILIAL := xFilial("ZZO")
      ZZO->ZZO_CLIENT := DT_OS->CLIENTE
      ZZO->ZZO_LOJA   := SA1->A1_LOJA  //"01"    
      ZZO->ZZO_NOMCLI := SA1->A1_NOME
	  ZZO->ZZO_TECNIC := DT_OS->TECNICO 
	  ZZO->ZZO_USUARI := SA9->A9_NOMETEC
	  ZZO->ZZO_PRODUT := Iif(Alltrim(DT_FOS->TIPOHORA)=="05.9999","05.0065",DT_FOS->TIPOHORA)
	  ZZO->ZZO_DATAOS := CTOD(DT_OS->DATA)         
	  ZZO->ZZO_HRENTR := DT_OS->INICIO     
	  ZZO->ZZO_HRSAID := DT_OS->TERMINO    
	  ZZO->ZZO_HRTRAN := DT_OS->TRANSLADO
	  ZZO->ZZO_MOTABO := IIF(Empty(DT_OS->MOTIVOABON),"SEM ABONO",SX5->X5_DESCRI)
	  ZZO->ZZO_HRABON := iif(Empty(DT_OS->ABONO),"00:00",DT_OS->ABONO)
	  ZZO->ZZO_TOTAL  := U_CalcHora(DT_OS->INICIO,DT_OS->TERMINO,DT_OS->TRANSLADO,ZZO->ZZO_HRABON) 
	  ZZO->ZZO_STPAP  := If(AllTrim(DT_OS->CLIENTE)=="PAIOM","01","02")
	  ZZO->ZZO_STPAPD := TABELA("ZC",ZZO->ZZO_STPAP)
	  ZZO->ZZO_LOCAL  := DT_OS->LOCAL
	  ZZO->ZZO_ORIGEM := "DIATEC"
	  ZZO->ZZO_PROJET := DT_FOS->PROJETO
	  ZZO->ZZO_OS     := DT_OS->CLIENTE+DT_OS->TECNICO+DTOS(CTOD(DT_OS->DATA))+STRZERO(DT_OS->ID,4)
	  If ZZO->ZZO_HRSAID == "00:00"
		  ZZO->ZZO_HRSAID := "24:00"    
	  EndIf                        
	  if Empty(ZZO->ZZO_HRTRAN)
		  ZZO->ZZO_HRTRAN := "00:00"    
	  Endif      
	  ZZO->ZZO_DTIMP  := dDataBase        
	  ZZO->ZZO_OCORRE := DT_FOS->OCORRENCIA	  
	  MsUnlock()
	  
	  dbSelectArea("AF8")
	  dbSetOrder(01)
	  If dbSeek(xFilial("AF8")+ZZO->ZZO_PROJET)
	     RecLock("AF8",.F.)
	     AF8->AF8_ATUALIZ := "N"
	     MsUnlock()
	  EndIf                        
	  
	  dbSelectArea("ZZO")          
	  
   EndIf       
   dbSelectArea("DT_OS")
   dbSkip()       
   i++
   
EndDo    
ConOut("OS       :       "+STRZERO(i,3)+" Registros")
SET CENTURY OFF

Return(Nil)

//----------------------------------------------------------------------------------------------------------
//Le tabela de comunicações/solicitações de projeto

Static Function Le_Solic()
Local i := 0 
Local j := 0

SET CENTURY ON
_cArquivo := _cPathD+"USOLICITA.DBF"
USE &_cArquivo EXCLUSIVE ALIAS "DT_USOL" VIA "DBFCDXADS" NEW                                     
_cArquivo := _cPathD+"USOLICITADESC.DBF"
_cArqNTX  := _cPathD+"USOLDSC.NTX"
USE &_cArquivo EXCLUSIVE ALIAS "DT_USDESC" VIA "DBFCDXADS" NEW
INDEX ON CLIENTE+PROJETO+TECNICO+DATA+STR(ITEM,5,0)+STR(POS,5,0) TO &_cArqNTX

dbSelectArea("DT_USOL")
DbGoTop()

Do While !EOF()           

   cMemo := ""
   dbSelectArea("DT_USDESC")
   dbSeek(DT_USOL->CLIENTE+DT_USOL->PROJETO+DT_USOL->TECNICO+DT_USOL->DATA+STR(DT_USOL->ITEM,5,0),.F.)
   Do While DT_USOL->CLIENTE == DT_USDESC->CLIENTE .AND. DT_USOL->PROJETO == DT_USDESC->PROJETO .AND. DT_USOL->TECNICO == DT_USDESC->TECNICO .AND. DT_USOL->DATA == DT_USDESC->DATA .AND. DT_USOL->ITEM == DT_USDESC->ITEM .AND. !Eof()
      cMemo := cMemo+Alltrim(DT_USDESC->TEXTO)+Chr(13)   
      j++
      dbSkip()
   EndDo
   dbSelectArea("ZZV")   
   RecLock("ZZV",.T.)
   ZZV->ZZV_FILIAL := xFilial()
   ZZV->ZZV_CLIENT := DT_USOL->CLIENTE
   ZZV->ZZV_LOJA   := "01"
   ZZV->ZZV_PROJET := DT_USOL->PROJETO
   ZZV->ZZV_TECNIC := DT_USOL->TECNICO
   ZZV->ZZV_DATA   := CTOD(DT_USOL->DATA)
   ZZV->ZZV_TIPO   := DT_USOL->TIPO
   ZZV->ZZV_ORIGEM := DT_USOL->ORIGEM
   ZZV->ZZV_NOMCLI := DT_USOL->NOMERESP
   ZZV->ZZV_CDMEME := cMemo
   ZZV->ZZV_ITEM   := STRZERO(DT_USOL->ITEM,5)
   msUnlock()
   dbSelectArea("DT_USOL")
   dbSkip() 
   i++

EndDo 
ConOut("Solicitacoes:    "+STRZERO(i,3)+" Registros") 
ConOut("Descr.Solic.:    "+STRZERO(j,3)+" Registros")
Return(Nil)



Static Function PrimMai(cTxt)
Local i := 0
Local cOut := ""
Local lMai := .T.
Local lPalavra := .F.
For i := 1 to Len(cTxt)
   If Subs(cTxt,i,1)$" ./-"
      If lPalavra
         cOut := cOut + Subs(cTxt,i,1)
      EndIf   
      lMai := .T.
   Else
      IIF(lMai,cOut := cOut + UPPER(Subs(cTxt,i,1)),cOut := cOut + LOWER(Subs(cTxt,i,1)))      
      lPalavra := .T.
      lMai := .F.
   EndIf
Next i
Return(cOut)      
                       

Static Function GravaMemo(aDesc) 
Local i := 1
Local j
DbSelectArea("SYP")
DbSetOrder(1)
DbSeek(xFilial()+AFF->AFF_CODMEM,.T.)
Do While AFF->AFF_CODMEM == SYP->YP_CHAVE .and. !Eof()
   If Val(SYP->YP_SEQ)==i
      RecLock("SYP",.F.)
      SYP->YP_TEXTO := aDesc[i]
      MsUnlock()
   EndIf
   dbSkip()
   i++
EndDo
If i <= Len(aDesc)
   For j := i to Len(aDesc)
      RecLock("SYP",.T.)
      SYP->YP_FILIAL := xFilial()
      SYP->YP_CHAVE  := AFF->AFF_CODMEM
      SYP->YP_SEQ    := StrZero(J,3)
      SYP->YP_TEXTO  := aDesc[J]
      SYP->YP_CAMPO  := "AFF_CODMEM"
      MsUnlock()
   Next j
EndIf
Return(Nil)      
     
Static Function ZAPALL()
   dbSelectArea("DT_FSE")
   ZAP
   dbCloseArea("DT_FSE")   
   dbSelectArea("DT_FOS")         
   ZAP
   dbCloseArea("DT_FOS") 
   dbSelectArea("DT_MEMO")
   ZAP                
   dbCloseArea("DT_MEMO")
   dbSelectArea("DT_OS")
   ZAP
   DBCloseArea("DT_OS")
   dbSelectArea("DT_USOL")
   ZAP         
   dbCloseArea("DT_USOL") 
   dbSelectArea("DT_USDESC")
   ZAP                
   dbCloseArea("DT_USDESC")

Return(Nil)
