SELECT tH�napok.h�nap AS [Tart�s t�voll�t v�ge], Sum(lkTTv�ge02.[2024_�v]) AS [2024 �v], Sum(lkTTv�ge02.[2025_�v]) AS [2025 �v], Sum([2026_�v]) AS [2026 �v]
FROM tH�napok INNER JOIN lkTTv�ge02 ON tH�napok.Azonos�t� = lkTTv�ge02.V�geH�
GROUP BY tH�napok.h�nap, lkTTv�ge02.V�geH�
ORDER BY lkTTv�ge02.V�geH�;
