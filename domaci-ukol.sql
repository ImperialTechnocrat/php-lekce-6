# Vypište všechny učitele kteří neučí žádný předmět

SELECT t.name
FROM teacher t
LEFT JOIN class_subject cs ON cs.teacher_id = t.id
WHERE cs.id IS NULL

# Vypište všechny žáky, kteří mají alespoň jednu 5 a zároveň vypište kolik jich mají

SELECT DISTINCT p.name
FROM pupil p
JOIN pupil_subject ps ON p.id = ps.pupil_id
WHERE ps.grade = 5

# Vypište průměr pro každou třídu

SELECT AVG(ps.grade), c.name
FROM class_subject cs
JOIN pupil_subject ps ON ps.subject_id = cs.subject_id
JOIN class c ON c.id = cs.class_id
GROUP BY c.name

# Vypiště průměr pro každý ročník

SELECT AVG(ps.grade), c.year
FROM class_subject cs
JOIN pupil_subject ps ON ps.subject_id = cs.subject_id
JOIN class c ON c.id = cs.class_id
GROUP BY c.year


# Vypište všechny učitele, kteří učí svojí třídu alespoň na jeden předmět

SELECT t.name
FROM class c
JOIN teacher t ON c.homeroom_teacher_id = t.id
JOIN class_subject cs ON cs.class_id = c.id
WHERE teacher_id = homeroom_teacher_id

# Vypište průměrnou známku pro každý předmět a ročník

SELECT s.name, AVG(ps.grade)
FROM class c
JOIN class_subject cs ON cs.class_id = c.id
JOIN pupil_subject ps ON ps.subject_id = cs.subject_id
JOIN subject s ON s.id = cs.subject_id
GROUP BY s.name

# Vypište hitpárádu 5 lidumilů a 5 drsňáků, tj. 5 učitelů s nejlepší průměrem známek na předmětech,
které učí a 5 učitelů s nejhorším průměrem známek

SELECT t.name, AVG(ps.grade)
FROM teacher t
JOIN class_subject cs ON cs.teacher_id = t.id
JOIN pupil_subject ps ON cs.subject_id = ps.subject_id
GROUP BY t.name
ORDER BY AVG(ps.grade)
LIMIT 5;

SELECT t.name, AVG(ps.grade)
FROM teacher t
JOIN class_subject cs ON cs.teacher_id = t.id
JOIN pupil_subject ps ON cs.subject_id = ps.subject_id
GROUP BY t.name
ORDER BY AVG(ps.grade) DESC
LIMIT 5;
