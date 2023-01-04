Select f.nr, min(f.kennz) as Mandant from

(select nr, min(bearbdatum) as bearbdatum from kennz_ad where typ = 'T' and kennz in (1,2,3,4,5) group by nr) as x inner join 

(select nr, bearbdatum, kennz, typ from kennz_ad where kennz in (1,2,3,4,5) and Typ = 'T') as f on x.nr = f.nr and x.bearbdatum = f.bearbdatum group by f.nr order by nr