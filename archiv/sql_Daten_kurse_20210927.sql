use Kufer_Reporting

select
iif (kg.hauptkurs is null,iif(k.Nr not in (select Hauptkurs from kursgruppe),'',k.Nr),kg.Hauptkurs) as HauptKurs,
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
isnull(k.material,'') material,
iif(k.NeuerKurs ='W','W','F') as 'Catering Ja/Nein',
iif(k.VERLAUF = 'E','W','F') as 'Erinnerungsmailing',
iif (kg.hauptkurs is null,iif(k.Nr not in (select Hauptkurs from kursgruppe),'V','H1'),'H2') as KursTyp,
isnull(k.KURSAUSWAHL8,'') as [Soll-UE],
isnull(k.KURSAUSWAHL9,'') as [Soll-Minuten],

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
	when 'PA' then 'Rechnugnswesen/Steuern'
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

Fachgebiet_Neu



 from KURSE k left outer join Kursgruppe kg on k.NR = kg.Unterkurs 

 where BEGINN_DAT >='01.01.2015' 

 and (k.FACHB not in ('OR', 'VE','X'))  



