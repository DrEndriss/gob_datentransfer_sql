use STF_Endriss

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
CAST ( k.INFO AS varchar ),  
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

iif(k.NeuerKurs ='W','W','F') as 'Catering JaNein',
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
iif(upper(k.AUSSENST) Like 'HEIMARBEIT%' OR k.kart_key= '24' OR substring(k.nr,2,3) IN('H5P'), 'Heimarbeit','Präsenz'))) Darstellungsart_Neu,

iif(k.FACHB= 'IN', 'Info-Veranstaltung',
iif(k.FACHB= 'IH', 'Inhouse' ,
iif(k.kart_key= '16', 'Prüfung',
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
	when 14 then 'Eintägige Veranstaltung'
	when 18 then 'Eintägige Veranstaltung'
	when 40 then 'Eintägige Veranstaltung'
	when 44 then 'Eintägige Veranstaltung'
	when 25 then 'Eintägige Veranstaltung'
	when 45 then 'Eintägige Veranstaltung'
	when 47 then 'Eintägige Veranstaltung'
	when 16 then 'Eintägige Veranstaltung'
	when 2 then 'Mehrtägige Veranstaltung'
	when 3 then 'Mehrtägige Veranstaltung'
	when 41 then 'Mehrtägige Veranstaltung'
	when 42 then 'Mehrtägige Veranstaltung'
	when 36 then 'Mehrtägige Veranstaltung'
	when 46 then 'Mehrtägige Veranstaltung'
	when 48 then 'Mehrtägige Veranstaltung'
	when 49 then 'Mehrtägige Veranstaltung'
	when 51 then 'Mehrtägige Veranstaltung'
	when 39 then 'Mehrtägige Veranstaltung'

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
	when 'W4' then 'Wirtschaftsprüfer'
	when 'W5' then 'Wirtschaftsprüfer'
	when 'XW' then 'Wirtschaftsprüfer'
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

when ((substring(k.nr,2,2) = 'A1') AND (substring(k.nr,7,2)) = '3D') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000001' --Debitoren/Kreditoren
when ((substring(k.nr,2,2) = 'A1') AND (substring(k.nr,7,2)) = '3D') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000492'
when ((substring(k.nr,2,2) = 'A1') AND (substring(k.nr,7,2)) = '3G') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000001'
when ((substring(k.nr,2,2) = 'A1') AND (substring(k.nr,7,2)) = '3G') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000492'
when ((substring(k.nr,2,2) = 'A1') AND (substring(k.nr,7,2)) = '1D') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000004'
when ((substring(k.nr,2,2) = 'A1') AND (substring(k.nr,7,2)) = '1D') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000005'
when ((substring(k.nr,2,2) = 'A1') AND (substring(k.nr,7,2)) = '1G') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000004'
when ((substring(k.nr,2,2) = 'A1') AND (substring(k.nr,7,2)) = '1G') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000005'
when ((substring(k.nr,2,2) = 'A1') AND (substring(k.nr,7,2)) = '2D') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000003'
when ((substring(k.nr,2,2) = 'A1') AND (substring(k.nr,7,2)) = '2G') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000003'

when ((substring(k.nr,2,2) = 'A2') AND (substring(k.nr,7,2)) = '3F') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video')) THEN 'VAVE000012' --Finanzbuchhalter /Samstag
when ((substring(k.nr,2,2) = 'A2') AND (substring(k.nr,7,2)) = '3F') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000010'
when ((substring(k.nr,2,2) = 'A2') AND (substring(k.nr,7,2)) = '3G') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video')) THEN 'VAVE000012'
when ((substring(k.nr,2,2) = 'A2') AND (substring(k.nr,7,2)) = '3G') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000010'
when ((substring(k.nr,2,2) = 'A2') AND (substring(k.nr,7,2)) = '1F') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000009'--Finanzbuchhalter /Tageslehrgang
when ((substring(k.nr,2,2) = 'A2') AND (substring(k.nr,7,2)) = '1G') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000009'--Finanzbuchhalter /Grundlage
when ((substring(k.nr,2,2) = 'A2') AND (substring(k.nr,7,2)) = '2F') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000007'--Finanzbuchhalter /Abendlehrgang
when ((substring(k.nr,2,2) = 'A2') AND (substring(k.nr,7,2)) = '2F') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000008'
when ((substring(k.nr,2,2) = 'A2') AND (substring(k.nr,7,2)) = '2G') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000007'
when ((substring(k.nr,2,2) = 'A2') AND (substring(k.nr,7,2)) = '2G') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000008'

when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '3L') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video')) THEN 'VAVE000014' --Lohn und Gehaltsbuchhalter /Samstag
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '3L') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000506'
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '3L') AND (k.AUSSENST in ('Video')) THEN 'VAVE000018'
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '3G') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video')) THEN 'VAVE000014'
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '3G') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000506'
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '3G') AND (k.AUSSENST in ('Video')) THEN 'VAVE000018'
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '1L') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000016'--Lohn und Gehaltsbuchhalter /Tageslehrgang
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '1L') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000509'
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '1G') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000016'--Lohn und Gehaltsbuchhalter /Grundlage
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '1G') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000509'
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '2L') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000015'--Lohn und Gehaltsbuchhalter /Abendlehrgang
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '2L') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000512'
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '2G') AND (k.AUSSENST not in ('Online', 'Online-Kurs')) THEN 'VAVE000015'
when ((substring(k.nr,2,2) = 'A3') AND (substring(k.nr,7,2)) = '2G') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000512'

