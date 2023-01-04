use Kufer_Reporting 

select column_name, data_type, COLUMN_DEFAULT, CHARACTER_MAXIMUM_LENGTH, CHARACTER_SET_NAME, NUMERIC_PRECISION from INFORMATION_SCHEMA.columns where table_name = 'DOZENTEN' and column_name in 
('NR', 'SUCHBEGRIFF', 'NAME', 'VORNAME', 'TYP', 'ZUSATZ', 'ZUSATZ2', 'ORT', 'STRASSE', 'TITEL', 'TEL_ANZEIGE', 'TEL2_ANZEIGE', 'FAX_ANZEIGE', 'EMAIL_ANZEIGE', 'GESCHLECHT', 
'GEBURTSTAG', 'BANKBEZ', 'KONTO', 'BLZ', 'NATION', 'SCHULKEY', 'BERUF', 'SEITWANN', 'KONTOINH', 'PERSONALNR', 'BEARBEITER', 'INAKTIV', 'TELWEITER', 'BEARBDATUM', 'GEBURTSNAME', 
'GEBURTSORT', 'SOZIALVERSNR', 'FINANZAMT', 'FAMILIENSTAND', 'ARB_ERLAUB', 'FIRMANAME', 'FIRMAZUSATZ1', 'FIRMAZUSATZ2', 'FIRMASTR', 'FIRMAORT', 'FIRMATEL', 'FIRMAFAX', 'FIRMAEMAIL', 
'FIRMAWWW', 'FIRMABANK', 'FIRMABLZ', 'FIRMAKTO', 'FIRMAKTOINHABER', 'VERTRAG', 'INFO', 'INFO_INTERN', 'INDHONSATZ', 'NAME_VORNAME', 
'ANSPRACHE', 'ANREDE',	'MOBIL_ANZEIGE', 'VerbaInfo', 'eLearningPersonAktiv', 'eLearningLogin',	'eLearningEMailDatum', 'STEUERNR', 'BIC', 'IBAN', 'ErstelltDatum', 'ErstelltVon', 'Krit1',	
'Krit2', 'Krit3', 'Krit4', 'Krit5',	'Krit6', 'USTIDNR',	'UST_JN', 'Extern',	'Abschlag_Sperre', 'Name_Titel', 'eLearningDozID', 'eLearningVon', 'eLearningBis', 'NoWerbung', 'Progheft',	
'Internet', 'Anmkarte',	'VertragAnFirma', 'Newsl_Erlaubt', 'Newsl_Erlart', 'Newsl_AnlBearb', 'Newsl_AnlDatum',	'taetigkeitsbez', 'kuenstlername', 'homepage', 'webdoznicht',	
'webdoznichtkurs', 'einverteiltam', 'einverfasstvon', 'einverfasstam', 'urlaub_vor', 'mandant', 'honmwst', 'krit7',	'krit8', 'interner_doz', 'oeffentldienst', 'steuerrueckbehalt',	
'gebnameadr', 'honorar_sperre'
)