TRANSFORM Count(lkSzemélyek.azonosító) AS CountOfadójel
SELECT "BFKH.1" AS Kif1, "Összesen:" AS [Fõosztály ill hivatal]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Státusz típusa]) Is Not Null))
GROUP BY "Összesen:"
PIVOT lkSzemélyek.[Iskolai végzettség foka] In ("","Általános iskola 8 osztály","Egyetemi /felsõfokú (MA/MsC) vagy osztatlan képz.","Éretts.biz.szakképes-vel,képesítõ biz.","Éretts.biz.Szakkép-vel,éretts.ép. iskr-ben szakkép","Érettségi biz. szakképesítés nélk (pl: gimn.ér.)","Felsõokt-i (felsõfokú) szakképzésben szerzett biz.","Fõiskolai vagy felsõfokú alapképzés (BA/BsC)okl.","Gimnázium","Szakiskola","Szakképzettség érettségi bizonyítvány nélkül","Szakközépiskola","Szakmunkásképzõ iskola","Technikum");
