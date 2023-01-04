use Kufer_Reporting 

select column_name, data_type, COLUMN_DEFAULT, CHARACTER_MAXIMUM_LENGTH, CHARACTER_SET_NAME, NUMERIC_PRECISION from INFORMATION_SCHEMA.columns where table_name = 'Kurse' and 
column_name in 
('NR', 'TYP', 'BEGINN_DAT', 'ENDE_DAT', 'mandant', 'ORT', 'FACHB', 'DAUER', 'DOZSTDREAL', 'AUSSENST', 'SEMESTER', 'AUSFALL', 'SONDERGEB', 'FACHB_BVV', 'FACHB_LAND',
 'KURZBEZ', 'DAUERDETAI', 'BEGINN', 'ENDE', 'GEB_ORG', 'GEBUEHR', 'GEB_ART', 'TEIL_MAX', 'TEIL_MIN', 
 'TEIL_AKT', 'TEIL_WART', 'WARNUNG', 'KURS_ART', 'KART_KEY', 'ANRECHEN', 'STUNDENANZ', 
 'VERTRTAGE', 'BEARBEITER', 'VERLAUF', 'BIS_MAX', 'ABG_DATUM', 'KNR_ORG', 'BEARBDATUM', 'ABW_ANRECHEN', 
 'NSAMASSNAHME', 'KURSAUSWAHL1', 'KURSAUSWAHL4', 'KURSAUSWAHL7', 'VERWALTUNG', 'HPM', 'MINUTENTAG', 'PAUSETAG', 'UETAG', 
 'TITEL', 'MATERIAL', 'INTNOTIZ', 'VERTRAG', 'ZEUGNIS', 'ABG_BEMERK', 'INFO', 'WOTAG', 'Sofortzahl', 'eLearningKursAktiv', 'eLearningVon', 'eLearningBis', 'KSK', 
 'NeuerKurs', 'Essen_JN', 'InternetAktiv', 'ErstelltDatum', 'ErstelltVon', 'EMailStatus', 'Fa_Pauschal', 'WebFlags', 'WFWeitergabe', 'eLearningKursID', 'Master_knr', 
 'teil_soll', 'info_gesperrt', 'beleg_ans', 'zgvorlbeschreibung', 'zgvorldateiname', 'nr_anzeige')