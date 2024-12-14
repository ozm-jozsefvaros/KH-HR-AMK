CREATE TABLE [20241001OrvosiAlkalmass�gi] (
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[Sz�let�si n�v] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[TAJ sz�m] DOUBLE NULL,
[Orvosi vizsg�lat id�pontja] DATETIME NULL,
[Orvosi vizsg�lat k�vetkez� id�pontja] DATETIME NULL,
[Hivatali email] TEXT(255) NULL,
[TT] TEXT(255) NULL,
[Kil�p�s d�tuma] DATETIME NULL,
[Ad�TajAd�#Ad�azonos�t� jel] DOUBLE NULL,
[T�voll�t#Tv#kezdete] DATETIME NULL,
[T�voll�t#Tv#v�ge] DATETIME NULL
);

CREATE TABLE [�ll�shelyek] (
[Azonos�t�] LONG NULL,
[Szervezet] TEXT(255) NULL,
[1 szint] TEXT(255) NULL,
[2 szint] TEXT(255) NULL,
[3 szint] TEXT(255) NULL,
[4 szint] TEXT(255) NULL,
[5 szint] TEXT(255) NULL,
[6 szint] TEXT(255) NULL,
[7 szint] TEXT(255) NULL,
[8 szint] TEXT(255) NULL,
[�ll�shely t�pusa] TEXT(255) NULL,
[�ll�shely alt�pusa] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[�ll�shely besorol�si oszt�lya] TEXT(255) NULL,
[�ll�shely besorol�si kateg�ri�ja] TEXT(255) NULL,
[Hat�lyoss�g kezdete] DATETIME NULL,
[�ll�shely st�tusza] TEXT(255) NULL,
[Z�rol�s v�rhat� d�tuma] DATETIME NULL,
[�ll�shelyen fenn�ll� jogviszony] TEXT(255) NULL,
[�ll�shelykeretbe tartoz� �ll�shely] TEXT(255) NULL,
[�ll�shelyen fenn�ll� jogviszony ideje] DOUBLE NULL,
[�ll�shely hat�ly�nak jellege] TEXT(255) NULL,
[�ll�shely finansz�roz�si forr�sa] TEXT(255) NULL,
[Munkaid� jellege] TEXT(255) NULL,
[R�szmunkaid�s darabsz�m] DOUBLE NULL,
[Hat�lyoss�g v�ge] TEXT(255) NULL,
[Utols� m�dos�t�s d�tuma] DATETIME NULL,
[Migr�ci�s �llom�ny neve] TEXT(255) NULL,
[�llom�ny sora] TEXT(255) NULL,
[Hat�ly] DATETIME NULL
);

ALTER TABLE [�ll�shelyek] ADD CONSTRAINT [PK_�ll�shelyek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [�ll�shelyek_2210] (
[Azonos�t�] LONG NULL,
[Szervezet neve] TEXT(255) NULL,
[1 szint(n�v)] TEXT(255) NULL,
[2 szint(n�v)] TEXT(255) NULL,
[3 szint(n�v)] TEXT(255) NULL,
[4 szint(n�v)] TEXT(255) NULL,
[5 szint(n�v)] TEXT(255) NULL,
[keretes] TEXT(255) NULL,
[K�d] TEXT(255) NULL,
[hovatartoz�s] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[besorolas] TEXT(255) NULL,
[st�tusz kezdete] TEXT(255) NULL,
[st�tusz] TEXT(255) NULL,
[z�rol�s v�rhat� d�tuma] TEXT(255) NULL,
[jelleg] TEXT(255) NULL,
[hat�rozott esetben lej�rat] TEXT(255) NULL,
[�rv�nyess�g t�l] TEXT(255) NULL,
[�rv�nyess�g ig] TEXT(255) NULL,
[jogviszony] TEXT(255) NULL,
[forr�s] TEXT(255) NULL,
[r�szmunkaid�s] TEXT(255) NULL,
[r�szmunkaid�s db] TEXT(255) NULL,
[�llom�ny n�v] TEXT(255) NULL,
[�llom�ny sor] TEXT(255) NULL
);

ALTER TABLE [�ll�shelyek_2210] ADD CONSTRAINT [PK_�ll�shelyek_2210] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [�ll�shelyek_tart] (
[Azonos�t�] LONG NULL,
[Szervezet] TEXT(255) NULL,
[1 szint] TEXT(255) NULL,
[2 szint] TEXT(255) NULL,
[3 szint] TEXT(255) NULL,
[4 szint] TEXT(255) NULL,
[5 szint] TEXT(255) NULL,
[6 szint] TEXT(255) NULL,
[7 szint] TEXT(255) NULL,
[8 szint] TEXT(255) NULL,
[�ll�shely t�pusa] TEXT(255) NULL,
[�ll�shely alt�pusa] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[�ll�shely besorol�si oszt�lya] TEXT(255) NULL,
[�ll�shely besorol�si kateg�ri�ja] TEXT(255) NULL,
[Hat�lyoss�g kezdete] DATETIME NULL,
[�ll�shely st�tusza] TEXT(255) NULL,
[Z�rol�s v�rhat� d�tuma] DATETIME NULL,
[�ll�shelyen fenn�ll� jogviszony] TEXT(255) NULL,
[�ll�shelykeretbe tartoz� �ll�shely] TEXT(255) NULL,
[�ll�shelyen fenn�ll� jogviszony ideje] DOUBLE NULL,
[�ll�shely hat�ly�nak jellege] TEXT(255) NULL,
[�ll�shely finansz�roz�si forr�sa] TEXT(255) NULL,
[Munkaid� jellege] TEXT(255) NULL,
[R�szmunkaid�s darabsz�m] DOUBLE NULL,
[Hat�lyoss�g v�ge] TEXT(255) NULL,
[Utols� m�dos�t�s d�tuma] DATETIME NULL,
[Migr�ci�s �llom�ny neve] TEXT(255) NULL,
[�llom�ny sora] TEXT(255) NULL
);

ALTER TABLE [�ll�shelyek_tart] ADD CONSTRAINT [PK_�ll�shelyek_tart] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [�nyr�sV�laszok240815] (
[�NYR] TEXT(255) NULL,
[�llapot] TEXT(255) NULL
);

CREATE TABLE [Automatikus n�vjav�t�s ment�si hib�i] (
[Objektumn�v] TEXT(255) NULL,
[Objektumt�pus] TEXT(255) NULL,
[Hiba oka] TEXT(255) NULL,
[Id�] DATETIME NULL
);

CREATE TABLE [Beilleszt�si hiba] (
[F1] DOUBLE NULL,
[F2] DATETIME NULL,
[F3] TEXT(255) NULL,
[F4] TEXT(255) NULL
);

CREATE TABLE [Bel�p�k] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] LONG NULL,
[Neme] LONG NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Bel�p�k] ([Hat�lyaID]);

CREATE TABLE [Bel�p�k_tart] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] LONG NULL,
[Neme] LONG NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Bel�p�k_tart] ([Hat�lyaID]);

CREATE TABLE [Besorol�sHelyettes�tett] (
[Azonos�t�] LONG NULL,
[Ad�jel] DOUBLE NULL,
[TAJ sz�m] LONG NULL,
[Egyedi azonos�t�] LONG NULL,
[T�rzssz�m] LONG NULL,
[El�n�v] TEXT(255) NULL,
[Csal�di n�v] TEXT(255) NULL,
[Ut�n�v] TEXT(255) NULL,
[Jogviszony ID] DOUBLE NULL,
[K�d] LONG NULL,
[Megnevez�s] TEXT(255) NULL,
[Kezdete] DATETIME NULL,
[V�ge] DATETIME NULL,
[Kezdete1] DATETIME NULL,
[V�ge1] DATETIME NULL,
[Helyettes�t�s oka] TEXT(255) NULL,
[El�n�v1] TEXT(255) NULL,
[Csal�di n�v1] TEXT(255) NULL,
[Ut�n�v1] TEXT(255) NULL,
[Jogviszony ID1] DOUBLE NULL,
[Elt�r� illetm�ny fokozata] TEXT(255) NULL
);

ALTER TABLE [Besorol�sHelyettes�tett] ADD CONSTRAINT [PK_Besorol�sHelyettes�tett] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [D�PKit�lt�ttVisszak�ld�tt] (
[Forr�s#N�v] TEXT(255) NULL,
[Hivatal] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[D�P regisztr�ci�ra kijel�lve] TEXT(255) NULL
);

CREATE TABLE [Eseti�NYRsz�mok] (
[Azonos�t�] LONG NULL,
[St�tuszK�d] TEXT(255) NULL
);

ALTER TABLE [Eseti�NYRsz�mok] ADD CONSTRAINT [PK_Eseti�NYRsz�mok] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [EszjtvBesorol�siKateg�ri�k] (
[Azonos�t�] LONG NULL,
[EszjtvBesorol�siKateg�ri�k] TEXT(255) NULL,
[Min] LONG NULL,
[Max] LONG NULL
);

ALTER TABLE [EszjtvBesorol�siKateg�ri�k] ADD CONSTRAINT [PK_EszjtvBesorol�siKateg�ri�k] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [Fedlapr�lL�tsz�mt�bla] (
[Az �ll�shely megynevez�se] TEXT(255) NULL,
[�ll�shely sz�ma] DOUBLE NULL,
[Hat�lyaID] LONG NULL,
[Azonos�t�] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Fedlapr�lL�tsz�mt�bla] ([Hat�lyaID]);

ALTER TABLE [Fedlapr�lL�tsz�mt�bla] ADD CONSTRAINT [PK_Fedlapr�lL�tsz�mt�bla] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [Fedlapr�lL�tsz�mt�bla_tart] (
[Az �ll�shely megynevez�se] TEXT(255) NULL,
[�ll�shely sz�ma] DOUBLE NULL,
[Hat�lyaID] LONG NULL,
[Azonos�t�] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Fedlapr�lL�tsz�mt�bla_tart] ([Hat�lyaID]);

ALTER TABLE [Fedlapr�lL�tsz�mt�bla_tart] ADD CONSTRAINT [PK_Fedlapr�lL�tsz�mt�bla_tart] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [Fedlapr�lL�tsz�mt�bla2] (
[Az �ll�shely megynevez�se] TEXT(255) NULL,
[�ll�shely sz�ma] DOUBLE NULL,
[Hat�lyaID] LONG NULL,
[Azonos�t�] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Fedlapr�lL�tsz�mt�bla2] ([Hat�lyaID]);

ALTER TABLE [Fedlapr�lL�tsz�mt�bla2] ADD CONSTRAINT [PK_Fedlapr�lL�tsz�mt�bla2] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [Fedlapr�lL�tsz�mt�bla2_tart] (
[Az �ll�shely megynevez�se] TEXT(255) NULL,
[�ll�shely sz�ma] DOUBLE NULL,
[Hat�lyaID] LONG NULL,
[Azonos�t�] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Fedlapr�lL�tsz�mt�bla2_tart] ([Hat�lyaID]);

ALTER TABLE [Fedlapr�lL�tsz�mt�bla2_tart] ADD CONSTRAINT [PK_Fedlapr�lL�tsz�mt�bla2_tart] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [Fedlapr�lL�tsz�mt�bla21] (
[Az �ll�shely megynevez�se] TEXT(255) NULL,
[�ll�shely sz�ma] DOUBLE NULL,
[Hat�lyaID] LONG NULL,
[Azonos�t�] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Fedlapr�lL�tsz�mt�bla21] ([Hat�lyaID]);

ALTER TABLE [Fedlapr�lL�tsz�mt�bla21] ADD CONSTRAINT [PK_Fedlapr�lL�tsz�mt�bla21] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [FESZ] (
[Azonos�t�] LONG NULL,
[N�v] TEXT(255) NULL,
[TAJ] TEXT(255) NULL,
[Sz�ld�tum] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[FEOR megnevez�s] TEXT(255) NULL,
[Alk tipus] TEXT(255) NULL,
[Alk d�tuma] TEXT(255) NULL,
[�rv�nyes] TEXT(255) NULL,
[Eredm�ny] TEXT(255) NULL,
[Korl�toz�s] TEXT(255) NULL,
[Hat�ly] DATETIME NULL
);

ALTER TABLE [FESZ] ADD CONSTRAINT [PK_FESZ] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE ['FESZ  04 h�$'_Import�l�siHib�k] (
[Hiba] TEXT(255) NULL,
[Mez�] TEXT(255) NULL,
[Sor] LONG NULL
);

CREATE TABLE ['FESZ  04 h�$'_Import�l�siHib�k1] (
[Hiba] TEXT(255) NULL,
[Mez�] TEXT(255) NULL,
[Sor] LONG NULL
);

CREATE TABLE [Hat�rozottak] (
[Sorsz�m] DOUBLE NULL,
[Tart�s t�voll�v� neve] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] TEXT(255) NULL,
[Nem] TEXT(255) NULL,
[Szervezti alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t v�rhat� v�ge] DATETIME NULL,
[Tart�san t�voll�v� illetm�ny�nek teljes �sszege] CURRENCY NULL,
[Tart�s t�voll�v� �ll�shely�n hat�rozott id�re foglalkoztatott ne] TEXT(255) NULL,
[Mez�17] TEXT(255) NULL,
[K�zpontos�tott �ll�shely] TEXT(255) NULL,
[Mez�18] TEXT(255) NULL,
[Mez�19] TEXT(255) NULL,
[Mez�20] TEXT(255) NULL,
[Mez�21] TEXT(255) NULL,
[Mez�22] TEXT(255) NULL,
[Mez�23] DOUBLE NULL,
[Mez�24] TEXT(255) NULL,
[Mez�25] TEXT(255) NULL,
[Tart�s t�voll�v� st�tusz�n foglalkoztatott hat�rozott idej� jogv] DATETIME NULL,
[Mez�27] DATETIME NULL,
[Tart�s t�voll�v� st�tusz�n foglalkoztatott illetm�ny�nek teljes ] CURRENCY NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Hat�rozottak] ([Hat�lyaID]);

CREATE TABLE [Hat�rozottak_tart] (
[Sorsz�m] DOUBLE NULL,
[Tart�s t�voll�v� neve] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] TEXT(255) NULL,
[Nem] TEXT(255) NULL,
[Szervezti alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t v�rhat� v�ge] DATETIME NULL,
[Tart�san t�voll�v� illetm�ny�nek teljes �sszege] CURRENCY NULL,
[Tart�s t�voll�v� �ll�shely�n hat�rozott id�re foglalkoztatott ne] TEXT(255) NULL,
[Mez�17] TEXT(255) NULL,
[K�zpontos�tott �ll�shely] TEXT(255) NULL,
[Mez�18] TEXT(255) NULL,
[Mez�19] TEXT(255) NULL,
[Mez�20] TEXT(255) NULL,
[Mez�21] TEXT(255) NULL,
[Mez�22] TEXT(255) NULL,
[Mez�23] DOUBLE NULL,
[Mez�24] TEXT(255) NULL,
[Mez�25] TEXT(255) NULL,
[Tart�s t�voll�v� st�tusz�n foglalkoztatott hat�rozott idej� jogv] DATETIME NULL,
[Mez�27] DATETIME NULL,
[Tart�s t�voll�v� st�tusz�n foglalkoztatott illetm�ny�nek teljes ] CURRENCY NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Hat�rozottak_tart] ([Hat�lyaID]);

CREATE TABLE [ideiglMobilModulKieg] (
[Azonos�t�] LONG NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL
);

ALTER TABLE [ideiglMobilModulKieg] ADD CONSTRAINT [PK_ideiglMobilModulKieg] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [J�r�si_�llom�ny] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[J�r�si Hivatal] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�9] TEXT(255) NULL,
[Mez�10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;] TEXT(255) NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Heti munka�r�k sz�ma] DOUBLE NULL,
[Mez�14] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�18] CURRENCY NULL,
[Mez�19] CURRENCY NULL,
[Mez�20] TEXT(255) NULL,
[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs] TEXT(255) NULL,
[Mez�26] TEXT(255) NULL,
[Mez�27] TEXT(255) NULL,
[Mez�28] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Ad�azonos�t�] ON [J�r�si_�llom�ny] ([Ad�azonos�t�]);

CREATE INDEX [Hat�lyaID] ON [J�r�si_�llom�ny] ([Hat�lyaID]);

CREATE TABLE [J�r�si_�llom�ny_tart] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[J�r�si Hivatal] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�9] TEXT(255) NULL,
[Mez�10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;] TEXT(255) NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Heti munka�r�k sz�ma] DOUBLE NULL,
[Mez�14] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�18] CURRENCY NULL,
[Mez�19] CURRENCY NULL,
[Mez�20] TEXT(255) NULL,
[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs] TEXT(255) NULL,
[Mez�26] TEXT(255) NULL,
[Mez�27] TEXT(255) NULL,
[Mez�28] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [J�r�si_�llom�ny_tart] ([Hat�lyaID]);

CREATE TABLE [Kil�p�k] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja] DATETIME NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL,
[V�gkiel�g�t�sre jogos�t� h�napok sz�ma] DOUBLE NULL,
[Felment�si id� h�napok sz�ma] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Kil�p�k] ([Hat�lyaID]);

CREATE TABLE [Kil�p�k_tart] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja] DATETIME NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL,
[V�gkiel�g�t�sre jogos�t� h�napok sz�ma] DOUBLE NULL,
[Felment�si id� h�napok sz�ma] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Kil�p�k_tart] ([Hat�lyaID]);

CREATE TABLE [Korm�nyhivatali_�llom�ny] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�9] TEXT(255) NULL,
[Mez�10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;] TEXT(255) NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Heti munka�r�k sz�ma] DOUBLE NULL,
[Mez�14] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�18] CURRENCY NULL,
[Mez�19] CURRENCY NULL,
[Mez�20] TEXT(255) NULL,
[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs] TEXT(255) NULL,
[Mez�26] TEXT(255) NULL,
[Mez�27] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Korm�nyhivatali_�llom�ny] ([Hat�lyaID]);

CREATE TABLE [Korm�nyhivatali_�llom�ny_tart] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�9] TEXT(255) NULL,
[Mez�10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;] TEXT(255) NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Heti munka�r�k sz�ma] DOUBLE NULL,
[Mez�14] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�18] CURRENCY NULL,
[Mez�19] CURRENCY NULL,
[Mez�20] TEXT(255) NULL,
[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs] TEXT(255) NULL,
[Mez�26] TEXT(255) NULL,
[Mez�27] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [Korm�nyhivatali_�llom�ny_tart] ([Hat�lyaID]);

CREATE TABLE [K�zpontos�tottak] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] TEXT(255) NULL,
[Mez�10] TEXT(255) NULL,
[Mez�11] DATETIME NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Mez�13] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�17] CURRENCY NULL,
[Mez�18] TEXT(255) NULL,
[Tart�s t�voll�v� nincs helyettese (TT)/ tart�s t�voll�v�nek van ] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Ad�azonos�t�] ON [K�zpontos�tottak] ([Ad�azonos�t�]);

CREATE INDEX [Hat�lyaID] ON [K�zpontos�tottak] ([Hat�lyaID]);

CREATE TABLE [K�zpontos�tottak_tart] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] TEXT(255) NULL,
[Mez�10] TEXT(255) NULL,
[Mez�11] DATETIME NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Mez�13] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�17] CURRENCY NULL,
[Mez�18] TEXT(255) NULL,
[Tart�s t�voll�v� nincs helyettese (TT)/ tart�s t�voll�v�nek van ] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[Hat�lyaID] LONG NULL
);

CREATE INDEX [Hat�lyaID] ON [K�zpontos�tottak_tart] ([Hat�lyaID]);

CREATE TABLE [kt_azNexon_Ad�jel_22-11-29] (
[Azonos�t�] LONG NULL,
[azNexon] DOUBLE NOT NULL,
[Ad�jel] DOUBLE NOT NULL
);

CREATE INDEX [Ad�jel] ON [kt_azNexon_Ad�jel_22-11-29] ([Ad�jel]);

CREATE INDEX [azNexon] ON [kt_azNexon_Ad�jel_22-11-29] ([azNexon]);

CREATE INDEX [Kulcs] ON [kt_azNexon_Ad�jel_22-11-29] ([Ad�jel],[azNexon]);

ALTER TABLE [kt_azNexon_Ad�jel_22-11-29] ADD CONSTRAINT [PK_kt_azNexon_Ad�jel_22-11-29] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [ktFeladatKirafeladatFunkci�] (
[Azonos�t�] LONG NULL,
[Feladat] TEXT(255) NULL,
[KIRA feladat megnevez�s] TEXT(255) NULL,
[azFunkci�] LONG NULL
);

ALTER TABLE [ktFeladatKirafeladatFunkci�] ADD CONSTRAINT [PK_ktFeladatKirafeladatFunkci�] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [ktFeladatk�rFunkci�] (
[Azonos�t�] LONG NULL,
[Feladatk�r] TEXT(255) NULL,
[Funkci�] TEXT(255) NULL
);

ALTER TABLE [ktFeladatk�rFunkci�] ADD CONSTRAINT [PK_ktFeladatk�rFunkci�] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [ktKimenetForr�sok] (
[azEllen�rz�] LONG NOT NULL,
[azKimenetLap] LONG NOT NULL
);

CREATE INDEX [ktKimenetLap_Ellen�rz�Lek�rdez�sazEllen�rz�] ON [ktKimenetForr�sok] ([azEllen�rz�]);

CREATE INDEX [ktKimenetLap_Ellen�rz�Lek�rdez�sazKimenetForr�s] ON [ktKimenetForr�sok] ([azKimenetLap]);

CREATE INDEX [tKimenetLapjaiktKimenetLap_Ellen�rz�Lek�rdez�s] ON [ktKimenetForr�sok] ([azKimenetLap]);

ALTER TABLE [ktKimenetForr�sok] ADD CONSTRAINT [PK_ktKimenetForr�sok] PRIMARY KEY ([azEllen�rz�],[azKimenetLap]);

CREATE TABLE [ktR�giHib�kInt�zked�sek] (
[HASH] TEXT(255) NOT NULL,
[azInt�zked�sek] LONG NOT NULL,
[r�gz�t�sD�tuma] DATETIME NULL
);

CREATE INDEX [tInt�zked�sekktR�giHib�kInt�zked�sek] ON [ktR�giHib�kInt�zked�sek] ([azInt�zked�sek]);

CREATE INDEX [tR�giHib�kktR�giHib�kInt�zked�sek] ON [ktR�giHib�kInt�zked�sek] ([HASH]);

ALTER TABLE [ktR�giHib�kInt�zked�sek] ADD CONSTRAINT [PK_ktR�giHib�kInt�zked�sek] PRIMARY KEY ([HASH],[azInt�zked�sek]);

CREATE TABLE [ktSzervezetTelephely] (
[azKtTSZ] LONG NULL,
[azSzervezet] LONG NULL,
[azTelephely] LONG NULL
);

CREATE INDEX [kulcs] ON [ktSzervezetTelephely] ([azSzervezet],[azTelephely]);

ALTER TABLE [ktSzervezetTelephely] ADD CONSTRAINT [PK_ktSzervezetTelephely] PRIMARY KEY ([azKtTSZ]);

CREATE TABLE [ktUnionLek] (
[azUnionLek] LONG NULL,
[azUnion] LONG NULL,
[azEllen�rz�] LONG NULL
);

ALTER TABLE [ktUnionLek] ADD CONSTRAINT [PK_ktUnionLek] PRIMARY KEY ([azUnionLek]);

CREATE TABLE [lkFARford�t�t�blaV�gzetts�ghez] (
[Azonos�t�] LONG NULL,
[Nexon] TEXT(255) NULL,
[FAR] TEXT(255) NULL,
[fok] LONG NULL
);

ALTER TABLE [lkFARford�t�t�blaV�gzetts�ghez] ADD CONSTRAINT [PK_lkFARford�t�t�blaV�gzetts�ghez] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [Munka1] (
[Foglalkoztat�s-fel�gyeleti �s Munkav�delmi F�oszt�ly] TEXT(255) NULL,
[Munkav�delmi, Foglalkoztat�s-fel�gyeleti �s Behajt�si Oszt�ly] TEXT(255) NULL
);

CREATE TABLE [SIM adatok - 2023-08-29 (2)] (
[Azonos�t�] LONG NULL,
[Telefonsz�mId] DOUBLE NULL,
[Telefonsz�m] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[Dolgoz� n�v] TEXT(255) NULL,
[Szem�lyt�rzsben akt�v -e] TEXT(255) NULL,
[Szem�lyt�rzs szerinti e-mail c�m] TEXT(255) NULL,
[Szem�lyt�rzsben szervezeti egys�ge] TEXT(255) NULL,
[NEXON ID] DOUBLE NULL,
[Beoszt�s] TEXT(255) NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Dolgoz� st�tusz] TEXT(255) NULL,
[Ad�azon] TEXT(255) NULL,
[Szem�ly e-mail c�me] TEXT(255) NULL,
[Mez�14] TEXT(255) NULL,
[Szervezeti egys�g n�v] TEXT(255) NULL,
[Szakfeladat r�szletez�] TEXT(255) NULL,
[Szakfeladat r�szletez� n�v] TEXT(255) NULL,
[�gylet] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] TEXT(255) NULL,
[R�gz�t�] TEXT(255) NULL,
[Egyedi gy�kt�3] TEXT(255) NULL,
[P�nzforr�s] TEXT(255) NULL,
[Megnevez�se] TEXT(255) NULL,
[Egyedi gy�jt� n�v] TEXT(255) NULL,
[Le�r�s] TEXT(255) NULL,
[K�tv�ll sz�m] TEXT(255) NULL,
[K�tv�ll megn] TEXT(255) NULL
);

ALTER TABLE [SIM adatok - 2023-08-29 (2)] ADD CONSTRAINT [PK_SIM adatok - 2023-08-29 (2)] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [t__Ellen�rz�s_02] (
[T�bla] TEXT(255) NULL,
[Hi�nyz�_�rt�k] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Ad�jel] DOUBLE NULL,
[azEllen�rz�s] LONG NULL,
[d�tum] DATETIME NOT NULL
);

