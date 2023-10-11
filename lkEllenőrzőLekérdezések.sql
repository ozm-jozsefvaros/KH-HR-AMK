SELECT tEllenõrzõLekérdezések.azEllenõrzõ, tEllenõrzõLekérdezések.EllenõrzõLekérdezés, tEllenõrzõLekérdezések.azETípus
FROM tEllenõrzõLekérdezések
WHERE (((tEllenõrzõLekérdezések.Kimenet)=False));
