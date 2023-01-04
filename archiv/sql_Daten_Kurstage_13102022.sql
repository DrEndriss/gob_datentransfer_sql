use STF_Endriss

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
isnull(kt.zuspaetabgesagt,'') zuspaetabgesagt,
-- NEU AB 15.07.2022 Nummern wurden an die aktuellen Nummern aus BC angepasst, die selben Hörsaale kommen mehrmals vor.. - TK
-- NEU AB 15.07.2022 Es wurden neue Hörsälle hinzufügt - TK
-- NEU AB 06.10.2022 Die Veranstltungsortnummern werden aus der Tabelle BCVeranstaltungsnummer gejoint - TK
b.BCNummer as [Veranstaltungsort Nr.],

/*isnull
(case  
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%DÜSSELDORF%'  then '100146'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%DÜSSELDORF%' then '100149'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%FRANKFURT%' and upper(ko.STRASSE) like '%Hanauer%'then '100272'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%FRANKFURT%' and upper(ko.STRASSE) like '%Darmst%'then '100318'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%FRANKFURT%' and upper(ko.STRASSE) like '%Hanauer%' then '100271'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%FRANKFURT%' and upper(ko.STRASSE) like '%Darmst%' then '100316'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) like '%FRANKFURT%' then '100270'
	when upper(kt.ORT) like '%HÖRSAAL IV' and upper(kt.ORT) like '%FRANKFURT%' then '100273'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%HANNOVER%' then '100114'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%HANNOVER%' then '100113'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%HAMBURG%' then '100071'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%HAMBURG%' then '100068'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) like '%HAMBURG%' then '100069'
	when upper(kt.ORT) like '%HÖRSAAL 3+4' and upper(kt.ORT) like '%HAMBURG%' then '100074'
	when upper(kt.ORT) like '%HÖRSAAL IV' and upper(kt.ORT) like '%HAMBURG%' then '100076'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%KÖLN%' then '100001'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%KÖLN%' then '100002'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) like '%KÖLN%' then '100003'
	when upper(kt.ORT) like '%HÖRSAAL IV' and upper(kt.ORT) like '%KÖLN%' then '100004'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%MANNHEIM%' then '100337'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%MANNHEIM%' then '100338'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) like '%MANNHEIM%' then '100340'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%MÜNCHEN%' then '100407'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%MÜNCHEN%' then '100406'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) like '%MÜNCHEN%' then '100402'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%STUTTGART%' and upper(ko.STRASSE) like '%Kronen%' then '100349'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%STUTTGART%' and upper(ko.STRASSE) like '%Kronen%' then '100351'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%STUTTGART%' and upper(ko.STRASSE) like '%Heilbro%' then '100353'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%STUTTGART%' and upper(ko.STRASSE) like '%Heilbro%'then '100358'

else 
	(select nr from KURSORTE where kt.ort =MKTEXT)


end,'') [Veranstaltungsort Nr.]*/

