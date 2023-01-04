use Kufer_Reporting

select b.ID
	  ,b.[KNR]
      ,b.[TNR]
      ,b.[ZAHLNR]
      ,b.[ZAHLART]
      ,b.[ENTGELT]
      ,b.[BET_OFFEN]
      ,b.[BELEGNR]
      ,isnull(b.[MAHNNR],'') MAHNNR
      ,b.[BMS]
	   ,case when RCHG_DATUM IS NULL or year (RCHG_DATUM) =1899 THEN ''
	   else convert(varchar(23),RCHG_DATUM,121)
	   end as RCHG_DATUM
      ,b.[STATUS_1]
      ,b.[STATUS_2]
      ,b.[BEMERKUNG]
      ,b.[ANM_DATUM]
	   ,case when teil_datum IS NULL or year (teil_datum) =1899 THEN ''
	   else convert(varchar(23),TEIL_DATUM,121)
	   end as TEIL_DATUM
      ,isnull(b.[PAUSCHAL],0) PAUSCHAL
      ,b.[BEARBEITER]
      ,b.[DGFHDGH]
      ,b.[KASSENZ]
      ,b.[BANK]
      ,b.[KONTO]
      ,b.[BLZ]
      ,b.[KONTO_INH]
      ,b.[BETRAG]
      ,isnull(b.[WARTE_POOL],'') WARTE_POOL
      ,isnull(b.[TEIL_REAL],'') TEIL_REAL
      ,b.[BEARBDATUM]
      ,isnull(b.[SOFORTZAHL],'') SOFORTZAHL
	   ,case when [BFBRFGEDR1] IS NULL or year ([BFBRFGEDR1]) =1899 THEN ''
	   else convert(varchar(23),[BFBRFGEDR1],121)
	   end as [BFBRFGEDR1]
	   ,case when [BFBRFGEDR2] IS NULL or year ([BFBRFGEDR2]) =1899 THEN ''
	   else convert(varchar(23),[BFBRFGEDR2],121)
	   end as [BFBRFGEDR2]
	   ,case when [BFBRFGEDR3] IS NULL or year ([BFBRFGEDR3]) =1899 THEN ''
	   else convert(varchar(23),[BFBRFGEDR3],121)
	   end as [BFBRFGEDR3]
	   ,case when [BFBRFGEDR4] IS NULL or year ([BFBRFGEDR4]) =1899 THEN ''
	   else convert(varchar(23),[BFBRFGEDR4],121)
	   end as [BFBRFGEDR4]
	   ,case when [BFBRFGEDR5] IS NULL or year ([BFBRFGEDR5]) =1899 THEN ''
	   else convert(varchar(23),[BFBRFGEDR5],121)
	   end as [BFBRFGEDR5]
	   ,case when [BFBRFGEDR6] IS NULL or year ([BFBRFGEDR6]) =1899 THEN ''
	   else convert(varchar(23),[BFBRFGEDR6],121)
	   end as [BFBRFGEDR6]
	   ,case when [DRUCKZEUGNIS] IS NULL or year ([DRUCKZEUGNIS]) =1899 THEN ''
	   else convert(varchar(23),[DRUCKZEUGNIS],121)
	   end as [DRUCKZEUGNIS]	   	   	   	   	        
	   ,case when [DRUCKUEBERW] IS NULL or year ([DRUCKUEBERW]) =1899 THEN ''
	   else convert(varchar(23),[DRUCKUEBERW],121)
	   end as [DRUCKUEBERW]
	   ,case when [DRUCKANMELD] IS NULL or year ([DRUCKANMELD]) =1899 THEN ''
	   else convert(varchar(23),[DRUCKANMELD],121)
	   end as [DRUCKANMELD]
      ,b.[FIRMA]
      ,isnull(b.[RCHGNR],0) [RCHGNR]
      ,b.[ANMELDEART]
	   ,case when [EINTRITT] IS NULL or year ([EINTRITT]) =1899 THEN ''
	   else convert(varchar(23),[EINTRITT],121)
	   end as [EINTRITT]
	   ,case when [AUSTRITT] IS NULL or year ([AUSTRITT]) =1899 THEN ''
	   else convert(varchar(23),[AUSTRITT],121)
	   end as [AUSTRITT]   
      ,b.[RATENZAHLUNGJN]
	   ,case when [Platz_Bis] IS NULL or year ([Platz_Bis]) =1899 THEN ''
	   else convert(varchar(23),[Platz_Bis],121)
	   end as [Platz_Bis] 
      ,b.[HistorieKrit1]
      ,b.[HistorieKrit2]
      ,b.[HistorieKrit3]
      ,b.[HistorieKrit4]
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
      ,b.[abwzpid]
      ,isnull(b.[info],'') [info]
      ,isnull(b.[gekuendigt_grd],'') [gekuendigt_grd]
      ,isnull(b.[gekuendigt_stat],'') [gekuendigt_stat]
      ,case when [ausfall_am] IS NULL or year ([ausfall_am]) =1899 THEN ''
	   else convert(varchar(23),[ausfall_am],121)
	   end as [ausfall_am]
      ,isnull(b.[ausfall_von],'') [ausfall_von]
      ,isnull(b.[ausfall_grd],'') [ausfall_grd]
      ,isnull(b.[storn_geb],0) [storn_geb]
      ,isnull(b.[abw_zahlreferenz],'') [abw_zahlreferenz]
      ,isnull(b.[anw_min_ignore],'') [anw_min_ignore]
from   BELEGUNG b 
where b.KNR in (select nr from kurse k where k.SEMESTER  in('2015','2016','2017','2018','2019','2020','2021','2022','2023') and k.BEGINN_DAT >='01.01.2015')  
order by anm_datum
