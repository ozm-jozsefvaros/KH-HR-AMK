SELECT tAlapadatok.azAlapadat, tAlapadatok.Tulajdons�gNeve, tAlapadatok.Tulajdons�g�rt�k, tAlapadatok.Objektum, tAlapadatok.ObjektumT�pus
FROM tAlapadatok
WHERE (((tAlapadatok.Tulajdons�gNeve) Like "*" & [TempVars]![TulNeve] & "*") AND ((tAlapadatok.Objektum) Like "*" & [TempVars]![Obj] & "*") AND ((tAlapadatok.ObjektumT�pus) Like "*" & [TempVars]![ObjTip] & "*"));
