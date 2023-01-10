use STF_Endriss

select kg.ID,
substring(kg.KNR,1,10) KNR,
kg.SCHLUESSEL,
ga.TEXT Gebart,
kg.GEBUEHR,
kg.ERM_GEB,
kg.ERMAESSIGBAR,
kg.BEZEICHNUNG,
kg.MWST,
cast(kg.FAELLIGKEIT as date) Falligkeit

from kurs_geb kg inner join kurse k on k.NR = substring(kg.KNR,1,10)
left join HLGEBARTEN ga on kg.GEBART= ga.SCHLUESSEL

where  BEGINN_DAT >='01.01.2017' 



 order by 2