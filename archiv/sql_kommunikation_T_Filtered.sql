use Kufer_Reporting

select kommunikation.id,kommunikation.nr, kommunikation.Typ, bezeichner, wert, art from KOMMUNIKATION inner join teilnehm on kommunikation.nr = teilnehm.NR where kommunikation.Typ ='T' and wert not in(isnull(mobil_anzeige,''), isnull(TEL_ANZEIGE,''), isnull(TEL2_ANZEIGE,''), isnull(FAX_ANZEIGE,''), isnull(Fax2_Anzeige,''), isnull(EMAIL_ANZEIGE,'')) order by kommunikation.nr