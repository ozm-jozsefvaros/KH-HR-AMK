CREATE TABLE [20241001OrvosiAlkalmassági] (
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Születési név] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[TAJ szám] DOUBLE NULL,
[Orvosi vizsgálat idõpontja] DATETIME NULL,
[Orvosi vizsgálat következõ idõpontja] DATETIME NULL,
[Hivatali email] TEXT(255) NULL,
[TT] TEXT(255) NULL,
[Kilépés dátuma] DATETIME NULL,
[AdóTajAdó#Adóazonosító jel] DOUBLE NULL,
[Távollét#Tv#kezdete] DATETIME NULL,
[Távollét#Tv#vége] DATETIME NULL
);

CREATE TABLE [Álláshelyek] (
[Azonosító] LONG NULL,
[Szervezet] TEXT(255) NULL,
[1 szint] TEXT(255) NULL,
[2 szint] TEXT(255) NULL,
[3 szint] TEXT(255) NULL,
[4 szint] TEXT(255) NULL,
[5 szint] TEXT(255) NULL,
[6 szint] TEXT(255) NULL,
[7 szint] TEXT(255) NULL,
[8 szint] TEXT(255) NULL,
[Álláshely típusa] TEXT(255) NULL,
[Álláshely altípusa] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Álláshely besorolási osztálya] TEXT(255) NULL,
[Álláshely besorolási kategóriája] TEXT(255) NULL,
[Hatályosság kezdete] DATETIME NULL,
[Álláshely státusza] TEXT(255) NULL,
[Zárolás várható dátuma] DATETIME NULL,
[Álláshelyen fennálló jogviszony] TEXT(255) NULL,
[Álláshelykeretbe tartozó álláshely] TEXT(255) NULL,
[Álláshelyen fennálló jogviszony ideje] DOUBLE NULL,
[Álláshely hatályának jellege] TEXT(255) NULL,
[Álláshely finanszírozási forrása] TEXT(255) NULL,
[Munkaidõ jellege] TEXT(255) NULL,
[Részmunkaidõs darabszám] DOUBLE NULL,
[Hatályosság vége] TEXT(255) NULL,
[Utolsó módosítás dátuma] DATETIME NULL,
[Migrációs állomány neve] TEXT(255) NULL,
[Állomány sora] TEXT(255) NULL,
[Hatály] DATETIME NULL
);

ALTER TABLE [Álláshelyek] ADD CONSTRAINT [PK_Álláshelyek] PRIMARY KEY ([Azonosító]);

CREATE TABLE [Álláshelyek_2210] (
[Azonosító] LONG NULL,
[Szervezet neve] TEXT(255) NULL,
[1 szint(név)] TEXT(255) NULL,
[2 szint(név)] TEXT(255) NULL,
[3 szint(név)] TEXT(255) NULL,
[4 szint(név)] TEXT(255) NULL,
[5 szint(név)] TEXT(255) NULL,
[keretes] TEXT(255) NULL,
[Kód] TEXT(255) NULL,
[hovatartozás] TEXT(255) NULL,
[álláshely azonosító] TEXT(255) NULL,
[besorolas] TEXT(255) NULL,
[státusz kezdete] TEXT(255) NULL,
[státusz] TEXT(255) NULL,
[zárolás várható dátuma] TEXT(255) NULL,
[jelleg] TEXT(255) NULL,
[határozott esetben lejárat] TEXT(255) NULL,
[érvényesség tól] TEXT(255) NULL,
[érvényesség ig] TEXT(255) NULL,
[jogviszony] TEXT(255) NULL,
[forrás] TEXT(255) NULL,
[részmunkaidõs] TEXT(255) NULL,
[részmunkaidõs db] TEXT(255) NULL,
[állomány név] TEXT(255) NULL,
[állomány sor] TEXT(255) NULL
);

ALTER TABLE [Álláshelyek_2210] ADD CONSTRAINT [PK_Álláshelyek_2210] PRIMARY KEY ([Azonosító]);

CREATE TABLE [Álláshelyek_tart] (
[Azonosító] LONG NULL,
[Szervezet] TEXT(255) NULL,
[1 szint] TEXT(255) NULL,
[2 szint] TEXT(255) NULL,
[3 szint] TEXT(255) NULL,
[4 szint] TEXT(255) NULL,
[5 szint] TEXT(255) NULL,
[6 szint] TEXT(255) NULL,
[7 szint] TEXT(255) NULL,
[8 szint] TEXT(255) NULL,
[Álláshely típusa] TEXT(255) NULL,
[Álláshely altípusa] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Álláshely besorolási osztálya] TEXT(255) NULL,
[Álláshely besorolási kategóriája] TEXT(255) NULL,
[Hatályosság kezdete] DATETIME NULL,
[Álláshely státusza] TEXT(255) NULL,
[Zárolás várható dátuma] DATETIME NULL,
[Álláshelyen fennálló jogviszony] TEXT(255) NULL,
[Álláshelykeretbe tartozó álláshely] TEXT(255) NULL,
[Álláshelyen fennálló jogviszony ideje] DOUBLE NULL,
[Álláshely hatályának jellege] TEXT(255) NULL,
[Álláshely finanszírozási forrása] TEXT(255) NULL,
[Munkaidõ jellege] TEXT(255) NULL,
[Részmunkaidõs darabszám] DOUBLE NULL,
[Hatályosság vége] TEXT(255) NULL,
[Utolsó módosítás dátuma] DATETIME NULL,
[Migrációs állomány neve] TEXT(255) NULL,
[Állomány sora] TEXT(255) NULL
);

ALTER TABLE [Álláshelyek_tart] ADD CONSTRAINT [PK_Álláshelyek_tart] PRIMARY KEY ([Azonosító]);

CREATE TABLE [ÁnyrÉsVálaszok240815] (
[ÁNYR] TEXT(255) NULL,
[Állapot] TEXT(255) NULL
);

CREATE TABLE [Automatikus névjavítás mentési hibái] (
[Objektumnév] TEXT(255) NULL,
[Objektumtípus] TEXT(255) NULL,
[Hiba oka] TEXT(255) NULL,
[Idõ] DATETIME NULL
);

CREATE TABLE [Beillesztési hiba] (
[F1] DOUBLE NULL,
[F2] DATETIME NULL,
[F3] TEXT(255) NULL,
[F4] TEXT(255) NULL
);

CREATE TABLE [Belépõk] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] LONG NULL,
[Neme] LONG NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Illetmény (Ft/hó)] CURRENCY NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Belépõk] ([HatályaID]);

CREATE TABLE [Belépõk_tart] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] LONG NULL,
[Neme] LONG NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Illetmény (Ft/hó)] CURRENCY NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Belépõk_tart] ([HatályaID]);

CREATE TABLE [BesorolásHelyettesített] (
[Azonosító] LONG NULL,
[Adójel] DOUBLE NULL,
[TAJ szám] LONG NULL,
[Egyedi azonosító] LONG NULL,
[Törzsszám] LONG NULL,
[Elõnév] TEXT(255) NULL,
[Családi név] TEXT(255) NULL,
[Utónév] TEXT(255) NULL,
[Jogviszony ID] DOUBLE NULL,
[Kód] LONG NULL,
[Megnevezés] TEXT(255) NULL,
[Kezdete] DATETIME NULL,
[Vége] DATETIME NULL,
[Kezdete1] DATETIME NULL,
[Vége1] DATETIME NULL,
[Helyettesítés oka] TEXT(255) NULL,
[Elõnév1] TEXT(255) NULL,
[Családi név1] TEXT(255) NULL,
[Utónév1] TEXT(255) NULL,
[Jogviszony ID1] DOUBLE NULL,
[Eltérõ illetmény fokozata] TEXT(255) NULL
);

ALTER TABLE [BesorolásHelyettesített] ADD CONSTRAINT [PK_BesorolásHelyettesített] PRIMARY KEY ([Azonosító]);

CREATE TABLE [DÁPKitöltöttVisszaküldött] (
[Forrás#Név] TEXT(255) NULL,
[Hivatal] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[DÁP regisztrációra kijelölve] TEXT(255) NULL
);

CREATE TABLE [EsetiÁNYRszámok] (
[Azonosító] LONG NULL,
[StátuszKód] TEXT(255) NULL
);

ALTER TABLE [EsetiÁNYRszámok] ADD CONSTRAINT [PK_EsetiÁNYRszámok] PRIMARY KEY ([Azonosító]);

CREATE TABLE [EszjtvBesorolásiKategóriák] (
[Azonosító] LONG NULL,
[EszjtvBesorolásiKategóriák] TEXT(255) NULL,
[Min] LONG NULL,
[Max] LONG NULL
);

ALTER TABLE [EszjtvBesorolásiKategóriák] ADD CONSTRAINT [PK_EszjtvBesorolásiKategóriák] PRIMARY KEY ([Azonosító]);

CREATE TABLE [FedlaprólLétszámtábla] (
[Az álláshely megynevezése] TEXT(255) NULL,
[Álláshely száma] DOUBLE NULL,
[HatályaID] LONG NULL,
[Azonosító] LONG NULL
);

CREATE INDEX [HatályaID] ON [FedlaprólLétszámtábla] ([HatályaID]);

ALTER TABLE [FedlaprólLétszámtábla] ADD CONSTRAINT [PK_FedlaprólLétszámtábla] PRIMARY KEY ([Azonosító]);

CREATE TABLE [FedlaprólLétszámtábla_tart] (
[Az álláshely megynevezése] TEXT(255) NULL,
[Álláshely száma] DOUBLE NULL,
[HatályaID] LONG NULL,
[Azonosító] LONG NULL
);

CREATE INDEX [HatályaID] ON [FedlaprólLétszámtábla_tart] ([HatályaID]);

ALTER TABLE [FedlaprólLétszámtábla_tart] ADD CONSTRAINT [PK_FedlaprólLétszámtábla_tart] PRIMARY KEY ([Azonosító]);

CREATE TABLE [FedlaprólLétszámtábla2] (
[Az álláshely megynevezése] TEXT(255) NULL,
[Álláshely száma] DOUBLE NULL,
[HatályaID] LONG NULL,
[Azonosító] LONG NULL
);

CREATE INDEX [HatályaID] ON [FedlaprólLétszámtábla2] ([HatályaID]);

ALTER TABLE [FedlaprólLétszámtábla2] ADD CONSTRAINT [PK_FedlaprólLétszámtábla2] PRIMARY KEY ([Azonosító]);

CREATE TABLE [FedlaprólLétszámtábla2_tart] (
[Az álláshely megynevezése] TEXT(255) NULL,
[Álláshely száma] DOUBLE NULL,
[HatályaID] LONG NULL,
[Azonosító] LONG NULL
);

CREATE INDEX [HatályaID] ON [FedlaprólLétszámtábla2_tart] ([HatályaID]);

ALTER TABLE [FedlaprólLétszámtábla2_tart] ADD CONSTRAINT [PK_FedlaprólLétszámtábla2_tart] PRIMARY KEY ([Azonosító]);

CREATE TABLE [FedlaprólLétszámtábla21] (
[Az álláshely megynevezése] TEXT(255) NULL,
[Álláshely száma] DOUBLE NULL,
[HatályaID] LONG NULL,
[Azonosító] LONG NULL
);

CREATE INDEX [HatályaID] ON [FedlaprólLétszámtábla21] ([HatályaID]);

ALTER TABLE [FedlaprólLétszámtábla21] ADD CONSTRAINT [PK_FedlaprólLétszámtábla21] PRIMARY KEY ([Azonosító]);

CREATE TABLE [FESZ] (
[Azonosító] LONG NULL,
[Név] TEXT(255) NULL,
[TAJ] TEXT(255) NULL,
[Szüldátum] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[FEOR megnevezés] TEXT(255) NULL,
[Alk tipus] TEXT(255) NULL,
[Alk dátuma] TEXT(255) NULL,
[Érvényes] TEXT(255) NULL,
[Eredmény] TEXT(255) NULL,
[Korlátozás] TEXT(255) NULL,
[Hatály] DATETIME NULL
);

ALTER TABLE [FESZ] ADD CONSTRAINT [PK_FESZ] PRIMARY KEY ([Azonosító]);

CREATE TABLE ['FESZ  04 hó$'_ImportálásiHibák] (
[Hiba] TEXT(255) NULL,
[Mezõ] TEXT(255) NULL,
[Sor] LONG NULL
);

CREATE TABLE ['FESZ  04 hó$'_ImportálásiHibák1] (
[Hiba] TEXT(255) NULL,
[Mezõ] TEXT(255) NULL,
[Sor] LONG NULL
);

CREATE TABLE [Határozottak] (
[Sorszám] DOUBLE NULL,
[Tartós távollévõ neve] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] TEXT(255) NULL,
[Nem] TEXT(255) NULL,
[Szervezti alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét várható vége] DATETIME NULL,
[Tartósan távollévõ illetményének teljes összege] CURRENCY NULL,
[Tartós távollévõ álláshelyén határozott idõre foglalkoztatott ne] TEXT(255) NULL,
[Mezõ17] TEXT(255) NULL,
[Központosított álláshely] TEXT(255) NULL,
[Mezõ18] TEXT(255) NULL,
[Mezõ19] TEXT(255) NULL,
[Mezõ20] TEXT(255) NULL,
[Mezõ21] TEXT(255) NULL,
[Mezõ22] TEXT(255) NULL,
[Mezõ23] DOUBLE NULL,
[Mezõ24] TEXT(255) NULL,
[Mezõ25] TEXT(255) NULL,
[Tartós távollévõ státuszán foglalkoztatott határozott idejû jogv] DATETIME NULL,
[Mezõ27] DATETIME NULL,
[Tartós távollévõ státuszán foglalkoztatott illetményének teljes ] CURRENCY NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Határozottak] ([HatályaID]);

CREATE TABLE [Határozottak_tart] (
[Sorszám] DOUBLE NULL,
[Tartós távollévõ neve] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] TEXT(255) NULL,
[Nem] TEXT(255) NULL,
[Szervezti alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét várható vége] DATETIME NULL,
[Tartósan távollévõ illetményének teljes összege] CURRENCY NULL,
[Tartós távollévõ álláshelyén határozott idõre foglalkoztatott ne] TEXT(255) NULL,
[Mezõ17] TEXT(255) NULL,
[Központosított álláshely] TEXT(255) NULL,
[Mezõ18] TEXT(255) NULL,
[Mezõ19] TEXT(255) NULL,
[Mezõ20] TEXT(255) NULL,
[Mezõ21] TEXT(255) NULL,
[Mezõ22] TEXT(255) NULL,
[Mezõ23] DOUBLE NULL,
[Mezõ24] TEXT(255) NULL,
[Mezõ25] TEXT(255) NULL,
[Tartós távollévõ státuszán foglalkoztatott határozott idejû jogv] DATETIME NULL,
[Mezõ27] DATETIME NULL,
[Tartós távollévõ státuszán foglalkoztatott illetményének teljes ] CURRENCY NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Határozottak_tart] ([HatályaID]);

CREATE TABLE [ideiglMobilModulKieg] (
[Azonosító] LONG NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL
);

ALTER TABLE [ideiglMobilModulKieg] ADD CONSTRAINT [PK_ideiglMobilModulKieg] PRIMARY KEY ([Azonosító]);

CREATE TABLE [Járási_állomány] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Járási Hivatal] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ9] TEXT(255) NULL,
[Mezõ10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;] TEXT(255) NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Heti munkaórák száma] DOUBLE NULL,
[Mezõ14] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ18] CURRENCY NULL,
[Mezõ19] CURRENCY NULL,
[Mezõ20] TEXT(255) NULL,
[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs] TEXT(255) NULL,
[Mezõ26] TEXT(255) NULL,
[Mezõ27] TEXT(255) NULL,
[Mezõ28] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [Adóazonosító] ON [Járási_állomány] ([Adóazonosító]);

CREATE INDEX [HatályaID] ON [Járási_állomány] ([HatályaID]);

CREATE TABLE [Járási_állomány_tart] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Járási Hivatal] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ9] TEXT(255) NULL,
[Mezõ10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;] TEXT(255) NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Heti munkaórák száma] DOUBLE NULL,
[Mezõ14] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ18] CURRENCY NULL,
[Mezõ19] CURRENCY NULL,
[Mezõ20] TEXT(255) NULL,
[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs] TEXT(255) NULL,
[Mezõ26] TEXT(255) NULL,
[Mezõ27] TEXT(255) NULL,
[Mezõ28] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Járási_állomány_tart] ([HatályaID]);

CREATE TABLE [Kilépõk] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Jogviszony megszûnésének, megszüntetésének idõpontja] DATETIME NULL,
[Illetmény (Ft/hó)] CURRENCY NULL,
[Végkielégítésre jogosító hónapok száma] DOUBLE NULL,
[Felmentési idõ hónapok száma] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Kilépõk] ([HatályaID]);

CREATE TABLE [Kilépõk_tart] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Jogviszony megszûnésének, megszüntetésének idõpontja] DATETIME NULL,
[Illetmény (Ft/hó)] CURRENCY NULL,
[Végkielégítésre jogosító hónapok száma] DOUBLE NULL,
[Felmentési idõ hónapok száma] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Kilépõk_tart] ([HatályaID]);

CREATE TABLE [Kormányhivatali_állomány] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ9] TEXT(255) NULL,
[Mezõ10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;] TEXT(255) NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Heti munkaórák száma] DOUBLE NULL,
[Mezõ14] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ18] CURRENCY NULL,
[Mezõ19] CURRENCY NULL,
[Mezõ20] TEXT(255) NULL,
[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs] TEXT(255) NULL,
[Mezõ26] TEXT(255) NULL,
[Mezõ27] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Kormányhivatali_állomány] ([HatályaID]);

CREATE TABLE [Kormányhivatali_állomány_tart] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ9] TEXT(255) NULL,
[Mezõ10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;] TEXT(255) NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Heti munkaórák száma] DOUBLE NULL,
[Mezõ14] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ18] CURRENCY NULL,
[Mezõ19] CURRENCY NULL,
[Mezõ20] TEXT(255) NULL,
[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs] TEXT(255) NULL,
[Mezõ26] TEXT(255) NULL,
[Mezõ27] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Kormányhivatali_állomány_tart] ([HatályaID]);

CREATE TABLE [Központosítottak] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] TEXT(255) NULL,
[Mezõ10] TEXT(255) NULL,
[Mezõ11] DATETIME NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Mezõ13] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ17] CURRENCY NULL,
[Mezõ18] TEXT(255) NULL,
[Tartós távollévõ nincs helyettese (TT)/ tartós távollévõnek van ] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [Adóazonosító] ON [Központosítottak] ([Adóazonosító]);

CREATE INDEX [HatályaID] ON [Központosítottak] ([HatályaID]);

CREATE TABLE [Központosítottak_tart] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] TEXT(255) NULL,
[Mezõ10] TEXT(255) NULL,
[Mezõ11] DATETIME NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Mezõ13] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ17] CURRENCY NULL,
[Mezõ18] TEXT(255) NULL,
[Tartós távollévõ nincs helyettese (TT)/ tartós távollévõnek van ] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[HatályaID] LONG NULL
);

CREATE INDEX [HatályaID] ON [Központosítottak_tart] ([HatályaID]);

CREATE TABLE [kt_azNexon_Adójel_22-11-29] (
[Azonosító] LONG NULL,
[azNexon] DOUBLE NOT NULL,
[Adójel] DOUBLE NOT NULL
);

CREATE INDEX [Adójel] ON [kt_azNexon_Adójel_22-11-29] ([Adójel]);

CREATE INDEX [azNexon] ON [kt_azNexon_Adójel_22-11-29] ([azNexon]);

CREATE INDEX [Kulcs] ON [kt_azNexon_Adójel_22-11-29] ([Adójel],[azNexon]);

ALTER TABLE [kt_azNexon_Adójel_22-11-29] ADD CONSTRAINT [PK_kt_azNexon_Adójel_22-11-29] PRIMARY KEY ([Azonosító]);

CREATE TABLE [ktFeladatKirafeladatFunkció] (
[Azonosító] LONG NULL,
[Feladat] TEXT(255) NULL,
[KIRA feladat megnevezés] TEXT(255) NULL,
[azFunkció] LONG NULL
);

ALTER TABLE [ktFeladatKirafeladatFunkció] ADD CONSTRAINT [PK_ktFeladatKirafeladatFunkció] PRIMARY KEY ([Azonosító]);

CREATE TABLE [ktFeladatkörFunkció] (
[Azonosító] LONG NULL,
[Feladatkör] TEXT(255) NULL,
[Funkció] TEXT(255) NULL
);

ALTER TABLE [ktFeladatkörFunkció] ADD CONSTRAINT [PK_ktFeladatkörFunkció] PRIMARY KEY ([Azonosító]);

CREATE TABLE [ktKimenetForrások] (
[azEllenõrzõ] LONG NOT NULL,
[azKimenetLap] LONG NOT NULL
);

CREATE INDEX [ktKimenetLap_EllenõrzõLekérdezésazEllenõrzõ] ON [ktKimenetForrások] ([azEllenõrzõ]);

CREATE INDEX [ktKimenetLap_EllenõrzõLekérdezésazKimenetForrás] ON [ktKimenetForrások] ([azKimenetLap]);

CREATE INDEX [tKimenetLapjaiktKimenetLap_EllenõrzõLekérdezés] ON [ktKimenetForrások] ([azKimenetLap]);

ALTER TABLE [ktKimenetForrások] ADD CONSTRAINT [PK_ktKimenetForrások] PRIMARY KEY ([azEllenõrzõ],[azKimenetLap]);

CREATE TABLE [ktRégiHibákIntézkedések] (
[HASH] TEXT(255) NOT NULL,
[azIntézkedések] LONG NOT NULL,
[rögzítésDátuma] DATETIME NULL
);

CREATE INDEX [tIntézkedésekktRégiHibákIntézkedések] ON [ktRégiHibákIntézkedések] ([azIntézkedések]);

CREATE INDEX [tRégiHibákktRégiHibákIntézkedések] ON [ktRégiHibákIntézkedések] ([HASH]);

ALTER TABLE [ktRégiHibákIntézkedések] ADD CONSTRAINT [PK_ktRégiHibákIntézkedések] PRIMARY KEY ([HASH],[azIntézkedések]);

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
[azEllenõrzõ] LONG NULL
);

ALTER TABLE [ktUnionLek] ADD CONSTRAINT [PK_ktUnionLek] PRIMARY KEY ([azUnionLek]);

CREATE TABLE [lkFARfordítótáblaVégzettséghez] (
[Azonosító] LONG NULL,
[Nexon] TEXT(255) NULL,
[FAR] TEXT(255) NULL,
[fok] LONG NULL
);

ALTER TABLE [lkFARfordítótáblaVégzettséghez] ADD CONSTRAINT [PK_lkFARfordítótáblaVégzettséghez] PRIMARY KEY ([Azonosító]);

CREATE TABLE [Munka1] (
[Foglalkoztatás-felügyeleti és Munkavédelmi Fõosztály] TEXT(255) NULL,
[Munkavédelmi, Foglalkoztatás-felügyeleti és Behajtási Osztály] TEXT(255) NULL
);

CREATE TABLE [SIM adatok - 2023-08-29 (2)] (
[Azonosító] LONG NULL,
[TelefonszámId] DOUBLE NULL,
[Telefonszám] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Dolgozó név] TEXT(255) NULL,
[Személytörzsben aktív -e] TEXT(255) NULL,
[Személytörzs szerinti e-mail cím] TEXT(255) NULL,
[Személytörzsben szervezeti egysége] TEXT(255) NULL,
[NEXON ID] DOUBLE NULL,
[Beosztás] TEXT(255) NULL,
[Szervezeti egység] TEXT(255) NULL,
[Dolgozó státusz] TEXT(255) NULL,
[Adóazon] TEXT(255) NULL,
[Személy e-mail címe] TEXT(255) NULL,
[Mezõ14] TEXT(255) NULL,
[Szervezeti egység név] TEXT(255) NULL,
[Szakfeladat részletezõ] TEXT(255) NULL,
[Szakfeladat részletezõ név] TEXT(255) NULL,
[Ügylet] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] TEXT(255) NULL,
[Rögzítõ] TEXT(255) NULL,
[Egyedi gyûktõ3] TEXT(255) NULL,
[Pénzforrás] TEXT(255) NULL,
[Megnevezése] TEXT(255) NULL,
[Egyedi gyûjtõ név] TEXT(255) NULL,
[Leírás] TEXT(255) NULL,
[Kötváll szám] TEXT(255) NULL,
[Kötváll megn] TEXT(255) NULL
);

ALTER TABLE [SIM adatok - 2023-08-29 (2)] ADD CONSTRAINT [PK_SIM adatok - 2023-08-29 (2)] PRIMARY KEY ([Azonosító]);

CREATE TABLE [t__Ellenõrzés_02] (
[Tábla] TEXT(255) NULL,
[Hiányzó_érték] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Adójel] DOUBLE NULL,
[azEllenõrzés] LONG NULL,
[dátum] DATETIME NOT NULL
);

