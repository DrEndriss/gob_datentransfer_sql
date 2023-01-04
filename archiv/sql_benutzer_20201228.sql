use kufer_reporting

select kennung, iif(vorname = '','', vorname + ' ') + name voll_Name, Stelle, anrede, telefon, EMAIL  from BENUTZER