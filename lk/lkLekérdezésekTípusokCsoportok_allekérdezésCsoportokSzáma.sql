SELECT Count(DistinctlkLek�rdez�sekT�pusokCsoportok.azUnion) AS AlLek�rdez�sCsoportokSz�ma
FROM (SELECT DISTINCT lkLek�rdez�sekT�pusokCsoportok.[azUnion] FROM lkLek�rdez�sekT�pusokCsoportok WHERE (((lkLek�rdez�sekT�pusokCsoportok.[azUnion]) Is Not Null)))  AS DistinctlkLek�rdez�sekT�pusokCsoportok;
