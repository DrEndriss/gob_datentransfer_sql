use STF_Endriss

select nr,ort,STRASSE, TELEFON, FAX, bez,MKTEXT, BEARBEITER ,BEARBDATUM, MOBILTEL, REPLACE(REPLACE(REPLACE(KURSORTE.INFO, ';', '-') , '"', '-') , '*', '-') as INFO , 'Hinweisfelder werden manuell nachgetragen!' HINWEIS, Internet, email, art, warnhinweis, mandant, BCNummer
from KURSORTE 
LEFT JOIN BCVeranstaltungsnummer  ON KURSORTE.NR = BCVeranstaltungsnummer.KuferNummer
where BEARBDATUM >= '01.01.2017' and Art not like 'Alt'
order by 2