ALTER TABLE [t__Ellenõrzés_02] ADD CONSTRAINT [PK_t__Ellenõrzés_02] PRIMARY KEY ([azEllenõrzés]);

CREATE TABLE [Tábla1] (
[Azonosító] LONG NULL,
[F1] TEXT(255) NULL,
[F2] LONG NULL,
[F3] TEXT(255) NULL,
[F4] TEXT(255) NULL,
[F5] DATETIME NULL,
[F6] TEXT(255) NULL,
[F7] TEXT(255) NULL,
[F8] DATETIME NULL
);

ALTER TABLE [Tábla1] ADD CONSTRAINT [PK_Tábla1] PRIMARY KEY ([Azonosító]);

CREATE TABLE [Tábla2] (
[azRef] LONG NULL
);

ALTER TABLE [Tábla2] ADD CONSTRAINT [PK_Tábla2] PRIMARY KEY ([azRef]);

CREATE TABLE [Tábla3] (
[Azonosító] LONG NULL,
[Próba] MEMO NULL
);

ALTER TABLE [Tábla3] ADD CONSTRAINT [PK_Tábla3] PRIMARY KEY ([Azonosító]);

CREATE TABLE [Tábla4] (
[Azonosító] LONG NULL,
[F1] TEXT(255) NULL
);

ALTER TABLE [Tábla4] ADD CONSTRAINT [PK_Tábla4] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tAdatszolgáltatók] (
[azAdatszolg] LONG NULL,
[azNexon] LONG NULL
);

ALTER TABLE [tAdatszolgáltatók] ADD CONSTRAINT [PK_tAdatszolgáltatók] PRIMARY KEY ([azAdatszolg]);

CREATE TABLE [tAdatváltoztatásiIgények] (
[Azonosító] LONG NULL,
[Dolgozó neve] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[Adatkör] TEXT(255) NULL,
[Igény dátuma] TEXT(255) NULL,
[Állapot] TEXT(255) NULL,
[Elbírálás dátuma] TEXT(255) NULL,
[Elbíráló] TEXT(255) NULL
);

CREATE INDEX [Adóazonosító jel] ON [tAdatváltoztatásiIgények] ([Adóazonosító jel]);

ALTER TABLE [tAdatváltoztatásiIgények] ADD CONSTRAINT [PK_tAdatváltoztatásiIgények] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tAIKiosk] (
[Azonosító] LONG NULL,
[Név] TEXT(255) NULL
);

ALTER TABLE [tAIKiosk] ADD CONSTRAINT [PK_tAIKiosk] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tAIKiosk02] (
[Azonosító] LONG NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Név] TEXT(255) NULL
);

ALTER TABLE [tAIKiosk02] ADD CONSTRAINT [PK_tAIKiosk02] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tAlapadatok] (
[azAlapadat] LONG NULL,
[TulajdonságNeve] TEXT(255) NULL,
[TulajdonságÉrték] TEXT(255) NULL,
[Objektum] TEXT(255) NULL,
[ObjektumTípus] TEXT(255) NULL,
[Típus] TEXT(255) NULL
);

CREATE INDEX [tulajd] ON [tAlapadatok] ([TulajdonságNeve],[Objektum]);

ALTER TABLE [tAlapadatok] ADD CONSTRAINT [PK_tAlapadatok] PRIMARY KEY ([azAlapadat]);

CREATE TABLE [tÁlláshelyek] (
[Azonosító] LONG NULL,
[Szervezet] TEXT(255) NULL,
[1 szint] TEXT(255) NULL,
[2 szint] TEXT(255) NULL,
[3 szint] TEXT(255) NULL,
[4 szint] TEXT(255) NULL,
[5 szint] TEXT(255) NULL,
[6 szint] TEXT(255) NULL,
[7 szint] TEXT(255) NULL,
[8 szint] TEXT(255) NULL,
[Álláshely típusa] TEXT(255) NULL,
[Álláshely altípusa] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Álláshely besorolási osztálya] TEXT(255) NULL,
[Álláshely besorolási kategóriája] TEXT(255) NULL,
[Hatályosság kezdete] DATETIME NULL,
[Álláshely státusza] TEXT(255) NULL,
[Zárolás várható dátuma] TEXT(255) NULL,
[Álláshelyen fennálló jogviszony] TEXT(255) NULL,
[Álláshelykeretbe tartozó álláshely] TEXT(255) NULL,
[Álláshelyen fennálló jogviszony ideje] TEXT(255) NULL,
[Álláshely hatályának jellege] TEXT(255) NULL,
[Álláshely finanszírozási forrása] TEXT(255) NULL,
[Munkaidõ jellege] TEXT(255) NULL,
[Részmunkaidõs darabszám] DOUBLE NULL,
[Hatályosság vége] TEXT(255) NULL,
[Utolsó módosítás dátuma] DATETIME NULL,
[Migrációs állomány neve] TEXT(255) NULL,
[Állomány sora] TEXT(255) NULL
);

CREATE INDEX [4 szint] ON [tÁlláshelyek] ([4 szint]);

CREATE INDEX [5 szint] ON [tÁlláshelyek] ([5 szint]);

CREATE INDEX [Álláshely azonosító] ON [tÁlláshelyek] ([Álláshely azonosító]);

CREATE INDEX [Álláshely besorolási kategóriája] ON [tÁlláshelyek] ([Álláshely besorolási kategóriája]);

CREATE INDEX [Álláshely besorolási osztálya] ON [tÁlláshelyek] ([Álláshely besorolási osztálya]);

CREATE INDEX [Álláshely státusza] ON [tÁlláshelyek] ([Álláshely státusza]);

CREATE INDEX [Álláshely típusa] ON [tÁlláshelyek] ([Álláshely típusa]);

CREATE INDEX [Álláshelyen fennálló jogviszony] ON [tÁlláshelyek] ([Álláshelyen fennálló jogviszony]);

CREATE INDEX [Hatályosság kezdete] ON [tÁlláshelyek] ([Hatályosság kezdete]);

CREATE INDEX [Utolsó módosítás dátuma] ON [tÁlláshelyek] ([Utolsó módosítás dátuma]);

ALTER TABLE [tÁlláshelyek] ADD CONSTRAINT [PK_tÁlláshelyek] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tÁlláshelyekBelsõElosztásaFõosztályOsztály] (
[azElosztás] LONG NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NOT NULL,
[Hatály] DATETIME NULL
);

CREATE INDEX [Álláshely azonosító] ON [tÁlláshelyekBelsõElosztásaFõosztályOsztály] ([Álláshely azonosító]);

CREATE INDEX [azElosztás] ON [tÁlláshelyekBelsõElosztásaFõosztályOsztály] ([azElosztás]);

ALTER TABLE [tÁlláshelyekBelsõElosztásaFõosztályOsztály] ADD CONSTRAINT [PK_tÁlláshelyekBelsõElosztásaFõosztályOsztály] PRIMARY KEY ([azElosztás]);

CREATE TABLE [tÁlláshelyEngedélyek] (
[Azonosító] LONG NULL,
[ÁlláshelyTípusa] TEXT(255) NULL,
[azÁlláshely] TEXT(255) NULL,
[régibesorolás] TEXT(255) NULL,
[besorolás] TEXT(255) NULL,
[ideiglenes] YESNO NULL,
[határozatlan] TEXT(255) NULL,
[hatály] DATETIME NULL
);

ALTER TABLE [tÁlláshelyEngedélyek] ADD CONSTRAINT [PK_tÁlláshelyEngedélyek] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tÁllományUnió20230102] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év \ üres állás] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Járási Hivatal] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Ellátott feladat] TEXT(255) NULL,
[Kinevezés] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;] TEXT(255) NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Heti munkaórák száma] DOUBLE NULL,
[Betöltés aránya] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Havi illetmény] CURRENCY NULL,
[Eu finanszírozott] TEXT(255) NULL,
[Illetmény forrása] TEXT(255) NULL,
[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs] TEXT(255) NULL,
[Képesítést adó végzettség] TEXT(255) NULL,
[KAB] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL
);

CREATE TABLE [tÁllományUnió20231231] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év \ üres állás] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Járási Hivatal] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Ellátott feladat] TEXT(255) NULL,
[Kinevezés] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;] TEXT(255) NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Heti munkaórák száma] DOUBLE NULL,
[Betöltés aránya] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Havi illetmény] CURRENCY NULL,
[Eu finanszírozott] TEXT(255) NULL,
[Illetmény forrása] TEXT(255) NULL,
[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs] TEXT(255) NULL,
[Képesítést adó végzettség] TEXT(255) NULL,
[KAB] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL
);

CREATE TABLE [tÁprilisiOrvosiAlkalmassági] (
[Azonosító] LONG NULL,
[TAJ] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Szüldátum] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[FEOR megnevezés] TEXT(255) NULL,
[Üzemorvos] TEXT(255) NULL,
[Alk tipus] TEXT(255) NULL,
[Alk dátuma] TEXT(255) NULL,
[Érvényes] TEXT(255) NULL,
[Eredmény] TEXT(255) NULL,
[Korlátozás] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Mezõ13] TEXT(255) NULL
);

ALTER TABLE [tÁprilisiOrvosiAlkalmassági] ADD CONSTRAINT [PK_tÁprilisiOrvosiAlkalmassági] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tBejövõÜzenetek] (
[azÜzenet] LONG NULL,
[CommonMessageId] TEXT(255) NOT NULL,
[SenderEmailAddress] TEXT(255) NULL,
[DeliveredDate] DATETIME NULL
);

CREATE INDEX [CommonMessageId] ON [tBejövõÜzenetek] ([CommonMessageId]);

ALTER TABLE [tBejövõÜzenetek] ADD CONSTRAINT [PK_tBejövõÜzenetek] PRIMARY KEY ([azÜzenet]);

CREATE TABLE [tBejövõVisszajelzések] (
[azVisszajelzés] LONG NULL,
[azÜzenet] LONG NULL,
[Hash] TEXT(255) NULL,
[VisszajelzésKód] LONG NULL,
[Feldolgozva] YESNO NULL,
[Hatály] DATETIME NULL
);

CREATE INDEX [azÜzenet] ON [tBejövõVisszajelzések] ([azÜzenet]);

CREATE INDEX [Hash] ON [tBejövõVisszajelzések] ([Hash]);

CREATE INDEX [Hatály] ON [tBejövõVisszajelzések] ([Hatály]);

CREATE INDEX [tBejövõÜzenetektBejövõVisszajelzések] ON [tBejövõVisszajelzések] ([azÜzenet]);

ALTER TABLE [tBejövõVisszajelzések] ADD CONSTRAINT [PK_tBejövõVisszajelzések] PRIMARY KEY ([azVisszajelzés]);

CREATE TABLE [tBelépõk] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Illetmény (Ft/hó)] CURRENCY NULL,
[hatályaID] LONG NULL,
[azBelépõkSor] LONG NULL
);

CREATE INDEX [azKilépõkSor] ON [tBelépõk] ([azBelépõkSor]);

CREATE INDEX [tHaviJelentésHatályatBelépõk] ON [tBelépõk] ([hatályaID]);

ALTER TABLE [tBelépõk] ADD CONSTRAINT [PK_tBelépõk] PRIMARY KEY ([azBelépõkSor]);

CREATE TABLE [tBelépõkJövõ] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Illetmény (Ft/hó)] CURRENCY NULL
);

CREATE INDEX [Alaplétszám] ON [tBelépõkJövõ] ([Alaplétszám]);

CREATE INDEX [Sorszám] ON [tBelépõkJövõ] ([Sorszám]);

CREATE TABLE [tBelépõkUnió] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Illetmény (Ft/hó)] CURRENCY NULL
);

CREATE TABLE [tBelsõEngedélyezettLétszámok] (
[azBelsõEngedély] LONG NULL,
[FõosztályKód] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[EngedélyVáltozás] LONG NULL,
[Hatály] DATETIME NULL
);

ALTER TABLE [tBelsõEngedélyezettLétszámok] ADD CONSTRAINT [PK_tBelsõEngedélyezettLétszámok] PRIMARY KEY ([azBelsõEngedély]);

CREATE TABLE [tBesorolás_átalakító] (
[Azonosító] LONG NULL,
[Az álláshely jelölése] TEXT(255) NULL,
[Az álláshely megynevezése] TEXT(255) NULL,
[alsó határ] DOUBLE NULL,
[felsõ határ] DOUBLE NULL,
[Mt] YESNO NULL,
[Kit] YESNO NULL,
[Üres] YESNO NULL,
[Vezetõ] YESNO NULL,
[Besorolás] TEXT(255) NULL,
[Jogviszony típusa] TEXT(255) NULL,
[Besorolási_fokozat] TEXT(255) NULL,
[Sorrend] LONG NULL,
[Költségvetési] TEXT(255) NULL
);

ALTER TABLE [tBesorolás_átalakító] ADD CONSTRAINT [PK_tBesorolás_átalakító] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tBesorolásÁtalakítóEltérõBesoroláshoz] (
[Azonosító] LONG NULL,
[Besorolási  fokozat (KT)] TEXT(255) NULL,
[Álláshely besorolási kategóriája] TEXT(255) NULL,
[rang] LONG NULL,
[jel] TEXT(255) NULL
);

ALTER TABLE [tBesorolásÁtalakítóEltérõBesoroláshoz] ADD CONSTRAINT [PK_tBesorolásÁtalakítóEltérõBesoroláshoz] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tBesorolásHiányok] (
[Azonosító] LONG NULL,
[ÁlláshelyKód] TEXT(255) NULL
);

ALTER TABLE [tBesorolásHiányok] ADD CONSTRAINT [PK_tBesorolásHiányok] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tBesorolásiEredményadatok] (
[Azonosító] LONG NULL,
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Elõnév] TEXT(255) NULL,
[Családi név] TEXT(255) NULL,
[Utónév] TEXT(255) NULL,
[Jogviszony ID] DOUBLE NULL,
[Kód] TEXT(255) NULL,
[Megnevezés] TEXT(255) NULL,
[Kezdete] DATETIME NULL,
[Vége] TEXT(255) NULL,
[Változás dátuma] DATETIME NULL,
[Kezdete1] DATETIME NULL,
[Vége2] TEXT(255) NULL,
[Megnevezés3] TEXT(255) NULL,
[Kezdete4] DATETIME NULL,
[Vége5] TEXT(255) NULL,
[Napi óra] DOUBLE NULL,
[Heti óra] DOUBLE NULL,
[Havi óra] DOUBLE NULL,
[Kezdete6] DATETIME NULL,
[Vége7] DATETIME NULL,
[Típus] TEXT(255) NULL,
[Jelleg] TEXT(255) NULL,
[Kezdete8] DATETIME NULL,
[Vége9] DATETIME NULL,
[Besorolási fokozat] TEXT(255) NULL,
[Nem fogadta el a besorolást] TEXT(255) NULL,
[Kezdete10] DATETIME NULL,
[Vége11] DATETIME NULL,
[Kulcsszám] TEXT(255) NULL,
[Besorolási osztály] TEXT(255) NULL,
[Besorolási fokozat12] TEXT(255) NULL,
[Következõ besorolási fokozat dátum] DATETIME NULL,
[Fiktív kulcsszám] TEXT(255) NULL,
[Fiktív besorolási osztály] TEXT(255) NULL,
[Fiktív besorolási fokozat] TEXT(255) NULL,
[Fiktív következõ besorolási fokozat dátum] TEXT(255) NULL,
[Utolsó besorolás dátuma] DATETIME NULL,
[Kezdete13] DATETIME NULL,
[Vége14] TEXT(255) NULL,
[Eszmei fizetési fokozat idõ] DATETIME NULL,
[Kezdete15] TEXT(255) NULL,
[Vége16] TEXT(255) NULL,
[Eszmei közszolgálati jogviszony idõ] TEXT(255) NULL,
[Kezdete17] TEXT(255) NULL,
[Vége18] TEXT(255) NULL,
[Közszolgálati jogviszony idõ] TEXT(255) NULL,
[Kezdete19] DATETIME NULL,
[Vége20] TEXT(255) NULL,
[Számított fizetési fokozat idõ] DATETIME NULL,
[Kezdete21] DATETIME NULL,
[Vége22] TEXT(255) NULL,
[Szolgálati elismerés / Jubileum jutalom idõ] DATETIME NULL,
[Kezdete23] DATETIME NULL,
[Vége24] TEXT(255) NULL,
[Végkielégítésre jogosító idõ] DATETIME NULL,
[Kezdete25] DATETIME NULL,
[Vége26] TEXT(255) NULL,
[Szolgálati jogviszonyban eltöltött idõ] DATETIME NULL,
[Kezdete27] TEXT(255) NULL,
[Vége28] TEXT(255) NULL,
[Álláshelyi idõ] TEXT(255) NULL,
[Kezdete29] DATETIME NULL,
[Vége30] TEXT(255) NULL,
[Saját munkahelyen eltöltött idõ] DATETIME NULL,
[Kezdete31] TEXT(255) NULL,
[Vége32] TEXT(255) NULL,
[Szakmai gyakorlat kezdõ dátuma] TEXT(255) NULL,
[Kezdete33] DATETIME NULL,
[Vége34] DATETIME NULL,
[Alapilletmény] DOUBLE NULL,
[Garantált bérminimum] TEXT(255) NULL,
[Kerekítés] TEXT(255) NULL,
[Összesen] DOUBLE NULL
);

ALTER TABLE [tBesorolásiEredményadatok] ADD CONSTRAINT [PK_tBesorolásiEredményadatok] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tBesorolásiEredményadatok_import] (
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Elõnév] TEXT(255) NULL,
[Családi név] TEXT(255) NULL,
[Utónév] TEXT(255) NULL,
[Jogviszony ID] DOUBLE NULL,
[Kód] TEXT(255) NULL,
[Megnevezés] TEXT(255) NULL,
[Kezdete] DATETIME NULL,
[Vége] TEXT(255) NULL,
[Változás dátuma] DATETIME NULL,
[Kezdete1] DATETIME NULL,
[Vége2] TEXT(255) NULL,
[Megnevezés3] TEXT(255) NULL,
[Kezdete4] DATETIME NULL,
[Vége5] TEXT(255) NULL,
[Napi óra] DOUBLE NULL,
[Heti óra] DOUBLE NULL,
[Havi óra] DOUBLE NULL,
[Kezdete6] DATETIME NULL,
[Vége7] DATETIME NULL,
[Típus] TEXT(255) NULL,
[Jelleg] TEXT(255) NULL,
[Kezdete8] DATETIME NULL,
[Vége9] DATETIME NULL,
[Besorolási fokozat] TEXT(255) NULL,
[Nem fogadta el a besorolást] TEXT(255) NULL,
[Kezdete10] DATETIME NULL,
[Vége11] DATETIME NULL,
[Kulcsszám] TEXT(255) NULL,
[Besorolási osztály] TEXT(255) NULL,
[Besorolási fokozat12] TEXT(255) NULL,
[Következõ besorolási fokozat dátum] DATETIME NULL,
[Fiktív kulcsszám] TEXT(255) NULL,
[Fiktív besorolási osztály] TEXT(255) NULL,
[Fiktív besorolási fokozat] TEXT(255) NULL,
[Fiktív következõ besorolási fokozat dátum] TEXT(255) NULL,
[Utolsó besorolás dátuma] DATETIME NULL,
[Kezdete13] DATETIME NULL,
[Vége14] TEXT(255) NULL,
[Eszmei fizetési fokozat idõ] DATETIME NULL,
[Kezdete15] TEXT(255) NULL,
[Vége16] TEXT(255) NULL,
[Eszmei közszolgálati jogviszony idõ] TEXT(255) NULL,
[Kezdete17] TEXT(255) NULL,
[Vége18] TEXT(255) NULL,
[Közszolgálati jogviszony idõ] TEXT(255) NULL,
[Kezdete19] DATETIME NULL,
[Vége20] TEXT(255) NULL,
[Számított fizetési fokozat idõ] DATETIME NULL,
[Kezdete21] DATETIME NULL,
[Vége22] TEXT(255) NULL,
[Szolgálati elismerés / Jubileum jutalom idõ] DATETIME NULL,
[Kezdete23] DATETIME NULL,
[Vége24] TEXT(255) NULL,
[Végkielégítésre jogosító idõ] DATETIME NULL,
[Kezdete25] DATETIME NULL,
[Vége26] TEXT(255) NULL,
[Szolgálati jogviszonyban eltöltött idõ] DATETIME NULL,
[Kezdete27] TEXT(255) NULL,
[Vége28] TEXT(255) NULL,
[Álláshelyi idõ] TEXT(255) NULL,
[Kezdete29] DATETIME NULL,
[Vége30] TEXT(255) NULL,
[Saját munkahelyen eltöltött idõ] DATETIME NULL,
[Kezdete31] TEXT(255) NULL,
[Vége32] TEXT(255) NULL,
[Szakmai gyakorlat kezdõ dátuma] TEXT(255) NULL,
[Kezdete33] TEXT(255) NULL,
[Vége34] TEXT(255) NULL,
[Eszmei igazgatási idõ kezdõ dátuma] TEXT(255) NULL,
[Kezdete35] TEXT(255) NULL,
[Vége36] TEXT(255) NULL,
[Igazgatási idõ kezdõ dátuma] TEXT(255) NULL,
[Kezdete37] DATETIME NULL,
[Vége38] DATETIME NULL,
[Alapilletmény] DOUBLE NULL,
[Garantált bérminimum] TEXT(255) NULL,
[Kerekítés] TEXT(255) NULL,
[Összesen] DOUBLE NULL
);

CREATE TABLE [tBesorolásiKódok] (
[azBesKód] LONG NULL,
[Kód] TEXT(255) NULL,
[Besorolás] TEXT(255) NULL
);

ALTER TABLE [tBesorolásiKódok] ADD CONSTRAINT [PK_tBesorolásiKódok] PRIMARY KEY ([azBesKód]);

CREATE TABLE [tBesorolásKonverzió] (
[Azonosító] LONG NULL,
[ÁNYRbõl] TEXT(255) NULL,
[Haviból] TEXT(255) NULL,
[Személytörzsbõl] TEXT(255) NULL,
[rang] LONG NULL
);

ALTER TABLE [tBesorolásKonverzió] ADD CONSTRAINT [PK_tBesorolásKonverzió] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tBesorolásVáltoztatások] (
[Azonosító] LONG NULL,
[Darabszám] TEXT(255) NULL,
[ÉrintettSzerv] TEXT(255) NULL,
[ÁlláshelyAzonosító] TEXT(255) NULL,
[RégiBesorolás] TEXT(255) NULL,
[ÚjBesorolás] TEXT(255) NULL,
[Hatály] DATETIME NULL
);

ALTER TABLE [tBesorolásVáltoztatások] ADD CONSTRAINT [PK_tBesorolásVáltoztatások] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tDÁPrésztvevõk] (
[Forrás#Név] TEXT(255) NULL,
[Hivatal] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[DÁP regisztrációra kijelölve] TEXT(255) NULL
);

CREATE TABLE [tDolgozókVégzettségeiFelsorolás01] (
[VégzettségeinekASzáma] LONG NULL,
[Adójel] DOUBLE NULL,
[Végzettség neve] TEXT(255) NULL,
[Azonosítók] LONG NULL
);

CREATE TABLE [tDolgozókVégzettségeiFelsorolás02] (
[Sorszám] LONG NULL,
[VégzettségeinekASzáma] LONG NULL,
[Adójel] DOUBLE NULL,
[Végzettség neve] TEXT(255) NULL
);

CREATE TABLE [tEgészségügyiSzolgáltatóAdatai01] (
[Azonosító] LONG NULL,
[Páciens név] TEXT(255) NULL,
[TAJ] TEXT(255) NULL,
[Munkakör] TEXT(255) NULL,
[Vizsgálat típusa] TEXT(255) NULL,
[Lejárat dátuma] DATETIME NULL,
[Korlátozás] TEXT(255) NULL,
[Vizsgálat eredménye] TEXT(255) NULL,
[Vizsgálat dátuma] DATETIME NULL
);

CREATE INDEX [TAJ] ON [tEgészségügyiSzolgáltatóAdatai01] ([TAJ]);

ALTER TABLE [tEgészségügyiSzolgáltatóAdatai01] ADD CONSTRAINT [PK_tEgészségügyiSzolgáltatóAdatai01] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tEgészségügyiSzolgáltatóAdatai02] (
[Azonosító] LONG NULL,
[Páciens név] TEXT(255) NULL,
[TAJ] TEXT(255) NULL,
[Munkakör] TEXT(255) NULL,
[Vizsgálat típusa] TEXT(255) NULL,
[Lejárat dátuma] DATETIME NULL,
[Korlátozás] TEXT(255) NULL,
[Vizsgálat eredménye] TEXT(255) NULL,
[Vizsgálat Dátuma] DATETIME NULL
);

CREATE INDEX [TAJ] ON [tEgészségügyiSzolgáltatóAdatai02] ([TAJ]);