ALTER TABLE [t__Ellen�rz�s_02] ADD CONSTRAINT [PK_t__Ellen�rz�s_02] PRIMARY KEY ([azEllen�rz�s]);

CREATE TABLE [T�bla1] (
[Azonos�t�] LONG NULL,
[F1] TEXT(255) NULL,
[F2] LONG NULL,
[F3] TEXT(255) NULL,
[F4] TEXT(255) NULL,
[F5] DATETIME NULL,
[F6] TEXT(255) NULL,
[F7] TEXT(255) NULL,
[F8] DATETIME NULL
);

ALTER TABLE [T�bla1] ADD CONSTRAINT [PK_T�bla1] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [T�bla2] (
[azRef] LONG NULL
);

ALTER TABLE [T�bla2] ADD CONSTRAINT [PK_T�bla2] PRIMARY KEY ([azRef]);

CREATE TABLE [T�bla3] (
[Azonos�t�] LONG NULL,
[Pr�ba] MEMO NULL
);

ALTER TABLE [T�bla3] ADD CONSTRAINT [PK_T�bla3] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [T�bla4] (
[Azonos�t�] LONG NULL,
[F1] TEXT(255) NULL
);

ALTER TABLE [T�bla4] ADD CONSTRAINT [PK_T�bla4] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tAdatszolg�ltat�k] (
[azAdatszolg] LONG NULL,
[azNexon] LONG NULL
);

ALTER TABLE [tAdatszolg�ltat�k] ADD CONSTRAINT [PK_tAdatszolg�ltat�k] PRIMARY KEY ([azAdatszolg]);

CREATE TABLE [tAdatv�ltoztat�siIg�nyek] (
[Azonos�t�] LONG NULL,
[Dolgoz� neve] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[Adatk�r] TEXT(255) NULL,
[Ig�ny d�tuma] TEXT(255) NULL,
[�llapot] TEXT(255) NULL,
[Elb�r�l�s d�tuma] TEXT(255) NULL,
[Elb�r�l�] TEXT(255) NULL
);

CREATE INDEX [Ad�azonos�t� jel] ON [tAdatv�ltoztat�siIg�nyek] ([Ad�azonos�t� jel]);

ALTER TABLE [tAdatv�ltoztat�siIg�nyek] ADD CONSTRAINT [PK_tAdatv�ltoztat�siIg�nyek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tAIKiosk] (
[Azonos�t�] LONG NULL,
[N�v] TEXT(255) NULL
);

ALTER TABLE [tAIKiosk] ADD CONSTRAINT [PK_tAIKiosk] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tAIKiosk02] (
[Azonos�t�] LONG NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[N�v] TEXT(255) NULL
);

ALTER TABLE [tAIKiosk02] ADD CONSTRAINT [PK_tAIKiosk02] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tAlapadatok] (
[azAlapadat] LONG NULL,
[Tulajdons�gNeve] TEXT(255) NULL,
[Tulajdons�g�rt�k] TEXT(255) NULL,
[Objektum] TEXT(255) NULL,
[ObjektumT�pus] TEXT(255) NULL,
[T�pus] TEXT(255) NULL
);

CREATE INDEX [tulajd] ON [tAlapadatok] ([Tulajdons�gNeve],[Objektum]);

ALTER TABLE [tAlapadatok] ADD CONSTRAINT [PK_tAlapadatok] PRIMARY KEY ([azAlapadat]);

CREATE TABLE [t�ll�shelyek] (
[Azonos�t�] LONG NULL,
[Szervezet] TEXT(255) NULL,
[1 szint] TEXT(255) NULL,
[2 szint] TEXT(255) NULL,
[3 szint] TEXT(255) NULL,
[4 szint] TEXT(255) NULL,
[5 szint] TEXT(255) NULL,
[6 szint] TEXT(255) NULL,
[7 szint] TEXT(255) NULL,
[8 szint] TEXT(255) NULL,
[�ll�shely t�pusa] TEXT(255) NULL,
[�ll�shely alt�pusa] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[�ll�shely besorol�si oszt�lya] TEXT(255) NULL,
[�ll�shely besorol�si kateg�ri�ja] TEXT(255) NULL,
[Hat�lyoss�g kezdete] DATETIME NULL,
[�ll�shely st�tusza] TEXT(255) NULL,
[Z�rol�s v�rhat� d�tuma] TEXT(255) NULL,
[�ll�shelyen fenn�ll� jogviszony] TEXT(255) NULL,
[�ll�shelykeretbe tartoz� �ll�shely] TEXT(255) NULL,
[�ll�shelyen fenn�ll� jogviszony ideje] TEXT(255) NULL,
[�ll�shely hat�ly�nak jellege] TEXT(255) NULL,
[�ll�shely finansz�roz�si forr�sa] TEXT(255) NULL,
[Munkaid� jellege] TEXT(255) NULL,
[R�szmunkaid�s darabsz�m] DOUBLE NULL,
[Hat�lyoss�g v�ge] TEXT(255) NULL,
[Utols� m�dos�t�s d�tuma] DATETIME NULL,
[Migr�ci�s �llom�ny neve] TEXT(255) NULL,
[�llom�ny sora] TEXT(255) NULL
);

CREATE INDEX [4 szint] ON [t�ll�shelyek] ([4 szint]);

CREATE INDEX [5 szint] ON [t�ll�shelyek] ([5 szint]);

CREATE INDEX [�ll�shely azonos�t�] ON [t�ll�shelyek] ([�ll�shely azonos�t�]);

CREATE INDEX [�ll�shely besorol�si kateg�ri�ja] ON [t�ll�shelyek] ([�ll�shely besorol�si kateg�ri�ja]);

CREATE INDEX [�ll�shely besorol�si oszt�lya] ON [t�ll�shelyek] ([�ll�shely besorol�si oszt�lya]);

CREATE INDEX [�ll�shely st�tusza] ON [t�ll�shelyek] ([�ll�shely st�tusza]);

CREATE INDEX [�ll�shely t�pusa] ON [t�ll�shelyek] ([�ll�shely t�pusa]);

CREATE INDEX [�ll�shelyen fenn�ll� jogviszony] ON [t�ll�shelyek] ([�ll�shelyen fenn�ll� jogviszony]);

CREATE INDEX [Hat�lyoss�g kezdete] ON [t�ll�shelyek] ([Hat�lyoss�g kezdete]);

CREATE INDEX [Utols� m�dos�t�s d�tuma] ON [t�ll�shelyek] ([Utols� m�dos�t�s d�tuma]);

ALTER TABLE [t�ll�shelyek] ADD CONSTRAINT [PK_t�ll�shelyek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [t�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly] (
[azEloszt�s] LONG NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NOT NULL,
[Hat�ly] DATETIME NULL
);

CREATE INDEX [�ll�shely azonos�t�] ON [t�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly] ([�ll�shely azonos�t�]);

CREATE INDEX [azEloszt�s] ON [t�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly] ([azEloszt�s]);

ALTER TABLE [t�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly] ADD CONSTRAINT [PK_t�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly] PRIMARY KEY ([azEloszt�s]);

CREATE TABLE [t�ll�shelyEnged�lyek] (
[Azonos�t�] LONG NULL,
[�ll�shelyT�pusa] TEXT(255) NULL,
[az�ll�shely] TEXT(255) NULL,
[r�gibesorol�s] TEXT(255) NULL,
[besorol�s] TEXT(255) NULL,
[ideiglenes] YESNO NULL,
[hat�rozatlan] TEXT(255) NULL,
[hat�ly] DATETIME NULL
);

ALTER TABLE [t�ll�shelyEnged�lyek] ADD CONSTRAINT [PK_t�ll�shelyEnged�lyek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [t�llom�nyUni�20230102] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v \ �res �ll�s] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[J�r�si Hivatal] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Ell�tott feladat] TEXT(255) NULL,
[Kinevez�s] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;] TEXT(255) NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Heti munka�r�k sz�ma] DOUBLE NULL,
[Bet�lt�s ar�nya] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Havi illetm�ny] CURRENCY NULL,
[Eu finansz�rozott] TEXT(255) NULL,
[Illetm�ny forr�sa] TEXT(255) NULL,
[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs] TEXT(255) NULL,
[K�pes�t�st ad� v�gzetts�g] TEXT(255) NULL,
[KAB] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL
);

CREATE TABLE [t�llom�nyUni�20231231] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v \ �res �ll�s] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[J�r�si Hivatal] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Ell�tott feladat] TEXT(255) NULL,
[Kinevez�s] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;] TEXT(255) NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Heti munka�r�k sz�ma] DOUBLE NULL,
[Bet�lt�s ar�nya] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Havi illetm�ny] CURRENCY NULL,
[Eu finansz�rozott] TEXT(255) NULL,
[Illetm�ny forr�sa] TEXT(255) NULL,
[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs] TEXT(255) NULL,
[K�pes�t�st ad� v�gzetts�g] TEXT(255) NULL,
[KAB] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL
);

CREATE TABLE [t�prilisiOrvosiAlkalmass�gi] (
[Azonos�t�] LONG NULL,
[TAJ] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[Sz�ld�tum] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[FEOR megnevez�s] TEXT(255) NULL,
[�zemorvos] TEXT(255) NULL,
[Alk tipus] TEXT(255) NULL,
[Alk d�tuma] TEXT(255) NULL,
[�rv�nyes] TEXT(255) NULL,
[Eredm�ny] TEXT(255) NULL,
[Korl�toz�s] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Mez�13] TEXT(255) NULL
);

ALTER TABLE [t�prilisiOrvosiAlkalmass�gi] ADD CONSTRAINT [PK_t�prilisiOrvosiAlkalmass�gi] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tBej�v��zenetek] (
[az�zenet] LONG NULL,
[CommonMessageId] TEXT(255) NOT NULL,
[SenderEmailAddress] TEXT(255) NULL,
[DeliveredDate] DATETIME NULL
);

CREATE INDEX [CommonMessageId] ON [tBej�v��zenetek] ([CommonMessageId]);

ALTER TABLE [tBej�v��zenetek] ADD CONSTRAINT [PK_tBej�v��zenetek] PRIMARY KEY ([az�zenet]);

CREATE TABLE [tBej�v�Visszajelz�sek] (
[azVisszajelz�s] LONG NULL,
[az�zenet] LONG NULL,
[Hash] TEXT(255) NULL,
[Visszajelz�sK�d] LONG NULL,
[Feldolgozva] YESNO NULL,
[Hat�ly] DATETIME NULL
);

CREATE INDEX [az�zenet] ON [tBej�v�Visszajelz�sek] ([az�zenet]);

CREATE INDEX [Hash] ON [tBej�v�Visszajelz�sek] ([Hash]);

CREATE INDEX [Hat�ly] ON [tBej�v�Visszajelz�sek] ([Hat�ly]);

CREATE INDEX [tBej�v��zenetektBej�v�Visszajelz�sek] ON [tBej�v�Visszajelz�sek] ([az�zenet]);

ALTER TABLE [tBej�v�Visszajelz�sek] ADD CONSTRAINT [PK_tBej�v�Visszajelz�sek] PRIMARY KEY ([azVisszajelz�s]);

CREATE TABLE [tBel�p�k] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL,
[hat�lyaID] LONG NULL,
[azBel�p�kSor] LONG NULL
);

CREATE INDEX [azKil�p�kSor] ON [tBel�p�k] ([azBel�p�kSor]);

CREATE INDEX [tHaviJelent�sHat�lyatBel�p�k] ON [tBel�p�k] ([hat�lyaID]);

ALTER TABLE [tBel�p�k] ADD CONSTRAINT [PK_tBel�p�k] PRIMARY KEY ([azBel�p�kSor]);

CREATE TABLE [tBel�p�kJ�v�] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL
);

CREATE INDEX [Alapl�tsz�m] ON [tBel�p�kJ�v�] ([Alapl�tsz�m]);

CREATE INDEX [Sorsz�m] ON [tBel�p�kJ�v�] ([Sorsz�m]);

CREATE TABLE [tBel�p�kUni�] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL
);

CREATE TABLE [tBels�Enged�lyezettL�tsz�mok] (
[azBels�Enged�ly] LONG NULL,
[F�oszt�lyK�d] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[Enged�lyV�ltoz�s] LONG NULL,
[Hat�ly] DATETIME NULL
);

ALTER TABLE [tBels�Enged�lyezettL�tsz�mok] ADD CONSTRAINT [PK_tBels�Enged�lyezettL�tsz�mok] PRIMARY KEY ([azBels�Enged�ly]);

CREATE TABLE [tBesorol�s_�talak�t�] (
[Azonos�t�] LONG NULL,
[Az �ll�shely jel�l�se] TEXT(255) NULL,
[Az �ll�shely megynevez�se] TEXT(255) NULL,
[als� hat�r] DOUBLE NULL,
[fels� hat�r] DOUBLE NULL,
[Mt] YESNO NULL,
[Kit] YESNO NULL,
[�res] YESNO NULL,
[Vezet�] YESNO NULL,
[Besorol�s] TEXT(255) NULL,
[Jogviszony t�pusa] TEXT(255) NULL,
[Besorol�si_fokozat] TEXT(255) NULL,
[Sorrend] LONG NULL,
[K�lts�gvet�si] TEXT(255) NULL
);

ALTER TABLE [tBesorol�s_�talak�t�] ADD CONSTRAINT [PK_tBesorol�s_�talak�t�] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tBesorol�s�talak�t�Elt�r�Besorol�shoz] (
[Azonos�t�] LONG NULL,
[Besorol�si  fokozat (KT)] TEXT(255) NULL,
[�ll�shely besorol�si kateg�ri�ja] TEXT(255) NULL,
[rang] LONG NULL,
[jel] TEXT(255) NULL
);

ALTER TABLE [tBesorol�s�talak�t�Elt�r�Besorol�shoz] ADD CONSTRAINT [PK_tBesorol�s�talak�t�Elt�r�Besorol�shoz] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tBesorol�sHi�nyok] (
[Azonos�t�] LONG NULL,
[�ll�shelyK�d] TEXT(255) NULL
);

ALTER TABLE [tBesorol�sHi�nyok] ADD CONSTRAINT [PK_tBesorol�sHi�nyok] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tBesorol�siEredm�nyadatok] (
[Azonos�t�] LONG NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[El�n�v] TEXT(255) NULL,
[Csal�di n�v] TEXT(255) NULL,
[Ut�n�v] TEXT(255) NULL,
[Jogviszony ID] DOUBLE NULL,
[K�d] TEXT(255) NULL,
[Megnevez�s] TEXT(255) NULL,
[Kezdete] DATETIME NULL,
[V�ge] TEXT(255) NULL,
[V�ltoz�s d�tuma] DATETIME NULL,
[Kezdete1] DATETIME NULL,
[V�ge2] TEXT(255) NULL,
[Megnevez�s3] TEXT(255) NULL,
[Kezdete4] DATETIME NULL,
[V�ge5] TEXT(255) NULL,
[Napi �ra] DOUBLE NULL,
[Heti �ra] DOUBLE NULL,
[Havi �ra] DOUBLE NULL,
[Kezdete6] DATETIME NULL,
[V�ge7] DATETIME NULL,
[T�pus] TEXT(255) NULL,
[Jelleg] TEXT(255) NULL,
[Kezdete8] DATETIME NULL,
[V�ge9] DATETIME NULL,
[Besorol�si fokozat] TEXT(255) NULL,
[Nem fogadta el a besorol�st] TEXT(255) NULL,
[Kezdete10] DATETIME NULL,
[V�ge11] DATETIME NULL,
[Kulcssz�m] TEXT(255) NULL,
[Besorol�si oszt�ly] TEXT(255) NULL,
[Besorol�si fokozat12] TEXT(255) NULL,
[K�vetkez� besorol�si fokozat d�tum] DATETIME NULL,
[Fikt�v kulcssz�m] TEXT(255) NULL,
[Fikt�v besorol�si oszt�ly] TEXT(255) NULL,
[Fikt�v besorol�si fokozat] TEXT(255) NULL,
[Fikt�v k�vetkez� besorol�si fokozat d�tum] TEXT(255) NULL,
[Utols� besorol�s d�tuma] DATETIME NULL,
[Kezdete13] DATETIME NULL,
[V�ge14] TEXT(255) NULL,
[Eszmei fizet�si fokozat id�] DATETIME NULL,
[Kezdete15] TEXT(255) NULL,
[V�ge16] TEXT(255) NULL,
[Eszmei k�zszolg�lati jogviszony id�] TEXT(255) NULL,
[Kezdete17] TEXT(255) NULL,
[V�ge18] TEXT(255) NULL,
[K�zszolg�lati jogviszony id�] TEXT(255) NULL,
[Kezdete19] DATETIME NULL,
[V�ge20] TEXT(255) NULL,
[Sz�m�tott fizet�si fokozat id�] DATETIME NULL,
[Kezdete21] DATETIME NULL,
[V�ge22] TEXT(255) NULL,
[Szolg�lati elismer�s / Jubileum jutalom id�] DATETIME NULL,
[Kezdete23] DATETIME NULL,
[V�ge24] TEXT(255) NULL,
[V�gkiel�g�t�sre jogos�t� id�] DATETIME NULL,
[Kezdete25] DATETIME NULL,
[V�ge26] TEXT(255) NULL,
[Szolg�lati jogviszonyban elt�lt�tt id�] DATETIME NULL,
[Kezdete27] TEXT(255) NULL,
[V�ge28] TEXT(255) NULL,
[�ll�shelyi id�] TEXT(255) NULL,
[Kezdete29] DATETIME NULL,
[V�ge30] TEXT(255) NULL,
[Saj�t munkahelyen elt�lt�tt id�] DATETIME NULL,
[Kezdete31] TEXT(255) NULL,
[V�ge32] TEXT(255) NULL,
[Szakmai gyakorlat kezd� d�tuma] TEXT(255) NULL,
[Kezdete33] DATETIME NULL,
[V�ge34] DATETIME NULL,
[Alapilletm�ny] DOUBLE NULL,
[Garant�lt b�rminimum] TEXT(255) NULL,
[Kerek�t�s] TEXT(255) NULL,
[�sszesen] DOUBLE NULL
);

ALTER TABLE [tBesorol�siEredm�nyadatok] ADD CONSTRAINT [PK_tBesorol�siEredm�nyadatok] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tBesorol�siEredm�nyadatok_import] (
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[El�n�v] TEXT(255) NULL,
[Csal�di n�v] TEXT(255) NULL,
[Ut�n�v] TEXT(255) NULL,
[Jogviszony ID] DOUBLE NULL,
[K�d] TEXT(255) NULL,
[Megnevez�s] TEXT(255) NULL,
[Kezdete] DATETIME NULL,
[V�ge] TEXT(255) NULL,
[V�ltoz�s d�tuma] DATETIME NULL,
[Kezdete1] DATETIME NULL,
[V�ge2] TEXT(255) NULL,
[Megnevez�s3] TEXT(255) NULL,
[Kezdete4] DATETIME NULL,
[V�ge5] TEXT(255) NULL,
[Napi �ra] DOUBLE NULL,
[Heti �ra] DOUBLE NULL,
[Havi �ra] DOUBLE NULL,
[Kezdete6] DATETIME NULL,
[V�ge7] DATETIME NULL,
[T�pus] TEXT(255) NULL,
[Jelleg] TEXT(255) NULL,
[Kezdete8] DATETIME NULL,
[V�ge9] DATETIME NULL,
[Besorol�si fokozat] TEXT(255) NULL,
[Nem fogadta el a besorol�st] TEXT(255) NULL,
[Kezdete10] DATETIME NULL,
[V�ge11] DATETIME NULL,
[Kulcssz�m] TEXT(255) NULL,
[Besorol�si oszt�ly] TEXT(255) NULL,
[Besorol�si fokozat12] TEXT(255) NULL,
[K�vetkez� besorol�si fokozat d�tum] DATETIME NULL,
[Fikt�v kulcssz�m] TEXT(255) NULL,
[Fikt�v besorol�si oszt�ly] TEXT(255) NULL,
[Fikt�v besorol�si fokozat] TEXT(255) NULL,
[Fikt�v k�vetkez� besorol�si fokozat d�tum] TEXT(255) NULL,
[Utols� besorol�s d�tuma] DATETIME NULL,
[Kezdete13] DATETIME NULL,
[V�ge14] TEXT(255) NULL,
[Eszmei fizet�si fokozat id�] DATETIME NULL,
[Kezdete15] TEXT(255) NULL,
[V�ge16] TEXT(255) NULL,
[Eszmei k�zszolg�lati jogviszony id�] TEXT(255) NULL,
[Kezdete17] TEXT(255) NULL,
[V�ge18] TEXT(255) NULL,
[K�zszolg�lati jogviszony id�] TEXT(255) NULL,
[Kezdete19] DATETIME NULL,
[V�ge20] TEXT(255) NULL,
[Sz�m�tott fizet�si fokozat id�] DATETIME NULL,
[Kezdete21] DATETIME NULL,
[V�ge22] TEXT(255) NULL,
[Szolg�lati elismer�s / Jubileum jutalom id�] DATETIME NULL,
[Kezdete23] DATETIME NULL,
[V�ge24] TEXT(255) NULL,
[V�gkiel�g�t�sre jogos�t� id�] DATETIME NULL,
[Kezdete25] DATETIME NULL,
[V�ge26] TEXT(255) NULL,
[Szolg�lati jogviszonyban elt�lt�tt id�] DATETIME NULL,
[Kezdete27] TEXT(255) NULL,
[V�ge28] TEXT(255) NULL,
[�ll�shelyi id�] TEXT(255) NULL,
[Kezdete29] DATETIME NULL,
[V�ge30] TEXT(255) NULL,
[Saj�t munkahelyen elt�lt�tt id�] DATETIME NULL,
[Kezdete31] TEXT(255) NULL,
[V�ge32] TEXT(255) NULL,
[Szakmai gyakorlat kezd� d�tuma] TEXT(255) NULL,
[Kezdete33] TEXT(255) NULL,
[V�ge34] TEXT(255) NULL,
[Eszmei igazgat�si id� kezd� d�tuma] TEXT(255) NULL,
[Kezdete35] TEXT(255) NULL,
[V�ge36] TEXT(255) NULL,
[Igazgat�si id� kezd� d�tuma] TEXT(255) NULL,
[Kezdete37] DATETIME NULL,
[V�ge38] DATETIME NULL,
[Alapilletm�ny] DOUBLE NULL,
[Garant�lt b�rminimum] TEXT(255) NULL,
[Kerek�t�s] TEXT(255) NULL,
[�sszesen] DOUBLE NULL
);

CREATE TABLE [tBesorol�siK�dok] (
[azBesK�d] LONG NULL,
[K�d] TEXT(255) NULL,
[Besorol�s] TEXT(255) NULL
);

ALTER TABLE [tBesorol�siK�dok] ADD CONSTRAINT [PK_tBesorol�siK�dok] PRIMARY KEY ([azBesK�d]);

CREATE TABLE [tBesorol�sKonverzi�] (
[Azonos�t�] LONG NULL,
[�NYRb�l] TEXT(255) NULL,
[Havib�l] TEXT(255) NULL,
[Szem�lyt�rzsb�l] TEXT(255) NULL,
[rang] LONG NULL
);

ALTER TABLE [tBesorol�sKonverzi�] ADD CONSTRAINT [PK_tBesorol�sKonverzi�] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tBesorol�sV�ltoztat�sok] (
[Azonos�t�] LONG NULL,
[Darabsz�m] TEXT(255) NULL,
[�rintettSzerv] TEXT(255) NULL,
[�ll�shelyAzonos�t�] TEXT(255) NULL,
[R�giBesorol�s] TEXT(255) NULL,
[�jBesorol�s] TEXT(255) NULL,
[Hat�ly] DATETIME NULL
);

ALTER TABLE [tBesorol�sV�ltoztat�sok] ADD CONSTRAINT [PK_tBesorol�sV�ltoztat�sok] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tD�Pr�sztvev�k] (
[Forr�s#N�v] TEXT(255) NULL,
[Hivatal] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[D�P regisztr�ci�ra kijel�lve] TEXT(255) NULL
);

CREATE TABLE [tDolgoz�kV�gzetts�geiFelsorol�s01] (
[V�gzetts�geinekASz�ma] LONG NULL,
[Ad�jel] DOUBLE NULL,
[V�gzetts�g neve] TEXT(255) NULL,
[Azonos�t�k] LONG NULL
);

CREATE TABLE [tDolgoz�kV�gzetts�geiFelsorol�s02] (
[Sorsz�m] LONG NULL,
[V�gzetts�geinekASz�ma] LONG NULL,
[Ad�jel] DOUBLE NULL,
[V�gzetts�g neve] TEXT(255) NULL
);

CREATE TABLE [tEg�szs�g�gyiSzolg�ltat�Adatai01] (
[Azonos�t�] LONG NULL,
[P�ciens n�v] TEXT(255) NULL,
[TAJ] TEXT(255) NULL,
[Munkak�r] TEXT(255) NULL,
[Vizsg�lat t�pusa] TEXT(255) NULL,
[Lej�rat d�tuma] DATETIME NULL,
[Korl�toz�s] TEXT(255) NULL,
[Vizsg�lat eredm�nye] TEXT(255) NULL,
[Vizsg�lat d�tuma] DATETIME NULL
);

CREATE INDEX [TAJ] ON [tEg�szs�g�gyiSzolg�ltat�Adatai01] ([TAJ]);

ALTER TABLE [tEg�szs�g�gyiSzolg�ltat�Adatai01] ADD CONSTRAINT [PK_tEg�szs�g�gyiSzolg�ltat�Adatai01] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tEg�szs�g�gyiSzolg�ltat�Adatai02] (
[Azonos�t�] LONG NULL,
[P�ciens n�v] TEXT(255) NULL,
[TAJ] TEXT(255) NULL,
[Munkak�r] TEXT(255) NULL,
[Vizsg�lat t�pusa] TEXT(255) NULL,
[Lej�rat d�tuma] DATETIME NULL,
[Korl�toz�s] TEXT(255) NULL,
[Vizsg�lat eredm�nye] TEXT(255) NULL,
[Vizsg�lat D�tuma] DATETIME NULL
);

