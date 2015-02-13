### Quiz: Aggregation (GROUP BY Clause)

__Q:__ What is the attendance for each Stats Club event?

```sql
SELECT event, COUNT(*) AS attendance
FROM attendance
GROUP BY event;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>event</th>
      <th>attendance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>             BOT</td>
      <td> 12</td>
    </tr>
    <tr>
      <th>1</th>
      <td>             EOT</td>
      <td> 18</td>
    </tr>
    <tr>
      <th>2</th>
      <td> Intro to Hadoop</td>
      <td> 17</td>
    </tr>
    <tr>
      <th>3</th>
      <td>    Intro to SQL</td>
      <td> 22</td>
    </tr>
    <tr>
      <th>4</th>
      <td>  Intro to SQL 2</td>
      <td> 23</td>
    </tr>
    <tr>
      <th>5</th>
      <td>       Prof Talk</td>
      <td> 20</td>
    </tr>
    <tr>
      <th>6</th>
      <td>     Prof Talk 2</td>
      <td> 16</td>
    </tr>
  </tbody>
</table>
</div>


### Quiz: Joining Tables

__Q:__ What are the email addresses and phone numbers of stats club execs who
are in change or organizing at least one event?
<center>
![alt text](https://github.com/NormallySane/IntroSQL/blob/master/Images/StatClubTables2.png)
</center>

```sql
SELECT DISTINCT exec.name, exec.email, exec.phone
FROM exec INNER JOIN event ON exec.questid = event.organizer;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>email</th>
      <th>phone</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> Judith B. Gibbons</td>
      <td>      judith@uwaterloo.ca</td>
      <td> 519-555-2343</td>
    </tr>
    <tr>
      <th>1</th>
      <td>     Dominick Byrd</td>
      <td>    dominick@uwaterloo.ca</td>
      <td> 519-555-2325</td>
    </tr>
    <tr>
      <th>2</th>
      <td>    Darrell Aucoin</td>
      <td> darrell.aucoin@gmail.com</td>
      <td> 519-555-1424</td>
    </tr>
    <tr>
      <th>3</th>
      <td> Patrick Robertson</td>
      <td>     patrick@uwaterloo.ca</td>
      <td> 519-555-2312</td>
    </tr>
  </tbody>
</table>
</div>


### Quiz: Subqueries

__Q:__ Where can a Non-Correlated subquery can be placed?

__A:__ in the __FROM__, __WHERE__, and __HAVING__ clauses

__Q:__ Where can a Non-Correlated subquery can be placed?

__A:__ in the __SELECT__, __WHERE__, and __HAVING__ clauses

__Q:__ Using a non-correlated subquery, what are the names, locations, and
descriptions of events that served pizza?
1. Break the problem into smaller pieces: What are the events that served pizza?
2. Only retrieve values from the table `event` that `event.name` matches those
values

```sql
SELECT event
FROM expenses
WHERE expense = 'pizza';
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>event</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>          BOT</td>
    </tr>
    <tr>
      <th>1</th>
      <td> Intro to SQL</td>
    </tr>
    <tr>
      <th>2</th>
      <td>    Prof Talk</td>
    </tr>
    <tr>
      <th>3</th>
      <td>  Prof Talk 2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>  Prof Talk 3</td>
    </tr>
  </tbody>
</table>
</div>



- Second, only retrieve values from the table `event` that `event.name` matches
those values

```sql
SELECT name, location, description
FROM event
WHERE name IN (SELECT event FROM expenses WHERE expense = 'pizza');
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>location</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>          BOT</td>
      <td>   C &amp; D</td>
      <td> Come and play games with your fellow stats Clu...</td>
    </tr>
    <tr>
      <th>1</th>
      <td> Intro to SQL</td>
      <td> MC-3003</td>
      <td> SQL is a relational database language and alon...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>    Prof Talk</td>
      <td>    None</td>
      <td>                                              None</td>
    </tr>
    <tr>
      <th>3</th>
      <td>  Prof Talk 2</td>
      <td>    None</td>
      <td>                                              None</td>
    </tr>
    <tr>
      <th>4</th>
      <td>  Prof Talk 3</td>
      <td>    None</td>
      <td>                                              None</td>
    </tr>
  </tbody>
</table>
</div>



Or alternatively, using a join:

