use Kufer_Reporting

select
 






iif(nr is NULL, '', nr) as nr,
iif(SUCHBEGRIFF is NULL, '', SUCHBEGRIFF) as SUCHBEGRIFF,
iif(NAME is NULL, '', NAME) as NAME,
iif(VORNAME is NULL, '', VORNAME) as VORNAME,
iif(TYP is NULL, '', TYP) as TYP,
iif(ZUSATZ is NULL, '', ZUSATZ) as ZUSATZ,
iif(ZUSATZ2 is NULL, '', ZUSATZ2) as ZUSATZ2,
iif(ORT is NULL, '', ORT) as ORT,

iif(strasse is NULL,'',Replace(REPLACE(Strasse COLLATE Latin1_General_CS_AS, 'Str.', 'Straﬂe') COLLATE Latin1_General_CS_AS, 'str.', 'straﬂe')  ) as strasse,

iif(TITEL is NULL, '', TITEL) as TITEL,
iif(TEL_ANZEIGE is NULL, '', TEL_ANZEIGE) as TEL_ANZEIGE,
iif(TEL2_ANZEIGE is NULL, '', TEL2_ANZEIGE) as TEL2_ANZEIGE,
iif(FAX_ANZEIGE is NULL, '', FAX_ANZEIGE) as FAX_ANZEIGE,
iif(EMAIL_ANZEIGE is NULL, '', EMAIL_ANZEIGE) as EMAIL_ANZEIGE,
iif(GESCHLECHT is NULL, '', GESCHLECHT) as GESCHLECHT,
iif(GEBURTSTAG is NULL, '', GEBURTSTAG) as GEBURTSTAG,
iif(BANKBEZ is NULL, '', BANKBEZ) as BANKBEZ,
iif(KONTO is NULL, '', KONTO) as KONTO,
iif(BLZ is NULL, '', BLZ) as BLZ,
iif(NATION is NULL, '', NATION) as NATION,
iif(SCHULKEY is NULL, '', SCHULKEY) as SCHULKEY,
iif(BERUF is NULL, '', BERUF) as BERUF,

iif(SEITWANN is NULL, '', SEITWANN) as SEITWANN,

iif(KONTOINH is NULL, '', KONTOINH) as KONTOINH,
iif(PERSONALNR is NULL, '', PERSONALNR) as PERSONALNR,
iif(BEARBEITER is NULL, '', BEARBEITER) as BEARBEITER,
iif(INAKTIV is NULL, '', INAKTIV) as INAKTIV,
iif(TELWEITER is NULL, '', TELWEITER) as TELWEITER,

iif(iif(BEARBDATUM is NULL, '30.12.1899', BEARBDATUM) = '30.12.1899', '',CONVERT(nvarchar(10),BEARBDATUM,20) + ' ' + CONVERT(nvarchar(10),BEARBDATUM,114))  as BEARBDATUM,

iif(GEBURTSNAME is NULL, '', GEBURTSNAME) as GEBURTSNAME,
iif(GEBURTSORT is NULL, '', GEBURTSORT) as GEBURTSORT,
iif(SOZIALVERSNR is NULL, '', SOZIALVERSNR) as SOZIALVERSNR,
iif(FINANZAMT is NULL, '', FINANZAMT) as FINANZAMT,
iif(FAMILIENSTAND is NULL, '', FAMILIENSTAND) as FAMILIENSTAND,
iif(ARB_ERLAUB is NULL, '', ARB_ERLAUB) as ARB_ERLAUB,
iif(FIRMANAME is NULL, '', FIRMANAME) as FIRMANAME,
iif(FIRMAZUSATZ1 is NULL, '', FIRMAZUSATZ1) as FIRMAZUSATZ1,
iif(FIRMAZUSATZ2 is NULL, '', FIRMAZUSATZ2) as FIRMAZUSATZ2,
iif(FIRMASTR is NULL, '', FIRMASTR) as FIRMASTR,
iif(FIRMAORT is NULL, '', FIRMAORT) as FIRMAORT,
iif(FIRMATEL is NULL, '', FIRMATEL) as FIRMATEL,
iif(FIRMAFAX is NULL, '', FIRMAFAX) as FIRMAFAX,
iif(FIRMAEMAIL is NULL, '', FIRMAEMAIL) as FIRMAEMAIL,
iif(FIRMABANK is NULL, '', FIRMABANK) as FIRMABANK,
iif(FIRMABLZ is NULL, '', FIRMABLZ) as FIRMABLZ,
iif(FIRMAKTO is NULL, '', FIRMAKTO) as FIRMAKTO,
iif(FIRMAKTOINHABER is NULL, '', FIRMAKTOINHABER) as FIRMAKTOINHABER,
iif(VERTRAG is NULL, '', VERTRAG) as VERTRAG,
iif(INFO is NULL, '', INFO) as INFO,
iif(INFO_INTERN is NULL, '', INFO_INTERN) as INFO_INTERN,
iif(INDHONSATZ is NULL, '', INDHONSATZ) as INDHONSATZ,
iif(NAME_VORNAME is NULL, '', NAME_VORNAME) as NAME_VORNAME,
iif(ANSPRACHE is NULL, '', ANSPRACHE) as ANSPRACHE,
iif(ANREDE is NULL, '', ANREDE) as ANREDE,
iif(MOBIL_ANZEIGE is NULL, '', MOBIL_ANZEIGE) as MOBIL_ANZEIGE,
iif(VerbaInfo is NULL, '', VerbaInfo) as VerbaInfo,
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
iif(USTIDNR is NULL, '', USTIDNR) as USTIDNR,
iif(UST_JN is NULL, '', UST_JN) as UST_JN,
iif(Extern is NULL, '', Extern) as Extern,
iif(Abschlag_Sperre is NULL, '', Abschlag_Sperre) as Abschlag_Sperre,
iif(Name_Titel is NULL, '', Name_Titel) as Name_Titel,
iif(eLearningDozID is NULL, '', eLearningDozID) as eLearningDozID,

