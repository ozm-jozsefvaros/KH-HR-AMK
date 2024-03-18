SELECT lkMunkahelyCímNélküliek.Fõosztály, Count(lkMunkahelyCímNélküliek.Link) AS db
FROM lkMunkahelyCímNélküliek
GROUP BY lkMunkahelyCímNélküliek.Fõosztály;
