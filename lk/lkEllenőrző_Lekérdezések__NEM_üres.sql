SELECT tJav�tand�Mez�nevek.azJav�tand�, "SELECT '" 
        & [Ellen�rz�shez] & "' AS T�bla, '" 
        & [Eredeti] & "' AS Hi�nyz�_�rt�k, " 
        & [Ellen�rz�shez] & ".[Ad�azonos�t�], " 
        & [Ellen�rz�shez] & ".[�ll�shely azonos�t�], " 
        & [Ellen�rz�shez] & ".[" & [SzervezetK�d_mez�] & "] " AS [Select], "FROM [" & [Ellen�rz�shez] & "] " AS [From], "WHERE ([" & [Ellen�rz�shez] & "].[" & [Import] & "] Is Null " 
        & IIf([Sz�veg],"OR [" & [Ellen�rz�shez] & "].[" & [Import] & "]='') ",") ") 
        & IIf(IsNull([�res�ll�shelyMez�k]),""," AND ([" & [Ellen�rz�shez] & "].[" & [�res�ll�shelyMez�k] & "]<> '�res �ll�s' OR [" & [Ellen�rz�shez] & "].[" & [�res�ll�shelyMez�k] & "] is null ) ") AS [Where], tJav�tand�Mez�nevek.NemK�telez�, tJav�tand�Mez�nevek.NemK�telez��res�ll�shelyEset�n, [Select] & [From] & [Where] AS [SQL], Len([SQL]) AS Hossz, tJav�tand�Mez�nevek.Ellen�rz�shez
FROM tJav�tand�Mez�nevek
WHERE (((tJav�tand�Mez�nevek.NemK�telez�)=False) AND ((tJav�tand�Mez�nevek.Ellen�rz�shez) Is Not Null))
ORDER BY tJav�tand�Mez�nevek.azJav�tand�;
