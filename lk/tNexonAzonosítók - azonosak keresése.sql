SELECT tNexonAzonosítók.[Személy azonosító], tNexonAzonosítók.[HR kapcsolat azonosító], First(tNexonAzonosítók.[Azonosító]) AS FirstOfAzonosító
FROM tNexonAzonosítók
GROUP BY tNexonAzonosítók.[Személy azonosító], tNexonAzonosítók.[HR kapcsolat azonosító]
HAVING (((tNexonAzonosítók.[Személy azonosító]) In (SELECT [Személy azonosító] FROM [tNexonAzonosítók] As Tmp GROUP BY [Személy azonosító],[HR kapcsolat azonosító] HAVING Count(*)>1  And [HR kapcsolat azonosító] = [tNexonAzonosítók].[HR kapcsolat azonosító])))
ORDER BY tNexonAzonosítók.[Személy azonosító], tNexonAzonosítók.[HR kapcsolat azonosító], First(tNexonAzonosítók.[Azonosító]) DESC;
