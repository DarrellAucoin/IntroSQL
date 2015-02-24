/* GROUP BY Clause */

SELECT type, COUNT(*) AS num_events 
FROM event 
GROUP BY type;

/* HAVING Clause */

SELECT faculty, major, COUNT(*) 
FROM member 
GROUP BY faculty, major 
HAVING COUNT(*) >= 2;

/* GROUP BY WITH ROLLUP/CUBE not implemented in SQLite */

/* CROSS JOIN */

SELECT m1.name AS Player_1, m2.name  AS Player_2 
FROM member AS m1 CROSS JOIN member AS m2;

SELECT m1.name AS Player_1, m2.name  AS Player_2 
FROM member AS m1 CROSS JOIN member AS m2 
WHERE m1.name > m2.name;

/* INNER JOIN */

SELECT m1.name AS Player_1, m2.name  AS Player_2 
FROM member AS m1 INNER JOIN member AS m2 ON m1.name > m2.name;

SELECT at.name, at.faculty, at.major, COUNT(a.event) AS events_attended 
FROM (member AS m INNER JOIN attendance AS a ON m.quest_id = a.member) AS at 
GROUP BY at.quest_id, at.name, at.faculty, at.major
ORDER BY events_attended;

/* OUTER JOIN */

SELECT at.name, at.faculty, at.major, COUNT(a.event) AS events_attended 
FROM (member AS m LEFT OUTER JOIN attendance AS a ON m.quest_id = a.member) AS at 
GROUP BY at.quest_id, at.name, at.faculty, at.major
ORDER BY events_attended;

/* NATURAL JOIN */

SELECT  e.name, e.position, ep.duties 
FROM exec AS e NATURAL JOIN exec_position AS ep;

/* Non-Correlated Subquery */

SELECT e.name, e.position 
FROM exec AS e 
WHERE e.questid IN (SELECT poster FROM event);

/* Correlated Subquery */

SELECT name, position, 
(SELECT faculty FROM member AS m WHERE m.quest_id = e.questid) AS faulty, 
(SELECT major FROM member AS m WHERE m.quest_id = e.questid) AS major 
FROM exec AS e;

/* UNION set Operation */

SELECT name, email, NULL AS phone 
FROM member 
UNION 
SELECT name, email, phone 
FROM exec;

/* Intersection set Operation */

SELECT name, quest_id 
FROM member 
INTERSECT 
SELECT name, questid 
FROM exec;

/* Difference set Operation */

SELECT name, quest_id 
FROM member 
EXCEPT 
SELECT name, questid 
FROM exec;


/* WITH Clause */

WITH cost (event, expenses) AS 
    (SELECT event, SUM(price) 
    FROM expenses 
    GROUP BY event) 
SELECT e.name, e.type, e.budget, cost.expenses 
FROM event AS e INNER JOIN cost ON e.name = cost.event;

/* CASE Expressions */

WITH cost (event, expenses) AS 
    (SELECT event, SUM(price) 
    FROM expenses 
    GROUP BY event) 
SELECT e.name, e.type, e.budget, cost.expenses, 
    CASE 
    WHEN e.budget - cost.expenses < 0 THEN 'Over budget' 
    ELSE NULL
    END AS warning 
FROM event AS e INNER JOIN cost ON e.name = cost.event;

/* ORDER BY Clause */

SELECT name
FROM member
ORDER BY name;

/* LIMIT Clause */

SELECT name
FROM member
ORDER BY name
LIMIT 10;