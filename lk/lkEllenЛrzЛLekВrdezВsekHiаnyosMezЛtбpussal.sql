SELECT lkLek�rdez�sekMez�inekSz�ma.Ellen�rz�Lek�rdez�s, lkLek�rdez�sekMez�inekSz�ma.CountOfAttribute, lkEllen�rz�Lek�rdez�sekT�pusolMez�inekSz�ma.CountOfMez�Neve, lkEllen�rz�Lek�rdez�sekT�pusolMez�inekSz�ma.Ellen�rz�Lek�rdez�s
FROM lkLek�rdez�sekMez�inekSz�ma RIGHT JOIN lkEllen�rz�Lek�rdez�sekT�pusolMez�inekSz�ma ON lkLek�rdez�sekMez�inekSz�ma.Ellen�rz�Lek�rdez�s = lkEllen�rz�Lek�rdez�sekT�pusolMez�inekSz�ma.Ellen�rz�Lek�rdez�s
WHERE (((lkEllen�rz�Lek�rdez�sekT�pusolMez�inekSz�ma.CountOfMez�Neve)<[CountOfAttribute]));
