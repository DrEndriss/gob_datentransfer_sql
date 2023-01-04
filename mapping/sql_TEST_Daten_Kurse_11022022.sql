select 
iif (kg.hauptkurs is null,iif(k.Nr not in (select Hauptkurs from kursgruppe),'',k.Nr),kg.Hauptkurs) as HauptKurs_Nr,
k.NR,
iif (kg.hauptkurs is null,iif(k.Nr not in (select Hauptkurs from kursgruppe),'V','L'),'V') as TYP, 



k.BEGINN_DAT,
k.ENDE_DAT,
k.mandant,
k.ORT,
k.FACHB,
k.DAUER,
k.DOZSTDREAL,
k.AUSSENST,
k.SEMESTER,
k.AUSFALL,
k.SONDERGEB,
k.FACHB_BVV,
k.FACHB_LAND,
k.KURZBEZ,
k.DAUERDETAI,
k.BEGINN,
k.ENDE,
k.GEB_ORG,
k.GEBUEHR,
k.GEB_ART,
k.TEIL_MAX,
k.TEIL_MIN,
isnull(k.TEIL_AKT,'') TEIL_AKT,
isnull(k.TEIL_WART,'') TEIL_WART,
replace(k.WARNUNG,';',',') WARNUNG,
k.KURS_ART,
k.KART_KEY,
k.ANRECHEN,
k.STUNDENANZ,
k.VERTRTAGE,
k.BEARBEITER,
k.VERLAUF,
k.BIS_MAX,
k.ABG_DATUM,
k.KNR_ORG,
k.BEARBDATUM,
k.ABW_ANRECHEN,
k.NSAMASSNAHME,
k.KURSAUSWAHL1,
k.KURSAUSWAHL4,
k.KURSAUSWAHL7,
k.VERWALTUNG,
k.HPM,
k.MINUTENTAG,
k.PAUSETAG,
k.UETAG,
Replace(k.TITEL,';',',') TITEL,
Replace(k.MATERIAL,';',',') MATERIAL,
replace(k.INTNOTIZ,';',',')INTNOTIZ,
k.VERTRAG,
k.ZEUGNIS,
k.ABG_BEMERK,
k.info,
k.WOTAG,
k.Sofortzahl,
k.eLearningKursAktiv,
k.eLearningVon,
k.eLearningBis,
k.KSK,
k.NeuerKurs,
k.Essen_JN,
k.InternetAktiv,
k.ErstelltDatum,
k.ErstelltVon,
k.EMailStatus,
k.Fa_Pauschal,
k.WebFlags,
k.WFWeitergabe,
k.eLearningKursID,
k.Master_knr,
k.teil_soll,
k.info_gesperrt,
k.beleg_ans,
k.zgvorlbeschreibung,
k.zgvorldateiname,
k.nr_anzeige,

iif(k.NeuerKurs ='W','W','F') as 'Catering Ja/Nein',
iif(k.VERLAUF = 'E','W','F') as 'Erinnerungsmailing',
iif (kg.hauptkurs is null,iif(k.Nr not in (select Hauptkurs from kursgruppe),'V','H1'),'H2') as KursTyp,
isnull(k.KURSAUSWAHL8,'') as [Soll-UE],
isnull(k.KURSAUSWAHL9,'') as [Soll-Minuten],
			'' FB1,
			''FB2,

case
when k.mandant in ('1') and Substring(k.NR,2,1) = 'A' then '70010'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'B' then '70020'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'W' then '70020'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'K' then '70020'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'C' then '70030'
when k.mandant in ('1') and Substring(k.NR,2,1) in( 'N', 'G' )then '70030'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'D' then '70040'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'E' then '70050'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'F' then '70055'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'P' then '70060'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'U' then '70060'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'I' then '70061'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'S' then '70062'
when k.mandant in ('1') and Substring(k.NR,2,1) = 'H' then '70070'