CREATE INDEX [TAJ] ON [tEg�szs�g�gyiSzolg�ltat�Adatai02] ([TAJ]);

ALTER TABLE [tEg�szs�g�gyiSzolg�ltat�Adatai02] ADD CONSTRAINT [PK_tEg�szs�g�gyiSzolg�ltat�Adatai02] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tEllen�rz�Lek�rdez�sek] (
[azEllen�rz�] LONG NULL,
[Ellen�rz�Lek�rdez�s] TEXT(255) NULL,
[azET�pus] LONG NULL,
[Kimenet] YESNO NULL,
[KellVisszajelzes] YESNO NULL,
[vbaPreProcessing] MEMO NULL,
[azUnion] LONG NULL,
[El�zm�nyUni�] LONG NULL,
[T�blac�m] TEXT(255) NULL,
[T�blaMegjegyz�s] MEMO NULL,
[Sorrend] LONG NULL,
[azHibaCsoport] LONG NULL
);

CREATE INDEX [tEllen�rz�sT�pusoktEllen�rz�Lek�rdez�sek] ON [tEllen�rz�Lek�rdez�sek] ([azET�pus]);

CREATE INDEX [tUnionCsoportoktEllen�rz�Lek�rdez�sek] ON [tEllen�rz�Lek�rdez�sek] ([azUnion]);

ALTER TABLE [tEllen�rz�Lek�rdez�sek] ADD CONSTRAINT [PK_tEllen�rz�Lek�rdez�sek] PRIMARY KEY ([azEllen�rz�]);

CREATE TABLE [tEnged�lyezettL�tsz�mok] (
[Azonos�t�] LONG NULL,
[F�oszt�ly/Vezet�] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[L�tsz�m] DOUBLE NULL,
[Hat�ly] DATETIME NULL
);

ALTER TABLE [tEnged�lyezettL�tsz�mok] ADD CONSTRAINT [PK_tEnged�lyezettL�tsz�mok] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tEnged�llyelVal��sszevet�sT�bla] (
[Sorsz�mEng] LONG NULL,
[Magyar�zat] TEXT(255) NULL,
[Z�na] TEXT(255) NULL,
[Besorol�s_bemenet] TEXT(255) NULL,
[Enged�lyezett] DOUBLE NULL,
[Bet�lt�tt] DOUBLE NULL,
[�res] DOUBLE NULL,
[�sszes �ll�shely] DOUBLE NULL
);

CREATE TABLE [tEsetiProjektbeFelveend�k] (
[Azonos�t�] LONG NULL,
[Szem�ly azonos�t�ja*] LONG NULL,
[HR kapcsolat sorsz�ma *] DOUBLE NULL,
[�rv�nyess�g kezdete *] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[K�lts�ghely*] TEXT(255) NULL
);

ALTER TABLE [tEsetiProjektbeFelveend�k] ADD CONSTRAINT [PK_tEsetiProjektbeFelveend�k] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tEsk�Lej�rtId�pontok] (
[Szervezeti egys�g k�d] TEXT(255) NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Szervezeti szint sz�ma-neve] TEXT(255) NULL,
[Jogviszony t�pus] TEXT(255) NULL,
[Jogviszony kezdete] DATETIME NULL,
[Jogviszony v�ge] DATETIME NULL,
[Dolgoz� neve] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[Figyelend� d�tum t�pusa] TEXT(255) NULL,
[Figyelend� d�tum] DATETIME NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 6 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 6 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 7 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 7 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 8 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 8 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 9 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 9 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 10 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 10 szervezeti egys�g n�v] TEXT(255) NULL
);

CREATE INDEX [Ad�azonos�t� jel] ON [tEsk�Lej�rtId�pontok] ([Ad�azonos�t� jel]);

CREATE INDEX [Szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szervezeti egys�g k�d]);

CREATE INDEX [Szint 1 szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szint 1 szervezeti egys�g k�d]);

CREATE INDEX [Szint 10 szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szint 10 szervezeti egys�g k�d]);

CREATE INDEX [Szint 2 szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szint 2 szervezeti egys�g k�d]);

CREATE INDEX [Szint 3 szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szint 3 szervezeti egys�g k�d]);

CREATE INDEX [Szint 4 szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szint 4 szervezeti egys�g k�d]);

CREATE INDEX [Szint 5 szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szint 5 szervezeti egys�g k�d]);

CREATE INDEX [Szint 6 szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szint 6 szervezeti egys�g k�d]);

CREATE INDEX [Szint 7 szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szint 7 szervezeti egys�g k�d]);

CREATE INDEX [Szint 8 szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szint 8 szervezeti egys�g k�d]);

CREATE INDEX [Szint 9 szervezeti egys�g k�d] ON [tEsk�Lej�rtId�pontok] ([Szint 9 szervezeti egys�g k�d]);

CREATE TABLE [tEszaP�ros�t�s] (
[Azonos�t�] LONG NULL,
[Esza] TEXT(255) NULL,
[Nexon] TEXT(255) NULL
);

ALTER TABLE [tEszaP�ros�t�s] ADD CONSTRAINT [PK_tEszaP�ros�t�s] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tExcelSt�lusok] (
[azSt�lus] LONG NULL,
[St�lusN�v] TEXT(255) NULL,
[St�lusSz�n] LONG NULL
);

ALTER TABLE [tExcelSt�lusok] ADD CONSTRAINT [PK_tExcelSt�lusok] PRIMARY KEY ([azSt�lus]);

CREATE TABLE [tFARr�sztvev�] (
[Azonos�t�] LONG NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�ge] TEXT(255) NULL,
[Viselt neve] TEXT(255) NULL,
[Sz�let�si neve] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Sz�let�si orsz�g] TEXT(255) NULL,
[Sz�let�si helye] TEXT(255) NULL,
[Sz�let�si ideje] TEXT(255) NULL,
[E-mail c�me] TEXT(255) NULL,
[Magyarorsz�gi lakc�mmel nem rendelkez� nem magyar �llampolg�r] YESNO NULL,
[DHK K�pz�si hitel?] TEXT(255) NULL,
[R�sztvev� �ltal fizetend� d�j] TEXT(255) NULL,
[T�bla] TEXT(255) NULL
);

ALTER TABLE [tFARr�sztvev�] ADD CONSTRAINT [PK_tFARr�sztvev�] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tFedlapr�lL�tsz�mt�bla] (
[Az �ll�shely megynevez�se] TEXT(255) NULL,
[�ll�shely sz�ma] DOUBLE NULL,
[Azonos�t�] LONG NULL,
[hat�lyaID] LONG NULL
);

CREATE INDEX [tHaviJelent�sHat�lyatFedlapr�lL�tsz�mt�bla] ON [tFedlapr�lL�tsz�mt�bla] ([hat�lyaID]);

ALTER TABLE [tFedlapr�lL�tsz�mt�bla] ADD CONSTRAINT [PK_tFedlapr�lL�tsz�mt�bla] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tFedlapr�lL�tsz�mt�bla2] (
[Az �ll�shely megynevez�se] TEXT(255) NULL,
[�ll�shely sz�ma] DOUBLE NULL,
[Azonos�t�] LONG NULL,
[hat�lyaID] LONG NULL
);

CREATE INDEX [tHaviJelent�sHat�lyatFedlapr�lL�tsz�mt�bla2] ON [tFedlapr�lL�tsz�mt�bla2] ([hat�lyaID]);

ALTER TABLE [tFedlapr�lL�tsz�mt�bla2] ADD CONSTRAINT [PK_tFedlapr�lL�tsz�mt�bla2] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tForr�sNexonSzervezetek�sszerendel�s] (
[Azonos�t�] LONG NULL,
[Forr�sK�d] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL
);

ALTER TABLE [tForr�sNexonSzervezetek�sszerendel�s] ADD CONSTRAINT [PK_tForr�sNexonSzervezetek�sszerendel�s] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tF�isp�niKabinet�ll�shelyei20240831ig] (
[Azonos�t�] LONG NULL,
[�ll�shelyAz] TEXT(255) NULL
);

ALTER TABLE [tF�isp�niKabinet�ll�shelyei20240831ig] ADD CONSTRAINT [PK_tF�isp�niKabinet�ll�shelyei20240831ig] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tF�oszt�lyokOszt�lyokSorsz�mmal] (
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[BFKH] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[Sorsz�m] DOUBLE NULL
);

CREATE TABLE [tFunkci�k] (
[azFunkci�] LONG NULL,
[Megnevez�s (magyar)] TEXT(255) NULL
);

ALTER TABLE [tFunkci�k] ADD CONSTRAINT [PK_tFunkci�k] PRIMARY KEY ([azFunkci�]);

CREATE TABLE [tFunkcion�lisSzakmaiF�oszt�lyok] (
[azF�oszt�ly] LONG NULL,
[SzervezetK�d] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Funkcion�lis] YESNO NULL
);

CREATE INDEX [SzervezetK�d] ON [tFunkcion�lisSzakmaiF�oszt�lyok] ([SzervezetK�d]);

ALTER TABLE [tFunkcion�lisSzakmaiF�oszt�lyok] ADD CONSTRAINT [PK_tFunkcion�lisSzakmaiF�oszt�lyok] PRIMARY KEY ([azF�oszt�ly]);

CREATE TABLE [tFuttat�sokHib�k] (
[azFuttat�s] LONG NOT NULL,
[Hash] TEXT(255) NOT NULL
);

CREATE INDEX [tHib�ktFuttat�sokHib�k] ON [tFuttat�sokHib�k] ([Hash]);

CREATE INDEX [tLek�rdez�sFuttat�soktFuttat�sokHib�k] ON [tFuttat�sokHib�k] ([azFuttat�s]);

ALTER TABLE [tFuttat�sokHib�k] ADD CONSTRAINT [PK_tFuttat�sokHib�k] PRIMARY KEY ([azFuttat�s],[Hash]);

CREATE TABLE [tGrafikonok] (
[Azonos�t�] LONG NULL,
[azEllen�rz�] LONG NULL,
[grafTulajdons�g] TEXT(255) NULL,
[grafTul�rt�k] TEXT(255) NULL,
[sz�lTul] LONG NULL
);

CREATE INDEX [tEllen�rz�Lek�rdez�sektGrafikonok] ON [tGrafikonok] ([azEllen�rz�]);

ALTER TABLE [tGrafikonok] ADD CONSTRAINT [PK_tGrafikonok] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tHat�rozottak] (
[Sorsz�m] DOUBLE NULL,
[Tart�s t�voll�v� neve] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Szervezti alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t v�rhat� v�ge] DATETIME NULL,
[Tart�san t�voll�v� illetm�ny�nek teljes �sszege] CURRENCY NULL,
[Tart�s t�voll�v� �ll�shely�n hat�rozott id�re foglalkoztatott ne] TEXT(255) NULL,
[Mez�17] TEXT(255) NULL,
[K�zpontos�tott �ll�shely] TEXT(255) NULL,
[Mez�18] TEXT(255) NULL,
[Mez�19] TEXT(255) NULL,
[Mez�20] TEXT(255) NULL,
[Mez�21] TEXT(255) NULL,
[Mez�22] TEXT(255) NULL,
[Mez�23] DOUBLE NULL,
[Mez�24] TEXT(255) NULL,
[Mez�25] TEXT(255) NULL,
[Tart�s t�voll�v� st�tusz�n foglalkoztatott hat�rozott idej� jogv] DATETIME NULL,
[Mez�27] DATETIME NULL,
[Tart�s t�voll�v� st�tusz�n foglalkoztatott illetm�ny�nek teljes ] CURRENCY NULL,
[hat�lyaID] LONG NULL,
[azHat�rozottakSor] LONG NULL
);

CREATE INDEX [azKil�p�kSor] ON [tHat�rozottak] ([azHat�rozottakSor]);

ALTER TABLE [tHat�rozottak] ADD CONSTRAINT [PK_tHat�rozottak] PRIMARY KEY ([azHat�rozottakSor]);

CREATE TABLE [tHaviJelent�sHat�lya1] (
[hat�lyaID] LONG NULL,
[hat�lya] DATETIME NULL,
[r�gz�t�s] DATETIME NULL,
[f�jln�v] MEMO NULL
);

ALTER TABLE [tHaviJelent�sHat�lya1] ADD CONSTRAINT [PK_tHaviJelent�sHat�lya1] PRIMARY KEY ([hat�lyaID]);

CREATE TABLE [tHelys�gek] (
[Azonos�t�] LONG NULL,
[Megnevez�s (magyar)] TEXT(255) NULL,
[Hossz] DOUBLE NULL
);

ALTER TABLE [tHelys�gek] ADD CONSTRAINT [PK_tHelys�gek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tHibacsoportok] (
[azHibaCsoport] LONG NULL,
[Hibacsoport] TEXT(255) NULL
);

CREATE INDEX [tHibacsoportokHibacsoport] ON [tHibacsoportok] ([Hibacsoport]);

ALTER TABLE [tHibacsoportok] ADD CONSTRAINT [PK_tHibacsoportok] PRIMARY KEY ([azHibaCsoport]);

CREATE TABLE [tHib�k] (
[Azonos�t�] LONG NULL,
[Hash] TEXT(255) NULL,
[Hibacsoport] LONG NULL,
[Hibasz�veg] MEMO NULL
);

CREATE INDEX [md5hash] ON [tHib�k] ([Hash]);

CREATE INDEX [tHibacsoportoktHib�k] ON [tHib�k] ([Hibacsoport]);

ALTER TABLE [tHib�k] ADD CONSTRAINT [PK_tHib�k] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tHibaT�pusok] (
[azHiba] LONG NULL,
[Hiba] TEXT(255) NULL,
[Hiba le�r�sa] MEMO NULL
);

ALTER TABLE [tHibaT�pusok] ADD CONSTRAINT [PK_tHibaT�pusok] PRIMARY KEY ([azHiba]);

CREATE TABLE [tH�napok] (
[Azonos�t�] LONG NULL,
[H�nap] TEXT(255) NULL
);

ALTER TABLE [tH�napok] ADD CONSTRAINT [PK_tH�napok] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tHozz�tartoz�k] (
[Azonos�t�] LONG NULL,
[Szervezeti egys�g neve] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[Dolgoz� neve] TEXT(255) NULL,
[Dolgoz� ad�azonos�t� jele] TEXT(255) NULL,
[Dolgoz� TAJ sz�ma] TEXT(255) NULL,
[Dolgoz� t�rzssz�ma] TEXT(255) NULL,
[Dolgoz� egyedi azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal r�vid neve] TEXT(255) NULL,
[HR kapcsolat t�pusa] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[HR kapcsolat �rv�nyess�g kezdete] DATETIME NULL,
[HR kapcsolat �rv�nyess�g v�ge] DATETIME NULL,
[Dolgoz� szerz�d�ses munkak�re] TEXT(255) NULL,
[Mez�14] TEXT(255) NULL,
[Hozz�tartoz� neve] TEXT(255) NULL,
[Hozz�tartoz� ad�azonos�t� jele] TEXT(255) NULL,
[Hozz�tartoz� TAJ sz�ma] TEXT(255) NULL,
[Hozz�tartoz� HR kapcsolat t�pusa] TEXT(255) NULL,
[Mez�19] DATETIME NULL,
[Mez�20] TEXT(255) NULL,
[Kapcsolat jellege] TEXT(255) NULL,
[Sz�let�si csal�di n�v] TEXT(255) NULL,
[Sz�let�si ut�n�v] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Anyja csal�di neve] TEXT(255) NULL,
[Anyja ut�neve] TEXT(255) NULL,
[Csal�di �llapota] TEXT(255) NULL,
[�llampolg�rs�ga (els�dleges)] TEXT(255) NULL,
[�lland� lakc�m] TEXT(255) NULL,
[Tart�zkod�si lakc�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Otthoni e-mail c�m] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[Tov�bbi otthoni mobil] TEXT(255) NULL,
[Fogyat�koss�g - �rv�nyess�g kezdete] TEXT(255) NULL,
[Fogyat�koss�g - �rv�nyess�g v�ge] TEXT(255) NULL,
[Fogyat�koss�g bejelent�s napja] TEXT(255) NULL,
[Szabads�gsz�m�t�s] TEXT(255) NULL,
[Hat�ly] TEXT(255) NULL
);

CREATE INDEX [HR kapcsolat �rv�nyess�g kezdete] ON [tHozz�tartoz�k] ([HR kapcsolat �rv�nyess�g kezdete]);

CREATE INDEX [HR kapcsolat �rv�nyess�g v�ge] ON [tHozz�tartoz�k] ([HR kapcsolat �rv�nyess�g v�ge]);

CREATE INDEX [Sz�let�si id�] ON [tHozz�tartoz�k] ([Sz�let�si id�]);

ALTER TABLE [tHozz�tartoz�k] ADD CONSTRAINT [PK_tHozz�tartoz�k] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tIFfelK�z�ltek] (
[azIFfelK�z�ltek] LONG NULL,
[ad�jel] DOUBLE NULL,
[bel�p�sD�tuma] DATETIME NULL,
[Lek�rdez�sId�pontja] DATETIME NULL,
[felhaszn�l�] TEXT(255) NULL,
[g�p] TEXT(255) NULL
);

CREATE INDEX [bel�p�] ON [tIFfelK�z�ltek] ([ad�jel],[bel�p�sD�tuma]);

ALTER TABLE [tIFfelK�z�ltek] ADD CONSTRAINT [PK_tIFfelK�z�ltek] PRIMARY KEY ([azIFfelK�z�ltek]);

CREATE TABLE [tIlletm�nyek] (
[Azonos�t�] LONG NULL,
[ISZH azonos�t�] DOUBLE NULL,
[�gyint�z� k�dja] DOUBLE NULL,
[T�rzssz�m] DOUBLE NULL,
[Int�zm�ny] TEXT(255) NULL,
[Szervezeti egys�g k�dja] DOUBLE NULL,
[Szervezeti egys�g megnevez�se] TEXT(255) NULL,
[F�k�nyvi sz�mlasz�m] DOUBLE NULL,
[F�k�nyvi sz�mla megnevez�se] TEXT(255) NULL,
[T�masz�m] TEXT(255) NULL,
[T�masz�m megnevez�se] TEXT(255) NULL,
[Korm�nyzati funkci� k�dja] DOUBLE NULL,
[Korm�nyzati funkci� neve] TEXT(255) NULL,
[Ad�azonos�t� jel] DOUBLE NULL,
[FOGSOR] DOUBLE NULL,
[TAJ sz�m] DOUBLE NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Sz�let�si d�tum] DATETIME NULL,
[Anyja neve] TEXT(255) NULL,
[Jv kezdete] DATETIME NULL,
[Jv v�ge] DATETIME NULL,
[Jogviszony, juttat�s t�pusa] DOUBLE NULL,
[Jogviszony, juttat�s megnevez�se] TEXT(255) NULL,
[Kulcssz�m] DOUBLE NULL,
[Kulcssz�m neve] TEXT(255) NULL,
[FEOR] DOUBLE NULL,
[Munkak�r megnevez�se] TEXT(255) NULL,
[�tsorol�s �sszesen] DOUBLE NULL,
[Illetm�ny kifizet�s�nek m�dja] DOUBLE NULL,
[Foly�sz�mlasz�m] TEXT(255) NULL,
[Lakc�m] TEXT(255) NULL,
[El�r�si c�m] TEXT(255) NULL,
[T�nyleges munkaid� hossza] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[�ll�shely] TEXT(255) NULL,
[Nyugd�jas st�tusz] TEXT(255) NULL
);

CREATE INDEX [Ad�azonos�t� jel] ON [tIlletm�nyek] ([Ad�azonos�t� jel]);

ALTER TABLE [tIlletm�nyek] ADD CONSTRAINT [PK_tIlletm�nyek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tImport�land�T�bl�k] (
[azT�bla] LONG NULL,
[EredetiN�v] TEXT(255) NULL,
[AccessN�v] TEXT(255) NULL,
[Kezd�Cella] TEXT(255) NULL,
[V�gcella] TEXT(255) NULL,
[Hosszm�r�Cella] TEXT(255) NULL,
[Utols�Oszlop] TEXT(255) NULL,
[AdatsorokSz�ma] LONG NULL,
[Hi�ny_lek�rdez�s] TEXT(255) NULL,
[Alap�tvonal] TEXT(255) NULL,
[F�jln�vminta] TEXT(255) NULL,
[Csoport] LONG NULL
);

ALTER TABLE [tImport�land�T�bl�k] ADD CONSTRAINT [PK_tImport�land�T�bl�k] PRIMARY KEY ([azT�bla]);

CREATE TABLE [tImport�land�T�bl�k1] (
[azT�bla] LONG NULL,
[EredetiN�v] TEXT(255) NULL,
[AccessN�v] TEXT(255) NULL,
[Kezd�Cella] TEXT(255) NULL,
[V�gcella] TEXT(255) NULL,
[Hosszm�r�Cella] TEXT(255) NULL,
[Utols�Oszlop] TEXT(255) NULL,
[AdatsorokSz�ma] LONG NULL,
[Hi�ny_lek�rdez�s] TEXT(255) NULL,
[Alap�tvonal] TEXT(255) NULL,
[F�jln�vminta] TEXT(255) NULL,
[Csoport] LONG NULL
);

ALTER TABLE [tImport�land�T�bl�k1] ADD CONSTRAINT [PK_tImport�land�T�bl�k1] PRIMARY KEY ([azT�bla]);

CREATE TABLE [tInt�zked�sek] (
[azInt�zked�sek] LONG NULL,
[azIntFajta] LONG NULL,
[Int�zked�sD�tuma] DATETIME NULL,
[Hivatkoz�s] TEXT(255) NULL
);

CREATE INDEX [tInt�zked�sFajt�ktInt�zked�sek] ON [tInt�zked�sek] ([azIntFajta]);

ALTER TABLE [tInt�zked�sek] ADD CONSTRAINT [PK_tInt�zked�sek] PRIMARY KEY ([azInt�zked�sek]);

CREATE TABLE [tInt�zked�sFajt�k] (
[azIntFajta] LONG NULL,
[Int�zked�sFajta] TEXT(255) NULL
);

ALTER TABLE [tInt�zked�sFajt�k] ADD CONSTRAINT [PK_tInt�zked�sFajt�k] PRIMARY KEY ([azIntFajta]);

CREATE TABLE [tIr�ny�t�sz�mokKoordin�t�k] (
[azIrsz] LONG NULL,
[Helys�g] TEXT(255) NULL,
[K�d] LONG NULL,
[Irsz] LONG NULL,
[Sz�less�g] TEXT(255) NULL,
[Hossz�s�g] TEXT(255) NULL,
[GCoord] TEXT(255) NULL,
[dblSz�less�g] DOUBLE NULL,
[dblHossz�s�g] DOUBLE NULL
);

ALTER TABLE [tIr�ny�t�sz�mokKoordin�t�k] ADD CONSTRAINT [PK_tIr�ny�t�sz�mokKoordin�t�k] PRIMARY KEY ([azIrsz]);

CREATE TABLE [tJ�r�si_�llom�ny] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[J�r�si Hivatal] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�9] TEXT(255) NULL,
[Mez�10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;] TEXT(255) NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Heti munka�r�k sz�ma] DOUBLE NULL,
[Mez�14] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�18] CURRENCY NULL,
[Mez�19] CURRENCY NULL,
[Mez�20] TEXT(255) NULL,
[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs] TEXT(255) NULL,
[Mez�26] TEXT(255) NULL,
[Mez�27] TEXT(255) NULL,
[Mez�28] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[hat�lyaID] LONG NULL,
[azJ�r�siSor] LONG NULL
);

CREATE INDEX [Ad�azonos�t�] ON [tJ�r�si_�llom�ny] ([Ad�azonos�t�]);

CREATE INDEX [tHaviJelent�sHat�lyatJ�r�si_�llom�ny] ON [tJ�r�si_�llom�ny] ([hat�lyaID]);

ALTER TABLE [tJ�r�si_�llom�ny] ADD CONSTRAINT [PK_tJ�r�si_�llom�ny] PRIMARY KEY ([azJ�r�siSor]);

CREATE TABLE [tJav_mez�k] (
[azJav�tand�] LONG NULL,
[tT�bl�k_azonos�t�] LONG NULL,
[azNexonMez�k] LONG NULL,
[Eredeti] TEXT(255) NULL,
[Import] TEXT(255) NULL,
[T�bl�nBel�liSorsz�ma] LONG NULL,
[NemK�telez�] YESNO NULL,
[K�telez�] YESNO NULL,
[NemK�telez��res�ll�shelyEset�n] YESNO NULL,
[K�telez��res�ll�shelyEset�n] YESNO NULL,
[�res�ll�shelyMez�] TEXT(255) NULL,
[Sz�veg] YESNO NULL
);

CREATE INDEX [NormRel1] ON [tJav_mez�k] ([tT�bl�k_azonos�t�]);

CREATE INDEX [tNexonMez�ktJav_mez�k] ON [tJav_mez�k] ([azNexonMez�k]);

ALTER TABLE [tJav_mez�k] ADD CONSTRAINT [PK_tJav_mez�k] PRIMARY KEY ([azJav�tand�]);

CREATE TABLE [tJav_t�bl�k] (
[k�d] LONG NULL,
[T�bla] TEXT(255) NULL,
[Ellen�rz�shez] TEXT(255) NULL,
[SzervezetK�d_mez�] TEXT(255) NULL,
[�res�ll�shelyMez�k] TEXT(255) NULL,
[�res�ll�shelyMez��rt�keHaAz�ll�shely�res] TEXT(255) NULL
);

CREATE INDEX [NORM_OrderByIndex] ON [tJav_t�bl�k] ([T�bla],[Ellen�rz�shez],[SzervezetK�d_mez�]);

ALTER TABLE [tJav_t�bl�k] ADD CONSTRAINT [PK_tJav_t�bl�k] PRIMARY KEY ([k�d]);

