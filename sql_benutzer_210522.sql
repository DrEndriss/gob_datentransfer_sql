use STF_Endriss

select  kennung, iif(vorname = '','', vorname + ' ') + name voll_Name, Stelle, anrede, telefon, EMAIL, id, name, vorname,(UPPER(SUBSTRING(Vorname,1,1)) + Upper(name)) BC_Code  
from BENUTZER

