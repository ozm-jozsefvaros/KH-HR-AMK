SELECT [�ll�shely azonos�t�], Mez�4, [Besorol�si fokozat megnevez�se:], [�NYR SZERVEZETI EGYS�G AZONOS�T�], [Besorol�si fokozat k�d:], "A" as Jelleg, Mez�14 as Bet�lt�sAr�nya
                      FROM J�r�si_�llom�ny
                      
                  UNION SELECT [�ll�shely azonos�t�], Mez�4, [Besorol�si fokozat megnevez�se:], [�NYR SZERVEZETI EGYS�G AZONOS�T�], [Besorol�si fokozat k�d:], "A" as Jelleg, Mez�14 as Bet�lt�sAr�nya
                      FROM Korm�nyhivatali_�llom�ny
                    
                   UNION SELECT [�ll�shely azonos�t�], Mez�4, [Besorol�si fokozat megnevez�se:], [Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�], [Besorol�si fokozat k�d:], "K" as Jelleg, Mez�13 as Bet�lt�sAr�nya
                      FROM K�zpontos�tottak;