when ((substring(k.nr,2,2) = 'A4')  AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000488' --Steuerfachangestellter/in Präsenz
when ((substring(k.nr,2,2) = 'A4')  AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000515' --Steuerfachangestellter/in Präsenz


when ((substring(k.nr,2,2) = 'A5') AND (substring(k.nr,7,2)) = '3A') AND (substring(k.nr,10,1)) <> 'P' AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video')) THEN 'VAVE000019' --Anlagenbuchhalter /Samstag
when ((substring(k.nr,2,2) = 'A5') AND (substring(k.nr,7,2)) = '3G') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video')) THEN 'VAVE000019' --Anlagenbuchhalter /Grundlagen
when ((substring(k.nr,2,2) = 'A5') AND (substring(k.nr,7,2)) = '2A') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000489'--Anlagenbuchhalter /Abendlehrgang Online
when ((substring(k.nr,2,2) = 'A5') AND (substring(k.nr,7,2)) = '2G') AND (k.AUSSENST in ('Online', 'Online-Kurs')) THEN 'VAVE000489'--Anlagenbuchhalter /Abendlehrgang Online Grundkurs

when ((substring(k.nr,2,2) = 'A6') AND (substring(k.nr,6,2)) = 'AB') AND (substring(k.nr,8,2)) <> '-I' AND (k.AUSSENST in ('Bundesweit')) THEN 'VAVE000021' --Anlagenbuchhalter FL
when ((substring(k.nr,2,5) = 'A7FLL') AND (substring(k.nr,9,2)) <> '-I' AND (k.AUSSENST in ('Bundesweit'))) THEN 'VAVE000023' --Lohn- und Gehaltbuchhalter FL
when ((substring(k.nr,2,5) = 'A7FLG') AND (substring(k.nr,9,2)) <> '-I' AND (k.AUSSENST in ('Bundesweit'))) THEN 'VAVE000023' --Lohn- und Gehaltbuchhalter GK FL
when ((substring(k.nr,2,5) = 'A8FLD') AND (substring(k.nr,9,2)) <> '-I' AND (k.AUSSENST in ('Bundesweit'))) THEN 'VAVE000025' --Debitoren- Kreditoren FL
when ((substring(k.nr,2,5) = 'A8FLG') AND (substring(k.nr,7,2)) <> '-I' AND (k.AUSSENST in ('Bundesweit'))) THEN 'VAVE000025' --Debitoren- Kreditoren GK FL
when ((substring(k.nr,2,2) = 'A8') AND (substring(k.nr,7,1)) = 'P')  AND (k.AUSSENST in ('Bundesweit')) THEN 'VAVE000002' ----Debitoren- Kreditoren GK FL Prüfung
when ((substring(k.nr,2,5) = 'A9FLF') AND (substring(k.nr,8,2)) <> '-I' AND (k.AUSSENST in ('Bundesweit'))) THEN 'VAVE000026' --Finanzbuchhalter FLVAVE000285 
when ((substring(k.nr,2,5) = 'A9FLG') AND (substring(k.nr,7,2)) <> '-I' AND (k.AUSSENST in ('Bundesweit'))) THEN 'VAVE000026' --Finanzbuchhalter GK FL

when ((substring(k.nr,2,2) = 'AB') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video')) and substring(k.nr,1,1) <> 'L') THEN 'VAVE000028' ---Intensivlehrgang - Finanzbuchhalter/-in/Präsenz
when ((substring(k.nr,2,2) = 'AB') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000525' ---Intensivlehrgang - Finanzbuchhalter/-in/Online
when ((substring(k.nr,2,2) = 'AB') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000029' ---Intensivlehrgang - Finanzbuchhalter/-in/Online
when ((substring(k.nr,2,2) = 'AC') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000030' ---Intensivlehrgang - Lohn- und Gehaltsbuchhalter/in/Präsenz
when ((substring(k.nr,2,2) = 'AC') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000031' ---Intensivlehrgang - Lohn- und Gehaltsbuchhalter/in/Online
when ((substring(k.nr,2,2) = 'AD')) THEN 'VAVE000526'---Online-Intensiv-Klausurbesprechung

when ((substring(k.nr,2,2) = 'B1') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000033' ---Steuerberater Tageslehrgang/Präsenz
when ((substring(k.nr,2,2) = 'B1') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000034' ---Steuerberater Tageslehrgang/Online
when ((substring(k.nr,2,2) = 'B2') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000035' ---Steuerberater Kompakt Repetorium/Präsenz
when ((substring(k.nr,2,2) = 'B2') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000036' ---Steuerberater Kompakt Repetorium/Online
when ((substring(k.nr,2,2) = 'B3') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000037' ---Steuerberater Samstagslehrgang/Präsenz
when ((substring(k.nr,2,2) = 'B3') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000038' ---Steuerberater Samstagslehrgang/Online

when ((substring(k.nr,2,2) = 'B4') AND (substring(k.nr,4,2) <> 'ON')) THEN 'VAVE000056' ---Steuerberater Intensivklausurenlehrgang/Präsenz

when ((substring(k.nr,2,2) = 'B4') AND (substring(k.nr,4,2) = 'ON')) THEN 'VAVE000057' ---Steuerberater Intensivklausurenlehrgang/Online
when ((substring(k.nr,2,2) = 'B5') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000059' ---Steuerberater Klausurentechnik/Präsenz
when ((substring(k.nr,2,2) = 'B5') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000060' ---Steuerberater Klausurentechnik/Online
when ((substring(k.nr,2,2) = 'B6') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000061' ---Steuerberater Prüfungssilulatuion/mündliche
when ((substring(k.nr,2,2) = 'B6') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000521' ---Steuerberater Klausurentechnik/mündliche Online
when ((substring(k.nr,2,2) = 'B7') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000062' ---Steuerberater - Vorbereitung auf die mdl. Prüfung/Präsenz
when ((substring(k.nr,2,2) = 'B7') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000063' ---Steuerberater - Vorbereitung auf die mdl. Prüfung/Online
when ((substring(k.nr,2,2) = 'B8')) THEN 'VAVE000064' ---Steuerberater - Kombi-Lehrgang/Präsenz
when ((substring(k.nr,2,2) = 'BC') ) THEN 'VAVE000074' ---Steuerberater Vertiefungskurs AO/Verfahrensrecht / Präsenz
when ((substring(k.nr,2,2) = 'BD') ) THEN 'VAVE000524' ---Steuerberater Steuerberater - Abendlehrgang / Online
when ((substring(k.nr,2,2) = 'BP') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000075' ---Steuerberater Buchführungs-Propädeutik  Bilanz/Präsenz
when ((substring(k.nr,2,2) = 'BP') AND (k.AUSSENST in ('Online', 'Webinar'))) THEN 'VAVE000076' ---Steuerberater Buchführungs-Propädeutik  Bilanz/Online

when ((substring(k.nr,2,2) = 'C1') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000077' ---Steuerfachwirt - Tageslehrgang/Präsenz
when ((substring(k.nr,2,2) = 'C1') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000527' ---Steuerfachwirt - Tageslehrgang/Online
when ((substring(k.nr,2,2) = 'C2') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000078' ---Steuerfachwirt - Abendlehrgang - Online-Kurs/Online
when ((substring(k.nr,2,2) = 'C3') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000079' ---Steuerfachwirt - SamstaglehrgangPräsenz
when ((substring(k.nr,2,2) = 'C3') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000081' ---Steuerfachwirt - Samstaglehrgang/Online
when ((substring(k.nr,2,2) = 'C4') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000082' ---Steuerfachwirt - Intensivlehrgang/Präsenz
when ((substring(k.nr,2,2) = 'C4') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000528' ---Steuerfachwirt - Samstaglehrgang/Online
when ((substring(k.nr,2,4) = 'C5ON') and (substring(nr,7,1) not in(1,2,3))) THEN 'VAVE000084' ---Steuerfachwirt - Klausurenlehrgang/Online HK
when ((substring(k.nr,2,4) = 'C5ON') and (substring(nr,7,1) in(1))) THEN 'VAVE000085' ---Steuerfachwirt - Klausurenlehrgang/Online GK1
when ((substring(k.nr,2,4) = 'C5ON') and (substring(nr,7,1) in(2))) THEN 'VAVE000086' ---Steuerfachwirt - Klausurenlehrgang/Online GK2
when ((substring(k.nr,2,4) = 'C5ON') and (substring(nr,7,1) in(3))) THEN 'VAVE000087' ---Steuerfachwirt - Klausurenlehrgang/Online GK3
when ((substring(k.nr,2,2) = 'C6') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000088' ---Steuerfachwirt - mdl. Vorbereitung/Präsenz
when ((substring(k.nr,2,2) = 'C6') AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000529' ---Steuerfachwirt - mdl. Vorbereitung/Online
when ((substring(k.nr,2,2) = 'C9') AND (substring(k.nr,6,2)) <> '-I' AND (k.AUSSENST in ('Bundesweit'))) THEN 'VAVE000089' --Steuerfachwirt - Fernlehrgang

when ((substring(k.nr,2,2) = 'D3') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video')) and (substring(nr,7,1) not in(1,2,3,4,5,6))) THEN 'VAVE000091' ---Controller-Samstaglehrgang/ HK Präsenz
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) not in(1,2,3,4,5,6)) AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000092' ---Controller-Samstaglehrgang/Online HK
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(1)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000093' ---Controller-Samstaglehrgang/Präsenz GK1
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(2)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000095' ---Controller-Samstaglehrgang/Präsenz GK2
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(3)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000097' ---Controller-Samstaglehrgang/Präsenz GK3
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(4)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000099' ---Controller-Samstaglehrgang/Präsenz GK4
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(5)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Video'))) THEN 'VAVE000101' ---Controller-Samstaglehrgang/Präsenz GK5
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(1)) AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000094' ---Controller-Samstaglehrgang/Online GK1
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(2)) AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000096' ---Controller-Samstaglehrgang/Online GK2
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(3)) AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000098' ---Controller-Samstaglehrgang/Online GK3
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(4)) AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000100' ---Controller-Samstaglehrgang/Online GK4
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(5)) AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000530' ---Controller-Samstaglehrgang/Online GK5
when ((substring(k.nr,2,2) = 'D3') and (substring(nr,7,1) in(6)) AND (k.AUSSENST in ('Online', 'Online-Kurs'))) THEN 'VAVE000531' ---Controller-Samstaglehrgang/Online GK6

when ((substring(k.nr,2,2) = 'D4') and (substring(nr,9,1) in(1))) THEN 'VAVE000102' ---Controller-Prüfung I: Kostenrechnung und -Management
when ((substring(k.nr,2,2) = 'D4') and (substring(nr,9,1) in(2))) THEN 'VAVE000103' ---Controller-Prüfung II - 
when ((substring(k.nr,2,2) = 'D4') and (substring(nr,9,1) in(3))) THEN 'VAVE000104' ---Controller-Prüfung III - 
when ((substring(k.nr,2,2) = 'D4') and (substring(nr,9,1) in(4))) THEN 'VAVE000105' ---Controller-Prüfung IV - Online GK3


when ((substring(k.nr,2,2) = 'D5') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar')) and (substring(nr,7,1) not in(1,2,3,4,5))) THEN 'VAVE000112' ---Excel-Woche / HK Präsenz
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) not in(1,2,3,4,5)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000106' ---Excel-Woche - HK Webinar
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) in(1)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000113' ---Excel-Woche Präsenz GK1
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) in(2)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000114' ---Excel-Woche /Präsenz GK2
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) in(3)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000115' ---Excel-Woche /Präsenz GK3
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) in(4)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000116' ---Excel-Woche /Präsenz GK4
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) in(5)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000117' ---Excel-Woche /Präsenz GK5
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) in(1)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000107' ---Excel-Woche /Online GK1
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) in(2)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000108' ---Excel-Woche /Online GK2
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) in(3)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000109' ---Excel-Woche /Online GK3
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) in(4)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000110' ---Excel-Woche /Online GK4
when ((substring(k.nr,2,2) = 'D5') and (substring(nr,7,1) in(5)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000111' ---Excel-Woche /Online GK5

when ((substring(k.nr,2,2) = 'D8') AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar')) and (substring(nr,7,1) not in(1,2,3,4))) THEN 'VAVE000118' ---Controller-Blocklehrgang: / HK Präsenz
when ((substring(k.nr,2,2) = 'D8') and (substring(nr,7,1) not in(1,2,3,4,5)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000119' ---Controller-Blocklehrgang:  - HK Webinar
when ((substring(k.nr,2,2) = 'D8') and (substring(nr,7,1) in(1)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000120' ---Controller-Blocklehrgang: Modul GK1
when ((substring(k.nr,2,2) = 'D8') and (substring(nr,7,1) in(2)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000122' ---Controller-Blocklehrgang: Modul /Präsenz GK2
when ((substring(k.nr,2,2) = 'D8') and (substring(nr,7,1) in(3)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000124' ---Controller-Blocklehrgang: Modul /Präsenz GK3
when ((substring(k.nr,2,2) = 'D8') and (substring(nr,7,1) in(4)) AND (k.AUSSENST not in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000126' ---Controller-Blocklehrgang: Modul /Präsenz GK4
when ((substring(k.nr,2,2) = 'D8') and (substring(nr,7,1) in(1)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000121' ---Controller-Blocklehrgang: Modul/Online GK1
when ((substring(k.nr,2,2) = 'D8') and (substring(nr,7,1) in(2)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000123' ---Controller-Blocklehrgang: Modul /Online GK2
when ((substring(k.nr,2,2) = 'D8') and (substring(nr,7,1) in(3)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000125' ---Controller-Blocklehrgang: Modul /Online GK3
when ((substring(k.nr,2,2) = 'D8') and (substring(nr,7,1) in(4)) AND (k.AUSSENST in ('Online', 'Online-Kurs','Webinar'))) THEN 'VAVE000127' ---Controller-Blocklehrgang: Modul/Online GK4

when ((substring(k.nr,2,2) = 'D9') and (substring(nr,6,1) not in(1,2,3,4,5))) THEN 'VAVE000128' ---Controller-Fernlehrgang
when ((substring(k.nr,2,2) = 'D9') and (substring(nr,6,1) in(1)) and (substring(nr,7,2) not in('-I'))) THEN 'VAVE000129' ---Controller-Fernlehrgang Modul1
when ((substring(k.nr,2,2) = 'D9') and (substring(nr,6,1) in(2)) and (substring(nr,7,2) not in('-I'))) THEN 'VAVE000130' ---Controller-Fernlehrgang Modul2
when ((substring(k.nr,2,2) = 'D9') and (substring(nr,6,1) in(3)) and (substring(nr,7,2) not in('-I'))) THEN 'VAVE000131' ---Controller-Fernlehrgang Modul3
when ((substring(k.nr,2,2) = 'D9') and (substring(nr,6,1) in(4)) and (substring(nr,7,2) not in('-I'))) THEN 'VAVE000132' ---Controller-Fernlehrgang Modul4
when ((substring(k.nr,2,2) = 'D9') and (substring(nr,6,1) in(5)) and (substring(nr,7,2) not in('-I'))) THEN 'VAVE000133' ---Controller-Fernlehrgang Modul5

when ((substring(k.nr,2,2) = 'DE') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000532' ---MS-EXCEL-Grundlagenseminar-Online
when ((substring(k.nr,2,2) = 'DE') AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000134' ---MS-EXCEL-Grundlagenseminar-Präsenz

when ((substring(k.nr,2,2) = 'E1') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000136' ---Bilanzbuchhalter-Tageslehrgang-Online
when ((substring(k.nr,2,2) = 'E1') AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000135' ---Bilanzbuchhalter-Tageslehrgang-Präsenz

when ((substring(k.nr,2,2) = 'E2') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000138' ---Abenlehrgang--Online
when ((substring(k.nr,2,2) = 'E2') AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000137' ---Abenlehrgang--Präsens

when ((substring(k.nr,2,2) = 'E3') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000140' ---Bilanzbuchhalter-Samstagslehrgang-Online
when ((substring(k.nr,2,2) = 'E3') and (substring(nr,7,1) not in('I')) AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000139' ---Bilanzbuchhalter-Samstagslehrgang-Präsens

when ((substring(k.nr,2,2) = 'E4') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000143' ---Bilanzbuchhalter-Intensivlehrgang-Sch.Prüfung-Online
when ((substring(k.nr,2,2) = 'E4') AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000142' ---Abenlehrgang-Intensivlehrgang-Sch.Prüfung-Präsens

when (substring(k.nr,2,2) = 'E5') THEN 'VAVE000144' ---Bilanzbuchhalter - Intensivlehrgang-PrüungsteilA

when (substring(k.nr,2,2) = 'E6') THEN 'VAVE000145' ---Bilanzbuchhalter-Intensivlehrgang-Zusatzquali.

when (substring(k.nr,2,2) = 'E7') THEN 'VAVE000146' ---Bilanzbuchhalter-Intensivlehrgang-Video

when ((substring(k.nr,2,2) = 'E8') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000533' ---Bilanzbuchhalter-Intensivlehrgang-Mdl.-Online
when ((substring(k.nr,2,2) = 'E8') AND (k.AUSSENST not in ('Online-Kurs', 'Video'))) THEN 'VAVE000147' ---Bilanzbuchhalter--Intensivlehrgang-Mdl.-Präsens
when ((substring(k.nr,2,2) = 'E8') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000534' ---Bilanzbuchhalter--Intensivlehrgang-Mdl-Video


when ((substring(k.nr,2,2) = 'EA')) THEN 'VAVE000535' ---Bilanzbuchhalter-IHK-Video-Online

when ((substring(k.nr,2,2) = 'F1')) THEN 'VAVE000536' ---Wirtschaftsfachwirt-Tageslehrgang
when ((substring(k.nr,2,2) = 'F2') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000537' ---Wirtschaftsfachwirt-Abendlehrgang--Online
when ((substring(k.nr,2,2) = 'F3') AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000149' ---Wirtschaftsfachwirt-Samstaglehrgang--Präsenz
when ((substring(k.nr,2,2) = 'F4') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000152' ---Wirtschaftsfachwirt-Intensivlehrgang-Prüfungsteil-HQ-Online
when ((substring(k.nr,2,2) = 'F4') AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000150' ---Wirtschaftsfachwirt-Intensivlehrgang-Prüfungsteil-HQ-Präsenz
when ((substring(k.nr,2,2) = 'F5') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000153' ---Wirtschaftsfachwirt-Intensivlehrgang-Prüfungsteil-WQ-Online
when ((substring(k.nr,2,2) = 'F5') AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000151' ---Wirtschaftsfachwirt-Intensivlehrgang-Prüfungsteil-WQ-Präsenz
when ((substring(k.nr,2,2) = 'F8') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000155' ---Wirtschaftsfachwirt-Intensivlehrgang-Mdl-Online
when ((substring(k.nr,2,2) = 'F8') AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000154' ---Wirtschaftsfachwirt-Intensivlehrgang-Mdl-Präsenz
when ((substring(k.nr,2,2) = 'F9') and (substring(nr,6,2) not in('-I'))) THEN 'VAVE000156' ---Wirtschaftsfachwirt-Fernlehrganglehrgang

when ((substring(k.nr,2,2) = 'G2')) THEN 'VAVE000539' ---Fachasisstent-DigitalisierungundIT-Abendlehrgang
when ((substring(k.nr,2,2) = 'G3')) THEN 'VAVE000540' ---Fachasisstent-DigitalisierungundIT-Samstagslehrgang

when ((substring(k.nr,2,2) = 'H4') AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000158' ---Bilanzbuchhalter-International-Intensivlehrgang-Präsens
when ((substring(k.nr,2,2) = 'H4') AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000541' ---Bilanzbuchhalter-International-Intensivlehrgang-Online

when ((substring(k.nr,2,4) = 'H5FL') and (substring(nr,7,2) not in('-I'))) THEN 'VAVE000159' ---Fernlehrganglehrgang-InternationalAccounting
when ((substring(k.nr,2,4) = 'H5PR')) THEN 'VAVE000160' ---Fernlehrganglehrgang-InternationalAccounting-Prüfung

when ((substring(k.nr,2,2) = 'H9')and (substring(nr,6,2) not in('-I'))) THEN 'VAVE000162' ---Bilanzbuchhalter-International-Fernlehrang

when ((substring(k.nr,2,2) = 'HA')) THEN 'VAVE000163' ---Bilanzbuchhalter-International-OnlineKlausurenbesprechung

when ((substring(k.nr,2,5) = 'INFOA') AND ( substring(k.kurzbez,1,2) = 'De')) THEN 'VAVE000175' ---Debitoren/Kreditorenbuchhalter-Infoveranstatung
when ((substring(k.nr,2,5) = 'INFOA') AND ( substring(k.kurzbez,1,2) = 'Fi') AND ( substring(k.kurzbez,21,2) = 'Vi')) THEN 'VAVE000177' ---Finanzbuchhalter-Infoveranstatung
when ((substring(k.nr,2,5) = 'INFOA') AND ( substring(k.kurzbez,1,2) = 'Fi') AND ( substring(k.kurzbez,21,2) = 'Fe')) THEN 'VAVE000178' ---Finanzbuchhalter-Fernlehrgang-Infoveranstatung
when ((substring(k.nr,2,5) = 'INFOA') AND ( substring(k.kurzbez,1,2) = 'Lo') AND ( substring(k.kurzbez,33,1) = '-')) THEN 'VAVE000180' ---Lohn/Gehaltsbuchhalter-Infoveranstaltung
when ((substring(k.nr,2,5) = 'INFOA') AND ( substring(k.kurzbez,1,2) = 'Lo') AND ( substring(k.kurzbez,32,2) = 'Fe')) THEN 'VAVE000181' ---Lohn/Gehaltsbuchhalter-Infoveranstaltung-Fernlehrgang
when ((substring(k.nr,2,5) = 'INFOA') AND ( substring(k.kurzbez,1,2) = 'An')) THEN 'VAVE000166' ---Anlagenbuchhalter-Infoveranstaltung
when ((substring(k.nr,2,6) = 'INFOA6')) THEN 'VAVE000194' ---Anlagenbuchhalter-FL-Infoveranstaltung-Video
when ((substring(k.nr,2,6) = 'INFOA8')) THEN 'VAVE000198' ---DebitorenundKreditoren-FL-Infoveranstaltung-Video
when ((substring(k.nr,2,6) = 'INFOA9')) THEN 'VAVE000199' ---Finazbuchhalter-FL-Infoveranstaltung-Video

when ((substring(k.nr,2,5) = 'INFOB') AND (k.AUSSENST not in ('Online-Infoveranstaltung', 'Video', 'Online'))) THEN 'VAVE000184' ---Steuerberater-Infoveranstaltung-Präsens
when ((substring(k.nr,2,5) = 'INFOB') AND (k.AUSSENST in ('Online-Infoveranstaltung', 'Online'))) THEN 'VAVE000183' ---Steuerberater-Infoveranstaltung-Online
when ((substring(k.nr,2,5) = 'INFOB') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000201' ---Steuerberater-Infoveranstaltung-Video

when ((substring(k.nr,2,5) = 'INFOC') AND (k.AUSSENST not in ('Online-Infoveranstaltung', 'Webinar', 'Online'))) THEN 'VAVE000185' ---Steuerfachwirt-Infoveranstaltung-Präsens
when ((substring(k.nr,2,5) = 'INFOC') AND (k.AUSSENST in ('Online-Infoveranstaltung', 'Online', 'Webinar'))) THEN 'VAVE000186' ---Steuerfachwirt-Infoveranstaltung-Online

when ((substring(k.nr,2,5) = 'INFOD') AND (k.AUSSENST not in ('Webinar', 'Video', 'Online'))) THEN 'VAVE000172' ---Controller-Infoveranstaltung-Präsens
when ((substring(k.nr,2,5) = 'INFOD') AND (k.AUSSENST in ('Webinar', 'Online')) AND ( substring(k.kurzbez,14,2) = 'vi')) THEN 'VAVE000173' ---Controller-Infoveranstaltung-Online
when ((substring(k.nr,2,5) = 'INFOD') AND (k.AUSSENST in ('Video')) AND ( substring(k.kurzbez,1,2) = 'Co')) THEN 'VAVE000193' ---Controller-Infoveranstaltung-Video
when ((substring(k.nr,2,5) = 'INFOD') AND (k.AUSSENST in ('Online')) AND ( substring(k.kurzbez,12,2) = 'in')) THEN 'VAVE000174' ---Controller-Fernlehrgang-Infoveranstaltung-Online

when ((substring(k.nr,2,5) = 'INFOE') AND (k.AUSSENST not in ('Online-Infoveranstaltung', 'Video', 'Online'))) THEN 'VAVE000167' ---Bilanzbuchhalter-Infoveranstaltung-Präsens
when ((substring(k.nr,2,5) = 'INFOE') AND ( substring(k.kurzbez,18,2) = '-')) THEN 'VAVE000168' ---Bilanzbuchhalter-Infoveranstaltung-Online
when ((substring(k.nr,2,5) = 'INFOE') AND ( substring(k.kurzbez,34,1) = '-')) THEN 'VAVE000170' ---Bilanzbuchhalter-FL-Infoveranstaltung-Online
when ((substring(k.nr,2,5) = 'INFOE') AND ( substring(k.kurzbez,23,2) = 'Fö')) THEN 'VAVE000543' ---Bilanzbuchhalter-Fördermöglichkeiten-Infoveranstaltung
when ((substring(k.nr,2,5) = 'INFOE') AND ( substring(k.kurzbez,27,2) = 'zu')) THEN 'VAVE000544' ---Informationsveranstaltung-zu-den-Vorbereitungslehrgängen-auf-die-Bibuprüfug
when ((substring(k.nr,2,5) = 'INFOE') AND ( substring(k.kurzbez,1,2) = 'So')) THEN 'VAVE000195' ---So-funktioniert-der-Fernlehrgang-Bilanzbuchhalter

when ((substring(k.nr,2,5) = 'INFOF') AND (k.AUSSENST not in ('Video', 'Online', 'Webinar'))) THEN 'VAVE000188' ---Wirtschaftsfachwirt-Infoveranstaltung-Präsens
when ((substring(k.nr,2,5) = 'INFOF') AND (k.AUSSENST in ('Webinar','Online')) AND (substring(k.kurzbez,24,2) <> 'Fe')) THEN 'VAVE000189' ---Wirtschaftsfachwirt-Infoveranstaltung-Online
when ((substring(k.nr,2,5) = 'INFOF') AND (k.AUSSENST in ('Webinar','Online')) AND (substring(k.kurzbez,24,2) = 'Fe')) THEN 'VAVE000190' ---Wirtschaftsfachwirt-FL-Infoveranstaltung-Online
when ((substring(k.nr,2,5) = 'INFOF') AND (k.AUSSENST in ('Video')) AND (substring(k.nr,8,2) = 'FL')) THEN 'VAVE000200' ---So-funktioniert-der-Wirtschaftsfachwirt-Video
when ((substring(k.nr,2,5) = 'INFOF') AND (k.AUSSENST in ('Video')) AND (substring(k.nr,8,2) = 'A1')) THEN 'VAVE000191' ---Wirtschaftsfachwirt-FL-Infoveranstaltung-Video

when ((substring(k.nr,2,5) = 'INFOG')) THEN 'VAVE000545' ---Fachasisstent-DigitalisierungundIT-Infoveranstaltung-Online

when ((substring(k.nr,2,7) = 'INFOHVF')) THEN 'VAVE000196' ---So-funktioniert-der-Fernlehrgang-Bilanzhaltung-International

when ((substring(k.nr,2,5) = 'INFON')) THEN 'VAVE000176' ---Fachasisstent-Lohn-und-Gehaltbuchhaltung-Online

when ((substring(k.nr,2,2) = 'N2')) THEN 'VAVE000203' ---fachasisten-Lohn-und-Gehalt-Abendlehrgang-Online
when ((substring(k.nr,2,2) = 'N3')  AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000204' ---fachasisten-Lohn-und-Gehalt-Samstagslehrgang-Präsens
when ((substring(k.nr,2,2) = 'N3')  AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000205' ---fachasisten-Lohn-und-Gehalt-Samstagslehrgang-Online
when ((substring(k.nr,2,2) = 'N4')  AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000206' ---fachasisten-Klausurlehrgang-Präsens
when ((substring(k.nr,2,2) = 'N4')  AND (k.AUSSENST in ('Online-Kurs')) AND ( substring(k.nr,7,1) not in (1,2,3))) THEN 'VAVE000209' ---fachasisten-Klausurlehrgang-Hauptkurs-Online
when ((substring(k.nr,2,2) = 'N4')  AND (k.AUSSENST in ('Online-Kurs')) AND ( substring(k.nr,7,1) in (1))) THEN 'VAVE000210' ---fachasisten-Klausurlehrgang-Modul1-SV-Recht-Online
when ((substring(k.nr,2,2) = 'N4')  AND (k.AUSSENST in ('Online-Kurs')) AND ( substring(k.nr,7,1) in (2))) THEN 'VAVE000207' ---fachasisten-Klausurlehrgang-Modul2-Arbeitsrecht-Online
when ((substring(k.nr,2,2) = 'N4')  AND (k.AUSSENST in ('Online-Kurs')) AND ( substring(k.nr,7,1) in (3))) THEN 'VAVE000208' ---fachasisten-Klausurlehrgang-Modul3-Lohnsteuer-Online
when ((substring(k.nr,2,2) = 'N5')) THEN 'VAVE000211' ----Wiederholerlehrgang-Fachsasistent-Lohn-und-Gehalt
when ((substring(k.nr,2,2) = 'N6')  AND (k.AUSSENST not in ('Online-Kurs'))) THEN 'VAVE000212' ---fachasisten-Lohn-und-Gehalt-Mündlichevorbereitung-Präsens
when ((substring(k.nr,2,2) = 'N6')  AND (k.AUSSENST in ('Online-Kurs'))) THEN 'VAVE000546' ---fachasisten-Lohn-und-Gehalt-Mündlichevorbereitung-Online
when ((substring(k.nr,2,2) = 'N9')) THEN 'VAVE000213' ----FL-Fachsasistent-Lohn-und-Gehalt

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '01') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000424' ----Buchführung-Bilanzzierung-Grundlagenseminar-Präsenz
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '01') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000375' ----Buchführung-Bilanzzierung-Grundlagenseminar-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '02') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000277' ----Unternhemssteuer-leicht-gemacht-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '02') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000411' ----Unternhemssteuer-leicht-gemacht-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '03') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000261' ----Reise-und-Bewirtungskosten-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '03') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000398' ----Reise-und-Bewirtungskosten-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '04') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000271' ----Umsatzsteuer-Grundlagensemiar-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '04') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000405' ----Umsatzsteuer-Grundlagensemiar-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '05') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000244' ----Internationales-Steuerrecht-Grund-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '05') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000387' ----Internationales-Steuerrecht-Grund-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '06') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000238' ----Gemeinnützigkeitsrecht-Grundlagensem-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '06') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000383' ----Gemeinnützigkeitsrecht-Grundlagensem-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '07') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000288' ----Zoll-und-Ausenwirtschaftsrecht-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '08') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000258' ----Rechnungswesen-für-Ingen-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '09') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000216' ----Anlagen-und-Buchhaltnung-Grundlagensem-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '09') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000369' ----Anlagen-und-Buchhaltnung-Grundlagensem-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '10') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000257' ----Rechnungswesen-für-die-Assistenz-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '10') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000395' ----Rechnungswesen-für-die-Assistenz-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '11') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000259' ----Rechnugswesen-und-Controlling-für-Unternehmer-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '11') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000396' ----Rechnugswesen-und-Controlling-für-Unternehmer-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '12') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000227' ----Die-Einnahmenüberschussrechung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '12') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000377' ----Die-Einnahmenüberschussrechung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '21') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000233' ----E-Bilanz-aktuell-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '22') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000263' ----Risiken-und-Kontrollen-im-Rechnungswesen-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '23') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000240' ----Gemeinnützigkeitsrecht-Verein-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '27') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000260' ----Reise-und-Beweirtungskosten-aktuelle-Änderungen-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '27') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000397' ----Reise-und-Beweirtungskosten-aktuelle-Änderungen-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '28') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000254' ----Lohnsteuer-Sozialversicherung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '28') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000392' ----Lohnsteuer-Sozialversicherung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '30') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000265' ----Steuerlicheverrechnungspreise-Grundlagenseminar-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '30') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000400' ----Steuerlicheverrechnungspreise-Grundlagenseminar-Online

when ((substring(k.nr,2,2) = 'U5' ) and (k.nr not like '%B%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVE000359' ----Fachseminar für Fachberater für Internationales Steuerrecht-Webinar-Tag1
when ((substring(k.nr,2,2) = 'U5' ) and (k.nr like '%B%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVE000548' ----Fachseminar für Fachberater für Internationales Steuerrecht-Webinar-Tag2
when ((substring(k.nr,2,2) = 'U5' ) and (k.nr not like '%B%')  and (k.nr not like '%A%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVE000358' ----Fachseminar-für-Fachberater-für-Internationales-Steuerrecht-Tag1
when ((substring(k.nr,2,2) = 'U5' ) and (k.nr like '%B%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVE000557' ----Fachseminar-für-Fachberater-für-Internationales-Steuerrecht-Tag2
when ((substring(k.nr,2,2) = 'U5' ) and (k.nr like '%A%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVE000557' ----Fachseminar-für-Fachberater-für-Internationales-Steuerrecht-Tag2
when ((substring(k.nr,2,2) = 'U5')  and (substring(k.kurzbez,71,2) = 'II') AND (k.AUSSENST in ('Online', 'Webinar'))) THEN 'VAVE000548' ---Endriss-Update-Fachberater-Internationales-Steuerrecht-Termin2-Online

when ((substring(k.nr,2,2) = 'U7')  and (k.kurzbez  like '%Abo%')  AND (k.AUSSENST not in('Webinar','Online','Video'))) THEN 'VAVE000366' ----Endriss-Update-Abo-Bilanzbuchalter-HK-Präsenz
when ((substring(k.nr,2,2) = 'U7') and (k.kurzbez like '%I%') and (k.kurzbez not like '%Abo%') and (k.kurzbez not like '%II%') and (k.kurzbez not like '%III%') AND (k.AUSSENST not in('Webinar','Online','Video'))) THEN 'VAVE000360' ----Endriss-Update-Abo-Bilanzbuchalter-M1-Präsenz
when ((substring(k.nr,2,2) = 'U7') and (k.kurzbez like '%II%') and (k.kurzbez not like '%III%') AND (k.AUSSENST not in('Webinar','Online','Video'))) THEN 'VAVE000362' ----Endriss-Update-Abo-Bilanzbuchalter-M2-Präsenz
when ((substring(k.nr,2,2) = 'U7') and (k.kurzbez like '%III%') AND (k.AUSSENST not in('Webinar','Online','Video'))) THEN 'VAVE000364' ----Endriss-Update-Abo-Bilanzbuchalter-M3-Präsenz
when ((substring(k.nr,2,2) = 'U7')  and (substring(k.nr,7,1) not in ('1','2','3')) AND (k.AUSSENST in ('Online','Webinar'))) THEN 'VAVE000367' ---Endriss-Update-Abo-Bilanzbuchalter-Hk-Webinar
when ((substring(k.nr,2,2) = 'U7')  and (substring(k.nr,7,1) in ('1')) AND (k.AUSSENST in ('Online','Webinar'))) THEN 'VAVE000361' ----Endriss-Update-Abo-Bilanzbuchalter-M1-Webinar
when ((substring(k.nr,2,2) = 'U7')  and (substring(k.nr,7,1) in ('2')) AND (k.AUSSENST in ('Online','Webinar'))) THEN 'VAVE000363' ----Endriss-Update-Abo-Bilanzbuchalter-M2-Webinar
when ((substring(k.nr,2,2) = 'U7')  and (substring(k.nr,7,1) in ('3')) AND (k.AUSSENST in ('Online','Webinar'))) THEN 'VAVE000365' ----Endriss-Update-Abo-Bilanzbuchalter-M3-Webinar
when ((substring(k.nr,2,2) = 'U7')  and (substring(k.nr,7,1) in ('1'))AND (k.AUSSENST in ('Video'))) THEN 'VAVE000549' ----Endriss-Update-Abo-Bilanzbuchalter-M1-Video
when ((substring(k.nr,2,2) = 'U7')  and (substring(k.nr,7,1) in ('2'))AND (k.AUSSENST in ('Video'))) THEN 'VAVE000550' ----Endriss-Update-Abo-Bilanzbuchalter-M2-Video

when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%Abo%') AND (k.AUSSENST not in ('Online', 'Webinar','Video'))) THEN 'VAVE000431' ----Endriss-Update-Steuerberater-HK-Präsenz
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%I%') and (k.kurzbez not like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%') AND (k.AUSSENST not in ('Online', 'Webinar','Video'))) THEN 'VAVE000434' ----Endriss-Update-Steuerberater-Md1-Präsenz
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST not in ('Online', 'Webinar','Video'))) THEN 'VAVE000436' ----Endriss-Update-Steuerberater-Md2-Präsenz
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST not in ('Online', 'Webinar','Video'))) THEN 'VAVE000438' ----Endriss-Update-Steuerberater-Md3-Präsenz
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST not in ('Online', 'Webinar','Video'))) THEN 'VAVE000440' ----Endriss-Update-Steuerberater-Md4-Präsenz
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%I%') and (k.kurzbez not like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%') AND (k.AUSSENST in ('Online', 'Webinar'))) THEN 'VAVE000552' ----Endriss-Update-Steuerberater-Md1-Online
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST in ('Online', 'Webinar'))) THEN 'VAVE000553' ----Endriss-Update-Steuerberater-Md2-Online
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST in ('Online', 'Webinar'))) THEN 'VAVE000555' ----Endriss-Update-Steuerberater-Md4-Online
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%Seminar%') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000433' ----Endriss-Update-Steuerberater-HK-Video
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%I%') and (k.kurzbez not like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '% B%') and (k.kurzbez not like '%Abo%') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000435' ----Endriss-Update-Steuerberater-Md1-Video
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST in ('Video'))) THEN 'VAVE000437' ----Endriss-Update-Steuerberater-Md2-Video
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST in ('Video'))) THEN 'VAVE000439' ----Endriss-Update-Steuerberater-Md3-Video
when ((substring(k.nr,2,2) = 'U8') and (k.kurzbez like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST in ('Video'))) THEN 'VAVE000441' ----Endriss-Update-Steuerberater-Md4-Video
when ((substring(k.nr,2,2) = 'U8') and (k.nr like '%1A') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000442' ----Endriss-Update-Steuerberater-Mo1A-Video
when ((substring(k.nr,2,2) = 'U8') and (k.nr like '%1B') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000443' ----Endriss-Update-Steuerberater-Mo1B-Video
when ((substring(k.nr,2,2) = 'U8') and (k.nr like '%2A') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000444' ----Endriss-Update-Steuerberater-Mo2A-Video
when ((substring(k.nr,2,2) = 'U8') and (k.nr like '%2B') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000445' ----Endriss-Update-Steuerberater-Mo2B-Video
when ((substring(k.nr,2,2) = 'U8') and (k.nr like '%3A') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000446' ----Endriss-Update-Steuerberater-Mo3A-Video
when ((substring(k.nr,2,2) = 'U8') and (k.nr like '%3B') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000447' ----Endriss-Update-Steuerberater-Mo3B-Video
when ((substring(k.nr,2,2) = 'U8') and (k.nr like '%4A') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000448' ----Endriss-Update-Steuerberater-Mo4A-Video
when ((substring(k.nr,2,2) = 'U8') and (k.nr like '%4B') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000449' ----Endriss-Update-Steuerberater-Mo4B-Video

when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%Abo%') AND (k.AUSSENST not in ('Online', 'Webinar','Video'))) THEN 'VAVE000450' ----Endriss-Update-Steuerfachwirt-HK-Präsenz
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%I%') and (k.kurzbez not like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%') AND (k.AUSSENST not in ('Online', 'Webinar','Video'))) THEN 'VAVE000452' ----Endriss-Update-Steuerfachwirt-Md1-Präsenz
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST not in ('Online', 'Webinar','Video'))) THEN 'VAVE000454' ----Endriss-Update-Steuerfachwirt-Md2-Präsenz
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST not in ('Online', 'Webinar','Video'))) THEN 'VAVE000456' ----Endriss-Update-Steuerfachwirt-Md3-Präsenz
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST not in ('Online', 'Webinar','Video'))) THEN 'VAVE000458' ----Endriss-Update-Steuerfachwirt-Md4-Präsenz
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%I%') and (k.kurzbez not like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%') AND (k.AUSSENST in ('Online', 'Webinar'))) THEN 'VAVE000556' ----Endriss-Update-Steuerfachwirt-Md1-Online
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST in ('Online', 'Webinar'))) THEN 'VAVE000557' ----Endriss-Update-Steuerfachwirt-Md2-Online
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST in ('Online', 'Webinar'))) THEN 'VAVE000558' ----Endriss-Update-Steuerfachwirt-Md4-Online
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%Seminar%') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000451' ----Endriss-Update-Steuerfachwirt-HK-Video
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%I%') and (k.kurzbez like '%für%') and (k.kurzbez not like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '% B%') and (k.kurzbez not like '%Abo%') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000453' ----Endriss-Update-Steuerfachwirt-Md1-Video
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%II%') and (k.kurzbez not like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST in ('Video'))) THEN 'VAVE000455' ----Endriss-Update-Steuerfachwirt-Md2-Video
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%III%') and (k.kurzbez not like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST in ('Video'))) THEN 'VAVE000457' ----Endriss-Update-Steuerfachwirt-Md3-Video
when ((substring(k.nr,2,2) = 'U9') and (k.kurzbez like '%IV%') and (k.kurzbez not like '%Abo%')  AND (k.AUSSENST in ('Video'))) THEN 'VAVE000459' ----Endriss-Update-Steuerfachwirt-Md4-Video
when ((substring(k.nr,2,2) = 'U9') and (k.TITEL like '% Steuerfachwirte 1%') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000463' ----Endriss-Update-Steuerfachwirt-Md1b-Video
when ((substring(k.nr,2,2) = 'U9') and (k.TITEL like '%e 2%') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000460' ----Endriss-Update-Steuerfachwirt-Md2b-Video
when ((substring(k.nr,2,2) = 'U9') and (k.TITEL like '%3%') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000461' ----Endriss-Update-Steuerfachwirt-Md3b-Video
when ((substring(k.nr,2,2) = 'U9') and (k.TITEL like '% Update 4%') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000462' ----Endriss-Update-Steuerfachwirt-Md4b-Video

when ((substring(k.nr,2,2) = 'W5')) THEN 'VAVE000465' ----Wirtschaftsprüfer-Klausure-Technik
when ((substring(k.nr,2,2) = 'W4')) THEN 'VAVE000464' ----Wirtschaftsprüfer-Klausuren-Intensivlehrgang


when ((substring(k.nr,2,2) = 'XA') and (k.TITEL like 'Allgemeine Informationen zu den Grundlagenseminaren%')) THEN 'VAVE000467' ----AllgemeineInformationenzudenGrundlagenseminaren
when ((substring(k.nr,2,2) = 'XA') and (k.TITEL like 'Prüfungsvorbereitung Steuerfachangestellte%')) THEN 'VAVE000473' ----PrüfungsvorbereitungSteuerfachangestellte
when ((substring(k.nr,2,2) = 'XA') and (k.TITEL like 'Anlagenbuchhalter/in Ausbildung%')) THEN 'VAVE000468' ----AnlagenbuchhalterinAusbildung
when ((substring(k.nr,2,2) = 'XA') and (k.TITEL like 'Weiterbildung Debitoren-/Kreditorenbuchhalter/in%')) THEN 'VAVE000469' ----Weiterbildung Debitoren-Kreditorenbuchhalter
when ((substring(k.nr,2,2) = 'XA') and (k.TITEL like 'Lohn- und Gehaltsbuchhaltung Weiterbildung%')) THEN 'VAVE000472' ----Lohn-undGehaltsbuchhaltung Weiterbildung
when ((substring(k.nr,2,2) = 'XA') and (k.TITEL like 'Anforderungen von allgemeinen Informationen für%')) THEN 'VAVE000471' ----AnforderungenvonallgemeinenInformationenfür
when ((substring(k.nr,2,2) = 'XA') and (k.TITEL like 'Finanz%')) THEN 'VAVE000470' ----Finanzbuchhaltung Weiterbildung

when ((substring(k.nr,2,2) = 'XB') and (k.TITEL like 'Steuerberater/in Lehrgang%')) THEN 'VAVE000474' ----Steuerberater-in-Lehrgang

when ((substring(k.nr,2,2) = 'XC') and (k.TITEL like '%Steuerfachwirt/in Lehrgang (StBK)%')) THEN 'VAVE000475' ----Steuerfachwirt-in-Lehrgang (StBK)
when ((substring(k.nr,2,2) = 'XC') and (k.TITEL like '%Bachelor (Solo-Variante)%')) THEN 'VAVE000559' ----Bachelor-(Solo-Variante)
when ((substring(k.nr,2,2) = 'XC') and (k.TITEL like '%Bachelor inkl. Steuerfachwirt%')) THEN 'VAVE000560' ----Bachelor-inkl-Steuerfachwirt

when ((substring(k.nr,2,2) = 'XD')) THEN 'VAVE000476' ----Controller

when ((substring(k.nr,2,2) = 'XE') and (k.TITEL like '%Weiterbildung Bilanzbuchhalter/in (IHK)%')) THEN 'VAVE000477' ----Weiterbildung Bilanzbuchhalter-(IHK)

when ((substring(k.nr,2,2) = 'XF') and (k.TITEL like '%Wirtschafts%') and (k.TITEL not like '%Vorbereitung%')) THEN 'VAVE000479' ----Wirtschaftsfachwirt
when ((substring(k.nr,2,2) = 'XF') and (k.TITEL like '%Vorbereitung%')) THEN 'VAVE000480' ----Vorbereitung auf die Wirtschaftsfachwirt-Prüfung


when ((substring(k.nr,2,2) = 'XN') and (k.TITEL like '%Fachassistent/in Lohn und Gehalt%')) THEN 'VAVE000485' ----Fachassistent-Lohn-und-Gehalt

when ((substring(k.nr,2,2) = 'XS') and (k.TITEL not like '%Studiengänge%')) THEN 'VAVE000486' ----Interessentenverwaltung-Seminare

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '30') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000265' ----Steuerlicheverrechnungspreise-Grundlagenseminar-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '30') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000400' ----Steuerlicheverrechnungspreise-Grundlagenseminar-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '31') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000270' ----Umsatzstuer-und-Ändeurngen-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '31') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000404' ----Umsatzstuer-und-Ändeurngen-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '33') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000250' ----Konzernabschluss-nach-HGB-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '37') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000248' ----Jahresabschlüsse-Auswerten-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '37') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000390' ----Jahresabschlüsse-Auswerten-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '38') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000251' ----Kostenrechnung-Grundlagensem-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '39') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000256' ----Rechnungsstellung-und-vorsteuerabzug-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '39') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000394' ----Rechnungsstellung-und-vorsteuerabzug-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '40') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000237' ----Geldwerte-Vorteile-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '40') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000382' ----Geldwerte-Vorteile-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '42') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000217' ----Anlagevermögen-Bilanzierung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '42') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000370' ----Anlagevermögen-Bilanzierung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '43') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000249' ----Kassenführung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '43') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000391' ----Kassenführung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '44') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000266' ----Steuericherechnungspreise-Vertiefung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '44') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000401' ----Steuericherechnungspreise-Vertiefung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '46') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000228' ----Gemeinnützige-GmBh-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '46') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000378' ----Gemeinnützige-GmbH-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '47') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000234' ----E-Bilan-für-Steuerbegünztigte-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '53') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000247' ----Jahresabschluss-nach-Handels-und-Steuerrecht-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '53') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000389' ----Jahresabschluss-nach-Handels-und-Steuerrecht-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '54') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000255' ----Personengesellschaften-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '54') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000393' ----Personengesellschaften-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '55') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000267' ----Steuern-und-Bilanzierung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '55') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000402' ----Steuern-und-Bilanzierung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '56') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000220' ----Besterung-von-Köperschaften-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '56') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000372' ----Besterung-von-Köperschaften-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '59') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000222' ----Betriebsstätten-Gewinnaufteilung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '59') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000373' ----Betriebsstätten-Gewinnaufteilung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '60') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000239' ----Gemeinnütigkeitsrecht-akt-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '61') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000275' ----Umsatzstuer-in-derAusenprüfung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '61') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000409' ----Umsatzstuer-in-derAusenprüfung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '62') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000225' ----Buchführung-und-Rechnungslegung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '62') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000376' ----Buchführung-und-Rechnungslegung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '63') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000272' ----Umsatzsteuer-International-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '63') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000406' ----Umsatzsteuer-International-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '65') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000241' ----GOBD-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '65') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000384' ----GOBD-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '66') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000219' ----Besterung-von-Einkünften-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '66') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000371' ----Besterung-von-Einkünften-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '68') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000215' ----Abgabenordnung-Grundlagenseminar-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '68') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000368' ----Abgabenordnung-Grundlagenseminar-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '69') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000243' ----Grundöagen-zur-Immobilienbesteuerung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '69') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000386' ----Grundöagen-zur-Immobilienbesteuerung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '71') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000223' ----Buchführung-anspruchsvolle-Buchungssätze-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '71') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000374' ----Buchführung-anspruchsvolle-Buchungssätze-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '77') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000268' ----Stiftungen-als-Gestaltungvehikel-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '79') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000236' ----Vorderungsmanagment-Grundlagen-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '79') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000381' ----Vorderungsmanagment-Grundlagen-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '80') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000269' ----Taxcompliance-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '80') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000403' ----Taxcompliance-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '81') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000281' ----Vorbereitung-des-Handelsrechtlichen-Jahresabschluss-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '81') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000412' ----Vorbereitung-des-Handelsrechtlichen-Jahresabschluss-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '82') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000273' ----Umsatzstuer-Reingeschäfte-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '82') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000407' ----Umsatzstuer-Reingeschäfte-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '83') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000230' ----Digitale-Rechnung-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '83') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000379' ----Digitale-Rechnung-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '84') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000231' ----Digitalisierung-in-Stuern-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '84') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000380' ----Digitalisierung-in-Stuern-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '85') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000276' ----Umsatzsteuer-und-Zoll-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '85') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000410' ----Umsatzsteuer-und-Zoll-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '86') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000221' ----Betriebsrechentenstärkungs-Gesetz-Prä

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '87') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000262' ----Reversed-charge-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '87') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000399' ----Reversed-charge-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '88') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000246' ----Investment-Steuergesetz-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '88') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000388' ----Investment-Steuergesetz-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '96') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000287' ----Zertifizierte-Umsatzsteuer-Experte-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '97') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000285' ----Zertifiziete-Endgeldabrechner-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '98') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000286' ----Zertifizierter-Expterte-im-Gemeinnützigkeitsrecht-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'A1') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000283' ----Wertpapier-und-wertanlagen-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'A1') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000414' ----Wertpapier-und-wertanlagen-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'A4') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000264' ----Senkung-der-Umsatzsteuer-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'A5') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000408' ----Umsatzstuer-akt-Quickfixes-Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'A7') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000242' ----Grundlagen-der-Körperschäftlichen-Organsschaft-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'A7') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000385' ----Grundlagen-der-Körperschäftlichen-Organsschaft-Online
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'A8') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000413' ----Vorsteuerabzug-ohne-prdnungsgemäße-Rechnung-Online
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'A9') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000235' ----Online

