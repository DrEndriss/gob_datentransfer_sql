use STF_Endriss


select ao.tnr, ao.knr,ah.kurzbez, IIF((substring(RIGHT(ao.knr,5),1,2)= SUBSTRING(ah.knr,2,2)) , 
ah.knr,'NIX') Hauptkurs, cast(V_Termin as date) Datum,ao.text,
iif(SUBSTRING(ao.TEXT,18,4)='',Iif(SUBSTRING(ao.knr,8,1)in('A','B'),'20' + cast((cast(SUBSTRING(ao.knr,9,2) as integer)-1) as varchar),'20' + 
SUBSTRING(ao.knr,9,2)),SUBSTRING(ao.TEXT,18,4)) as  Rechtsstand,  substring(ao.text, 12,1) LP, '' [EASY-ID]   from dbo.fl_vt_tn_orga_alle ao
left  join dbo.fl_vt_tn_HK_alle aH on ao.tnr=ah.tnr

where ao.v_termin>='01.10.2017'  
group by

ao.tnr, ao.knr,ao.V_Termin,ao.text,ah.kurzbez, IIF( (substring(RIGHT(ao.knr,5),1,2)= SUBSTRING(ah.knr,2,2)) , ah.knr,'NIX'), ah.knr



having (IIF((substring(RIGHT(ao.knr,5),1,2)= SUBSTRING(ah.knr,2,2)) , ah.knr,'NIX') <>'NIX')

order by 1