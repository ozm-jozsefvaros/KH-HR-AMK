SELECT tBesorol�sV�ltoztat�sok.*
FROM tBesorol�sV�ltoztat�sok
WHERE (((tBesorol�sV�ltoztat�sok.Azonos�t�)=(Select Top 1 Azonos�t� from [tBesorol�sV�ltoztat�sok] as tmp Where tmp.[�ll�shelyAzonos�t�]=[tBesorol�sV�ltoztat�sok].[�ll�shelyAzonos�t�] Order By  tmp.hat�ly Desc)));
