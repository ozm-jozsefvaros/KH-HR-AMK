SELECT lkkorfa02.Korcsoport, IIf([Neme]="férfi",[CountofAdójel],0) AS Férfi, IIf([Neme]="férfi",0,[CountofAdójel]) AS Nõ
FROM lkkorfa02;