ALTER TABLE [tEgészségügyiSzolgáltatóAdatai02] ADD CONSTRAINT [PK_tEgészségügyiSzolgáltatóAdatai02] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tEllenõrzõLekérdezések] (
[azEllenõrzõ] LONG NULL,
[EllenõrzõLekérdezés] TEXT(255) NULL,
[azETípus] LONG NULL,
[Kimenet] YESNO NULL,
[KellVisszajelzes] YESNO NULL,
[vbaPreProcessing] MEMO NULL,
[azUnion] LONG NULL,
[ElõzményUnió] LONG NULL,
[Táblacím] TEXT(255) NULL,
[TáblaMegjegyzés] MEMO NULL,
[Sorrend] LONG NULL,
[azHibaCsoport] LONG NULL
);

CREATE INDEX [tEllenõrzésTípusoktEllenõrzõLekérdezések] ON [tEllenõrzõLekérdezések] ([azETípus]);

CREATE INDEX [tUnionCsoportoktEllenõrzõLekérdezések] ON [tEllenõrzõLekérdezések] ([azUnion]);

ALTER TABLE [tEllenõrzõLekérdezések] ADD CONSTRAINT [PK_tEllenõrzõLekérdezések] PRIMARY KEY ([azEllenõrzõ]);

CREATE TABLE [tEngedélyezettLétszámok] (
[Azonosító] LONG NULL,
[Fõosztály/Vezetõ] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Létszám] DOUBLE NULL,
[Hatály] DATETIME NULL
);

ALTER TABLE [tEngedélyezettLétszámok] ADD CONSTRAINT [PK_tEngedélyezettLétszámok] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tEngedéllyelValóÖsszevetésTábla] (
[SorszámEng] LONG NULL,
[Magyarázat] TEXT(255) NULL,
[Zóna] TEXT(255) NULL,
[Besorolás_bemenet] TEXT(255) NULL,
[Engedélyezett] DOUBLE NULL,
[Betöltött] DOUBLE NULL,
[Üres] DOUBLE NULL,
[Összes álláshely] DOUBLE NULL
);

CREATE TABLE [tEsetiProjektbeFelveendõk] (
[Azonosító] LONG NULL,
[Személy azonosítója*] LONG NULL,
[HR kapcsolat sorszáma *] DOUBLE NULL,
[Érvényesség kezdete *] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Költséghely*] TEXT(255) NULL
);

ALTER TABLE [tEsetiProjektbeFelveendõk] ADD CONSTRAINT [PK_tEsetiProjektbeFelveendõk] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tEsküLejártIdõpontok] (
[Szervezeti egység kód] TEXT(255) NULL,
[Szervezeti egység] TEXT(255) NULL,
[Szervezeti szint száma-neve] TEXT(255) NULL,
[Jogviszony típus] TEXT(255) NULL,
[Jogviszony kezdete] DATETIME NULL,
[Jogviszony vége] DATETIME NULL,
[Dolgozó neve] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[Figyelendõ dátum típusa] TEXT(255) NULL,
[Figyelendõ dátum] DATETIME NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 6 szervezeti egység kód] TEXT(255) NULL,
[Szint 6 szervezeti egység név] TEXT(255) NULL,
[Szint 7 szervezeti egység kód] TEXT(255) NULL,
[Szint 7 szervezeti egység név] TEXT(255) NULL,
[Szint 8 szervezeti egység kód] TEXT(255) NULL,
[Szint 8 szervezeti egység név] TEXT(255) NULL,
[Szint 9 szervezeti egység kód] TEXT(255) NULL,
[Szint 9 szervezeti egység név] TEXT(255) NULL,
[Szint 10 szervezeti egység kód] TEXT(255) NULL,
[Szint 10 szervezeti egység név] TEXT(255) NULL
);

CREATE INDEX [Adóazonosító jel] ON [tEsküLejártIdõpontok] ([Adóazonosító jel]);

CREATE INDEX [Szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szervezeti egység kód]);

CREATE INDEX [Szint 1 szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szint 1 szervezeti egység kód]);

CREATE INDEX [Szint 10 szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szint 10 szervezeti egység kód]);

CREATE INDEX [Szint 2 szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szint 2 szervezeti egység kód]);

CREATE INDEX [Szint 3 szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szint 3 szervezeti egység kód]);

CREATE INDEX [Szint 4 szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szint 4 szervezeti egység kód]);

CREATE INDEX [Szint 5 szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szint 5 szervezeti egység kód]);

CREATE INDEX [Szint 6 szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szint 6 szervezeti egység kód]);

CREATE INDEX [Szint 7 szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szint 7 szervezeti egység kód]);

CREATE INDEX [Szint 8 szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szint 8 szervezeti egység kód]);

CREATE INDEX [Szint 9 szervezeti egység kód] ON [tEsküLejártIdõpontok] ([Szint 9 szervezeti egység kód]);

CREATE TABLE [tEszaPárosítás] (
[Azonosító] LONG NULL,
[Esza] TEXT(255) NULL,
[Nexon] TEXT(255) NULL
);

ALTER TABLE [tEszaPárosítás] ADD CONSTRAINT [PK_tEszaPárosítás] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tExcelStílusok] (
[azStílus] LONG NULL,
[StílusNév] TEXT(255) NULL,
[StílusSzín] LONG NULL
);

ALTER TABLE [tExcelStílusok] ADD CONSTRAINT [PK_tExcelStílusok] PRIMARY KEY ([azStílus]);

CREATE TABLE [tFARrésztvevõ] (
[Azonosító] LONG NULL,
[Adóazonosító] TEXT(255) NULL,
[Legmagasabb iskolai végzettsége] TEXT(255) NULL,
[Viselt neve] TEXT(255) NULL,
[Születési neve] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Születési ország] TEXT(255) NULL,
[Születési helye] TEXT(255) NULL,
[Születési ideje] TEXT(255) NULL,
[E-mail címe] TEXT(255) NULL,
[Magyarországi lakcímmel nem rendelkezõ nem magyar állampolgár] YESNO NULL,
[DHK Képzési hitel?] TEXT(255) NULL,
[Résztvevõ által fizetendõ díj] TEXT(255) NULL,
[Tábla] TEXT(255) NULL
);

ALTER TABLE [tFARrésztvevõ] ADD CONSTRAINT [PK_tFARrésztvevõ] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tFedlaprólLétszámtábla] (
[Az álláshely megynevezése] TEXT(255) NULL,
[Álláshely száma] DOUBLE NULL,
[Azonosító] LONG NULL,
[hatályaID] LONG NULL
);

CREATE INDEX [tHaviJelentésHatályatFedlaprólLétszámtábla] ON [tFedlaprólLétszámtábla] ([hatályaID]);

ALTER TABLE [tFedlaprólLétszámtábla] ADD CONSTRAINT [PK_tFedlaprólLétszámtábla] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tFedlaprólLétszámtábla2] (
[Az álláshely megynevezése] TEXT(255) NULL,
[Álláshely száma] DOUBLE NULL,
[Azonosító] LONG NULL,
[hatályaID] LONG NULL
);

CREATE INDEX [tHaviJelentésHatályatFedlaprólLétszámtábla2] ON [tFedlaprólLétszámtábla2] ([hatályaID]);

ALTER TABLE [tFedlaprólLétszámtábla2] ADD CONSTRAINT [PK_tFedlaprólLétszámtábla2] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tForrásNexonSzervezetekÖsszerendelés] (
[Azonosító] LONG NULL,
[ForrásKód] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL
);

ALTER TABLE [tForrásNexonSzervezetekÖsszerendelés] ADD CONSTRAINT [PK_tForrásNexonSzervezetekÖsszerendelés] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tFõispániKabinetÁlláshelyei20240831ig] (
[Azonosító] LONG NULL,
[ÁlláshelyAz] TEXT(255) NULL
);

ALTER TABLE [tFõispániKabinetÁlláshelyei20240831ig] ADD CONSTRAINT [PK_tFõispániKabinetÁlláshelyei20240831ig] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tFõosztályokOsztályokSorszámmal] (
[Szervezeti egység kódja] TEXT(255) NULL,
[BFKH] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Sorszám] DOUBLE NULL
);

CREATE TABLE [tFunkciók] (
[azFunkció] LONG NULL,
[Megnevezés (magyar)] TEXT(255) NULL
);

ALTER TABLE [tFunkciók] ADD CONSTRAINT [PK_tFunkciók] PRIMARY KEY ([azFunkció]);

CREATE TABLE [tFunkcionálisSzakmaiFõosztályok] (
[azFõosztály] LONG NULL,
[SzervezetKód] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Funkcionális] YESNO NULL
);

CREATE INDEX [SzervezetKód] ON [tFunkcionálisSzakmaiFõosztályok] ([SzervezetKód]);

ALTER TABLE [tFunkcionálisSzakmaiFõosztályok] ADD CONSTRAINT [PK_tFunkcionálisSzakmaiFõosztályok] PRIMARY KEY ([azFõosztály]);

CREATE TABLE [tFuttatásokHibák] (
[azFuttatás] LONG NOT NULL,
[Hash] TEXT(255) NOT NULL
);

CREATE INDEX [tHibáktFuttatásokHibák] ON [tFuttatásokHibák] ([Hash]);

CREATE INDEX [tLekérdezésFuttatásoktFuttatásokHibák] ON [tFuttatásokHibák] ([azFuttatás]);

ALTER TABLE [tFuttatásokHibák] ADD CONSTRAINT [PK_tFuttatásokHibák] PRIMARY KEY ([azFuttatás],[Hash]);

CREATE TABLE [tGrafikonok] (
[Azonosító] LONG NULL,
[azEllenõrzõ] LONG NULL,
[grafTulajdonság] TEXT(255) NULL,
[grafTulÉrték] TEXT(255) NULL,
[szülTul] LONG NULL
);

CREATE INDEX [tEllenõrzõLekérdezésektGrafikonok] ON [tGrafikonok] ([azEllenõrzõ]);

ALTER TABLE [tGrafikonok] ADD CONSTRAINT [PK_tGrafikonok] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tHatározottak] (
[Sorszám] DOUBLE NULL,
[Tartós távollévõ neve] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Szervezti alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét várható vége] DATETIME NULL,
[Tartósan távollévõ illetményének teljes összege] CURRENCY NULL,
[Tartós távollévõ álláshelyén határozott idõre foglalkoztatott ne] TEXT(255) NULL,
[Mezõ17] TEXT(255) NULL,
[Központosított álláshely] TEXT(255) NULL,
[Mezõ18] TEXT(255) NULL,
[Mezõ19] TEXT(255) NULL,
[Mezõ20] TEXT(255) NULL,
[Mezõ21] TEXT(255) NULL,
[Mezõ22] TEXT(255) NULL,
[Mezõ23] DOUBLE NULL,
[Mezõ24] TEXT(255) NULL,
[Mezõ25] TEXT(255) NULL,
[Tartós távollévõ státuszán foglalkoztatott határozott idejû jogv] DATETIME NULL,
[Mezõ27] DATETIME NULL,
[Tartós távollévõ státuszán foglalkoztatott illetményének teljes ] CURRENCY NULL,
[hatályaID] LONG NULL,
[azHatározottakSor] LONG NULL
);

CREATE INDEX [azKilépõkSor] ON [tHatározottak] ([azHatározottakSor]);

ALTER TABLE [tHatározottak] ADD CONSTRAINT [PK_tHatározottak] PRIMARY KEY ([azHatározottakSor]);

CREATE TABLE [tHaviJelentésHatálya1] (
[hatályaID] LONG NULL,
[hatálya] DATETIME NULL,
[rögzítés] DATETIME NULL,
[fájlnév] MEMO NULL
);

ALTER TABLE [tHaviJelentésHatálya1] ADD CONSTRAINT [PK_tHaviJelentésHatálya1] PRIMARY KEY ([hatályaID]);

CREATE TABLE [tHelységek] (
[Azonosító] LONG NULL,
[Megnevezés (magyar)] TEXT(255) NULL,
[Hossz] DOUBLE NULL
);

ALTER TABLE [tHelységek] ADD CONSTRAINT [PK_tHelységek] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tHibacsoportok] (
[azHibaCsoport] LONG NULL,
[Hibacsoport] TEXT(255) NULL
);

CREATE INDEX [tHibacsoportokHibacsoport] ON [tHibacsoportok] ([Hibacsoport]);

ALTER TABLE [tHibacsoportok] ADD CONSTRAINT [PK_tHibacsoportok] PRIMARY KEY ([azHibaCsoport]);

CREATE TABLE [tHibák] (
[Azonosító] LONG NULL,
[Hash] TEXT(255) NULL,
[Hibacsoport] LONG NULL,
[Hibaszöveg] MEMO NULL
);

CREATE INDEX [md5hash] ON [tHibák] ([Hash]);

CREATE INDEX [tHibacsoportoktHibák] ON [tHibák] ([Hibacsoport]);

ALTER TABLE [tHibák] ADD CONSTRAINT [PK_tHibák] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tHibaTípusok] (
[azHiba] LONG NULL,
[Hiba] TEXT(255) NULL,
[Hiba leírása] MEMO NULL
);

ALTER TABLE [tHibaTípusok] ADD CONSTRAINT [PK_tHibaTípusok] PRIMARY KEY ([azHiba]);

CREATE TABLE [tHónapok] (
[Azonosító] LONG NULL,
[Hónap] TEXT(255) NULL
);

ALTER TABLE [tHónapok] ADD CONSTRAINT [PK_tHónapok] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tHozzátartozók] (
[Azonosító] LONG NULL,
[Szervezeti egység neve] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Dolgozó neve] TEXT(255) NULL,
[Dolgozó adóazonosító jele] TEXT(255) NULL,
[Dolgozó TAJ száma] TEXT(255) NULL,
[Dolgozó törzsszáma] TEXT(255) NULL,
[Dolgozó egyedi azonosítója] TEXT(255) NULL,
[Kormányhivatal rövid neve] TEXT(255) NULL,
[HR kapcsolat típusa] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[HR kapcsolat érvényesség kezdete] DATETIME NULL,
[HR kapcsolat érvényesség vége] DATETIME NULL,
[Dolgozó szerzõdéses munkaköre] TEXT(255) NULL,
[Mezõ14] TEXT(255) NULL,
[Hozzátartozó neve] TEXT(255) NULL,
[Hozzátartozó adóazonosító jele] TEXT(255) NULL,
[Hozzátartozó TAJ száma] TEXT(255) NULL,
[Hozzátartozó HR kapcsolat típusa] TEXT(255) NULL,
[Mezõ19] DATETIME NULL,
[Mezõ20] TEXT(255) NULL,
[Kapcsolat jellege] TEXT(255) NULL,
[Születési családi név] TEXT(255) NULL,
[Születési utónév] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Születési hely] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Anyja családi neve] TEXT(255) NULL,
[Anyja utóneve] TEXT(255) NULL,
[Családi állapota] TEXT(255) NULL,
[Állampolgársága (elsõdleges)] TEXT(255) NULL,
[Állandó lakcím] TEXT(255) NULL,
[Tartózkodási lakcím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Otthoni e-mail cím] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[További otthoni mobil] TEXT(255) NULL,
[Fogyatékosság - érvényesség kezdete] TEXT(255) NULL,
[Fogyatékosság - érvényesség vége] TEXT(255) NULL,
[Fogyatékosság bejelentés napja] TEXT(255) NULL,
[Szabadságszámítás] TEXT(255) NULL,
[Hatály] TEXT(255) NULL
);

CREATE INDEX [HR kapcsolat érvényesség kezdete] ON [tHozzátartozók] ([HR kapcsolat érvényesség kezdete]);

CREATE INDEX [HR kapcsolat érvényesség vége] ON [tHozzátartozók] ([HR kapcsolat érvényesség vége]);

CREATE INDEX [Születési idõ] ON [tHozzátartozók] ([Születési idõ]);

ALTER TABLE [tHozzátartozók] ADD CONSTRAINT [PK_tHozzátartozók] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tIFfelKözöltek] (
[azIFfelKözöltek] LONG NULL,
[adójel] DOUBLE NULL,
[belépésDátuma] DATETIME NULL,
[LekérdezésIdõpontja] DATETIME NULL,
[felhasználó] TEXT(255) NULL,
[gép] TEXT(255) NULL
);

CREATE INDEX [belépõ] ON [tIFfelKözöltek] ([adójel],[belépésDátuma]);

ALTER TABLE [tIFfelKözöltek] ADD CONSTRAINT [PK_tIFfelKözöltek] PRIMARY KEY ([azIFfelKözöltek]);

CREATE TABLE [tIlletmények] (
[Azonosító] LONG NULL,
[ISZH azonosító] DOUBLE NULL,
[Ügyintézõ kódja] DOUBLE NULL,
[Törzsszám] DOUBLE NULL,
[Intézmény] TEXT(255) NULL,
[Szervezeti egység kódja] DOUBLE NULL,
[Szervezeti egység megnevezése] TEXT(255) NULL,
[Fõkönyvi számlaszám] DOUBLE NULL,
[Fökönyvi számla megnevezése] TEXT(255) NULL,
[Témaszám] TEXT(255) NULL,
[Témaszám megnevezése] TEXT(255) NULL,
[Kormányzati funkció kódja] DOUBLE NULL,
[Kormányzati funkció neve] TEXT(255) NULL,
[Adóazonosító jel] DOUBLE NULL,
[FOGSOR] DOUBLE NULL,
[TAJ szám] DOUBLE NULL,
[Születési hely] TEXT(255) NULL,
[Születési dátum] DATETIME NULL,
[Anyja neve] TEXT(255) NULL,
[Jv kezdete] DATETIME NULL,
[Jv vége] DATETIME NULL,
[Jogviszony, juttatás típusa] DOUBLE NULL,
[Jogviszony, juttatás megnevezése] TEXT(255) NULL,
[Kulcsszám] DOUBLE NULL,
[Kulcsszám neve] TEXT(255) NULL,
[FEOR] DOUBLE NULL,
[Munkakör megnevezése] TEXT(255) NULL,
[Átsorolás összesen] DOUBLE NULL,
[Illetmény kifizetésének módja] DOUBLE NULL,
[Folyószámlaszám] TEXT(255) NULL,
[Lakcím] TEXT(255) NULL,
[Elérési cím] TEXT(255) NULL,
[Tényleges munkaidõ hossza] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Álláshely] TEXT(255) NULL,
[Nyugdíjas státusz] TEXT(255) NULL
);

CREATE INDEX [Adóazonosító jel] ON [tIlletmények] ([Adóazonosító jel]);

ALTER TABLE [tIlletmények] ADD CONSTRAINT [PK_tIlletmények] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tImportálandóTáblák] (
[azTábla] LONG NULL,
[EredetiNév] TEXT(255) NULL,
[AccessNév] TEXT(255) NULL,
[KezdõCella] TEXT(255) NULL,
[Végcella] TEXT(255) NULL,
[HosszmérõCella] TEXT(255) NULL,
[UtolsóOszlop] TEXT(255) NULL,
[AdatsorokSzáma] LONG NULL,
[Hiány_lekérdezés] TEXT(255) NULL,
[Alapútvonal] TEXT(255) NULL,
[Fájlnévminta] TEXT(255) NULL,
[Csoport] LONG NULL
);

ALTER TABLE [tImportálandóTáblák] ADD CONSTRAINT [PK_tImportálandóTáblák] PRIMARY KEY ([azTábla]);

CREATE TABLE [tImportálandóTáblák1] (
[azTábla] LONG NULL,
[EredetiNév] TEXT(255) NULL,
[AccessNév] TEXT(255) NULL,
[KezdõCella] TEXT(255) NULL,
[Végcella] TEXT(255) NULL,
[HosszmérõCella] TEXT(255) NULL,
[UtolsóOszlop] TEXT(255) NULL,
[AdatsorokSzáma] LONG NULL,
[Hiány_lekérdezés] TEXT(255) NULL,
[Alapútvonal] TEXT(255) NULL,
[Fájlnévminta] TEXT(255) NULL,
[Csoport] LONG NULL
);

ALTER TABLE [tImportálandóTáblák1] ADD CONSTRAINT [PK_tImportálandóTáblák1] PRIMARY KEY ([azTábla]);

CREATE TABLE [tIntézkedések] (
[azIntézkedések] LONG NULL,
[azIntFajta] LONG NULL,
[IntézkedésDátuma] DATETIME NULL,
[Hivatkozás] TEXT(255) NULL
);

CREATE INDEX [tIntézkedésFajtáktIntézkedések] ON [tIntézkedések] ([azIntFajta]);

ALTER TABLE [tIntézkedések] ADD CONSTRAINT [PK_tIntézkedések] PRIMARY KEY ([azIntézkedések]);

CREATE TABLE [tIntézkedésFajták] (
[azIntFajta] LONG NULL,
[IntézkedésFajta] TEXT(255) NULL
);

ALTER TABLE [tIntézkedésFajták] ADD CONSTRAINT [PK_tIntézkedésFajták] PRIMARY KEY ([azIntFajta]);

CREATE TABLE [tIrányítószámokKoordináták] (
[azIrsz] LONG NULL,
[Helység] TEXT(255) NULL,
[Kód] LONG NULL,
[Irsz] LONG NULL,
[Szélesség] TEXT(255) NULL,
[Hosszúság] TEXT(255) NULL,
[GCoord] TEXT(255) NULL,
[dblSzélesség] DOUBLE NULL,
[dblHosszúság] DOUBLE NULL
);

ALTER TABLE [tIrányítószámokKoordináták] ADD CONSTRAINT [PK_tIrányítószámokKoordináták] PRIMARY KEY ([azIrsz]);

CREATE TABLE [tJárási_állomány] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Járási Hivatal] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ9] TEXT(255) NULL,
[Mezõ10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;] TEXT(255) NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Heti munkaórák száma] DOUBLE NULL,
[Mezõ14] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ18] CURRENCY NULL,
[Mezõ19] CURRENCY NULL,
[Mezõ20] TEXT(255) NULL,
[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs] TEXT(255) NULL,
[Mezõ26] TEXT(255) NULL,
[Mezõ27] TEXT(255) NULL,
[Mezõ28] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[hatályaID] LONG NULL,
[azJárásiSor] LONG NULL
);

CREATE INDEX [Adóazonosító] ON [tJárási_állomány] ([Adóazonosító]);

CREATE INDEX [tHaviJelentésHatályatJárási_állomány] ON [tJárási_állomány] ([hatályaID]);

ALTER TABLE [tJárási_állomány] ADD CONSTRAINT [PK_tJárási_állomány] PRIMARY KEY ([azJárásiSor]);

CREATE TABLE [tJav_mezõk] (
[azJavítandó] LONG NULL,
[tTáblák_azonosító] LONG NULL,
[azNexonMezõk] LONG NULL,
[Eredeti] TEXT(255) NULL,
[Import] TEXT(255) NULL,
[TáblánBelüliSorszáma] LONG NULL,
[NemKötelezõ] YESNO NULL,
[Kötelezõ] YESNO NULL,
[NemKötelezõÜresÁlláshelyEsetén] YESNO NULL,
[KötelezõÜresÁlláshelyEsetén] YESNO NULL,
[ÜresÁlláshelyMezõ] TEXT(255) NULL,
[Szöveg] YESNO NULL
);

CREATE INDEX [NormRel1] ON [tJav_mezõk] ([tTáblák_azonosító]);

CREATE INDEX [tNexonMezõktJav_mezõk] ON [tJav_mezõk] ([azNexonMezõk]);

ALTER TABLE [tJav_mezõk] ADD CONSTRAINT [PK_tJav_mezõk] PRIMARY KEY ([azJavítandó]);

CREATE TABLE [tJav_táblák] (
[kód] LONG NULL,
[Tábla] TEXT(255) NULL,
[Ellenõrzéshez] TEXT(255) NULL,
[SzervezetKód_mezõ] TEXT(255) NULL,
[ÜresÁlláshelyMezõk] TEXT(255) NULL,
[ÜresÁlláshelyMezõÉrtékeHaAzÁlláshelyÜres] TEXT(255) NULL
);

CREATE INDEX [NORM_OrderByIndex] ON [tJav_táblák] ([Tábla],[Ellenõrzéshez],[SzervezetKód_mezõ]);

ALTER TABLE [tJav_táblák] ADD CONSTRAINT [PK_tJav_táblák] PRIMARY KEY ([kód]);

CREATE TABLE [tJavítandóMezõnevek_régi] (
[azJavítandó] LONG NULL,
[Tábla] TEXT(255) NULL,
[Ellenõrzéshez] TEXT(255) NULL,
[azNexonMezõk] LONG NULL,
[Eredeti] TEXT(255) NULL,
[Import] TEXT(255) NULL,
[TáblánBelüliSorszáma] LONG NULL,
[NemKötelezõ] YESNO NULL,
[NemKötelezõÜresÁlláshelyEsetén] YESNO NULL,
[ÜresÁlláshelyMezõ] TEXT(255) NULL,
[Szöveg] YESNO NULL,
[Select_mezõ] LONG NULL
);

ALTER TABLE [tJavítandóMezõnevek_régi] ADD CONSTRAINT [PK_tJavítandóMezõnevek_régi] PRIMARY KEY ([azJavítandó]);

