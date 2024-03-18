SELECT tMentességek.*, [Családnév] & " " & [Utónév] AS Név, IIf([Születési hely] Like "Budapest*","Budapest",[Születési hely]) AS SzülHely
FROM tMentességek;