when k.mandant = '2' and k.FACHB = 'KK' then '73010'
when k.mandant = '2' and k.FACHB = 'VS' then '73010'
when k.mandant = '2' and k.FACHB = 'ON' then '73010'
when k.mandant = '2' and k.FACHB = 'GK' then '73010'
when k.mandant = '2' and k.FACHB = 'INH' then '73020'
when k.mandant = '2' and k.FACHB = 'TM' then '73020'
when k.mandant = '2' and k.FACHB = 'CI' then '73030'
when k.mandant = '2' and k.FACHB = 'SP' then '73030'
when k.mandant = '2' and k.FACHB = 'US' then '73040'
when k.mandant = '2' and k.FACHB = 'BP' then '73060'

when k.mandant = '3' and SUBSTRING(k.NR,2,2) = 'M8' then '74090'
when k.mandant = '3' and SUBSTRING(k.NR,2,2) = 'L3' then '74095'

when k.mandant = '1' and k.FACHB = 'IH' then '70062'
when k.mandant = '2' and k.FACHB = 'IH' then '73020'

	else 'Sonstige'
			end KST,


iif(upper(k.AUSSENST) Like 'VIDEO%', 'Video',
iif(upper(k.AUSSENST) Like 'ONLINE%' OR upper(k.AUSSENST) LIKE 'Webinar' OR substring(k.nr,2,4) IN('B4ON','BAON','D4ON') , 'Online',
iif(upper(k.AUSSENST) Like 'HEIMARBEIT%' OR k.kart_key= '24' OR substring(k.nr,2,3) IN('H5P'), 'Heimarbeit','Pr�senz'))) Darstellungsart_Neu,

iif(k.FACHB= 'IN', 'Info-Veranstaltung',
iif(k.FACHB= 'IH', 'Inhouse' ,
iif(k.kart_key= '16', 'Pr�fung',
iif(k.kart_key= '24', 'Fernlehrgang',
iif(k.FACHB= 'M8' OR (substring(k.nr,2,1)='L' AND k.mandant= 3) , 'Studiengang',
iif((substring(k.nr,2,1) IN ('U','P') AND k.mandant=1) OR k.mandant =2, 'Seminar',
iif(substring(k.fachb,1,1) IN ('X')  OR k.mandant =5 OR substring(k.nr,2,3) IN ('MAT') OR substring(k.nr,2,4) IN ('M8TH') OR k.Nr= 'Script' , 'Sonstiges',

'Lehrgang'))))))) Durchfuehungsart_Neu,

case k.KART_KEY 
	when 9 then 'Abendveranstaltung'
	when 7 then 'Blockveranstaltung'
	when 35 then 'Blockveranstaltung'
	when 24 then 'Blockveranstaltung'
	when 8 then 'Klausurenveranstaltung'
	when 11 then 'Kombiveranstaltung'
	when 37 then 'Kompaktrepetitorium'
	when 12 then 'Wochenendveranstaltung'
	when 21 then 'Wochenveranstaltung'
	when 13 then 'Updateveranstaltung'
	when 6 then 'Intensivveranstaltung'
	when 15 then 'Intensivveranstaltung'
	when 10 then 'Samstags-/Sonntagsveranstaltung'
	when 17 then 'Samstags-/Sonntagsveranstaltung'
	when 1 then 'Tagesveranstaltung'
	when 4 then 'Tagesveranstaltung'
	when 14 then 'Eint�gige Veranstaltung'
	when 18 then 'Eint�gige Veranstaltung'
	when 40 then 'Eint�gige Veranstaltung'
	when 44 then 'Eint�gige Veranstaltung'
	when 25 then 'Eint�gige Veranstaltung'
	when 45 then 'Eint�gige Veranstaltung'
	when 47 then 'Eint�gige Veranstaltung'
	when 16 then 'Eint�gige Veranstaltung'
	when 2 then 'Mehrt�gige Veranstaltung'
	when 3 then 'Mehrt�gige Veranstaltung'
	when 41 then 'Mehrt�gige Veranstaltung'
	when 42 then 'Mehrt�gige Veranstaltung'
	when 36 then 'Mehrt�gige Veranstaltung'
	when 46 then 'Mehrt�gige Veranstaltung'
	when 48 then 'Mehrt�gige Veranstaltung'
	when 49 then 'Mehrt�gige Veranstaltung'
	when 51 then 'Mehrt�gige Veranstaltung'
	when 39 then 'Mehrt�gige Veranstaltung'

	ELSE 'Sonstige'
