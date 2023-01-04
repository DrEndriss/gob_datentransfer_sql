use Kufer_Reporting

select kommunikation.id,cast(kommunikation.nr as int) Nr, kommunikation.Typ, bezeichner, wert, art, kommunikation.Sort, wert_ziffern from KOMMUNIKATION inner join adr_pers on kommunikation.nr = ADR_PERS.ID where kommunikation.Typ in ('P', 'A') and wert <>'' order by 2