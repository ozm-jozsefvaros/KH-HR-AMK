SELECT Fedlapr�l�ll�shelyekUni�.T�bla, Fedlapr�l�ll�shelyekUni�.Azonos�t�, Fedlapr�l�ll�shelyekUni�.[Az �ll�shely megynevez�se], Fedlapr�l�ll�shelyekUni�.[�ll�shely sz�ma], *
FROM (SELECT *, "Alapl�tsz�m" as T�bla
FROM Fedlapr�lL�tsz�mt�bla
UNION
SELECT *, "K�zpontos�tott" as T�bla
FROM Fedlapr�lL�tsz�mt�bla2
)  AS Fedlapr�l�ll�shelyekUni�
ORDER BY Fedlapr�l�ll�shelyekUni�.T�bla, Fedlapr�l�ll�shelyekUni�.Azonos�t�;