end

Veranstaltungsart_Neu,

case k.FACHB
	when 'A5' then 'Anlagenbuchhalter'
	when '5K' then 'Anlagenbuchhalter'
	when 'A6' then 'Anlagenbuchhalter'
	when 'AD' then 'Anlagenbuchhalter'
	when 'E1' then 'Bilanzbuchhalter'
	when 'E2' then 'Bilanzbuchhalter'
	when 'E3' then 'Bilanzbuchhalter'
	when 'E4' then 'Bilanzbuchhalter'
	when 'E5' then 'Bilanzbuchhalter'
	when 'E7' then 'Bilanzbuchhalter'
	when 'E8' then 'Bilanzbuchhalter'
	when 'E9' then 'Bilanzbuchhalter'
	when 'U7' then 'Bilanzbuchhalter'
	when 'XE' then 'Bilanzbuchhalter'
	when 'EP' then 'Bilanzbuchhalter'
	when 'XH' then 'Bilanzbuchhalter Zusatzqualifikation'
	when 'E6' then 'Bilanzbuchhalter Zusatzqualifikation'
	when 'H3' then 'Bilanzbuchhalter-International'
	when 'H4' then 'Bilanzbuchhalter-International'
	when 'H9' then 'Bilanzbuchhalter-International'
	when 'HA' then 'Bilanzbuchhalter-International'
	when 'HP' then 'Bilanzbuchhalter-International'
	when '01' then 'Controller'
	when 'D3' then 'Controller'
	when 'D4' then 'Controller'
	when 'D5' then 'Controller'
	when 'D8' then 'Controller'
	when 'D9' then 'Controller'
	when 'DE' then 'Controller'
	when 'PD' then 'Controller'
	when 'XD' then 'Controller'
	when 'A1' then 'Debitoren-/Kreditorenbuchhalter'
	when 'A8' then 'Debitoren-/Kreditorenbuchhalter'
	when 'N2' then 'Fachassistent Lohn und Gehalt'
	when 'N3' then 'Fachassistent Lohn und Gehalt'
	when 'N4' then 'Fachassistent Lohn und Gehalt'
	when 'N5' then 'Fachassistent Lohn und Gehalt'
	when 'N6' then 'Fachassistent Lohn und Gehalt'
	when 'N9' then 'Fachassistent Lohn und Gehalt'
	when 'XN' then 'Fachassistent Lohn und Gehalt'
	when 'A2' then 'Finanzbuchhalter'
	when 'A9' then 'Finanzbuchhalter'
	when 'AB' then 'Finanzbuchhalter'
	when 'H6' then 'IFRS Accountant'
	when 'H5' then 'International Accountant'
	when 'PE' then 'IT/SAP'
	when 'A3' then 'Lohn- und Gehaltsbuchhalter'
	when 'A7' then 'Lohn- und Gehaltsbuchhalter'
	when 'AC' then 'Lohn- und Gehaltsbuchhalter'
	when 'K1' then 'Onboarding Steuerkanzlei'
	when 'PB' then 'Personal'
	when 'PA' then 'Rechnungswesen/Steuern'
	when 'B1' then 'Steuerberater'
	when 'B2' then 'Steuerberater'
	when 'B3' then 'Steuerberater'
	when 'B4' then 'Steuerberater'
	when 'B5' then 'Steuerberater'
	when 'B6' then 'Steuerberater'
	when 'B7' then 'Steuerberater'
	when 'B8' then 'Steuerberater'
	when 'BA' then 'Steuerberater'
	when 'BC' then 'Steuerberater'
	when 'BP' then 'Steuerberater'
	when 'U8' then 'Steuerberater'
	when 'XB' then 'Steuerberater'
	when 'XF' then 'Steuerberater'
	when 'A4' then 'Steuerfachangestellter'
	when 'C1' then 'Steuerfachwirt'
	when 'C2' then 'Steuerfachwirt'
	when 'C3' then 'Steuerfachwirt'
	when 'C4' then 'Steuerfachwirt'
	when 'C5' then 'Steuerfachwirt'
	when 'C6' then 'Steuerfachwirt'
	when 'C9' then 'Steuerfachwirt'
	when 'U9' then 'Steuerfachwirt'
	when 'XC' then 'Steuerfachwirt'
	when 'F2' then 'Wirtschaftsfachwirt'
	when 'F3' then 'Wirtschaftsfachwirt'
	when 'F4' then 'Wirtschaftsfachwirt'
	when 'F5' then 'Wirtschaftsfachwirt'
	when 'F8' then 'Wirtschaftsfachwirt'
	when 'F9' then 'Wirtschaftsfachwirt'
	when 'W4' then 'Wirtschaftspr�fer'
	when 'W5' then 'Wirtschaftspr�fer'
	when 'XW' then 'Wirtschaftspr�fer'
	when 'M8' then 'TaxMaster'
	when 'CI' then 'CINA'
	when 'XU' then 'CINA'
	when 'CK' then 'CINA Konsolidierung'
	when 'SP' then 'CINA Specialist'
	when 'GK' then 'IFRS'
	when 'KK' then 'IFRS'
	when 'ON' then 'IFRS'
	when 'VS' then 'IFRS'
	when 'US' then 'US-GAAP'
	when 'UZ' then 'US-GAAP Specialist'

	ELSE 'Sonstige'
