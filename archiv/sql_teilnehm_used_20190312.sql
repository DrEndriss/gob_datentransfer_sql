use Kufer_Reporting

select
 
iif(nr is NULL, '', nr) as nr,
iif(name is NULL, '', name) as name,
iif(vorname is NULL, '', vorname) as vorname, 	   
iif(typ is NULL, '', typ) as typ, 	   
iif(zusatz is NULL, '', zusatz) as zusatz, 	   
iif(ZUSATZ2 is NULL, '', ZUSATZ2) as ZUSATZ2, 	   
iif(ort is NULL, '', ort) as ort, 	   

iif(strasse is NULL,'',Replace(REPLACE(Strasse COLLATE Latin1_General_CS_AS, 'Str.', 'Straﬂe') COLLATE Latin1_General_CS_AS, 'str.', 'straﬂe')  ) as strasse,  

iif(TEL_ANZEIGE is NULL, '', TEL_ANZEIGE) as TEL_ANZEIGE, 	   
iif(TEL2_ANZEIGE is NULL, '', TEL2_ANZEIGE) as TEL2_ANZEIGE, 	   
iif(FAX_ANZEIGE is NULL, '', FAX_ANZEIGE) as FAX_ANZEIGE, 	   
iif(EMAIL_ANZEIGE is NULL, '', EMAIL_ANZEIGE) as EMAIL_ANZEIGE, 	   
iif(NOWERBUNG is NULL, '', NOWERBUNG) as NOWERBUNG, 	   
iif(nopostwerb_bearb is NULL, '', nopostwerb_bearb) as nopostwerb_bearb, 	   
iif(iif(nopostwerb_datum is NULL, '30.12.1899', nopostwerb_datum) = '30.12.1899', '',CONVERT(nvarchar(10),nopostwerb_datum,20))  as nopostwerb_datum,
iif(nopostwerb_via is NULL, '', nopostwerb_via) as nopostwerb_via, 	   
iif(nopostwerb_bem is NULL, '', nopostwerb_bem) as nopostwerb_bem, 	   
iif(nomailwerb is NULL, '', nomailwerb) as nomailwerb, 	   
iif(nomailwerb_bearb is NULL, '', nomailwerb_bearb) as nomailwerb_bearb, 	   

iif(iif(nomailwerb_datum is NULL, '30.12.1899', nomailwerb_datum) = '30.12.1899', '',CONVERT(nvarchar(10),nomailwerb_datum,20))  as nomailwerb_datum,

iif(nomailwerb_via is NULL, '', nomailwerb_via) as nomailwerb_via, 	   
iif(nomailwerb_bem is NULL, '', nomailwerb_bem) as nomailwerb_bem, 	   
iif(notelwerb is NULL, '', notelwerb) as notelwerb, 	   
iif(notelwerb_bearb is NULL, '', notelwerb_bearb) as notelwerb_bearb, 	   

iif(iif(notelwerb_datum is NULL, '30.12.1899', notelwerb_datum) = '30.12.1899', '',CONVERT(nvarchar(10),notelwerb_datum,20))  as notelwerb_datum,

iif(notelwerb_via is NULL, '', notelwerb_via) as notelwerb_via, 	   
iif(notelwerb_bem is NULL, '', notelwerb_bem) as notelwerb_bem, 	   
iif(geschlecht is NULL, '', geschlecht) as geschlecht, 	   
iif(titel is NULL, '', titel) as titel, 	   

iif(iif(gebdat is NULL, '30.12.1899', gebdat) = '30.12.1899', '',CONVERT(nvarchar(10),gebdat,20))  as gebdat,
 	   
iif(BANKBEZ is NULL, '', BANKBEZ) as BANKBEZ, 	   
iif(konto is NULL, '', konto) as konto, 	   
iif(blz is NULL, '', blz) as blz, 	   
iif(erm_grund is NULL, '', erm_grund) as erm_grund, 	   

iif(iif(erm_ende is NULL, '30.12.1899', erm_ende) = '30.12.1899', '',CONVERT(nvarchar(10),erm_ende,20))  as erm_ende,

iif(erm_proz is NULL, '', erm_proz) as erm_proz, 	   
iif(guthaben is NULL, '', guthaben) as guthaben, 	   
iif(kontoname is NULL, '', kontoname) as kontoname, 	   
iif(KZ_TEXT is NULL, '', KZ_TEXT) as KZ_TEXT, 	   
iif(BEARBEITER is NULL, '', BEARBEITER) as BEARBEITER, 	   
iif(NATION is NULL, '', NATION) as NATION, 	   
iif(BUNDESLAND is NULL, '', BUNDESLAND) as BUNDESLAND, 	   