CREATE TABLE [tJav�tand�Mez�nevek_r�gi] (
[azJav�tand�] LONG NULL,
[T�bla] TEXT(255) NULL,
[Ellen�rz�shez] TEXT(255) NULL,
[azNexonMez�k] LONG NULL,
[Eredeti] TEXT(255) NULL,
[Import] TEXT(255) NULL,
[T�bl�nBel�liSorsz�ma] LONG NULL,
[NemK�telez�] YESNO NULL,
[NemK�telez��res�ll�shelyEset�n] YESNO NULL,
[�res�ll�shelyMez�] TEXT(255) NULL,
[Sz�veg] YESNO NULL,
[Select_mez�] LONG NULL
);

ALTER TABLE [tJav�tand�Mez�nevek_r�gi] ADD CONSTRAINT [PK_tJav�tand�Mez�nevek_r�gi] PRIMARY KEY ([azJav�tand�]);

CREATE TABLE [tJogviszonyKonverzi�] (
[Azonos�t�] LONG NULL,
[KIRA] TEXT(255) NULL,
[Szem�lyt�rzs] TEXT(255) NULL
);

ALTER TABLE [tJogviszonyKonverzi�] ADD CONSTRAINT [PK_tJogviszonyKonverzi�] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tKeresend�k] (
[Azonos�t�] LONG NULL,
[Sorsz�m] LONG NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL
);

ALTER TABLE [tKeresend�k] ADD CONSTRAINT [PK_tKeresend�k] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tK�sz�tend�Oldalak] (
[Azonos�t�] LONG NULL,
[K�sz�tend�Oldalak] UNKNOWN NULL
);

ALTER TABLE [tK�sz�tend�Oldalak] ADD CONSTRAINT [PK_tK�sz�tend�Oldalak] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tKiBel�p�kL�tsz�ma] (
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[D�tum] DATETIME NULL,
[F�] DOUBLE NULL
);

CREATE TABLE [tKil�p�k] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja] DATETIME NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL,
[V�gkiel�g�t�sre jogos�t� h�napok sz�ma] DOUBLE NULL,
[Felment�si id� h�napok sz�ma] TEXT(255) NULL,
[hat�lyaID] LONG NULL,
[azKil�p�kSor] LONG NULL
);

CREATE INDEX [tHaviJelent�sHat�lyatKil�p�k] ON [tKil�p�k] ([hat�lyaID]);

ALTER TABLE [tKil�p�k] ADD CONSTRAINT [PK_tKil�p�k] PRIMARY KEY ([azKil�p�kSor]);

CREATE TABLE [tKil�p�kUni�] (
[Ad�jel] DOUBLE NULL,
[azKil�p�k] LONG NULL,
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Sz�let�si �v] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alapl�tsz�m] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�8] TEXT(255) NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva] TEXT(255) NULL,
[Jogviszony kezd� d�tuma] DATETIME NULL,
[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja] DATETIME NULL,
[Illetm�ny (Ft/h�)] CURRENCY NULL,
[V�gkiel�g�t�sre jogos�t� h�napok sz�ma] DOUBLE NULL,
[Felment�si id� h�napok sz�ma] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[BFKH] TEXT(255) NULL,
[Kil�p�s] DATETIME NULL
);

CREATE TABLE [tKimenetek] (
[azKimenet] LONG NULL,
[azKimenetT�pus] LONG NULL,
[F�jln�v] TEXT(255) NULL,
[KimenetN�v] TEXT(255) NULL,
[azC�mlista] LONG NULL
);

CREATE INDEX [tC�mlist�ktKimenetek] ON [tKimenetek] ([azC�mlista]);

CREATE INDEX [tKimenetT�pusoktKimenetek] ON [tKimenetek] ([azKimenetT�pus]);

ALTER TABLE [tKimenetek] ADD CONSTRAINT [PK_tKimenetek] PRIMARY KEY ([azKimenet]);

CREATE TABLE [tKimenetLapjai] (
[azKimenetLap] LONG NULL,
[azKimenet] LONG NULL,
[strLapFajta] TEXT(255) NULL,
[strSt�lus] TEXT(255) NULL,
[strLapN�v] TEXT(255) NULL,
[ltxTartalomMegjegyz�s] MEMO NULL,
[vbaPostProcessing] MEMO NULL
);

CREATE INDEX [Lap�sKimenet] ON [tKimenetLapjai] ([azKimenet],[strLapN�v]);

CREATE INDEX [tKimenetektKiemenetLapjai] ON [tKimenetLapjai] ([azKimenet]);

ALTER TABLE [tKimenetLapjai] ADD CONSTRAINT [PK_tKimenetLapjai] PRIMARY KEY ([azKimenetLap]);

CREATE TABLE [tKimenetT�pusok] (
[azKimenetT�pus] LONG NULL,
[strKimenetT�pusNeve] TEXT(255) NULL
);

ALTER TABLE [tKimenetT�pusok] ADD CONSTRAINT [PK_tKimenetT�pusok] PRIMARY KEY ([azKimenetT�pus]);

CREATE TABLE [tKiraHiba] (
[Azonos�t�] LONG NULL,
[Ad�azonos�t�] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[KIRAzonos�t�] DOUBLE NULL,
[Egys�g] TEXT(255) NULL,
[Hiba] TEXT(255) NULL,
[ImportD�tum] DATETIME NULL
);

CREATE INDEX [Ad�azonos�t�] ON [tKiraHiba] ([Ad�azonos�t�]);

ALTER TABLE [tKiraHiba] ADD CONSTRAINT [PK_tKiraHiba] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tKiraHiba221213] (
[Azonos�t�] LONG NULL,
[Ad�azonos�t�] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[KIRAzonos�t�] DOUBLE NULL,
[Egys�g] TEXT(255) NULL,
[Hiba] TEXT(255) NULL
);

CREATE INDEX [Ad�azonos�t�] ON [tKiraHiba221213] ([Ad�azonos�t�]);

CREATE INDEX [Hiba] ON [tKiraHiba221213] ([Hiba]);

CREATE INDEX [N�v] ON [tKiraHiba221213] ([N�v]);

ALTER TABLE [tKiraHiba221213] ADD CONSTRAINT [PK_tKiraHiba221213] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tKiraHiba230712] (
[Azonos�t�] LONG NULL,
[Ad�azonos�t�] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[KIRAzonos�t�] DOUBLE NULL,
[Egys�g] TEXT(255) NULL,
[Hiba] TEXT(255) NULL
);

CREATE INDEX [Ad�azonos�t�] ON [tKiraHiba230712] ([Ad�azonos�t�]);

CREATE INDEX [Hiba] ON [tKiraHiba230712] ([Hiba]);

ALTER TABLE [tKiraHiba230712] ADD CONSTRAINT [PK_tKiraHiba230712] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tKiraHiba�zenetek] (
[Azonos�t�] LONG NULL,
[Hiba�zenet] TEXT(255) NULL,
[Magyar�zat] TEXT(255) NULL
);

ALTER TABLE [tKiraHiba�zenetek] ADD CONSTRAINT [PK_tKiraHiba�zenetek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tKorm�nyhivatal_Ker�leti_szervezeti_egys�g_sorrend] (
[az] LONG NULL,
[Sorsz�m] LONG NULL,
[Szervezeti_egys�g] TEXT(255) NULL,
[ker�let] YESNO NULL
);

ALTER TABLE [tKorm�nyhivatal_Ker�leti_szervezeti_egys�g_sorrend] ADD CONSTRAINT [PK_tKorm�nyhivatal_Ker�leti_szervezeti_egys�g_sorrend] PRIMARY KEY ([az]);

CREATE TABLE [tKorm�nyhivatali_�llom�ny] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[�NYR SZERVEZETI EGYS�G AZONOS�T�] TEXT(255) NULL,
[Mez�9] TEXT(255) NULL,
[Mez�10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;] TEXT(255) NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Heti munka�r�k sz�ma] DOUBLE NULL,
[Mez�14] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�18] CURRENCY NULL,
[Mez�19] CURRENCY NULL,
[Mez�20] TEXT(255) NULL,
[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs] TEXT(255) NULL,
[Mez�26] TEXT(255) NULL,
[Mez�27] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[hat�lyaID] LONG NULL,
[azKorm�nyhivataliSor] LONG NULL
);

CREATE INDEX [tHaviJelent�sHat�lyatKorm�nyhivatali_�llom�ny] ON [tKorm�nyhivatali_�llom�ny] ([hat�lyaID]);

ALTER TABLE [tKorm�nyhivatali_�llom�ny] ADD CONSTRAINT [PK_tKorm�nyhivatali_�llom�ny] PRIMARY KEY ([azKorm�nyhivataliSor]);

CREATE TABLE [tK�lts�gvet�shezBesorol�sok] (
[Azonos�t�] LONG NULL,
[Sor] DOUBLE NULL,
[Besorol�s] TEXT(255) NULL,
[Besorol�sSzem�lyt�rzs] TEXT(255) NULL,
[V�gzetts�g] TEXT(255) NULL,
[Jogviszony] TEXT(255) NULL
);

ALTER TABLE [tK�lts�gvet�shezBesorol�sok] ADD CONSTRAINT [PK_tK�lts�gvet�shezBesorol�sok] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tK�lts�gvet�shezHivat�sosok] (
[Azonos�t�] LONG NULL,
[Sor] DOUBLE NULL,
[Besorol�s] TEXT(255) NULL,
[Ad�azonos�t� jel] DOUBLE NULL,
[�sszesen] DOUBLE NULL
);

ALTER TABLE [tK�lts�gvet�shezHivat�sosok] ADD CONSTRAINT [PK_tK�lts�gvet�shezHivat�sosok] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tK�zigazgat�siVizsga] (
[Azonos�t�] LONG NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Dolgoz� azonos�t�] TEXT(255) NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Szerz�d�ses munkak�r] TEXT(255) NULL,
[KIRA Feladat] TEXT(255) NULL,
[Vizsga t�pusa] TEXT(255) NULL,
[Vizsg�ztat� szerv] TEXT(255) NULL,
[Vizsga eredm�nye] TEXT(255) NULL,
[Oklev�l sz�ma] TEXT(255) NULL,
[Oklev�l d�tuma] DATETIME NULL,
[Oklev�l lej�r] TEXT(255) NULL,
[Vizsga let�tel terv hat�rideje] DATETIME NULL,
[Vizsga let�tel t�ny hat�rideje] DATETIME NULL,
[Mentess�g] YESNO NULL,
[Mentess�g oka] TEXT(255) NULL,
[K�telez�s d�tuma] DATETIME NULL,
[Vizsgaid�szak �v, h�] DATETIME NULL,
[Szervszint 1] TEXT(255) NULL,
[Szervszint 2] TEXT(255) NULL,
[Szervszint 3] TEXT(255) NULL,
[Szervszint 4] TEXT(255) NULL,
[Szervszint 5] TEXT(255) NULL,
[Szervszint 6] TEXT(255) NULL,
[Szervszint 7] TEXT(255) NULL,
[Szervszint 8] TEXT(255) NULL,
[Szervszint 9] TEXT(255) NULL,
[Szervszint 10] TEXT(255) NULL,
[Szervszint 11] TEXT(255) NULL,
[Szervszint 12] TEXT(255) NULL,
[Szervszint 13] TEXT(255) NULL,
[Szervszint 14] TEXT(255) NULL,
[Szervszint 15] TEXT(255) NULL,
[Mez�33] TEXT(255) NULL
);

CREATE INDEX [Dolgoz� azonos�t�] ON [tK�zigazgat�siVizsga] ([Dolgoz� azonos�t�]);

ALTER TABLE [tK�zigazgat�siVizsga] ADD CONSTRAINT [PK_tK�zigazgat�siVizsga] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tK�zpontos�tottak] (
[Sorsz�m] DOUBLE NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t�] TEXT(255) NULL,
[Mez�4] TEXT(255) NULL,
[Megyei szint VAGY J�r�si Hivatal] TEXT(255) NULL,
[Mez�6] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[Projekt megnevez�se] TEXT(255) NULL,
[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] TEXT(255) NULL,
[Mez�10] TEXT(255) NULL,
[Mez�11] DATETIME NULL,
[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ] TEXT(255) NULL,
[Mez�13] DOUBLE NULL,
[Besorol�si fokozat k�d:] TEXT(255) NULL,
[Besorol�si fokozat megnevez�se:] TEXT(255) NULL,
[�ll�shely azonos�t�] TEXT(255) NULL,
[Mez�17] CURRENCY NULL,
[Mez�18] TEXT(255) NULL,
[Tart�s t�voll�v� nincs helyettese (TT)/ tart�s t�voll�v�nek van ] TEXT(255) NULL,
[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] TEXT(255) NULL,
[hat�lyaID] LONG NULL,
[azK�zpontos�tottakSor] LONG NULL
);

CREATE INDEX [Ad�azonos�t�] ON [tK�zpontos�tottak] ([Ad�azonos�t�]);

CREATE INDEX [tHaviJelent�sHat�lyatK�zpontos�tottak] ON [tK�zpontos�tottak] ([hat�lyaID]);

ALTER TABLE [tK�zpontos�tottak] ADD CONSTRAINT [PK_tK�zpontos�tottak] PRIMARY KEY ([azK�zpontos�tottakSor]);

CREATE TABLE [tK�zter�letJelleg] (
[Azonos�t�] LONG NULL,
[Megnevez�s (magyar)] TEXT(255) NULL,
[Hossz] DOUBLE NULL
);

ALTER TABLE [tK�zter�letJelleg] ADD CONSTRAINT [PK_tK�zter�letJelleg] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tKSZDR] (
[Azonos�t�] LONG NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[Teljes n�v] TEXT(255) NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Szervezet] TEXT(255) NULL
);

CREATE INDEX [Ad�azonos�t� jel] ON [tKSZDR] ([Ad�azonos�t� jel]);

ALTER TABLE [tKSZDR] ADD CONSTRAINT [PK_tKSZDR] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tKSZDRhib�k] (
[Azonos�t�] LONG NULL,
[N�v] TEXT(255) NULL,
[Ad�sz�m] DOUBLE NULL,
[KSZDR hi�nyz� adat] TEXT(255) NULL,
[Megold�sok] TEXT(255) NULL
);

ALTER TABLE [tKSZDRhib�k] ADD CONSTRAINT [PK_tKSZDRhib�k] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tLegmagasabbV�gzetts�g04] (
[Dolgoz� azonos�t�] TEXT(255) NULL,
[azFok] LONG NULL
);

CREATE TABLE [tLej�r�Hat�rid�k] (
[Szervezeti egys�g k�d] TEXT(255) NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Szervezeti szint sz�ma-neve] TEXT(255) NULL,
[Jogviszony t�pus] TEXT(255) NULL,
[Jogviszony kezdete] TEXT(255) NULL,
[Jogviszony v�ge] TEXT(255) NULL,
[Dolgoz� neve] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[Figyelend� d�tum t�pusa] TEXT(255) NULL,
[Figyelend� d�tum] TEXT(255) NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 6 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 6 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 7 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 7 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 8 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 8 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 9 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 9 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 10 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 10 szervezeti egys�g n�v] TEXT(255) NULL
);

CREATE INDEX [Ad�azonos�t� jel] ON [tLej�r�Hat�rid�k] ([Ad�azonos�t� jel]);

CREATE INDEX [Szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szervezeti egys�g k�d]);

CREATE INDEX [Szint 1 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szint 1 szervezeti egys�g k�d]);

CREATE INDEX [Szint 10 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szint 10 szervezeti egys�g k�d]);

CREATE INDEX [Szint 2 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szint 2 szervezeti egys�g k�d]);

CREATE INDEX [Szint 3 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szint 3 szervezeti egys�g k�d]);

CREATE INDEX [Szint 4 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szint 4 szervezeti egys�g k�d]);

CREATE INDEX [Szint 5 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szint 5 szervezeti egys�g k�d]);

CREATE INDEX [Szint 6 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szint 6 szervezeti egys�g k�d]);

CREATE INDEX [Szint 7 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szint 7 szervezeti egys�g k�d]);

CREATE INDEX [Szint 8 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szint 8 szervezeti egys�g k�d]);

CREATE INDEX [Szint 9 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k] ([Szint 9 szervezeti egys�g k�d]);

CREATE TABLE [tLej�r�Hat�rid�k_tart] (
[Szervezeti egys�g k�d] TEXT(255) NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Szervezeti szint sz�ma-neve] TEXT(255) NULL,
[Jogviszony t�pus] TEXT(255) NULL,
[Jogviszony kezdete] TEXT(255) NULL,
[Jogviszony v�ge] TEXT(255) NULL,
[Dolgoz� neve] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[Figyelend� d�tum t�pusa] TEXT(255) NULL,
[Figyelend� d�tum] TEXT(255) NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 6 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 6 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 7 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 7 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 8 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 8 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 9 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 9 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 10 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 10 szervezeti egys�g n�v] TEXT(255) NULL
);

CREATE INDEX [Ad�azonos�t� jel] ON [tLej�r�Hat�rid�k_tart] ([Ad�azonos�t� jel]);

CREATE INDEX [Szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szervezeti egys�g k�d]);

CREATE INDEX [Szint 1 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szint 1 szervezeti egys�g k�d]);

CREATE INDEX [Szint 10 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szint 10 szervezeti egys�g k�d]);

CREATE INDEX [Szint 2 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szint 2 szervezeti egys�g k�d]);

CREATE INDEX [Szint 3 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szint 3 szervezeti egys�g k�d]);

CREATE INDEX [Szint 4 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szint 4 szervezeti egys�g k�d]);

CREATE INDEX [Szint 5 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szint 5 szervezeti egys�g k�d]);

CREATE INDEX [Szint 6 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szint 6 szervezeti egys�g k�d]);

CREATE INDEX [Szint 7 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szint 7 szervezeti egys�g k�d]);

CREATE INDEX [Szint 8 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szint 8 szervezeti egys�g k�d]);

CREATE INDEX [Szint 9 szervezeti egys�g k�d] ON [tLej�r�Hat�rid�k_tart] ([Szint 9 szervezeti egys�g k�d]);

CREATE TABLE [tLek�rdez�sFuttat�sok] (
[azFuttat�s] LONG NULL,
[Id�pont] DATETIME NULL,
[Lek�rdez�sNeve] TEXT(255) NULL
);

ALTER TABLE [tLek�rdez�sFuttat�sok] ADD CONSTRAINT [PK_tLek�rdez�sFuttat�sok] PRIMARY KEY ([azFuttat�s]);

CREATE TABLE [tLek�rdez�sMez�T�pusok] (
[mezoAz] LONG NULL,
[Lek�rdez�sNeve] TEXT(255) NULL,
[Mez�Neve] TEXT(255) NULL,
[Mez�T�pusa] LONG NULL,
[Grafikonra] TEXT(255) NULL,
[Hashbe] YESNO NULL
);

CREATE INDEX [tMez�T�pusoktLek�rdez�sMez�T�pusok] ON [tLek�rdez�sMez�T�pusok] ([Mez�T�pusa]);

ALTER TABLE [tLek�rdez�sMez�T�pusok] ADD CONSTRAINT [PK_tLek�rdez�sMez�T�pusok] PRIMARY KEY ([mezoAz]);

CREATE TABLE [tLek�rdez�sOszt�lyok] (
[azOszt�ly] LONG NULL,
[Oszt�ly] TEXT(255) NULL,
[Oldalc�m] TEXT(255) NULL,
[F�jln�v] TEXT(255) NULL,
[azVisszajelz�sT�pusCsoport] LONG NULL,
[TartalomIsmertet�] TEXT(255) NULL,
[Sorrend] LONG NULL
);

CREATE INDEX [tLek�rdez�sOszt�lyokOszt�ly] ON [tLek�rdez�sOszt�lyok] ([Oszt�ly]);

CREATE INDEX [tVisszajelz�sT�pusCsoportoktLek�rdez�sOszt�lyok] ON [tLek�rdez�sOszt�lyok] ([azVisszajelz�sT�pusCsoport]);

ALTER TABLE [tLek�rdez�sOszt�lyok] ADD CONSTRAINT [PK_tLek�rdez�sOszt�lyok] PRIMARY KEY ([azOszt�ly]);

CREATE TABLE [tLek�rdez�sT�pusok] (
[azET�pus] LONG NULL,
[T�pusNeve] TEXT(255) NULL,
[LapN�v] TEXT(255) NULL,
[Megjegyz�s] MEMO NULL,
[Oszt�ly] LONG NULL,
[vbaPostProcessing] TEXT(255) NULL,
[azVisszajelz�sT�pusCsoport] LONG NULL,
[Sorrend] LONG NULL
);

CREATE INDEX [tLek�rdez�sOszt�lyoktLek�rdez�sT�pusok] ON [tLek�rdez�sT�pusok] ([Oszt�ly]);

ALTER TABLE [tLek�rdez�sT�pusok] ADD CONSTRAINT [PK_tLek�rdez�sT�pusok] PRIMARY KEY ([azET�pus]);

CREATE TABLE [tMeghagyand�kAr�nya] (
[Azonos�t�] LONG NULL,
[BFKH] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Nem ker�l meghagy�sra] DOUBLE NULL,
[Meghagyand�] DOUBLE NULL
);

ALTER TABLE [tMeghagyand�kAr�nya] ADD CONSTRAINT [PK_tMeghagyand�kAr�nya] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tMeghagyand�kAr�nya_eredeti] (
[Azonos�t�] LONG NULL,
[BFKH] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Nem ker�l meghagy�sra] DOUBLE NULL,
[Meghagyand�] DOUBLE NULL
);

ALTER TABLE [tMeghagyand�kAr�nya_eredeti] ADD CONSTRAINT [PK_tMeghagyand�kAr�nya_eredeti] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tMeghagy�s03] (
[Azonos�t�] LONG NULL,
[F�oszt�lyK�d] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[SumOfL�tsz�m] DOUBLE NULL,
[Meghagyand�%] DOUBLE NULL,
[Meghagyand�k] DOUBLE NULL
);

CREATE TABLE [tMeghagy�sB01] (
[F�oszt�lyK�d] TEXT(255) NULL,
[Sorrend] LONG NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[Sz�m] DOUBLE NULL,
[Dolgoz� teljes neve] TEXT(255) NULL
);

CREATE TABLE [tMeghagy�sB02] (
[F�oszt�lyK�d] TEXT(255) NULL,
[Besorol�s] LONG NULL,
[Sz�m] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[Sorsz�m3] DOUBLE NULL
);

CREATE TABLE [tMeghagy�sraKijel�ltMunkak�r�k] (
[azFeladatk�r] LONG NULL,
[Feladatk�r�k] TEXT(255) NULL
);

ALTER TABLE [tMeghagy�sraKijel�ltMunkak�r�k] ADD CONSTRAINT [PK_tMeghagy�sraKijel�ltMunkak�r�k] PRIMARY KEY ([azFeladatk�r]);

CREATE TABLE [tMeghagy�s�jB01] (
[BFKH] TEXT(255) NULL,
[F�oszt�lyK�d] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Dolgoz� sz�let�si neve] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Vezet�] LONG NULL,
[Kor] LONG NULL,
[Nem] LONG NULL,
[Rang] LONG NULL,
[Sz�m] DOUBLE NULL,
[Sorrend] LONG NULL,
[KIRA feladat megnevez�s] TEXT(255) NULL
);

CREATE TABLE [tMeghagy�s�jB02] (
[F�oszt�lyK�d] TEXT(255) NULL,
[Besorol�s] LONG NULL,
[Sz�m] DOUBLE NULL,
[Sorrend] LONG NULL,
[Sorsz�m3] DOUBLE NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[Dolgoz� sz�let�si neve] TEXT(255) NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Vezet�] LONG NULL,
[Kor] LONG NULL,
[Nem] LONG NULL,
[Rang] LONG NULL,
[KIRA feladat megnevez�s] TEXT(255) NULL
);

CREATE TABLE [tMegsz�n�sM�djaCsoportok] (
[azMegszCsop] LONG NULL,
[Csoport] TEXT(255) NULL,
[Megsz�n�sM�dja] TEXT(255) NULL
);

ALTER TABLE [tMegsz�n�sM�djaCsoportok] ADD CONSTRAINT [PK_tMegsz�n�sM�djaCsoportok] PRIMARY KEY ([azMegszCsop]);

CREATE TABLE [tMentess�gek] (
[Azonos�t�] LONG NULL,
[Szervezet n�v] TEXT(255) NULL,
[Szervezet telephely sorsz�m] TEXT(255) NULL,
[N�v el�tag] TEXT(255) NULL,
[Csal�dn�v] TEXT(255) NULL,
[Ut�n�v] TEXT(255) NULL,
[N�v ut�tag] TEXT(255) NULL,
[Email c�m] TEXT(255) NULL,
[Sz�let�si n�v] TEXT(255) NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Anyja neve] TEXT(255) NULL,
[Mentess�g] TEXT(255) NULL,
[Jogviszony id�szak kezdete] DATETIME NULL,
[Jogviszony id�szak v�ge] DATETIME NULL
);

ALTER TABLE [tMentess�gek] ADD CONSTRAINT [PK_tMentess�gek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tMez�T�pusok] (
[Value] LONG NULL,
[Constant] TEXT(255) NULL,
[Description] TEXT(255) NULL,
[DbType] TEXT(255) NULL
);

ALTER TABLE [tMez�T�pusok] ADD CONSTRAINT [PK_tMez�T�pusok] PRIMARY KEY ([Value]);

CREATE TABLE [tmp�NYRekHavihoz] (
[Azonos�t�] LONG NULL,
[�NYR] TEXT(255) NULL
);

ALTER TABLE [tmp�NYRekHavihoz] ADD CONSTRAINT [PK_tmp�NYRekHavihoz] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tmpF�oszt�lyok] (
[azF�oszt�ly] LONG NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL
);

ALTER TABLE [tmpF�oszt�lyok] ADD CONSTRAINT [PK_tmpF�oszt�lyok] PRIMARY KEY ([azF�oszt�ly]);

CREATE TABLE [tmpHi�nyz�Kinevez�sD�tuma] (
[Azonos�t�] LONG NULL,
[F1] DOUBLE NULL
);

ALTER TABLE [tmpHi�nyz�Kinevez�sD�tuma] ADD CONSTRAINT [PK_tmpHi�nyz�Kinevez�sD�tuma] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tmpKorrupci�EllenesLek�rdez�shez] (
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[BFKH] TEXT(255) NULL,
[Kell_e] YESNO NULL
);