CREATE TABLE [tJogviszonyKonverzió] (
[Azonosító] LONG NULL,
[KIRA] TEXT(255) NULL,
[Személytörzs] TEXT(255) NULL
);

ALTER TABLE [tJogviszonyKonverzió] ADD CONSTRAINT [PK_tJogviszonyKonverzió] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKeresendõk] (
[Azonosító] LONG NULL,
[Sorszám] LONG NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL
);

ALTER TABLE [tKeresendõk] ADD CONSTRAINT [PK_tKeresendõk] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKészítendõOldalak] (
[Azonosító] LONG NULL,
[KészítendõOldalak] UNKNOWN NULL
);

ALTER TABLE [tKészítendõOldalak] ADD CONSTRAINT [PK_tKészítendõOldalak] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKiBelépõkLétszáma] (
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Dátum] DATETIME NULL,
[Fõ] DOUBLE NULL
);

CREATE TABLE [tKilépõk] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Jogviszony megszûnésének, megszüntetésének idõpontja] DATETIME NULL,
[Illetmény (Ft/hó)] CURRENCY NULL,
[Végkielégítésre jogosító hónapok száma] DOUBLE NULL,
[Felmentési idõ hónapok száma] TEXT(255) NULL,
[hatályaID] LONG NULL,
[azKilépõkSor] LONG NULL
);

CREATE INDEX [tHaviJelentésHatályatKilépõk] ON [tKilépõk] ([hatályaID]);

ALTER TABLE [tKilépõk] ADD CONSTRAINT [PK_tKilépõk] PRIMARY KEY ([azKilépõkSor]);

CREATE TABLE [tKilépõkUnió] (
[Adójel] DOUBLE NULL,
[azKilépõk] LONG NULL,
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Születési év] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Alaplétszám] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ8] TEXT(255) NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva] TEXT(255) NULL,
[Jogviszony kezdõ dátuma] DATETIME NULL,
[Jogviszony megszûnésének, megszüntetésének idõpontja] DATETIME NULL,
[Illetmény (Ft/hó)] CURRENCY NULL,
[Végkielégítésre jogosító hónapok száma] DOUBLE NULL,
[Felmentési idõ hónapok száma] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[BFKH] TEXT(255) NULL,
[Kilépés] DATETIME NULL
);

CREATE TABLE [tKimenetek] (
[azKimenet] LONG NULL,
[azKimenetTípus] LONG NULL,
[Fájlnév] TEXT(255) NULL,
[KimenetNév] TEXT(255) NULL,
[azCímlista] LONG NULL
);

CREATE INDEX [tCímlistáktKimenetek] ON [tKimenetek] ([azCímlista]);

CREATE INDEX [tKimenetTípusoktKimenetek] ON [tKimenetek] ([azKimenetTípus]);

ALTER TABLE [tKimenetek] ADD CONSTRAINT [PK_tKimenetek] PRIMARY KEY ([azKimenet]);

CREATE TABLE [tKimenetLapjai] (
[azKimenetLap] LONG NULL,
[azKimenet] LONG NULL,
[strLapFajta] TEXT(255) NULL,
[strStílus] TEXT(255) NULL,
[strLapNév] TEXT(255) NULL,
[ltxTartalomMegjegyzés] MEMO NULL,
[vbaPostProcessing] MEMO NULL
);

CREATE INDEX [LapÉsKimenet] ON [tKimenetLapjai] ([azKimenet],[strLapNév]);

CREATE INDEX [tKimenetektKiemenetLapjai] ON [tKimenetLapjai] ([azKimenet]);

ALTER TABLE [tKimenetLapjai] ADD CONSTRAINT [PK_tKimenetLapjai] PRIMARY KEY ([azKimenetLap]);

CREATE TABLE [tKimenetTípusok] (
[azKimenetTípus] LONG NULL,
[strKimenetTípusNeve] TEXT(255) NULL
);

ALTER TABLE [tKimenetTípusok] ADD CONSTRAINT [PK_tKimenetTípusok] PRIMARY KEY ([azKimenetTípus]);

CREATE TABLE [tKiraHiba] (
[Azonosító] LONG NULL,
[Adóazonosító] DOUBLE NULL,
[Név] TEXT(255) NULL,
[KIRAzonosító] DOUBLE NULL,
[Egység] TEXT(255) NULL,
[Hiba] TEXT(255) NULL,
[ImportDátum] DATETIME NULL
);

CREATE INDEX [Adóazonosító] ON [tKiraHiba] ([Adóazonosító]);

ALTER TABLE [tKiraHiba] ADD CONSTRAINT [PK_tKiraHiba] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKiraHiba221213] (
[Azonosító] LONG NULL,
[Adóazonosító] DOUBLE NULL,
[Név] TEXT(255) NULL,
[KIRAzonosító] DOUBLE NULL,
[Egység] TEXT(255) NULL,
[Hiba] TEXT(255) NULL
);

CREATE INDEX [Adóazonosító] ON [tKiraHiba221213] ([Adóazonosító]);

CREATE INDEX [Hiba] ON [tKiraHiba221213] ([Hiba]);

CREATE INDEX [Név] ON [tKiraHiba221213] ([Név]);

ALTER TABLE [tKiraHiba221213] ADD CONSTRAINT [PK_tKiraHiba221213] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKiraHiba230712] (
[Azonosító] LONG NULL,
[Adóazonosító] DOUBLE NULL,
[Név] TEXT(255) NULL,
[KIRAzonosító] DOUBLE NULL,
[Egység] TEXT(255) NULL,
[Hiba] TEXT(255) NULL
);

CREATE INDEX [Adóazonosító] ON [tKiraHiba230712] ([Adóazonosító]);

CREATE INDEX [Hiba] ON [tKiraHiba230712] ([Hiba]);

ALTER TABLE [tKiraHiba230712] ADD CONSTRAINT [PK_tKiraHiba230712] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKiraHibaüzenetek] (
[Azonosító] LONG NULL,
[Hibaüzenet] TEXT(255) NULL,
[Magyarázat] TEXT(255) NULL
);

ALTER TABLE [tKiraHibaüzenetek] ADD CONSTRAINT [PK_tKiraHibaüzenetek] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKormányhivatal_Kerületi_szervezeti_egység_sorrend] (
[az] LONG NULL,
[Sorszám] LONG NULL,
[Szervezeti_egység] TEXT(255) NULL,
[kerület] YESNO NULL
);

ALTER TABLE [tKormányhivatal_Kerületi_szervezeti_egység_sorrend] ADD CONSTRAINT [PK_tKormányhivatal_Kerületi_szervezeti_egység_sorrend] PRIMARY KEY ([az]);

CREATE TABLE [tKormányhivatali_állomány] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] TEXT(255) NULL,
[Mezõ9] TEXT(255) NULL,
[Mezõ10] DATETIME NULL,
[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;] TEXT(255) NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Heti munkaórák száma] DOUBLE NULL,
[Mezõ14] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ18] CURRENCY NULL,
[Mezõ19] CURRENCY NULL,
[Mezõ20] TEXT(255) NULL,
[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs] TEXT(255) NULL,
[Mezõ26] TEXT(255) NULL,
[Mezõ27] TEXT(255) NULL,
[KAB 001-3** Branch ID] TEXT(255) NULL,
[hatályaID] LONG NULL,
[azKormányhivataliSor] LONG NULL
);

CREATE INDEX [tHaviJelentésHatályatKormányhivatali_állomány] ON [tKormányhivatali_állomány] ([hatályaID]);

ALTER TABLE [tKormányhivatali_állomány] ADD CONSTRAINT [PK_tKormányhivatali_állomány] PRIMARY KEY ([azKormányhivataliSor]);

CREATE TABLE [tKöltségvetéshezBesorolások] (
[Azonosító] LONG NULL,
[Sor] DOUBLE NULL,
[Besorolás] TEXT(255) NULL,
[BesorolásSzemélytörzs] TEXT(255) NULL,
[Végzettség] TEXT(255) NULL,
[Jogviszony] TEXT(255) NULL
);

ALTER TABLE [tKöltségvetéshezBesorolások] ADD CONSTRAINT [PK_tKöltségvetéshezBesorolások] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKöltségvetéshezHivatásosok] (
[Azonosító] LONG NULL,
[Sor] DOUBLE NULL,
[Besorolás] TEXT(255) NULL,
[Adóazonosító jel] DOUBLE NULL,
[Összesen] DOUBLE NULL
);

ALTER TABLE [tKöltségvetéshezHivatásosok] ADD CONSTRAINT [PK_tKöltségvetéshezHivatásosok] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKözigazgatásiVizsga] (
[Azonosító] LONG NULL,
[Szervezeti egység] TEXT(255) NULL,
[Dolgozó azonosító] TEXT(255) NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Szerzõdéses munkakör] TEXT(255) NULL,
[KIRA Feladat] TEXT(255) NULL,
[Vizsga típusa] TEXT(255) NULL,
[Vizsgáztató szerv] TEXT(255) NULL,
[Vizsga eredménye] TEXT(255) NULL,
[Oklevél száma] TEXT(255) NULL,
[Oklevél dátuma] DATETIME NULL,
[Oklevél lejár] TEXT(255) NULL,
[Vizsga letétel terv határideje] DATETIME NULL,
[Vizsga letétel tény határideje] DATETIME NULL,
[Mentesség] YESNO NULL,
[Mentesség oka] TEXT(255) NULL,
[Kötelezés dátuma] DATETIME NULL,
[Vizsgaidõszak év, hó] DATETIME NULL,
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
[Mezõ33] TEXT(255) NULL
);

CREATE INDEX [Dolgozó azonosító] ON [tKözigazgatásiVizsga] ([Dolgozó azonosító]);

ALTER TABLE [tKözigazgatásiVizsga] ADD CONSTRAINT [PK_tKözigazgatásiVizsga] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKözpontosítottak] (
[Sorszám] DOUBLE NULL,
[Név] TEXT(255) NULL,
[Adóazonosító] TEXT(255) NULL,
[Mezõ4] TEXT(255) NULL,
[Megyei szint VAGY Járási Hivatal] TEXT(255) NULL,
[Mezõ6] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[Projekt megnevezése] TEXT(255) NULL,
[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] TEXT(255) NULL,
[Mezõ10] TEXT(255) NULL,
[Mezõ11] DATETIME NULL,
[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] TEXT(255) NULL,
[Mezõ13] DOUBLE NULL,
[Besorolási fokozat kód:] TEXT(255) NULL,
[Besorolási fokozat megnevezése:] TEXT(255) NULL,
[Álláshely azonosító] TEXT(255) NULL,
[Mezõ17] CURRENCY NULL,
[Mezõ18] TEXT(255) NULL,
[Tartós távollévõ nincs helyettese (TT)/ tartós távollévõnek van ] TEXT(255) NULL,
[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] TEXT(255) NULL,
[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] TEXT(255) NULL,
[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] TEXT(255) NULL,
[hatályaID] LONG NULL,
[azKözpontosítottakSor] LONG NULL
);

CREATE INDEX [Adóazonosító] ON [tKözpontosítottak] ([Adóazonosító]);

CREATE INDEX [tHaviJelentésHatályatKözpontosítottak] ON [tKözpontosítottak] ([hatályaID]);

ALTER TABLE [tKözpontosítottak] ADD CONSTRAINT [PK_tKözpontosítottak] PRIMARY KEY ([azKözpontosítottakSor]);

CREATE TABLE [tKözterületJelleg] (
[Azonosító] LONG NULL,
[Megnevezés (magyar)] TEXT(255) NULL,
[Hossz] DOUBLE NULL
);

ALTER TABLE [tKözterületJelleg] ADD CONSTRAINT [PK_tKözterületJelleg] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKSZDR] (
[Azonosító] LONG NULL,
[Adóazonosító jel] TEXT(255) NULL,
[Teljes név] TEXT(255) NULL,
[Szervezeti egység] TEXT(255) NULL,
[Szervezet] TEXT(255) NULL
);

CREATE INDEX [Adóazonosító jel] ON [tKSZDR] ([Adóazonosító jel]);

ALTER TABLE [tKSZDR] ADD CONSTRAINT [PK_tKSZDR] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tKSZDRhibák] (
[Azonosító] LONG NULL,
[Név] TEXT(255) NULL,
[Adószám] DOUBLE NULL,
[KSZDR hiányzó adat] TEXT(255) NULL,
[Megoldások] TEXT(255) NULL
);

ALTER TABLE [tKSZDRhibák] ADD CONSTRAINT [PK_tKSZDRhibák] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tLegmagasabbVégzettség04] (
[Dolgozó azonosító] TEXT(255) NULL,
[azFok] LONG NULL
);

CREATE TABLE [tLejáróHatáridõk] (
[Szervezeti egység kód] TEXT(255) NULL,
[Szervezeti egység] TEXT(255) NULL,
[Szervezeti szint száma-neve] TEXT(255) NULL,
[Jogviszony típus] TEXT(255) NULL,
[Jogviszony kezdete] TEXT(255) NULL,
[Jogviszony vége] TEXT(255) NULL,
[Dolgozó neve] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[Figyelendõ dátum típusa] TEXT(255) NULL,
[Figyelendõ dátum] TEXT(255) NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 6 szervezeti egység kód] TEXT(255) NULL,
[Szint 6 szervezeti egység név] TEXT(255) NULL,
[Szint 7 szervezeti egység kód] TEXT(255) NULL,
[Szint 7 szervezeti egység név] TEXT(255) NULL,
[Szint 8 szervezeti egység kód] TEXT(255) NULL,
[Szint 8 szervezeti egység név] TEXT(255) NULL,
[Szint 9 szervezeti egység kód] TEXT(255) NULL,
[Szint 9 szervezeti egység név] TEXT(255) NULL,
[Szint 10 szervezeti egység kód] TEXT(255) NULL,
[Szint 10 szervezeti egység név] TEXT(255) NULL
);

CREATE INDEX [Adóazonosító jel] ON [tLejáróHatáridõk] ([Adóazonosító jel]);

CREATE INDEX [Szervezeti egység kód] ON [tLejáróHatáridõk] ([Szervezeti egység kód]);

CREATE INDEX [Szint 1 szervezeti egység kód] ON [tLejáróHatáridõk] ([Szint 1 szervezeti egység kód]);

CREATE INDEX [Szint 10 szervezeti egység kód] ON [tLejáróHatáridõk] ([Szint 10 szervezeti egység kód]);

CREATE INDEX [Szint 2 szervezeti egység kód] ON [tLejáróHatáridõk] ([Szint 2 szervezeti egység kód]);

CREATE INDEX [Szint 3 szervezeti egység kód] ON [tLejáróHatáridõk] ([Szint 3 szervezeti egység kód]);

CREATE INDEX [Szint 4 szervezeti egység kód] ON [tLejáróHatáridõk] ([Szint 4 szervezeti egység kód]);

CREATE INDEX [Szint 5 szervezeti egység kód] ON [tLejáróHatáridõk] ([Szint 5 szervezeti egység kód]);

CREATE INDEX [Szint 6 szervezeti egység kód] ON [tLejáróHatáridõk] ([Szint 6 szervezeti egység kód]);

CREATE INDEX [Szint 7 szervezeti egység kód] ON [tLejáróHatáridõk] ([Szint 7 szervezeti egység kód]);

CREATE INDEX [Szint 8 szervezeti egység kód] ON [tLejáróHatáridõk] ([Szint 8 szervezeti egység kód]);

CREATE INDEX [Szint 9 szervezeti egység kód] ON [tLejáróHatáridõk] ([Szint 9 szervezeti egység kód]);

CREATE TABLE [tLejáróHatáridõk_tart] (
[Szervezeti egység kód] TEXT(255) NULL,
[Szervezeti egység] TEXT(255) NULL,
[Szervezeti szint száma-neve] TEXT(255) NULL,
[Jogviszony típus] TEXT(255) NULL,
[Jogviszony kezdete] TEXT(255) NULL,
[Jogviszony vége] TEXT(255) NULL,
[Dolgozó neve] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[Figyelendõ dátum típusa] TEXT(255) NULL,
[Figyelendõ dátum] TEXT(255) NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 6 szervezeti egység kód] TEXT(255) NULL,
[Szint 6 szervezeti egység név] TEXT(255) NULL,
[Szint 7 szervezeti egység kód] TEXT(255) NULL,
[Szint 7 szervezeti egység név] TEXT(255) NULL,
[Szint 8 szervezeti egység kód] TEXT(255) NULL,
[Szint 8 szervezeti egység név] TEXT(255) NULL,
[Szint 9 szervezeti egység kód] TEXT(255) NULL,
[Szint 9 szervezeti egység név] TEXT(255) NULL,
[Szint 10 szervezeti egység kód] TEXT(255) NULL,
[Szint 10 szervezeti egység név] TEXT(255) NULL
);

CREATE INDEX [Adóazonosító jel] ON [tLejáróHatáridõk_tart] ([Adóazonosító jel]);

CREATE INDEX [Szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szervezeti egység kód]);

CREATE INDEX [Szint 1 szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szint 1 szervezeti egység kód]);

CREATE INDEX [Szint 10 szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szint 10 szervezeti egység kód]);

CREATE INDEX [Szint 2 szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szint 2 szervezeti egység kód]);

CREATE INDEX [Szint 3 szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szint 3 szervezeti egység kód]);

CREATE INDEX [Szint 4 szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szint 4 szervezeti egység kód]);

CREATE INDEX [Szint 5 szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szint 5 szervezeti egység kód]);

CREATE INDEX [Szint 6 szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szint 6 szervezeti egység kód]);

CREATE INDEX [Szint 7 szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szint 7 szervezeti egység kód]);

CREATE INDEX [Szint 8 szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szint 8 szervezeti egység kód]);

CREATE INDEX [Szint 9 szervezeti egység kód] ON [tLejáróHatáridõk_tart] ([Szint 9 szervezeti egység kód]);

CREATE TABLE [tLekérdezésFuttatások] (
[azFuttatás] LONG NULL,
[Idõpont] DATETIME NULL,
[LekérdezésNeve] TEXT(255) NULL
);

ALTER TABLE [tLekérdezésFuttatások] ADD CONSTRAINT [PK_tLekérdezésFuttatások] PRIMARY KEY ([azFuttatás]);

CREATE TABLE [tLekérdezésMezõTípusok] (
[mezoAz] LONG NULL,
[LekérdezésNeve] TEXT(255) NULL,
[MezõNeve] TEXT(255) NULL,
[MezõTípusa] LONG NULL,
[Grafikonra] TEXT(255) NULL,
[Hashbe] YESNO NULL
);

CREATE INDEX [tMezõTípusoktLekérdezésMezõTípusok] ON [tLekérdezésMezõTípusok] ([MezõTípusa]);

ALTER TABLE [tLekérdezésMezõTípusok] ADD CONSTRAINT [PK_tLekérdezésMezõTípusok] PRIMARY KEY ([mezoAz]);

CREATE TABLE [tLekérdezésOsztályok] (
[azOsztály] LONG NULL,
[Osztály] TEXT(255) NULL,
[Oldalcím] TEXT(255) NULL,
[Fájlnév] TEXT(255) NULL,
[azVisszajelzésTípusCsoport] LONG NULL,
[TartalomIsmertetõ] TEXT(255) NULL,
[Sorrend] LONG NULL
);

CREATE INDEX [tLekérdezésOsztályokOsztály] ON [tLekérdezésOsztályok] ([Osztály]);

CREATE INDEX [tVisszajelzésTípusCsoportoktLekérdezésOsztályok] ON [tLekérdezésOsztályok] ([azVisszajelzésTípusCsoport]);

ALTER TABLE [tLekérdezésOsztályok] ADD CONSTRAINT [PK_tLekérdezésOsztályok] PRIMARY KEY ([azOsztály]);

CREATE TABLE [tLekérdezésTípusok] (
[azETípus] LONG NULL,
[TípusNeve] TEXT(255) NULL,
[LapNév] TEXT(255) NULL,
[Megjegyzés] MEMO NULL,
[Osztály] LONG NULL,
[vbaPostProcessing] TEXT(255) NULL,
[azVisszajelzésTípusCsoport] LONG NULL,
[Sorrend] LONG NULL
);

CREATE INDEX [tLekérdezésOsztályoktLekérdezésTípusok] ON [tLekérdezésTípusok] ([Osztály]);

ALTER TABLE [tLekérdezésTípusok] ADD CONSTRAINT [PK_tLekérdezésTípusok] PRIMARY KEY ([azETípus]);

CREATE TABLE [tMeghagyandókAránya] (
[Azonosító] LONG NULL,
[BFKH] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Nem kerül meghagyásra] DOUBLE NULL,
[Meghagyandó] DOUBLE NULL
);

ALTER TABLE [tMeghagyandókAránya] ADD CONSTRAINT [PK_tMeghagyandókAránya] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tMeghagyandókAránya_eredeti] (
[Azonosító] LONG NULL,
[BFKH] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Nem kerül meghagyásra] DOUBLE NULL,
[Meghagyandó] DOUBLE NULL
);

ALTER TABLE [tMeghagyandókAránya_eredeti] ADD CONSTRAINT [PK_tMeghagyandókAránya_eredeti] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tMeghagyás03] (
[Azonosító] LONG NULL,
[FõosztályKód] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[SumOfLétszám] DOUBLE NULL,
[Meghagyandó%] DOUBLE NULL,
[Meghagyandók] DOUBLE NULL
);

CREATE TABLE [tMeghagyásB01] (
[FõosztályKód] TEXT(255) NULL,
[Sorrend] LONG NULL,
[Státuszának kódja] TEXT(255) NULL,
[Szám] DOUBLE NULL,
[Dolgozó teljes neve] TEXT(255) NULL
);

CREATE TABLE [tMeghagyásB02] (
[FõosztályKód] TEXT(255) NULL,
[Besorolás] LONG NULL,
[Szám] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Sorszám3] DOUBLE NULL
);

CREATE TABLE [tMeghagyásraKijelöltMunkakörök] (
[azFeladatkör] LONG NULL,
[Feladatkörök] TEXT(255) NULL
);

ALTER TABLE [tMeghagyásraKijelöltMunkakörök] ADD CONSTRAINT [PK_tMeghagyásraKijelöltMunkakörök] PRIMARY KEY ([azFeladatkör]);

CREATE TABLE [tMeghagyásÚjB01] (
[BFKH] TEXT(255) NULL,
[FõosztályKód] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Dolgozó születési neve] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[Vezetõ] LONG NULL,
[Kor] LONG NULL,
[Nem] LONG NULL,
[Rang] LONG NULL,
[Szám] DOUBLE NULL,
[Sorrend] LONG NULL,
[KIRA feladat megnevezés] TEXT(255) NULL
);

CREATE TABLE [tMeghagyásÚjB02] (
[FõosztályKód] TEXT(255) NULL,
[Besorolás] LONG NULL,
[Szám] DOUBLE NULL,
[Sorrend] LONG NULL,
[Sorszám3] DOUBLE NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Dolgozó születési neve] TEXT(255) NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[Vezetõ] LONG NULL,
[Kor] LONG NULL,
[Nem] LONG NULL,
[Rang] LONG NULL,
[KIRA feladat megnevezés] TEXT(255) NULL
);

CREATE TABLE [tMegszûnésMódjaCsoportok] (
[azMegszCsop] LONG NULL,
[Csoport] TEXT(255) NULL,
[MegszûnésMódja] TEXT(255) NULL
);

ALTER TABLE [tMegszûnésMódjaCsoportok] ADD CONSTRAINT [PK_tMegszûnésMódjaCsoportok] PRIMARY KEY ([azMegszCsop]);

CREATE TABLE [tMentességek] (
[Azonosító] LONG NULL,
[Szervezet név] TEXT(255) NULL,
[Szervezet telephely sorszám] TEXT(255) NULL,
[Név elõtag] TEXT(255) NULL,
[Családnév] TEXT(255) NULL,
[Utónév] TEXT(255) NULL,
[Név utótag] TEXT(255) NULL,
[Email cím] TEXT(255) NULL,
[Születési név] TEXT(255) NULL,
[Születési hely] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Anyja neve] TEXT(255) NULL,
[Mentesség] TEXT(255) NULL,
[Jogviszony idõszak kezdete] DATETIME NULL,
[Jogviszony idõszak vége] DATETIME NULL
);

ALTER TABLE [tMentességek] ADD CONSTRAINT [PK_tMentességek] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tMezõTípusok] (
[Value] LONG NULL,
[Constant] TEXT(255) NULL,
[Description] TEXT(255) NULL,
[DbType] TEXT(255) NULL
);

ALTER TABLE [tMezõTípusok] ADD CONSTRAINT [PK_tMezõTípusok] PRIMARY KEY ([Value]);

CREATE TABLE [tmpÁNYRekHavihoz] (
[Azonosító] LONG NULL,
[ÁNYR] TEXT(255) NULL
);

ALTER TABLE [tmpÁNYRekHavihoz] ADD CONSTRAINT [PK_tmpÁNYRekHavihoz] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tmpFõosztályok] (
[azFõosztály] LONG NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL
);

ALTER TABLE [tmpFõosztályok] ADD CONSTRAINT [PK_tmpFõosztályok] PRIMARY KEY ([azFõosztály]);

