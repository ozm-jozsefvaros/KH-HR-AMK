DELETE tNexonAzonosítók.Azonosító
FROM tNexonAzonosítók
WHERE (((tNexonAzonosítók.Azonosító) In (Select FirstOfAzonosító From [tNexonAzonosítók - azonosak keresése])));