CREATE TABLE [tmpLakt�mFluktu�ci�Lista] (
[Azonos�t�] LONG NULL,
[Ad�azonos�t� jel] DOUBLE NULL
);

ALTER TABLE [tmpLakt�mFluktu�ci�Lista] ADD CONSTRAINT [PK_tmpLakt�mFluktu�ci�Lista] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tmpMSysNavPaneGroups] (
[Flags] LONG NULL,
[GroupCategoryID] LONG NULL,
[Id] LONG NULL,
[Name] TEXT(255) NULL,
[Object Type Group] LONG NULL,
[ObjectID] LONG NULL,
[Position] LONG NULL
);

ALTER TABLE [tmpMSysNavPaneGroups] ADD CONSTRAINT [PK_tmpMSysNavPaneGroups] PRIMARY KEY ([Id]);

CREATE TABLE [TmptEsk�Lej�rtId�pontok] (
[Szervezeti egys�g k�d] TEXT(255) NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Szervezeti szint sz�ma-neve] TEXT(255) NULL,
[Jogviszony t�pus] TEXT(255) NULL,
[  Jogviszony kezdete] TEXT(255) NULL,
[  Jogviszony v�ge] TEXT(255) NULL,
[Dolgoz� neve] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[Figyelend� d�tum t�pusa] TEXT(255) NULL,
[Figyelend� d�tum] TEXT(255) NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 6 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 6 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 7 szervezeti egys�g k�d] DOUBLE NULL,
[Szint 7 szervezeti egys�g n�v] DOUBLE NULL,
[Szint 8 szervezeti egys�g k�d] DOUBLE NULL,
[Szint 8 szervezeti egys�g n�v] DOUBLE NULL,
[Szint 9 szervezeti egys�g k�d] DOUBLE NULL,
[Szint 9 szervezeti egys�g n�v] DOUBLE NULL,
[Szint 10 szervezeti egys�g k�d] DOUBLE NULL,
[Szint 10 szervezeti egys�g n�v] DOUBLE NULL,
[F31] DOUBLE NULL,
[F32] DOUBLE NULL
);

CREATE TABLE [tmpV�d�n�k20241121] (
[Azonos�t�] LONG NULL,
[Ad�jel] DOUBLE NULL,
[D�tum] DATETIME NULL,
[V�d�n�] YESNO NULL,
[Vezet� v�d�n�] YESNO NULL
);

ALTER TABLE [tmpV�d�n�k20241121] ADD CONSTRAINT [PK_tmpV�d�n�k20241121] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tNapok03] (
[�v] DOUBLE NULL,
[Nap] DOUBLE NULL,
[D�tum] DATETIME NULL
);

CREATE TABLE [tNevekOlt�shoz] (
[Azonos�t�] LONG NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[Oltand�k] TEXT(255) NULL
);

ALTER TABLE [tNevekOlt�shoz] ADD CONSTRAINT [PK_tNevekOlt�shoz] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tNevekOlt�shoz2] (
[Azonos�t�] LONG NULL,
[N�v1] TEXT(255) NULL
);

ALTER TABLE [tNevekOlt�shoz2] ADD CONSTRAINT [PK_tNevekOlt�shoz2] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tNexonAzonos�t�k] (
[Azonos�t�] LONG NULL,
[Szem�ly azonos�t�] DOUBLE NOT NULL,
[HR kapcsolat azonos�t�] DOUBLE NOT NULL,
[N�v] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Jogviszony t�pus] TEXT(255) NULL,
[Kezdete] TEXT(255) NULL,
[V�ge] TEXT(255) NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Munkak�r] TEXT(255) NULL,
[St�tusz] TEXT(255) NULL,
[T�rt�netiSorsz�m] LONG NULL
);

CREATE INDEX [Ad�azonos�t� jel] ON [tNexonAzonos�t�k] ([Ad�azonos�t� jel]);

CREATE INDEX [HR kapcsolat azonos�t�] ON [tNexonAzonos�t�k] ([HR kapcsolat azonos�t�]);

CREATE INDEX [Szem�ly azonos�t�] ON [tNexonAzonos�t�k] ([Szem�ly azonos�t�]);

CREATE INDEX [Szem�lyKapcsolat] ON [tNexonAzonos�t�k] ([Szem�ly azonos�t�],[HR kapcsolat azonos�t�]);

ALTER TABLE [tNexonAzonos�t�k] ADD CONSTRAINT [PK_tNexonAzonos�t�k] PRIMARY KEY ([HR kapcsolat azonos�t�]);

CREATE TABLE [tNexonForr�s] (
[Azonos�t�] LONG NULL,
[NEXON szem�ly ID] DOUBLE NULL,
[Nexonos szerv#egys#azon#] TEXT(255) NULL,
[Forr�s Szerv#egys#] TEXT(255) NULL,
[Forr�s Szem�ly azon#] TEXT(255) NULL
);

ALTER TABLE [tNexonForr�s] ADD CONSTRAINT [PK_tNexonForr�s] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tNexonMez�k] (
[azNexonMez�] LONG NULL,
[Nexon mez� megnevez�se] TEXT(255) NULL,
[Megjegyz�s] MEMO NULL
);

ALTER TABLE [tNexonMez�k] ADD CONSTRAINT [PK_tNexonMez�k] PRIMARY KEY ([azNexonMez�]);

CREATE TABLE [tOroszUkr�nNyelvvizsg�k20240912] (
[Azonos�t�] LONG NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Dolgoz� azonos�t�] DOUBLE NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Szerz�d�ses munkak�r] TEXT(255) NULL,
[KIRA Feladat] TEXT(255) NULL,
[Nyelv neve] TEXT(255) NULL,
[Nyelvvizsga foka] TEXT(255) NULL,
[Nyelvvizsga t�pusa] TEXT(255) NULL,
[Tud�sszint] TEXT(255) NULL,
[Ki�ll�t� int�zm�ny] TEXT(255) NULL,
[Bizony�tv�ny sz�ma] TEXT(255) NULL,
[Ki�ll�t�s d�tuma] DATETIME NULL,
[Kapcsolt k�pz�s adat] TEXT(255) NULL,
[Kapcsolt tanfolyam adat] TEXT(255) NULL,
[Nyelvismeret szakvizsga t�pusa] TEXT(255) NULL,
[Nyelvp�tl�k j�r] YESNO NULL,
[Figyelembe v�tel kezdet] DATETIME NULL,
[Figyelembe v�tel v�ge] TEXT(255) NULL,
[Szerv#szint 1] TEXT(255) NULL,
[Szerv#szint 2] TEXT(255) NULL,
[Szerv#szint 3] TEXT(255) NULL,
[Szerv#szint 4] TEXT(255) NULL,
[Szerv#szint 5] TEXT(255) NULL,
[Szerv#szint 6] TEXT(255) NULL,
[Szerv#szint 7] TEXT(255) NULL,
[Szerv#szint 8] TEXT(255) NULL,
[Szerv#szint 9] TEXT(255) NULL,
[Szerv#szint 10] TEXT(255) NULL,
[Szerv#szint 11] TEXT(255) NULL,
[Szerv#szint 12] TEXT(255) NULL,
[Szerv#szint 13] TEXT(255) NULL,
[Szerv#szint 14] TEXT(255) NULL,
[Szerv#szint 15] TEXT(255) NULL,
[Szerv#szint 151] TEXT(255) NULL,
[Nyelv/foka/t�pusa] TEXT(255) NULL
);

ALTER TABLE [tOroszUkr�nNyelvvizsg�k20240912] ADD CONSTRAINT [PK_tOroszUkr�nNyelvvizsg�k20240912] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tOrvosiAlkalmass�giVizsg�latok202310-202408�sszef�z�tt] (
[TAJ] DOUBLE NULL,
[D�tum] DATETIME NULL,
[D�tum2] TEXT(255) NULL
);

CREATE TABLE [tOrvosi�ll�shelyek] (
[azOrvosi�ll�shely] LONG NULL,
[alapl�tsz�mba tartoz� orvosi  �ll�shely azonos�t�ja] TEXT(255) NULL,
[Hat�lyKezdet] DATETIME NULL,
[Hat�lyV�g] DATETIME NULL
);

CREATE INDEX [St�tuszHat�ly] ON [tOrvosi�ll�shelyek] ([Hat�lyKezdet],[alapl�tsz�mba tartoz� orvosi  �ll�shely azonos�t�ja]);

ALTER TABLE [tOrvosi�ll�shelyek] ADD CONSTRAINT [PK_tOrvosi�ll�shelyek] PRIMARY KEY ([azOrvosi�ll�shely]);

CREATE TABLE [tOrvosokAdatai] (
[azOrvos] LONG NULL,
[Ad�jel] DOUBLE NULL,
[EszmeiId�Kezdete] DATETIME NULL,
[�vekSz�ma] LONG NULL,
[EszjtvBesorol�sSzerintiIlletm�ny] CURRENCY NULL,
[Nyilv�ntart�siSz�m] LONG NULL,
[OrvosHat�lyV�ge] DATETIME NULL
);

ALTER TABLE [tOrvosokAdatai] ADD CONSTRAINT [PK_tOrvosokAdatai] PRIMARY KEY ([azOrvos]);

CREATE TABLE [t�sszesUt�n�v] (
[Azonos�t�] LONG NULL,
[Ut�n�v] TEXT(255) NULL,
[Nem] LONG NULL
);

CREATE INDEX [Ut�n�v] ON [t�sszesUt�n�v] ([Ut�n�v]);

ALTER TABLE [t�sszesUt�n�v] ADD CONSTRAINT [PK_t�sszesUt�n�v] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tPGFt�bla] (
[Azonos�t�] LONG NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Mez�3] TEXT(255) NULL,
[F�oszt�ly/Ker�leti Hivatal] TEXT(255) NULL,
[Mez�5] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[St�tusz k�dja �NYR sz�m] TEXT(255) NULL,
[Besorol�si  fokozat (KT)] TEXT(255) NULL,
[St�tusz t�pusa alapl�tsz�m/k�zpontos�tott] TEXT(255) NULL,
[Mez�10] TEXT(255) NULL,
[Foglalkoz�si viszony statisztikai besorol�sa] TEXT(255) NULL,
[Ledolgozand� heti �rakeret] DOUBLE NULL,
[Mez�13] DOUBLE NULL,
[K�L�NBS�G] DOUBLE NULL,
[Jogviszony tipusa (hat�rozott/hat�rozatlan)] TEXT(255) NULL,
[Jogviszony t�pusa / (Kit/MT)] TEXT(255) NULL,
[Jogviszony kezdete (bel�p�s d�tuma)] DATETIME NULL,
[Jogviszony v�ge (kil�p�s d�tuma)] DATETIME NULL,
[JOGVISZONY V�GE] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Mez�21] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Helyettes�tett dolgoz� neve] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�t�s n�lk�li)] CURRENCY NULL,
[Mez�26] DOUBLE NULL,
[Mez�27] DOUBLE NULL,
[Javasolt emel�s] CURRENCY NULL,
[�j illetm�ny] CURRENCY NULL,
[%] DOUBLE NULL,
[Illetm�ny als� hat�ra] CURRENCY NULL,
[Illetm�ny fels� hat�ra] DOUBLE NULL,
[Ellen�rz�s Als�] TEXT(255) NULL,
[Ellen�rz�s Fels�] TEXT(255) NULL,
[Kontroll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL
);

CREATE INDEX [Ad�azonos�t� jel] ON [tPGFt�bla] ([Ad�azonos�t� jel]);

ALTER TABLE [tPGFt�bla] ADD CONSTRAINT [PK_tPGFt�bla] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tReferensekF�oszt�lyok] (
[azRef] LONG NULL,
[F�oszt�ly] TEXT(255) NULL,
[bfkhF�oszt�ly] TEXT(255) NULL,
[Referens] TEXT(255) NULL,
[Ar�ny] TEXT(255) NULL,
[azNexon] LONG NULL,
[Oszt�ly] TEXT(255) NULL,
[bfkhOszt�ly] TEXT(255) NULL,
[Telefon] TEXT(255) NULL,
[Szoba] TEXT(255) NULL,
[azSzoba] LONG NULL
);

ALTER TABLE [tReferensekF�oszt�lyok] ADD CONSTRAINT [PK_tReferensekF�oszt�lyok] PRIMARY KEY ([azRef]);

CREATE TABLE [tReferensekTer�letN�lk�l] (
[Azonos�t�] LONG NULL,
[NexonAz] LONG NULL
);

ALTER TABLE [tReferensekTer�letN�lk�l] ADD CONSTRAINT [PK_tReferensekTer�letN�lk�l] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tR�giHib�k] (
[Els� mez�] TEXT(255) NOT NULL,
[M�sodik mez�] MEMO NULL,
[Els� Id�pont] DATETIME NULL,
[Utols� Id�pont] DATETIME NULL,
[lek�rdez�sNeve] TEXT(255) NULL
);

CREATE INDEX [Id�pont] ON [tR�giHib�k] ([Els� Id�pont]);

ALTER TABLE [tR�giHib�k] ADD CONSTRAINT [PK_tR�giHib�k] PRIMARY KEY ([Els� mez�]);

CREATE TABLE [tSpecifikusDolgoz�k] (
[Azonos�t�] LONG NULL,
[Sz�let�si n�v] TEXT(255) NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Anyja neve] TEXT(255) NULL
);

ALTER TABLE [tSpecifikusDolgoz�k] ADD CONSTRAINT [PK_tSpecifikusDolgoz�k] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tSzakfeladatForr�sk�d] (
[Azonos�t�] LONG NULL,
[SZAKFELADAT] TEXT(255) NULL,
[SzervEgysK�d] TEXT(255) NULL
);

ALTER TABLE [tSzakfeladatForr�sk�d] ADD CONSTRAINT [PK_tSzakfeladatForr�sk�d] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tSzakter�letSzervezet] (
[Szakter�leti adatszolg�ltat�s] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL
);

CREATE TABLE [tSzem�lyek] (
[Azonos�t�] LONG NULL,
[Ad�jel] DOUBLE NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Dolgoz� sz�let�si neve] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[�gyf�lkapu k�d] TEXT(255) NULL,
[Els�dleges �llampolg�rs�g] TEXT(255) NULL,
[Szem�lyi igazolv�ny sz�ma] TEXT(255) NULL,
[Szem�lyi igazolv�ny �rv�nyess�g kezdete] DATETIME NULL,
[Szem�lyi igazolv�ny �rv�nyess�g v�ge] DATETIME NULL,
[Nyelvtud�s Angol] TEXT(255) NULL,
[Nyelvtud�s Arab] TEXT(255) NULL,
[Nyelvtud�s Bolg�r] TEXT(255) NULL,
[Nyelvtud�s Cig�ny] TEXT(255) NULL,
[Nyelvtud�s Cig�ny (lov�ri)] TEXT(255) NULL,
[Nyelvtud�s Cseh] TEXT(255) NULL,
[Nyelvtud�s Eszperant�] TEXT(255) NULL,
[Nyelvtud�s Finn] TEXT(255) NULL,
[Nyelvtud�s Francia] TEXT(255) NULL,
[Nyelvtud�s H�ber] TEXT(255) NULL,
[Nyelvtud�s Holland] TEXT(255) NULL,
[Nyelvtud�s Horv�t] TEXT(255) NULL,
[Nyelvtud�s Jap�n] TEXT(255) NULL,
[Nyelvtud�s Jelnyelv] TEXT(255) NULL,
[Nyelvtud�s K�nai] TEXT(255) NULL,
[Nyelvtud�s Latin] TEXT(255) NULL,
[Nyelvtud�s Lengyel] TEXT(255) NULL,
[Nyelvtud�s N�met] TEXT(255) NULL,
[Nyelvtud�s Norv�g] TEXT(255) NULL,
[Nyelvtud�s Olasz] TEXT(255) NULL,
[Nyelvtud�s Orosz] TEXT(255) NULL,
[Nyelvtud�s Portug�l] TEXT(255) NULL,
[Nyelvtud�s Rom�n] TEXT(255) NULL,
[Nyelvtud�s Spanyol] TEXT(255) NULL,
[Nyelvtud�s Szerb] TEXT(255) NULL,
[Nyelvtud�s Szlov�k] TEXT(255) NULL,
[Nyelvtud�s Szlov�n] TEXT(255) NULL,
[Nyelvtud�s T�r�k] TEXT(255) NULL,
[Nyelvtud�s �jg�r�g] TEXT(255) NULL,
[Nyelvtud�s Ukr�n] TEXT(255) NULL,
[Orvosi vizsg�lat id�pontja] DATETIME NULL,
[Orvosi vizsg�lat t�pusa] TEXT(255) NULL,
[Orvosi vizsg�lat eredm�nye] TEXT(255) NULL,
[Orvosi vizsg�lat �szrev�telek] TEXT(255) NULL,
[Orvosi vizsg�lat k�vetkez� id�pontja] DATETIME NULL,
[Erk�lcsi bizony�tv�ny sz�ma] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny d�tuma] DATETIME NULL,
[Erk�lcsi bizony�tv�ny eredm�nye] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�relem azonos�t�] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�z�gyekt�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny j�rm�vezet�st�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny int�zked�s alatt �ll] TEXT(255) NULL,
[Munkak�ri le�r�sok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Egy�b HR dokumentumok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Korm�nyhivatal r�vid neve] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[Szervezeti egys�g neve] TEXT(255) NULL,
[Szervezeti munkak�r neve] TEXT(255) NULL,
[Vezet�i megb�z�s t�pusa] TEXT(255) NULL,
[St�tusz k�dja] TEXT(255) NULL,
[St�tusz k�lts�ghely�nek k�dja] TEXT(255) NULL,
[St�tusz k�lts�ghely�nek neve ] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] YESNO NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz neve] TEXT(255) NULL,
[T�bbes bet�lt�s] YESNO NULL,
[Vezet� neve] TEXT(255) NULL,
[Vezet� ad�azonos�t� jele] TEXT(255) NULL,
[Vezet� email c�me] TEXT(255) NULL,
[�lland� lakc�m] TEXT(255) NULL,
[Tart�zkod�si lakc�m] TEXT(255) NULL,
[Levelez�si c�m_] TEXT(255) NULL,
[�regs�gi nyugd�j-korhat�r el�r�s�nek id�pontja (d�tum)] DATETIME NULL,
[Nyugd�jas] YESNO NULL,
[Nyugd�j t�pusa] TEXT(255) NULL,
[Nyugd�jas kor� tov�bbfoglalkoztat�si enged�llyel rendelkezik] TEXT(255) NULL,
[Megv�ltozott munkak�pess�g] YESNO NULL,
[�nk�ntes tartal�kos katona] YESNO NULL,
[Utols� vagyonnyilatkozat lead�s�nak d�tuma] DATETIME NULL,
[Vagyonnyilatkozat nyilv�ntart�si sz�ma] TEXT(255) NULL,
[K�vetkez� vagyonnyilatkozat esed�kess�ge] DATETIME NULL,
[Nemzetbiztons�gi ellen�rz�s d�tuma] TEXT(255) NULL,
[V�dett �llom�nyba tartoz� munkak�r] YESNO NULL,
[Vezet�i megb�z�s t�pusa1] TEXT(255) NULL,
[Vezet�i beoszt�s megnevez�se] TEXT(255) NULL,
[Vezet�i beoszt�s (megb�z�s) kezdete] DATETIME NULL,
[Vezet�i beoszt�s (megb�z�s) v�ge] TEXT(255) NULL,
[Iskolai v�gzetts�g foka] TEXT(255) NULL,
[Iskolai v�gzetts�g neve] TEXT(255) NULL,
[Alapvizsga k�telez�s d�tuma] DATETIME NULL,
[Alapvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Alapvizsga mentess�g] YESNO NULL,
[Alapvizsga mentess�g oka] TEXT(255) NULL,
[Szakvizsga k�telez�s d�tuma] TEXT(255) NULL,
[Szakvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Szakvizsga mentess�g] YESNO NULL,
[Foglalkoz�si viszony] TEXT(255) NULL,
[Foglalkoz�si viszony statisztikai besorol�sa] TEXT(255) NULL,
[Dolgoz� szerz�d�ses/kinevez�ses munkak�re / kinevez�si okm�nyban] TEXT(255) NULL,
[Beoszt�stervez�s helysz�nek] TEXT(255) NULL,
[Beoszt�stervez�s tev�kenys�gek] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s kezdete] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s v�ge] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s intervalluma] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s m�rt�ke] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 2] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 3] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s kezdete] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s v�ge] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s m�rt�ke] TEXT(255) NULL,
[KIRA feladat azonos�t�ja - int�zm�ny prefix-szel ell�tva] TEXT(255) NULL,
[KIRA feladat azonos�t�ja] TEXT(255) NULL,
[KIRA feladat megnevez�s] TEXT(255) NULL,
[Osztott munkak�r] TEXT(255) NULL,
[Funkci�csoport: k�d-megnevez�s] TEXT(255) NULL,
[Funkci�: k�d-megnevez�s] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek k�dja] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek neve] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Els�dleges feladatk�r] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� napi �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� havi �raker] DOUBLE NULL,
[Szerz�d�s/Kinevez�s t�pusa] TEXT(255) NULL,
[Iktat�sz�m] TEXT(255) NULL,
[Szerz�d�s/kinevez�s verzi�_�rv�nyess�g kezdete] DATETIME NULL,
[Szerz�d�s/kinevez�s verzi�_�rv�nyess�g v�ge] TEXT(255) NULL,
[Hat�rozott idej� _szerz�d�s/kinevez�s lej�r] TEXT(255) NULL,
[Szerz�d�s dokumentum (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Megjegyz�s (pl# hat�rozott szerz�d�s/kinevez�s oka)] TEXT(255) NULL,
[Munkav�gz�s helye - megnevez�s] TEXT(255) NULL,
[Munkav�gz�s helye - c�m] TEXT(255) NULL,
[Jogviszony t�pusa / jogviszony t�pus] TEXT(255) NULL,
[Jogviszony sorsz�ma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[K�lcs�nbe ad� c�g] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kel� szem�ly] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rv�nyess�g kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak v�ge] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s d�tuma] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Be�ll�si sz�zal�k] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Pontsz�m] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Megjegyz�s] TEXT(255) NULL,
[Dolgoz�i jellemz�k] TEXT(255) NULL,
[Fizet�si oszt�ly (KA)/ Pedag�gusi fokozat (KA pedag�gus)/besorol] TEXT(255) NULL,
[Besorol�si  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos id� kezdete] TEXT(255) NULL,
[Jogviszony kezdete (bel�p�s d�tuma)] DATETIME NULL,
[Jogviszony v�ge (kil�p�s d�tuma)] DATETIME NULL,
[Utols� munk�ban t�lt�tt nap] TEXT(255) NULL,
[Kezdem�nyez�s d�tuma] TEXT(255) NULL,
[Hat�lyoss� v�lik] TEXT(255) NULL,
[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)] TEXT(255) NULL,
[HR kapcsolat megsz�nes indoka (Kil�p�s indoka)] TEXT(255) NULL,
[Indokol�s] TEXT(255) NULL,
[K�vetkez� munkahely] TEXT(255) NULL,
[MT: Felmond�si id� kezdete KJT, KTTV: Felment�si id� kezdete] TEXT(255) NULL,
[Felmond�si id� v�ge (MT) Felment�si id� v�ge (KJT, KTTV)] TEXT(255) NULL,
[Munkav�gz�s al�li mentes�t�s kezdete (KJT, KTTV) Felment�si id� ] TEXT(255) NULL,
[Munkav�gz�s al�li mentes�t�s v�ge (KJT, KTTV) Felment�si id� v�g] TEXT(255) NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] TEXT(255) NULL,
[Tart�s t�voll�t v�ge] TEXT(255) NULL,
[Tart�s t�voll�t tervezett v�ge] TEXT(255) NULL,
[Helyettes�tett dolgoz� neve] TEXT(255) NULL,
[Szerz�d�s/Kinevez�s - pr�baid� v�ge] DATETIME NULL,
[Utal�si c�m] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Garant�lt b�rminimumra t�rt�n� kieg�sz�t�s] TEXT(255) NULL,
[Kerek�t�s] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S % (elt�r�t] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S �sszeg (el] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�t�s n�l] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Elt�r�t�s %] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�tett)] DOUBLE NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S % (elt�r�1] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S �sszeg (e1] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�tett)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�tett)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�tett)] DOUBLE NULL,
[Tov�bbi munkav�gz�s helye 1 Teljes munkaid� %-a] TEXT(255) NULL,
[Tov�bbi munkav�gz�s helye 2 Teljes munkaid� %-a] TEXT(255) NULL,
[KT: Kerek�tett 100 %-os illetm�ny (elt�r�tett) + Helyettes�t�si ] DOUBLE NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 6 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 6 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 7 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 7 szervezeti egys�g k�d] TEXT(255) NULL,
[AD egyedi azonos�t�] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mell�k] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[Tov�bbi otthoni mobil] TEXT(255) NULL
);

CREATE INDEX [Ad�jel] ON [tSzem�lyek] ([Ad�jel]);

CREATE INDEX [St�tusz k�dja] ON [tSzem�lyek] ([St�tusz k�dja]);

CREATE INDEX [Szervezeti egys�g k�dja] ON [tSzem�lyek] ([Szervezeti egys�g k�dja]);

