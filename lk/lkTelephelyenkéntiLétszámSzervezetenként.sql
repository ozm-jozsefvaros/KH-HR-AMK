SELECT lkTelephelyekenDolgozók.Sorszám, lkTelephelyekenDolgozók.Irsz, lkTelephelyekenDolgozók.Város, lkTelephelyekenDolgozók.Cím, lkTelephelyekenDolgozók.Fõosztály, Sum(lkTelephelyekenDolgozók.Létszám) AS Létszám_
FROM lkTelephelyekenDolgozók
GROUP BY lkTelephelyekenDolgozók.Sorszám, lkTelephelyekenDolgozók.Irsz, lkTelephelyekenDolgozók.Város, lkTelephelyekenDolgozók.Cím, lkTelephelyekenDolgozók.Fõosztály
ORDER BY lkTelephelyekenDolgozók.Sorszám;
