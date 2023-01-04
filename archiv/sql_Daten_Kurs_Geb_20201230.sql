use Kufer_Reporting

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

where k.SEMESTER  in('2015','2016','2017','2018','2019','2020','2021','2022','2023') and BEGINN_DAT >='01.01.2015' 



 order by 1