ALTER TABLE [tSzem�lyek] ADD CONSTRAINT [PK_tSzem�lyek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tSzem�lyek_import] (
[Ad�jel] DOUBLE NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Dolgoz� sz�let�si neve] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[�gyf�lkapu k�d] TEXT(255) NULL,
[Els�dleges �llampolg�rs�g] TEXT(255) NULL,
[Szem�lyi igazolv�ny sz�ma] TEXT(255) NULL,
[Szem�lyi igazolv�ny �rv�nyess�g kezdete] DATETIME NULL,
[Szem�lyi igazolv�ny �rv�nyess�g v�ge] DATETIME NULL,
[�tlev�l sz�ma] TEXT(255) NULL,
[�tlev�l �rv�nyess�g v�ge] TEXT(255) NULL,
[Nyelvtud�s Angol] TEXT(255) NULL,
[Nyelvtud�s Arab] TEXT(255) NULL,
[Nyelvtud�s Bolg�r] TEXT(255) NULL,
[Nyelvtud�s Cig�ny] TEXT(255) NULL,
[Nyelvtud�s Cig�ny (lov�ri)] TEXT(255) NULL,
[Nyelvtud�s Cseh] TEXT(255) NULL,
[Nyelvtud�s Eszperant�] TEXT(255) NULL,
[Nyelvtud�s Finn] TEXT(255) NULL,
[Nyelvtud�s Francia] TEXT(255) NULL,
[Nyelvtud�s H�ber] TEXT(255) NULL,
[Nyelvtud�s Holland] TEXT(255) NULL,
[Nyelvtud�s Horv�t] TEXT(255) NULL,
[Nyelvtud�s Jap�n] TEXT(255) NULL,
[Nyelvtud�s Jelnyelv] TEXT(255) NULL,
[Nyelvtud�s K�nai] TEXT(255) NULL,
[Nyelvtud�s Koreai] TEXT(255) NULL,
[Nyelvtud�s Latin] TEXT(255) NULL,
[Nyelvtud�s Lengyel] TEXT(255) NULL,
[Nyelvtud�s N�met] TEXT(255) NULL,
[Nyelvtud�s Norv�g] TEXT(255) NULL,
[Nyelvtud�s Olasz] TEXT(255) NULL,
[Nyelvtud�s Orosz] TEXT(255) NULL,
[Nyelvtud�s Portug�l] TEXT(255) NULL,
[Nyelvtud�s Rom�n] TEXT(255) NULL,
[Nyelvtud�s Spanyol] TEXT(255) NULL,
[Nyelvtud�s Szerb] TEXT(255) NULL,
[Nyelvtud�s Szlov�k] TEXT(255) NULL,
[Nyelvtud�s Szlov�n] TEXT(255) NULL,
[Nyelvtud�s T�r�k] TEXT(255) NULL,
[Nyelvtud�s �jg�r�g] TEXT(255) NULL,
[Nyelvtud�s Ukr�n] TEXT(255) NULL,
[Orvosi vizsg�lat id�pontja] DATETIME NULL,
[Orvosi vizsg�lat t�pusa] TEXT(255) NULL,
[Orvosi vizsg�lat eredm�nye] TEXT(255) NULL,
[Orvosi vizsg�lat �szrev�telek] TEXT(255) NULL,
[Orvosi vizsg�lat k�vetkez� id�pontja] DATETIME NULL,
[Erk�lcsi bizony�tv�ny sz�ma] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny d�tuma] DATETIME NULL,
[Erk�lcsi bizony�tv�ny eredm�nye] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�relem azonos�t�] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�z�gyekt�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny j�rm�vezet�st�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny int�zked�s alatt �ll] TEXT(255) NULL,
[Munkak�ri le�r�sok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Egy�b HR dokumentumok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Korm�nyhivatal r�vid neve] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[Szervezeti egys�g neve] TEXT(255) NULL,
[Szervezeti munkak�r neve] TEXT(255) NULL,
[Vezet�i megb�z�s t�pusa] TEXT(255) NULL,
[St�tusz k�dja] TEXT(255) NULL,
[St�tusz k�lts�ghely�nek k�dja] TEXT(255) NULL,
[St�tusz k�lts�ghely�nek neve ] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] YESNO NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz neve] TEXT(255) NULL,
[T�bbes bet�lt�s] YESNO NULL,
[Vezet� neve] TEXT(255) NULL,
[Vezet� ad�azonos�t� jele] TEXT(255) NULL,
[Vezet� email c�me] TEXT(255) NULL,
[�lland� lakc�m] TEXT(255) NULL,
[Tart�zkod�si lakc�m] TEXT(255) NULL,
[Levelez�si c�m_] TEXT(255) NULL,
[�regs�gi nyugd�j-korhat�r el�r�s�nek id�pontja (d�tum)] DATETIME NULL,
[Nyugd�jas] YESNO NULL,
[Nyugd�j t�pusa] TEXT(255) NULL,
[Nyugd�jas kor� tov�bbfoglalkoztat�si enged�llyel rendelkezik] TEXT(255) NULL,
[Megv�ltozott munkak�pess�g] YESNO NULL,
[�nk�ntes tartal�kos katona] YESNO NULL,
[Utols� vagyonnyilatkozat lead�s�nak d�tuma] DATETIME NULL,
[Vagyonnyilatkozat nyilv�ntart�si sz�ma] TEXT(255) NULL,
[K�vetkez� vagyonnyilatkozat esed�kess�ge] DATETIME NULL,
[Nemzetbiztons�gi ellen�rz�sre k�telezett] TEXT(255) NULL,
[Nemzetbiztons�gi ellen�rz�s d�tuma] TEXT(255) NULL,
[V�dett �llom�nyba tartoz� munkak�r] YESNO NULL,
[Vezet�i megb�z�s t�pusa1] TEXT(255) NULL,
[Vezet�i beoszt�s megnevez�se] TEXT(255) NULL,
[Vezet�i beoszt�s (megb�z�s) kezdete] DATETIME NULL,
[Vezet�i beoszt�s (megb�z�s) v�ge] TEXT(255) NULL,
[Iskolai v�gzetts�g foka] TEXT(255) NULL,
[Iskolai v�gzetts�g neve] TEXT(255) NULL,
[Alapvizsga k�telez�s d�tuma] DATETIME NULL,
[Alapvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Alapvizsga mentess�g] YESNO NULL,
[Alapvizsga mentess�g oka] TEXT(255) NULL,
[Szakvizsga k�telez�s d�tuma] TEXT(255) NULL,
[Szakvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Szakvizsga mentess�g] YESNO NULL,
[Foglalkoz�si viszony] TEXT(255) NULL,
[Foglalkoz�si viszony statisztikai besorol�sa] TEXT(255) NULL,
[Dolgoz� szerz�d�ses/kinevez�ses munkak�re / kinevez�si okm�nyban] TEXT(255) NULL,
[Beoszt�stervez�s helysz�nek] TEXT(255) NULL,
[Beoszt�stervez�s tev�kenys�gek] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s kezdete] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s v�ge] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s intervalluma] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s m�rt�ke] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 2] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 3] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s kezdete] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s v�ge] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s m�rt�ke] TEXT(255) NULL,
[KIRA feladat azonos�t�ja - int�zm�ny prefix-szel ell�tva] TEXT(255) NULL,
[KIRA feladat azonos�t�ja] TEXT(255) NULL,
[KIRA feladat megnevez�s] TEXT(255) NULL,
[Osztott munkak�r] TEXT(255) NULL,
[Funkci�csoport: k�d-megnevez�s] TEXT(255) NULL,
[Funkci�: k�d-megnevez�s] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek k�dja] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek neve] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Els�dleges feladatk�r] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� napi �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� havi �raker] DOUBLE NULL,
[Szerz�d�s/Kinevez�s t�pusa] TEXT(255) NULL,
[Iktat�sz�m] TEXT(255) NULL,
[Szerz�d�s/kinevez�s verzi�_�rv�nyess�g kezdete] DATETIME NULL,
[Szerz�d�s/kinevez�s verzi�_�rv�nyess�g v�ge] DATETIME NULL,
[Hat�rozott idej� _szerz�d�s/kinevez�s lej�r] TEXT(255) NULL,
[Szerz�d�s dokumentum (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Megjegyz�s (pl# hat�rozott szerz�d�s/kinevez�s oka)] TEXT(255) NULL,
[Munkav�gz�s helye - megnevez�s] TEXT(255) NULL,
[Munkav�gz�s helye - c�m] TEXT(255) NULL,
[Jogviszony t�pusa / jogviszony t�pus] TEXT(255) NULL,
[Jogviszony sorsz�ma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[K�lcs�nbe ad� c�g] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kel� szem�ly] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rv�nyess�g kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak v�ge] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s d�tuma] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Be�ll�si sz�zal�k] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Pontsz�m] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Megjegyz�s] TEXT(255) NULL,
[Dolgoz�i jellemz�k] TEXT(255) NULL,
[Pr�mium �ves] TEXT(255) NULL,
[Fizet�si oszt�ly (KA)/ Pedag�gusi fokozat (KA pedag�gus)/besorol] TEXT(255) NULL,
[Besorol�si  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos id� kezdete] TEXT(255) NULL,
[Jogviszony kezdete (bel�p�s d�tuma)] DATETIME NULL,
[Jogviszony v�ge (kil�p�s d�tuma)] DATETIME NULL,
[Utols� munk�ban t�lt�tt nap] TEXT(255) NULL,
[Kezdem�nyez�s d�tuma] DATETIME NULL,
[Hat�lyoss� v�lik] DATETIME NULL,
[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)] TEXT(255) NULL,
[HR kapcsolat megsz�nes indoka (Kil�p�s indoka)] TEXT(255) NULL,
[Indokol�s] TEXT(255) NULL,
[K�vetkez� munkahely] TEXT(255) NULL,
[MT: Felmond�si id� kezdete KJT, KTTV: Felment�si id� kezdete] TEXT(255) NULL,
[Felmond�si id� v�ge (MT) Felment�si id� v�ge (KJT, KTTV)] DATETIME NULL,
[Munkav�gz�s al�li mentes�t�s kezdete (KJT, KTTV) Felment�si id� ] TEXT(255) NULL,
[Munkav�gz�s al�li mentes�t�s v�ge (KJT, KTTV) Felment�si id� v�g] TEXT(255) NULL,
[�tmeneti elt�r� foglalkoztat�s t�pusa] TEXT(255) NULL,
[�tmeneti elt�r� foglalkoztat�s kezdete] TEXT(255) NULL,
[�tmeneti elt�r� foglalkoztat�s v�ge] TEXT(255) NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] TEXT(255) NULL,
[Tart�s t�voll�t v�ge] TEXT(255) NULL,
[Tart�s t�voll�t tervezett v�ge] TEXT(255) NULL,
[Szerz�d�s/Kinevez�s - pr�baid� v�ge] DATETIME NULL,
[Utal�si c�m] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Garant�lt b�rminimumra t�rt�n� kieg�sz�t�s] TEXT(255) NULL,
[Kerek�t�s] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S % (elt�r�t] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S �sszeg (el] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�t�s n�l] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Elt�r�t�s %] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�tett)] DOUBLE NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S % (elt�r�1] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S �sszeg (e1] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�tett)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�tett)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�tett)] DOUBLE NULL,
[Tov�bbi munkav�gz�s helye 1 Teljes munkaid� %-a] TEXT(255) NULL,
[Tov�bbi munkav�gz�s helye 2 Teljes munkaid� %-a] TEXT(255) NULL,
[KT: Kerek�tett 100 %-os illetm�ny (elt�r�tett) + Helyettes�t�si ] DOUBLE NULL,
[Heti �rasz�m] TEXT(255) NULL,
[M�rt�k] TEXT(255) NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 6 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 6 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 7 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 7 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 8 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 8 szervezeti egys�g k�d] TEXT(255) NULL,
[AD egyedi azonos�t�] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mell�k] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[Tov�bbi otthoni mobil] TEXT(255) NULL
);

CREATE TABLE [tSzem�lyek_tart] (
[Azonos�t�] LONG NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Dolgoz� sz�let�si neve] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[�gyf�lkapu k�d] TEXT(255) NULL,
[Els�dleges �llampolg�rs�g] TEXT(255) NULL,
[Szem�lyi igazolv�ny sz�ma] TEXT(255) NULL,
[Szem�lyi igazolv�ny �rv�nyess�g kezdete] TEXT(255) NULL,
[Szem�lyi igazolv�ny �rv�nyess�g v�ge] DATETIME NULL,
[Nyelvtud�s Angol] TEXT(255) NULL,
[Nyelvtud�s Bolg�r] TEXT(255) NULL,
[Nyelvtud�s Cig�ny] TEXT(255) NULL,
[Nyelvtud�s Cig�ny (lov�ri)] TEXT(255) NULL,
[Nyelvtud�s Cseh] TEXT(255) NULL,
[Nyelvtud�s Eszperant�] TEXT(255) NULL,
[Nyelvtud�s Francia] TEXT(255) NULL,
[Nyelvtud�s H�ber] TEXT(255) NULL,
[Nyelvtud�s Holland] TEXT(255) NULL,
[Nyelvtud�s Jap�n] TEXT(255) NULL,
[Nyelvtud�s Jelnyelv] TEXT(255) NULL,
[Nyelvtud�s K�nai] TEXT(255) NULL,
[Nyelvtud�s Latin] TEXT(255) NULL,
[Nyelvtud�s Lengyel] TEXT(255) NULL,
[Nyelvtud�s N�met] TEXT(255) NULL,
[Nyelvtud�s Olasz] TEXT(255) NULL,
[Nyelvtud�s Orosz] TEXT(255) NULL,
[Nyelvtud�s Rom�n] TEXT(255) NULL,
[Nyelvtud�s Spanyol] TEXT(255) NULL,
[Nyelvtud�s Szerb] TEXT(255) NULL,
[Nyelvtud�s Szlov�k] TEXT(255) NULL,
[Nyelvtud�s T�r�k] TEXT(255) NULL,
[Nyelvtud�s �jg�r�g] TEXT(255) NULL,
[Nyelvtud�s Ukr�n] TEXT(255) NULL,
[Orvosi vizsg�lat id�pontja] DATETIME NULL,
[Orvosi vizsg�lat t�pusa] TEXT(255) NULL,
[Orvosi vizsg�lat eredm�nye] TEXT(255) NULL,
[Orvosi vizsg�lat �szrev�telek] TEXT(255) NULL,
[Orvosi vizsg�lat k�vetkez� id�pontja] DATETIME NULL,
[Erk�lcsi bizony�tv�ny sz�ma] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny d�tuma] DATETIME NULL,
[Erk�lcsi bizony�tv�ny eredm�nye] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�relem azonos�t�] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�z�gyekt�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny j�rm�vezet�st�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny int�zked�s alatt �ll] TEXT(255) NULL,
[Munkak�ri le�r�sok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Egy�b HR dokumentumok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Korm�nyhivatal r�vid neve] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[Szervezeti egys�g neve] TEXT(255) NULL,
[Szervezeti munkak�r neve] TEXT(255) NULL,
[Vezet�i megb�z�s t�pusa] TEXT(255) NULL,
[St�tusz k�dja] TEXT(255) NULL,
[St�tusz k�lts�ghely�nek k�dja] TEXT(255) NULL,
[St�tusz k�lts�ghely�nek neve] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] YESNO NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz neve] TEXT(255) NULL,
[T�bbes bet�lt�s] YESNO NULL,
[Vezet� neve] TEXT(255) NULL,
[Vezet� ad�azonos�t� jele] TEXT(255) NULL,
[Vezet� email c�me] TEXT(255) NULL,
[�lland� lakc�m] TEXT(255) NULL,
[Tart�zkod�si lakc�m] TEXT(255) NULL,
[Mez�70] TEXT(255) NULL,
[�regs�gi nyugd�j-korhat�r el�r�s�nek id�pontja (d�tum)] DATETIME NULL,
[Nyugd�jas] YESNO NULL,
[Nyugd�j t�pusa] TEXT(255) NULL,
[Nyugd�jas kor� tov�bbfoglalkoztat�si enged�llyel rendelkezik] TEXT(255) NULL,
[Megv�ltozott munkak�pess�g] YESNO NULL,
[�nk�ntes tartal�kos katona] YESNO NULL,
[Utols� vagyonnyilatkozat lead�s�nak d�tuma] DATETIME NULL,
[Vagyonnyilatkozat nyilv�ntart�si sz�ma] TEXT(255) NULL,
[K�vetkez� vagyonnyilatkozat esed�kess�ge] DATETIME NULL,
[Nemzetbiztons�gi ellen�rz�s d�tuma] TEXT(255) NULL,
[V�dett �llom�nyba tartoz� munkak�r] YESNO NULL,
[Mez�82] TEXT(255) NULL,
[Vezet�i beoszt�s megnevez�se] TEXT(255) NULL,
[Vezet�i beoszt�s (megb�z�s) kezdete] DATETIME NULL,
[Vezet�i beoszt�s (megb�z�s) v�ge] TEXT(255) NULL,
[Iskolai v�gzetts�g foka] TEXT(255) NULL,
[Iskolai v�gzetts�g neve] TEXT(255) NULL,
[Alapvizsga k�telez�s d�tuma] TEXT(255) NULL,
[Alapvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Alapvizsga mentess�g] YESNO NULL,
[Alapvizsga mentess�g oka] TEXT(255) NULL,
[Szakvizsga k�telez�s d�tuma] DATETIME NULL,
[Szakvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Szakvizsga mentess�g] YESNO NULL,
[Foglalkoz�si viszony] TEXT(255) NULL,
[Foglalkoz�si viszony statisztikai besorol�sa] TEXT(255) NULL,
[Dolgoz� szerz�d�ses/kinevez�ses munkak�re / kinevez�si okm�nyban] TEXT(255) NULL,
[Beoszt�stervez�s helysz�nek] TEXT(255) NULL,
[Beoszt�stervez�s tev�kenys�gek] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s kezdete] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s v�ge] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s intervalluma] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s m�rt�ke] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s kezdete] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s v�ge] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s m�rt�ke] TEXT(255) NULL,
[KIRA feladat azonos�t�ja - int�zm�ny prefix-szel ell�tva] TEXT(255) NULL,
[KIRA feladat azonos�t�ja] TEXT(255) NULL,
[KIRA feladat megnevez�s] TEXT(255) NULL,
[Osztott munkak�r] TEXT(255) NULL,
[Funkci�csoport: k�d-megnevez�s] TEXT(255) NULL,
[Funkci�: k�d-megnevez�s] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek k�dja] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek neve] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Els�dleges feladatk�r] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� napi �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� havi �raker] DOUBLE NULL,
[Szerz�d�s/Kinevez�s t�pusa] TEXT(255) NULL,
[Iktat�sz�m] TEXT(255) NULL,
[Mez�125] DATETIME NULL,
[Mez�126] TEXT(255) NULL,
[Mez�127] DATETIME NULL,
[Szerz�d�s dokumentum (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Megjegyz�s (pl hat�rozott szerz�d�s/kinevez�s oka)] TEXT(255) NULL,
[Munkav�gz�s helye - megnevez�s] TEXT(255) NULL,
[Munkav�gz�s helye - c�m] TEXT(255) NULL,
[Jogviszony t�pusa / jogviszony t�pus] TEXT(255) NULL,
[Jogviszony sorsz�ma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[K�lcs�nbe ad� c�g] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kel� szem�ly] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rv�nyess�g kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak v�ge] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s d�tuma] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Be�ll�si sz�zal�k] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Pontsz�m] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Megjegyz�s] TEXT(255) NULL,
[Dolgoz�i jellemz�k] TEXT(255) NULL,
[Fizet�si oszt�ly (KA)/ Pedag�gusi fokozat (KA pedag�gus)/besorol] TEXT(255) NULL,
[Besorol�si  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos id� kezdete] TEXT(255) NULL,
[Jogviszony kezdete (bel�p�s d�tuma)] DATETIME NULL,
[Jogviszony v�ge (kil�p�s d�tuma)] DATETIME NULL,
[Kezdem�nyez�s d�tuma] TEXT(255) NULL,
[Hat�lyoss� v�lik] TEXT(255) NULL,
[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)] TEXT(255) NULL,
[Indokol�s] TEXT(255) NULL,
[MT: Felmond�si id� kezdete KJT, KTTV: Felment�si id� kezdete] TEXT(255) NULL,
[Felmond�si id� v�ge (MT) Felment�si id� v�ge (KJT, KTTV)] TEXT(255) NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] TEXT(255) NULL,
[Tart�s t�voll�t v�ge] TEXT(255) NULL,
[Tart�s t�voll�t tervezett v�ge] TEXT(255) NULL,
[Helyettes�tett dolgoz� neve] TEXT(255) NULL,
[Helyettes�tett dolgoz� szerz�d�s/kinevez�ses munkak�re] TEXT(255) NULL,
[Szerz�d�s/Kinevez�s - pr�baid� v�ge] DATETIME NULL,
[Utal�si c�m] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�t�s n�lk�li)] CURRENCY NULL,
[Garant�lt b�rminimumra t�rt�n� kieg�sz�t�s] CURRENCY NULL,
[Kerek�t�s] LONG NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�t�s n�lk�li)] CURRENCY NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�t�s n�lk�li)] CURRENCY NULL,
[Elt�r�t�s %] DOUBLE NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�tett)] CURRENCY NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�tett)] CURRENCY NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�tett)] CURRENCY NULL,
[Tov�bbi munkav�gz�s helye 1 Teljes munkaid� %-a] CURRENCY NULL,
[Tov�bbi munkav�gz�s helye 2 Teljes munkaid� %-a] CURRENCY NULL,
[KT: Kerek�tett 100 %-os illetm�ny (elt�r�tett) + Helyettes�t�si ] CURRENCY NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[AD egyedi azonos�t�] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mell�k] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[Tov�bbi otthoni mobil] TEXT(255) NULL,
[Ad�jel] DOUBLE NULL,
[azNexon] DOUBLE NULL
);

