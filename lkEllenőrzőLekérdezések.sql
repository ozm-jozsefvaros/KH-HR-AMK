SELECT tEllenőrzőLekérdezések.azEllenőrző, tEllenőrzőLekérdezések.EllenőrzőLekérdezés, tEllenőrzőLekérdezések.azETípus
FROM tEllenőrzőLekérdezések
WHERE (((tEllenőrzőLekérdezések.Kimenet)=False));