```sql
SELECT e.name, e.location, e.description
FROM (SELECT event FROM expenses WHERE expense = 'pizza') AS exp INNER JOIN
event AS e
  ON exp.event = e.name;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>e.name</th>
      <th>e.location</th>
      <th>e.description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>          BOT</td>
      <td>   C &amp; D</td>
      <td> Come and play games with your fellow stats Clu...</td>
    </tr>
    <tr>
      <th>1</th>
      <td> Intro to SQL</td>
      <td> MC-3003</td>
      <td> SQL is a relational database language and alon...</td>
    </tr>
    <tr>
      <th>2</th>
      <td>    Prof Talk</td>
      <td>    None</td>
      <td>                                              None</td>
    </tr>
    <tr>
      <th>3</th>
      <td>  Prof Talk 2</td>
      <td>    None</td>
      <td>                                              None</td>
    </tr>
    <tr>
      <th>4</th>
      <td>  Prof Talk 3</td>
      <td>    None</td>
      <td>                                              None</td>
    </tr>
  </tbody>
</table>
</div>


### Quiz: WITH Clause (HARD)

__Q:__ MathSoc only provides a maximum cap on social events based on the formula
below. What is the max cap for social expenses and is Stats Club over this
limit?
- Membership fee for Stats Club is 2 dollars

<center>
Social expenses = max {250, (MathSoc Members) * (5 + (Member fee) )}   
</center>
<center>
Social expenses = max {250, (MathSoc Members) * 7}
</center>

Break the problem into smaller problems:
- What are the total expenses for social events?
- What is the max budget for social events?

Smaller Problems:
- What are the total expenses for social events?
    - What events are social events?

- What is the max cap for social events?
    - What is the result of the formula  
    <center>(MathSoc Members) * 7</center>
        - What are the number of Stats Club members who are in the Math Faculty
(aka MathSoc members)?
    - How do we find the max value between this number and 250?

### Think about how to solve this for 5 mins

For total social expenses, we need to find the sum of expenses filtering out
non-social expenses.
__Part 1:__ What events are social?

```sql
SELECT name
FROM event
WHERE type = 'social';
```

<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> BOT</td>
    </tr>
    <tr>
      <th>1</th>
      <td> EOT</td>
    </tr>
  </tbody>
</table>
</div>



__Part 2:__ What are the total social expenses?

```sql
SELECT SUM(price)
FROM expenses
WHERE event IN (SELECT name FROM event WHERE type = 'social');
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>SUM(price)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> 219.22</td>
    </tr>
  </tbody>
</table>
</div>



Or alternatively, we can join tables event and expenses and filter out non-
social events:

```sql
SELECT SUM(exp.price)
FROM event AS e INNER JOIN expenses AS exp
  ON e.name = exp.event
WHERE e.type = 'social';
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>SUM(exp.price)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> 219.22</td>
    </tr>
  </tbody>
</table>
</div>



At this point we have one half of the problem solved, the final result would
look a bit like:  

```sql
WITH soc_cost (expense) AS
    (SELECT SUM(exp.price)
     FROM event AS e INNER JOIN expenses AS exp
       ON e.name = exp.event
     WHERE type = 'social'),
soc_budget (budget) AS
     (SELECT statement)
SELECT statement;
```

__Part 3:__ We need to calculate the formula
$$\left(\mbox{MathSoc Members}\right)\times7$$
- First, what is the number of MathSoc Members (aka number of members who are in
the Math Faculty)?

```sql
SELECT COUNT(*)
FROM member
WHERE faculty = 'Math';
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>COUNT(*)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> 33</td>
    </tr>
  </tbody>
</table>
</div>



__Part 4:__ What is the result of the formula  
<center>
(MathSoc Members) * 7
</center>  

```sql
SELECT COUNT(*) * 7
FROM member
WHERE faculty = 'Math';
```



<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>COUNT(*) * 7</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> 231</td>
    </tr>
  </tbody>
</table>
</div>



__Part 5:__ What is the max of this number and 250?

```sql
SELECT MAX(soc_budget)
FROM (SELECT COUNT(*) * 7 AS soc_budget
      FROM member
      WHERE faculty = 'Math'
      UNION
      SELECT 250);
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Max(soc_budget)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> 250</td>
    </tr>
  </tbody>
</table>
</div>



Joining all of this up together:

```sql
WITH soc_cost (expense) AS
    (SELECT SUM(exp.price)
     FROM event AS e INNER JOIN expenses AS exp
       ON e.name = exp.event
     WHERE e.type = 'social'),
soc_budget (budget) AS
    (SELECT Max(soc_budget)
     FROM (SELECT COUNT(*) * 7 AS soc_budget
           FROM member
           WHERE faculty = 'Math'
           UNION
           SELECT 250)
    )
SELECT expense, budget, budget - expense
FROM soc_cost CROSS JOIN soc_budget;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>expense</th>
      <th>budget</th>
      <th>budget - expense</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> 219.22</td>
      <td> 250</td>
      <td> 30.78</td>
    </tr>
  </tbody>
</table>
</div>


### Quiz: CASE Expressions

__Q:__ Suppose we are interested in the healthiness of our food options at Stats
Club events. A score of various foods was given below. What is the average
'healthiness' of Stats Club events?


| Food | Score |
|------|-------|
| donuts | -2 |
| pop | -2 |
| fries | -2 |
| pizza | -1 |
| cookies | -1 |
| coffee | 0 |
| water | 2 |
| meals | 2 |
| veggie platter | 3 |

```sql
SELECT AVG(CASE
    WHEN expense IN ('donuts', 'pop', 'fries') THEN -2
    WHEN expense IN ('pizza', 'cookies') THEN -1
    WHEN expense IN ('coffee') THEN 0
    WHEN expense IN ('water', 'meals') THEN 2
    WHEN expense IN ('veggie platter') THEN 3
END) AS avg_score
FROM expenses;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>avg_score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>-0.818182</td>
    </tr>
  </tbody>
</table>
</div>


