SELECT lkTelephelyekenDolgoz�k.Sorsz�m, lkTelephelyekenDolgoz�k.Irsz, lkTelephelyekenDolgoz�k.V�ros, lkTelephelyekenDolgoz�k.C�m, lkTelephelyekenDolgoz�k.F�oszt�ly, Sum(lkTelephelyekenDolgoz�k.L�tsz�m) AS L�tsz�m_
FROM lkTelephelyekenDolgoz�k
GROUP BY lkTelephelyekenDolgoz�k.Sorsz�m, lkTelephelyekenDolgoz�k.Irsz, lkTelephelyekenDolgoz�k.V�ros, lkTelephelyekenDolgoz�k.C�m, lkTelephelyekenDolgoz�k.F�oszt�ly
ORDER BY lkTelephelyekenDolgoz�k.Sorsz�m;
