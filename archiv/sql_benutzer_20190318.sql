use kufer_reporting

select kennung, iif(vorname = '','', vorname + ' ') + name, Stelle, anrede, telefon, EMAIL  from BENUTZER