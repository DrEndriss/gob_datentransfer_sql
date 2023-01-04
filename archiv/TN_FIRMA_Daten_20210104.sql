select ff.TNR, ff.name, ff.firma, z.name, ff.anm_datumselect b.TNR, t.name tn_name, b.firma, f.name fn_name, max(b.anm_datum) anm_datum

from BELEGUNG b join TEILNEHM t on t.nr = b.TNR join TEILNEHM f on b.FIRMA = f.NR

where b.FIRMA > 0 and b.ANM_DATUM >= '01.01.2015'

group by

b.TNR, t.name, b.firma, f.name

order by b.TNR
