SELECT (Select count(azJavítandó) From lk_Lekérdezésíró__Illetmény_nulla_01 as Tmp where Tmp.azJavítandó <= külsõ.azJavítandó) AS Sorszám, külsõ.azJavítandó, külsõ.[Nexon mezõ megnevezése], külsõ.Tábla, külsõ.Ellenõrzéshez, külsõ.Import, külsõ.SQL, külsõ.Adó
FROM lk_Lekérdezésíró__Illetmény_nulla_01 AS külsõ;