CREATE TABLE [tmpHiányzóKinevezésDátuma] (
[Azonosító] LONG NULL,
[F1] DOUBLE NULL
);

ALTER TABLE [tmpHiányzóKinevezésDátuma] ADD CONSTRAINT [PK_tmpHiányzóKinevezésDátuma] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tmpKorrupcióEllenesLekérdezéshez] (
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[BFKH] TEXT(255) NULL,
[Kell_e] YESNO NULL
);

CREATE TABLE [tmpLaktámFluktuációLista] (
[Azonosító] LONG NULL,
[Adóazonosító jel] DOUBLE NULL
);

ALTER TABLE [tmpLaktámFluktuációLista] ADD CONSTRAINT [PK_tmpLaktámFluktuációLista] PRIMARY KEY ([Azonosító]);

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

CREATE TABLE [TmptEsküLejártIdõpontok] (
[Szervezeti egység kód] TEXT(255) NULL,
[Szervezeti egység] TEXT(255) NULL,
[Szervezeti szint száma-neve] TEXT(255) NULL,
[Jogviszony típus] TEXT(255) NULL,
[  Jogviszony kezdete] TEXT(255) NULL,
[  Jogviszony vége] TEXT(255) NULL,
[Dolgozó neve] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[Figyelendõ dátum típusa] TEXT(255) NULL,
[Figyelendõ dátum] TEXT(255) NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 6 szervezeti egység kód] TEXT(255) NULL,
[Szint 6 szervezeti egység név] TEXT(255) NULL,
[Szint 7 szervezeti egység kód] DOUBLE NULL,
[Szint 7 szervezeti egység név] DOUBLE NULL,
[Szint 8 szervezeti egység kód] DOUBLE NULL,
[Szint 8 szervezeti egység név] DOUBLE NULL,
[Szint 9 szervezeti egység kód] DOUBLE NULL,
[Szint 9 szervezeti egység név] DOUBLE NULL,
[Szint 10 szervezeti egység kód] DOUBLE NULL,
[Szint 10 szervezeti egység név] DOUBLE NULL,
[F31] DOUBLE NULL,
[F32] DOUBLE NULL
);

CREATE TABLE [tmpVédõnõk20241121] (
[Azonosító] LONG NULL,
[Adójel] DOUBLE NULL,
[Dátum] DATETIME NULL,
[Védõnõ] YESNO NULL,
[Vezetõ védõnõ] YESNO NULL
);

ALTER TABLE [tmpVédõnõk20241121] ADD CONSTRAINT [PK_tmpVédõnõk20241121] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tNapok03] (
[Év] DOUBLE NULL,
[Nap] DOUBLE NULL,
[Dátum] DATETIME NULL
);

CREATE TABLE [tNevekOltáshoz] (
[Azonosító] LONG NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Oltandók] TEXT(255) NULL
);

ALTER TABLE [tNevekOltáshoz] ADD CONSTRAINT [PK_tNevekOltáshoz] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tNevekOltáshoz2] (
[Azonosító] LONG NULL,
[Név1] TEXT(255) NULL
);

ALTER TABLE [tNevekOltáshoz2] ADD CONSTRAINT [PK_tNevekOltáshoz2] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tNexonAzonosítók] (
[Azonosító] LONG NULL,
[Személy azonosító] DOUBLE NOT NULL,
[HR kapcsolat azonosító] DOUBLE NOT NULL,
[Név] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Jogviszony típus] TEXT(255) NULL,
[Kezdete] TEXT(255) NULL,
[Vége] TEXT(255) NULL,
[Szervezeti egység] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Munkakör] TEXT(255) NULL,
[Státusz] TEXT(255) NULL,
[TörténetiSorszám] LONG NULL
);

CREATE INDEX [Adóazonosító jel] ON [tNexonAzonosítók] ([Adóazonosító jel]);

CREATE INDEX [HR kapcsolat azonosító] ON [tNexonAzonosítók] ([HR kapcsolat azonosító]);

CREATE INDEX [Személy azonosító] ON [tNexonAzonosítók] ([Személy azonosító]);

CREATE INDEX [SzemélyKapcsolat] ON [tNexonAzonosítók] ([Személy azonosító],[HR kapcsolat azonosító]);

ALTER TABLE [tNexonAzonosítók] ADD CONSTRAINT [PK_tNexonAzonosítók] PRIMARY KEY ([HR kapcsolat azonosító]);

CREATE TABLE [tNexonForrás] (
[Azonosító] LONG NULL,
[NEXON személy ID] DOUBLE NULL,
[Nexonos szerv#egys#azon#] TEXT(255) NULL,
[Forrás Szerv#egys#] TEXT(255) NULL,
[Forrás Személy azon#] TEXT(255) NULL
);

ALTER TABLE [tNexonForrás] ADD CONSTRAINT [PK_tNexonForrás] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tNexonMezõk] (
[azNexonMezõ] LONG NULL,
[Nexon mezõ megnevezése] TEXT(255) NULL,
[Megjegyzés] MEMO NULL
);

ALTER TABLE [tNexonMezõk] ADD CONSTRAINT [PK_tNexonMezõk] PRIMARY KEY ([azNexonMezõ]);

CREATE TABLE [tOroszUkránNyelvvizsgák20240912] (
[Azonosító] LONG NULL,
[Szervezeti egység] TEXT(255) NULL,
[Dolgozó azonosító] DOUBLE NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Szerzõdéses munkakör] TEXT(255) NULL,
[KIRA Feladat] TEXT(255) NULL,
[Nyelv neve] TEXT(255) NULL,
[Nyelvvizsga foka] TEXT(255) NULL,
[Nyelvvizsga típusa] TEXT(255) NULL,
[Tudásszint] TEXT(255) NULL,
[Kiállító intézmény] TEXT(255) NULL,
[Bizonyítvány száma] TEXT(255) NULL,
[Kiállítás dátuma] DATETIME NULL,
[Kapcsolt képzés adat] TEXT(255) NULL,
[Kapcsolt tanfolyam adat] TEXT(255) NULL,
[Nyelvismeret szakvizsga típusa] TEXT(255) NULL,
[Nyelvpótlék jár] YESNO NULL,
[Figyelembe vétel kezdet] DATETIME NULL,
[Figyelembe vétel vége] TEXT(255) NULL,
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
[Nyelv/foka/típusa] TEXT(255) NULL
);

ALTER TABLE [tOroszUkránNyelvvizsgák20240912] ADD CONSTRAINT [PK_tOroszUkránNyelvvizsgák20240912] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tOrvosiAlkalmasságiVizsgálatok202310-202408Összefûzött] (
[TAJ] DOUBLE NULL,
[Dátum] DATETIME NULL,
[Dátum2] TEXT(255) NULL
);

CREATE TABLE [tOrvosiÁlláshelyek] (
[azOrvosiÁlláshely] LONG NULL,
[alaplétszámba tartozó orvosi  álláshely azonosítója] TEXT(255) NULL,
[HatályKezdet] DATETIME NULL,
[HatályVég] DATETIME NULL
);

CREATE INDEX [StátuszHatály] ON [tOrvosiÁlláshelyek] ([HatályKezdet],[alaplétszámba tartozó orvosi  álláshely azonosítója]);

ALTER TABLE [tOrvosiÁlláshelyek] ADD CONSTRAINT [PK_tOrvosiÁlláshelyek] PRIMARY KEY ([azOrvosiÁlláshely]);

CREATE TABLE [tOrvosokAdatai] (
[azOrvos] LONG NULL,
[Adójel] DOUBLE NULL,
[EszmeiIdõKezdete] DATETIME NULL,
[ÉvekSzáma] LONG NULL,
[EszjtvBesorolásSzerintiIlletmény] CURRENCY NULL,
[NyilvántartásiSzám] LONG NULL,
[OrvosHatályVége] DATETIME NULL
);

ALTER TABLE [tOrvosokAdatai] ADD CONSTRAINT [PK_tOrvosokAdatai] PRIMARY KEY ([azOrvos]);

CREATE TABLE [tÖsszesUtónév] (
[Azonosító] LONG NULL,
[Utónév] TEXT(255) NULL,
[Nem] LONG NULL
);

CREATE INDEX [Utónév] ON [tÖsszesUtónév] ([Utónév]);

ALTER TABLE [tÖsszesUtónév] ADD CONSTRAINT [PK_tÖsszesUtónév] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tPGFtábla] (
[Azonosító] LONG NULL,
[Adóazonosító jel] TEXT(255) NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Mezõ3] TEXT(255) NULL,
[Fõosztály/Kerületi Hivatal] TEXT(255) NULL,
[Mezõ5] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Státusz kódja ÁNYR szám] TEXT(255) NULL,
[Besorolási  fokozat (KT)] TEXT(255) NULL,
[Státusz típusa alaplétszám/központosított] TEXT(255) NULL,
[Mezõ10] TEXT(255) NULL,
[Foglalkozási viszony statisztikai besorolása] TEXT(255) NULL,
[Ledolgozandó heti órakeret] DOUBLE NULL,
[Mezõ13] DOUBLE NULL,
[KÜLÖNBSÉG] DOUBLE NULL,
[Jogviszony tipusa (határozott/határozatlan)] TEXT(255) NULL,
[Jogviszony típusa / (Kit/MT)] TEXT(255) NULL,
[Jogviszony kezdete (belépés dátuma)] DATETIME NULL,
[Jogviszony vége (kilépés dátuma)] DATETIME NULL,
[JOGVISZONY VÉGE] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Mezõ21] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Helyettesített dolgozó neve] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérítés nélküli)] CURRENCY NULL,
[Mezõ26] DOUBLE NULL,
[Mezõ27] DOUBLE NULL,
[Javasolt emelés] CURRENCY NULL,
[Új illetmény] CURRENCY NULL,
[%] DOUBLE NULL,
[Illetmény alsó határa] CURRENCY NULL,
[Illetmény felsõ határa] DOUBLE NULL,
[Ellenõrzés Alsó] TEXT(255) NULL,
[Ellenõrzés Felsõ] TEXT(255) NULL,
[Kontroll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL
);

CREATE INDEX [Adóazonosító jel] ON [tPGFtábla] ([Adóazonosító jel]);

ALTER TABLE [tPGFtábla] ADD CONSTRAINT [PK_tPGFtábla] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tReferensekFõosztályok] (
[azRef] LONG NULL,
[Fõosztály] TEXT(255) NULL,
[bfkhFõosztály] TEXT(255) NULL,
[Referens] TEXT(255) NULL,
[Arány] TEXT(255) NULL,
[azNexon] LONG NULL,
[Osztály] TEXT(255) NULL,
[bfkhOsztály] TEXT(255) NULL,
[Telefon] TEXT(255) NULL,
[Szoba] TEXT(255) NULL,
[azSzoba] LONG NULL
);

ALTER TABLE [tReferensekFõosztályok] ADD CONSTRAINT [PK_tReferensekFõosztályok] PRIMARY KEY ([azRef]);

CREATE TABLE [tReferensekTerületNélkül] (
[Azonosító] LONG NULL,
[NexonAz] LONG NULL
);

ALTER TABLE [tReferensekTerületNélkül] ADD CONSTRAINT [PK_tReferensekTerületNélkül] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tRégiHibák] (
[Elsõ mezõ] TEXT(255) NOT NULL,
[Második mezõ] MEMO NULL,
[Elsõ Idõpont] DATETIME NULL,
[Utolsó Idõpont] DATETIME NULL,
[lekérdezésNeve] TEXT(255) NULL
);

CREATE INDEX [Idõpont] ON [tRégiHibák] ([Elsõ Idõpont]);

ALTER TABLE [tRégiHibák] ADD CONSTRAINT [PK_tRégiHibák] PRIMARY KEY ([Elsõ mezõ]);

CREATE TABLE [tSpecifikusDolgozók] (
[Azonosító] LONG NULL,
[Születési név] TEXT(255) NULL,
[Születési hely] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Anyja neve] TEXT(255) NULL
);

ALTER TABLE [tSpecifikusDolgozók] ADD CONSTRAINT [PK_tSpecifikusDolgozók] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tSzakfeladatForráskód] (
[Azonosító] LONG NULL,
[SZAKFELADAT] TEXT(255) NULL,
[SzervEgysKód] TEXT(255) NULL
);

ALTER TABLE [tSzakfeladatForráskód] ADD CONSTRAINT [PK_tSzakfeladatForráskód] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tSzakterületSzervezet] (
[Szakterületi adatszolgáltatás] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL
);

CREATE TABLE [tSzemélyek] (
[Azonosító] LONG NULL,
[Adójel] DOUBLE NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Dolgozó születési neve] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Ügyfélkapu kód] TEXT(255) NULL,
[Elsõdleges állampolgárság] TEXT(255) NULL,
[Személyi igazolvány száma] TEXT(255) NULL,
[Személyi igazolvány érvényesség kezdete] DATETIME NULL,
[Személyi igazolvány érvényesség vége] DATETIME NULL,
[Nyelvtudás Angol] TEXT(255) NULL,
[Nyelvtudás Arab] TEXT(255) NULL,
[Nyelvtudás Bolgár] TEXT(255) NULL,
[Nyelvtudás Cigány] TEXT(255) NULL,
[Nyelvtudás Cigány (lovári)] TEXT(255) NULL,
[Nyelvtudás Cseh] TEXT(255) NULL,
[Nyelvtudás Eszperantó] TEXT(255) NULL,
[Nyelvtudás Finn] TEXT(255) NULL,
[Nyelvtudás Francia] TEXT(255) NULL,
[Nyelvtudás Héber] TEXT(255) NULL,
[Nyelvtudás Holland] TEXT(255) NULL,
[Nyelvtudás Horvát] TEXT(255) NULL,
[Nyelvtudás Japán] TEXT(255) NULL,
[Nyelvtudás Jelnyelv] TEXT(255) NULL,
[Nyelvtudás Kínai] TEXT(255) NULL,
[Nyelvtudás Latin] TEXT(255) NULL,
[Nyelvtudás Lengyel] TEXT(255) NULL,
[Nyelvtudás Német] TEXT(255) NULL,
[Nyelvtudás Norvég] TEXT(255) NULL,
[Nyelvtudás Olasz] TEXT(255) NULL,
[Nyelvtudás Orosz] TEXT(255) NULL,
[Nyelvtudás Portugál] TEXT(255) NULL,
[Nyelvtudás Román] TEXT(255) NULL,
[Nyelvtudás Spanyol] TEXT(255) NULL,
[Nyelvtudás Szerb] TEXT(255) NULL,
[Nyelvtudás Szlovák] TEXT(255) NULL,
[Nyelvtudás Szlovén] TEXT(255) NULL,
[Nyelvtudás Török] TEXT(255) NULL,
[Nyelvtudás Újgörög] TEXT(255) NULL,
[Nyelvtudás Ukrán] TEXT(255) NULL,
[Orvosi vizsgálat idõpontja] DATETIME NULL,
[Orvosi vizsgálat típusa] TEXT(255) NULL,
[Orvosi vizsgálat eredménye] TEXT(255) NULL,
[Orvosi vizsgálat észrevételek] TEXT(255) NULL,
[Orvosi vizsgálat következõ idõpontja] DATETIME NULL,
[Erkölcsi bizonyítvány száma] TEXT(255) NULL,
[Erkölcsi bizonyítvány dátuma] DATETIME NULL,
[Erkölcsi bizonyítvány eredménye] TEXT(255) NULL,
[Erkölcsi bizonyítvány kérelem azonosító] TEXT(255) NULL,
[Erkölcsi bizonyítvány közügyektõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány jármûvezetéstõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány intézkedés alatt áll] TEXT(255) NULL,
[Munkaköri leírások (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Kormányhivatal rövid neve] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Szervezeti egység neve] TEXT(255) NULL,
[Szervezeti munkakör neve] TEXT(255) NULL,
[Vezetõi megbízás típusa] TEXT(255) NULL,
[Státusz kódja] TEXT(255) NULL,
[Státusz költséghelyének kódja] TEXT(255) NULL,
[Státusz költséghelyének neve ] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] YESNO NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz neve] TEXT(255) NULL,
[Többes betöltés] YESNO NULL,
[Vezetõ neve] TEXT(255) NULL,
[Vezetõ adóazonosító jele] TEXT(255) NULL,
[Vezetõ email címe] TEXT(255) NULL,
[Állandó lakcím] TEXT(255) NULL,
[Tartózkodási lakcím] TEXT(255) NULL,
[Levelezési cím_] TEXT(255) NULL,
[Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)] DATETIME NULL,
[Nyugdíjas] YESNO NULL,
[Nyugdíj típusa] TEXT(255) NULL,
[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik] TEXT(255) NULL,
[Megváltozott munkaképesség] YESNO NULL,
[Önkéntes tartalékos katona] YESNO NULL,
[Utolsó vagyonnyilatkozat leadásának dátuma] DATETIME NULL,
[Vagyonnyilatkozat nyilvántartási száma] TEXT(255) NULL,
[Következõ vagyonnyilatkozat esedékessége] DATETIME NULL,
[Nemzetbiztonsági ellenõrzés dátuma] TEXT(255) NULL,
[Védett állományba tartozó munkakör] YESNO NULL,
[Vezetõi megbízás típusa1] TEXT(255) NULL,
[Vezetõi beosztás megnevezése] TEXT(255) NULL,
[Vezetõi beosztás (megbízás) kezdete] DATETIME NULL,
[Vezetõi beosztás (megbízás) vége] TEXT(255) NULL,
[Iskolai végzettség foka] TEXT(255) NULL,
[Iskolai végzettség neve] TEXT(255) NULL,
[Alapvizsga kötelezés dátuma] DATETIME NULL,
[Alapvizsga letétel tényleges határideje] TEXT(255) NULL,
[Alapvizsga mentesség] YESNO NULL,
[Alapvizsga mentesség oka] TEXT(255) NULL,
[Szakvizsga kötelezés dátuma] TEXT(255) NULL,
[Szakvizsga letétel tényleges határideje] TEXT(255) NULL,
[Szakvizsga mentesség] YESNO NULL,
[Foglalkozási viszony] TEXT(255) NULL,
[Foglalkozási viszony statisztikai besorolása] TEXT(255) NULL,
[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban] TEXT(255) NULL,
[Beosztástervezés helyszínek] TEXT(255) NULL,
[Beosztástervezés tevékenységek] TEXT(255) NULL,
[Részleges távmunka szerzõdés kezdete] TEXT(255) NULL,
[Részleges távmunka szerzõdés vége] TEXT(255) NULL,
[Részleges távmunka szerzõdés intervalluma] TEXT(255) NULL,
[Részleges távmunka szerzõdés mértéke] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 2] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 3] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás kezdete] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás vége] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás mértéke] TEXT(255) NULL,
[KIRA feladat azonosítója - intézmény prefix-szel ellátva] TEXT(255) NULL,
[KIRA feladat azonosítója] TEXT(255) NULL,
[KIRA feladat megnevezés] TEXT(255) NULL,
[Osztott munkakör] TEXT(255) NULL,
[Funkciócsoport: kód-megnevezés] TEXT(255) NULL,
[Funkció: kód-megnevezés] TEXT(255) NULL,
[Dolgozó költséghelyének kódja] TEXT(255) NULL,
[Dolgozó költséghelyének neve] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Elsõdleges feladatkör] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker] DOUBLE NULL,
[Szerzõdés/Kinevezés típusa] TEXT(255) NULL,
[Iktatószám] TEXT(255) NULL,
[Szerzõdés/kinevezés verzió_érvényesség kezdete] DATETIME NULL,
[Szerzõdés/kinevezés verzió_érvényesség vége] TEXT(255) NULL,
[Határozott idejû _szerzõdés/kinevezés lejár] TEXT(255) NULL,
[Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Megjegyzés (pl# határozott szerzõdés/kinevezés oka)] TEXT(255) NULL,
[Munkavégzés helye - megnevezés] TEXT(255) NULL,
[Munkavégzés helye - cím] TEXT(255) NULL,
[Jogviszony típusa / jogviszony típus] TEXT(255) NULL,
[Jogviszony sorszáma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[Kölcsönbe adó cég] TEXT(255) NULL,
[Teljesítményértékelés - Értékelõ személy] TEXT(255) NULL,
[Teljesítményértékelés - Érvényesség kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak vége] TEXT(255) NULL,
[Teljesítményértékelés dátuma] TEXT(255) NULL,
[Teljesítményértékelés - Beállási százalék] TEXT(255) NULL,
[Teljesítményértékelés - Pontszám] TEXT(255) NULL,
[Teljesítményértékelés - Megjegyzés] TEXT(255) NULL,
[Dolgozói jellemzõk] TEXT(255) NULL,
[Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol] TEXT(255) NULL,
[Besorolási  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos idõ kezdete] TEXT(255) NULL,
[Jogviszony kezdete (belépés dátuma)] DATETIME NULL,
[Jogviszony vége (kilépés dátuma)] DATETIME NULL,
[Utolsó munkában töltött nap] TEXT(255) NULL,
[Kezdeményezés dátuma] TEXT(255) NULL,
[Hatályossá válik] TEXT(255) NULL,
[HR kapcsolat megszûnés módja (Kilépés módja)] TEXT(255) NULL,
[HR kapcsolat megszûnes indoka (Kilépés indoka)] TEXT(255) NULL,
[Indokolás] TEXT(255) NULL,
[Következõ munkahely] TEXT(255) NULL,
[MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete] TEXT(255) NULL,
[Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)] TEXT(255) NULL,
[Munkavégzés alóli mentesítés kezdete (KJT, KTTV) Felmentési idõ ] TEXT(255) NULL,
[Munkavégzés alóli mentesítés vége (KJT, KTTV) Felmentési idõ vég] TEXT(255) NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Tartós távollét kezdete] TEXT(255) NULL,
[Tartós távollét vége] TEXT(255) NULL,
[Tartós távollét tervezett vége] TEXT(255) NULL,
[Helyettesített dolgozó neve] TEXT(255) NULL,
[Szerzõdés/Kinevezés - próbaidõ vége] DATETIME NULL,
[Utalási cím] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)] DOUBLE NULL,
[Garantált bérminimumra történõ kiegészítés] TEXT(255) NULL,
[Kerekítés] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérítés nélküli)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérítés nélküli)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérítés nélküli)] DOUBLE NULL,
[Eltérítés %] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérített)] DOUBLE NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérí1] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (e1] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérített)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérített)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérített)] DOUBLE NULL,
[További munkavégzés helye 1 Teljes munkaidõ %-a] TEXT(255) NULL,
[További munkavégzés helye 2 Teljes munkaidõ %-a] TEXT(255) NULL,
[KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ] DOUBLE NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[Szint 6 szervezeti egység név] TEXT(255) NULL,
[Szint 6 szervezeti egység kód] TEXT(255) NULL,
[Szint 7 szervezeti egység név] TEXT(255) NULL,
[Szint 7 szervezeti egység kód] TEXT(255) NULL,
[AD egyedi azonosító] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mellék] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[További otthoni mobil] TEXT(255) NULL
);

CREATE INDEX [Adójel] ON [tSzemélyek] ([Adójel]);

CREATE INDEX [Státusz kódja] ON [tSzemélyek] ([Státusz kódja]);

CREATE INDEX [Szervezeti egység kódja] ON [tSzemélyek] ([Szervezeti egység kódja]);

