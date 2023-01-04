use STF_Endriss

select 
t.nr [Kurs-Nr.]
,CAST(t.DATUM as date) Anlagedatum
,CAST(t.VORLAGE as date) Vorlagedatum
,t.TEXT Terminbemerkungen

,case 

when (t.art = 'F1') then
'individuelle Stornofrist'

else ''

end Stornofrist
,case 

when (t.art = 'F2') then
'Stornofrist 2 Wochen vor Kursstart Team zuweisen'

else ''

end [Stornofrist Team]

,case 

when (t.art = 'F3') then
'algm. Aufgaben 1 Woche vor Kursstart Team zuweisen'

else ''

end [Aufgaben Team]
,case 

when (t.art in( 'F4', 'F5', 'F6', 'F8')) then
iif(t.art ='F5', 'DK', 
iif(t.art = 'F6', 'VB',
iif(t.art = 'F8', 'MG','Team zuordnen')))

else ''

end [individuelle Wiedervorlage]
,t.art



from TERMINE t where t.NR in (select NR from KURSE  where BEGINN_DAT >= '01.01.2017' and KURZBEZ not like '%Ausfall%' and (FACHB not in ('OR', 'VE','X') ))

order by 1