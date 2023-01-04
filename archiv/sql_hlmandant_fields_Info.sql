use Kufer_Reporting 

select column_name, data_type, COLUMN_DEFAULT, CHARACTER_MAXIMUM_LENGTH, CHARACTER_SET_NAME, NUMERIC_PRECISION from INFORMATION_SCHEMA.columns where table_name = 'hlmandant' and column_name in ('id', 'name', 'bearbeiter', 'bearbdatum', 'erfasstvon', 'erfasstam')