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
isnull(k.KURSAUSWAHL9,'') as [Soll-Minuten]

 from KURSE k left outer join Kursgruppe kg on k.NR = kg.Unterkurs 

 where BEGINN_DAT >='01.01.2015' 

 and (k.FACHB not in ('OR', 'VE','X'))  



