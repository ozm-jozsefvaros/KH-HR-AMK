SELECT tIlletmények.*
FROM tIlletmények
WHERE (((tIlletmények.[Jv kezdete])<=#11/30/2023# Or (tIlletmények.[Jv kezdete]) Is Null) AND ((tIlletmények.[Jv vége])>="#2023. 11. 30.#" Or (tIlletmények.[Jv vége]) Is Null));
