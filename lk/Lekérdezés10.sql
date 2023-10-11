SELECT tEllenõrzõLekérdezések.azEllenõrzõ, tEllenõrzõLekérdezések.EllenõrzõLekérdezés, tKimenetLapjai.strLapNév, tKimenetLapjai.strStílus, tKimenetLapjai.strLapFajta, tKimenetLapjai.azKimenetLap, tEllenõrzõLekérdezések.Kimenet, tKimenetLapjai.azKimenet
FROM tEllenõrzõLekérdezések LEFT JOIN tKimenetLapjai ON tEllenõrzõLekérdezések.azEllenõrzõ = tKimenetLapjai.azKimenetForrás
WHERE (((tEllenõrzõLekérdezések.Kimenet)=Yes));