-- NEU AB 06.10.2022 Neu Hörsäe hinzugefügt UND Frankfurt Hörsälle nach Straßen unterteilen, weil es 2*Hörsaal 1 & 2 gibt - TK
-- NEU AB 13.10.2022 Die Hörsälle für Berlin wurden hinzugefügt
isnull
(case 
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%DÜSSELDORF%' then 'DÜ - HS I'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%DÜSSELDORF%' then 'DÜ - HS II'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%FRANKFURT%' and ko.STRASSE like '%Han%' then 'FR - Han - HS I'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%FRANKFURT%' and ko.STRASSE like '%Dar%' then 'FR - Dar - HS I'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%FRANKFURT%' and ko.STRASSE like '%Han%'then 'FR - Han - HS II'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%FRANKFURT%' and ko.STRASSE like '%Dar%'then 'FR - Dar - HS II'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) like '%FRANKFURT%' then 'FR - HS III'
	when upper(kt.ORT) like '%HÖRSAAL IV' and upper(kt.ORT) like '%FRANKFURT%' then 'FR - HS IV'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%HANNOVER%' then 'HA - HS I'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%HANNOVER%' then 'HA - HS II'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%HAMBURG%' then 'HH - HS I'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%HAMBURG%' then 'HH - HS II'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) not like '%HÖRSAAL IV' and upper(kt.ORT) like '%HAMBURG%' then 'HH - HS III'
	when upper(kt.ORT) like '%HÖRSAAL III + IV%' and upper(kt.ORT) like '%HAMBURG%' then 'HH - HS III - IV'
	when upper(kt.ORT) like '%HÖRSAAL IV'  and upper(kt.ORT) not like '%HÖRSAAL III' and upper(kt.ORT) like '%HAMBURG%' then 'HH - HS IV'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%KÖLN%' then 'KÖ - HS I'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%KÖLN%' then 'KÖ - HS II'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) like '%KÖLN%' then 'KÖ - HS III'
	when upper(kt.ORT) like '%HÖRSAAL IV' and upper(kt.ORT) like '%KÖLN%' then 'KÖ - HS IV'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%MANNHEIM%' then 'MA - HS I'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%MANNHEIM%' then 'MA - HS II'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) like '%MANNHEIM%' then 'MA - HS III'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%MÜNCHEN%' then 'MÜ - HS I'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%MÜNCHEN%' then 'MÜ - HS II'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) like '%MÜNCHEN%' then 'MÜ - HS III'
	when upper(kt.ORT) like '%HÖRSAAL I' and ko.STRASSE like '%Kro%' and upper(kt.ORT) like '%STUTTGART%' then 'ST - Kro - HS I'
	when upper(kt.ORT) like '%HÖRSAAL I' and ko.STRASSE like '%Heil%' and upper(kt.ORT) like '%STUTTGART%' then 'ST - Heil - HS I'
	when upper(kt.ORT) like '%HÖRSAAL II' and ko.STRASSE like '%Kro%' and upper(kt.ORT) like '%STUTTGART%' then 'ST - Kro - HS II'
	when upper(kt.ORT) like '%HÖRSAAL II' and ko.STRASSE like '%Heil%' and upper(kt.ORT) like '%STUTTGART%' then 'ST - Heil - HS II'
	when upper(kt.ORT) like '%HÖRSAAL I' and upper(kt.ORT) like '%Berlin%' then 'BER - HS I'
	when upper(kt.ORT) like '%HÖRSAAL II' and upper(kt.ORT) like '%Berlin%' then 'BER - HS II'
	when upper(kt.ORT) like '%HÖRSAAL III' and upper(kt.ORT) like '%Berlin%' then 'BER - HS III'
	when upper(kt.ORT) like '%HÖRSAAL IV' and upper(kt.ORT) like '%Berlin%' then 'BER - HS IV'

ELSE
	case 
		when isnull(kt.kosten,0) between 0 and 299 then 'RM 0-299 EURO'
		when isnull(kt.kosten,0) between 300 and 499 then 'RM 300-499 EURO'
		when isnull(kt.kosten,0) between 500 and 799 then 'RM 500-799 EURO'
		when isnull(kt.kosten,0) > 799 then 'RM 800-2000 EURO'
	end




end,'') [BC-Code Raum (Nr.)],
-- NEU AB 06.10.2022 Wenn es ein eigener Raum ist dann "true", ansonsten "false" - TK
isnull
(case
when BCNummer = '100000' then 'true'
when BCNummer = '100056' then 'true'
when BCNummer = '100070' then 'true'
when BCNummer = '100112' then 'true'
when BCNummer = '100151' then 'true'
when BCNummer = '100277' then 'true'
when BCNummer = '100336' then 'true'
when BCNummer = '100357' then 'true'
when BCNummer = '100403' then 'true'
end,'false') [Eigener Raum]


 from KURStage kt   join Kurse k on kt.KNR  = k.NR
 LEFT JOIN KURSORTE as ko On kt.ORT = ko.MKTEXT
 LEFT JOIN  BCVeranstaltungsnummer as b ON ko.NR = b.KuferNummer
 where  BEGINN_DAT >='01.01.2017' 
 and (k.FACHB not in ('OR', 'VE','X')) and k.mandant in (1,2,3)

 order by kt.Datum