SELECT lkFunkci�kSzerintiL�tsz�mok01.Funkci�ja, lkFunkci�kSzerintiL�tsz�mok01.V�gzetts�g, lkFunkci�kSzerintiL�tsz�mok01.Vezet�, lkFunkci�kSzerintiL�tsz�mok01.Jogviszony AS Jogviszony, lkFunkci�kSzerintiL�tsz�mok01.L�tsz�m, Round([L�tsz�m]*4838/(Select sum([L�tsz�m]) from lkFunkci�kSzerintiL�tsz�mok01),1) AS Statisztikai
FROM lkFunkci�kSzerintiL�tsz�mok01;