when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'B1') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000561' ----Online
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'B2') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000562' ----Online
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'B4') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000563' ----Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'B4') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000564' ----Online
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'B5') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000565' ----Online
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'B6') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000566' ----Online
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'B7') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000567' ----Online
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = 'B8') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000568' ----Online


when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '02') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000290' ----Prä
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '02') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000415' ----Online
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '05') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000289' ----Prä
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '06') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000293' ----Prä
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '06') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000417' ----Online
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '07') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000292' ----Prä
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '07') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000416' ----Online
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '08') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000296' ----Prä
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '08') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000419' ----Online
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '10') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000294' ----Prä
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '10') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000418' ----Online
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '11') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000291' ----Online
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '12') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000295' ----Prä
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '13') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000325' ----Prä
when ((substring(k.nr,2,2) = 'PB' ) and(substring(k.nr,6,2) = '13') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000570' ----Online

when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '03') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000307' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '04') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000303' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '05') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000299' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '09') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000298' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '11') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000300' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '11') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000420' ----Online
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '12') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000306' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '14') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000297' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '19') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000310' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '19') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000573' ----Online
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '21') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000309' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '21') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000424' ----Online
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '22') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000574' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '22') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000575' ----Online
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '23') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000305' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '23') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000576' ----Online
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '25') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000421' ----Online
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '27') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000577' ----Online
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '28') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000578' ----Online
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '29') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000308' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '29') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000423' ----Online
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '32') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000304' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '32') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000422' ----Online
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '74') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000311' ----Prä
when ((substring(k.nr,2,2) = 'PD' ) and(substring(k.nr,6,2) = '74') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000425' ----Online

when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '01') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000321' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '01') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000430' ----Online
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '02') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000313' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '02') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000427' ----Online
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '03') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000317' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '04') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000315' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '04') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000428' ----Online
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '08') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000320' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '09') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000314' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '10') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000316' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '12') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000318' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '15') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000305' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '16') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000312' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '16') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000426' ----Online
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '18') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000319' ----Prä
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '18') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000429' ----Online
when ((substring(k.nr,2,2) = 'PE' ) and(substring(k.nr,6,2) = '19') and(substring(k.nr,4,2) <> 'BU') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000579' ----Online

when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '01') AND (k.aussenst in ('Video'))) THEN 'VAVE000330' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '02') AND (k.aussenst in ('Video'))) THEN 'VAVE000335' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '03') AND (k.aussenst in ('Video'))) THEN 'VAVE000355' ----Video
when ((substring(k.nr,1,3) = 'SPW' ) and(substring(k.nr,6,2) = '04') AND (k.aussenst in ('Video'))) THEN 'VAVE000343' ----Video
when ((substring(k.nr,1,3) = 'UPW' ) and(substring(k.nr,6,2) = '04') AND (k.aussenst in ('Video'))) THEN 'VAVE000342' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '05') AND (k.aussenst in ('Video'))) THEN 'VAVE000324' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '06') AND (k.aussenst in ('Video'))) THEN 'VAVE000328' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '07') AND (k.aussenst in ('Video'))) THEN 'VAVE000348' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '08') AND (k.aussenst in ('Video'))) THEN 'VAVE000357' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '09') AND (k.aussenst in ('Video'))) THEN 'VAVE000351' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '10') AND (k.aussenst in ('Video'))) THEN 'VAVE000352' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '11') AND (k.aussenst in ('Video'))) THEN 'VAVE000338' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '12') AND (k.aussenst in ('Video'))) THEN 'VAVE000329' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '13') AND (k.aussenst in ('Video'))) THEN 'VAVE000347' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '14') AND (k.aussenst in ('Video'))) THEN 'VAVE000331' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '15') AND (k.aussenst in ('Video'))) THEN 'VAVE000323' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '16') AND (k.aussenst in ('Video'))) THEN 'VAVE000350' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '17') AND (k.aussenst in ('Video'))) THEN 'VAVE000336' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '18') AND (k.aussenst in ('Video'))) THEN 'VAVE000337' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '19') AND (k.aussenst in ('Video'))) THEN 'VAVE000334' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '20') AND (k.aussenst in ('Video'))) THEN 'VAVE000345' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '21') AND (k.aussenst in ('Video'))) THEN 'VAVE000356' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '22') AND (k.aussenst in ('Video'))) THEN 'VAVE000339' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '23') AND (k.aussenst in ('Video'))) THEN 'VAVE000341' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '24') AND (k.aussenst in ('Video'))) THEN 'VAVE000344' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '25') AND (k.aussenst in ('Video'))) THEN 'VAVE000322' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '26') AND (k.aussenst in ('Video'))) THEN 'VAVE000327' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '27') AND (k.aussenst in ('Video'))) THEN 'VAVE000349' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '28') AND (k.aussenst in ('Video'))) THEN 'VAVE000326' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '29') AND (k.aussenst in ('Video'))) THEN 'VAVE000340' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '31') AND (k.aussenst in ('Video'))) THEN 'VAVE000354' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '32') AND (k.aussenst in ('Video'))) THEN 'VAVE000346' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '33') AND (k.aussenst in ('Video'))) THEN 'VAVE000332' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '34') AND (k.aussenst in ('Video'))) THEN 'VAVE000333' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '35') AND (k.aussenst in ('Video'))) THEN 'VAVE000353' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '36') AND (k.aussenst in ('Video'))) THEN 'VAVE000491' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '38') AND (k.aussenst in ('Video'))) THEN 'VAVE000580' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '40') AND (k.aussenst in ('Video'))) THEN 'VAVE000581' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '41') AND (k.aussenst in ('Video'))) THEN 'VAVE000582' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '42') AND (k.aussenst in ('Video'))) THEN 'VAVE000583' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '43') AND (k.aussenst in ('Video'))) THEN 'VAVE000584' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '44') AND (k.aussenst in ('Video'))) THEN 'VAVE000585' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '45') AND (k.aussenst in ('Video'))) THEN 'VAVE000586' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '46') AND (k.aussenst in ('Video'))) THEN 'VAVE000587' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '47') AND (k.aussenst in ('Video'))) THEN 'VAVE000588' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '48') AND (k.aussenst in ('Video'))) THEN 'VAVE000589' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '49') AND (k.aussenst in ('Video'))) THEN 'VAVE000590' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '50') AND (k.aussenst in ('Video'))) THEN 'VAVE000591' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '51') AND (k.aussenst in ('Video'))) THEN 'VAVE000592' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '52') AND (k.aussenst in ('Video'))) THEN 'VAVE000593' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '53') AND (k.aussenst in ('Video'))) THEN 'VAVE000594' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '54') AND (k.aussenst in ('Video'))) THEN 'VAVE000595' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '55') AND (k.aussenst in ('Video'))) THEN 'VAVE000596' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '56') AND (k.aussenst in ('Video'))) THEN 'VAVE000597' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '57') AND (k.aussenst in ('Video'))) THEN 'VAVE000598' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '58') AND (k.aussenst in ('Video'))) THEN 'VAVE000599' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '59') AND (k.aussenst in ('Video'))) THEN 'VAVE000600' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '60') AND (k.aussenst in ('Video'))) THEN 'VAVE000601' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '61') AND (k.aussenst in ('Video'))) THEN 'VAVE000602' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '62') AND (k.aussenst in ('Video'))) THEN 'VAVE000603' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '63') AND (k.aussenst in ('Video'))) THEN 'VAVE000604' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '64') AND (k.aussenst in ('Video'))) THEN 'VAVE000605' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '65') AND (k.aussenst in ('Video'))) THEN 'VAVE000606' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '66') AND (k.aussenst in ('Video'))) THEN 'VAVE000607' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '67') AND (k.aussenst in ('Video'))) THEN 'VAVE000608' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '68') AND (k.aussenst in ('Video'))) THEN 'VAVE000609' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '69') AND (k.aussenst in ('Video'))) THEN 'VAVE000610' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '70') AND (k.aussenst in ('Video'))) THEN 'VAVE000611' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '71') AND (k.aussenst in ('Video'))) THEN 'VAVE000612' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '72') AND (k.aussenst in ('Video'))) THEN 'VAVE000613' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '73') AND (k.aussenst in ('Video'))) THEN 'VAVE000614' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '74') AND (k.aussenst in ('Video'))) THEN 'VAVE000615' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '75') AND (k.aussenst in ('Video'))) THEN 'VAVE000616' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '76') AND (k.aussenst in ('Video'))) THEN 'VAVE000617' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '77') AND (k.aussenst in ('Video'))) THEN 'VAVE000618' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '78') AND (k.aussenst in ('Video'))) THEN 'VAVE000619' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '79') AND (k.aussenst in ('Video'))) THEN 'VAVE000620' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '80') AND (k.aussenst in ('Video'))) THEN 'VAVE000621' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '81') AND (k.aussenst in ('Video'))) THEN 'VAVE000622' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '82') AND (k.aussenst in ('Video'))) THEN 'VAVE000623' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '83') AND (k.aussenst in ('Video'))) THEN 'VAVE000624' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '84') AND (k.aussenst in ('Video'))) THEN 'VAVE000625' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '85') AND (k.aussenst in ('Video'))) THEN 'VAVE000626' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '86') AND (k.aussenst in ('Video'))) THEN 'VAVE000627' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '87') AND (k.aussenst in ('Video'))) THEN 'VAVE000628' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '88') AND (k.aussenst in ('Video'))) THEN 'VAVE000629' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '89') AND (k.aussenst in ('Video'))) THEN 'VAVE000630' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '90') AND (k.aussenst in ('Video'))) THEN 'VAVE000631' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '91') AND (k.aussenst in ('Video'))) THEN 'VAVE000632' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '92') AND (k.aussenst in ('Video'))) THEN 'VAVE000633' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '93') AND (k.aussenst in ('Video'))) THEN 'VAVE000634' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '94') AND (k.aussenst in ('Video'))) THEN 'VAVE000635' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '95') AND (k.aussenst in ('Video'))) THEN 'VAVE000636' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '96') AND (k.aussenst in ('Video'))) THEN 'VAVE000637' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '97') AND (k.aussenst in ('Video'))) THEN 'VAVE000638' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '98') AND (k.aussenst in ('Video'))) THEN 'VAVE000639' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = '99') AND (k.aussenst in ('Video'))) THEN 'VAVE000640' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'A1') AND (k.aussenst in ('Video'))) THEN 'VAVE000641' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'A2') AND (k.aussenst in ('Video'))) THEN 'VAVE000642' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'A3') AND (k.aussenst in ('Video'))) THEN 'VAVE000643' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'A4') AND (k.aussenst in ('Video'))) THEN 'VAVE000644' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'A5') AND (k.aussenst in ('Video'))) THEN 'VAVE000645' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'A6') AND (k.aussenst in ('Video'))) THEN 'VAVE000646' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'A7') AND (k.aussenst in ('Video'))) THEN 'VAVE000647' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'A8') AND (k.aussenst in ('Video'))) THEN 'VAVE000648' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'A9') AND (k.aussenst in ('Video'))) THEN 'VAVE000649' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'B1') AND (k.aussenst in ('Video'))) THEN 'VAVE000650' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'B2') AND (k.aussenst in ('Video'))) THEN 'VAVE000651' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'B3') AND (k.aussenst in ('Video'))) THEN 'VAVE000652' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'B4') AND (k.aussenst in ('Video'))) THEN 'VAVE000653' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'B5') AND (k.aussenst in ('Video'))) THEN 'VAVE000654' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'B6') AND (k.aussenst in ('Video'))) THEN 'VAVE000655' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'B7') AND (k.aussenst in ('Video'))) THEN 'VAVE000656' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'B8') AND (k.aussenst in ('Video'))) THEN 'VAVE000657' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'B9') AND (k.aussenst in ('Video'))) THEN 'VAVE000658' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'C1') AND (k.aussenst in ('Video'))) THEN 'VAVE000659' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'C2') AND (k.aussenst in ('Video'))) THEN 'VAVE000660' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'C3') AND (k.aussenst in ('Video'))) THEN 'VAVE000661' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'C4') AND (k.aussenst in ('Video'))) THEN 'VAVE000662' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'C5') AND (k.aussenst in ('Video'))) THEN 'VAVE000663' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'C6') AND (k.aussenst in ('Video'))) THEN 'VAVE000664' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'C7') AND (k.aussenst in ('Video'))) THEN 'VAVE000665' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'C8') AND (k.aussenst in ('Video'))) THEN 'VAVE000666' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'C9') AND (k.aussenst in ('Video'))) THEN 'VAVE000667' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'D1') AND (k.aussenst in ('Video'))) THEN 'VAVE000668' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'D2') AND (k.aussenst in ('Video'))) THEN 'VAVE000669' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'D3') AND (k.aussenst in ('Video'))) THEN 'VAVE000670' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'D4') AND (k.aussenst in ('Video'))) THEN 'VAVE000671' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'D5') AND (k.aussenst in ('Video'))) THEN 'VAVE000672' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'D6') AND (k.aussenst in ('Video'))) THEN 'VAVE000673' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'D7') AND (k.aussenst in ('Video'))) THEN 'VAVE000674' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'D8') AND (k.aussenst in ('Video'))) THEN 'VAVE000675' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'D9') AND (k.aussenst in ('Video'))) THEN 'VAVE000676' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'E1') AND (k.aussenst in ('Video'))) THEN 'VAVE000677' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'E2') AND (k.aussenst in ('Video'))) THEN 'VAVE000678' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'E3') AND (k.aussenst in ('Video'))) THEN 'VAVE000679' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'E4') AND (k.aussenst in ('Video'))) THEN 'VAVE000680' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'E5') AND (k.aussenst in ('Video'))) THEN 'VAVE000681' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'E6') AND (k.aussenst in ('Video'))) THEN 'VAVE000682' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'E7') AND (k.aussenst in ('Video'))) THEN 'VAVE000683' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'E8') AND (k.aussenst in ('Video'))) THEN 'VAVE000684' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'E9') AND (k.aussenst in ('Video'))) THEN 'VAVE000685' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'F1') AND (k.aussenst in ('Video'))) THEN 'VAVE000686' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'F2') AND (k.aussenst in ('Video'))) THEN 'VAVE000687' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'F3') AND (k.aussenst in ('Video'))) THEN 'VAVE000688' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'F4') AND (k.aussenst in ('Video'))) THEN 'VAVE000689' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'F5') AND (k.aussenst in ('Video'))) THEN 'VAVE000690' ----Video
when ((substring(k.nr,2,2) = 'PW' ) and(substring(k.nr,6,2) = 'F6') AND (k.aussenst in ('Video'))) THEN 'VAVE000691' ----Video
when ((substring(k.nr,2,8) = 'PWONABO2' ) AND (k.aussenst in ('Video'))) THEN 'VAVE000693' ----Video
when ((substring(k.nr,2,8) = 'PWONABO3' ) AND (k.aussenst in ('Video'))) THEN 'VAVE000694' ----Video
when ((substring(k.nr,2,8) = 'PWONABOT' ) AND (k.aussenst in ('Video'))) THEN 'VAVE000695' ----Video

