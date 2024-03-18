SELECT tEgészségügyiSzolgáltatóAdatai02.*
FROM tEgészségügyiSzolgáltatóAdatai02
UNION SELECT tEgészségügyiSzolgáltatóAdatai01.*
FROM  tEgészségügyiSzolgáltatóAdatai01;
