use Kufer_Reporting

select nr,ort,STRASSE, TELEFON, FAX, bez,MKTEXT, BEARBEITER ,BEARBDATUM, MOBILTEL, 'Infofelder werden manuell nachgetragen!'INFO, 'Hinweisfelder werden manuell nachgetragen!' HINWEIS, Internet,
	email, art, warnhinweis, mandant


 from KURSORTE order by 2