when ((k.nr like '%INHSFS%')) THEN 'VAVE000165' ---Inhouse

when ((substring(k.nr,2,2) = 'EP' )) THEN 'VAVE000542' ----Bilanzbuchhalter-Prüfung
when ((substring(k.nr,2,7) = 'INFOEVA' )) THEN 'VAVE000192' ----Bilanzbuchhalter-Infoveranstaltung-Aufzeichnung
when ((substring(k.nr,1,8) = 'TINFOHON' )) THEN 'VAVE000171' ----Bilanzbuchhalter-FL-Infoveranstaltung
when ((substring(k.nr,2,4) = 'D2ON' and  (k.KURZBEZ like '%Controller Online-Abendlehrgang') AND (k.aussenst in ('Online-Kurs')))) THEN 'VAVE000022' ----Controller-Online-Abendlehrgang-HK
when ((substring(k.nr,2,4) = 'D2ON' and  (k.KURZBEZ like '%Controller Online-Abendlehrgang: Modul I (Kostenrechnung und -management)%') AND (k.aussenst in ('Online-Kurs')))) THEN 'VAVE000024' ----Controller-Online-Abendlehrgang-Modul1
when ((substring(k.nr,2,4) = 'D2ON' and  (k.KURZBEZ like '%Controller Online-Abendlehrgang: Modul II (Unternehmensplanung und Budgetierung)%') AND (k.aussenst in ('Online-Kurs')))) THEN 'VAVE000027' ----Controller-Online-Abendlehrgang-Modul2
when ((substring(k.nr,2,4) = 'D2ON' and  (k.KURZBEZ like '%Controller Online-Abendlehrgang: Modul III (Jahresabschlussanalyse)%') AND (k.aussenst in ('Online-Kurs')))) THEN 'VAVE000148' ----Controller-Online-Abendlehrgang-Modul3
when ((substring(k.nr,2,4) = 'D2ON' and  (k.KURZBEZ like '%Controller Online-Abendlehrgang: Modul IV (Berichtswesen)%') AND (k.aussenst in ('Online-Kurs')))) THEN 'VAVE000466' ----Controller-Online-Abendlehrgang-Modul4

