SELECT tMentess�gek.*, [Csal�dn�v] & " " & [Ut�n�v] AS N�v, IIf([Sz�let�si hely] Like "Budapest*","Budapest",[Sz�let�si hely]) AS Sz�lHely
FROM tMentess�gek;
