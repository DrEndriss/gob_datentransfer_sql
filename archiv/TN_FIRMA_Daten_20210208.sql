use Kufer_Reporting

select ff.TNR, t.name tn_name, ff.firma, f.name fn_name

from BELEGUNG ff join TEILNEHM t on t.nr = ff.TNR join TEILNEHM f on ff.FIRMA = f.NR join Kurse k on k.nr = ff.knr

where ff.FIRMA > 0 and k.beginn_dat >= '01.01.2015'

group by

ff.TNR, t.name , ff.firma, f.name 

order by 1