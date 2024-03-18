PARAMETERS [__Sorszám] Value;
SELECT DISTINCTROW *
FROM ktSzervezetTelephely AS lkTelephelyek
WHERE ((([__Sorszám])=[azTelephely]));