ALTER TABLE [tSzemélyek] ADD CONSTRAINT [PK_tSzemélyek] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tSzemélyek_import] (
[Adójel] DOUBLE NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Dolgozó születési neve] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Ügyfélkapu kód] TEXT(255) NULL,
[Elsõdleges állampolgárság] TEXT(255) NULL,
[Személyi igazolvány száma] TEXT(255) NULL,
[Személyi igazolvány érvényesség kezdete] DATETIME NULL,
[Személyi igazolvány érvényesség vége] DATETIME NULL,
[Útlevél száma] TEXT(255) NULL,
[Útlevél érvényesség vége] TEXT(255) NULL,
[Nyelvtudás Angol] TEXT(255) NULL,
[Nyelvtudás Arab] TEXT(255) NULL,
[Nyelvtudás Bolgár] TEXT(255) NULL,
[Nyelvtudás Cigány] TEXT(255) NULL,
[Nyelvtudás Cigány (lovári)] TEXT(255) NULL,
[Nyelvtudás Cseh] TEXT(255) NULL,
[Nyelvtudás Eszperantó] TEXT(255) NULL,
[Nyelvtudás Finn] TEXT(255) NULL,
[Nyelvtudás Francia] TEXT(255) NULL,
[Nyelvtudás Héber] TEXT(255) NULL,
[Nyelvtudás Holland] TEXT(255) NULL,
[Nyelvtudás Horvát] TEXT(255) NULL,
[Nyelvtudás Japán] TEXT(255) NULL,
[Nyelvtudás Jelnyelv] TEXT(255) NULL,
[Nyelvtudás Kínai] TEXT(255) NULL,
[Nyelvtudás Koreai] TEXT(255) NULL,
[Nyelvtudás Latin] TEXT(255) NULL,
[Nyelvtudás Lengyel] TEXT(255) NULL,
[Nyelvtudás Német] TEXT(255) NULL,
[Nyelvtudás Norvég] TEXT(255) NULL,
[Nyelvtudás Olasz] TEXT(255) NULL,
[Nyelvtudás Orosz] TEXT(255) NULL,
[Nyelvtudás Portugál] TEXT(255) NULL,
[Nyelvtudás Román] TEXT(255) NULL,
[Nyelvtudás Spanyol] TEXT(255) NULL,
[Nyelvtudás Szerb] TEXT(255) NULL,
[Nyelvtudás Szlovák] TEXT(255) NULL,
[Nyelvtudás Szlovén] TEXT(255) NULL,
[Nyelvtudás Török] TEXT(255) NULL,
[Nyelvtudás Újgörög] TEXT(255) NULL,
[Nyelvtudás Ukrán] TEXT(255) NULL,
[Orvosi vizsgálat idõpontja] DATETIME NULL,
[Orvosi vizsgálat típusa] TEXT(255) NULL,
[Orvosi vizsgálat eredménye] TEXT(255) NULL,
[Orvosi vizsgálat észrevételek] TEXT(255) NULL,
[Orvosi vizsgálat következõ idõpontja] DATETIME NULL,
[Erkölcsi bizonyítvány száma] TEXT(255) NULL,
[Erkölcsi bizonyítvány dátuma] DATETIME NULL,
[Erkölcsi bizonyítvány eredménye] TEXT(255) NULL,
[Erkölcsi bizonyítvány kérelem azonosító] TEXT(255) NULL,
[Erkölcsi bizonyítvány közügyektõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány jármûvezetéstõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány intézkedés alatt áll] TEXT(255) NULL,
[Munkaköri leírások (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Kormányhivatal rövid neve] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Szervezeti egység neve] TEXT(255) NULL,
[Szervezeti munkakör neve] TEXT(255) NULL,
[Vezetõi megbízás típusa] TEXT(255) NULL,
[Státusz kódja] TEXT(255) NULL,
[Státusz költséghelyének kódja] TEXT(255) NULL,
[Státusz költséghelyének neve ] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] YESNO NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz neve] TEXT(255) NULL,
[Többes betöltés] YESNO NULL,
[Vezetõ neve] TEXT(255) NULL,
[Vezetõ adóazonosító jele] TEXT(255) NULL,
[Vezetõ email címe] TEXT(255) NULL,
[Állandó lakcím] TEXT(255) NULL,
[Tartózkodási lakcím] TEXT(255) NULL,
[Levelezési cím_] TEXT(255) NULL,
[Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)] DATETIME NULL,
[Nyugdíjas] YESNO NULL,
[Nyugdíj típusa] TEXT(255) NULL,
[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik] TEXT(255) NULL,
[Megváltozott munkaképesség] YESNO NULL,
[Önkéntes tartalékos katona] YESNO NULL,
[Utolsó vagyonnyilatkozat leadásának dátuma] DATETIME NULL,
[Vagyonnyilatkozat nyilvántartási száma] TEXT(255) NULL,
[Következõ vagyonnyilatkozat esedékessége] DATETIME NULL,
[Nemzetbiztonsági ellenõrzésre kötelezett] TEXT(255) NULL,
[Nemzetbiztonsági ellenõrzés dátuma] TEXT(255) NULL,
[Védett állományba tartozó munkakör] YESNO NULL,
[Vezetõi megbízás típusa1] TEXT(255) NULL,
[Vezetõi beosztás megnevezése] TEXT(255) NULL,
[Vezetõi beosztás (megbízás) kezdete] DATETIME NULL,
[Vezetõi beosztás (megbízás) vége] TEXT(255) NULL,
[Iskolai végzettség foka] TEXT(255) NULL,
[Iskolai végzettség neve] TEXT(255) NULL,
[Alapvizsga kötelezés dátuma] DATETIME NULL,
[Alapvizsga letétel tényleges határideje] TEXT(255) NULL,
[Alapvizsga mentesség] YESNO NULL,
[Alapvizsga mentesség oka] TEXT(255) NULL,
[Szakvizsga kötelezés dátuma] TEXT(255) NULL,
[Szakvizsga letétel tényleges határideje] TEXT(255) NULL,
[Szakvizsga mentesség] YESNO NULL,
[Foglalkozási viszony] TEXT(255) NULL,
[Foglalkozási viszony statisztikai besorolása] TEXT(255) NULL,
[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban] TEXT(255) NULL,
[Beosztástervezés helyszínek] TEXT(255) NULL,
[Beosztástervezés tevékenységek] TEXT(255) NULL,
[Részleges távmunka szerzõdés kezdete] TEXT(255) NULL,
[Részleges távmunka szerzõdés vége] TEXT(255) NULL,
[Részleges távmunka szerzõdés intervalluma] TEXT(255) NULL,
[Részleges távmunka szerzõdés mértéke] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 2] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 3] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás kezdete] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás vége] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás mértéke] TEXT(255) NULL,
[KIRA feladat azonosítója - intézmény prefix-szel ellátva] TEXT(255) NULL,
[KIRA feladat azonosítója] TEXT(255) NULL,
[KIRA feladat megnevezés] TEXT(255) NULL,
[Osztott munkakör] TEXT(255) NULL,
[Funkciócsoport: kód-megnevezés] TEXT(255) NULL,
[Funkció: kód-megnevezés] TEXT(255) NULL,
[Dolgozó költséghelyének kódja] TEXT(255) NULL,
[Dolgozó költséghelyének neve] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Elsõdleges feladatkör] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker] DOUBLE NULL,
[Szerzõdés/Kinevezés típusa] TEXT(255) NULL,
[Iktatószám] TEXT(255) NULL,
[Szerzõdés/kinevezés verzió_érvényesség kezdete] DATETIME NULL,
[Szerzõdés/kinevezés verzió_érvényesség vége] DATETIME NULL,
[Határozott idejû _szerzõdés/kinevezés lejár] TEXT(255) NULL,
[Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Megjegyzés (pl# határozott szerzõdés/kinevezés oka)] TEXT(255) NULL,
[Munkavégzés helye - megnevezés] TEXT(255) NULL,
[Munkavégzés helye - cím] TEXT(255) NULL,
[Jogviszony típusa / jogviszony típus] TEXT(255) NULL,
[Jogviszony sorszáma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[Kölcsönbe adó cég] TEXT(255) NULL,
[Teljesítményértékelés - Értékelõ személy] TEXT(255) NULL,
[Teljesítményértékelés - Érvényesség kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak vége] TEXT(255) NULL,
[Teljesítményértékelés dátuma] TEXT(255) NULL,
[Teljesítményértékelés - Beállási százalék] TEXT(255) NULL,
[Teljesítményértékelés - Pontszám] TEXT(255) NULL,
[Teljesítményértékelés - Megjegyzés] TEXT(255) NULL,
[Dolgozói jellemzõk] TEXT(255) NULL,
[Prémium éves] TEXT(255) NULL,
[Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol] TEXT(255) NULL,
[Besorolási  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos idõ kezdete] TEXT(255) NULL,
[Jogviszony kezdete (belépés dátuma)] DATETIME NULL,
[Jogviszony vége (kilépés dátuma)] DATETIME NULL,
[Utolsó munkában töltött nap] TEXT(255) NULL,
[Kezdeményezés dátuma] DATETIME NULL,
[Hatályossá válik] DATETIME NULL,
[HR kapcsolat megszûnés módja (Kilépés módja)] TEXT(255) NULL,
[HR kapcsolat megszûnes indoka (Kilépés indoka)] TEXT(255) NULL,
[Indokolás] TEXT(255) NULL,
[Következõ munkahely] TEXT(255) NULL,
[MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete] TEXT(255) NULL,
[Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)] DATETIME NULL,
[Munkavégzés alóli mentesítés kezdete (KJT, KTTV) Felmentési idõ ] TEXT(255) NULL,
[Munkavégzés alóli mentesítés vége (KJT, KTTV) Felmentési idõ vég] TEXT(255) NULL,
[Átmeneti eltérõ foglalkoztatás típusa] TEXT(255) NULL,
[Átmeneti eltérõ foglalkoztatás kezdete] TEXT(255) NULL,
[Átmeneti eltérõ foglalkoztatás vége] TEXT(255) NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Tartós távollét kezdete] TEXT(255) NULL,
[Tartós távollét vége] TEXT(255) NULL,
[Tartós távollét tervezett vége] TEXT(255) NULL,
[Szerzõdés/Kinevezés - próbaidõ vége] DATETIME NULL,
[Utalási cím] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)] DOUBLE NULL,
[Garantált bérminimumra történõ kiegészítés] TEXT(255) NULL,
[Kerekítés] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérítés nélküli)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérítés nélküli)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérítés nélküli)] DOUBLE NULL,
[Eltérítés %] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérített)] DOUBLE NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérí1] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (e1] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérített)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérített)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérített)] DOUBLE NULL,
[További munkavégzés helye 1 Teljes munkaidõ %-a] TEXT(255) NULL,
[További munkavégzés helye 2 Teljes munkaidõ %-a] TEXT(255) NULL,
[KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ] DOUBLE NULL,
[Heti óraszám] TEXT(255) NULL,
[Mérték] TEXT(255) NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[Szint 6 szervezeti egység név] TEXT(255) NULL,
[Szint 6 szervezeti egység kód] TEXT(255) NULL,
[Szint 7 szervezeti egység név] TEXT(255) NULL,
[Szint 7 szervezeti egység kód] TEXT(255) NULL,
[Szint 8 szervezeti egység név] TEXT(255) NULL,
[Szint 8 szervezeti egység kód] TEXT(255) NULL,
[AD egyedi azonosító] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mellék] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[További otthoni mobil] TEXT(255) NULL
);

CREATE TABLE [tSzemélyek_tart] (
[Azonosító] LONG NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Dolgozó születési neve] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Ügyfélkapu kód] TEXT(255) NULL,
[Elsõdleges állampolgárság] TEXT(255) NULL,
[Személyi igazolvány száma] TEXT(255) NULL,
[Személyi igazolvány érvényesség kezdete] TEXT(255) NULL,
[Személyi igazolvány érvényesség vége] DATETIME NULL,
[Nyelvtudás Angol] TEXT(255) NULL,
[Nyelvtudás Bolgár] TEXT(255) NULL,
[Nyelvtudás Cigány] TEXT(255) NULL,
[Nyelvtudás Cigány (lovári)] TEXT(255) NULL,
[Nyelvtudás Cseh] TEXT(255) NULL,
[Nyelvtudás Eszperantó] TEXT(255) NULL,
[Nyelvtudás Francia] TEXT(255) NULL,
[Nyelvtudás Héber] TEXT(255) NULL,
[Nyelvtudás Holland] TEXT(255) NULL,
[Nyelvtudás Japán] TEXT(255) NULL,
[Nyelvtudás Jelnyelv] TEXT(255) NULL,
[Nyelvtudás Kínai] TEXT(255) NULL,
[Nyelvtudás Latin] TEXT(255) NULL,
[Nyelvtudás Lengyel] TEXT(255) NULL,
[Nyelvtudás Német] TEXT(255) NULL,
[Nyelvtudás Olasz] TEXT(255) NULL,
[Nyelvtudás Orosz] TEXT(255) NULL,
[Nyelvtudás Román] TEXT(255) NULL,
[Nyelvtudás Spanyol] TEXT(255) NULL,
[Nyelvtudás Szerb] TEXT(255) NULL,
[Nyelvtudás Szlovák] TEXT(255) NULL,
[Nyelvtudás Török] TEXT(255) NULL,
[Nyelvtudás Újgörög] TEXT(255) NULL,
[Nyelvtudás Ukrán] TEXT(255) NULL,
[Orvosi vizsgálat idõpontja] DATETIME NULL,
[Orvosi vizsgálat típusa] TEXT(255) NULL,
[Orvosi vizsgálat eredménye] TEXT(255) NULL,
[Orvosi vizsgálat észrevételek] TEXT(255) NULL,
[Orvosi vizsgálat következõ idõpontja] DATETIME NULL,
[Erkölcsi bizonyítvány száma] TEXT(255) NULL,
[Erkölcsi bizonyítvány dátuma] DATETIME NULL,
[Erkölcsi bizonyítvány eredménye] TEXT(255) NULL,
[Erkölcsi bizonyítvány kérelem azonosító] TEXT(255) NULL,
[Erkölcsi bizonyítvány közügyektõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány jármûvezetéstõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány intézkedés alatt áll] TEXT(255) NULL,
[Munkaköri leírások (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Kormányhivatal rövid neve] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Szervezeti egység neve] TEXT(255) NULL,
[Szervezeti munkakör neve] TEXT(255) NULL,
[Vezetõi megbízás típusa] TEXT(255) NULL,
[Státusz kódja] TEXT(255) NULL,
[Státusz költséghelyének kódja] TEXT(255) NULL,
[Státusz költséghelyének neve] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] YESNO NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz neve] TEXT(255) NULL,
[Többes betöltés] YESNO NULL,
[Vezetõ neve] TEXT(255) NULL,
[Vezetõ adóazonosító jele] TEXT(255) NULL,
[Vezetõ email címe] TEXT(255) NULL,
[Állandó lakcím] TEXT(255) NULL,
[Tartózkodási lakcím] TEXT(255) NULL,
[Mezõ70] TEXT(255) NULL,
[Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)] DATETIME NULL,
[Nyugdíjas] YESNO NULL,
[Nyugdíj típusa] TEXT(255) NULL,
[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik] TEXT(255) NULL,
[Megváltozott munkaképesség] YESNO NULL,
[Önkéntes tartalékos katona] YESNO NULL,
[Utolsó vagyonnyilatkozat leadásának dátuma] DATETIME NULL,
[Vagyonnyilatkozat nyilvántartási száma] TEXT(255) NULL,
[Következõ vagyonnyilatkozat esedékessége] DATETIME NULL,
[Nemzetbiztonsági ellenõrzés dátuma] TEXT(255) NULL,
[Védett állományba tartozó munkakör] YESNO NULL,
[Mezõ82] TEXT(255) NULL,
[Vezetõi beosztás megnevezése] TEXT(255) NULL,
[Vezetõi beosztás (megbízás) kezdete] DATETIME NULL,
[Vezetõi beosztás (megbízás) vége] TEXT(255) NULL,
[Iskolai végzettség foka] TEXT(255) NULL,
[Iskolai végzettség neve] TEXT(255) NULL,
[Alapvizsga kötelezés dátuma] TEXT(255) NULL,
[Alapvizsga letétel tényleges határideje] TEXT(255) NULL,
[Alapvizsga mentesség] YESNO NULL,
[Alapvizsga mentesség oka] TEXT(255) NULL,
[Szakvizsga kötelezés dátuma] DATETIME NULL,
[Szakvizsga letétel tényleges határideje] TEXT(255) NULL,
[Szakvizsga mentesség] YESNO NULL,
[Foglalkozási viszony] TEXT(255) NULL,
[Foglalkozási viszony statisztikai besorolása] TEXT(255) NULL,
[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban] TEXT(255) NULL,
[Beosztástervezés helyszínek] TEXT(255) NULL,
[Beosztástervezés tevékenységek] TEXT(255) NULL,
[Részleges távmunka szerzõdés kezdete] TEXT(255) NULL,
[Részleges távmunka szerzõdés vége] TEXT(255) NULL,
[Részleges távmunka szerzõdés intervalluma] TEXT(255) NULL,
[Részleges távmunka szerzõdés mértéke] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás kezdete] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás vége] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás mértéke] TEXT(255) NULL,
[KIRA feladat azonosítója - intézmény prefix-szel ellátva] TEXT(255) NULL,
[KIRA feladat azonosítója] TEXT(255) NULL,
[KIRA feladat megnevezés] TEXT(255) NULL,
[Osztott munkakör] TEXT(255) NULL,
[Funkciócsoport: kód-megnevezés] TEXT(255) NULL,
[Funkció: kód-megnevezés] TEXT(255) NULL,
[Dolgozó költséghelyének kódja] TEXT(255) NULL,
[Dolgozó költséghelyének neve] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Elsõdleges feladatkör] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker] DOUBLE NULL,
[Szerzõdés/Kinevezés típusa] TEXT(255) NULL,
[Iktatószám] TEXT(255) NULL,
[Mezõ125] DATETIME NULL,
[Mezõ126] TEXT(255) NULL,
[Mezõ127] DATETIME NULL,
[Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Megjegyzés (pl határozott szerzõdés/kinevezés oka)] TEXT(255) NULL,
[Munkavégzés helye - megnevezés] TEXT(255) NULL,
[Munkavégzés helye - cím] TEXT(255) NULL,
[Jogviszony típusa / jogviszony típus] TEXT(255) NULL,
[Jogviszony sorszáma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[Kölcsönbe adó cég] TEXT(255) NULL,
[Teljesítményértékelés - Értékelõ személy] TEXT(255) NULL,
[Teljesítményértékelés - Érvényesség kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak vége] TEXT(255) NULL,
[Teljesítményértékelés dátuma] TEXT(255) NULL,
[Teljesítményértékelés - Beállási százalék] TEXT(255) NULL,
[Teljesítményértékelés - Pontszám] TEXT(255) NULL,
[Teljesítményértékelés - Megjegyzés] TEXT(255) NULL,
[Dolgozói jellemzõk] TEXT(255) NULL,
[Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol] TEXT(255) NULL,
[Besorolási  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos idõ kezdete] TEXT(255) NULL,
[Jogviszony kezdete (belépés dátuma)] DATETIME NULL,
[Jogviszony vége (kilépés dátuma)] DATETIME NULL,
[Kezdeményezés dátuma] TEXT(255) NULL,
[Hatályossá válik] TEXT(255) NULL,
[HR kapcsolat megszûnés módja (Kilépés módja)] TEXT(255) NULL,
[Indokolás] TEXT(255) NULL,
[MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete] TEXT(255) NULL,
[Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)] TEXT(255) NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Tartós távollét kezdete] TEXT(255) NULL,
[Tartós távollét vége] TEXT(255) NULL,
[Tartós távollét tervezett vége] TEXT(255) NULL,
[Helyettesített dolgozó neve] TEXT(255) NULL,
[Helyettesített dolgozó szerzõdés/kinevezéses munkaköre] TEXT(255) NULL,
[Szerzõdés/Kinevezés - próbaidõ vége] DATETIME NULL,
[Utalási cím] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)] CURRENCY NULL,
[Garantált bérminimumra történõ kiegészítés] CURRENCY NULL,
[Kerekítés] LONG NULL,
[Illetmény összesen kerekítés nélkül (eltérítés nélküli)] CURRENCY NULL,
[Kerekített 100 %-os illetmény (eltérítés nélküli)] CURRENCY NULL,
[Eltérítés %] DOUBLE NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérített)] CURRENCY NULL,
[Illetmény összesen kerekítés nélkül (eltérített)] CURRENCY NULL,
[Kerekített 100 %-os illetmény (eltérített)] CURRENCY NULL,
[További munkavégzés helye 1 Teljes munkaidõ %-a] CURRENCY NULL,
[További munkavégzés helye 2 Teljes munkaidõ %-a] CURRENCY NULL,
[KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ] CURRENCY NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[AD egyedi azonosító] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mellék] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[További otthoni mobil] TEXT(255) NULL,
[Adójel] DOUBLE NULL,
[azNexon] DOUBLE NULL
);

CREATE TABLE [tSzemélyek20210101] (
[Azonosító] LONG NULL,
[Adójel] DOUBLE NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Dolgozó születési neve] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Ügyfélkapu kód] TEXT(255) NULL,
[Elsõdleges állampolgárság] TEXT(255) NULL,
[Személyi igazolvány száma] TEXT(255) NULL,
[Személyi igazolvány érvényesség kezdete] DATETIME NULL,
[Személyi igazolvány érvényesség vége] DATETIME NULL,
[Nyelvtudás Angol] TEXT(255) NULL,
[Nyelvtudás Arab] TEXT(255) NULL,
[Nyelvtudás Bolgár] TEXT(255) NULL,
[Nyelvtudás Cigány] TEXT(255) NULL,
[Nyelvtudás Cigány (lovári)] TEXT(255) NULL,
[Nyelvtudás Cseh] TEXT(255) NULL,
[Nyelvtudás Eszperantó] TEXT(255) NULL,
[Nyelvtudás Finn] TEXT(255) NULL,
[Nyelvtudás Francia] TEXT(255) NULL,
[Nyelvtudás Héber] TEXT(255) NULL,
[Nyelvtudás Holland] TEXT(255) NULL,
[Nyelvtudás Horvát] TEXT(255) NULL,
[Nyelvtudás Japán] TEXT(255) NULL,
[Nyelvtudás Jelnyelv] TEXT(255) NULL,
[Nyelvtudás Kínai] TEXT(255) NULL,
[Nyelvtudás Latin] TEXT(255) NULL,
[Nyelvtudás Lengyel] TEXT(255) NULL,
[Nyelvtudás Német] TEXT(255) NULL,
[Nyelvtudás Norvég] TEXT(255) NULL,
[Nyelvtudás Olasz] TEXT(255) NULL,
[Nyelvtudás Orosz] TEXT(255) NULL,
[Nyelvtudás Portugál] TEXT(255) NULL,
[Nyelvtudás Román] TEXT(255) NULL,
[Nyelvtudás Spanyol] TEXT(255) NULL,
[Nyelvtudás Szerb] TEXT(255) NULL,
[Nyelvtudás Szlovák] TEXT(255) NULL,
[Nyelvtudás Szlovén] TEXT(255) NULL,
[Nyelvtudás Török] TEXT(255) NULL,
[Nyelvtudás Újgörög] TEXT(255) NULL,
[Nyelvtudás Ukrán] TEXT(255) NULL,
[Orvosi vizsgálat idõpontja] DATETIME NULL,
[Orvosi vizsgálat típusa] TEXT(255) NULL,
[Orvosi vizsgálat eredménye] TEXT(255) NULL,
[Orvosi vizsgálat észrevételek] TEXT(255) NULL,
[Orvosi vizsgálat következõ idõpontja] DATETIME NULL,
[Erkölcsi bizonyítvány száma] TEXT(255) NULL,
[Erkölcsi bizonyítvány dátuma] TEXT(255) NULL,
[Erkölcsi bizonyítvány eredménye] TEXT(255) NULL,
[Erkölcsi bizonyítvány kérelem azonosító] TEXT(255) NULL,
[Erkölcsi bizonyítvány közügyektõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány jármûvezetéstõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány intézkedés alatt áll] TEXT(255) NULL,
[Munkaköri leírások (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Kormányhivatal rövid neve] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Szervezeti egység neve] TEXT(255) NULL,
[Szervezeti munkakör neve] TEXT(255) NULL,
[Vezetõi megbízás típusa] TEXT(255) NULL,
[Státusz kódja] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] YESNO NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz neve] TEXT(255) NULL,
[Többes betöltés] YESNO NULL,
[Vezetõ neve] TEXT(255) NULL,
[Vezetõ adóazonosító jele] TEXT(255) NULL,
[Vezetõ email címe] TEXT(255) NULL,
[Állandó lakcím] TEXT(255) NULL,
[Tartózkodási lakcím] TEXT(255) NULL,
[Mezõ76] TEXT(255) NULL,
[Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)] DATETIME NULL,
[Nyugdíjas] YESNO NULL,
[Nyugdíj típusa] TEXT(255) NULL,
[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik] TEXT(255) NULL,
[Megváltozott munkaképesség] YESNO NULL,
[Önkéntes tartalékos katona] YESNO NULL,
[Utolsó vagyonnyilatkozat leadásának dátuma] DATETIME NULL,
[Vagyonnyilatkozat nyilvántartási száma] TEXT(255) NULL,
[Következõ vagyonnyilatkozat esedékessége] DATETIME NULL,
[Nemzetbiztonsági ellenõrzés dátuma] TEXT(255) NULL,
[Védett állományba tartozó munkakör] YESNO NULL,
[Mezõ88] TEXT(255) NULL,
[Vezetõi beosztás megnevezése] TEXT(255) NULL,
[Vezetõi beosztás (megbízás) kezdete] DATETIME NULL,
[Vezetõi beosztás (megbízás) vége] TEXT(255) NULL,
[Iskolai végzettség foka] TEXT(255) NULL,
[Iskolai végzettség neve] TEXT(255) NULL,
[Alapvizsga kötelezés dátuma] TEXT(255) NULL,
[Alapvizsga letétel tényleges határideje] TEXT(255) NULL,
[Alapvizsga mentesség] YESNO NULL,
[Alapvizsga mentesség oka] TEXT(255) NULL,
[Szakvizsga kötelezés dátuma] TEXT(255) NULL,
[Szakvizsga letétel tényleges határideje] TEXT(255) NULL,
[Szakvizsga mentesség] YESNO NULL,
[Foglalkozási viszony] TEXT(255) NULL,
[Foglalkozási viszony statisztikai besorolása] TEXT(255) NULL,
[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban] TEXT(255) NULL,
[Beosztástervezés helyszínek] TEXT(255) NULL,
[Beosztástervezés tevékenységek] TEXT(255) NULL,
[Részleges távmunka szerzõdés kezdete] TEXT(255) NULL,
[Részleges távmunka szerzõdés vége] TEXT(255) NULL,
[Részleges távmunka szerzõdés intervalluma] TEXT(255) NULL,
[Részleges távmunka szerzõdés mértéke] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 2] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 3] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás kezdete] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás vége] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás mértéke] TEXT(255) NULL,
[KIRA feladat azonosítója - intézmény prefix-szel ellátva] TEXT(255) NULL,
[KIRA feladat azonosítója] TEXT(255) NULL,
[KIRA feladat megnevezés] TEXT(255) NULL,
[Osztott munkakör] TEXT(255) NULL,
[Funkciócsoport: kód-megnevezés] TEXT(255) NULL,
[Funkció: kód-megnevezés] TEXT(255) NULL,
[Dolgozó költséghelyének kódja] TEXT(255) NULL,
[Dolgozó költséghelyének neve] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Elsõdleges feladatkör] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker] DOUBLE NULL,
[Szerzõdés/Kinevezés típusa] TEXT(255) NULL,
[Iktatószám] TEXT(255) NULL,
[Mezõ133] DATETIME NULL,
[Mezõ134] DATETIME NULL,
[Mezõ135] TEXT(255) NULL,
[Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Megjegyzés (pl határozott szerzõdés/kinevezés oka)] TEXT(255) NULL,
[Munkavégzés helye - megnevezés] TEXT(255) NULL,
[Munkavégzés helye - cím] TEXT(255) NULL,
[Jogviszony típusa / jogviszony típus] TEXT(255) NULL,
[Jogviszony sorszáma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[Kölcsönbe adó cég] TEXT(255) NULL,
[Teljesítményértékelés - Értékelõ személy] TEXT(255) NULL,
[Teljesítményértékelés - Érvényesség kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Érvényesség vége] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak vége] TEXT(255) NULL,
[Teljesítményértékelés - Teljesítmény célok határideje] TEXT(255) NULL,
[Teljesítményértékelés dátuma] TEXT(255) NULL,
[Teljesítményértékelés - Beállási százalék] TEXT(255) NULL,
[Teljesítményértékelés - Pontszám] TEXT(255) NULL,
[Teljesítményértékelés - Megjegyzés] TEXT(255) NULL,
[Dolgozói jellemzõk] TEXT(255) NULL,
[Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol] TEXT(255) NULL,
[Besorolási  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos idõ kezdete] TEXT(255) NULL,
[Jogviszony kezdete (belépés dátuma)] DATETIME NULL,
[Jogviszony vége (kilépés dátuma)] DATETIME NULL,
[Utolsó munkában töltött nap] TEXT(255) NULL,
[Kezdeményezés dátuma] DATETIME NULL,
[Hatályossá válik] DATETIME NULL,
[HR kapcsolat megszûnés módja (Kilépés módja)] TEXT(255) NULL,
[HR kapcsolat megszûnes indoka (Kilépés indoka)] TEXT(255) NULL,
[Indokolás] TEXT(255) NULL,
[Következõ munkahely] TEXT(255) NULL,
[MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete] DATETIME NULL,
[Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)] DATETIME NULL,
[Munkavégzés alóli mentesítés kezdete (KJT, KTTV) Felmentési idõ ] TEXT(255) NULL,
[Munkavégzés alóli mentesítés vége (KJT, KTTV) Felmentési idõ vég] TEXT(255) NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Tartós távollét kezdete] TEXT(255) NULL,
[Tartós távollét vége] TEXT(255) NULL,
[Tartós távollét tervezett vége] TEXT(255) NULL,
[Helyettesített dolgozó neve] TEXT(255) NULL,
[Helyettesített dolgozó szerzõdés/kinevezéses munkaköre] TEXT(255) NULL,
[Szerzõdés/Kinevezés - próbaidõ vége] DATETIME NULL,
[Utalási cím] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)] DOUBLE NULL,
[Garantált bérminimumra történõ kiegészítés] TEXT(255) NULL,
[Kerekítés] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérítés nélküli)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérítés nélküli)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérítés nélküli)] DOUBLE NULL,
[Eltérítés %] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérített)] DOUBLE NULL,
[Mezõ191] TEXT(255) NULL,
[Mezõ192] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérített)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérített)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérített)] DOUBLE NULL,
[További munkavégzés helye 1 Teljes munkaidõ %-a] TEXT(255) NULL,
[További munkavégzés helye 2 Teljes munkaidõ %-a] TEXT(255) NULL,
[KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ] DOUBLE NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[AD egyedi azonosító] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mellék] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[További otthoni mobil] TEXT(255) NULL
);