iif(BEARBDATUM is NULL, '30.12.1899', BEARBDATUM) as BEARBDATUM,


iif(RCHG_ADR_1 is NULL, '', RCHG_ADR_1) as RCHG_ADR_1, 	   
iif(RCHG_ADR_2 is NULL, '', RCHG_ADR_2) as RCHG_ADR_2, 	   
iif(RCHG_ADR_3 is NULL, '', RCHG_ADR_3) as RCHG_ADR_3, 	   
iif(RCHG_ADR_4 is NULL, '', RCHG_ADR_4) as RCHG_ADR_4, 	   
iif(RCHG_ADR_5 is NULL, '', RCHG_ADR_5) as RCHG_ADR_5, 	   
iif(RCHG_ADR_6 is NULL, '', RCHG_ADR_6) as RCHG_ADR_6, 	   
iif(RCHG_ADR_7 is NULL, '', RCHG_ADR_7) as RCHG_ADR_7, 	   
iif(ARBAMTNR is NULL, '', ARBAMTNR) as ARBAMTNR,

iif(iif(LAST_ERTEILT is NULL, '30.12.1899', LAST_ERTEILT) = '30.12.1899', '',CONVERT(nvarchar(10),LAST_ERTEILT,20))  as LAST_ERTEILT,

iif(REGISTRIERUNG is NULL, '', REGISTRIERUNG) as REGISTRIERUNG, 	   
iif(Anrede is NULL, '', Anrede) as Anrede, 	   

iif(iif(MITGEINTR is NULL, '30.12.1899', MITGEINTR) = '30.12.1899', '',CONVERT(nvarchar(10),MITGEINTR,20))  as MITGEINTR,

iif(MITGBETR is NULL, '', MITGBETR) as MITGBETR, 	   
iif(MOBIL_ANZEIGE is NULL, '', MOBIL_ANZEIGE) as MOBIL_ANZEIGE, 	   
iif(FAX2_ANZEIGE is NULL, '', FAX2_ANZEIGE) as FAX2_ANZEIGE, 	   
iif(ArbAmtOrt is NULL, '', ArbAmtOrt) as ArbAmtOrt, 	   
iif(info is NULL, '', info) as info, 	   
iif(INFO_INTERN is NULL, '', INFO_INTERN) as INFO_INTERN, 	   
iif(eLearningPersonAktiv is NULL, '', eLearningPersonAktiv) as eLearningPersonAktiv, 	   
iif(eLearningLogin is NULL, '', eLearningLogin) as eLearningLogin, 	   
iif(BIC is NULL, '', BIC) as BIC, 	   
iif(IBAN is NULL, '', IBAN) as IBAN, 	   
iif(Verstorben is NULL, '', Verstorben) as Verstorben,

iif(iif(ErstelltDatum is NULL, '30.12.1899', ErstelltDatum) = '30.12.1899', '',CONVERT(nvarchar(10),ErstelltDatum,20))  as ErstelltDatum,

iif(ErstelltVon is NULL, '', ErstelltVon) as ErstelltVon, 	   
iif(Krit1 is NULL, '', Krit1) as Krit1, 	   
iif(Krit2 is NULL, '', Krit2) as Krit2, 	   
iif(Krit3 is NULL, '', Krit3) as Krit3, 	   
iif(Krit4 is NULL, '', Krit4) as Krit4, 	   
iif(Krit5 is NULL, '', Krit5) as Krit5, 	   
iif(Krit6 is NULL, '', Krit6) as Krit6, 	   
iif(SozProjekt is NULL, '', SozProjekt) as SozProjekt, 	   
iif(Name_Titel is NULL, '', Name_Titel) as Name_Titel, 	   
iif(eLearningUserID is NULL, '', eLearningUserID) as eLearningUserID, 	  

iif(iif(eLearningVon is NULL, '30.12.1899', eLearningVon) = '30.12.1899', '',CONVERT(nvarchar(10),eLearningVon,20))  as eLearningVon,

iif(iif(eLearningBis is NULL, '30.12.1899', eLearningBis) = '30.12.1899', '',CONVERT(nvarchar(10),eLearningBis,20))  as eLearningBis,

