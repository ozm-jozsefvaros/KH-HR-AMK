SELECT lkSzem�lyek.*, kt_azNexon_Ad�jel02.azNexon, kt_azNexon_Ad�jel02.NLink
FROM kt_azNexon_Ad�jel02 RIGHT JOIN lkSzem�lyek ON kt_azNexon_Ad�jel02.Ad�jel=lkSzem�lyek.Ad�jel;