end

Fachgebiet_Neu,



case 


when ((k.TITEL like '%Klausuren-Abschluss%') AND Substring(k.NR,1,3) = 'WBA' AND (k.AUSSENST not in ('Online', 'Online-Kurs') AND  k.DAUERDETAI <> '1 Online-Unterrichtstag')) THEN 'VAVE000071' --Klausuren-Abschlusstraining 
when ((k.TITEL like '%Klausuren-Abschluss%') AND Substring(k.NR,1,3) = 'WBA' AND (k.AUSSENST in ('Online', 'Online-Kurs') AND  k.DAUERDETAI <> '1 Online-Unterrichtstag')) THEN 'VAVE000072' --Klausuren-Abschlusstraining-Online

when (k.TITEL like '%Abgabenordnung%' and SUBSTRING(k.NR,1,5) = 'WBAON') THEN 'VAVE000065' --Abgabenordnung-Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Bilanzsteuerrecht 1%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000066' --Bilanzstuerrecht1-Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Bilanzsteuerrecht 2%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000067' --Bilanzstuerrecht2Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Bilanzsteuerrecht 3%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000068' --Bilanzstuerrecht3Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Ertragsteuern 2%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000069' --Ertragsteuer2Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Ertragsteuern 3%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000070' --Ertragsteuer3Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Umsatzsteuer%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000073' --UmsatzstuerKlausuren-Abschlusstraining-Online 
when (k.TITEL like '%Ertragsteuern%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000302' --Ertragsteuer1-Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Bewertungsrecht%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000490' --Bewertungsrecht-Abschlusstraining-Online 



ELSE
'NIX'

END as VLG
,isnull
(case 
	when upper(k.ORT) like '%H�RSAAL I' and upper(k.ORT) like '%D�SSELDORF%' then '100202'
	when upper(k.ORT) like '%H�RSAAL II' and upper(k.ORT) like '%D�SSELDORF%' then '100202'
	when upper(k.ORT) like '%H�RSAAL I' and upper(k.ORT) like '%FRANKFURT%' then '100388'
	when upper(k.ORT) like '%H�RSAAL II' and upper(k.ORT) like '%FRANKFURT%' then '100388'
	when upper(k.ORT) like '%H�RSAAL III' and upper(k.ORT) like '%FRANKFURT%' then '100388'
	when upper(k.ORT) like '%H�RSAAL IV' and upper(k.ORT) like '%FRANKFURT%' then '100388'
	when upper(k.ORT) like '%H�RSAAL I' and upper(k.ORT) like '%HANNOVER%' then '100150'
	when upper(k.ORT) like '%H�RSAAL II' and upper(k.ORT) like '%HANNOVER%' then '100150'
	when upper(k.ORT) like '%H�RSAAL I' and upper(k.ORT) like '%HAMBURG%' then '100080'
	when upper(k.ORT) like '%H�RSAAL II' and upper(k.ORT) like '%HAMBURG%' then '100080'
	when upper(k.ORT) like '%H�RSAAL III' and upper(k.ORT) like '%HAMBURG%' then '100080'
	when upper(k.ORT) like '%H�RSAAL IV' and upper(k.ORT) like '%HAMBURG%' then '100080'
	when upper(k.ORT) like '%H�RSAAL I' and upper(k.ORT) like '%K�LN%' then '100000'
	when upper(k.ORT) like '%H�RSAAL II' and upper(k.ORT) like '%K�LN%' then '100000'
	when upper(k.ORT) like '%H�RSAAL III' and upper(k.ORT) like '%K�LN%' then '100000'
	when upper(k.ORT) like '%H�RSAAL IV' and upper(k.ORT) like '%K�LN%' then '100000'
	when upper(k.ORT) like '%H�RSAAL I' and upper(k.ORT) like '%MANNHEIM%' then '100480'
	when upper(k.ORT) like '%H�RSAAL II' and upper(k.ORT) like '%MANNHEIM%' then '100480'
	when upper(k.ORT) like '%H�RSAAL III' and upper(k.ORT) like '%MANNHEIM%' then '100480'
	when upper(k.ORT) like '%H�RSAAL I' and upper(k.ORT) like '%M�NCHEN%' then '100566'
	when upper(k.ORT) like '%H�RSAAL II' and upper(k.ORT) like '%M�NCHEN%' then '100566'
	when upper(k.ORT) like '%H�RSAAL III' and upper(k.ORT) like '%M�NCHEN%' then '100566'
	when upper(k.ORT) like '%H�RSAAL I' and upper(k.ORT) like '%STUTTGART%' then '100498'
	when upper(k.ORT) like '%H�RSAAL II' and upper(k.ORT) like '%STUTTGART%' then '100498'



else 
	(select nr from KURSORTE where k.ort =MKTEXT)

end,'') [Veranstaltungsort Nr.]

from kurse k left outer join Kursgruppe kg on k.NR = kg.Unterkurs 
where(
case

when ((k.TITEL like '%Klausuren-Abschluss%') AND Substring(k.NR,1,3) = 'WBA' AND (k.AUSSENST not in ('Online', 'Online-Kurs') AND  k.DAUERDETAI <> '1 Online-Unterrichtstag')) THEN 'VAVE000071' --Klausuren-Abschlusstraining 
when ((k.TITEL like '%Klausuren-Abschluss%') AND Substring(k.NR,1,3) = 'WBA' AND (k.AUSSENST in ('Online', 'Online-Kurs') AND  k.DAUERDETAI <> '1 Online-Unterrichtstag')) THEN 'VAVE000072' --Klausuren-Abschlusstraining-Online

when (k.TITEL like '%Abgabenordnung%' and SUBSTRING(k.NR,1,5) = 'WBAON') THEN 'VAVE000065' --Abgabenordnung-Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Bilanzsteuerrecht 1%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000066' --Bilanzstuerrecht1-Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Bilanzsteuerrecht 2%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000067' --Bilanzstuerrecht2Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Bilanzsteuerrecht 3%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000068' --Bilanzstuerrecht3Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Ertragsteuern 2%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000069' --Ertragsteuer2Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Ertragsteuern 3%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000070' --Ertragsteuer3Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Umsatzsteuer%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000073' --UmsatzstuerKlausuren-Abschlusstraining-Online 
when (k.TITEL like '%Ertragsteuern%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000302' --Ertragsteuer1-Klausuren-Abschlusstraining-Online 
when (k.TITEL like '%Bewertungsrecht%' and SUBSTRING(k.nr,1,5) = 'WBAON') THEN 'VAVE000490' --Bewertungsrecht-Abschlusstraining-Online 



ELSE 
'NIX'
END
) = 'VAVE000302' and k.BEGINN_DAT >= '01.01.2015'  and k.KURZBEZ not like '%Ausfall%' and (k.FACHB not in ('OR', 'VE','X'))   





order by 2