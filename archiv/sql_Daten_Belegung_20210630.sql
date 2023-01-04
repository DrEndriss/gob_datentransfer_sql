use Kufer_Reporting

select b.ID
	  ,b.[KNR]
      ,b.[TNR]
   
      ,b.[ZAHLART]
      ,b.[ENTGELT]
      ,b.[BET_OFFEN]
      ,b.[BELEGNR]
      ,isnull(b.[MAHNNR],'') MAHNNR
      ,b.[BMS]
	   ,case when RCHG_DATUM IS NULL or year (RCHG_DATUM) =1899 THEN ''
	   else convert(varchar(23),RCHG_DATUM,121)
	   end as RCHG_DATUM
      ,iif(b.[STATUS_1]='L','I',b.status_1)[STATUS_1]
 
      ,replace(b.[BEMERKUNG],';',',') [BEMERKUNG]
      ,b.[ANM_DATUM]
	   ,case when teil_datum IS NULL or year (teil_datum) =1899 THEN ''
	   else convert(varchar(23),TEIL_DATUM,121)
	   end as TEIL_DATUM
      
      ,b.[BEARBEITER]
      ,b.[DGFHDGH]
      ,b.[FIRMA]
      ,isnull(b.[RCHGNR],0) [RCHGNR]
      ,b.[ANMELDEART]   
      ,b.[RATENZAHLUNGJN]
	   ,case when [gekuendigt_zum] IS NULL or year ([gekuendigt_zum]) =1899 THEN ''
	   else convert(varchar(23),[gekuendigt_zum],121)
	   end as [gekuendigt_zum] 
	   ,case when [gekuendigt_am] IS NULL or year ([gekuendigt_am]) =1899 THEN ''
	   else convert(varchar(23),[gekuendigt_am],121)
	   end as [gekuendigt_am] 

      ,isnull(b.[gekuendigt_von],'') [gekuendigt_von]
      ,b.[BIC]
      ,b.[IBAN]
      ,b.[Erm_Grund]     
      ,b.[Bemerk_Ext]
      ,isnull(b.[MahnSperreJN],'') [MahnSperreJN]
      ,case when [MahnSperreBis] IS NULL or year ([MahnSperreBis]) =1899 THEN ''
	   else convert(varchar(23),[MahnSperreBis],121)
	   end as [MahnSperreBis]
      ,isnull(b.[MF_OK],'') [MF_OK]
      ,isnull(b.[abwzpid],'') [abwzpid]
      ,isnull(b.[info],'') [info]
      ,isnull(b.[gekuendigt_grd],'') [gekuendigt_grd]
      ,isnull(b.[gekuendigt_stat],'') [gekuendigt_stat]
      ,isnull(b.[storn_geb],0) [storn_geb]
      ,isnull(b.[abw_zahlreferenz],'') [abw_zahlreferenz]
      ,isnull(b.[anw_min_ignore],'') [anw_min_ignore]
	,iif(b.knr in(select Hauptkurs from Kursgruppe),b.knr,'') Hauptkurs 
from   BELEGUNG b 
where b.KNR in (select nr from kurse k where k.BEGINN_DAT >='01.01.2015')  and b.STATUS_1 not in ('1','2','','J','U','X')
order by anm_datum
