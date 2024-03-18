SELECT tBesorolásVáltoztatások.*
FROM tBesorolásVáltoztatások
WHERE (((tBesorolásVáltoztatások.Azonosító)=(Select Top 1 Azonosító from [tBesorolásVáltoztatások] as tmp Where tmp.[ÁlláshelyAzonosító]=[tBesorolásVáltoztatások].[ÁlláshelyAzonosító] Order By  tmp.hatály Desc)));
