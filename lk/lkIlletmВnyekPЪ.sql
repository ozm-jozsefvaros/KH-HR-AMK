SELECT tIlletm�nyek.*
FROM tIlletm�nyek
WHERE (((tIlletm�nyek.[Jv kezdete])<=#11/30/2023# Or (tIlletm�nyek.[Jv kezdete]) Is Null) AND ((tIlletm�nyek.[Jv v�ge])>="#2023. 11. 30.#" Or (tIlletm�nyek.[Jv v�ge]) Is Null));
