SELECT LétszámUnió.Sorszám, LétszámUnió.Név, LétszámUnió.Adóazonosító, LétszámUnió.[Születési év \ üres állás], LétszámUnió.Neme, LétszámUnió.[Járási Hivatal], LétszámUnió.Osztály, LétszámUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], LétszámUnió.[Ellátott feladat], LétszámUnió.Kinevezés, LétszámUnió.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], LétszámUnió.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], LétszámUnió.[Heti munkaórák száma], LétszámUnió.[Betöltés aránya], LétszámUnió.[Besorolási fokozat kód:], LétszámUnió.[Besorolási fokozat megnevezése:], LétszámUnió.[Álláshely azonosító], LétszámUnió.[Havi illetmény], LétszámUnió.[Eu finanszírozott], LétszámUnió.[Illetmény forrása], LétszámUnió.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], LétszámUnió.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], LétszámUnió.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], LétszámUnió.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], LétszámUnió.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], LétszámUnió.[Képesítést adó végzettség], LétszámUnió.KAB, LétszámUnió.[KAB 001-3** Branch ID]
FROM (SELECT *
FROM lkJárási_állomány
UNION SELECT *
FROM lkKormányhivatali_állomány
UNION SELECT *
FROM lkKözpontosítottak
)  AS LétszámUnió;
