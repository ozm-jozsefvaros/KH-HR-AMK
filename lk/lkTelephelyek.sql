SELECT tTelephelyek230301.Sorsz�m, tTelephelyek230301.Irsz, tTelephelyek230301.V�ros, tTelephelyek230301.C�m, tTelephelyek230301.Tulajdonos, tTelephelyek230301.�zemeltet�, IIf([Nexon c�m]="" Or IsNull([Nexon c�m]),([Irsz] & " " & [V�ros] & ", " & IIf(Left([Irsz],1)=1,num2num(Mid([Irsz],2,2),10,99) & ". ker�let, ","") & [C�m]),[Nexon c�m]) AS C�m_Szem�lyek
FROM tTelephelyek230301;
