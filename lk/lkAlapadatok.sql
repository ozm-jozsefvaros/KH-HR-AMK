SELECT tAlapadatok.azAlapadat, tAlapadatok.TulajdonságNeve, tAlapadatok.TulajdonságÉrték, tAlapadatok.Objektum, tAlapadatok.ObjektumTípus
FROM tAlapadatok
WHERE (((tAlapadatok.TulajdonságNeve) Like "*" & [TempVars]![TulNeve] & "*") AND ((tAlapadatok.Objektum) Like "*" & [TempVars]![Obj] & "*") AND ((tAlapadatok.ObjektumTípus) Like "*" & [TempVars]![ObjTip] & "*"));
