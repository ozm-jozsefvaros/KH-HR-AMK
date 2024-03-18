SELECT lkMeghagyásEredmény.munkakör, 0 AS A, Count(lkMeghagyásEredmény.[TAJ szám]) AS B, 0-Count([lkMeghagyásEredmény].[TAJ szám]) AS C
FROM lkMeghagyásEredmény
GROUP BY lkMeghagyásEredmény.munkakör, 0, 0;
