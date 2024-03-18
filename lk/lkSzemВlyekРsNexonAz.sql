SELECT lkSzemélyek.*, kt_azNexon_Adójel02.azNexon, kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel=lkSzemélyek.Adójel;