iif(UstID is NULL, '', UstID) as UstID, 	   
iif(Newsl_Erlaubt is NULL, '', Newsl_Erlaubt) as Newsl_Erlaubt, 	   
iif(Newsl_Erlart is NULL, '', Newsl_Erlart) as Newsl_Erlart, 	   
iif(Newsl_AnlBearb is NULL, '', Newsl_AnlBearb) as Newsl_AnlBearb, 	   

iif(iif(Newsl_AnlDatum is NULL, '30.12.1899', Newsl_AnlDatum) = '30.12.1899', '',CONVERT(nvarchar(10),Newsl_AnlDatum,20))  as Newsl_AnlDatum,

iif(Newsl_Bemerk is NULL, '', Newsl_Bemerk) as Newsl_Bemerk, 	   
iif(InfoIntAnm is NULL, '', InfoIntAnm) as InfoIntAnm, 	   
iif(InfoAllgAnm is NULL, '', InfoAllgAnm) as InfoAllgAnm, 	   
iif(abteilung is NULL, '', abteilung) as abteilung, 	   
iif(entsendvhs is NULL, '', entsendvhs) as entsendvhs, 	   
iif(extern is NULL, '', extern) as extern, 	   
iif(adrfahrgemeinschaft is NULL, '', adrfahrgemeinschaft) as adrfahrgemeinschaft, 	   
 
iif(anm_sperre is NULL, '', anm_sperre) as anm_sperre, 	   
iif(nofaxwerb is NULL, '', nofaxwerb) as nofaxwerb, 	   
iif(nofaxwerb_bearb is NULL, '', nofaxwerb_bearb) as nofaxwerb_bearb, 	   

iif(iif(nofaxwerb_datum is NULL, '30.12.1899', nofaxwerb_datum) = '30.12.1899', '',CONVERT(nvarchar(10),nofaxwerb_datum,20))  as nofaxwerb_datum,

iif(nofaxwerb_via is NULL, '', nofaxwerb_via) as nofaxwerb_via, 	   
iif(nofaxwerb_bem is NULL, '', nofaxwerb_bem) as nofaxwerb_bem, 	   
iif(behindert_jn is NULL, '', behindert_jn) as behindert_jn, 	   
iif(krit7 is NULL, '', krit7) as krit7, 	   
iif(krit8 is NULL, '', krit8) as krit8, 	   
iif(krit9 is NULL, '', krit9) as krit9, 	   
iif(krit10 is NULL, '', krit10) as krit10, 	   
iif(krit11 is NULL, '', krit11) as krit11, 	   
iif(krit12 is NULL, '', krit12) as krit12, 	   
iif(krit13 is NULL, '', krit13) as krit13, 	   
iif(krit14 is NULL, '', krit14) as krit14, 	   
iif(krit15 is NULL, '', krit15) as krit15, 	   
iif(krit16 is NULL, '', krit16) as krit16, 	   
iif(noepostwerb is NULL, '', noepostwerb) as noepostwerb, 	   
iif(noepostwerb_bearb is NULL, '', noepostwerb_bearb) as noepostwerb_bearb, 	   

iif(iif(noepostwerb_datum is NULL, '30.12.1899', noepostwerb_datum) = '30.12.1899', '',CONVERT(nvarchar(10),noepostwerb_datum,20))  as noepostwerb_datum,
  
iif(noepostwerb_via is NULL, '', noepostwerb_via) as noepostwerb_via, 	   
iif(noepostwerb_bem is NULL, '', noepostwerb_bem) as noepostwerb_bem, 	   
iif(unbverzogen is NULL, '', unbverzogen) as unbverzogen, 	   
iif(bekverzogen is NULL, '', bekverzogen) as bekverzogen, 	   
iif(nichtmeld is NULL, '', nichtmeld) as nichtmeld, 	   
iif(krit17 is NULL, '', krit17) as krit17, 	   
iif(krit18 is NULL, '', krit18) as krit18, 	   
iif(krit19 is NULL, '', krit19) as krit19, 	   
iif(krit20 is NULL, '', krit20) as krit20, 	   
iif(krit21 is NULL, '', krit21) as krit21, 	   
iif(krit22 is NULL, '', krit22) as krit22, 	   
iif(krit23 is NULL, '', krit23) as krit23, 	   
iif(rchg_adr_nr is NULL, '', rchg_adr_nr) as rchg_adr_nr, 	   
iif(sap_angelegt is NULL, '', sap_angelegt) as sap_angelegt 

from teilnehm