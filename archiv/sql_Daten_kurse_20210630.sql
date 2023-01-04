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
k.AUSSENST,
k.SEMESTER,
k.AUSFALL,
k.KURZBEZ,
k.DAUERDETAI,
k.BEGINN,
k.ENDE,
k.GEBUEHR,
k.GEB_ART,
k.TEIL_MAX,
k.TEIL_MIN,
replace(k.WARNUNG,';',',') WARNUNG,
k.KURS_ART,
k.KART_KEY,
k.BEARBEITER,
k.VERLAUF,
k.BEARBDATUM,
k.ABW_ANRECHEN,
k.NSAMASSNAHME,
k.KURSAUSWAHL1,
k.KURSAUSWAHL4,
k.KURSAUSWAHL7,
Replace(k.TITEL,';',',') TITEL,
Replace(k.MATERIAL,';',',') MATERIAL,
replace(k.INTNOTIZ,';',',')INTNOTIZ,
k.Sofortzahl,
k.NeuerKurs,
k.InternetAktiv,
k.eLearningKursID,
isnull(k.material,'') material,
iif(k.NeuerKurs ='W','W','F') as 'Catering Ja/Nein',
iif(k.VERLAUF = 'E','W','F') as 'Erinnerungsmailing',
iif (kg.hauptkurs is null,iif(k.Nr not in (select Hauptkurs from kursgruppe),'V','H1'),'H2') as KursTyp,
isnull(k.KURSAUSWAHL8,'') as [Soll-UE],
isnull(k.KURSAUSWAHL9,'') as [Soll-Minuten]

 from KURSE k left outer join Kursgruppe kg on k.NR = kg.Unterkurs 

 where BEGINN_DAT >='01.01.2015' 

 and (k.FACHB not in ('OR', 'VE','X'))  