iif(iif(eLearningVon is NULL, '30.12.1899', eLearningVon) = '30.12.1899', '',CONVERT(nvarchar(10),eLearningVon,20))  as eLearningVon,
iif(iif(eLearningBis is NULL, '30.12.1899', eLearningBis) = '30.12.1899', '',CONVERT(nvarchar(10),eLearningBis,20))  as eLearningBis,

iif(NoWerbung is NULL, '', NoWerbung) as NoWerbung,
iif(Progheft is NULL, '', Progheft) as Progheft,
iif(Internet is NULL, '', Internet) as Internet,
iif(Anmkarte is NULL, '', Anmkarte) as Anmkarte,
iif(VertragAnFirma is NULL, '', VertragAnFirma) as VertragAnFirma,
iif(Newsl_Erlaubt is NULL, '', Newsl_Erlaubt) as Newsl_Erlaubt,
iif(Newsl_Erlart is NULL, '', Newsl_Erlart) as Newsl_Erlart,
iif(Newsl_AnlBearb is NULL, '', Newsl_AnlBearb) as Newsl_AnlBearb,

iif(iif(Newsl_AnlDatum is NULL, '30.12.1899', Newsl_AnlDatum) = '30.12.1899', '',CONVERT(nvarchar(10),Newsl_AnlDatum,20))  as Newsl_AnlDatum,

iif(taetigkeitsbez is NULL, '', taetigkeitsbez) as taetigkeitsbez,
iif(kuenstlername is NULL, '', kuenstlername) as kuenstlername,
iif(homepage is NULL, '', homepage) as homepage,
iif(webdoznicht is NULL, '', webdoznicht) as webdoznicht,
iif(webdoznichtkurs is NULL, '', webdoznichtkurs) as webdoznichtkurs,

iif(iif(einverteiltam is NULL, '30.12.1899', einverteiltam) = '30.12.1899', '',CONVERT(nvarchar(10),einverteiltam,20))  as einverteiltam,

iif(iif(einverfasstvon is NULL, '30.12.1899', einverfasstvon) = '30.12.1899', '',CONVERT(nvarchar(10),einverfasstvon,20))  as einverfasstvon,

iif(urlaub_vor is NULL, '', urlaub_vor) as urlaub_vor,
iif(mandant is NULL, '', mandant) as mandant,
iif(honmwst is NULL, '', honmwst) as honmwst,
iif(krit7 is NULL, '', krit7) as krit7,
iif(krit8 is NULL, '', krit8) as krit8,
iif(interner_doz is NULL, '', interner_doz) as interner_doz,
iif(oeffentldienst is NULL, '', oeffentldienst) as oeffentldienst,
iif(steuerrueckbehalt is NULL, '', steuerrueckbehalt) as steuerrueckbehalt,
iif(gebnameadr is NULL, '', gebnameadr) as gebnameadr,
iif(honorar_sperre is NULL, '', honorar_sperre) as honorar_sperre


from dozenten