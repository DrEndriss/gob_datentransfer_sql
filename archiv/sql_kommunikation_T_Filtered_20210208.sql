use Kufer_Reporting

select kommunikation.id,kommunikation.nr, kommunikation.Typ, bezeichner, wert, art, sort, wert_ziffern from KOMMUNIKATION inner join teilnehm_ausw on kommunikation.nr = teilnehm_ausw.NR where kommunikation.Typ ='T' and wert <>'' order by 2