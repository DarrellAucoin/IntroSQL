/* SELECT Clause */

SELECT 1, 2, 'this is a string', 1/2;

SELECT 1, 2, 'this is a string', 1/2, 4/2, 5/2, 1/2., 1./2, 1/CAST(2 AS FLOAT);

/* The following two statements produce the same table. */

SELECT 1, 2, 'this is a string', 1/2;

SELECT 1,
2,
             'this is a string',   1/2;


/* SQL Functions */

SELECT ABS(-8), LENGTH('This is a String'), LOWER('ThIS Is A StRiNg'), RANDOM();

/* FROM Clause */

SELECT name, type, start_time, end_time, location 
FROM event;

/* Aggregate Functions */

SELECT COUNT( 12 ), COUNT('ssdf'), COUNT(NULL), SUM(23), SUM(0), SUM(NULL),
  AVG(0), AVG(NULL);

SELECT COUNT(*), COUNT(string), COUNT(floating), AVG(number), SUM(number),
GROUP_CONCAT(string, ' ')
FROM example;

/* DISTINCT */

SELECT DISTINCT event
FROM attendance;

/* Aliases */

SELECT COUNT(*) AS num_rows, COUNT(string) AS num_strings,
  COUNT(floating) AS num_float, AVG(number) AS avg_integer,
  SUM(number) AS sum_int, GROUP_CONCAT(string, ' ') AS cat_string
FROM example;

/* WHERE Clause */

SELECT name, type, start_time, end_time, location 
FROM event 
WHERE type = 'social';

/* LIKE Prediate */

SELECT * 
FROM member 
WHERE name LIKE 'F%';

/* AND, OR Operators */

SELECT name
FROM member
WHERE name LIKE '_a%' OR  name LIKE '%b';

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