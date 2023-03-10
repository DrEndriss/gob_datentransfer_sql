use Kufer_Reporting

select
 
iif(nr is NULL, '', nr) as nr,
iif(name is NULL, '', name) as name,
iif(vorname is NULL, '', vorname) as vorname, 	   
iif(typ is NULL, '', typ) as typ, 	   
iif(zusatz is NULL, '', zusatz) as zusatz, 	   
iif(ZUSATZ2 is NULL, '', ZUSATZ2) as ZUSATZ2, 	   
iif(ort is NULL, '', ort) as ort, 	   

iif(strasse is NULL,'',Replace(REPLACE(Strasse COLLATE Latin1_General_CS_AS, 'Str.', 'Stra?e') COLLATE Latin1_General_CS_AS, 'str.', 'stra?e')  ) as strasse,  

iif(TEL_ANZEIGE is NULL, '', TEL_ANZEIGE) as TEL_ANZEIGE, 	   
iif(TEL2_ANZEIGE is NULL, '', TEL2_ANZEIGE) as TEL2_ANZEIGE, 	   
iif(FAX_ANZEIGE is NULL, '', FAX_ANZEIGE) as FAX_ANZEIGE, 	   
iif(EMAIL_ANZEIGE is NULL, '', EMAIL_ANZEIGE) as EMAIL_ANZEIGE, 	   
iif(NOWERBUNG is NULL, '', NOWERBUNG) as NOWERBUNG, 	   
iif(nomailwerb is NULL, '', nomailwerb) as nomailwerb,
iif(notelwerb is NULL, '', notelwerb) as notelwerb,
iif(nofaxwerb is NULL, '', nofaxwerb) as nofaxwerb,
iif(NOWERBUNG is NULL, '', NOWERBUNG) as NOWERBUNG,
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

iif(iif(BEARBDATUM is NULL, '30.12.1899', BEARBDATUM) = '30.12.1899', '',CONVERT(nvarchar(10),BEARBDATUM,20) + ' ' + CONVERT(nvarchar(10),BEARBDATUM,114))  as BEARBDATUM,

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
iif(eLearningPersonAktiv is NULL, '', eLearningPersonAktiv) as eLearningPersonAktiv, 	   
iif(eLearningLogin is NULL, '', eLearningLogin) as eLearningLogin, 	   
iif(BIC is NULL, '', BIC) as BIC, 	   
iif(IBAN is NULL, '', IBAN) as IBAN, 	   

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
iif(abteilung is NULL, '', abteilung) as abteilung, 	   
iif(entsendvhs is NULL, '', entsendvhs) as entsendvhs, 	   
iif(extern is NULL, '', extern) as extern, 	   
iif(adrfahrgemeinschaft is NULL, '', adrfahrgemeinschaft) as adrfahrgemeinschaft, 	   
 
iif(anm_sperre is NULL, '', anm_sperre) as anm_sperre, 	   
   
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