SELECT *
FROM (SELECT 1 as sor, lkVárosKerületenkéntiFõosztályonkéntiLétszám02.*
FROM lkVárosKerületenkéntiFõosztályonkéntiLétszám02
UNION
SELECT 2 as sor, lkVárosKerületenkéntiFõosztályonkéntiLétszám03.*
FROM  lkVárosKerületenkéntiFõosztályonkéntiLétszám03)  AS 02ÉS03;
