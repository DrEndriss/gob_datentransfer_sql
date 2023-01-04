select ff.TNR, ff.name, ff.firma, z.name, ff.anm_datum

from

(

select y.tnr, teilnehm.name, y.ANM_DATUM, y.firma

from (
select f.tnr, f.anm_datum, f.firma

from (
select tnr, max(anm_datum) as anm_datum  from belegung where firma > 0  group by tnr
) as x inner join belegung as f on f.tnr = x.tnr and f.anm_datum = x.anm_datum where firma > 0) as y inner join teilnehm on y.tnr = teilnehm.nr

) as ff inner join teilnehm as z on ff.firma = z.nr order by tnr

