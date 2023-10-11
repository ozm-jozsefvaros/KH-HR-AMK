SELECT tTelephelyek230301.Sorszám, tTelephelyek230301.Irsz, tTelephelyek230301.Város, tTelephelyek230301.Cím, tTelephelyek230301.Tulajdonos, tTelephelyek230301.Üzemeltetõ, IIf([Nexon cím]="" Or IsNull([Nexon cím]),([Irsz] & " " & [Város] & ", " & IIf(Left([Irsz],1)=1,num2num(Mid([Irsz],2,2),10,99) & ". kerület, ","") & [Cím]),[Nexon cím]) AS Cím_Személyek
FROM tTelephelyek230301;