CREATE TABLE [tSzem�lyek20210101] (
[Azonos�t�] LONG NULL,
[Ad�jel] DOUBLE NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Dolgoz� sz�let�si neve] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[�gyf�lkapu k�d] TEXT(255) NULL,
[Els�dleges �llampolg�rs�g] TEXT(255) NULL,
[Szem�lyi igazolv�ny sz�ma] TEXT(255) NULL,
[Szem�lyi igazolv�ny �rv�nyess�g kezdete] DATETIME NULL,
[Szem�lyi igazolv�ny �rv�nyess�g v�ge] DATETIME NULL,
[Nyelvtud�s Angol] TEXT(255) NULL,
[Nyelvtud�s Arab] TEXT(255) NULL,
[Nyelvtud�s Bolg�r] TEXT(255) NULL,
[Nyelvtud�s Cig�ny] TEXT(255) NULL,
[Nyelvtud�s Cig�ny (lov�ri)] TEXT(255) NULL,
[Nyelvtud�s Cseh] TEXT(255) NULL,
[Nyelvtud�s Eszperant�] TEXT(255) NULL,
[Nyelvtud�s Finn] TEXT(255) NULL,
[Nyelvtud�s Francia] TEXT(255) NULL,
[Nyelvtud�s H�ber] TEXT(255) NULL,
[Nyelvtud�s Holland] TEXT(255) NULL,
[Nyelvtud�s Horv�t] TEXT(255) NULL,
[Nyelvtud�s Jap�n] TEXT(255) NULL,
[Nyelvtud�s Jelnyelv] TEXT(255) NULL,
[Nyelvtud�s K�nai] TEXT(255) NULL,
[Nyelvtud�s Latin] TEXT(255) NULL,
[Nyelvtud�s Lengyel] TEXT(255) NULL,
[Nyelvtud�s N�met] TEXT(255) NULL,
[Nyelvtud�s Norv�g] TEXT(255) NULL,
[Nyelvtud�s Olasz] TEXT(255) NULL,
[Nyelvtud�s Orosz] TEXT(255) NULL,
[Nyelvtud�s Portug�l] TEXT(255) NULL,
[Nyelvtud�s Rom�n] TEXT(255) NULL,
[Nyelvtud�s Spanyol] TEXT(255) NULL,
[Nyelvtud�s Szerb] TEXT(255) NULL,
[Nyelvtud�s Szlov�k] TEXT(255) NULL,
[Nyelvtud�s Szlov�n] TEXT(255) NULL,
[Nyelvtud�s T�r�k] TEXT(255) NULL,
[Nyelvtud�s �jg�r�g] TEXT(255) NULL,
[Nyelvtud�s Ukr�n] TEXT(255) NULL,
[Orvosi vizsg�lat id�pontja] DATETIME NULL,
[Orvosi vizsg�lat t�pusa] TEXT(255) NULL,
[Orvosi vizsg�lat eredm�nye] TEXT(255) NULL,
[Orvosi vizsg�lat �szrev�telek] TEXT(255) NULL,
[Orvosi vizsg�lat k�vetkez� id�pontja] DATETIME NULL,
[Erk�lcsi bizony�tv�ny sz�ma] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny d�tuma] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny eredm�nye] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�relem azonos�t�] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�z�gyekt�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny j�rm�vezet�st�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny int�zked�s alatt �ll] TEXT(255) NULL,
[Munkak�ri le�r�sok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Egy�b HR dokumentumok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Korm�nyhivatal r�vid neve] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[Szervezeti egys�g neve] TEXT(255) NULL,
[Szervezeti munkak�r neve] TEXT(255) NULL,
[Vezet�i megb�z�s t�pusa] TEXT(255) NULL,
[St�tusz k�dja] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] YESNO NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz neve] TEXT(255) NULL,
[T�bbes bet�lt�s] YESNO NULL,
[Vezet� neve] TEXT(255) NULL,
[Vezet� ad�azonos�t� jele] TEXT(255) NULL,
[Vezet� email c�me] TEXT(255) NULL,
[�lland� lakc�m] TEXT(255) NULL,
[Tart�zkod�si lakc�m] TEXT(255) NULL,
[Mez�76] TEXT(255) NULL,
[�regs�gi nyugd�j-korhat�r el�r�s�nek id�pontja (d�tum)] DATETIME NULL,
[Nyugd�jas] YESNO NULL,
[Nyugd�j t�pusa] TEXT(255) NULL,
[Nyugd�jas kor� tov�bbfoglalkoztat�si enged�llyel rendelkezik] TEXT(255) NULL,
[Megv�ltozott munkak�pess�g] YESNO NULL,
[�nk�ntes tartal�kos katona] YESNO NULL,
[Utols� vagyonnyilatkozat lead�s�nak d�tuma] DATETIME NULL,
[Vagyonnyilatkozat nyilv�ntart�si sz�ma] TEXT(255) NULL,
[K�vetkez� vagyonnyilatkozat esed�kess�ge] DATETIME NULL,
[Nemzetbiztons�gi ellen�rz�s d�tuma] TEXT(255) NULL,
[V�dett �llom�nyba tartoz� munkak�r] YESNO NULL,
[Mez�88] TEXT(255) NULL,
[Vezet�i beoszt�s megnevez�se] TEXT(255) NULL,
[Vezet�i beoszt�s (megb�z�s) kezdete] DATETIME NULL,
[Vezet�i beoszt�s (megb�z�s) v�ge] TEXT(255) NULL,
[Iskolai v�gzetts�g foka] TEXT(255) NULL,
[Iskolai v�gzetts�g neve] TEXT(255) NULL,
[Alapvizsga k�telez�s d�tuma] TEXT(255) NULL,
[Alapvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Alapvizsga mentess�g] YESNO NULL,
[Alapvizsga mentess�g oka] TEXT(255) NULL,
[Szakvizsga k�telez�s d�tuma] TEXT(255) NULL,
[Szakvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Szakvizsga mentess�g] YESNO NULL,
[Foglalkoz�si viszony] TEXT(255) NULL,
[Foglalkoz�si viszony statisztikai besorol�sa] TEXT(255) NULL,
[Dolgoz� szerz�d�ses/kinevez�ses munkak�re / kinevez�si okm�nyban] TEXT(255) NULL,
[Beoszt�stervez�s helysz�nek] TEXT(255) NULL,
[Beoszt�stervez�s tev�kenys�gek] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s kezdete] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s v�ge] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s intervalluma] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s m�rt�ke] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 2] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 3] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s kezdete] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s v�ge] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s m�rt�ke] TEXT(255) NULL,
[KIRA feladat azonos�t�ja - int�zm�ny prefix-szel ell�tva] TEXT(255) NULL,
[KIRA feladat azonos�t�ja] TEXT(255) NULL,
[KIRA feladat megnevez�s] TEXT(255) NULL,
[Osztott munkak�r] TEXT(255) NULL,
[Funkci�csoport: k�d-megnevez�s] TEXT(255) NULL,
[Funkci�: k�d-megnevez�s] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek k�dja] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek neve] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Els�dleges feladatk�r] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� napi �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� havi �raker] DOUBLE NULL,
[Szerz�d�s/Kinevez�s t�pusa] TEXT(255) NULL,
[Iktat�sz�m] TEXT(255) NULL,
[Mez�133] DATETIME NULL,
[Mez�134] DATETIME NULL,
[Mez�135] TEXT(255) NULL,
[Szerz�d�s dokumentum (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Megjegyz�s (pl hat�rozott szerz�d�s/kinevez�s oka)] TEXT(255) NULL,
[Munkav�gz�s helye - megnevez�s] TEXT(255) NULL,
[Munkav�gz�s helye - c�m] TEXT(255) NULL,
[Jogviszony t�pusa / jogviszony t�pus] TEXT(255) NULL,
[Jogviszony sorsz�ma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[K�lcs�nbe ad� c�g] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kel� szem�ly] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rv�nyess�g kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rv�nyess�g v�ge] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak v�ge] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Teljes�tm�ny c�lok hat�rideje] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s d�tuma] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Be�ll�si sz�zal�k] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Pontsz�m] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Megjegyz�s] TEXT(255) NULL,
[Dolgoz�i jellemz�k] TEXT(255) NULL,
[Fizet�si oszt�ly (KA)/ Pedag�gusi fokozat (KA pedag�gus)/besorol] TEXT(255) NULL,
[Besorol�si  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos id� kezdete] TEXT(255) NULL,
[Jogviszony kezdete (bel�p�s d�tuma)] DATETIME NULL,
[Jogviszony v�ge (kil�p�s d�tuma)] DATETIME NULL,
[Utols� munk�ban t�lt�tt nap] TEXT(255) NULL,
[Kezdem�nyez�s d�tuma] DATETIME NULL,
[Hat�lyoss� v�lik] DATETIME NULL,
[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)] TEXT(255) NULL,
[HR kapcsolat megsz�nes indoka (Kil�p�s indoka)] TEXT(255) NULL,
[Indokol�s] TEXT(255) NULL,
[K�vetkez� munkahely] TEXT(255) NULL,
[MT: Felmond�si id� kezdete KJT, KTTV: Felment�si id� kezdete] DATETIME NULL,
[Felmond�si id� v�ge (MT) Felment�si id� v�ge (KJT, KTTV)] DATETIME NULL,
[Munkav�gz�s al�li mentes�t�s kezdete (KJT, KTTV) Felment�si id� ] TEXT(255) NULL,
[Munkav�gz�s al�li mentes�t�s v�ge (KJT, KTTV) Felment�si id� v�g] TEXT(255) NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] TEXT(255) NULL,
[Tart�s t�voll�t v�ge] TEXT(255) NULL,
[Tart�s t�voll�t tervezett v�ge] TEXT(255) NULL,
[Helyettes�tett dolgoz� neve] TEXT(255) NULL,
[Helyettes�tett dolgoz� szerz�d�s/kinevez�ses munkak�re] TEXT(255) NULL,
[Szerz�d�s/Kinevez�s - pr�baid� v�ge] DATETIME NULL,
[Utal�si c�m] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Garant�lt b�rminimumra t�rt�n� kieg�sz�t�s] TEXT(255) NULL,
[Kerek�t�s] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S % (elt�r�t] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S �sszeg (el] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�t�s n�l] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Elt�r�t�s %] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�tett)] DOUBLE NULL,
[Mez�191] TEXT(255) NULL,
[Mez�192] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�tett)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�tett)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�tett)] DOUBLE NULL,
[Tov�bbi munkav�gz�s helye 1 Teljes munkaid� %-a] TEXT(255) NULL,
[Tov�bbi munkav�gz�s helye 2 Teljes munkaid� %-a] TEXT(255) NULL,
[KT: Kerek�tett 100 %-os illetm�ny (elt�r�tett) + Helyettes�t�si ] DOUBLE NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[AD egyedi azonos�t�] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mell�k] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[Tov�bbi otthoni mobil] TEXT(255) NULL
);

CREATE INDEX [Ad�jel] ON [tSzem�lyek20210101] ([Ad�jel]);

CREATE INDEX [Jogviszony kezdete (bel�p�s d�tuma)] ON [tSzem�lyek20210101] ([Jogviszony kezdete (bel�p�s d�tuma)]);

CREATE INDEX [Jogviszony v�ge (kil�p�s d�tuma)] ON [tSzem�lyek20210101] ([Jogviszony v�ge (kil�p�s d�tuma)]);

ALTER TABLE [tSzem�lyek20210101] ADD CONSTRAINT [PK_tSzem�lyek20210101] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tSzem�lyek20220101] (
[Azonos�t�] LONG NULL,
[Ad�jel] DOUBLE NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Dolgoz� sz�let�si neve] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[�gyf�lkapu k�d] TEXT(255) NULL,
[Els�dleges �llampolg�rs�g] TEXT(255) NULL,
[Szem�lyi igazolv�ny sz�ma] TEXT(255) NULL,
[Szem�lyi igazolv�ny �rv�nyess�g kezdete] DATETIME NULL,
[Szem�lyi igazolv�ny �rv�nyess�g v�ge] DATETIME NULL,
[Nyelvtud�s Angol] TEXT(255) NULL,
[Nyelvtud�s Arab] TEXT(255) NULL,
[Nyelvtud�s Bolg�r] TEXT(255) NULL,
[Nyelvtud�s Cig�ny] TEXT(255) NULL,
[Nyelvtud�s Cig�ny (lov�ri)] TEXT(255) NULL,
[Nyelvtud�s Cseh] TEXT(255) NULL,
[Nyelvtud�s Eszperant�] TEXT(255) NULL,
[Nyelvtud�s Finn] TEXT(255) NULL,
[Nyelvtud�s Francia] TEXT(255) NULL,
[Nyelvtud�s H�ber] TEXT(255) NULL,
[Nyelvtud�s Holland] TEXT(255) NULL,
[Nyelvtud�s Horv�t] TEXT(255) NULL,
[Nyelvtud�s Jap�n] TEXT(255) NULL,
[Nyelvtud�s Jelnyelv] TEXT(255) NULL,
[Nyelvtud�s K�nai] TEXT(255) NULL,
[Nyelvtud�s Latin] TEXT(255) NULL,
[Nyelvtud�s Lengyel] TEXT(255) NULL,
[Nyelvtud�s N�met] TEXT(255) NULL,
[Nyelvtud�s Norv�g] TEXT(255) NULL,
[Nyelvtud�s Olasz] TEXT(255) NULL,
[Nyelvtud�s Orosz] TEXT(255) NULL,
[Nyelvtud�s Portug�l] TEXT(255) NULL,
[Nyelvtud�s Rom�n] TEXT(255) NULL,
[Nyelvtud�s Spanyol] TEXT(255) NULL,
[Nyelvtud�s Szerb] TEXT(255) NULL,
[Nyelvtud�s Szlov�k] TEXT(255) NULL,
[Nyelvtud�s Szlov�n] TEXT(255) NULL,
[Nyelvtud�s T�r�k] TEXT(255) NULL,
[Nyelvtud�s �jg�r�g] TEXT(255) NULL,
[Nyelvtud�s Ukr�n] TEXT(255) NULL,
[Orvosi vizsg�lat id�pontja] DATETIME NULL,
[Orvosi vizsg�lat t�pusa] TEXT(255) NULL,
[Orvosi vizsg�lat eredm�nye] TEXT(255) NULL,
[Orvosi vizsg�lat �szrev�telek] TEXT(255) NULL,
[Orvosi vizsg�lat k�vetkez� id�pontja] DATETIME NULL,
[Erk�lcsi bizony�tv�ny sz�ma] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny d�tuma] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny eredm�nye] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�relem azonos�t�] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�z�gyekt�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny j�rm�vezet�st�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny int�zked�s alatt �ll] TEXT(255) NULL,
[Munkak�ri le�r�sok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Egy�b HR dokumentumok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Korm�nyhivatal r�vid neve] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[Szervezeti egys�g neve] TEXT(255) NULL,
[Szervezeti munkak�r neve] TEXT(255) NULL,
[Vezet�i megb�z�s t�pusa] TEXT(255) NULL,
[St�tusz k�dja] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] YESNO NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz neve] TEXT(255) NULL,
[T�bbes bet�lt�s] YESNO NULL,
[Vezet� neve] TEXT(255) NULL,
[Vezet� ad�azonos�t� jele] TEXT(255) NULL,
[Vezet� email c�me] TEXT(255) NULL,
[�lland� lakc�m] TEXT(255) NULL,
[Tart�zkod�si lakc�m] TEXT(255) NULL,
[Mez�76] TEXT(255) NULL,
[�regs�gi nyugd�j-korhat�r el�r�s�nek id�pontja (d�tum)] DATETIME NULL,
[Nyugd�jas] YESNO NULL,
[Nyugd�j t�pusa] TEXT(255) NULL,
[Nyugd�jas kor� tov�bbfoglalkoztat�si enged�llyel rendelkezik] TEXT(255) NULL,
[Megv�ltozott munkak�pess�g] YESNO NULL,
[�nk�ntes tartal�kos katona] YESNO NULL,
[Utols� vagyonnyilatkozat lead�s�nak d�tuma] DATETIME NULL,
[Vagyonnyilatkozat nyilv�ntart�si sz�ma] TEXT(255) NULL,
[K�vetkez� vagyonnyilatkozat esed�kess�ge] DATETIME NULL,
[Nemzetbiztons�gi ellen�rz�s d�tuma] TEXT(255) NULL,
[V�dett �llom�nyba tartoz� munkak�r] YESNO NULL,
[Mez�88] TEXT(255) NULL,
[Vezet�i beoszt�s megnevez�se] TEXT(255) NULL,
[Vezet�i beoszt�s (megb�z�s) kezdete] DATETIME NULL,
[Vezet�i beoszt�s (megb�z�s) v�ge] TEXT(255) NULL,
[Iskolai v�gzetts�g foka] TEXT(255) NULL,
[Iskolai v�gzetts�g neve] TEXT(255) NULL,
[Alapvizsga k�telez�s d�tuma] TEXT(255) NULL,
[Alapvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Alapvizsga mentess�g] YESNO NULL,
[Alapvizsga mentess�g oka] TEXT(255) NULL,
[Szakvizsga k�telez�s d�tuma] TEXT(255) NULL,
[Szakvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Szakvizsga mentess�g] YESNO NULL,
[Foglalkoz�si viszony] TEXT(255) NULL,
[Foglalkoz�si viszony statisztikai besorol�sa] TEXT(255) NULL,
[Dolgoz� szerz�d�ses/kinevez�ses munkak�re / kinevez�si okm�nyban] TEXT(255) NULL,
[Beoszt�stervez�s helysz�nek] TEXT(255) NULL,
[Beoszt�stervez�s tev�kenys�gek] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s kezdete] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s v�ge] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s intervalluma] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s m�rt�ke] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 2] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 3] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s kezdete] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s v�ge] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s m�rt�ke] TEXT(255) NULL,
[KIRA feladat azonos�t�ja - int�zm�ny prefix-szel ell�tva] TEXT(255) NULL,
[KIRA feladat azonos�t�ja] TEXT(255) NULL,
[KIRA feladat megnevez�s] TEXT(255) NULL,
[Osztott munkak�r] TEXT(255) NULL,
[Funkci�csoport: k�d-megnevez�s] TEXT(255) NULL,
[Funkci�: k�d-megnevez�s] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek k�dja] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek neve] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Els�dleges feladatk�r] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� napi �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� havi �raker] DOUBLE NULL,
[Szerz�d�s/Kinevez�s t�pusa] TEXT(255) NULL,
[Iktat�sz�m] TEXT(255) NULL,
[Mez�133] DATETIME NULL,
[Mez�134] DATETIME NULL,
[Mez�135] TEXT(255) NULL,
[Szerz�d�s dokumentum (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Megjegyz�s (pl hat�rozott szerz�d�s/kinevez�s oka)] TEXT(255) NULL,
[Munkav�gz�s helye - megnevez�s] TEXT(255) NULL,
[Munkav�gz�s helye - c�m] TEXT(255) NULL,
[Jogviszony t�pusa / jogviszony t�pus] TEXT(255) NULL,
[Jogviszony sorsz�ma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[K�lcs�nbe ad� c�g] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kel� szem�ly] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rv�nyess�g kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak v�ge] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s d�tuma] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Be�ll�si sz�zal�k] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Pontsz�m] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Megjegyz�s] TEXT(255) NULL,
[Dolgoz�i jellemz�k] TEXT(255) NULL,
[Fizet�si oszt�ly (KA)/ Pedag�gusi fokozat (KA pedag�gus)/besorol] TEXT(255) NULL,
[Besorol�si  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos id� kezdete] TEXT(255) NULL,
[Jogviszony kezdete (bel�p�s d�tuma)] DATETIME NULL,
[Jogviszony v�ge (kil�p�s d�tuma)] DATETIME NULL,
[Utols� munk�ban t�lt�tt nap] TEXT(255) NULL,
[Kezdem�nyez�s d�tuma] DATETIME NULL,
[Hat�lyoss� v�lik] DATETIME NULL,
[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)] TEXT(255) NULL,
[HR kapcsolat megsz�nes indoka (Kil�p�s indoka)] TEXT(255) NULL,
[Indokol�s] TEXT(255) NULL,
[K�vetkez� munkahely] TEXT(255) NULL,
[MT: Felmond�si id� kezdete KJT, KTTV: Felment�si id� kezdete] DATETIME NULL,
[Felmond�si id� v�ge (MT) Felment�si id� v�ge (KJT, KTTV)] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] TEXT(255) NULL,
[Tart�s t�voll�t v�ge] TEXT(255) NULL,
[Tart�s t�voll�t tervezett v�ge] TEXT(255) NULL,
[Helyettes�tett dolgoz� neve] TEXT(255) NULL,
[Helyettes�tett dolgoz� szerz�d�s/kinevez�ses munkak�re] TEXT(255) NULL,
[Szerz�d�s/Kinevez�s - pr�baid� v�ge] DATETIME NULL,
[Utal�si c�m] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Garant�lt b�rminimumra t�rt�n� kieg�sz�t�s] TEXT(255) NULL,
[Kerek�t�s] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S % (elt�r�t] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S �sszeg (el] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�t�s n�l] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Elt�r�t�s %] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�tett)] DOUBLE NULL,
[Mez�187] TEXT(255) NULL,
[Mez�188] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�tett)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�tett)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�tett)] DOUBLE NULL,
[Tov�bbi munkav�gz�s helye 1 Teljes munkaid� %-a] TEXT(255) NULL,
[Tov�bbi munkav�gz�s helye 2 Teljes munkaid� %-a] TEXT(255) NULL,
[KT: Kerek�tett 100 %-os illetm�ny (elt�r�tett) + Helyettes�t�si ] DOUBLE NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 6 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 6 szervezeti egys�g k�d] TEXT(255) NULL,
[AD egyedi azonos�t�] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mell�k] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[Tov�bbi otthoni mobil] TEXT(255) NULL
);

CREATE INDEX [Ad�jel] ON [tSzem�lyek20220101] ([Ad�jel]);

CREATE INDEX [Jogviszony kezdete (bel�p�s d�tuma)] ON [tSzem�lyek20220101] ([Jogviszony kezdete (bel�p�s d�tuma)]);

CREATE INDEX [Jogviszony v�ge (kil�p�s d�tuma)] ON [tSzem�lyek20220101] ([Jogviszony v�ge (kil�p�s d�tuma)]);

ALTER TABLE [tSzem�lyek20220101] ADD CONSTRAINT [PK_tSzem�lyek20220101] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tSzem�lyek20230101] (
[Azonos�t�] LONG NULL,
[Ad�jel] DOUBLE NULL,
[Dolgoz� teljes neve] TEXT(255) NULL,
[Dolgoz� sz�let�si neve] TEXT(255) NULL,
[Sz�let�si id�] DATETIME NULL,
[Sz�let�si hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Egyedi azonos�t�] TEXT(255) NULL,
[Ad�azonos�t� jel] TEXT(255) NULL,
[TAJ sz�m] TEXT(255) NULL,
[�gyf�lkapu k�d] TEXT(255) NULL,
[Els�dleges �llampolg�rs�g] TEXT(255) NULL,
[Szem�lyi igazolv�ny sz�ma] TEXT(255) NULL,
[Szem�lyi igazolv�ny �rv�nyess�g kezdete] DATETIME NULL,
[Szem�lyi igazolv�ny �rv�nyess�g v�ge] DATETIME NULL,
[Nyelvtud�s Angol] TEXT(255) NULL,
[Nyelvtud�s Arab] TEXT(255) NULL,
[Nyelvtud�s Bolg�r] TEXT(255) NULL,
[Nyelvtud�s Cig�ny] TEXT(255) NULL,
[Nyelvtud�s Cig�ny (lov�ri)] TEXT(255) NULL,
[Nyelvtud�s Cseh] TEXT(255) NULL,
[Nyelvtud�s Eszperant�] TEXT(255) NULL,
[Nyelvtud�s Finn] TEXT(255) NULL,
[Nyelvtud�s Francia] TEXT(255) NULL,
[Nyelvtud�s H�ber] TEXT(255) NULL,
[Nyelvtud�s Holland] TEXT(255) NULL,
[Nyelvtud�s Horv�t] TEXT(255) NULL,
[Nyelvtud�s Jap�n] TEXT(255) NULL,
[Nyelvtud�s Jelnyelv] TEXT(255) NULL,
[Nyelvtud�s K�nai] TEXT(255) NULL,
[Nyelvtud�s Latin] TEXT(255) NULL,
[Nyelvtud�s Lengyel] TEXT(255) NULL,
[Nyelvtud�s N�met] TEXT(255) NULL,
[Nyelvtud�s Norv�g] TEXT(255) NULL,
[Nyelvtud�s Olasz] TEXT(255) NULL,
[Nyelvtud�s Orosz] TEXT(255) NULL,
[Nyelvtud�s Portug�l] TEXT(255) NULL,
[Nyelvtud�s Rom�n] TEXT(255) NULL,
[Nyelvtud�s Spanyol] TEXT(255) NULL,
[Nyelvtud�s Szerb] TEXT(255) NULL,
[Nyelvtud�s Szlov�k] TEXT(255) NULL,
[Nyelvtud�s Szlov�n] TEXT(255) NULL,
[Nyelvtud�s T�r�k] TEXT(255) NULL,
[Nyelvtud�s �jg�r�g] TEXT(255) NULL,
[Nyelvtud�s Ukr�n] TEXT(255) NULL,
[Orvosi vizsg�lat id�pontja] DATETIME NULL,
[Orvosi vizsg�lat t�pusa] TEXT(255) NULL,
[Orvosi vizsg�lat eredm�nye] TEXT(255) NULL,
[Orvosi vizsg�lat �szrev�telek] TEXT(255) NULL,
[Orvosi vizsg�lat k�vetkez� id�pontja] DATETIME NULL,
[Erk�lcsi bizony�tv�ny sz�ma] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny d�tuma] DATETIME NULL,
[Erk�lcsi bizony�tv�ny eredm�nye] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�relem azonos�t�] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny k�z�gyekt�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny j�rm�vezet�st�l eltiltva] TEXT(255) NULL,
[Erk�lcsi bizony�tv�ny int�zked�s alatt �ll] TEXT(255) NULL,
[Munkak�ri le�r�sok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Egy�b HR dokumentumok (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Korm�nyhivatal r�vid neve] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL,
[Szervezeti egys�g neve] TEXT(255) NULL,
[Szervezeti munkak�r neve] TEXT(255) NULL,
[Vezet�i megb�z�s t�pusa] TEXT(255) NULL,
[St�tusz k�dja] TEXT(255) NULL,
[St�tusz k�lts�ghely�nek k�dja] TEXT(255) NULL,
[St�tusz k�lts�ghely�nek neve] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] YESNO NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz neve] TEXT(255) NULL,
[T�bbes bet�lt�s] YESNO NULL,
[Vezet� neve] TEXT(255) NULL,
[Vezet� ad�azonos�t� jele] TEXT(255) NULL,
[Vezet� email c�me] TEXT(255) NULL,
[�lland� lakc�m] TEXT(255) NULL,
[Tart�zkod�si lakc�m] TEXT(255) NULL,
[Mez�78] TEXT(255) NULL,
[�regs�gi nyugd�j-korhat�r el�r�s�nek id�pontja (d�tum)] DATETIME NULL,
[Nyugd�jas] YESNO NULL,
[Nyugd�j t�pusa] TEXT(255) NULL,
[Nyugd�jas kor� tov�bbfoglalkoztat�si enged�llyel rendelkezik] TEXT(255) NULL,
[Megv�ltozott munkak�pess�g] YESNO NULL,
[�nk�ntes tartal�kos katona] YESNO NULL,
[Utols� vagyonnyilatkozat lead�s�nak d�tuma] DATETIME NULL,
[Vagyonnyilatkozat nyilv�ntart�si sz�ma] TEXT(255) NULL,
[K�vetkez� vagyonnyilatkozat esed�kess�ge] DATETIME NULL,
[Nemzetbiztons�gi ellen�rz�s d�tuma] TEXT(255) NULL,
[V�dett �llom�nyba tartoz� munkak�r] YESNO NULL,
[Mez�90] TEXT(255) NULL,
[Vezet�i beoszt�s megnevez�se] TEXT(255) NULL,
[Vezet�i beoszt�s (megb�z�s) kezdete] DATETIME NULL,
[Vezet�i beoszt�s (megb�z�s) v�ge] TEXT(255) NULL,
[Iskolai v�gzetts�g foka] TEXT(255) NULL,
[Iskolai v�gzetts�g neve] TEXT(255) NULL,
[Alapvizsga k�telez�s d�tuma] DATETIME NULL,
[Alapvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Alapvizsga mentess�g] YESNO NULL,
[Alapvizsga mentess�g oka] TEXT(255) NULL,
[Szakvizsga k�telez�s d�tuma] TEXT(255) NULL,
[Szakvizsga let�tel t�nyleges hat�rideje] TEXT(255) NULL,
[Szakvizsga mentess�g] YESNO NULL,
[Foglalkoz�si viszony] TEXT(255) NULL,
[Foglalkoz�si viszony statisztikai besorol�sa] TEXT(255) NULL,
[Dolgoz� szerz�d�ses/kinevez�ses munkak�re / kinevez�si okm�nyban] TEXT(255) NULL,
[Beoszt�stervez�s helysz�nek] TEXT(255) NULL,
[Beoszt�stervez�s tev�kenys�gek] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s kezdete] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s v�ge] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s intervalluma] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s m�rt�ke] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 2] TEXT(255) NULL,
[R�szleges t�vmunka szerz�d�s helysz�ne 3] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s kezdete] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s v�ge] TEXT(255) NULL,
[Egy�ni t�l�ra keret meg�llapod�s m�rt�ke] TEXT(255) NULL,
[KIRA feladat azonos�t�ja - int�zm�ny prefix-szel ell�tva] TEXT(255) NULL,
[KIRA feladat azonos�t�ja] TEXT(255) NULL,
[KIRA feladat megnevez�s] TEXT(255) NULL,
[Osztott munkak�r] TEXT(255) NULL,
[Funkci�csoport: k�d-megnevez�s] TEXT(255) NULL,
[Funkci�: k�d-megnevez�s] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek k�dja] TEXT(255) NULL,
[Dolgoz� k�lts�ghely�nek neve] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Els�dleges feladatk�r] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� napi �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker] DOUBLE NULL,
[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� havi �raker] DOUBLE NULL,
[Szerz�d�s/Kinevez�s t�pusa] TEXT(255) NULL,
[Iktat�sz�m] TEXT(255) NULL,
[Mez�135] DATETIME NULL,
[Mez�136] DATETIME NULL,
[Mez�137] TEXT(255) NULL,
[Szerz�d�s dokumentum (csatolt dokumentumok f�jlnevei)] TEXT(255) NULL,
[Megjegyz�s (pl hat�rozott szerz�d�s/kinevez�s oka)] TEXT(255) NULL,
[Munkav�gz�s helye - megnevez�s] TEXT(255) NULL,
[Munkav�gz�s helye - c�m] TEXT(255) NULL,
[Jogviszony t�pusa / jogviszony t�pus] TEXT(255) NULL,
[Jogviszony sorsz�ma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[K�lcs�nbe ad� c�g] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kel� szem�ly] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rv�nyess�g kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak kezdet] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - �rt�kelt id�szak v�ge] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s d�tuma] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Be�ll�si sz�zal�k] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Pontsz�m] TEXT(255) NULL,
[Teljes�tm�ny�rt�kel�s - Megjegyz�s] TEXT(255) NULL,
[Dolgoz�i jellemz�k] TEXT(255) NULL,
[Fizet�si oszt�ly (KA)/ Pedag�gusi fokozat (KA pedag�gus)/besorol] TEXT(255) NULL,
[Besorol�si  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos id� kezdete] DATETIME NULL,
[Jogviszony kezdete (bel�p�s d�tuma)] DATETIME NULL,
[Jogviszony v�ge (kil�p�s d�tuma)] DATETIME NULL,
[Utols� munk�ban t�lt�tt nap] TEXT(255) NULL,
[Kezdem�nyez�s d�tuma] DATETIME NULL,
[Hat�lyoss� v�lik] DATETIME NULL,
[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)] TEXT(255) NULL,
[HR kapcsolat megsz�nes indoka (Kil�p�s indoka)] TEXT(255) NULL,
[Indokol�s] TEXT(255) NULL,
[K�vetkez� munkahely] TEXT(255) NULL,
[MT: Felmond�si id� kezdete KJT, KTTV: Felment�si id� kezdete] DATETIME NULL,
[Felmond�si id� v�ge (MT) Felment�si id� v�ge (KJT, KTTV)] DATETIME NULL,
[Munkav�gz�s al�li mentes�t�s kezdete (KJT, KTTV) Felment�si id� ] TEXT(255) NULL,
[Munkav�gz�s al�li mentes�t�s v�ge (KJT, KTTV) Felment�si id� v�g] TEXT(255) NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] TEXT(255) NULL,
[Tart�s t�voll�t v�ge] TEXT(255) NULL,
[Tart�s t�voll�t tervezett v�ge] TEXT(255) NULL,
[Helyettes�tett dolgoz� neve] TEXT(255) NULL,
[Helyettes�tett dolgoz� szerz�d�s/kinevez�ses munkak�re] TEXT(255) NULL,
[Szerz�d�s/Kinevez�s - pr�baid� v�ge] DATETIME NULL,
[Utal�si c�m] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Garant�lt b�rminimumra t�rt�n� kieg�sz�t�s] TEXT(255) NULL,
[Kerek�t�s] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S % (elt�r�t] TEXT(255) NULL,
[Egy�b p�tl�k, GARANT�LT B�RMINIMUMRA VAL� KIEG�SZ�T�S �sszeg (el] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�t�s n�l] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�t�s n�lk�li)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�t�s n�lk�li)] DOUBLE NULL,
[Elt�r�t�s %] TEXT(255) NULL,
[Alapilletm�ny / Munkab�r / Megb�z�si d�j (elt�r�tett)] DOUBLE NULL,
[Mez�191] TEXT(255) NULL,
[Mez�192] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY % (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k, KEREK�T�SB�L AD�D� ILLETM�NY �sszeg (elt�r�tett)] TEXT(255) NULL,
[Egy�b p�tl�k - �sszeg (elt�r�tett)] TEXT(255) NULL,
[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�tett)] DOUBLE NULL,
[Kerek�tett 100 %-os illetm�ny (elt�r�tett)] DOUBLE NULL,
[Tov�bbi munkav�gz�s helye 1 Teljes munkaid� %-a] TEXT(255) NULL,
[Tov�bbi munkav�gz�s helye 2 Teljes munkaid� %-a] TEXT(255) NULL,
[KT: Kerek�tett 100 %-os illetm�ny (elt�r�tett) + Helyettes�t�si ] DOUBLE NULL,
[Szint 1 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 1 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 2 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 2 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 3 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 3 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 4 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 4 szervezeti egys�g k�d] TEXT(255) NULL,
[Szint 5 szervezeti egys�g n�v] TEXT(255) NULL,
[Szint 5 szervezeti egys�g k�d] TEXT(255) NULL,
[AD egyedi azonos�t�] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mell�k] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[Tov�bbi otthoni mobil] TEXT(255) NULL
);