when ((substring(k.nr,2,4) = 'D1ON' and  (k.KURZBEZ like '%Controller Online-Tageslehrgang (Vollzeit)') AND (k.aussenst in ('Online-Kurs')))) THEN 'VAVE000482' ----Controller-Tageslehtgang-Online-Abendlehrgang-HK
when ((substring(k.nr,2,4) = 'D1ON' and  (k.KURZBEZ like '%Controller Online-Tageslehrgang: Modul I (Kostenrechnung und -management)%') AND (k.aussenst in ('Online-Kurs')))) THEN 'VAVE000483' ----Controller-Tageslehtgang--Online-Abendlehrgang-Modul1
when ((substring(k.nr,2,4) = 'D1ON' and  (k.KURZBEZ like '%Controller Online-Tageslehrgang: Modul II (Unternehmensplanung und Budgetierung)%') AND (k.aussenst in ('Online-Kurs')))) THEN 'VAVE000484' ----Controller-Tageslehtgang--Online-Abendlehrgang-Modul2
when ((substring(k.nr,2,4) = 'D1ON' and  (k.KURZBEZ like '%Controller Online-Tageslehrgang: Modul III (Jahresabschlussanalyse)%') AND (k.aussenst in ('Online-Kurs')))) THEN 'VAVE000487' ----Controller-Tageslehtgang--Online-Abendlehrgang-Modul3
when ((substring(k.nr,2,4) = 'D1ON' and  (k.KURZBEZ like '%Controller Online-Tageslehrgang: Modul IV (Berichtswesen)%') AND (k.aussenst in ('Online-Kurs')))) THEN 'VAVE000522' ----Controller-Tageslehtgang--Online-Abendlehrgang-Modul4

