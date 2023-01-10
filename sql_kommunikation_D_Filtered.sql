use STF_Endriss

select kommunikation.id,kommunikation.nr, kommunikation.Typ, bezeichner, wert, art, sort, wert_ziffern 
from KOMMUNIKATION inner join dozenten_ausw on kommunikation.nr = DOZENTEN_ausw.NR 
where kommunikation.Typ ='D' and wert <>'' 
order by 2