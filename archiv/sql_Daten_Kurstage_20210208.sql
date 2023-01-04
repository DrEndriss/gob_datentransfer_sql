use Kufer_Reporting

select kt.ID, 
kt.KNR, 
cast(CAST(kt.DATUM as date) as char(10)) DATUM, 
cast(CAST(kt.ZEIT_BEG as time) as char(5)) ZEIT_BEG, 
cast(CAST(kt.ZEIT_ENDE as time) as char(5)) ZEIT_ENDE, 
kt.ORT, 
kt.DNR, 
kt.BEARBEITER, 
kt.AUSF, 
kt.MINUTEN, 
kt.PAUSE, 
isnull(kt.MEDIEN1,'') MEDIEN1, 
isnull(kt.MEDIEN2,'') MEDIEN2, 
isnull(kt.MEDIEN3,'') MEDIEN3, 
isnull(kt.MEDIEN4,'') MEDIEN4, 
isnull(kt.MEDIEN5,'' )MEDIEN5, 
isnull(kt.MEDIEN6,'') MEDIEN6, 
isnull(kt.MEDIEN7,'') MEDIEN7, 
isnull(kt.MEDIEN8,'') MEDIEN8,
isnull(kt.MEDIEN9,'') MEDIEN9, 
kt.BEARBDATUM, 
kt.WOTAG, 
replace(kt.TEXT,';',',') TEXT, 
isnull(kt.QualiID,'') QualiID, 
isnull(kt.gh_versendung,'') gh_versendung, 
isnull(kt.kosten,'0') kosten, 
isnull(kt.il_anw_ok,'') il_anw_ok, 
isnull(kt.erfasstam,'')erfasstam, 
isnull(kt.erfasstvon,'') erfasstvon,
isnull(replace(cast(kt.medientext as varchar(2000)),';',','),'') medientext, 
isnull(kt.geprueft,'') geprueft, 
isnull(kt.keine_raum_ue,'')keine_raum_ue, 
isnull(kt.bestuhlung,'') bestuhlung, 
isnull(kt.kosten2,'')kosten2, 
isnull(kt.kosten3,'')kosten3,  
isnull(kt.kosten4,'')kosten4,  
isnull(kt.kosten5,'')kosten5,  
isnull(kt.kosten6,'')kosten6,  
isnull(kt.rechnungseingang,'') rechnungseingang, 
kt.kurstagGUID, 
isnull(kt.zuspaetabgesagt,'') zuspaetabgesagt

 from KURStage kt   join Kurse k on kt.KNR  = k.NR
 where  BEGINN_DAT >='01.01.2015' 

 and (k.FACHB not in ('OR', 'VE','X')) 

 order by ID