CREATE INDEX [Adójel] ON [tSzemélyek20210101] ([Adójel]);

CREATE INDEX [Jogviszony kezdete (belépés dátuma)] ON [tSzemélyek20210101] ([Jogviszony kezdete (belépés dátuma)]);

CREATE INDEX [Jogviszony vége (kilépés dátuma)] ON [tSzemélyek20210101] ([Jogviszony vége (kilépés dátuma)]);

ALTER TABLE [tSzemélyek20210101] ADD CONSTRAINT [PK_tSzemélyek20210101] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tSzemélyek20220101] (
[Azonosító] LONG NULL,
[Adójel] DOUBLE NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Dolgozó születési neve] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Ügyfélkapu kód] TEXT(255) NULL,
[Elsõdleges állampolgárság] TEXT(255) NULL,
[Személyi igazolvány száma] TEXT(255) NULL,
[Személyi igazolvány érvényesség kezdete] DATETIME NULL,
[Személyi igazolvány érvényesség vége] DATETIME NULL,
[Nyelvtudás Angol] TEXT(255) NULL,
[Nyelvtudás Arab] TEXT(255) NULL,
[Nyelvtudás Bolgár] TEXT(255) NULL,
[Nyelvtudás Cigány] TEXT(255) NULL,
[Nyelvtudás Cigány (lovári)] TEXT(255) NULL,
[Nyelvtudás Cseh] TEXT(255) NULL,
[Nyelvtudás Eszperantó] TEXT(255) NULL,
[Nyelvtudás Finn] TEXT(255) NULL,
[Nyelvtudás Francia] TEXT(255) NULL,
[Nyelvtudás Héber] TEXT(255) NULL,
[Nyelvtudás Holland] TEXT(255) NULL,
[Nyelvtudás Horvát] TEXT(255) NULL,
[Nyelvtudás Japán] TEXT(255) NULL,
[Nyelvtudás Jelnyelv] TEXT(255) NULL,
[Nyelvtudás Kínai] TEXT(255) NULL,
[Nyelvtudás Latin] TEXT(255) NULL,
[Nyelvtudás Lengyel] TEXT(255) NULL,
[Nyelvtudás Német] TEXT(255) NULL,
[Nyelvtudás Norvég] TEXT(255) NULL,
[Nyelvtudás Olasz] TEXT(255) NULL,
[Nyelvtudás Orosz] TEXT(255) NULL,
[Nyelvtudás Portugál] TEXT(255) NULL,
[Nyelvtudás Román] TEXT(255) NULL,
[Nyelvtudás Spanyol] TEXT(255) NULL,
[Nyelvtudás Szerb] TEXT(255) NULL,
[Nyelvtudás Szlovák] TEXT(255) NULL,
[Nyelvtudás Szlovén] TEXT(255) NULL,
[Nyelvtudás Török] TEXT(255) NULL,
[Nyelvtudás Újgörög] TEXT(255) NULL,
[Nyelvtudás Ukrán] TEXT(255) NULL,
[Orvosi vizsgálat idõpontja] DATETIME NULL,
[Orvosi vizsgálat típusa] TEXT(255) NULL,
[Orvosi vizsgálat eredménye] TEXT(255) NULL,
[Orvosi vizsgálat észrevételek] TEXT(255) NULL,
[Orvosi vizsgálat következõ idõpontja] DATETIME NULL,
[Erkölcsi bizonyítvány száma] TEXT(255) NULL,
[Erkölcsi bizonyítvány dátuma] TEXT(255) NULL,
[Erkölcsi bizonyítvány eredménye] TEXT(255) NULL,
[Erkölcsi bizonyítvány kérelem azonosító] TEXT(255) NULL,
[Erkölcsi bizonyítvány közügyektõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány jármûvezetéstõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány intézkedés alatt áll] TEXT(255) NULL,
[Munkaköri leírások (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Kormányhivatal rövid neve] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Szervezeti egység neve] TEXT(255) NULL,
[Szervezeti munkakör neve] TEXT(255) NULL,
[Vezetõi megbízás típusa] TEXT(255) NULL,
[Státusz kódja] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] YESNO NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz neve] TEXT(255) NULL,
[Többes betöltés] YESNO NULL,
[Vezetõ neve] TEXT(255) NULL,
[Vezetõ adóazonosító jele] TEXT(255) NULL,
[Vezetõ email címe] TEXT(255) NULL,
[Állandó lakcím] TEXT(255) NULL,
[Tartózkodási lakcím] TEXT(255) NULL,
[Mezõ76] TEXT(255) NULL,
[Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)] DATETIME NULL,
[Nyugdíjas] YESNO NULL,
[Nyugdíj típusa] TEXT(255) NULL,
[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik] TEXT(255) NULL,
[Megváltozott munkaképesség] YESNO NULL,
[Önkéntes tartalékos katona] YESNO NULL,
[Utolsó vagyonnyilatkozat leadásának dátuma] DATETIME NULL,
[Vagyonnyilatkozat nyilvántartási száma] TEXT(255) NULL,
[Következõ vagyonnyilatkozat esedékessége] DATETIME NULL,
[Nemzetbiztonsági ellenõrzés dátuma] TEXT(255) NULL,
[Védett állományba tartozó munkakör] YESNO NULL,
[Mezõ88] TEXT(255) NULL,
[Vezetõi beosztás megnevezése] TEXT(255) NULL,
[Vezetõi beosztás (megbízás) kezdete] DATETIME NULL,
[Vezetõi beosztás (megbízás) vége] TEXT(255) NULL,
[Iskolai végzettség foka] TEXT(255) NULL,
[Iskolai végzettség neve] TEXT(255) NULL,
[Alapvizsga kötelezés dátuma] TEXT(255) NULL,
[Alapvizsga letétel tényleges határideje] TEXT(255) NULL,
[Alapvizsga mentesség] YESNO NULL,
[Alapvizsga mentesség oka] TEXT(255) NULL,
[Szakvizsga kötelezés dátuma] TEXT(255) NULL,
[Szakvizsga letétel tényleges határideje] TEXT(255) NULL,
[Szakvizsga mentesség] YESNO NULL,
[Foglalkozási viszony] TEXT(255) NULL,
[Foglalkozási viszony statisztikai besorolása] TEXT(255) NULL,
[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban] TEXT(255) NULL,
[Beosztástervezés helyszínek] TEXT(255) NULL,
[Beosztástervezés tevékenységek] TEXT(255) NULL,
[Részleges távmunka szerzõdés kezdete] TEXT(255) NULL,
[Részleges távmunka szerzõdés vége] TEXT(255) NULL,
[Részleges távmunka szerzõdés intervalluma] TEXT(255) NULL,
[Részleges távmunka szerzõdés mértéke] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 2] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 3] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás kezdete] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás vége] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás mértéke] TEXT(255) NULL,
[KIRA feladat azonosítója - intézmény prefix-szel ellátva] TEXT(255) NULL,
[KIRA feladat azonosítója] TEXT(255) NULL,
[KIRA feladat megnevezés] TEXT(255) NULL,
[Osztott munkakör] TEXT(255) NULL,
[Funkciócsoport: kód-megnevezés] TEXT(255) NULL,
[Funkció: kód-megnevezés] TEXT(255) NULL,
[Dolgozó költséghelyének kódja] TEXT(255) NULL,
[Dolgozó költséghelyének neve] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Elsõdleges feladatkör] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker] DOUBLE NULL,
[Szerzõdés/Kinevezés típusa] TEXT(255) NULL,
[Iktatószám] TEXT(255) NULL,
[Mezõ133] DATETIME NULL,
[Mezõ134] DATETIME NULL,
[Mezõ135] TEXT(255) NULL,
[Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Megjegyzés (pl határozott szerzõdés/kinevezés oka)] TEXT(255) NULL,
[Munkavégzés helye - megnevezés] TEXT(255) NULL,
[Munkavégzés helye - cím] TEXT(255) NULL,
[Jogviszony típusa / jogviszony típus] TEXT(255) NULL,
[Jogviszony sorszáma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[Kölcsönbe adó cég] TEXT(255) NULL,
[Teljesítményértékelés - Értékelõ személy] TEXT(255) NULL,
[Teljesítményértékelés - Érvényesség kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak vége] TEXT(255) NULL,
[Teljesítményértékelés dátuma] TEXT(255) NULL,
[Teljesítményértékelés - Beállási százalék] TEXT(255) NULL,
[Teljesítményértékelés - Pontszám] TEXT(255) NULL,
[Teljesítményértékelés - Megjegyzés] TEXT(255) NULL,
[Dolgozói jellemzõk] TEXT(255) NULL,
[Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol] TEXT(255) NULL,
[Besorolási  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos idõ kezdete] TEXT(255) NULL,
[Jogviszony kezdete (belépés dátuma)] DATETIME NULL,
[Jogviszony vége (kilépés dátuma)] DATETIME NULL,
[Utolsó munkában töltött nap] TEXT(255) NULL,
[Kezdeményezés dátuma] DATETIME NULL,
[Hatályossá válik] DATETIME NULL,
[HR kapcsolat megszûnés módja (Kilépés módja)] TEXT(255) NULL,
[HR kapcsolat megszûnes indoka (Kilépés indoka)] TEXT(255) NULL,
[Indokolás] TEXT(255) NULL,
[Következõ munkahely] TEXT(255) NULL,
[MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete] DATETIME NULL,
[Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Tartós távollét kezdete] TEXT(255) NULL,
[Tartós távollét vége] TEXT(255) NULL,
[Tartós távollét tervezett vége] TEXT(255) NULL,
[Helyettesített dolgozó neve] TEXT(255) NULL,
[Helyettesített dolgozó szerzõdés/kinevezéses munkaköre] TEXT(255) NULL,
[Szerzõdés/Kinevezés - próbaidõ vége] DATETIME NULL,
[Utalási cím] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)] DOUBLE NULL,
[Garantált bérminimumra történõ kiegészítés] TEXT(255) NULL,
[Kerekítés] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérítés nélküli)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérítés nélküli)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérítés nélküli)] DOUBLE NULL,
[Eltérítés %] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérített)] DOUBLE NULL,
[Mezõ187] TEXT(255) NULL,
[Mezõ188] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérített)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérített)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérített)] DOUBLE NULL,
[További munkavégzés helye 1 Teljes munkaidõ %-a] TEXT(255) NULL,
[További munkavégzés helye 2 Teljes munkaidõ %-a] TEXT(255) NULL,
[KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ] DOUBLE NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[Szint 6 szervezeti egység név] TEXT(255) NULL,
[Szint 6 szervezeti egység kód] TEXT(255) NULL,
[AD egyedi azonosító] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mellék] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[További otthoni mobil] TEXT(255) NULL
);

CREATE INDEX [Adójel] ON [tSzemélyek20220101] ([Adójel]);

CREATE INDEX [Jogviszony kezdete (belépés dátuma)] ON [tSzemélyek20220101] ([Jogviszony kezdete (belépés dátuma)]);

CREATE INDEX [Jogviszony vége (kilépés dátuma)] ON [tSzemélyek20220101] ([Jogviszony vége (kilépés dátuma)]);

ALTER TABLE [tSzemélyek20220101] ADD CONSTRAINT [PK_tSzemélyek20220101] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tSzemélyek20230101] (
[Azonosító] LONG NULL,
[Adójel] DOUBLE NULL,
[Dolgozó teljes neve] TEXT(255) NULL,
[Dolgozó születési neve] TEXT(255) NULL,
[Születési idõ] DATETIME NULL,
[Születési hely] TEXT(255) NULL,
[Anyja neve] TEXT(255) NULL,
[Neme] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Egyedi azonosító] TEXT(255) NULL,
[Adóazonosító jel] TEXT(255) NULL,
[TAJ szám] TEXT(255) NULL,
[Ügyfélkapu kód] TEXT(255) NULL,
[Elsõdleges állampolgárság] TEXT(255) NULL,
[Személyi igazolvány száma] TEXT(255) NULL,
[Személyi igazolvány érvényesség kezdete] DATETIME NULL,
[Személyi igazolvány érvényesség vége] DATETIME NULL,
[Nyelvtudás Angol] TEXT(255) NULL,
[Nyelvtudás Arab] TEXT(255) NULL,
[Nyelvtudás Bolgár] TEXT(255) NULL,
[Nyelvtudás Cigány] TEXT(255) NULL,
[Nyelvtudás Cigány (lovári)] TEXT(255) NULL,
[Nyelvtudás Cseh] TEXT(255) NULL,
[Nyelvtudás Eszperantó] TEXT(255) NULL,
[Nyelvtudás Finn] TEXT(255) NULL,
[Nyelvtudás Francia] TEXT(255) NULL,
[Nyelvtudás Héber] TEXT(255) NULL,
[Nyelvtudás Holland] TEXT(255) NULL,
[Nyelvtudás Horvát] TEXT(255) NULL,
[Nyelvtudás Japán] TEXT(255) NULL,
[Nyelvtudás Jelnyelv] TEXT(255) NULL,
[Nyelvtudás Kínai] TEXT(255) NULL,
[Nyelvtudás Latin] TEXT(255) NULL,
[Nyelvtudás Lengyel] TEXT(255) NULL,
[Nyelvtudás Német] TEXT(255) NULL,
[Nyelvtudás Norvég] TEXT(255) NULL,
[Nyelvtudás Olasz] TEXT(255) NULL,
[Nyelvtudás Orosz] TEXT(255) NULL,
[Nyelvtudás Portugál] TEXT(255) NULL,
[Nyelvtudás Román] TEXT(255) NULL,
[Nyelvtudás Spanyol] TEXT(255) NULL,
[Nyelvtudás Szerb] TEXT(255) NULL,
[Nyelvtudás Szlovák] TEXT(255) NULL,
[Nyelvtudás Szlovén] TEXT(255) NULL,
[Nyelvtudás Török] TEXT(255) NULL,
[Nyelvtudás Újgörög] TEXT(255) NULL,
[Nyelvtudás Ukrán] TEXT(255) NULL,
[Orvosi vizsgálat idõpontja] DATETIME NULL,
[Orvosi vizsgálat típusa] TEXT(255) NULL,
[Orvosi vizsgálat eredménye] TEXT(255) NULL,
[Orvosi vizsgálat észrevételek] TEXT(255) NULL,
[Orvosi vizsgálat következõ idõpontja] DATETIME NULL,
[Erkölcsi bizonyítvány száma] TEXT(255) NULL,
[Erkölcsi bizonyítvány dátuma] DATETIME NULL,
[Erkölcsi bizonyítvány eredménye] TEXT(255) NULL,
[Erkölcsi bizonyítvány kérelem azonosító] TEXT(255) NULL,
[Erkölcsi bizonyítvány közügyektõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány jármûvezetéstõl eltiltva] TEXT(255) NULL,
[Erkölcsi bizonyítvány intézkedés alatt áll] TEXT(255) NULL,
[Munkaköri leírások (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Kormányhivatal rövid neve] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL,
[Szervezeti egység neve] TEXT(255) NULL,
[Szervezeti munkakör neve] TEXT(255) NULL,
[Vezetõi megbízás típusa] TEXT(255) NULL,
[Státusz kódja] TEXT(255) NULL,
[Státusz költséghelyének kódja] TEXT(255) NULL,
[Státusz költséghelyének neve] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] YESNO NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz neve] TEXT(255) NULL,
[Többes betöltés] YESNO NULL,
[Vezetõ neve] TEXT(255) NULL,
[Vezetõ adóazonosító jele] TEXT(255) NULL,
[Vezetõ email címe] TEXT(255) NULL,
[Állandó lakcím] TEXT(255) NULL,
[Tartózkodási lakcím] TEXT(255) NULL,
[Mezõ78] TEXT(255) NULL,
[Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)] DATETIME NULL,
[Nyugdíjas] YESNO NULL,
[Nyugdíj típusa] TEXT(255) NULL,
[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik] TEXT(255) NULL,
[Megváltozott munkaképesség] YESNO NULL,
[Önkéntes tartalékos katona] YESNO NULL,
[Utolsó vagyonnyilatkozat leadásának dátuma] DATETIME NULL,
[Vagyonnyilatkozat nyilvántartási száma] TEXT(255) NULL,
[Következõ vagyonnyilatkozat esedékessége] DATETIME NULL,
[Nemzetbiztonsági ellenõrzés dátuma] TEXT(255) NULL,
[Védett állományba tartozó munkakör] YESNO NULL,
[Mezõ90] TEXT(255) NULL,
[Vezetõi beosztás megnevezése] TEXT(255) NULL,
[Vezetõi beosztás (megbízás) kezdete] DATETIME NULL,
[Vezetõi beosztás (megbízás) vége] TEXT(255) NULL,
[Iskolai végzettség foka] TEXT(255) NULL,
[Iskolai végzettség neve] TEXT(255) NULL,
[Alapvizsga kötelezés dátuma] DATETIME NULL,
[Alapvizsga letétel tényleges határideje] TEXT(255) NULL,
[Alapvizsga mentesség] YESNO NULL,
[Alapvizsga mentesség oka] TEXT(255) NULL,
[Szakvizsga kötelezés dátuma] TEXT(255) NULL,
[Szakvizsga letétel tényleges határideje] TEXT(255) NULL,
[Szakvizsga mentesség] YESNO NULL,
[Foglalkozási viszony] TEXT(255) NULL,
[Foglalkozási viszony statisztikai besorolása] TEXT(255) NULL,
[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban] TEXT(255) NULL,
[Beosztástervezés helyszínek] TEXT(255) NULL,
[Beosztástervezés tevékenységek] TEXT(255) NULL,
[Részleges távmunka szerzõdés kezdete] TEXT(255) NULL,
[Részleges távmunka szerzõdés vége] TEXT(255) NULL,
[Részleges távmunka szerzõdés intervalluma] TEXT(255) NULL,
[Részleges távmunka szerzõdés mértéke] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 2] TEXT(255) NULL,
[Részleges távmunka szerzõdés helyszíne 3] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás kezdete] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás vége] TEXT(255) NULL,
[Egyéni túlóra keret megállapodás mértéke] TEXT(255) NULL,
[KIRA feladat azonosítója - intézmény prefix-szel ellátva] TEXT(255) NULL,
[KIRA feladat azonosítója] TEXT(255) NULL,
[KIRA feladat megnevezés] TEXT(255) NULL,
[Osztott munkakör] TEXT(255) NULL,
[Funkciócsoport: kód-megnevezés] TEXT(255) NULL,
[Funkció: kód-megnevezés] TEXT(255) NULL,
[Dolgozó költséghelyének kódja] TEXT(255) NULL,
[Dolgozó költséghelyének neve] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Elsõdleges feladatkör] TEXT(255) NULL,
[Feladatok] TEXT(255) NULL,
[FEOR] TEXT(255) NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] DOUBLE NULL,
[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker] DOUBLE NULL,
[Szerzõdés/Kinevezés típusa] TEXT(255) NULL,
[Iktatószám] TEXT(255) NULL,
[Mezõ135] DATETIME NULL,
[Mezõ136] DATETIME NULL,
[Mezõ137] TEXT(255) NULL,
[Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)] TEXT(255) NULL,
[Megjegyzés (pl határozott szerzõdés/kinevezés oka)] TEXT(255) NULL,
[Munkavégzés helye - megnevezés] TEXT(255) NULL,
[Munkavégzés helye - cím] TEXT(255) NULL,
[Jogviszony típusa / jogviszony típus] TEXT(255) NULL,
[Jogviszony sorszáma] DOUBLE NULL,
[KIRA jogviszony jelleg] TEXT(255) NULL,
[Kölcsönbe adó cég] TEXT(255) NULL,
[Teljesítményértékelés - Értékelõ személy] TEXT(255) NULL,
[Teljesítményértékelés - Érvényesség kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak kezdet] TEXT(255) NULL,
[Teljesítményértékelés - Értékelt idõszak vége] TEXT(255) NULL,
[Teljesítményértékelés dátuma] TEXT(255) NULL,
[Teljesítményértékelés - Beállási százalék] TEXT(255) NULL,
[Teljesítményértékelés - Pontszám] TEXT(255) NULL,
[Teljesítményértékelés - Megjegyzés] TEXT(255) NULL,
[Dolgozói jellemzõk] TEXT(255) NULL,
[Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol] TEXT(255) NULL,
[Besorolási  fokozat (KT)] TEXT(255) NULL,
[Jogfolytonos idõ kezdete] DATETIME NULL,
[Jogviszony kezdete (belépés dátuma)] DATETIME NULL,
[Jogviszony vége (kilépés dátuma)] DATETIME NULL,
[Utolsó munkában töltött nap] TEXT(255) NULL,
[Kezdeményezés dátuma] DATETIME NULL,
[Hatályossá válik] DATETIME NULL,
[HR kapcsolat megszûnés módja (Kilépés módja)] TEXT(255) NULL,
[HR kapcsolat megszûnes indoka (Kilépés indoka)] TEXT(255) NULL,
[Indokolás] TEXT(255) NULL,
[Következõ munkahely] TEXT(255) NULL,
[MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete] DATETIME NULL,
[Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)] DATETIME NULL,
[Munkavégzés alóli mentesítés kezdete (KJT, KTTV) Felmentési idõ ] TEXT(255) NULL,
[Munkavégzés alóli mentesítés vége (KJT, KTTV) Felmentési idõ vég] TEXT(255) NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Tartós távollét kezdete] TEXT(255) NULL,
[Tartós távollét vége] TEXT(255) NULL,
[Tartós távollét tervezett vége] TEXT(255) NULL,
[Helyettesített dolgozó neve] TEXT(255) NULL,
[Helyettesített dolgozó szerzõdés/kinevezéses munkaköre] TEXT(255) NULL,
[Szerzõdés/Kinevezés - próbaidõ vége] DATETIME NULL,
[Utalási cím] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)] DOUBLE NULL,
[Garantált bérminimumra történõ kiegészítés] TEXT(255) NULL,
[Kerekítés] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít] TEXT(255) NULL,
[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérítés nélküli)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérítés nélküli)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérítés nélküli)] DOUBLE NULL,
[Eltérítés %] TEXT(255) NULL,
[Alapilletmény / Munkabér / Megbízási díj (eltérített)] DOUBLE NULL,
[Mezõ191] TEXT(255) NULL,
[Mezõ192] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)] TEXT(255) NULL,
[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)] TEXT(255) NULL,
[Egyéb pótlék - összeg (eltérített)] TEXT(255) NULL,
[Illetmény összesen kerekítés nélkül (eltérített)] DOUBLE NULL,
[Kerekített 100 %-os illetmény (eltérített)] DOUBLE NULL,
[További munkavégzés helye 1 Teljes munkaidõ %-a] TEXT(255) NULL,
[További munkavégzés helye 2 Teljes munkaidõ %-a] TEXT(255) NULL,
[KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ] DOUBLE NULL,
[Szint 1 szervezeti egység név] TEXT(255) NULL,
[Szint 1 szervezeti egység kód] TEXT(255) NULL,
[Szint 2 szervezeti egység név] TEXT(255) NULL,
[Szint 2 szervezeti egység kód] TEXT(255) NULL,
[Szint 3 szervezeti egység név] TEXT(255) NULL,
[Szint 3 szervezeti egység kód] TEXT(255) NULL,
[Szint 4 szervezeti egység név] TEXT(255) NULL,
[Szint 4 szervezeti egység kód] TEXT(255) NULL,
[Szint 5 szervezeti egység név] TEXT(255) NULL,
[Szint 5 szervezeti egység kód] TEXT(255) NULL,
[AD egyedi azonosító] TEXT(255) NULL,
[Hivatali email] TEXT(255) NULL,
[Hivatali mobil] TEXT(255) NULL,
[Hivatali telefon] TEXT(255) NULL,
[Hivatali telefon mellék] TEXT(255) NULL,
[Iroda] TEXT(255) NULL,
[Otthoni e-mail] TEXT(255) NULL,
[Otthoni mobil] TEXT(255) NULL,
[Otthoni telefon] TEXT(255) NULL,
[További otthoni mobil] TEXT(255) NULL
);

