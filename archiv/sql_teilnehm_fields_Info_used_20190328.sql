use Kufer_Reporting 

select column_name, data_type, COLUMN_DEFAULT, CHARACTER_MAXIMUM_LENGTH, CHARACTER_SET_NAME, NUMERIC_PRECISION from INFORMATION_SCHEMA.columns where table_name = 'TEILNEHM' and column_name in 
('nr', 'name', 'vorname', 'typ', 'zusatz', 'ZUSATZ2', 'ort', 'strasse', 'TEL_ANZEIGE', 'TEL2_ANZEIGE', 'FAX_ANZEIGE', 'EMAIL_ANZEIGE', 'NOWERBUNG', 'geschlecht', 'titel', 'gebdat', 'BANKBEZ', 
'konto', 'blz', 'erm_grund', 'erm_ende', 'erm_proz', 'guthaben', 'kontoname', 'KZ_TEXT', 'BEARBEITER', 'NATION', 'BUNDESLAND', 'BEARBDATUM', 'RCHG_ADR_1', 'RCHG_ADR_2', 
'RCHG_ADR_3', 'RCHG_ADR_4', 'RCHG_ADR_5', 'RCHG_ADR_6', 'RCHG_ADR_7', 'ARBAMTNR', 'LAST_ERTEILT', 'REGISTRIERUNG', 'Anrede', 'MITGEINTR', 'MITGBETR', 'MOBIL_ANZEIGE',
'FAX2_ANZEIGE', 'ArbAmtOrt', 'info', 'eLearningPersonAktiv', 'eLearningLogin', 'BIC', 'IBAN', 'ErstelltDatum', 'ErstelltVon', 'Krit1', 'Krit2', 
'Krit3', 'Krit4', 'Krit5', 'Krit6', 'SozProjekt', 'Name_Titel', 'eLearningUserID', 'eLearningVon', 'eLearningBis', 'UstID', 'Newsl_Erlaubt', 'Newsl_Erlart', 'Newsl_AnlBearb', 
'Newsl_AnlDatum', 'Newsl_Bemerk', 'abteilung', 'entsendvhs', 'extern', 'adrfahrgemeinschaft', 'anm_sperre', 'behindert_jn', 'krit7', 'krit8', 'krit9', 'krit10', 'krit11', 
'krit12', 'krit13', 'krit14', 'krit15', 'krit16', 'nichtmeld', 'krit17', 
'krit18', 'krit19', 'krit20', 'krit21', 'krit22', 'krit23', 'rchg_adr_nr', 'sap_angelegt')