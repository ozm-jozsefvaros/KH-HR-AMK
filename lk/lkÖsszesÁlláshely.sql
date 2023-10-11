SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Besorolási fokozat kód:], "A" as Jelleg, Mezõ14 as BetöltésAránya
                      FROM Járási_állomány
                      
                  UNION SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Besorolási fokozat kód:], "A" as Jelleg, Mezõ14 as BetöltésAránya
                      FROM Kormányhivatali_állomány
                    
                   UNION SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [Nexon szótárelemnek megfelelõ szervezeti egység azonosító], [Besorolási fokozat kód:], "K" as Jelleg, Mezõ13 as BetöltésAránya
                      FROM Központosítottak;
