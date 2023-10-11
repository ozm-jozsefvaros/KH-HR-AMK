SELECT lkAIKiosk01.Azonosító, Count(lkAIKiosk01.Azonosító) AS db
FROM lkAIKiosk01
GROUP BY lkAIKiosk01.Azonosító;
