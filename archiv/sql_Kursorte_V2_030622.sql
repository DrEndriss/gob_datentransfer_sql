use STF_Endriss

select nr,ort,STRASSE, TELEFON, FAX, bez,MKTEXT, BEARBEITER ,BEARBDATUM, MOBILTEL, 'Infofelder werden manuell nachgetragen!'INFO, 'Hinweisfelder werden manuell nachgetragen!' HINWEIS, Internet, email, art, warnhinweis, mandant
from KURSORTE 
where BEARBDATUM >= '01.01.2017' and Art not like 'Alt'
order by 2