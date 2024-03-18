SELECT lkSzem�lyek.Ad�jel, Max(lkSzem�lyek.[Jogviszony sorsz�ma]) AS [MaxOfJogviszony sorsz�ma], Max(lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)]) AS [MaxOfJogviszony kezdete (bel�p�s d�tuma)], First(lkSzem�lyek.Azonos�t�) AS azSzem�ly
FROM lkSzem�lyek
GROUP BY lkSzem�lyek.Ad�jel
ORDER BY lkSzem�lyek.Ad�jel, Max(lkSzem�lyek.[Jogviszony sorsz�ma]) DESC , Max(lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)]) DESC;
