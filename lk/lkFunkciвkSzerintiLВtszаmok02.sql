SELECT lkFunkciókSzerintiLétszámok01.Funkciója, lkFunkciókSzerintiLétszámok01.Végzettség, lkFunkciókSzerintiLétszámok01.Vezetõ, lkFunkciókSzerintiLétszámok01.Jogviszony AS Jogviszony, lkFunkciókSzerintiLétszámok01.Létszám, Round([Létszám]*4838/(Select sum([Létszám]) from lkFunkciókSzerintiLétszámok01),1) AS Statisztikai
FROM lkFunkciókSzerintiLétszámok01;
