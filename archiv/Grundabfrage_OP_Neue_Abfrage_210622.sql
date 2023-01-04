use STF_Endriss

SELECT z.knr, z.TNR Debitor,
iif(z.FAELLIGKEIT= '' or z.Faelligkeit is null or z.Faelligkeit = '30.12.1899','01.01.2099',convert(varchar(10),
cast(z.FAELLIGKEIT as date),104) )Fälligkeit,


--z.GEB_ART,

isnull(b.RCHGNR,0) Rechnungs_Nr,
isnull(b.MAHNNR,0) MahnNr ,
b.BMS Mahnstufe,
k.mandant,
sum(iif(z.soll_ist = 'S', (z.BETRAG), z.betrag * - 1)) OP_Deb_Ges_bei_Faelligkeit

FROM            zahlung z 
left join BELEGUNG b on b.ID = z.BELEGID
left join KURSE k on k.nr = z.KNR
--hier kommt noch die Fälligkeit rein

where  (b.BET_OFFEN <>0) and k.BEGINN_DAT >= '01.01.2017' and k.BEGINN_DAT <= '31.12.2035'  and b.RCHG_DATUM > '31.12.2016' 
and b.RCHG_DATUM <= '31.12.2035'
and UPPER(k.kurzbez) not like '%AUSFALL%'

GROUP BY z.knr, z.TNR,b.MAHNNR, b.BMS, b.RCHGNR,k.mandant, z.FAELLIGKEIT, b.BET_OFFEN
having (sum(iif(z.soll_ist = 'S', (z.BETRAG), z.betrag * - 1)) <>0) and b.BET_OFFEN >0

--OR sum(iif(z.soll_ist = 'S', (z.BETRAG), z.betrag * - 1)) <-0.01)

order by 1,2,z.FAELLIGKEIT