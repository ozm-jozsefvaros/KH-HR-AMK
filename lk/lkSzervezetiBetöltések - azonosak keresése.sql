SELECT First(lkSzervezetiBet�lt�sek.[St�tusz�nak k�dja]) AS [St�tusz�nak k�dja Mez�], Count(lkSzervezetiBet�lt�sek.[St�tusz�nak k�dja]) AS AzonosakSz�ma
FROM lkSzervezetiBet�lt�sek
GROUP BY lkSzervezetiBet�lt�sek.[St�tusz�nak k�dja]
HAVING (((Count(lkSzervezetiBet�lt�sek.[St�tusz�nak k�dja]))>1));
