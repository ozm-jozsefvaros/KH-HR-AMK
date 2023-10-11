SELECT lkSzemélyek.Adójel, lkSzemélyek.[Státusz típusa]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz típusa]) Like "Szer*" Or (lkSzemélyek.[Státusz típusa]) Like "Közp*"));
