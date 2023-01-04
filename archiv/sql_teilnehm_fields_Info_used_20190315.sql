use Kufer_Reporting 

select column_name, data_type, COLUMN_DEFAULT, CHARACTER_MAXIMUM_LENGTH, CHARACTER_SET_NAME, NUMERIC_PRECISION from INFORMATION_SCHEMA.columns where table_name = 'TEILNEHM' and column_name in 
('nr', 'name', 'vorname', 'typ', 'zusatz', 'ZUSATZ2', 'ort', 'strasse', 'TEL_ANZEIGE', 'TEL2_ANZEIGE', 'FAX_ANZEIGE', 'EMAIL_ANZEIGE', 'NOWERBUNG', 
'nopostwerb_bearb', 'nopostwerb_datum', 'nopostwerb_via', 'nopostwerb_bem', 'nomailwerb', 'nomailwerb_bearb', 'nomailwerb_datum', 'nomailwerb_via', 'nomailwerb_bem', 'notelwerb', 
'notelwerb_bearb', 'notelwerb_datum', 'notelwerb_via', 'notelwerb_bem', 'geschlecht', 'titel', 'gebdat', 'BANKBEZ', 'konto', 'blz', 'erm_grund', 'erm_ende', 
'erm_proz', 'guthaben', 'kontoname', 'KZ_TEXT', 'BEARBEITER', 'NATION', 'BUNDESLAND', 'BEARBDATUM', 'RCHG_ADR_1', 'RCHG_ADR_2', 
'RCHG_ADR_3', 'RCHG_ADR_4', 'RCHG_ADR_5', 'RCHG_ADR_6', 'RCHG_ADR_7', 'ARBAMTNR', 'LAST_ERTEILT', 'REGISTRIERUNG', 
'Anrede', 'MITGEINTR', 'MITGBETR', 'MOBIL_ANZEIGE', 'FAX2_ANZEIGE', 'ArbAmtOrt', 'info', 'INFO_INTERN', 'eLearningPersonAktiv', 'eLearningLogin', 'BIC', 'IBAN', 'Verstorben', 'ErstelltDatum', 'ErstelltVon', 'Krit1', 'Krit2', 
'Krit3', 'Krit4', 'Krit5', 'Krit6', 'SozProjekt', 'Name_Titel', 'eLearningUserID', 'eLearningVon', 'eLearningBis', 'UstID', 'Newsl_Erlaubt', 'Newsl_Erlart', 'Newsl_AnlBearb', 
'Newsl_AnlDatum', 'Newsl_Bemerk', 'InfoIntAnm', 'InfoAllgAnm', 'abteilung', 'entsendvhs', 'extern', 'adrfahrgemeinschaft', 'anm_sperre', 'nofaxwerb', 
'nofaxwerb_bearb', 'nofaxwerb_bem', 'nofaxwerb_via', 'nofaxwerb_datum', 'behindert_jn', 'krit7', 'krit8', 'krit9', 'krit10', 'krit11', 'krit12', 'krit13', 'krit14', 'krit15', 'krit16', 
'noepostwerb', 'noepostwerb_bearb', 'noepostwerb_bem', 'noepostwerb_datum', 'noepostwerb_via', 'unbverzogen', 'bekverzogen', 'nichtmeld', 'krit17', 'krit18', 'krit19', 'krit20', 'krit21', 
'krit22', 'krit23', 'rchg_adr_nr', 'sap_angelegt')