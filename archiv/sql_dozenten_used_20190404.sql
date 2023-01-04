use Kufer_Reporting

select

iif(nr is NULL, '', nr) as nr,
iif(NAME is NULL, '', NAME) as NAME,
iif(VORNAME is NULL, '', VORNAME) as VORNAME,
iif(ZUSATZ is NULL, '', ZUSATZ) as ZUSATZ,
iif(ZUSATZ2 is NULL, '', ZUSATZ2) as ZUSATZ2,

iif(ORT is NULL, '', ORT) as ORT,
iif(strasse is NULL,'',Replace(REPLACE(Strasse COLLATE Latin1_General_CS_AS, 'Str.', 'Straﬂe') COLLATE Latin1_General_CS_AS, 'str.', 'straﬂe')  ) as strasse,
iif(TEL_ANZEIGE is NULL, '', TEL_ANZEIGE) as TEL_ANZEIGE,
iif(TEL2_ANZEIGE is NULL, '', TEL2_ANZEIGE) as TEL2_ANZEIGE,
iif(FAX_ANZEIGE is NULL, '', FAX_ANZEIGE) as FAX_ANZEIGE,
iif(EMAIL_ANZEIGE is NULL, '', EMAIL_ANZEIGE) as EMAIL_ANZEIGE,

iif(GESCHLECHT is NULL, '', GESCHLECHT) as GESCHLECHT,

iif(iif(GEBURTSTAG is NULL, '30.12.1899', GEBURTSTAG) = '30.12.1899', '',CONVERT(nvarchar(10),GEBURTSTAG,20))  as GEBURTSTAG,

iif(BANKBEZ is NULL, '', BANKBEZ) as BANKBEZ,
iif(KONTO is NULL, '', KONTO) as KONTO,
iif(BLZ is NULL, '', BLZ) as BLZ,
iif(NATION is NULL, '', NATION) as NATION,
iif(SCHULKEY is NULL, '', SCHULKEY) as SCHULKEY,
iif(BERUF is NULL, '', BERUF) as BERUF,

iif(iif(SEITWANN is NULL, '30.12.1899', SEITWANN) = '30.12.1899', '',CONVERT(nvarchar(10),SEITWANN,20))  as SEITWANN,

iif(KONTOINH is NULL, '', KONTOINH) as KONTOINH,

iif(BEARBEITER is NULL, '', BEARBEITER) as BEARBEITER,
iif(INAKTIV is NULL, '', INAKTIV) as INAKTIV,

iif(iif(BEARBDATUM is NULL, '30.12.1899', BEARBDATUM) = '30.12.1899', '',CONVERT(nvarchar(10),BEARBDATUM,20) + ' ' + CONVERT(nvarchar(10),BEARBDATUM,114))  as BEARBDATUM,

iif(FINANZAMT is NULL, '', FINANZAMT) as FINANZAMT,

iif(VERTRAG is NULL, '', VERTRAG) as VERTRAG,
iif(INFO is NULL, '', INFO) as INFO,
iif(INFO_INTERN is NULL, '', INFO_INTERN) as INFO_INTERN,
iif(INDHONSATZ is NULL, '', INDHONSATZ) as INDHONSATZ,

iif(ANSPRACHE is NULL, '', ANSPRACHE) as ANSPRACHE,
iif(ANREDE is NULL, '', ANREDE) as ANREDE,
iif(MOBIL_ANZEIGE is NULL, '', MOBIL_ANZEIGE) as MOBIL_ANZEIGE,

iif(eLearningPersonAktiv is NULL, '', eLearningPersonAktiv) as eLearningPersonAktiv,
iif(eLearningLogin is NULL, '', eLearningLogin) as eLearningLogin,
iif(iif(eLearningEMailDatum is NULL, '30.12.1899', eLearningEMailDatum) = '30.12.1899', '',CONVERT(nvarchar(10),eLearningEMailDatum,20))  as eLearningEMailDatum,

iif(STEUERNR is NULL, '', STEUERNR) as STEUERNR,
iif(BIC is NULL, '', BIC) as BIC,
iif(IBAN is NULL, '', IBAN) as IBAN,

iif(ErstelltDatum is NULL, '', ErstelltDatum) as ErstelltDatum,

iif(ErstelltVon is NULL, '', ErstelltVon) as ErstelltVon,
iif(Krit1 is NULL, '', Krit1) as Krit1,

iif(Krit2 is NULL, '', Krit2) as Krit2,
iif(Krit3 is NULL, '', Krit3) as Krit3,
iif(Krit4 is NULL, '', Krit4) as Krit4,
iif(Krit5 is NULL, '', Krit5) as Krit5,
iif(Krit6 is NULL, '', Krit6) as Krit6,

iif(Name_Titel is NULL, '', Name_Titel) as Name_Titel,

iif(eLearningDozID is NULL, '', eLearningDozID) as eLearningDozID,

iif(iif(eLearningVon is NULL, '30.12.1899', eLearningVon) = '30.12.1899', '',CONVERT(nvarchar(10),eLearningVon,20))  as eLearningVon,
iif(iif(eLearningBis is NULL, '30.12.1899', eLearningBis) = '30.12.1899', '',CONVERT(nvarchar(10),eLearningBis,20))  as eLearningBis,
iif(NOWERBUNG is NULL, '', NOWERBUNG) as NOWERBUNG,

iif(Progheft is NULL, '', Progheft) as Progheft,

iif(Internet is NULL, '', Internet) as Internet,
iif(Anmkarte is NULL, '', Anmkarte) as Anmkarte,

iif(Newsl_Erlaubt is NULL, '', Newsl_Erlaubt) as Newsl_Erlaubt,

iif(mandant is NULL, '', mandant) as mandant,

iif(krit7 is NULL, '', krit7) as krit7,
iif(krit8 is NULL, '', krit8) as krit8

from dozenten