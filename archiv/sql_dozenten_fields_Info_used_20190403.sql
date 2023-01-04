use Kufer_Reporting 

select column_name, data_type, COLUMN_DEFAULT, CHARACTER_MAXIMUM_LENGTH, CHARACTER_SET_NAME, NUMERIC_PRECISION from INFORMATION_SCHEMA.columns where table_name = 'DOZENTEN' and column_name in 
('NR', 'NAME', 'VORNAME', 'TYP', 
'ZUSATZ', 'ZUSATZ2', 'ORT', 
'STRASSE', 'TITEL', 'TEL_ANZEIGE', 
'TEL2_ANZEIGE', 'FAX_ANZEIGE', 'EMAIL_ANZEIGE', 
'GESCHLECHT', 'GEBURTSTAG', 'BANKBEZ', 'KONTO', 
'BLZ', 'NATION', 'SCHULKEY', 'BERUF', 'SEITWANN', 'KONTOINH', 
'BEARBEITER', 'INAKTIV', 'TELWEITER', 'BEARBDATUM', 'FINANZAMT', 

'VERTRAG', 'INFO', 'INFO_INTERN', 'INDHONSATZ',

'ANSPRACHE', 'ANREDE',	'MOBIL_ANZEIGE', 'VerbaInfo', 

'eLearningPersonAktiv', 'eLearningLogin',	'eLearningEMailDatum', 'STEUERNR', 'BIC', 'IBAN', 
'ErstelltDatum', 'ErstelltVon', 'Krit1',	

'Krit2', 'Krit3', 'Krit4', 'Krit5',	'Krit6', 

'UST_JN', 

'Name_Titel', 'eLearningDozID', 'eLearningVon', 'eLearningBis', 

'NoWerbung', 'Progheft',	

'Internet', 'Anmkarte',	

'Newsl_Erlaubt', 'Newsl_AnlBearb', 'Newsl_AnlDatum', 

'mandant', 

'krit7',	'krit8'
)