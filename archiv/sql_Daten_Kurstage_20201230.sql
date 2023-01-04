use Kufer_Reporting

select kt.ID, kt.KNR, cast(CAST(kt.DATUM as date) as char(10)) DATUM, cast(CAST(kt.ZEIT_BEG as time) as char(5)) ZEIT_BEG, cast(CAST(kt.ZEIT_ENDE as time) as char(5)) ZEIT_ENDE
 , kt.ORT, kt.DNR, kt.BEARBEITER, kt.AUSF, kt.MINUTEN, kt.PAUSE, isnull(kt.MEDIEN1,'') MEDIEN1, isnull(kt.MEDIEN2,'') MEDIEN2, isnull(kt.MEDIEN3,'') MEDIEN3
 , isnull(kt.MEDIEN4,'') MEDIEN4, isnull(kt.MEDIEN5,'' )MEDIEN5, isnull(kt.MEDIEN6,'') MEDIEN6, isnull(kt.MEDIEN7,'') MEDIEN7, isnull(kt.MEDIEN8,'') MEDIEN8
 , isnull(kt.MEDIEN9,'') MEDIEN9, kt.BEARBDATUM, kt.WOTAG, kt.TEXT, kt.QualiID, kt.gh_versendung, kt.kosten, kt.il_anw_ok, kt.erfasstam, kt.erfasstvon
 , isnull(kt.medientext,'') medientext, isnull(kt.geprueft,'') geprueft, kt.keine_raum_ue, kt.bestuhlung, kt.kosten2, kt.kosten3, kt.kosten4, kt.kosten5
 , kt.kosten6, kt.rechnungseingang, kt.kurstagGUID, isnull(kt.zuspaetabgesagt,'') zuspaetabgesagt

 from KURStage kt   join Kurse k on kt.KNR  = k.NR
 where k.SEMESTER  in('2015','2016','2017','2018','2019','2020','2021','2022','2023') and BEGINN_DAT >='01.01.2015' 

 and (k.FACHB not in ('OR', 'VE','X')) 

 order by ID