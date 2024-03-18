SELECT mSyslkMezõnevek.MezõNév, lkEllenõrzõLekérdezések2csakLekérdezések.EllenõrzõLekérdezés
FROM lkEllenõrzõLekérdezések2csakLekérdezések LEFT JOIN mSyslkMezõnevek ON lkEllenõrzõLekérdezések2csakLekérdezések.EllenõrzõLekérdezés = mSyslkMezõnevek.QueryName
WHERE (((lkEllenõrzõLekérdezések2csakLekérdezések.EllenõrzõLekérdezés)=Forms!ûLekérdezésMezõTípusok!LekrédezésNeve)) Or (((lkEllenõrzõLekérdezések2csakLekérdezések.EllenõrzõLekérdezés) Like "*"))
ORDER BY lkEllenõrzõLekérdezések2csakLekérdezések.EllenõrzõLekérdezés, mSyslkMezõnevek.MezõNév;
