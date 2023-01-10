USE STF_Endriss
SELECT
	kt.ID,
	kt.KNR,
	cast(CAST(kt.DATUM AS date) AS char(10)) DATUM,
	cast(CAST(kt.ZEIT_BEG AS time) AS char(5)) ZEIT_BEG,
	cast(CAST(kt.ZEIT_ENDE AS time) AS char(5)) ZEIT_ENDE,
	kt.ORT,
	kt.DNR,
	kt.BEARBEITER,
	kt.AUSF,
	kt.MINUTEN,
	kt.PAUSE,
	isnull(kt.MEDIEN1, '') MEDIEN1,
	isnull(kt.MEDIEN2, '') MEDIEN2,
	isnull(kt.MEDIEN3, '') MEDIEN3,
	isnull(kt.MEDIEN4, '') MEDIEN4,
	isnull(kt.MEDIEN5, '') MEDIEN5,
	isnull(kt.MEDIEN6, '') MEDIEN6,
	isnull(kt.MEDIEN7, '') MEDIEN7,
	isnull(kt.MEDIEN8, '') MEDIEN8,
	isnull(kt.MEDIEN9, '') MEDIEN9,
	kt.BEARBDATUM,
	kt.WOTAG,
	REPLACE(kt.TEXT, ';', ',') TEXT,
	isnull(kt.QualiID, '') QualiID,
	isnull(kt.gh_versendung, '') gh_versendung,
	isnull(kt.kosten, '0') kosten,
	isnull(kt.il_anw_ok, '') il_anw_ok,
	isnull(kt.erfasstam, '') erfasstam,
	isnull(kt.erfasstvon, '') erfasstvon,
	isnull(
		REPLACE(cast(kt.medientext AS varchar(2000)), ';', ','),
		''
	) medientext,
	isnull(kt.geprueft, '') geprueft,
	isnull(kt.keine_raum_ue, '') keine_raum_ue,
	isnull(kt.bestuhlung, '') bestuhlung,
	isnull(kt.kosten2, '') kosten2,
	isnull(kt.kosten3, '') kosten3,
	isnull(kt.kosten4, '') kosten4,
	isnull(kt.kosten5, '') kosten5,
	isnull(kt.kosten6, '') kosten6,
	isnull(kt.rechnungseingang, '') rechnungseingang,
	kt.kurstagGUID,
	isnull(kt.zuspaetabgesagt, '') zuspaetabgesagt,
	-- NEU AB 15.07.2022 Nummern wurden an die aktuellen Nummern aus BC angepasst, die selben Hörsaale kommen mehrmals vor.. - TK
	-- NEU AB 15.07.2022 Es wurden neue Hörsälle hinzufügt - TK
	-- NEU AB 06.10.2022 Die Veranstltungsortnummern werden aus der Tabelle BCVeranstaltungsnummer gejoint - TK
	-- NEU AB 06.10.2022 case Abfrage für die Veranstaltungsortnummer wurde entfernt (siehe Archiv) -TK
	b.BCNummer AS [Veranstaltungsort Nr.],
	-- NEU AB 06.10.2022 Neu Hörsäe hinzugefügt UND Frankfurt Hörsälle nach Straßen unterteilen, weil es 2*Hörsaal 1 & 2 gibt - TK
	-- NEU AB 13.10.2022 Die Hörsälle für Berlin wurden hinzugefügt
	isnull (
		CASE
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND upper(kt.ORT) LIKE '%DÜSSELDORF%' THEN 'DÜ - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND upper(kt.ORT) LIKE '%DÜSSELDORF%' THEN 'DÜ - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND upper(kt.ORT) LIKE '%FRANKFURT%'
			AND ko.STRASSE LIKE '%Han%' THEN 'FR - Han - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND upper(kt.ORT) LIKE '%FRANKFURT%'
			AND ko.STRASSE LIKE '%Dar%' THEN 'FR - Dar - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND upper(kt.ORT) LIKE '%FRANKFURT%'
			AND ko.STRASSE LIKE '%Han%' THEN 'FR - Han - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND upper(kt.ORT) LIKE '%FRANKFURT%'
			AND ko.STRASSE LIKE '%Dar%' THEN 'FR - Dar - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL III'
			AND upper(kt.ORT) LIKE '%FRANKFURT%' THEN 'FR - HS III'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL IV'
			AND upper(kt.ORT) LIKE '%FRANKFURT%' THEN 'FR - HS IV'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND upper(kt.ORT) LIKE '%HANNOVER%' THEN 'HA - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND upper(kt.ORT) LIKE '%HANNOVER%' THEN 'HA - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND upper(kt.ORT) LIKE '%HAMBURG%' THEN 'HH - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND upper(kt.ORT) LIKE '%HAMBURG%' THEN 'HH - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL III'
			AND upper(kt.ORT) NOT LIKE '%HÖRSAAL IV'
			AND upper(kt.ORT) LIKE '%HAMBURG%' THEN 'HH - HS III'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL III + IV%'
			AND upper(kt.ORT) LIKE '%HAMBURG%' THEN 'HH - HS III - IV'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL IV'
			AND upper(kt.ORT) NOT LIKE '%HÖRSAAL III'
			AND upper(kt.ORT) LIKE '%HAMBURG%' THEN 'HH - HS IV'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND upper(kt.ORT) LIKE '%KÖLN%' THEN 'KÖ - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND upper(kt.ORT) LIKE '%KÖLN%' THEN 'KÖ - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL III'
			AND upper(kt.ORT) LIKE '%KÖLN%' THEN 'KÖ - HS III'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL IV'
			AND upper(kt.ORT) LIKE '%KÖLN%' THEN 'KÖ - HS IV'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND upper(kt.ORT) LIKE '%MANNHEIM%' THEN 'MA - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND upper(kt.ORT) LIKE '%MANNHEIM%' THEN 'MA - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL III'
			AND upper(kt.ORT) LIKE '%MANNHEIM%' THEN 'MA - HS III'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND upper(kt.ORT) LIKE '%MÜNCHEN%' THEN 'MÜ - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND upper(kt.ORT) LIKE '%MÜNCHEN%' THEN 'MÜ - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL III'
			AND upper(kt.ORT) LIKE '%MÜNCHEN%' THEN 'MÜ - HS III'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND ko.STRASSE LIKE '%Kro%'
			AND upper(kt.ORT) LIKE '%STUTTGART%' THEN 'ST - Kro - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND ko.STRASSE LIKE '%Heil%'
			AND upper(kt.ORT) LIKE '%STUTTGART%' THEN 'ST - Heil - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND ko.STRASSE LIKE '%Kro%'
			AND upper(kt.ORT) LIKE '%STUTTGART%' THEN 'ST - Kro - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND ko.STRASSE LIKE '%Heil%'
			AND upper(kt.ORT) LIKE '%STUTTGART%' THEN 'ST - Heil - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL I'
			AND upper(kt.ORT) LIKE '%Berlin%' THEN 'BER - HS I'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL II'
			AND upper(kt.ORT) LIKE '%Berlin%' THEN 'BER - HS II'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL III'
			AND upper(kt.ORT) LIKE '%Berlin%' THEN 'BER - HS III'
			WHEN upper(kt.ORT) LIKE '%HÖRSAAL IV'
			AND upper(kt.ORT) LIKE '%Berlin%' THEN 'BER - HS IV'
			ELSE CASE
				WHEN isnull(kt.kosten, 0) BETWEEN 0
				AND 299 THEN 'RM 0-299 EURO'
				WHEN isnull(kt.kosten, 0) BETWEEN 300
				AND 499 THEN 'RM 300-499 EURO'
				WHEN isnull(kt.kosten, 0) BETWEEN 500
				AND 799 THEN 'RM 500-799 EURO'
				WHEN isnull(kt.kosten, 0) > 799 THEN 'RM 800-2000 EURO'
			END
		END,
		''
	) [BC-Code Raum (Nr.)],
	-- NEU AB 06.10.2022 Wenn es ein eigener Raum ist dann "true", ansonsten "false" - TK
	isnull (
		CASE
			WHEN BCNummer = '100000' THEN 'true'
			WHEN BCNummer = '100056' THEN 'true'
			WHEN BCNummer = '100070' THEN 'true'
			WHEN BCNummer = '100112' THEN 'true'
			WHEN BCNummer = '100151' THEN 'true'
			WHEN BCNummer = '100277' THEN 'true'
			WHEN BCNummer = '100336' THEN 'true'
			WHEN BCNummer = '100357' THEN 'true'
			WHEN BCNummer = '100403' THEN 'true'
		END,
		'false'
	) [Eigener Raum]
FROM
	KURStage kt
	JOIN Kurse k ON kt.KNR = k.NR
	LEFT JOIN KURSORTE AS ko ON kt.ORT = ko.MKTEXT
	LEFT JOIN BCVeranstaltungsnummer AS b ON ko.NR = b.KuferNummer
WHERE
	BEGINN_DAT >= '01.01.2017'
	AND (k.FACHB NOT IN ('OR', 'VE', 'X'))
	AND k.mandant IN (1, 2, 3)
ORDER BY
	kt.Datum