SELECT lkkorfa02.Korcsoport, IIf([Neme]="f�rfi",[CountofAd�jel],0) AS F�rfi, IIf([Neme]="f�rfi",0,[CountofAd�jel]) AS N�
FROM lkkorfa02;
