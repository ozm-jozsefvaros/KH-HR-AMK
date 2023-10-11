SELECT [Adóazonosító]*1 AS Adójel, lk_Állománytáblákból_Illetmények.Illetmény, lk_Állománytáblákból_Illetmények.[Heti munkaórák száma], lk_Állománytáblákból_Illetmények.[Álláshely azonosító], [Illetmény]/[Heti munkaórák száma]*40 AS Bruttó_bér, IIf([Bruttó_bér]<296400,Yes,No) AS Garantált_min_alatt
FROM lk_Állománytáblákból_Illetmények;