when ((substring(k.nr,2,2) = 'P2'  AND (k.aussenst not in ('Webinar')))) THEN 'VAVE000214' ----Das-Praktikerseminar-Fachkongress-Präsens
when ((substring(k.nr,2,2) = 'P2'  AND (k.aussenst in ('Webinar')))) THEN 'VAVE000523' ----Das-Praktikerseminar-Fachkongress-Online

when ((substring(k.nr,2,6) = 'PALS17')) THEN 'VAVE000551' ----Richtege-Eingruppierung-nach-12-TVöD


when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '73') AND (k.aussenst not in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000253' ----Leiter-Rechnungswesen-Prä
when ((substring(k.nr,2,2) = 'PA' ) and(substring(k.nr,6,2) = '73') AND (k.aussenst in ('Webinar','Online','Online-Kurs','online'))) THEN 'VAVE000254' ----Leiter-Rechnungswesen-Onl

when ((substring(k.nr,2,4) = 'A3VA') AND (k.AUSSENST in ('Video'))) THEN 'VAVE000018' ---LGB Video 

when ((substring(k.nr,2,2) = 'PA') AND (substring(k.nr,6,2)) = '99') THEN 'VAVE000284' ---Zertifizierter-Bilanzieungsexperte

when ((k.nr like '%BROSCH%')) THEN 'VAVA000001' ---Broschüre

when ((k.nr like 'CR%')) THEN 'VAVA000002' ---Refresher-Prä
when ((substring(k.nr,1,1) = 'L' ) and (k.TITEL like '%Refresher%')) THEN 'VAVA000027' ---Refresher-Online

when ((substring(k.nr,1,1) = 'L' ) and (substring(k.kurzbez,7,3) = 'Eng' )) THEN 'VAVA000004' ---CINA-ENglisch **/

when ((k.kurzbez like '%CINA® Konsolid%') and (k.TITEL not like '%CINA® Konsolidierung-Konsolidierung Basiswissen 1. Pflichtseminar%') and (k.TITEL not like '%2. Pflichtseminar%') 
and (k.TITEL not like '%3. Pflichtseminar%') and (k.TITEL not like '%Impairment oder Konsolidierung Excel%')) THEN 'VAVA000005' ---CINA-Konso-Hauptkurs
when ((k.TITEL like '%CINA® Konsolidierung-Konsolidierung Basiswissen 1. Pflichtseminar%')) THEN 'VAVA000006' ---CINA-Konso-1Wahlfach
when ((k.TITEL like '%CINA® Konsolidierung-Konzernrechnungslegung 2. Pflichtseminar%')) THEN 'VAVA000007' ---CINA-Konso-2Wahlfach
when ((k.TITEL like '%3. Pflichtseminar%')) THEN 'VAVA000008' ---CINA-Konso-3Wahlfach
when ((k.TITEL like '%Impairment oder Konsolidierung Excel%')) THEN 'VAVA000009' ---CINA-Konso-4Wahlfach

when ((k.kurzbez like 'IFRS Basiswissen%') AND (k.aussenst not in ('Webinar'))) THEN 'VAVA000010' ---IFRS Basiswissen-Prä
when ((k.kurzbez like 'Ausfall: IFRS Basiswissen%') AND (k.aussenst not in ('Webinar'))) THEN 'VAVA000010' ---Ausfall:IFRS Basiswissen-Prä
when ((k.kurzbez like 'IFRS Basiswissen%') AND (k.aussenst in ('Webinar'))) THEN 'VAVA000012' ---IFRS Basiswissen-Onli
when ((k.kurzbez like 'Ausfall: IFRS Basiswissen%') AND (k.aussenst in ('Webinar'))) THEN 'VAVA000012' ---Ausfall:IFRS Basiswissen-Onli

when ((k.kurzbez like '%Konsolidierung Excel-Anwenderseminar%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000011' ---Excel-Anwenderseminar-Prä
when ((k.kurzbez like '%Konsolidierung Excel-Anwenderseminar%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000038' ---Excel-Anwenderseminar-Onli

when ((substring(k.kurzbez,1,14) = 'Konsolidierung') and (k.kurzbez not like 'Konsolidierung Excel-Anwenderseminar%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000013' ---Konsolidierung Excel-Anwenderseminar-Present
when ((substring(k.kurzbez,1,23) = 'Ausfall: Konsolidierung') and (k.kurzbez not like 'Ausfall: Konsolidierung Excel-Anwenderseminar%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000013' ---Ausfall:Konsolidierung Excel-Anwenderseminar-Present
when ((substring(k.kurzbez,1,14) = 'Konsolidierung') and (k.kurzbez not like 'Konsolidierung Excel-Anwenderseminar%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000063' ---Konsolidierung Excel-Anwenderseminar-Present
when ((substring(k.kurzbez,1,23) = 'Ausfall: Konsolidierung') and (k.kurzbez not like 'Ausfall: Konsolidierung Excel-Anwenderseminar%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000063' ---Ausfall:Konsolidierung Excel-Anwenderseminar-Present

when ((k.kurzbez like '%IFRS für Controller%')) THEN 'VAVA000014' ---IFRS für Controller

when ((k.nr like '%INHAIR%')) THEN 'VAVA000015' ---Inhouse

when ((k.kurzbez like '%IFRS Kom%') and (k.nr not like '%INHAIR%') and (k.kurzbez not like '%BayWa r.e. renewable energy GmbH, IFRS kompakt, 4-tägig%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000016' ---IFRSKompakt-Prä
when ((k.kurzbez like '%IFRS Kom%') and (k.nr not like '%INHAIR%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000064' ---IFRSKompakt-onlin

when ((k.kurzbez like '%Pensions%') and (k.nr not like '%INHAIR%')) THEN 'VAVA000017' ---Inhouse

when ((k.nr not like '%INHAIR%') and (k.kurzbez like '%CINA®  Specialist%') and (k.kurzbez not like '%CINA®  Specialist - 1. Pflichtseminar CINA® REFRESHER%') 
and (k.kurzbez not like '%CINA®  Specialist - 1. Wahlseminar%') and (k.kurzbez not like '%CINA®  Specialist - 2. Wahlseminar%')) THEN 'VAVA000018' ---CINASpec-Haupt
when ((k.kurzbez like '%CINA®  Specialist - 1. Pflichtseminar CINA® REFRESHER%')) THEN 'VAVA000048' ---CINASpec-1Pflichtsem
when ((k.kurzbez like '%CINA®  Specialist - 1. Wahlseminar%')) THEN 'VAVA000020' ---CINA®  Specialist-1Wahlseminar
when ((k.kurzbez like '%CINA®  Specialist - 2. Wahlseminar%')) THEN 'VAVA000021' ---CINA®  Specialist-2Wahlseminar

when ((k.nr not like '%INHAIR%') and (k.kurzbez like '%US-GAAP Kompakt%') and (k.kurzbez not like '%US-GAAP kompakt - 1. Wahlseminar%') and (k.kurzbez not like '%US-GAAP kompakt - 1. Pflichtseminar%') 
and (k.kurzbez not like '%Nypro Healthcare GmbH, US-GAAP kompakt, 1-tägig%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000019' ---US-GAAP-Prä
when ((k.nr not like '%INHAIR%') and (k.kurzbez like '%US-GAAP Kompakt%') and (k.kurzbez not like '%US-GAAP kompakt - 1. Wahlseminar%') and (k.kurzbez not like '%US-GAAP kompakt - 1. Pflichtseminar%') 
and (k.kurzbez not like '%Nypro Healthcare GmbH, US-GAAP kompakt, 1-tägig%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000039' ---US-GAAP-Onl

when ((k.nr not like '%INHAIR%') and (k.kurzbez like '%US-GAAP Update%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000022' ---US-GAAP-Update-Prä
when ((k.nr not like '%INHAIR%') and (k.kurzbez like '%US-GAAP Update%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000040' ---US-GAAP Update-Onlin

when ((k.nr not like '%INHAIR%') and (k.kurzbez like '%US-GAAP für Führungs%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000023' ---US-GAAP-Führugskräfte-Prä
when ((k.nr not like '%INHAIR%') and (k.kurzbez like '%US-GAAP für Führungs%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000041' ---US-GAAP-Führugskräfte-Onlin

when ((k.nr not like '%INHAIR%') and (k.kurzbez like '%US-GAAP Specialist%') and (k.kurzbez not like '%1. Pflichtseminar%') and (k.kurzbez not like '%2. Pflichtseminar%')) THEN 'VAVA000024' ---US-GAAP-Spec

when ((k.nr not like '%INHAIR%') and (k.kurzbez like '%IFRS Update%') and (k.kurzbez not like '%Basler AG- IFRS UPdate und Praxistraining, 1-tägig%') 
and (k.kurzbez not like '%IFRS UPDATE: Aktuelle Trends und Änderungen der IFRS%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000028' ---IFRSUpdate-Prä
when ((k.nr not like '%INHAIR%') and (k.kurzbez like '%IFRS Update%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000056' ---IFRSUpdate-Onlin

when ((k.nr not like '%INH%') and (k.kurzbez like '%IFRS bei Banken%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000050' ---IFRS bei Banken-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%IFRS bei Banken%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000057' ---IFRS bei Banken-Onlin

when ((k.nr not like '%INH%') and (k.kurzbez like '%IFRS bei Versicherungen%') and (k.kurzbez not like '%IFRS bei Versicherungen: Bilanzierung%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000029' ---IFRS bei Versicheurng-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%IFRS bei Versicherungen%') and (k.kurzbez not like '%IFRS bei Versicherungen: Bilanzierung%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000065' ---IFRS bei Banken-Onlin

when ((k.nr not like '%INH%') and (k.kurzbez like '%IFRS bei Versicherungen: Bilanzierung%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000030' ---IFRS bei Versicheurng-Bilanz-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%IFRS bei Versicherungen: Bilanzierung%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000066' ---IFRS bei Banken-Bilanz-Onlin

when ((k.nr not like '%INH%') and (k.kurzbez like '%Konzernrechnungslegung%') and (k.kurzbez not like '%CINA® Konsolidierung%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000031' ---Konzernrechnungslegung-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%Konzernrechnungslegung%') and (k.kurzbez not like '%CINA® Konsolidierung%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000067' ---Konzernrechnungslegung-Onlin

when ((k.kurzbez like '%allokation%') and (k.kurzbez not like '%CINA%') and (k.nr not like '%IN%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000032' ---Kaufpreisalo-Prä
when ((k.kurzbez like '%allokation%') and (k.kurzbez not like '%CINA%') and (k.nr not like '%IN%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000068' ---Kaufpreisalo-On

when ((k.nr not like '%INH%') and (k.kurzbez like '%Impairment%') and (k.kurzbez not like '%CINA® Konsolidierung%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000033' ---Impairment-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%Impairment%') and (k.kurzbez not like '%CINA® Konsolidierung%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000069' ---Impairment--Onlin

when ((k.nr not like '%INH%') and (k.kurzbez like '%Leasingbilanzierung%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000034' ---Leasingbilanzierung-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%Leasingbilanzierung%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000070' ---Leasingbilanzierung--Onlin

when ((k.nr not like '%INH%') and (k.kurzbez like '%Hedge%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000035' ---Hedge Accounting-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%Hedge%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000071' ---Hedge Accounting--Onlin

when ((k.nr not like '%INH%') and (k.kurzbez like '%Transaktionsprozesse%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000036' ---Transaktionsprozesse-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%Transaktionsprozesse%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000072' ---Transaktionsprozesse--Onlin

when ((k.nr not like '%INH%') and (k.kurzbez like '%Unternehmensbewertung - Mergers & Acquisitions%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000037' ---Bewertungsmethoden-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%Bewertungsmethoden%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000037' ---Bewertungsmethoden-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%Unternehmensbewertung - Mergers & Acquisitions%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000073' ---Bewertungsmethoden-Onl
when ((k.nr not like '%INH%') and (k.kurzbez like '%Bewertungsmethoden%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000073' ---Bewertungsmethoden-Onl

when ((k.nr not like '%INH%') and (k.kurzbez like '%Anlagenbuchhaltung nach IAS%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000042' ---Anlagenbuchhaltung nach IAS-Prä

when ((k.nr not like '%INH%') and (k.kurzbez like '%IFRS 16%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000043' ---IFS16

when ((k.nr not like '%INH%') and (k.kurzbez like '%Kapitalflussrechnung%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000044' ---Kapitalflussrechnung-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%Kapitalflussrechnung%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000074' ---Kapitalflussrechnung--Onlin

when ((k.nr not like '%INH%') and (k.kurzbez like '%IFRS 9%')  and (k.kurzbez not like '%Ausfall%') AND (k.aussenst not in ('Webinar','Online') or (k.titel like '%Zweitägiges Special-Seminar: Finanzinstrumente%'))) THEN 'VAVA000045' ---IFRS9-Prä
when ((k.nr not like '%INH%') and (k.titel like '%Zweitägiges Special-Seminar: Finanzinstrumente%')  and (k.kurzbez not like '%Ausfall%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000045' ---IFRS9-Prä
when ((k.nr not like '%INH%') and (k.kurzbez like '%IFRS 9%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000075' ---IFRS9--Onlin

when ((k.nr not like '%INH%') and (k.kurzbez like '%Umsatz- und Gewinnrealisierung nach IFRS%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000046' 
when ((k.nr not like '%INH%') and (k.kurzbez like '%Umsatz- und Gewinnrealisierung nach IFRS%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000076'

when ((k.nr not like '%INH%') and (k.kurzbez like '%Accounting English%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000047'

when ((k.nr not like '%INH%') and (k.kurzbez like '%Bilanzanalyse nach IFRS%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000049' 
when ((k.nr not like '%INH%') and (k.kurzbez like '%Bilanzanalyse nach IFRS%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000077'

when ((k.nr not like '%INH%') and (k.kurzbez like '%Latente Steuern%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000051' 
when ((k.nr not like '%INH%') and (k.kurzbez like '%Latente Steuern%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000078'

when ((k.nr not like '%INH%') and (k.kurzbez like '%CAS (Chinese%') AND (k.aussenst not in ('Webinar','Online','Video'))) THEN 'VAVA000052' 
when ((k.nr not like '%INH%') and (k.kurzbez like '%CAS (Chinese%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000079'

when ((k.nr not like '%INH%') and (k.kurzbez like '%CINA - Interessenten%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000053' 

when ((k.nr not like '%INH%') and (k.kurzbez like '%IFRS - Interessenten%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000054' 

when ((k.nr not like '%INH%') and (k.kurzbez like '%US-GAAP - Interessenten%') AND (k.aussenst not in ('Webinar','Online'))) THEN 'VAVA000055' 

when ((k.nr not like '%INH%') and (k.kurzbez like '%Rückstell%') AND (k.aussenst not in ('Webinar','Online','Video'))) THEN 'VAVA000060' 
when ((k.nr not like '%INH%') and (k.kurzbez like '%Rückstell%') and (k.nr not like '%ON%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000080' 

when ((k.nr not like '%INH%') and (k.kurzbez like '%Sarb%') and (k.kurzbez not like '%2. Pflichtseminar%') AND (k.aussenst not in ('Webinar','Online','Video'))) THEN 'VAVA000063' 
when ((k.nr not like '%INH%') and (k.kurzbez like '%Sarb%') and (k.nr not like '%ON%') AND (k.aussenst in ('Webinar','Online'))) THEN 'VAVA000081' 

when ((k.nr not like '%INH%') and (k.kurzbez like '%US-GAAP Basiswissen%') AND (k.aussenst not in ('Webinar','Online','Video'))) THEN 'VAVA000062' 

when ((k.nr not like '%INH%') and (k.Titel like '%CINA® Certificate in International Accounting%') and (k.kurzbez not like '%CINA® English%') 
AND (k.aussenst not in ('Webinar','Online','Video'))) THEN 'VAVA000003' 

when (substring(KURZBEZ,1,4) = 'CINA' and k.AUSSENST in ('Viedeo','Online','Webinar') and k.KURZBEZ not like '%English%' and k.KURZBEZ not like '%Refresher%' and SUBSTRING(k.nr,1,3)not in ('LAB','LET','LSA')) then 'VAVA000082'

when (substring(k.nr,1,3) = 'LAB') then 'VAVA000083'
when (substring(k.nr,1,3) = 'LET') then 'VAVA000084'
when (substring(k.nr,1,3) = 'LSA') then 'VAVA000085'

when (substring(k.nr,1,3) = 'CAB') then 'VAVA000086'
when (substring(k.nr,1,3) = 'CET') then 'VAVA000087'
when (substring(k.nr,1,3) = 'CSA') then 'VAVA000088' 


when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez not like '%Master of Arts in Taxation - FlexPlus%') and (k.kurzbez not like '%Master of Arts in Taxation - Klassik%')
and (k.kurzbez not like '%Master of Arts in Taxation - Turbos%') and (k.kurzbez not like '%Master of Arts in Taxation - FlexPlus%')  and (k.kurzbez not like '%Master of Arts in Taxation - TurboPlus%')
and (k.kurzbez not like '%TaxMaster - Sammelkurs für bestandenes%') and (k.kurzbez not like '%TaxMaster - Modul 1: Basiswissen%') and (k.kurzbez not like '%TaxMaster - Modul 4: Betriebswirtscha%')
and (k.kurzbez not like '%MMaster of Arts in Taxation - Steuerbe%') and (k.kurzbez not like '%TaxMaster - Modul 2:%') and (k.kurzbez not like '%TaxMaster - Modul 5:%')
and (k.kurzbez not like '%TaxMaster - Modul 6:%') and (k.kurzbez not like '%TaxMaster - Modul 7:%') and (k.kurzbez not like '%TaxMaster - Modul 3: %') and (k.kurzbez not like '%TaxMaster - Prüfung%')
and (k.kurzbez not like '%TaxMaster - Prüfung Modul 3 & 4 %') and (k.kurzbez not like '%TaxMaster - Prüfung Modul 7%') AND (k.aussenst not in ('Online-Kurs', 'Online')
and (k.kurzbez not like '%Master of Arts in Taxation - Turbo%') and (k.kurzbez not like '%TaxMaster - Sammelkurs für bestande%') and (k.kurzbez not like '%SteuerberaterPlus%')
)) THEN 'VAVT000001' ----Prä
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez not like '%Master of Arts in Taxation - FlexPlus%') and (k.kurzbez not like '%Master of Arts in Taxation - Klassik%')
and (k.kurzbez not like '%Master of Arts in Taxation - Turbos%') and (k.kurzbez not like '%Master of Arts in Taxation - FlexPlus%')  and (k.kurzbez not like '%Master of Arts in Taxation - TurboPlus%')
and (k.kurzbez not like '%TaxMaster - Sammelkurs für bestandenes%') and (k.kurzbez not like '%TaxMaster - Modul 1: Basiswissen%') and (k.kurzbez not like '%TaxMaster - Modul 4: Betriebswirtscha%')
and (k.kurzbez not like '%MMaster of Arts in Taxation - Steuerbe%') and (k.kurzbez not like '%TaxMaster - Modul 2:%') and (k.kurzbez not like '%TaxMaster - Modul 5:%')
and (k.kurzbez not like '%TaxMaster - Modul 6:%') and (k.kurzbez not like '%TaxMaster - Modul 7:%') and (k.kurzbez not like '%TaxMaster - Modul 3: %') and (k.kurzbez not like '%TaxMaster - Prüfung%')
and (k.kurzbez not like '%TaxMaster - Prüfung Modul 3 & 4 %') and (k.kurzbez not like '%TaxMaster - Prüfung Modul 7%') AND (k.aussenst in ('Online-Kurs', 'Online')
and (k.kurzbez not like '%Master of Arts in Taxation - Turbo%') and (k.kurzbez not like '%TaxMaster - Sammelkurs für bestande%') and (k.kurzbez not like '%SteuerberaterPlus%')
)) THEN 'VAVT000009' ----Online
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 1: Basiswissen%') AND (k.aussenst not in ('Online-Kurs', 'Online'))) THEN 'VAVT000002' ----Prä
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 1: Basiswissen%') AND (k.aussenst in ('Online-Kurs', 'Online'))) THEN 'VAVT000010' ----Online
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 2:%') AND (k.aussenst not in ('Online-Kurs', 'Online'))) THEN 'VAVT000003' ----Prä
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 2:%') AND (k.aussenst in ('Online-Kurs', 'Online'))) THEN 'VAVT000011' ----Online
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 3: %') AND (k.aussenst not in ('Online-Kurs', 'Online'))) THEN 'VAVT000004' ----Prä
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 3: %') AND (k.aussenst in ('Online-Kurs', 'Online'))) THEN 'VAVT000012' ----Online
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 4: Betriebswirtscha%') AND (k.aussenst not in ('Online-Kurs', 'Online'))) THEN 'VAVT000005' ----Prä
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 4: Betriebswirtscha%') AND (k.aussenst in ('Online-Kurs', 'Online'))) THEN 'VAVT000013' ----Online
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 5:%') AND (k.aussenst not in ('Online-Kurs', 'Online'))) THEN 'VAVT000006' ----Prä
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 5:%') AND (k.aussenst in ('Online-Kurs', 'Online'))) THEN 'VAVT000014' ----Online
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 6:%') AND (k.aussenst not in ('Online-Kurs', 'Online'))) THEN 'VAVT000007' ----Prä
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 6:%') AND (k.aussenst in ('Online-Kurs', 'Online'))) THEN 'VAVT000015' ----Online
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 7:%') AND (k.aussenst not in ('Online-Kurs', 'Online'))) THEN 'VAVT000008' ----Prä
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Modul 7:%') AND (k.aussenst in ('Online-Kurs', 'Online'))) THEN 'VAVT000016' ----Online
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%Master of Arts in Taxation - SteuerberaterPlus%')) THEN 'VAVT000020' ---
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%Master of Arts in Taxation - FlexPlus%')) THEN 'VAVT000027' 
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%Master of Arts in Taxation - Klassik%')) THEN 'VAVT000017' 
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%Master of Arts in Taxation - Turbo%') and (k.kurzbez not like '%Master of Arts in Taxation - TurboPlus%')) THEN 'VAVT000018' 
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%Master of Arts in Taxation - TurboPlus%')) THEN 'VAVT000019' 
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%Sammelkurs%')) THEN 'VAVT000026' ---
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Prüfung%') and (k.kurzbez not like '%TaxMaster - Prüfung Modul 3 & 4 %') and (k.kurzbez not like '%TaxMaster - Prüfung Modul 7%')
and (k.kurzbez  not like '%TaxMaster - Prüfung Modul 5%') and (k.kurzbez not like '%TaxMaster - Prüfung Modul 1%')) THEN 'VAVT000021'
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Prüfung Modul 3 & 4 %')) THEN 'VAVT000023'
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Prüfung Modul 7%')) THEN 'VAVT000025'
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Prüfung Modul 5%')) THEN 'VAVT000024'
when ((substring(k.nr,2,2) = 'M8') and (k.kurzbez like '%TaxMaster - Prüfung Modul 1%')) THEN 'VAVT000022' 

when (k.TITEL like 'Die chinesische Unternehmensbesteuerung kompakt') THEN 'VAVA000059'
when (k.KURZBEZ like 'FB - Prüfung' AND k.AUSSENST NOT IN ('Online')) THEN 'VAVE000696'
when (SUBSTRING(k.NR,2,5) = 'INFOM' AND k.AUSSENST NOT IN ('Online','Online-Kurs','Video')) THEN 'VAVT000028'
when (SUBSTRING(k.NR,2,3) = 'MAT') THEN 'VAVE000519'

when (SUBSTRING(k.NR,2,5) = 'INFOM' AND k.AUSSENST IN ('Online','Online-Kurs')) THEN 'VAVT000029'
when (SUBSTRING(k.NR,2,4) = 'BAON' AND k.KURZBEZ like 'Ertragsteuern 1 (Klausuren-Abschlusstraining Online)') THEN 'VAVE000302'
when (SUBSTRING(k.NR,2,4) = 'BAON' AND k.KURZBEZ like '%Ertragsteuern 2 (Klausuren-Abschlusstraining Online)%') THEN 'VAVE000069'
when (SUBSTRING(k.NR,2,4) = 'BAON' AND k.KURZBEZ like 'Bilanzsteuerrecht 1 (Klausuren-Abschlusstraining Online)') THEN 'VAVE000066'
when (SUBSTRING(k.NR,2,4) = 'BAON' AND k.KURZBEZ like 'Ertragsteuern 3 (Klausuren-Abschlusstraining Online)') THEN 'VAVE000070'
when (SUBSTRING(k.NR,2,4) = 'BAON' AND k.KURZBEZ like 'Bilanzsteuerrecht 2 (Klausuren-Abschlusstraining Online)') THEN 'VAVE000067'
when (SUBSTRING(k.NR,2,4) = 'BAON' AND k.KURZBEZ like 'Abgabenordnung  (Klausuren-Abschlusstraining Online)') THEN 'VAVE000065'
when (SUBSTRING(k.NR,2,4) = 'BAON' AND k.KURZBEZ like 'Bilanzsteuerrecht 3 (Klausuren-Abschlusstraining Online)') THEN 'VAVE000068'
when (SUBSTRING(k.NR,2,4) = 'BAON' AND k.KURZBEZ like 'Erbschaftssteuer/Bewertungsrecht (Klausuren-Abschlusstraining Online)') THEN 'VAVE000490'
when (SUBSTRING(k.NR,2,4) = 'BAON' AND k.KURZBEZ like 'Umsatzsteuer (Klausuren-Abschlusstraining Online)') THEN 'VAVE000073'

when (SUBSTRING(k.NR,2,2) = 'A2' AND SUBSTRING(k.NR,7,3) = '1FB' AND k.AUSSTELL IN ('Online-Kurs')) THEN 'VAVE000503'
when (k.NR like 'UINFOEVP2') THEN 'VAVE000569'

when (k.KURZBEZ like 'Produktivitätstraining und Zeitmanagement im Controlling und Rechnungswesen') THEN 'VAVE000500'
when (k.KURZBEZ like 'US-GAAP kompakt - 1. Wahlseminar') THEN 'VAVA000025'
when (k.KURZBEZ like 'US-GAAP SOX - 2. Wahlseminar') THEN 'VAVA000026'
when (k.KURZBEZ like 'Steuerfachwirt Bachelor-Paket') THEN 'VAVE000511'
when (k.KURZBEZ like 'Steuerfachwirt Bachelor-Paket - Modul 1') THEN 'VAVE000510'
when (k.KURZBEZ like 'Steuerfachwirt Bachelor-Paket - Modul 2') THEN 'VAVE000508'
when (k.KURZBEZ like 'Steuerfachwirt Bachelor-Paket - Modul 3') THEN 'VAVE000507'
when (k.KURZBEZ like 'KöMoG - Körperschaftsteuer-Modernisierungsgesetz') THEN 'VAVE000161'
when (k.KURZBEZ like 'Umsatzsteuer-Jahrestagung 2021') THEN 'VAVE000517'

when (k.NR Like '%PWONABO1E') THEN 'VAVE000692'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'F7') THEN 'VAVE000179'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'F8') THEN 'VAVE000502'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'F9') THEN 'VAVE000518'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'G1') THEN 'VAVE000516'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'G2') THEN 'VAVE000187'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'G3') THEN 'VAVE000505'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'G4') THEN 'VAVE000514'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'G5') THEN 'VAVE000571'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'G6') THEN 'VAVE000432'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'G7') THEN 'VAVE000554'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'G8') THEN 'VAVE000499'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'G9') THEN 'VAVE000501'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'H1') THEN 'VAVE000504'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'H2') THEN 'VAVE000169'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'H3') THEN 'VAVE000520'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'H4') THEN 'VAVE000013'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'H5') THEN 'VAVE000513'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'H6') THEN 'VAVE000279'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'H7') THEN 'VAVE000498'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'H8') THEN 'VAVE000274'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'H9') THEN 'VAVE000164'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'I1') THEN 'VAVE000157'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'I2') THEN 'VAVE000226'

when (SUBSTRING(k.NR,2,4) = 'A1VA') THEN 'VAVE000280'
when (SUBSTRING(k.NR,2,4) = 'A8ON' AND SUBSTRING(k.NR,7,1) = 'P') THEN 'VAVE000002'
when (SUBSTRING(k.NR,2,4) = 'AEVA') THEN 'VAVE000141'
when (SUBSTRING(k.NR,2,4) = 'AFVA') THEN 'VAVE000218'
when (SUBSTRING(k.NR,2,5) = 'INFOH' AND k.KURZBEZ like 'Bilanzbuchhaltung - International  - Online-Infoveranstaltung') THEN 'VAVE000497'


when (k.NR like '%INFOH%' AND k.KURZBEZ like 'Internationale Rechnungslegung - Infoveranstaltung%') THEN 'VAVE000494'
when (SUBSTRING(k.NR,2,2) = 'PA' AND SUBSTRING(k.NR,6,2) = 'C1') THEN 'VAVE000301'
when (SUBSTRING(k.NR,2,2) = 'PA' AND SUBSTRING(k.NR,6,2) = 'C3') THEN 'VAVE000182'
when (k.KURZBEZ like 'Finanzbuchhaltung mit SAP® S/4 HANA') THEN 'VAVE000572'
when (k.NR like '%PWONABOMZ') THEN 'VAVE000692'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'I3') THEN 'VAVE000278'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'I4') THEN 'VAVE000538'
when (SUBSTRING(k.NR,2,2) = 'PW' AND SUBSTRING(k.NR,6,2) = 'I5') THEN 'VAVE000495'
when (SUBSTRING(k.NR,2,2) = 'XH' AND k.NR NOT LIKE 'RXH9FL') THEN 'VAVE000481'
when (SUBSTRING(k.NR,2,4) = 'XPD') THEN 'VAVE000493'

when (k.KURZBEZ like 'US-GAAP kompakt - 1. Pflichtseminar') THEN 'VAVA000025'
when (k.KURZBEZ like 'US-Sarbanes-Oxley Act (SOX) 404 - 2. Pflichtseminar') THEN 'VAVA000026'
when (k.KURZBEZ like 'Die chinesische Unternehmensbesteuerung kompakt') THEN 'VAVA000059'
when (k.KURZBEZ like 'Prüfung - Debitoren-/Kreditorenbuchhalter/in online') THEN 'VAVE000002'
when (k.KURZBEZ like 'USt im Online-Handel (Teil II)') THEN 'VAVE000013'
when (k.KURZBEZ like 'Abgabenordnung (Klausuren-Abschlusstraining)') THEN 'VAVE000065'
when (k.KURZBEZ like 'Bilanzsteuerrecht 1 (Klausuren-Abschlusstraining)') THEN 'VAVE000066'
when (k.KURZBEZ like 'Bilanzsteuerrecht 2 (Klausuren-Abschlusstraining)') THEN 'VAVE000067'
when (k.KURZBEZ like 'Bilanzsteuerrecht 3 (Klausuren-Abschlusstraining)') THEN 'VAVE000068'
when (k.KURZBEZ like 'Ertragsteuern 2 (Klausuren-Abschlusstraining)') THEN 'VAVE000069'
when (k.KURZBEZ like 'Ertragsteuern 3 (Klausuren-Abschlusstraining)') THEN 'VAVE000070'
when (k.KURZBEZ like 'Umsatzsteuer (Klausuren-Abschlusstraining)') THEN 'VAVE000073'
when (k.KURZBEZ like 'Lohn-und Gehaltsbuchhalter prüfungsvorbereitende Übungsklausuren') THEN 'VAVE000141'
when (k.KURZBEZ like 'Lohnsteuer - Reisekosten 2022') THEN 'VAVE000157'
when (k.KURZBEZ like 'KöMoG - Körperschaftsteuer-Modernisierungsgesetz') THEN 'VAVE000161'
when (k.KURZBEZ like 'Jahresabschluss 2021') THEN 'VAVE000164'
when (k.KURZBEZ like 'Internationales Steuerrecht - Grundpaket EStG, DBA, AStG') THEN 'VAVE000169'
when (k.KURZBEZ like 'Homeoffice und häusliches Arbeitszimmer') THEN 'VAVE000179'
when (k.KURZBEZ like 'Grundsteuerreform - Organisatorische Umsetzung in der Steuerberatungskanzlei') THEN 'VAVE000182'
when (k.KURZBEZ like 'Grunderwerbsteuer bei share deals') THEN 'VAVE000187'
when (k.KURZBEZ like 'Finanzbuchhalter prüfungsvorbereitende Übungsklausuren') THEN 'VAVE000218'
when (k.KURZBEZ like 'Erstausbildung - Zweitausbildung') THEN 'VAVE000226'
when (k.KURZBEZ like 'Einkommensteuererklärung 2021') THEN 'VAVE000274'
when (k.KURZBEZ like 'Einführung KöMoG') THEN 'VAVE000278'
when (k.KURZBEZ like 'Digitales Belegbuchen') THEN 'VAVE000279'
when (k.KURZBEZ like 'Debitoren-/Kreditorenbuchhalter/in') THEN 'VAVE000280'
when (k.KURZBEZ like 'Die Grundsteuerreform im Überblick') THEN 'VAVE000301'
when (k.KURZBEZ like 'Ertragsteuern 1 (Klausuren-Abschlusstraining)') THEN 'VAVE000302'
when (k.KURZBEZ like 'Das Vorsteuer-Vergütungsverfahren') THEN 'VAVE000432'
when (k.KURZBEZ like '%Weiterbildung Bilanzbuchhalter/-in Zusatzqualifikation (IHK)%' AND k.NR NOT LIKE 'RXH9FL') THEN 'VAVE000481'
when (k.KURZBEZ like 'Erbschaftssteuer/Bewertungsrecht%') THEN 'VAVE000490'
when (k.KURZBEZ like 'Controllingseminare%') THEN 'VAVE000493'
when (k.KURZBEZ like 'Bilanzbuchhaltung-International%') THEN 'VAVE000494'
when (k.KURZBEZ like 'Mehr- und Minderabführungen in der Organschaft') THEN 'VAVE000495'
when (k.KURZBEZ like '%Bilanzbuchhalter International%' AND k.AUSSENST in ('Online-Kurs')) THEN 'VAVE000497'
when (k.KURZBEZ like 'Online-Händler richtig abbilden') THEN 'VAVE000498'
when (k.KURZBEZ like 'Pflichtveranlagung ja oder nein?') THEN 'VAVE000499'
when (k.KURZBEZ like 'Produktivitätstraining und Zeitmanagement im Controlling und Rechnungswesen') THEN 'VAVE000500'
when (k.KURZBEZ like 'Rechnungskorrektur') THEN 'VAVE000501'
when (k.KURZBEZ like 'Reisekosten - Grundlagen und Erstattungsmöglichkeiten') THEN 'VAVE000502'
when (k.KURZBEZ like 'Finanzbuchhalter/-in (Tageslehrgang)' AND k.AUSSENST in ('Online-Kurs')) THEN 'VAVE000503'
when (k.KURZBEZ like 'Richtige Rechnungsstellung') THEN 'VAVE000504'
when (k.KURZBEZ like 'StBVV - guter Lohn für gute Arbeit') THEN 'VAVE000505'
when (k.KURZBEZ like 'Steuerfachwirt Bachelor-Paket - Modul 3') THEN 'VAVE000507'
when (k.KURZBEZ like 'Steuerfachwirt Bachelor-Paket - Modul 2') THEN 'VAVE000508'
when (k.KURZBEZ like 'Steuerfachwirt Bachelor-Paket - Modul 1') THEN 'VAVE000510'
when (k.KURZBEZ like 'Steuerfachwirt Bachelor-Paket') THEN 'VAVE000511'
when (k.KURZBEZ like 'Steuerliche Behandlung von Influencern') THEN 'VAVE000513'
when (k.KURZBEZ like 'Steuerzinsen - Verfassungswidrigkeit bestätigt') THEN 'VAVE000514'
when (k.KURZBEZ like 'Umsatzsteuer-Falle: Missbrauch') THEN 'VAVE000516'
when (k.KURZBEZ like 'Umsatzsteuer-Jahrestagung 2021') THEN 'VAVE000517'
when (k.KURZBEZ like 'Umsatzsteuerliche Organschaft') THEN 'VAVE000518'
when (k.KURZBEZ like 'Unterrichtsmaterial/ Aktualisierung für Kurse mit MwSt') THEN 'VAVE000519'
when (k.KURZBEZ like 'USt im Online-Handel (Teil I)') THEN 'VAVE000520'
when (k.KURZBEZ like 'Was ist eigentlich eine vGA?') THEN 'VAVE000538'
when (k.KURZBEZ like 'Wie prüfe ich eine USt-ID?') THEN 'VAVE000554'
when (k.KURZBEZ like 'Bilanzbuchhalter/in - die Prüfungen') THEN 'VAVE000569'
when (k.KURZBEZ like 'Beschäftigte Rentner in der Entgeltabrechnung') THEN 'VAVE000571'
when (k.KURZBEZ like 'Finanzbuchhaltung mit SAP® S/4 HANA') THEN 'VAVE000572'
when (k.KURZBEZ like 'EndrissMedia+ 12-Monatsabonnement (Mediathek)') THEN 'VAVE000692'
when (k.KURZBEZ like 'Prüfung - Finanzbuchhalter/-in') THEN 'VAVE000696'
when (k.KURZBEZ like 'Master of Arts in Taxation - Infoveranstaltung%' AND k.AUSSTELL NOT IN ('Online','Online-Kurs','Online-Infoveranstaltung','Video') AND k.NR not like 'VINFOMON%' AND k.NR not like 'WINFOMON%' AND k.NR not like 'UINFOMON%') THEN 'VAVT000028'
when (k.NR  like 'VINFOMON%' or k.NR  like 'WINFOMON%' or k.NR  like 'UINFOMON%' or k.NR  like 'TINFOMON%') THEN 'VAVT000029'

when (k.NR  like '%A9ON_P') THEN 'VAVE000006'
when (k.NR  like '_A2VA%') THEN 'VAVE000011'
when (k.TITEL like '%Prüfung - Lohn und Gehaltsbuchhalter/in%' AND k.AUSSENST like '%On%') THEN 'VAVE000017'
when (k.NR  like '_A5ON%') THEN 'VAVE000020'
when (k.NR  like '_A1%P') THEN 'VAVE000032'
when (k.NR  like '_BA%' AND k.NR NOT LIKE '_BAON%') THEN 'VAVE000071'
when (k.NR  like '_BAON%') THEN 'VAVE000072'
when (k.NR  like '_C5%') THEN 'VAVE000083'
when (k.NR  like '_A5%P') THEN 'VAVE000090'
when (k.TITEL like 'UPdate-Seminar: Aktuelles Steuerrecht III - Webinar') THEN 'VAVE000229'
when (k.TITEL like 'EndrissUPdate für Steuerberater (Abonnement: 4 Termine/Jahr)') THEN 'VAVE000232'
when (k.NR  like 'VU7VA13') THEN 'VAVE000252'
when (k.NR  like '_E9%') THEN 'VAVE000282'
when (k.NR  like 'RXH9FL') THEN 'VAVE000478'
when (k.NR  like 'TINFOMVA1') THEN 'VAVT000030'
when (k.NR  like '_XMT') THEN 'VAVT000031'



ELSE
''

END as VLG
,isnull
(case 
	when upper(k.ORT) like '%HÖRSAAL I' and upper(k.ORT) like '%DÜSSELDORF%' then '100202'
	when upper(k.ORT) like '%HÖRSAAL II' and upper(k.ORT) like '%DÜSSELDORF%' then '100202'
	when upper(k.ORT) like '%HÖRSAAL I' and upper(k.ORT) like '%FRANKFURT%' then '100388'
	when upper(k.ORT) like '%HÖRSAAL II' and upper(k.ORT) like '%FRANKFURT%' then '100388'
	when upper(k.ORT) like '%HÖRSAAL III' and upper(k.ORT) like '%FRANKFURT%' then '100388'
	when upper(k.ORT) like '%HÖRSAAL IV' and upper(k.ORT) like '%FRANKFURT%' then '100388'
	when upper(k.ORT) like '%HÖRSAAL I' and upper(k.ORT) like '%HANNOVER%' then '100150'
	when upper(k.ORT) like '%HÖRSAAL II' and upper(k.ORT) like '%HANNOVER%' then '100150'
	when upper(k.ORT) like '%HÖRSAAL I' and upper(k.ORT) like '%HAMBURG%' then '100080'
	when upper(k.ORT) like '%HÖRSAAL II' and upper(k.ORT) like '%HAMBURG%' then '100080'
	when upper(k.ORT) like '%HÖRSAAL III' and upper(k.ORT) like '%HAMBURG%' then '100080'
	when upper(k.ORT) like '%HÖRSAAL IV' and upper(k.ORT) like '%HAMBURG%' then '100080'
	when upper(k.ORT) like '%HÖRSAAL I' and upper(k.ORT) like '%KÖLN%' then '100000'
	when upper(k.ORT) like '%HÖRSAAL II' and upper(k.ORT) like '%KÖLN%' then '100000'
	when upper(k.ORT) like '%HÖRSAAL III' and upper(k.ORT) like '%KÖLN%' then '100000'
	when upper(k.ORT) like '%HÖRSAAL IV' and upper(k.ORT) like '%KÖLN%' then '100000'
	when upper(k.ORT) like '%HÖRSAAL I' and upper(k.ORT) like '%MANNHEIM%' then '100480'
	when upper(k.ORT) like '%HÖRSAAL II' and upper(k.ORT) like '%MANNHEIM%' then '100480'
	when upper(k.ORT) like '%HÖRSAAL III' and upper(k.ORT) like '%MANNHEIM%' then '100480'
	when upper(k.ORT) like '%HÖRSAAL I' and upper(k.ORT) like '%MÜNCHEN%' then '100566'
	when upper(k.ORT) like '%HÖRSAAL II' and upper(k.ORT) like '%MÜNCHEN%' then '100566'
	when upper(k.ORT) like '%HÖRSAAL III' and upper(k.ORT) like '%MÜNCHEN%' then '100566'
	when upper(k.ORT) like '%HÖRSAAL I' and upper(k.ORT) like '%STUTTGART%' then '100498'
	when upper(k.ORT) like '%HÖRSAAL II' and upper(k.ORT) like '%STUTTGART%' then '100498'

else 
	(select nr from KURSORTE where k.ort =MKTEXT)

end,'') [Veranstaltungsort Nr]

from kurse k left join Kursgruppe kg on k.NR = kg.Unterkurs 
where k.BEGINN_DAT >= '01.01.2017'  and k.KURZBEZ not like '%Ausfall%' and (k.FACHB not in ('OR', 'VE','X'))   

--group by Hauptkurs, NR,	TYP, BEGINN_DAT, ENDE_DAT,mandant,ORT,FACHB,DAUER,DOZSTDREAL,AUSSENST,SEMESTER,AUSFALL,SONDERGEB,FACHB_BVV,FACHB_LAND,KURZBEZ,DAUERDETAI,BEGINN,ENDE,GEB_ORG,GEBUEHR,GEB_ART,TEIL_MAX,TEIL_MIN,TEIL_AKT,TEIL_WART,WARNUNG,KURS_ART,KART_KEY,ANRECHEN,STUNDENANZ,VERTRTAGE,kg.Bearbeiter,k.BEARBEITER,VERLAUF,BIS_MAX,ABG_DATUM,KNR_ORG,k.BEARBDATUM,ABW_ANRECHEN,NSAMASSNAHME,KURSAUSWAHL1,KURSAUSWAHL4,KURSAUSWAHL7,VERWALTUNG,HPM,MINUTENTAG,PAUSETAG,UETAG,TITEL,MATERIAL,INTNOTIZ,VERTRAG,ZEUGNIS,ABG_BEMERK,WOTAG,Sofortzahl,eLearningKursAktiv,eLearningVon,eLearningBis,KSK,NeuerKurs,Essen_JN,InternetAktiv,ErstelltDatum,EMailStatus,Fa_Pauschal,WebFlags,WFWeitergabe,eLearningKursID,ErstelltVon,Master_knr,teil_soll,info_gesperrt,beleg_ans,zgvorlbeschreibung,zgvorldateiname,nr_anzeige,KURSAUSWAHL8,KURSAUSWAHL9,k.AUSSTELL
ORDER BY 2