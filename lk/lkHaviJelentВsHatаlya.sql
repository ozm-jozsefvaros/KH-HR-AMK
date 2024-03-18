SELECT TOP 1 tHaviJelentésHatálya.hatálya
FROM tHaviJelentésHatálya
GROUP BY tHaviJelentésHatálya.hatálya
ORDER BY First(tHaviJelentésHatálya.[rögzítés]) DESC;
