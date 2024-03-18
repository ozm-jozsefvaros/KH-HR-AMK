SELECT [Adóazonosító]*1 AS Adójel, lk_Állománytáblákból_Illetmények.Illetmény, lk_Állománytáblákból_Illetmények.[Heti munkaórák száma], lk_Állománytáblákból_Illetmények.[Álláshely azonosító], [Illetmény]/IIf(Nz([Heti munkaórák száma],0)=0,0.00001,[Heti munkaórák száma])*40 AS Bruttó_bér, IIf([Bruttó_bér]<326000,Yes,No) AS Garantált_min_alatt
FROM lk_Állománytáblákból_Illetmények;
