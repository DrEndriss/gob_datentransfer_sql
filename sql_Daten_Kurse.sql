USE STF_Endriss
SELECT
	--Case-Block erweitert am 26.07.2022
	CASE
		WHEN SUBSTRING(k.nr, 4, 2) = 'BU' THEN ''
		WHEN SUBSTRING(k.nr, 2, 2) = 'A1'
		AND right(k.nr, 3) = 'DBK' THEN ''
		WHEN SUBSTRING(k.nr, 2, 2) = 'A2'
		AND right(k.nr, 2) = 'FB' THEN ''
		WHEN SUBSTRING(k.nr, 2, 2) = 'A3'
		AND right(k.nr, 3) = 'LGB' THEN ''
		WHEN SUBSTRING(k.nr, 2, 2) = 'A5'
		AND right(k.nr, 2) = 'AB' THEN ''
		ELSE iif (
			kg.hauptkurs IS NULL,
			iif(
				k.Nr NOT IN (
					SELECT
						Hauptkurs
					FROM
						kursgruppe
				),
				'',
				k.Nr
			),
			kg.Hauptkurs
		)
	END AS HauptKurs_Nr,
	k.NR,
	--Case-Block erweitert am 26.07.2022
	CASE
		WHEN SUBSTRING(k.nr, 4, 2) = 'BU' THEN 'V'
		WHEN SUBSTRING(k.nr, 2, 2) = 'A1'
		AND right(k.nr, 3) = 'DBK' THEN 'V'
		WHEN SUBSTRING(k.nr, 2, 2) = 'A2'
		AND right(k.nr, 2) = 'FB' THEN 'V'
		WHEN SUBSTRING(k.nr, 2, 2) = 'A3'
		AND right(k.nr, 3) = 'LGB' THEN 'V'
		WHEN SUBSTRING(k.nr, 2, 2) = 'A5'
		AND right(k.nr, 2) = 'AB' THEN 'V'
		ELSE iif (
			kg.hauptkurs IS NULL,
			iif(
				k.Nr NOT IN (
					SELECT
						Hauptkurs
					FROM
						kursgruppe
				),
				'V',
				'L'
			),
			'V'
		)
	END AS TYP,
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
	isnull(k.TEIL_AKT, '') TEIL_AKT,
	isnull(k.TEIL_WART, '') TEIL_WART,
	REPLACE(k.WARNUNG, ';', ',') WARNUNG,
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
	REPLACE(k.TITEL, ';', ',') TITEL,
	REPLACE(k.MATERIAL, ';', ',') MATERIAL,
	REPLACE(k.INTNOTIZ, ';', ',') INTNOTIZ,
	k.VERTRAG,
	k.ZEUGNIS,
	k.ABG_BEMERK,
	CAST (k.INFO AS varchar(5000)) Info,
	k.WOTAG,
	k.Sofortzahl,
	k.eLearningKursAktiv,
	k.eLearningVon,
	k.eLearningBis,
	k.KSK,
	k.NeuerKurs,
	k.Essen_JN,
	/**
	 * NEU AB 06.12.2022 InternetAktiv = W : KURSE.InternetAktiv == 'W' & einen Eintrag in der Tabelle: kurse_kategorien & krse.enddatum >= heute; ANSONSTEN: 'F' 
	 * , die alte Spalte wird nicht mehr gezogen - TK
	 k.InternetAktiv, **/
	CASE
		WHEN k.Nr IN (
			SELECT
				kurse_kategorien.knr
			FROM
				kurse_kategorien
				LEFT JOIN Kurse ON kurse_kategorien.knr = KURSE.NR
			WHERE
				KURSE.InternetAktiv = 'W'
				AND kurse_kategorien.kategorie_id > 0
				AND Kurse.ENDE_DAT >= GETDATE()
		) THEN 'W'
		ELSE 'F'
	END AS InternetAktiv,
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
	iif(k.NeuerKurs = 'W', 'W', 'F') AS 'Catering JaNein',
	iif(k.VERLAUF = 'E', 'W', 'F') AS 'Erinnerungsmailing',
	--Case-Block erweitert am 26.07.2022
	CASE
		WHEN SUBSTRING(k.nr, 4, 2) = 'BU' THEN 'H2'
		WHEN SUBSTRING(k.nr, 2, 2) = 'A1'
		AND right(k.nr, 3) = 'DBK' THEN 'H2'
		WHEN SUBSTRING(k.nr, 2, 2) = 'A2'
		AND right(k.nr, 2) = 'FB' THEN 'H2'
		WHEN SUBSTRING(k.nr, 2, 2) = 'A3'
		AND right(k.nr, 3) = 'LGB' THEN 'H2'
		WHEN SUBSTRING(k.nr, 2, 2) = 'A5'
		AND right(k.nr, 2) = 'AB' THEN 'H2'
		ELSE iif (
			kg.hauptkurs IS NULL,
			iif(
				k.Nr NOT IN (
					SELECT
						Hauptkurs
					FROM
						kursgruppe
				),
				'V',
				'H1'
			),
			'H2'
		)
	END AS KursTyp,
	isnull(k.KURSAUSWAHL8, '') AS [Soll-UE],
	isnull(k.KURSAUSWAHL9, '') AS [Soll-Minuten],
	'' FB1,
	'' FB2,
	CASE
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'A' THEN '70010'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'B' THEN '70020'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'W' THEN '70020'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'K' THEN '70020'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'C' THEN '70030'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) IN('N', 'G') THEN '70030'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'D' THEN '70040'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'E' THEN '70050'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'F' THEN '70055'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'P' THEN '70060'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'U' THEN '70060'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'I' THEN '70061'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'S' THEN '70062'
		WHEN k.mandant IN ('1')
		AND Substring(k.NR, 2, 1) = 'H' THEN '70070'
		WHEN k.mandant = '2'
		AND k.FACHB = 'KK' THEN '73010'
		WHEN k.mandant = '2'
		AND k.FACHB = 'VS' THEN '73010'
		WHEN k.mandant = '2'
		AND k.FACHB = 'ON' THEN '73010'
		WHEN k.mandant = '2'
		AND k.FACHB = 'GK' THEN '73010'
		WHEN k.mandant = '2'
		AND k.FACHB = 'INH' THEN '73020'
		WHEN k.mandant = '2'
		AND k.FACHB = 'TM' THEN '73020'
		WHEN k.mandant = '2'
		AND k.FACHB = 'CI' THEN '73030'
		WHEN k.mandant = '2'
		AND k.FACHB = 'SP' THEN '73030'
		WHEN k.mandant = '2'
		AND k.FACHB = 'US' THEN '73040'
		WHEN k.mandant = '2'
		AND k.FACHB = 'BP' THEN '73060'
		WHEN k.mandant = '3'
		AND SUBSTRING(k.NR, 2, 2) = 'M8' THEN '74090'
		WHEN k.mandant = '3'
		AND SUBSTRING(k.NR, 2, 2) = 'L3' THEN '74095'
		WHEN k.mandant = '1'
		AND k.FACHB = 'IH' THEN '70062'
		WHEN k.mandant = '2'
		AND k.FACHB = 'IH' THEN '73020'
		ELSE '70080'
	END KST,
	iif(
		upper(k.AUSSENST) LIKE 'VIDEO%',
		'Video',
		iif(
			upper(k.AUSSENST) LIKE 'ONLINE%'
			OR upper(k.AUSSENST) LIKE 'Webinar'
			OR substring(k.nr, 2, 4) IN('B4ON', 'BAON', 'D4ON'),
			'Online',
			iif(
				upper(k.AUSSENST) LIKE 'HEIMARBEIT%'
				OR k.kart_key = '24'
				OR substring(k.nr, 2, 3) IN('H5P'),
				'Heimarbeit',
				'Präsenz'
			)
		)
	) Darstellungsart_Neu,
	iif(
		k.FACHB = 'IN',
		'Info-Veranstaltung',
		iif(
			k.FACHB = 'IH',
			'Inhouse',
			iif(
				k.kart_key = '16',
				'Prüfung',
				iif(
					k.kart_key = '24',
					'Fernlehrgang',
					iif(
						k.FACHB = 'M8'
						OR (
							substring(k.nr, 2, 1) = 'L'
							AND k.mandant = 3
						),
						'Studiengang',
						iif(
							(
								substring(k.nr, 2, 1) IN ('U', 'P')
								AND k.mandant = 1
							)
							OR k.mandant = 2,
							'Seminar',
							iif(
								substring(k.fachb, 1, 1) IN ('X')
								OR k.mandant = 5
								OR substring(k.nr, 2, 3) IN ('MAT')
								OR substring(k.nr, 2, 4) IN ('M8TH')
								OR k.Nr = 'Script',
								'Sonstiges',
								'Lehrgang'
							)
						)
					)
				)
			)
		)
	) Durchfuehungsart_Neu,
	CASE
		k.KART_KEY
		WHEN 9 THEN 'Abendveranstaltung'
		WHEN 7 THEN 'Blockveranstaltung'
		WHEN 35 THEN 'Blockveranstaltung'
		WHEN 24 THEN 'Blockveranstaltung'
		WHEN 8 THEN 'Klausurenveranstaltung'
		WHEN 11 THEN 'Kombiveranstaltung'
		WHEN 37 THEN 'Kompaktrepetitorium'
		WHEN 12 THEN 'Wochenendveranstaltung'
		WHEN 21 THEN 'Wochenveranstaltung'
		WHEN 13 THEN 'Updateveranstaltung'
		WHEN 6 THEN 'Intensivveranstaltung'
		WHEN 15 THEN 'Intensivveranstaltung'
		WHEN 10 THEN 'Samstags-/Sonntagsveranstaltung'
		WHEN 17 THEN 'Samstags-/Sonntagsveranstaltung'
		WHEN 1 THEN 'Tagesveranstaltung'
		WHEN 4 THEN 'Tagesveranstaltung'
		WHEN 14 THEN 'Eintägige Veranstaltung'
		WHEN 18 THEN 'Eintägige Veranstaltung'
		WHEN 40 THEN 'Eintägige Veranstaltung'
		WHEN 44 THEN 'Eintägige Veranstaltung'
		WHEN 25 THEN 'Eintägige Veranstaltung'
		WHEN 45 THEN 'Eintägige Veranstaltung'
		WHEN 47 THEN 'Eintägige Veranstaltung'
		WHEN 16 THEN 'Eintägige Veranstaltung'
		WHEN 2 THEN 'Mehrtägige Veranstaltung'
		WHEN 3 THEN 'Mehrtägige Veranstaltung'
		WHEN 41 THEN 'Mehrtägige Veranstaltung'
		WHEN 42 THEN 'Mehrtägige Veranstaltung'
		WHEN 36 THEN 'Mehrtägige Veranstaltung'
		WHEN 46 THEN 'Mehrtägige Veranstaltung'
		WHEN 48 THEN 'Mehrtägige Veranstaltung'
		WHEN 49 THEN 'Mehrtägige Veranstaltung'
		WHEN 51 THEN 'Mehrtägige Veranstaltung'
		WHEN 39 THEN 'Mehrtägige Veranstaltung'
		ELSE 'Sonstige'
	END Veranstaltungsart_Neu,
	CASE
		k.FACHB
		WHEN 'A5' THEN 'Anlagenbuchhalter'
		WHEN '5K' THEN 'Anlagenbuchhalter'
		WHEN 'A6' THEN 'Anlagenbuchhalter'
		WHEN 'AD' THEN 'Anlagenbuchhalter'
		WHEN 'E1' THEN 'Bilanzbuchhalter'
		WHEN 'E2' THEN 'Bilanzbuchhalter'
		WHEN 'E3' THEN 'Bilanzbuchhalter'
		WHEN 'E4' THEN 'Bilanzbuchhalter'
		WHEN 'E5' THEN 'Bilanzbuchhalter'
		WHEN 'E7' THEN 'Bilanzbuchhalter'
		WHEN 'E8' THEN 'Bilanzbuchhalter'
		WHEN 'E9' THEN 'Bilanzbuchhalter'
		WHEN 'U7' THEN 'Bilanzbuchhalter'
		WHEN 'XE' THEN 'Bilanzbuchhalter'
		WHEN 'EP' THEN 'Bilanzbuchhalter'
		WHEN 'XH' THEN 'Bilanzbuchhalter Zusatzqualifikation'
		WHEN 'E6' THEN 'Bilanzbuchhalter Zusatzqualifikation'
		WHEN 'H3' THEN 'Bilanzbuchhalter-International'
		WHEN 'H4' THEN 'Bilanzbuchhalter-International'
		WHEN 'H9' THEN 'Bilanzbuchhalter-International'
		WHEN 'HA' THEN 'Bilanzbuchhalter-International'
		WHEN 'HP' THEN 'Bilanzbuchhalter-International'
		WHEN '01' THEN 'Controller'
		WHEN 'D3' THEN 'Controller'
		WHEN 'D4' THEN 'Controller'
		WHEN 'D5' THEN 'Controller'
		WHEN 'D8' THEN 'Controller'
		WHEN 'D9' THEN 'Controller'
		WHEN 'DE' THEN 'Controller'
		WHEN 'PD' THEN 'Controller'
		WHEN 'XD' THEN 'Controller'
		WHEN 'A1' THEN 'Debitoren-/Kreditorenbuchhalter'
		WHEN 'A8' THEN 'Debitoren-/Kreditorenbuchhalter'
		WHEN 'N2' THEN 'Fachassistent Lohn und Gehalt'
		WHEN 'N3' THEN 'Fachassistent Lohn und Gehalt'
		WHEN 'N4' THEN 'Fachassistent Lohn und Gehalt'
		WHEN 'N5' THEN 'Fachassistent Lohn und Gehalt'
		WHEN 'N6' THEN 'Fachassistent Lohn und Gehalt'
		WHEN 'N9' THEN 'Fachassistent Lohn und Gehalt'
		WHEN 'XN' THEN 'Fachassistent Lohn und Gehalt'
		WHEN 'A2' THEN 'Finanzbuchhalter'
		WHEN 'A9' THEN 'Finanzbuchhalter'
		WHEN 'AB' THEN 'Finanzbuchhalter'
		WHEN 'H6' THEN 'IFRS Accountant'
		WHEN 'H5' THEN 'International Accountant'
		WHEN 'PE' THEN 'IT/SAP'
		WHEN 'A3' THEN 'Lohn- und Gehaltsbuchhalter'
		WHEN 'A7' THEN 'Lohn- und Gehaltsbuchhalter'
		WHEN 'AC' THEN 'Lohn- und Gehaltsbuchhalter'
		WHEN 'K1' THEN 'Onboarding Steuerkanzlei'
		WHEN 'PB' THEN 'Personal'
		WHEN 'PA' THEN 'Rechnungswesen/Steuern'
		WHEN 'B1' THEN 'Steuerberater'
		WHEN 'B2' THEN 'Steuerberater'
		WHEN 'B3' THEN 'Steuerberater'
		WHEN 'B4' THEN 'Steuerberater'
		WHEN 'B5' THEN 'Steuerberater'
		WHEN 'B6' THEN 'Steuerberater'
		WHEN 'B7' THEN 'Steuerberater'
		WHEN 'B8' THEN 'Steuerberater'
		WHEN 'BA' THEN 'Steuerberater'
		WHEN 'BC' THEN 'Steuerberater'
		WHEN 'BP' THEN 'Steuerberater'
		WHEN 'U8' THEN 'Steuerberater'
		WHEN 'XB' THEN 'Steuerberater'
		WHEN 'XF' THEN 'Steuerberater'
		WHEN 'A4' THEN 'Steuerfachangestellter'
		WHEN 'C1' THEN 'Steuerfachwirt'
		WHEN 'C2' THEN 'Steuerfachwirt'
		WHEN 'C3' THEN 'Steuerfachwirt'
		WHEN 'C4' THEN 'Steuerfachwirt'
		WHEN 'C5' THEN 'Steuerfachwirt'
		WHEN 'C6' THEN 'Steuerfachwirt'
		WHEN 'C9' THEN 'Steuerfachwirt'
		WHEN 'U9' THEN 'Steuerfachwirt'
		WHEN 'XC' THEN 'Steuerfachwirt'
		WHEN 'F2' THEN 'Wirtschaftsfachwirt'
		WHEN 'F3' THEN 'Wirtschaftsfachwirt'
		WHEN 'F4' THEN 'Wirtschaftsfachwirt'
		WHEN 'F5' THEN 'Wirtschaftsfachwirt'
		WHEN 'F8' THEN 'Wirtschaftsfachwirt'
		WHEN 'F9' THEN 'Wirtschaftsfachwirt'
		WHEN 'W4' THEN 'Wirtschaftsprüfer'
		WHEN 'W5' THEN 'Wirtschaftsprüfer'
		WHEN 'XW' THEN 'Wirtschaftsprüfer'
		WHEN 'M8' THEN 'TaxMaster'
		WHEN 'CI' THEN 'CINA'
		WHEN 'XU' THEN 'CINA'
		WHEN 'CK' THEN 'CINA Konsolidierung'
		WHEN 'SP' THEN 'CINA Specialist'
		WHEN 'GK' THEN 'IFRS'
		WHEN 'KK' THEN 'IFRS'
		WHEN 'ON' THEN 'IFRS'
		WHEN 'VS' THEN 'IFRS'
		WHEN 'US' THEN 'US-GAAP'
		WHEN 'UZ' THEN 'US-GAAP Specialist'
		ELSE 'Sonstige'
	END Fachgebiet_Neu,
	-- Neu ab 30.08.2022 Vorlagen werden direkt aus dem Freitextfeld kursauswahl19 aus der Tabelle Kurse_freideffelder gezogen
	kf.kursauswahl19 VLG,
	-- NEU AB 05.10.2022 case  Block, welcher die Veranstaltungsnummer der Hörsaale generiert hat, wurde entfernt (siehe Archiv) - TK
	-- NEU AB 05.10.2022 Veranstaltungsort Nummern werden aus der Tabelle BCVeranstaltungsnummer gejoint - TK
	-- NEU AB 05.10.2022 STFS Hörsälle bekommen die selbe Vorlagennummer wie Ihre Hauptveranstaltungsorte (siehe Tabelle BCVeranstaltungsnummer) - TK
	BCVeranstaltungsnummer.BCNummer AS [Veranstaltungsort Nr],
	kf.kursauswahl20 as Rechtsstand
FROM
	kurse k
	-- NEU AB 15.07.2022 Join Kursort Tablle um auf Strasse zuzugreifen, damit die BCNummern eindeutig hinzugefügt werden können - TK
	LEFT JOIN Kursgruppe kg ON k.NR = kg.Unterkurs 
	LEFT JOIN Kursorte ON k.ORT = KURSORTE.MKTEXT
	-- NEU AB 05.10.2022 Die Tabelle BCVeransatltungsnummer wird gejoint, um die Veranstaltungsort Nr aus BC zu bekommen - TK
	JOIN kurse_freideffelder kf ON k.NR = kf.nr 
	-- NEU AB 22.07.2022 Ausfall Kurse werden mit Exportiert - TK
	LEFT JOIN BCVeranstaltungsnummer ON Kursorte.NR = BCVeranstaltungsnummer.KuferNummer
WHERE
	k.BEGINN_DAT >= '01.01.2017'
	AND (k.FACHB NOT IN ('OR', 'VE', 'X'))
	AND k.mandant IN (1, 2, 3)
ORDER BY
	2