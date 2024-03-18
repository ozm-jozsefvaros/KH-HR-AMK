SELECT *
FROM lkEngedélyezettésLétszámKimenet02
WHERE ((([Fõosztály]) Like 'Nyugd*' Or ([Fõosztály]) Like "Egész*")) OR ((([Fõosztály]) Like "* V.*"))
ORDER BY Fõosztály, [Oszt];