CREATE INDEX [Adójel] ON [tSzemélyek20230101] ([Adójel]);

CREATE INDEX [Jogviszony kezdete (belépés dátuma)] ON [tSzemélyek20230101] ([Jogviszony kezdete (belépés dátuma)]);

CREATE INDEX [Jogviszony vége (kilépés dátuma)] ON [tSzemélyek20230101] ([Jogviszony vége (kilépés dátuma)]);

ALTER TABLE [tSzemélyek20230101] ADD CONSTRAINT [PK_tSzemélyek20230101] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tSzemélyMezõk] (
[Az] DOUBLE NOT NULL,
[Oszlopnév] TEXT(255) NULL,
[Típus] DOUBLE NULL,
[Mezõnév] TEXT(255) NULL,
[Skip] YESNO NULL
);

ALTER TABLE [tSzemélyMezõk] ADD CONSTRAINT [PK_tSzemélyMezõk] PRIMARY KEY ([Az]);

CREATE TABLE [tSzemélytörzs_összes_oszlopa] (
[Azonosító] LONG NULL,
[F1] TEXT(255) NULL
);

ALTER TABLE [tSzemélytörzs_összes_oszlopa] ADD CONSTRAINT [PK_tSzemélytörzs_összes_oszlopa] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tSzervezeti] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti] ADD CONSTRAINT [PK_tSzervezeti] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tSzervezeti_tart] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti_tart] ADD CONSTRAINT [PK_tSzervezeti_tart] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tSzervezeti2024__12__05__11_12_24] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__05__11_12_24] ADD CONSTRAINT [PK_tSzervezeti2024__12__05__11_12_24] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tSzervezeti2024__12__06__12_45_48] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__06__12_45_48] ADD CONSTRAINT [PK_tSzervezeti2024__12__06__12_45_48] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tSzervezeti2024__12__06__12_53_11] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__06__12_53_11] ADD CONSTRAINT [PK_tSzervezeti2024__12__06__12_53_11] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tSzervezeti2024__12__09__13_08_50] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__09__13_08_50] ADD CONSTRAINT [PK_tSzervezeti2024__12__09__13_08_50] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tSzervezeti2024__12__10__11_57_06] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__10__11_57_06] ADD CONSTRAINT [PK_tSzervezeti2024__12__10__11_57_06] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tSzervezeti2024__12__11__9_04_12] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__11__9_04_12] ADD CONSTRAINT [PK_tSzervezeti2024__12__11__9_04_12] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tSzervezeti2024__12__12__8_20_47] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__12__8_20_47] ADD CONSTRAINT [PK_tSzervezeti2024__12__12__8_20_47] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tSzervezeti2024__12__13__10_15_55] (
[Azonosító] LONG NULL,
[OSZLOPOK] TEXT(255) NULL,
[Szervezetmenedzsment kód] TEXT(255) NULL,
[HR kapcsolat sorszáma] DOUBLE NULL,
[Megnevezés szótárelem kódja] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Rövid név] TEXT(255) NULL,
[Érvényesség kezdete] DATETIME NULL,
[Érvényesség vége] DATETIME NULL,
[Adószám] TEXT(255) NULL,
[KSH szám] TEXT(255) NULL,
[OEP nyilvántartási szám] TEXT(255) NULL,
[Törzsszám] TEXT(255) NULL,
[Székhely cím] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Telephely] TEXT(255) NULL,
[Szervezeti egységek száma (db)] TEXT(255) NULL,
[Betöltött státuszok száma (db)] DOUBLE NULL,
[Betöltetlen státuszok száma (db)] DOUBLE NULL,
[Szint] DOUBLE NULL,
[Szervezeti egység vezetõje] TEXT(255) NULL,
[Szervezeti egység vezetõjének azonosítója] TEXT(255) NULL,
[Kormányhivatal neve] TEXT(255) NULL,
[Költséghely kód] TEXT(255) NULL,
[Költséghely megnevezés] TEXT(255) NULL,
[Szervezeti egység típus] TEXT(255) NULL,
[Szervezeti egység kategória] TEXT(255) NULL,
[Feladatkör] TEXT(255) NULL,
[Engedélyezett vezetõi létszám] TEXT(255) NULL,
[Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Bér F6 besorolási szint megnevezés] TEXT(255) NULL,
[Szervezeti egységének szintje] DOUBLE NULL,
[Munkáltatói jogkört gyakorló] TEXT(255) NULL,
[Szülõ szervezeti egységének kódja] TEXT(255) NULL,
[Szervezeti egységének megnevezése] TEXT(255) NULL,
[Szervezeti egységének vezetõje] TEXT(255) NULL,
[Szervezeti egységének vezetõjének azonosítója] TEXT(255) NULL,
[Szervezeti egységének költséghely kódja] TEXT(255) NULL,
[Szervezeti egységének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti egységének költséghelytõl?] TEXT(255) NULL,
[Szervezeti munkakörének kódja] TEXT(255) NULL,
[Szervezeti munkakörének megnevezése] TEXT(255) NULL,
[Szervezeti munkakörének költséghely kódja] TEXT(255) NULL,
[Szervezeti munkakörének költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a szervezeti munkakörének költséghelyétõl?] TEXT(255) NULL,
[Státuszbetöltéssel rendelkezik a kilépést követõen?] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási kódja] TEXT(255) NULL,
[Szervezeti munkakörének Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6] TEXT(255) NULL,
[Vezetõi státusz] TEXT(255) NULL,
[Képzési költségkeret] TEXT(255) NULL,
[Helyettes vezetõ-e] TEXT(255) NULL,
[Tervezett betöltési adatok - Jogviszony típus] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Kulcsszám megnevezés] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat kód] TEXT(255) NULL,
[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] TEXT(255) NULL,
[Pályáztatás határideje] TEXT(255) NULL,
[Vezetõi beosztás KA] TEXT(255) NULL,
[Vezetõi beosztás KT] TEXT(255) NULL,
[Pályáztatás alatt áll] TEXT(255) NULL,
[Megjegyzés] TEXT(255) NULL,
[Státusz zárolás oka] TEXT(255) NULL,
[Státusz zárolás kezdete] DATETIME NULL,
[Státusz zárolás vége] DATETIME NULL,
[Státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)] DOUBLE NULL,
[Átmeneti óraszám] DOUBLE NULL,
[Átmeneti létszám (FTE)] DOUBLE NULL,
[Közzétett hierarchiában megjelenítendõ] TEXT(255) NULL,
[Asszisztens státusz] TEXT(255) NULL,
[Létszámon felül létrehozott státusz] TEXT(255) NULL,
[Státusz típusa] TEXT(255) NULL,
[Státusz betöltési óraszáma] DOUBLE NULL,
[Státusz betöltési FTE] DOUBLE NULL,
[Helyettesítés mértéke (%)] DOUBLE NULL,
[Helyettesítési díj (%)] DOUBLE NULL,
[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma] DOUBLE NULL,
[Státusz betöltési FTE minusz státusz engedélyezett FTE] DOUBLE NULL,
[Státuszának kódja] TEXT(255) NULL,
[Státuszának neve] TEXT(255) NULL,
[Státuszának az engedélyezett óraszáma] DOUBLE NULL,
[Mezõ82] DOUBLE NULL,
[Aktuális betöltés óraszáma] DOUBLE NULL,
[Aktuális betöltés FTE] DOUBLE NULL,
[Státuszának költséghely kódja] TEXT(255) NULL,
[Státuszának költséghely megnevezése] TEXT(255) NULL,
[A költséghely eltér a státuszának költséghelyétõl?] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint kódja] TEXT(255) NULL,
[Státuszának Bér F6 besorolási szint megnevezése] TEXT(255) NULL,
[Mezõ90] TEXT(255) NULL,
[Mióta betöltetlen a státusz (dátum)] DATETIME NULL,
[Hány napja betöltetlen (munkanap, alapnaptár alapján)] TEXT(255) NULL,
[Státuszbetöltés típusa] TEXT(255) NULL,
[Inaktív állományba kerülés oka] TEXT(255) NULL,
[Tartós távollét kezdete] DATETIME NULL,
[Tartós távollét számított kezdete] DATETIME NULL,
[Tartós távollét vége] DATETIME NULL,
[Tartós távollét típusa] TEXT(255) NULL,
[Elsõdleges] TEXT(255) NULL,
[Státusz vizualizációjában elõször megjelenítendõ] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének kódja] TEXT(255) NULL,
[Betöltõ szerzõdéses/kinevezéses munkakörének neve] TEXT(255) NULL,
[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl] TEXT(255) NULL,
[Betöltõ közvetlen vezetõje] TEXT(255) NULL,
[Betöltõ közvetlen vezetõjének azonosítója] TEXT(255) NULL,
[Szint1 - kód] TEXT(255) NULL,
[Szint1 - leírás] TEXT(255) NULL,
[Szint2 - kód] TEXT(255) NULL,
[Szint2 - leírás] TEXT(255) NULL,
[Szint3 - kód] TEXT(255) NULL,
[Szint3 - leírás] TEXT(255) NULL,
[Szint4 - kód] TEXT(255) NULL,
[Szint4 - leírás] TEXT(255) NULL,
[Szint5 - kód] TEXT(255) NULL,
[Szint5 - leírás] TEXT(255) NULL,
[Szint6 - kód] TEXT(255) NULL,
[Szint6 - leírás] TEXT(255) NULL,
[Szint7 - kód] TEXT(255) NULL,
[Szint7 - leírás] TEXT(255) NULL,
[Szint8 - kód] TEXT(255) NULL,
[Szint8 - leírás] TEXT(255) NULL,
[Szint9 - kód] TEXT(255) NULL,
[Szint9 - leírás] TEXT(255) NULL,
[Szint10 - kód] TEXT(255) NULL,
[Szint10 - leírás] TEXT(255) NULL,
[Szint11 - kód] TEXT(255) NULL,
[Szint11 - leírás] TEXT(255) NULL,
[Szint12 - kód] TEXT(255) NULL,
[Szint12 - leírás] TEXT(255) NULL,
[Szint13 - kód] TEXT(255) NULL,
[Szint13 - leírás] TEXT(255) NULL,
[Szint14 - kód] TEXT(255) NULL,
[Szint14 - leírás] TEXT(255) NULL,
[Szint15 - kód] TEXT(255) NULL,
[Szint15 - leírás] TEXT(255) NULL,
[Asszisztensek száma] DOUBLE NULL,
[Vezetõk száma] DOUBLE NULL,
[HRM-ben lévõ Divízió besorolási adat] TEXT(255) NULL,
[A Divízió érvényességének kezdete] TEXT(255) NULL,
[A Divízió érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szakfeladat besorolási adat] TEXT(255) NULL,
[A Szakfeladat érvényességének kezdete] TEXT(255) NULL,
[A Szakfeladat érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Szolgáltatás besorolási adat] TEXT(255) NULL,
[A Szolgáltatás érvényességének kezdete] TEXT(255) NULL,
[A Szolgáltatás érvényességének vége] TEXT(255) NULL,
[HRM-ben lévõ Forrás besorolási adat] TEXT(255) NULL,
[A Forrás érvényességének kezdete] DATETIME NULL,
[A Forrás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Egység besorolási adat] TEXT(255) NULL,
[Az Egység érvényességének kezdete] DATETIME NULL,
[Az Egység érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Foglalkozási viszony besorolási adat] TEXT(255) NULL,
[A Foglalkozási viszony érvényességének kezdete] DATETIME NULL,
[A Foglalkozási viszony érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Kifizetõhely besorolási adat] TEXT(255) NULL,
[A Kifizetõhely érvényességének kezdete] DATETIME NULL,
[A Kifizetõhely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ költséghely kód besorolási adat] TEXT(255) NULL,
[HRM-ben lévõ költséghely megnevezés besorolási adat] TEXT(255) NULL,
[A Költséghely érvényességének kezdete] DATETIME NULL,
[A Költséghely érvényességének vége] DATETIME NULL,
[HRM-ben lévõ FEOR besorolási adat] TEXT(255) NULL,
[A FEOR érvényességének kezdete] DATETIME NULL,
[A FEOR érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Bérfizetési csoport besorolási adat] TEXT(255) NULL,
[A Bérfizetési csoport érvényességének kezdete] DATETIME NULL,
[A Bérfizetési csoport érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Beosztás besorolási adat] TEXT(255) NULL,
[A Beosztás érvényességének kezdete] DATETIME NULL,
[A Beosztás érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Régió besorolási adat] TEXT(255) NULL,
[A Régió érvényességének kezdete] DATETIME NULL,
[A Régió érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Rendfokozat besorolási adat] TEXT(255) NULL,
[A Rendfokozat érvényességének kezdete] DATETIME NULL,
[A Rendfokozat érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkáltatói besorolási kategória besorolási adat] TEXT(255) NULL,
[A Munkáltatói besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Munkáltatói besorolási kategória érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Munkakör besorolási adat] TEXT(255) NULL,
[A Munkakör érvényességének kezdete] DATETIME NULL,
[A Munkakör érvényességének vége] DATETIME NULL,
[HRM-ben lévõ Besorolási kategória besorolási adat] TEXT(255) NULL,
[A Besorolási kategória érvényességének kezdete] DATETIME NULL,
[A Besorolási kategória érvényességének vége] DATETIME NULL
);

ALTER TABLE [tSzervezeti2024__12__13__10_15_55] ADD CONSTRAINT [PK_tSzervezeti2024__12__13__10_15_55] PRIMARY KEY ([Azonosító],[Szervezetmenedzsment kód],[Szervezeti egység típus],[Szervezeti egység kategória],[Feladatkör],[Státusz típusa],[Státuszának kódja]);

CREATE TABLE [tSzervezetiEgységek] (
[azSzervezet] LONG NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL
);

ALTER TABLE [tSzervezetiEgységek] ADD CONSTRAINT [PK_tSzervezetiEgységek] PRIMARY KEY ([azSzervezet]);

CREATE TABLE [tSzervezetiEgységek1] (
[azSzervezet] LONG NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Szervezeti egység kódja] TEXT(255) NULL
);

ALTER TABLE [tSzervezetiEgységek1] ADD CONSTRAINT [PK_tSzervezetiEgységek1] PRIMARY KEY ([azSzervezet]);

CREATE TABLE [tSzobák] (
[azSzoba] LONG NULL,
[Szobaszám] TEXT(255) NULL
);

ALTER TABLE [tSzobák] ADD CONSTRAINT [PK_tSzobák] PRIMARY KEY ([azSzoba]);

CREATE TABLE [tSzolgálatiIdõElismerés] (
[Azonosító1] LONG NULL,
[Szervezeti egység kód] TEXT(255) NULL,
[Szervezeti egység] TEXT(255) NULL,
[Jogviszony típus] TEXT(255) NULL,
[Név] TEXT(255) NULL,
[Azonosító] TEXT(255) NULL,
[Szerzõdés/kinevezéses munkakör] TEXT(255) NULL,
[Mezõ7] DOUBLE NULL,
[Szolgálati elismerésre jogosultság / Jubileumi jutalom kezdõ dát] TEXT(255) NULL,
[Tervezett esedékesség 20 éves] TEXT(255) NULL,
[Jogosító hónapok száma 20 éves] TEXT(255) NULL,
[Tervezett összeg 20 éves  (Ft)] DOUBLE NULL,
[Mezõ12] TEXT(255) NULL,
[Jogosító hónapok száma 25 éves] TEXT(255) NULL,
[Mezõ14] DOUBLE NULL,
[Mezõ15] TEXT(255) NULL,
[Jogosító hónapok száma 30 éves] TEXT(255) NULL,
[Mezõ17] DOUBLE NULL,
[Mezõ18] TEXT(255) NULL,
[Jogosító hónapok száma 35 éves] TEXT(255) NULL,
[Mezõ20] DOUBLE NULL,
[Mezõ21] TEXT(255) NULL,
[Jogosító hónapok száma 40 éves] TEXT(255) NULL,
[Mezõ23] DOUBLE NULL,
[Tervezett esedékesség 45 éves] TEXT(255) NULL,
[Jogosító hónapok száma 45 éves] TEXT(255) NULL,
[Tervezett összeg 45 éves (Ft)] DOUBLE NULL,
[Tervezett esedékesség 50 éves] TEXT(255) NULL,
[Jogosító hónapok száma 50 éves] TEXT(255) NULL,
[Tervezett összeg 50 éves (Ft)] DOUBLE NULL,
[Tervezett esedékesség 55 éves] TEXT(255) NULL,
[Jogosító hónapok száma 55 éves] TEXT(255) NULL,
[Tervezett összeg 55 éves (Ft)] DOUBLE NULL,
[Mezõ33] TEXT(255) NULL,
[Mezõ34] TEXT(255) NULL,
[Mezõ35] TEXT(255) NULL,
[Mezõ36] TEXT(255) NULL,
[Mezõ37] DOUBLE NULL
);

CREATE INDEX [Azonosító] ON [tSzolgálatiIdõElismerés] ([Azonosító]);

ALTER TABLE [tSzolgálatiIdõElismerés] ADD CONSTRAINT [PK_tSzolgálatiIdõElismerés] PRIMARY KEY ([Azonosító1]);

CREATE TABLE [tTáblamezõk] (
[táblanév] TEXT(255) NULL,
[mezõnév] TEXT(255) NULL,
[sorszám] LONG NULL,
[típusa] TEXT(255) NULL
);

CREATE TABLE [tTelefonkonyv] (
[Vezetéknév] TEXT(255) NULL,
[Utónév] TEXT(255) NULL,
[Teljes név] TEXT(255) NULL,
[Munkakör] TEXT(255) NULL,
[Kormányhivatal] TEXT(255) NULL,
[E-mail cím] TEXT(255) NULL,
[Külsõ vezetékes telefonszám] TEXT(255) NULL,
[Belsõ vezetékes telefonszám] TEXT(255) NULL,
[Mobiltelefonszám] TEXT(255) NULL,
[Külsõ fax szám] TEXT(255) NULL,
[Belsõ fax szám] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL,
[Járási osztály] TEXT(255) NULL,
[Levelezési cím] TEXT(255) NULL,
[Emelet] TEXT(255) NULL,
[Szobaszám] TEXT(255) NULL,
[Város] TEXT(255) NULL,
[Irányítószám] TEXT(255) NULL,
[Település] TEXT(255) NULL,
[Utca] TEXT(255) NULL,
[Épület] TEXT(255) NULL,
[Felhasználónév] TEXT(255) NULL,
[Leírás] TEXT(255) NULL
);

CREATE TABLE [tTelefonszámMinták] (
[Azonosító] LONG NULL,
[Minta] TEXT(255) NULL,
[Elõhívó] YESNO NULL,
[Körzetszám] YESNO NULL,
[Fõvárosi] YESNO NULL,
[Vidék] YESNO NULL,
[Mobil] YESNO NULL,
[Mellék] YESNO NULL
);

ALTER TABLE [tTelefonszámMinták] ADD CONSTRAINT [PK_tTelefonszámMinták] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tTelephelyek] (
[Azonosító] LONG NULL,
[Mezõ1] TEXT(255) NULL,
[Szervezeti egység] TEXT(255) NULL,
[SzervezetKód] TEXT(255) NULL,
[Cím] TEXT(255) NULL
);

ALTER TABLE [tTelephelyek] ADD CONSTRAINT [PK_tTelephelyek] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tTelephelyek230301] (
[Sorszám] DOUBLE NULL,
[Irsz] DOUBLE NULL,
[Város] TEXT(255) NULL,
[Cím] TEXT(255) NULL,
[Nexon cím] TEXT(255) NULL,
[Tulajdonos] TEXT(255) NULL,
[Üzemeltetõ] TEXT(255) NULL,
[Mezõ7] TEXT(255) NULL,
[Cím (másolt)] TEXT(255) NULL
);

CREATE INDEX [Cím] ON [tTelephelyek230301] ([Cím]);

ALTER TABLE [tTelephelyek230301] ADD CONSTRAINT [PK_tTelephelyek230301] PRIMARY KEY ([Sorszám]);

CREATE TABLE [tTmp] (
[Azonosító] LONG NULL,
[F1] TEXT(255) NULL
);

ALTER TABLE [tTmp] ADD CONSTRAINT [PK_tTmp] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tTmpEgyesMunkakörökFõosztályai] (
[Azonosító] LONG NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL
);

ALTER TABLE [tTmpEgyesMunkakörökFõosztályai] ADD CONSTRAINT [PK_tTmpEgyesMunkakörökFõosztályai] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tTmpLog] (
[azLog] LONG NULL,
[Bejegyzés] TEXT(255) NULL,
[BejegyzésTárgya] TEXT(255) NULL,
[bejegyzés idõpontja] DATETIME NULL,
[FolyamatHASH] TEXT(255) NULL,
[logszint] BYTE NULL,
[felhasználó] TEXT(255) NULL,
[számítógép] TEXT(255) NULL,
[adatbázis] TEXT(255) NULL
);

CREATE TABLE [tÚjSzervezetiTábla] (
[Azonosító] LONG NULL,
[BFKH kód] TEXT(255) NULL,
[Fõosztály] TEXT(255) NULL,
[Osztály] TEXT(255) NULL
);

ALTER TABLE [tÚjSzervezetiTábla] ADD CONSTRAINT [PK_tÚjSzervezetiTábla] PRIMARY KEY ([Azonosító]);

CREATE TABLE [tUnionCsoportok] (
[azUnion] LONG NULL,