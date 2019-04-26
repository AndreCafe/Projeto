unit ncAppUrlLog;

interface

uses
  SysUtils,
  DB,
  Dialogs,
  Classes,
  Windows,                  
  ClasseCS,
  ncClassesBase;

type

  TncNetNameID = String[16];

  TncAppInfo = record
    aiExe  : String;
    aiPath : String;
    aiTit  : String;
    aiExeID : TncNetNameID;
    aiPathID : TncNetNameID;
    aiTitID : TncNetNameID;
  end;

  TncUrlInfo = record
    uiHost    : String;
    uiDominio : String;
    uiPagina  : String;
    uiHostID  : TncNetNameID;
    uiDominioID : TncNetNameID;
    uiPaginaID  : TncNetNameID;
  end;

  TncSearchInfo = record
    siEng : String[2];
    siArg : String;
    siArgID : TncNetNameID;
  end;

  TncAppUrlLogItem = class
  private
    function GetString: String;
    procedure SetString(const Value: String);
  public
    logSessao : Integer;
    logDH     : TDateTime;
    logExe    : String;
    logTit    : String;
    logUrl    : String;
    logMaq    : Integer;

    constructor Create;

    procedure SetData(aMaq, aSessao: Integer; aDH: TDateTime; aExe, aTit, aUrl: String);

    property AsString: String
      read GetString write SetString;
  end; 

  TncAppUrlLog = class
  private
    FItens : TList;
    function GetItem(I: Integer): TncAppUrlLogItem;
    function GetString: String;
    procedure SetString(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Remove(Item: TncAppUrlLogItem);
    procedure Delete(aIndex: Integer);
    
    procedure Limpa;

    function Count: Integer;

    function NewItem: TncAppUrlLogItem;

    procedure SaveToStream(S: TStream);
    procedure LoadFromStream(S: TStream);

    property Itens[I: Integer]: TncAppUrlLogItem
      read GetItem; Default;

    property AsString: String
      read GetString write SetString;  
  end;

  procedure ExtractAppInfo(sExe, sTit : String; var AI: TncAppInfo);
  procedure ExtractUrlInfo(S : String; var UI: TncUrlInfo);
  procedure ExtractSearchInfo(aDominio, aPagina : String; var SI: TncSearchInfo);

  function GetNetNameID(S: String): TncNetNameID;
  function GetDominio(S: String): String;


const 
// Search Engines
  seYahoo     = 'yh';
  seGoogle    = 'gg';
  seAsk       = 'as';
  seUol       = 'uo';
  seMicrosoft = 'ms';
  seAol       = 'ao';
  seGlobo     = 'gb';
  seTerra     = 'tr';
  seIG        = 'ig';

// LogNome Type  
  ntHost      = 'H';
  ntDominio   = 'D';
  ntPagina    = 'P';
  ntSearchArg = 'S';
  ntExe       = 'E';
  ntCaminho   = 'C';
  ntTitulo    = 'T';
  
var
  slTld : TStrings;  

implementation

uses MD5;

{ TncAppUrlLogItem }

function GetNetNameID(S: String): TncNetNameID;
begin
  if S>'' then
    Result := GetMD5KeyStr(S) else
    Result := '';
end;

procedure ExtractAppInfo(sExe, sTit : String; var AI: TncAppInfo);
begin
  AI.aiExe := LowerCase(ExtractFileName(sExe));
  AI.aiPath := LowerCase(ExtractFilePath(sExe));
  AI.aiTit := sTit;
  AI.aiExeID := GetNetNameID(AI.aiExe);
  AI.aiPathID := GetNetNameID(AI.aiPath);
  AI.aiTitID := GetNetNameID(AI.aiTit);
end;

function GetDominio(S: String): String;
var 
  I, P : Integer;
  Achou : Boolean;
  Str: String;
  

function GetNextPoint: Boolean;
begin
  Inc(I);
  while (I<Length(S)) and (S[I]<>'.') do Inc(I);
  Result := (I<=Length(S)) and (S[I]='.');
end;

begin
  S := LowerCase(Trim(S));
  if Copy(S, 1, 4)='www.' then Delete(S, 1, 4);
  while (S>'') and (S[1]='.') do Delete(S, 1, 1);

  while (S>'') and (S[Length(S)] in  ['/', '\']) do Delete(S, Length(S), 1);
  I := 0;
  Achou := False;
  while (not Achou) and GetNextPoint do begin
    Str := Copy(S, I, 1000);
    Achou := (slTld.IndexOf(Str)>=0);
  end;
                          
  if Achou then begin
    Dec(I);
    while (I>1) and (S[I]<>'.') do Dec(I);
    if I>1 then Inc(I);
    Result := Copy(S, I, 1000);
  end else
    Result := S;
end;


procedure ExtractUrlInfo(S : String; var UI: TncUrlInfo);
var I: Integer;
begin
  S := FormataSiteStr(Trim(S));

  I := Pos('/', S);
  if I>0 then 
    UI.uiHost := Copy(S, 1, I-1) else
    UI.uiHost := S;
  
  UI.uiDominio := GetDominio(Trim(UI.uiHost));
  
  if I>0 then 
    UI.uiPagina := Copy(S, I+1, 1000) else
    UI.uiPagina := '';
    
  UI.uiPaginaID := GetNetNameID(UI.uiPagina);
  UI.uiHostID := GetNetNameID(UI.uiHost);
  UI.uiDominioID := GetNetNameID(UI.uiDominio);  
end;

function RemoveTLD(aDominio: String): String;
var I : Integer;
begin
  I := Pos('.', aDominio);
  if I>0 then
    Result := Copy(aDominio, 1, I-1) else
    Result := aDominio;
end;

function GetHTMLTokens(S: String): TStrings;
var I : Integer;
begin
  Result := TStringList.Create;
  for I := Length(S) downto 1 do 
    if S[I] in ['?', '&', '/', ';']  then begin
      Result.Add(Copy(S, I+1, Length(S)));
      Delete(S, I, 1000);
    end;
  if S>'' then Result.Add(S);
end;

function TrocaMaisPorEsp(S: String): String;
var I, C : Integer;
begin
  I := 0;
  Result := '';
  while I<Length(S) do begin
    Inc(I);
    case S[I] of
      '+' : Result := Result + ' ';
      '%' : begin
        C := StrToIntDef('$'+Copy(S, I+1, 2), 0);
        if C in [32..255] then Result := Result + Char(C);
        I := I + 2;
      end;
    else
      Result := Result + S[I];  
    end;
  end;
end;

procedure ExtractSearchInfo(aDominio, aPagina : String; var SI: TncSearchInfo);
var 
  S, sToken: String;
  I: Integer;
  T: TStrings;

function EBusca(aBusca: String = 'search'): Boolean;
begin
  Result := (T.IndexOf(aBusca)>=0);
end;
  
begin
  Fillchar(SI, SizeOf(SI), 0);
  S := RemoveTLD(aDominio);
  T := GetHTMLTokens(aPagina);
  try
    if SameText(S, 'google') then begin
      if EBusca then begin
        SI.siEng := seGoogle;
        sToken := 'q';
      end;
    end else
    if SameText(S, 'yahoo') then begin
      if EBusca then begin
        SI.siEng := seYahoo;
        sToken := 'p';
      end;
    end else
    if SameText(S, 'live') then begin
      if EBusca('results.aspx') then begin
        SI.siEng := seMicrosoft;
        sToken := 'q';
      end;
    end else
    if SameText(S, 'uol') then begin
      if EBusca('buscar.html') then begin
        SI.siEng := seUol;
        sToken := 'q';
      end;
    end else
    if SameText(S, 'aol') then begin
      if EBusca then begin
        SI.siEng := seAol;
        sToken := 'query';
      end;
    end else
    if SameText(S, 'globo') then begin
      if EBusca('busca') then begin
        SI.siEng := seGlobo;
        sToken := 'query';
      end;
    end else
    if SameText(S, 'terra') then begin
      if EBusca('results.aspx') then begin
        SI.siEng := seTerra;
        sToken := 'query';
      end;
    end else
    if SameText(S, 'igbusca') then begin
      if EBusca then begin
        SI.siEng := seIG;
        sToken := 'q';
      end;
    end else
      SI.siEng := '';
  
    S := T.Values[sToken];
    S := TrocaMaisPorEsp(S);
    sToken := UTF8Decode(S);
    if sToken>'' then
      SI.siArg := LowerCase(sToken) else
      SI.siArg := LowerCase(S);
  finally
    T.Free;
  end;

  SI.siArgID := GetNetNameID(SI.siArg);
end;

constructor TncAppUrlLogItem.Create;
begin
  logSessao := 0; 
  logDH     := 0;
  logExe    := '';
  logTit    := '';
  logUrl    := '';
  logMaq    := 0;
end;

function TncAppUrlLogItem.GetString: String;
begin
  Result := IntToStr(logMaq) + sFldDelim + 
            IntToStr(logSessao) + sFldDelim +
            GetDTStr(logDH) + sFldDelim +
            logExe + sFldDelim +
            logTit + sFldDelim +
            logUrl + sFldDelim;
end;

procedure TncAppUrlLogItem.SetString(const Value: String);
var S: String;

function pCampo: String;
begin
  Result := GetNextStrDelim(S);
end;

begin
  S := Value;
  logMaq := StrToIntDef(pCampo, 0);
  logSessao := StrToIntDef(pCampo, 0);
  logDH := DTFromStr(pCampo);
  logExe := pCampo;
  logTit := pCampo;
  logUrl := pCampo;
end;

procedure TncAppUrlLogItem.SetData(aMaq, aSessao: Integer; aDH: TDateTime; aExe, aTit,
  aUrl: String);
begin
  logMaq := aMaq;
  logSessao := aSessao;
  logDH := aDH;
  logExe := aExe;
  logTit := aTit;
  logUrl := aUrl;
end;

{ TncAppUrlLog }

function TncAppUrlLog.Count: Integer;
begin
  Result := FItens.Count;
end;

constructor TncAppUrlLog.Create;
begin
  FItens := TList.Create;
end;

procedure TncAppUrlLog.Delete(aIndex: Integer);
begin
  FItens.Delete(aIndex);
end;

destructor TncAppUrlLog.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncAppUrlLog.GetItem(I: Integer): TncAppUrlLogItem;
begin
  Result := TncAppUrlLogItem(FItens[I]);
end;

function TncAppUrlLog.GetString: String;
var i : integer;
begin
  for I := 0 to Count - 1 do  begin
    if I>0 then Result := Result + sLineBreak;
    Result := Result + Itens[I].AsString;
  end;
end;

procedure TncAppUrlLog.Limpa;
begin
  while Count>0 do begin
    TObject(FItens[0]).Free;
    FItens.Delete(0);
  end;
end;

procedure TncAppUrlLog.LoadFromStream(S: TStream);
var 
  SL : TStrings;
  i : Integer;
  Str : String;
begin
  SL := TStringList.Create;
  SL.LoadFromStream(S);
  Str := SL.Text;
  if Str='sdsdfsdfsdfsdf' then Exit;
  
  for I := 0 to SL.Count - 1 do
    NewItem.AsString := SL[I];
end;

function TncAppUrlLog.NewItem: TncAppUrlLogItem;
begin
  Result := TncAppUrlLogItem.Create;
  FItens.Add(Result);
end;

procedure TncAppUrlLog.Remove(Item: TncAppUrlLogItem);
begin
  FItens.Remove(Item);
end;

procedure TncAppUrlLog.SaveToStream(S: TStream);
var 
  i : integer;
  SL : TStrings;
begin
  SL := TStringList.Create;
  try
    for I := 0 to Count - 1 do
      SL.Add(Itens[I].AsString);
    SL.SaveToStream(S);  
  finally
    SL.Free;
  end;
end;

procedure TncAppUrlLog.SetString(const Value: String);
var 
  SL : TStrings;
  i : Integer;
begin
  Limpa;
  SL := TStringList.Create;
  try
    SL.Text := Value;
    for I := 0 to SL.Count - 1 do
      NewItem.AsString := SL[I];
  finally
    SL.Free;
  end;
end;

procedure AddTlds(S: String);
var 
  W: String;
  I: Integer;

function NextWord: Boolean;
begin
  Result := False;
  S := Trim(S);
  I := Pos(' ', S);
  if I>0 then begin
    W := Copy(S, 1, I-1);
    Delete(S, 1, I);
  end else begin
    W := S;
    S := '';
  end;
  if (W>'') and (W[1]<>'.') then W := '.' + W;
  NextWord := (W>'');
end;

begin
  while NextWord do slTld.Add(W);
end;

initialization
  slTld := TStringList.Create;

  AddTlds('ac com.ac edu.ac gov.ac net.ac mil.ac org.ac');
  AddTlds('ad nom.ad');
  AddTlds('ae net.ae gov.ae org.ae mil.ae sch.ae ac.ae pro.ae name.ae');
  AddTlds('aero');
  AddTlds('af gov.af edu.af net.af com.af');
  AddTlds('ag com.ag org.ag net.ag co.ag nom.ag');
  AddTlds('ai off.ai com.ai net.ai org.ai');
  AddTlds('al gov.al edu.al org.al com.al net.al');
  AddTlds('am');
  AddTlds('an com.an net.an org.an edu.an');
  AddTlds('co.ao ed.ao gv.ao it.ao og.ao pb.ao');
  AddTlds('ar com.ar gov.ar int.ar mil.ar net.ar org.ar');
  AddTlds('as');
  AddTlds('at gv.at ac.at co.at or.at priv.at');
  AddTlds('au asn.au com.au net.au id.au org.au csiro.au oz.au info.au conf.au act.au nsw.au nt.au qld.au sa.au tas.au vic.au wa.au gov.au edu.au');
  AddTlds('aw com.aw');
  AddTlds('ax');
  AddTlds('az com.az net.az int.az gov.az biz.az org.az edu.az mil.az pp.az name.az info.az');
  AddTlds('ba');
  AddTlds('bb com.bb edu.bb gov.bb net.bb org.bb');
  AddTlds('bd com.bd edu.bd net.bd gov.bd org.bd mil.bd');
  AddTlds('be ac.be to.be com.be co.be xa.be ap.be');
  AddTlds('bf gov.bf');
  AddTlds('bg');
  AddTlds('bh');
  AddTlds('bi');
  AddTlds('biz');
  AddTlds('bj');
  AddTlds('bm com.bm edu.bm org.bm org.bn net.bn');
  AddTlds('bo com.bo org.bo net.bo gov.bo gob.bo edu.bo tv.bo mil.bo int.bo ');
  AddTlds('br agr.br am.br art.br edu.br com.br coop.br esp.br far.br fm.br g12.br gov.br imb.br ind.br inf.br mil.br net.br org.br psi.br rec.br srv.br tmp.br tur.br tv.br etc.br adm.br adv.br arq.br ato.br bio.br bmd.br cim.br '+
          'cng.br cnt.br ecn.br eng.br eti.br fnd.br fot.br fst.br ggf.br jor.br lel.br mat.br med.br mus.br not.br ntr.br odo.br ppg.br pro.br psc.br qsl.br slg.br trd.br vet.br zlg.br dpn.br nom.br ');
  AddTlds('bs com.bs net.bs org.bs');
  AddTlds('bt com.bt edu.bt gov.bt net.bt org.bt');
  AddTlds('bw co.bw org.bw');
  AddTlds('by gov.by mil.by');
  AddTlds('bz');
  AddTlds('ca .ab.ca .bc.ca .mb.ca .nb.ca .nf.ca .nl.ca .ns.ca .nt.ca .nu.ca .on.ca .pe.ca .qc.ca .sk.ca .yk.ca ');
  AddTlds('cc cc co.cc');
  AddTlds('cd cd com.cd net.cd org.cd');
  AddTlds('cf');
  AddTlds('ch com.ch net.ch org.ch gov.ch');
  AddTlds('ck co.ck');
  AddTlds('cn .ac.cn .com.cn .edu.cn .gov.cn .net.cn .org.cn .ah.cn .bj.cn .cq.cn .fj.cn .gd.cn .gs.cn .gz.cn .gx.cn '+
          '.ha.cn .hb.cn .he.cn .hi.cn .hl.cn .hn.cn .jl.cn .js.cn .jx.cn .ln.cn .nm.cn .nx.cn .qh.cn .sc.cn .sd.cn '+
          '.sh.cn .sn.cn .sx.cn .tj.cn .xj.cn .xz.cn .yn.cn .zj.cn');
  AddTlds('co .com.co .edu.co .org.co .gov.co .mil.co .net.co .nom.co');
  AddTlds('com');
  AddTlds('ac ac.cr co.cr ed.cr fi.cr go.cr or.cr sa.cr');
  AddTlds('cu .cu .com.cu .edu.cu .org.cu .net.cu .gov.cu .inf.cu');
  AddTlds('cv');
  AddTlds('cx gov.cx');
  AddTlds('cy com.cy biz.cy info.cy ltd.cy pro.cy net.cy org.cy name.cy tm.cy ac.cy ekloges.cy press.cy parliament.cy ');
  AddTlds('cz');
  AddTlds('de');
  AddTlds('dj');
  AddTlds('dk');
  AddTlds('dm .dm com.dm net.dm org.dm edu.dm gov.dm');
  AddTlds('do .edu.do .gov.do .gob.do .com.do .org.do .sld.do .web.do .net.do .mil.do .art.do');
  AddTlds('dz .dz .com.dz .org.dz .net.dz .gov.dz .edu.dz .asso.dz .pol.dz .art.dz ');
  AddTlds('ec .ec .com.ec .info.ec .net.ec .fin.ec .med.ec .pro.ec .org.ec .edu.ec .gov.ec .mil.ec');
  AddTlds('edu');
  AddTlds('ee .com.ee .org.ee .fie.ee .pri.ee');
  AddTlds('eg .eun.eg .edu.eg .sci.eg .gov.eg .com.eg .org.eg .net.eg .mil.eg');
  AddTlds('er');
  AddTlds('es .com.es .nom.es .org.es .gob.es .edu.es');
  AddTlds('et .com.et .gov.et .org.et .edu.et .net.et .biz.et .name.et .info.et ');
  AddTlds('eu');
  AddTlds('fi aland.fi');
  AddTlds('fj biz.fj com.fj info.fj name.fj net.fj org.fj pro.fj ac.fj gov.fj mil.fj school.fj');
  AddTlds('fk co.fk org.fk gov.fk ac.fk nom.fk net.fk');
  AddTlds('fm');
  AddTlds('fo');
  AddTlds('fr tm.fr asso.fr nom.fr prd.fr presse.fr com.fr gouv.fr');
  AddTlds('ga');
  AddTlds('gb');
  AddTlds('gd');
  AddTlds('ge .com.ge .edu.ge .gov.ge .org.ge .mil.ge .net.ge .pvt.ge');
  AddTlds('gf');
  AddTlds('gg .co.gg .net.gg .org.gg');
  AddTlds('gh com.gh edu.gh gov.gh org.gh mil.gh');
  AddTlds('gi .gi .com.gi .ltd.gi .gov.gi .mod.gi .edu.gi .org.gi');
  AddTlds('gl');
  AddTlds('gm');
  AddTlds('gn .com.gn .ac.gn .gov.gn .org.gn .net.gn');
  AddTlds('gp .com.gp, .net.gp, .edu.gp, .asso.gp, or .org.gp');
  AddTlds('gq');
  AddTlds('gr .com.gr .edu.gr .net.gr .org.gr .gov.gr');
  AddTlds('gs');
  AddTlds('gt');
  AddTlds('gu');
  AddTlds('gw');
  AddTlds('gy');
  AddTlds('hk .com.hk .edu.hk .gov.hk .idv.hk .net.hk .org.hk');
  AddTlds('hm');
  AddTlds('hn .com.hn .edu.hn .org.hn .net.hn .mil.hn .gob.hn ');
  AddTlds('hr .iz.hr .from.hr .name.hr .com.hr');
  AddTlds('ht .com.ht .net.ht .firm.ht .shop.ht .info.ht .pro.ht .adult.ht .org.ht .art.ht .pol.ht .rel.ht .asso.ht .perso.ht .coop.ht .med.ht .edu.ht .gouv.ht ');
  AddTlds('hu co.hu info.hu org.hu priv.hu sport.hu tm.hu 2000.hu agrar.hu bolt.hu casino.hu city.hu erotica.hu '+
          'erotika.hu film.hu forum.hu games.hu hotel.hu ingatlan.hu jogasz.hu konyvelo.hu lakas.hu media.hu news.hu '+
          'reklam.hu sex.hu shop.hu suli.hu szex.hu tozsde.hu utazas.hu video.hu ');
  AddTlds('id ac.id co.id or.id go.id');
  AddTlds('ie gov.ie');
  AddTlds('il ac.il co.il org.il net.il k12.il gov.il muni.il idf.il');
  AddTlds('im co.im ltd.co.im plc.co.im net.im gov.im org.im nic.im ac.im');
  AddTlds('in .co.in .firm.in .net.in .org.in .gen.in .ind.in .nic.in .ac.in .edu.in .res.in .gov.in .mil.in');
  AddTlds('info');
  AddTlds('int');
  AddTlds('io');
  AddTlds('iq');
  AddTlds('ir .ac.ir .co.ir .gov.ir .net.ir .org.ir .sch.ir');
  AddTlds('is');
  AddTlds('it gov.it');
  AddTlds('je .co.je .net.je .org.je');
  AddTlds('jm edu.jm .gov.jm .com.jm .net.jm org.jm ');
  AddTlds('jo .com.jo .org.jo .net.jo .edu.jo .gov.jo .mil.jo');
  AddTlds('jobs');
  AddTlds('jp ac.jp ad.jp co.jp ed.jp go.jp gr.jp lg.jp ne.jp or.jp hokkaido.jp aomori.jp iwate.jp miyagi.jp akita.jp '+
          'yamagata.jp fukushima.jp ibaraki.jp tochigi.jp gunma.jp saitama.jp chiba.jp tokyo.jp kanagawa.jp niigata.jp '+
          'toyama.jp ishikawa.jp fukui.jp yamanashi.jp nagano.jp gifu.jp shizuoka.jp aichi.jp mie.jp shiga.jp kyoto.jp '+
          'osaka.jp hyogo.jp nara.jp wakayama.jp tottori.jp shimane.jp okayama.jp hiroshima.jp yamaguchi.jp tokushima.jp '+
          'kagawa.jp ehime.jp kochi.jp fukuoka.jp saga.jp nagasaki.jp kumamoto.jp oita.jp miyazaki.jp kagoshima.jp '+
          'okinawa.jp sapporo.jp sendai.jp yokohama.jp kawasaki.jp nagoya.jp kobe.jp kitakyushu.jp');
  AddTlds('ke');
  AddTlds('kg');
  AddTlds('kh per.kh com.kh edu.kh gov.kh mil.kh net.kh org.kh');
  AddTlds('ki');
  AddTlds('km');
  AddTlds('kn');
  AddTlds('kr co.kr or.kr');
  AddTlds('kw com .com.kw .edu.kw .gov.kw .net.kw .org.kw .mil.kw');
  AddTlds('ky .edu.ky .gov.ky .com.ky .org.ky .net.ky ');
  AddTlds('kz org.kz .edu.kz .net.kz .gov.kz .mil.kz .com.kz');
  AddTlds('la');
  AddTlds('lb net.lb org.lb gov.lb edu.lb com.lb ');
  AddTlds('lc com.lc org.lc edu.lc gov.lc ');
  AddTlds('li .com.li .net.li .org.li .gov.li');
  AddTlds('lk .lk .gov.lk .sch.lk .net.lk .int.lk .com.lk .org.lk .edu.lk .ngo.lk .soc.lk .web.lk .ltd.lk .assn.lk .grp.lk .hotel.lk');
  AddTlds('lr .com.lr .edu.lr .gov.lr .org.lr .net.lr');
  AddTlds('ls .org.ls .co.ls');
  AddTlds('lt .gov.lt .mil.lt others?');
  AddTlds('lu .gov.lu .mil.lu .org.lu .net.lu');
  AddTlds('lv .com.lv .edu.lv .gov.lv .org.lv .mil.lv .id.lv .net.lv .asn.lv .conf.lv');
  AddTlds('ly .com.ly .net.ly .gov.ly .plc.ly .edu.ly .sch.ly .med.ly .org.ly .id.ly');
  AddTlds('ma .co.ma .net.ma .gov.ma .org.ma');
  AddTlds('mc .tm.mc .asso.mc ');
  AddTlds('md');
  AddTlds('mg .org.mg .nom.mg .gov.mg .prd.mg .tm.mg .com.mg .edu.mg .mil.mg');
  AddTlds('mh');
  AddTlds('mil army.mil navy.mil');
  AddTlds('mk com.mk org.mk');
  AddTlds('ml');
  AddTlds('mm');
  AddTlds('mn');
  AddTlds('mo .com.mo .net.mo .org.mo .edu.mo .gov.mo');
  AddTlds('mobi weather.mobi music.mobi');
  AddTlds('mp');
  AddTlds('mq');
  AddTlds('mr');
  AddTlds('ms');
  AddTlds('mt .org.mt .com.mt .gov.mt .edu.mt .net.mt');
  AddTlds('mu .com.mu .co.mu');
  AddTlds('museum');
  AddTlds('mv aero.mv .biz.mv .com.mv .coop.mv .edu.mv .gov.mv .info.mv .int.mv .mil.mv .museum.mv .name.mv .net.mv .org.mv .pro.mv');
  AddTlds('mw ac.mw co.mw com.mw coop.mw edu.mw gov.mw int.mw museum.mw net.mw org.mw');
  AddTlds('mx .com.mx .net.mx .org.mx .edu.mx .gob.mx');
  AddTlds('my .com.my .net.my .org.my .gov.my .edu.my .mil.my .name.my');
  AddTlds('mz');
  AddTlds('na');
  AddTlds('name');
  AddTlds('nc');
  AddTlds('ne');
  AddTlds('net');
  AddTlds('nf');
  AddTlds('ng .edu.ng .com.ng .gov.ng .org.ng .net.ng');
  AddTlds('ni .gob.ni .com.ni .edu.ni .org.ni .nom.ni .net.ni');
  AddTlds('nl');
  AddTlds('no mil.no stat.no kommune.no herad.no priv.no vgs.no fhs.no museum.no fylkesbibl.no folkebibl.no idrett.no');
  AddTlds('np com.np org.np edu.np net.np gov.np mil.np');
  AddTlds('nr co.nr .gov.nr .edu.nr .biz.nr .info.nr .nr org.nr .com.nr .net.nr');
  AddTlds('nu');
  AddTlds('nz .ac.nz .co.nz .cri.nz .gen.nz .geek.nz .govt.nz .iwi.nz .maori.nz .mil.nz .net.nz .org.nz .school.nz');
  AddTlds('om com.om co.om edu.om ac.com sch.om gov.om net.om org.om mil.om museum.om biz.om pro.om med.om');
  AddTlds('org');
  AddTlds('pa com.pa ac.pa sld.pa gob.pa edu.pa org.pa net.pa abo.pa ing.pa med.pa nom.pa ');
  AddTlds('pe com.pe org.pe net.pe edu.pe mil.pe gob.pe nom.pe');
  AddTlds('pf .com.pf .org.pf .edu.pf');
  AddTlds('pg .com.pg .net.pg');
  AddTlds('ph .com.ph .gov.ph');
  AddTlds('pk .com.pk .net.pk .edu.pk .org.pk .fam.pk .biz.pk .web.pk .gov.pk .gob.pk .gok.pk .gon.pk .gop.pk .gos.pk');
  AddTlds('pl .com.pl .biz.pl .net.pl .art.pl .edu.pl .org.pl .ngo.pl .gov.pl .info.pl .mil.pl ');
  AddTlds('pm');
  AddTlds('pn');
  AddTlds('pr .biz.pr .com.pr .edu.pr .gov.pr .info.pr .isla.pr .name.pr .net.pr .org.pr .pro.pr');
  AddTlds('pro law.pro med.pro cpa.pro');
  AddTlds('ps .edu.ps .gov.ps .sec.ps .plo.ps .com.ps .org.ps .net.ps');
  AddTlds('pt .com.pt .edu.pt .gov.pt .int.pt .net.pt .nome.pt .org.pt .publ.pt ');
  AddTlds('pw');
  AddTlds('py net.py .org.py .gov.py .edu.py .com.py');
  AddTlds('qa');
  AddTlds('re');
  AddTlds('ro .com.ro .org.ro .tm.ro .nt.ro .nom.ro .info.ro .rec.ro .arts.ro .firm.ro .store.ro .www.ro');
  AddTlds('ru .com.ru .net.ru .org.ru .pp.ru .msk.ru .int.ru .ac.ru');
  AddTlds('rw .gov.rw .net.rw .edu.rw .ac.rw .com.rw .co.rw .int.rw .mil.rw .gouv.rw');
  AddTlds('sa .com.sa .edu.sa .sch.sa .med.sa .gov.sa .net.sa .org.sa .pub.sa');
  AddTlds('sb .com.sb .gov.sb .net.sb .edu.sb');
  AddTlds('sc .com.sc .gov.sc .net.sc .org.sc .edu.sc');
  AddTlds('sd .com.sd .net.sd .org.sd .edu.sd .med.sd .tv.sd .gov.sd .info.sd');
  AddTlds('se .org.se .pp.se .tm.se .brand.se .parti.se .press.se .komforb.se .kommunalforbund.se .komvux.se '+
          '.lanarb.se .lanbib.se .naturbruksgymn.se .sshn.se .fhv.se .fhsk.se .fh.se .mil.se .ab.se .c.se '+
          '.d.se .e.se .f.se .g.se .h.se .i.se .k.se .m.se .n.se .o.se .s.se .t.se .u.se .w.se .x.se .y.se '+
          '.z.se .ac.se .bd.se ');
  AddTlds('sg .com.sg .net.sg .org.sg .gov.sg .edu.sg .per.sg .idn.sg');
  AddTlds('sh');
  AddTlds('si');
  AddTlds('sk');
  AddTlds('sl');
  AddTlds('sm');
  AddTlds('sn');
  AddTlds('so');
  AddTlds('sr');
  AddTlds('st');
  AddTlds('sv .edu.sv .com.sv .gob.sv .org.sv .red.sv');
  AddTlds('sy gov.sy com.sy net.sy');
  AddTlds('sz');
  AddTlds('tc');
  AddTlds('td');
  AddTlds('tf');
  AddTlds('tg');
  AddTlds('th .ac.th .co.th .in.th .go.th .mi.th .or.th .net.th');
  AddTlds('tj .tj .ac.tj .biz.tj .com.tj .co.tj .edu.tj .int.tj .name.tj .net.tj .org.tj .web.tj .gov.tj .go.tj .mil.tj');
  AddTlds('tk');
  AddTlds('tl');
  AddTlds('tm');
  AddTlds('tn .com.tn .intl.tn .gov.tn .org.tn .ind.tn .nat.tn .tourism.tn .info.tn .ens.tn .fin.tn .net.tn ');
  AddTlds('to gov.to');
  AddTlds('tp gov.tp');
  AddTlds('tr .com.tr .info.tr .biz.tr .net.tr .org.tr .web.tr .gen.tr .av.tr .dr.tr .bbs.tr .name.tr .tel.tr .gov.tr .bel.tr .pol.tr .mil.tr .k12.tr .edu.tr');
  AddTlds('travel');
  AddTlds('tt .tt .co.tt .com.tt .org.tt .net.tt .biz.tt .info.tt .pro.tt .name.tt .edu.tt .gov.tt');
  AddTlds('tv gov.tv');
  AddTlds('tw .edu.tw .gov.tw .mil.tw .com.tw .net.tw .org.tw .idv.tw .game.tw .ebiz.tw .club.tw');
  AddTlds('tz .co.tz .ac.tz .go.tz .or.tz .ne.tz');
  AddTlds('ua .com.ua .gov.ua .net.ua .edu.ua .org.ua .cherkassy.ua .ck.ua .chernigov.ua .cn.ua .chernovtsy.ua '+
          '.cv.ua .crimea.ua .dnepropetrovsk.ua .dp.ua .donetsk.ua .dn.ua .ivano-frankivsk.ua .if.ua .kharkov.ua '+
          '.kh.ua .kherson.ua .ks.ua .khmelnitskiy.ua .km.ua .kiev.ua .kv.ua .kirovograd.ua .kr.ua .lugansk.ua '+
          '.lg.ua .lutsk.ua .lviv.ua .nikolaev.ua .mk.ua .odessa.ua .od.ua .poltava.ua .pl.ua .rovno.ua .rv.ua '+
          '.sebastopol.ua .sumy.ua .ternopil.ua .te.ua .uzhgorod.ua .vinnica.ua .vn.ua .zaporizhzhe.ua .zp.ua '+
          '.zhitomir.ua .zt.ua');
  AddTlds('ug .co.ug .ac.ug .sc.ug .go.ug .ne.ug .or.ug ');
  AddTlds('uk .ac.uk .co.uk .gov.uk .ltd.uk .me.uk .mil.uk .mod.uk .net.uk .nic.uk .nhs.uk .org.uk .plc.uk .police.uk .sch.uk||exceptions: .bl.uk .british-library.uk .icnet.uk .jet.uk .nel.uk .nls.uk .national-library-scotland.uk .parliament.uk .sch.uk');
  AddTlds('um');
  AddTlds('us .ak.us .al.us .ar.us .az.us .ca.us .co.us .ct.us .dc.us .de.us .dni.us .fed.us .fl.us .ga.us .hi.us '+
          '.ia.us .id.us .il.us .in.us .isa.us .kids.us .ks.us .ky.us .la.us .ma.us .md.us .me.us .mi.us .mn.us '+
          '.mo.us .ms.us .mt.us .nc.us .nd.us .ne.us .nh.us .nj.us .nm.us .nsn.us .nv.us .ny.us .oh.us .ok.us '+
          '.or.us .pa.us .ri.us .sc.us .sd.us .tn.us .tx.us .ut.us .vt.us .va.us .wa.us .wi.us .wv.us .wy.us');
  AddTlds('uy .edu.uy .gub.uy .org.uy .com.uy .net.uy .mil.uy');
  AddTlds('uz');
  AddTlds('va vatican.va');
  AddTlds('vc ');
  AddTlds('ve .com.ve .net.ve .org.ve .info.ve .co.ve .web.ve ');
  AddTlds('vg');
  AddTlds('vi .com.vi .org.vi .edu.vi .gov.vi ');
  AddTlds('vn .com.vn .net.vn .org.vn .edu.vn .gov.vn .int.vn .ac.vn .biz.vn .info.vn .name.vn .pro.vn .health.vn');
  AddTlds('vu');
  AddTlds('wf');
  AddTlds('ws');
  AddTlds('ye .com.ye .net.ye ');
  AddTlds('yt');
  AddTlds('yu .ac.yu .co.yu .org.yu .edu.yu');
  AddTlds('za .ac.za .city.za .co.za .edu.za .gov.za .law.za .mil.za .nom.za .org.za .school.za .alt.za .net.za .ngo.za .tm.za .web.za');
  AddTlds('zm .co.zm .org.zm .gov.zm .sch.zm .ac.zm ');
  AddTlds('zw .co.zw .org.zw .gov.zw .ac.zw ');

finalization
  slTld.Free;

end.