CREATE INDEX [Ad�jel] ON [tSzem�lyek20230101] ([Ad�jel]);

CREATE INDEX [Jogviszony kezdete (bel�p�s d�tuma)] ON [tSzem�lyek20230101] ([Jogviszony kezdete (bel�p�s d�tuma)]);

CREATE INDEX [Jogviszony v�ge (kil�p�s d�tuma)] ON [tSzem�lyek20230101] ([Jogviszony v�ge (kil�p�s d�tuma)]);

ALTER TABLE [tSzem�lyek20230101] ADD CONSTRAINT [PK_tSzem�lyek20230101] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tSzem�lyMez�k] (
[Az] DOUBLE NOT NULL,
[Oszlopn�v] TEXT(255) NULL,
[T�pus] DOUBLE NULL,
[Mez�n�v] TEXT(255) NULL,
[Skip] YESNO NULL
);

ALTER TABLE [tSzem�lyMez�k] ADD CONSTRAINT [PK_tSzem�lyMez�k] PRIMARY KEY ([Az]);

CREATE TABLE [tSzem�lyt�rzs_�sszes_oszlopa] (
[Azonos�t�] LONG NULL,
[F1] TEXT(255) NULL
);

ALTER TABLE [tSzem�lyt�rzs_�sszes_oszlopa] ADD CONSTRAINT [PK_tSzem�lyt�rzs_�sszes_oszlopa] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tSzervezeti] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti] ADD CONSTRAINT [PK_tSzervezeti] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tSzervezeti_tart] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti_tart] ADD CONSTRAINT [PK_tSzervezeti_tart] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tSzervezeti2024__12__05__11_12_24] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__05__11_12_24] ADD CONSTRAINT [PK_tSzervezeti2024__12__05__11_12_24] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tSzervezeti2024__12__06__12_45_48] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__06__12_45_48] ADD CONSTRAINT [PK_tSzervezeti2024__12__06__12_45_48] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tSzervezeti2024__12__06__12_53_11] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__06__12_53_11] ADD CONSTRAINT [PK_tSzervezeti2024__12__06__12_53_11] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tSzervezeti2024__12__09__13_08_50] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__09__13_08_50] ADD CONSTRAINT [PK_tSzervezeti2024__12__09__13_08_50] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tSzervezeti2024__12__10__11_57_06] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__10__11_57_06] ADD CONSTRAINT [PK_tSzervezeti2024__12__10__11_57_06] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tSzervezeti2024__12__11__9_04_12] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__11__9_04_12] ADD CONSTRAINT [PK_tSzervezeti2024__12__11__9_04_12] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tSzervezeti2024__12__12__8_20_47] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__12__8_20_47] ADD CONSTRAINT [PK_tSzervezeti2024__12__12__8_20_47] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tSzervezeti2024__12__13__10_15_55] (
[Azonos�t�] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment k�d] TEXT(255) NULL,
[HR kapcsolat sorsz�ma] DOUBLE NULL,
[Megnevez�s sz�t�relem k�dja] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[R�vid n�v] TEXT(255) NULL,
[�rv�nyess�g kezdete] DATETIME NULL,
[�rv�nyess�g v�ge] DATETIME NULL,
[Ad�sz�m] TEXT(255) NULL,
[KSH sz�m] TEXT(255) NULL,
[OEP nyilv�ntart�si sz�m] TEXT(255) NULL,
[T�rzssz�m] TEXT(255) NULL,
[Sz�khely c�m] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egys�gek sz�ma (db)] TEXT(255) NULL,
[Bet�lt�tt st�tuszok sz�ma (db)] DOUBLE NULL,
[Bet�ltetlen st�tuszok sz�ma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egys�g vezet�je] TEXT(255) NULL,
[Szervezeti egys�g vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Korm�nyhivatal neve] TEXT(255) NULL,
[K�lts�ghely k�d] TEXT(255) NULL,
[K�lts�ghely megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g t�pus] TEXT(255) NULL,
[Szervezeti egys�g kateg�ria] TEXT(255) NULL,
[Feladatk�r] TEXT(255) NULL,
[Enged�lyezett vezet�i l�tsz�m] TEXT(255) NULL,
[B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[B�r F6 besorol�si szint megnevez�s] TEXT(255) NULL,
[Szervezeti egys�g�nek szintje] DOUBLE NULL,
[Munk�ltat�i jogk�rt gyakorl�] TEXT(255) NULL,
[Sz�l� szervezeti egys�g�nek k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek megnevez�se] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�je] TEXT(255) NULL,
[Szervezeti egys�g�nek vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti egys�g�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti egys�g�nek k�lts�ghelyt�l?] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek megnevez�se] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a szervezeti munkak�r�nek k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tuszbet�lt�ssel rendelkezik a kil�p�st k�vet�en?] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si k�dja] TEXT(255) NULL,
[Szervezeti munkak�r�nek B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[A B�r F6 besorol�si szint elt�r a szervezeti munkak�r�nek B�r F6] TEXT(255) NULL,
[Vezet�i st�tusz] TEXT(255) NULL,
[K�pz�si k�lts�gkeret] TEXT(255) NULL,
[Helyettes vezet�-e] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Jogviszony t�pus] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - Kulcssz�m megnevez�s] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat k�d] TEXT(255) NULL,
[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s] TEXT(255) NULL,
[P�ly�ztat�s hat�rideje] TEXT(255) NULL,
[Vezet�i beoszt�s KA] TEXT(255) NULL,
[Vezet�i beoszt�s KT] TEXT(255) NULL,
[P�ly�ztat�s alatt �ll] TEXT(255) NULL,
[Megjegyz�s] TEXT(255) NULL,
[St�tusz z�rol�s oka] TEXT(255) NULL,
[St�tusz z�rol�s kezdete] DATETIME NULL,
[St�tusz z�rol�s v�ge] DATETIME NULL,
[St�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz enged�lyezett FTE (�zleti param�ter szerint sz�molva)] DOUBLE NULL,
[�tmeneti �rasz�m] DOUBLE NULL,
[�tmeneti l�tsz�m (FTE)] DOUBLE NULL,
[K�zz�tett hierarchi�ban megjelen�tend�] TEXT(255) NULL,
[Asszisztens st�tusz] TEXT(255) NULL,
[L�tsz�mon fel�l l�trehozott st�tusz] TEXT(255) NULL,
[St�tusz t�pusa] TEXT(255) NULL,
[St�tusz bet�lt�si �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE] DOUBLE NULL,
[Helyettes�t�s m�rt�ke (%)] DOUBLE NULL,
[Helyettes�t�si d�j (%)] DOUBLE NULL,
[St�tusz bet�lt�si �rasz�ma minusz st�tusz enged�lyezett �rasz�ma] DOUBLE NULL,
[St�tusz bet�lt�si FTE minusz st�tusz enged�lyezett FTE] DOUBLE NULL,
[St�tusz�nak k�dja] TEXT(255) NULL,
[St�tusz�nak neve] TEXT(255) NULL,
[St�tusz�nak az enged�lyezett �rasz�ma] DOUBLE NULL,
[Mez�82] DOUBLE NULL,
[Aktu�lis bet�lt�s �rasz�ma] DOUBLE NULL,
[Aktu�lis bet�lt�s FTE] DOUBLE NULL,
[St�tusz�nak k�lts�ghely k�dja] TEXT(255) NULL,
[St�tusz�nak k�lts�ghely megnevez�se] TEXT(255) NULL,
[A k�lts�ghely elt�r a st�tusz�nak k�lts�ghely�t�l?] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint k�dja] TEXT(255) NULL,
[St�tusz�nak B�r F6 besorol�si szint megnevez�se] TEXT(255) NULL,
[Mez�90] TEXT(255) NULL,
[Mi�ta bet�ltetlen a st�tusz (d�tum)] DATETIME NULL,
[H�ny napja bet�ltetlen (munkanap, alapnapt�r alapj�n)] TEXT(255) NULL,
[St�tuszbet�lt�s t�pusa] TEXT(255) NULL,
[Inakt�v �llom�nyba ker�l�s oka] TEXT(255) NULL,
[Tart�s t�voll�t kezdete] DATETIME NULL,
[Tart�s t�voll�t sz�m�tott kezdete] DATETIME NULL,
[Tart�s t�voll�t v�ge] DATETIME NULL,
[Tart�s t�voll�t t�pusa] TEXT(255) NULL,
[Els�dleges] TEXT(255) NULL,
[St�tusz vizualiz�ci�j�ban el�sz�r megjelen�tend�] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek k�dja] TEXT(255) NULL,
[Bet�lt� szerz�d�ses/kinevez�ses munkak�r�nek neve] TEXT(255) NULL,
[Szervezeti munkak�r elt�r a szerz�d�ses/kinevez�ses munkak�rt�l] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�je] TEXT(255) NULL,
[Bet�lt� k�zvetlen vezet�j�nek azonos�t�ja] TEXT(255) NULL,
[Szint1 - k�d] TEXT(255) NULL,
[Szint1 - le�r�s] TEXT(255) NULL,
[Szint2 - k�d] TEXT(255) NULL,
[Szint2 - le�r�s] TEXT(255) NULL,
[Szint3 - k�d] TEXT(255) NULL,
[Szint3 - le�r�s] TEXT(255) NULL,
[Szint4 - k�d] TEXT(255) NULL,
[Szint4 - le�r�s] TEXT(255) NULL,
[Szint5 - k�d] TEXT(255) NULL,
[Szint5 - le�r�s] TEXT(255) NULL,
[Szint6 - k�d] TEXT(255) NULL,
[Szint6 - le�r�s] TEXT(255) NULL,
[Szint7 - k�d] TEXT(255) NULL,
[Szint7 - le�r�s] TEXT(255) NULL,
[Szint8 - k�d] TEXT(255) NULL,
[Szint8 - le�r�s] TEXT(255) NULL,
[Szint9 - k�d] TEXT(255) NULL,
[Szint9 - le�r�s] TEXT(255) NULL,
[Szint10 - k�d] TEXT(255) NULL,
[Szint10 - le�r�s] TEXT(255) NULL,
[Szint11 - k�d] TEXT(255) NULL,
[Szint11 - le�r�s] TEXT(255) NULL,
[Szint12 - k�d] TEXT(255) NULL,
[Szint12 - le�r�s] TEXT(255) NULL,
[Szint13 - k�d] TEXT(255) NULL,
[Szint13 - le�r�s] TEXT(255) NULL,
[Szint14 - k�d] TEXT(255) NULL,
[Szint14 - le�r�s] TEXT(255) NULL,
[Szint15 - k�d] TEXT(255) NULL,
[Szint15 - le�r�s] TEXT(255) NULL,
[Asszisztensek sz�ma] DOUBLE NULL,
[Vezet�k sz�ma] DOUBLE NULL,
[HRM-ben l�v� Div�zi� besorol�si adat] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Div�zi� �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szakfeladat besorol�si adat] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szakfeladat �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Szolg�ltat�s besorol�si adat] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek kezdete] TEXT(255) NULL,
[A Szolg�ltat�s �rv�nyess�g�nek v�ge] TEXT(255) NULL,
[HRM-ben l�v� Forr�s besorol�si adat] TEXT(255) NULL,
[A Forr�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Forr�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Egys�g besorol�si adat] TEXT(255) NULL,
[Az Egys�g �rv�nyess�g�nek kezdete] DATETIME NULL,
[Az Egys�g �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Foglalkoz�si viszony besorol�si adat] TEXT(255) NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Foglalkoz�si viszony �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Kifizet�hely besorol�si adat] TEXT(255) NULL,
[A Kifizet�hely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Kifizet�hely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� k�lts�ghely k�d besorol�si adat] TEXT(255) NULL,
[HRM-ben l�v� k�lts�ghely megnevez�s besorol�si adat] TEXT(255) NULL,
[A K�lts�ghely �rv�nyess�g�nek kezdete] DATETIME NULL,
[A K�lts�ghely �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� FEOR besorol�si adat] TEXT(255) NULL,
[A FEOR �rv�nyess�g�nek kezdete] DATETIME NULL,
[A FEOR �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� B�rfizet�si csoport besorol�si adat] TEXT(255) NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek kezdete] DATETIME NULL,
[A B�rfizet�si csoport �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Beoszt�s besorol�si adat] TEXT(255) NULL,
[A Beoszt�s �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Beoszt�s �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� R�gi� besorol�si adat] TEXT(255) NULL,
[A R�gi� �rv�nyess�g�nek kezdete] DATETIME NULL,
[A R�gi� �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Rendfokozat besorol�si adat] TEXT(255) NULL,
[A Rendfokozat �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Rendfokozat �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munk�ltat�i besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munk�ltat�i besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Munkak�r besorol�si adat] TEXT(255) NULL,
[A Munkak�r �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Munkak�r �rv�nyess�g�nek v�ge] DATETIME NULL,
[HRM-ben l�v� Besorol�si kateg�ria besorol�si adat] TEXT(255) NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek kezdete] DATETIME NULL,
[A Besorol�si kateg�ria �rv�nyess�g�nek v�ge] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__13__10_15_55] ADD CONSTRAINT [PK_tSzervezeti2024__12__13__10_15_55] PRIMARY KEY ([Azonos�t�],[Szervezetmenedzsment k�d],[Szervezeti egys�g t�pus],[Szervezeti egys�g kateg�ria],[Feladatk�r],[St�tusz t�pusa],[St�tusz�nak k�dja]);

CREATE TABLE [tSzervezetiEgys�gek] (
[azSzervezet] LONG NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL
);

ALTER TABLE [tSzervezetiEgys�gek] ADD CONSTRAINT [PK_tSzervezetiEgys�gek] PRIMARY KEY ([azSzervezet]);

CREATE TABLE [tSzervezetiEgys�gek1] (
[azSzervezet] LONG NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[Szervezeti egys�g k�dja] TEXT(255) NULL
);

ALTER TABLE [tSzervezetiEgys�gek1] ADD CONSTRAINT [PK_tSzervezetiEgys�gek1] PRIMARY KEY ([azSzervezet]);

CREATE TABLE [tSzob�k] (
[azSzoba] LONG NULL,
[Szobasz�m] TEXT(255) NULL
);

ALTER TABLE [tSzob�k] ADD CONSTRAINT [PK_tSzob�k] PRIMARY KEY ([azSzoba]);

CREATE TABLE [tSzolg�latiId�Elismer�s] (
[Azonos�t�1] LONG NULL,
[Szervezeti egys�g k�d] TEXT(255) NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[Jogviszony t�pus] TEXT(255) NULL,
[N�v] TEXT(255) NULL,
[Azonos�t�] TEXT(255) NULL,
[Szerz�d�s/kinevez�ses munkak�r] TEXT(255) NULL,
[Mez�7] DOUBLE NULL,
[Szolg�lati elismer�sre jogosults�g / Jubileumi jutalom kezd� d�t] TEXT(255) NULL,
[Tervezett esed�kess�g 20 �ves] TEXT(255) NULL,
[Jogos�t� h�napok sz�ma 20 �ves] TEXT(255) NULL,
[Tervezett �sszeg 20 �ves  (Ft)] DOUBLE NULL,
[Mez�12] TEXT(255) NULL,
[Jogos�t� h�napok sz�ma 25 �ves] TEXT(255) NULL,
[Mez�14] DOUBLE NULL,
[Mez�15] TEXT(255) NULL,
[Jogos�t� h�napok sz�ma 30 �ves] TEXT(255) NULL,
[Mez�17] DOUBLE NULL,
[Mez�18] TEXT(255) NULL,
[Jogos�t� h�napok sz�ma 35 �ves] TEXT(255) NULL,
[Mez�20] DOUBLE NULL,
[Mez�21] TEXT(255) NULL,
[Jogos�t� h�napok sz�ma 40 �ves] TEXT(255) NULL,
[Mez�23] DOUBLE NULL,
[Tervezett esed�kess�g 45 �ves] TEXT(255) NULL,
[Jogos�t� h�napok sz�ma 45 �ves] TEXT(255) NULL,
[Tervezett �sszeg 45 �ves (Ft)] DOUBLE NULL,
[Tervezett esed�kess�g 50 �ves] TEXT(255) NULL,
[Jogos�t� h�napok sz�ma 50 �ves] TEXT(255) NULL,
[Tervezett �sszeg 50 �ves (Ft)] DOUBLE NULL,
[Tervezett esed�kess�g 55 �ves] TEXT(255) NULL,
[Jogos�t� h�napok sz�ma 55 �ves] TEXT(255) NULL,
[Tervezett �sszeg 55 �ves (Ft)] DOUBLE NULL,
[Mez�33] TEXT(255) NULL,
[Mez�34] TEXT(255) NULL,
[Mez�35] TEXT(255) NULL,
[Mez�36] TEXT(255) NULL,
[Mez�37] DOUBLE NULL
);

CREATE INDEX [Azonos�t�] ON [tSzolg�latiId�Elismer�s] ([Azonos�t�]);

ALTER TABLE [tSzolg�latiId�Elismer�s] ADD CONSTRAINT [PK_tSzolg�latiId�Elismer�s] PRIMARY KEY ([Azonos�t�1]);

CREATE TABLE [tT�blamez�k] (
[t�blan�v] TEXT(255) NULL,
[mez�n�v] TEXT(255) NULL,
[sorsz�m] LONG NULL,
[t�pusa] TEXT(255) NULL
);

CREATE TABLE [tTelefonkonyv] (
[Vezet�kn�v] TEXT(255) NULL,
[Ut�n�v] TEXT(255) NULL,
[Teljes n�v] TEXT(255) NULL,
[Munkak�r] TEXT(255) NULL,
[Korm�nyhivatal] TEXT(255) NULL,
[E-mail c�m] TEXT(255) NULL,
[K�ls� vezet�kes telefonsz�m] TEXT(255) NULL,
[Bels� vezet�kes telefonsz�m] TEXT(255) NULL,
[Mobiltelefonsz�m] TEXT(255) NULL,
[K�ls� fax sz�m] TEXT(255) NULL,
[Bels� fax sz�m] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL,
[J�r�si oszt�ly] TEXT(255) NULL,
[Levelez�si c�m] TEXT(255) NULL,
[Emelet] TEXT(255) NULL,
[Szobasz�m] TEXT(255) NULL,
[V�ros] TEXT(255) NULL,
[Ir�ny�t�sz�m] TEXT(255) NULL,
[Telep�l�s] TEXT(255) NULL,
[Utca] TEXT(255) NULL,
[�p�let] TEXT(255) NULL,
[Felhaszn�l�n�v] TEXT(255) NULL,
[Le�r�s] TEXT(255) NULL
);

CREATE TABLE [tTelefonsz�mMint�k] (
[Azonos�t�] LONG NULL,
[Minta] TEXT(255) NULL,
[El�h�v�] YESNO NULL,
[K�rzetsz�m] YESNO NULL,
[F�v�rosi] YESNO NULL,
[Vid�k] YESNO NULL,
[Mobil] YESNO NULL,
[Mell�k] YESNO NULL
);

ALTER TABLE [tTelefonsz�mMint�k] ADD CONSTRAINT [PK_tTelefonsz�mMint�k] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tTelephelyek] (
[Azonos�t�] LONG NULL,
[Mez�1] TEXT(255) NULL,
[Szervezeti egys�g] TEXT(255) NULL,
[SzervezetK�d] TEXT(255) NULL,
[C�m] TEXT(255) NULL
);

ALTER TABLE [tTelephelyek] ADD CONSTRAINT [PK_tTelephelyek] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tTelephelyek230301] (
[Sorsz�m] DOUBLE NULL,
[Irsz] DOUBLE NULL,
[V�ros] TEXT(255) NULL,
[C�m] TEXT(255) NULL,
[Nexon c�m] TEXT(255) NULL,
[Tulajdonos] TEXT(255) NULL,
[�zemeltet�] TEXT(255) NULL,
[Mez�7] TEXT(255) NULL,
[C�m (m�solt)] TEXT(255) NULL
);

CREATE INDEX [C�m] ON [tTelephelyek230301] ([C�m]);

ALTER TABLE [tTelephelyek230301] ADD CONSTRAINT [PK_tTelephelyek230301] PRIMARY KEY ([Sorsz�m]);

CREATE TABLE [tTmp] (
[Azonos�t�] LONG NULL,
[F1] TEXT(255) NULL
);

ALTER TABLE [tTmp] ADD CONSTRAINT [PK_tTmp] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tTmpEgyesMunkak�r�kF�oszt�lyai] (
[Azonos�t�] LONG NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL
);

ALTER TABLE [tTmpEgyesMunkak�r�kF�oszt�lyai] ADD CONSTRAINT [PK_tTmpEgyesMunkak�r�kF�oszt�lyai] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tTmpLog] (
[azLog] LONG NULL,
[Bejegyz�s] TEXT(255) NULL,
[Bejegyz�sT�rgya] TEXT(255) NULL,
[bejegyz�s id�pontja] DATETIME NULL,
[FolyamatHASH] TEXT(255) NULL,
[logszint] BYTE NULL,
[felhaszn�l�] TEXT(255) NULL,
[sz�m�t�g�p] TEXT(255) NULL,
[adatb�zis] TEXT(255) NULL
);

CREATE TABLE [t�jSzervezetiT�bla] (
[Azonos�t�] LONG NULL,
[BFKH k�d] TEXT(255) NULL,
[F�oszt�ly] TEXT(255) NULL,
[Oszt�ly] TEXT(255) NULL
);

ALTER TABLE [t�jSzervezetiT�bla] ADD CONSTRAINT [PK_t�jSzervezetiT�bla] PRIMARY KEY ([Azonos�t�]);

CREATE TABLE [tUnionCsoportok] (
[azUnion] LONG NULL,