SELECT lkMunkahelyC�mN�lk�liek.F�oszt�ly, Count(lkMunkahelyC�mN�lk�liek.Link) AS db
FROM lkMunkahelyC�mN�lk�liek
GROUP BY lkMunkahelyC�mN�lk�liek.F�oszt�ly;
