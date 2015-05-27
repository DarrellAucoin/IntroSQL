### Quiz: Normalization

Normalize the following table:

| Student Name | Quest ID | Course | Description | Section |
|--------------|----------|--------|-------------|---------|
| | | | | |

<center>
![alt text](https://github.com/NormallySane/IntroSQL/blob/master/Images/quiz1sol.png)
</center>

### Quiz: Relational Algebra

__Q1:__ What kind of operation is performed on the following table?
<center>
![alt text](https://github.com/NormallySane/IntroSQL/blob/master/Images/quiz2a.png)
</center>

- Projection: Projection is returning a subset of the columns in a table

__Q2:__ What kind of operation is performed on the following table?
<center>
![alt text](https://github.com/NormallySane/IntroSQL/blob/master/Images/quiz2b.png)
</center>

- Selection: Selection is a returning a subset of the rows in a table.

__Q3:__ What kinds of joins can performed on tables?

- Natural Join: Join based on common columns (names and datatypes have to be the same)
- Θ-Join: Join based on a comparison operator between two columns 
    - Equijoin: Join based on equality between columns

### Quiz: SELECT Clause

Calculate the average of 2 random numbers.

```sql
SELECT (RANDOM() + RANDOM())/2.;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>(RANDOM() + RANDOM())/2.</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> 3.993871e+17</td>
    </tr>
  </tbody>
</table>
</div>



__Q:__ What is the upper and lower case for the string __'UPPER or lower'__?

```sql
SELECT UPPER('UPPER or lower'), LOWER('UPPER or lower')
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>UPPER('UPPER or lower')</th>
      <th>LOWER('UPPER or lower')</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> UPPER OR LOWER</td>
      <td> upper or lower</td>
    </tr>
  </tbody>
</table>
</div>

### Quiz: FROM Clause

__Q:__ Who are the execs for Stats Club, and what are their positions, and
emails?
- Projection of name, position, and email from the table exec

```sql
SELECT name, position, email
FROM exec;
```

<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>position</th>
      <th>email</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>    Darrell Aucoin</td>
      <td>     President</td>
      <td> darrell.aucoin@gmail.com</td>
    </tr>
    <tr>
      <th>1</th>
      <td> Judith B. Gibbons</td>
      <td>        Events</td>
      <td>      judith@uwaterloo.ca</td>
    </tr>
    <tr>
      <th>2</th>
      <td>         Lamar Roy</td>
      <td>       Finance</td>
      <td>       lamar@uwaterloo.ca</td>
    </tr>
    <tr>
      <th>3</th>
      <td>    Gilberto Cross</td>
      <td>        Events</td>
      <td>    gilberto@uwaterloo.ca</td>
    </tr>
    <tr>
      <th>4</th>
      <td>        Melba Lane</td>
      <td>     President</td>
      <td>       melba@uwaterloo.ca</td>
    </tr>
    <tr>
      <th>5</th>
      <td>        Ruben Lamb</td>
      <td>    Technology</td>
      <td>       ruben@uwaterloo.ca</td>
    </tr>
    <tr>
      <th>6</th>
      <td>      Hannah Mason</td>
      <td> SeniorAdvisor</td>
      <td>      hannah@uwaterloo.ca</td>
    </tr>
    <tr>
      <th>7</th>
      <td> Patrick Robertson</td>
      <td>        Events</td>
      <td>     patrick@uwaterloo.ca</td>
    </tr>
    <tr>
      <th>8</th>
      <td>     Dominick Byrd</td>
      <td>        Events</td>
      <td>    dominick@uwaterloo.ca</td>
    </tr>
  </tbody>
</table>
</div>

### Quiz: DISTINCT

__Q:__ What are the __distinct__ majors of Stats Club members?

```sql
SELECT DISTINCT major
FROM member;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>major</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>        Stats</td>
    </tr>
    <tr>
      <th>1</th>
      <td>    Pure Math</td>
    </tr>
    <tr>
      <th>2</th>
      <td>           CS</td>
    </tr>
    <tr>
      <th>3</th>
      <td> Applied Math</td>
    </tr>
    <tr>
      <th>4</th>
      <td>      Act Sci</td>
    </tr>
    <tr>
      <th>5</th>
      <td>        C &amp; O</td>
    </tr>
    <tr>
      <th>6</th>
      <td>         Econ</td>
    </tr>
  </tbody>
</table>
</div>



__Q:__ How many __distinct__ majors of Stats Club members are there?

- DISTINCT can be within aggregate functions

```sql
SELECT COUNT(DISTINCT major)
FROM member;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>COUNT(DISTINCT major)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> 7</td>
    </tr>
  </tbody>
</table>
</div>

###  Quiz: Aliases

Perform a query using a table alias, and use this table alias when referencing
the column i.e. `table_alias.column_name`
- This will be really important for bigger, more complicated queries

```sql
SELECT e.name, e.start_time, e.location, e.Description
FROM event AS e;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>start_time</th>
      <th>location</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>             BOT</td>
      <td> 2015-01-28 19:00:00</td>
      <td>   C &amp; D</td>
      <td> Come and play games with your fellow stats Clu...</td>
    </tr>
    <tr>
      <th>1</th>
      <td>             EOT</td>
      <td>                None</td>
      <td>    None</td>
      <td> End of Term social at a local Pub. A joint eve...</td>
    </tr>
    <tr>
      <th>2</th>
      <td> Intro to Hadoop</td>
      <td>                None</td>
      <td>    None</td>
      <td> Hadoop is a distributed computing system desig...</td>
    </tr>
    <tr>
      <th>3</th>
      <td>    Intro to SQL</td>
      <td> 2015-02-05 18:00:00</td>
      <td> MC-3003</td>
      <td> SQL is a relational database language and alon...</td>
    </tr>
    <tr>
      <th>4</th>
      <td>       Prof Talk</td>
      <td>                None</td>
      <td>    None</td>
      <td>                                              None</td>
    </tr>
    <tr>
      <th>5</th>
      <td>  Intro to SQL 2</td>
      <td>                None</td>
      <td>    None</td>
      <td> SQL is a relational database language and alon...</td>
    </tr>
    <tr>
      <th>6</th>
      <td>     Prof Talk 2</td>
      <td>                None</td>
      <td>    None</td>
      <td>                                              None</td>
    </tr>
    <tr>
      <th>7</th>
      <td>     Prof Talk 3</td>
      <td>                None</td>
      <td>    None</td>
      <td>                                              None</td>
    </tr>
  </tbody>
</table>
</div>

# Presentation 2
### Quiz: Filtering (WHERE Clause)

__Q:__ What events for Stats Club are introductory talks?
- Introductory talk names start with 'Intro'

```sql
SELECT name
FROM event
WHERE name LIKE 'Intro%';
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
      <td> Intro to Hadoop</td>
    </tr>
    <tr>
      <th>1</th>
      <td>    Intro to SQL</td>
    </tr>
    <tr>
      <th>2</th>
      <td>  Intro to SQL 2</td>
    </tr>
  </tbody>
</table>
</div>



__Q:__ What Stats Club members have their first name starting with a letter
__BETWEEN__ A and G?

```sql
SELECT name
FROM member
WHERE name BETWEEN 'A' AND 'G';
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
      <th>0 </th>
      <td>      Darrell Aucoin</td>
    </tr>
    <tr>
      <th>1 </th>
      <td>       Fred E. Finch</td>
    </tr>
    <tr>
      <th>2 </th>
      <td>     Billy L. Hunter</td>
    </tr>
    <tr>
      <th>3 </th>
      <td>  Austin K. Gilliard</td>
    </tr>
    <tr>
      <th>4 </th>
      <td>       Elaine S. Ott</td>
    </tr>
    <tr>
      <th>5 </th>
      <td>     Daniel J. Moore</td>
    </tr>
    <tr>
      <th>6 </th>
      <td>   Frances A. Miller</td>
    </tr>
    <tr>
      <th>7 </th>
      <td> Deborah D. Helfrich</td>
    </tr>
    <tr>
      <th>8 </th>
      <td>   Bobbie D. Mathews</td>
    </tr>
    <tr>
      <th>9 </th>
      <td>    Arnold J. Fuller</td>
    </tr>
    <tr>
      <th>10</th>
      <td>   Ann W. McLaughlin</td>
    </tr>
    <tr>
      <th>11</th>
      <td>       Dominick Byrd</td>
    </tr>
  </tbody>
</table>
</div>

### Quiz: Practice Questions

__Q:__ What events have dates specified?

```sql
SELECT name, start_time
FROM event
WHERE start_time IS NOT NULL;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>start_time</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>          BOT</td>
      <td> 2015-01-28 19:00:00</td>
    </tr>
    <tr>
      <th>1</th>
      <td> Intro to SQL</td>
      <td> 2015-02-05 18:00:00</td>
    </tr>
  </tbody>
</table>
</div>



__Q:__ What events don't have dates specified?

```sql
SELECT name
FROM event
WHERE start_time IS NULL;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>name</th>
      <th>start_time</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>             EOT</td>
      <td> None</td>
    </tr>
    <tr>
      <th>1</th>
      <td> Intro to Hadoop</td>
      <td> None</td>
    </tr>
    <tr>
      <th>2</th>
      <td>       Prof Talk</td>
      <td> None</td>
    </tr>
    <tr>
      <th>3</th>
      <td>  Intro to SQL 2</td>
      <td> None</td>
    </tr>
    <tr>
      <th>4</th>
      <td>     Prof Talk 2</td>
      <td> None</td>
    </tr>
    <tr>
      <th>5</th>
      <td>     Prof Talk 3</td>
      <td> None</td>
    </tr>
  </tbody>
</table>
</div>



__Q:__ What Stats Club members are in Stats, Act Sci, or CS?
- Recall the `IN` predicate operator

```sql
SELECT name
FROM member
WHERE major in ('Stats', 'Act Sci', 'CS');
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
      <th>0 </th>
      <td>        Darrell Aucoin</td>
    </tr>
    <tr>
      <th>1 </th>
      <td>          Ryan T. Luby</td>
    </tr>
    <tr>
      <th>2 </th>
      <td>       Billy L. Hunter</td>
    </tr>
    <tr>
      <th>3 </th>
      <td> Stephanie R. Matthews</td>
    </tr>
    <tr>
      <th>4 </th>
      <td>    Robert B. Williams</td>
    </tr>
    <tr>
      <th>5 </th>
      <td>    Austin K. Gilliard</td>
    </tr>
    <tr>
      <th>6 </th>
      <td>      James M. Eddings</td>
    </tr>
    <tr>
      <th>7 </th>
      <td>         Elaine S. Ott</td>
    </tr>
    <tr>
      <th>8 </th>
      <td>         James A. Foxt</td>
    </tr>
    <tr>
      <th>9 </th>
      <td>       Daniel J. Moore</td>
    </tr>
    <tr>
      <th>10</th>
      <td>     Kelly S. Ferguson</td>
    </tr>
    <tr>
      <th>11</th>
      <td>      Vivian R. Donley</td>
    </tr>
    <tr>
      <th>12</th>
      <td>     Frances A. Miller</td>
    </tr>
    <tr>
      <th>13</th>
      <td>      Mina W. Lawrence</td>
    </tr>
    <tr>
      <th>14</th>
      <td> Phillip C. Mascarenas</td>
    </tr>
    <tr>
      <th>15</th>
      <td>        Jeff M. Wright</td>
    </tr>
    <tr>
      <th>16</th>
      <td>   Deborah D. Helfrich</td>
    </tr>
    <tr>
      <th>17</th>
      <td>      Nancy P. Jackson</td>
    </tr>
    <tr>
      <th>18</th>
      <td>     Bobbie D. Mathews</td>
    </tr>
    <tr>
      <th>19</th>
      <td>      Arnold J. Fuller</td>
    </tr>
    <tr>
      <th>20</th>
      <td>      Ralph L. Waldrop</td>
    </tr>
    <tr>
      <th>21</th>
      <td>   Tameika M. McMaster</td>
    </tr>
    <tr>
      <th>22</th>
      <td>   Melissa R. Anderson</td>
    </tr>
    <tr>
      <th>23</th>
      <td>     Ann W. McLaughlin</td>
    </tr>
    <tr>
      <th>24</th>
      <td>     Judith B. Gibbons</td>
    </tr>
    <tr>
      <th>25</th>
      <td>            Ruben Lamb</td>
    </tr>
    <tr>
      <th>26</th>
      <td>     Patrick Robertson</td>
    </tr>
  </tbody>
</table>
</div>



__Q:__ What are the Stats Club exec positions?
- Avoid duplication of positions

```sql
SELECT DISTINCT position
FROM exec_position;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>position</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>         Events</td>
    </tr>
    <tr>
      <th>1</th>
      <td>        Finance</td>
    </tr>
    <tr>
      <th>2</th>
      <td>      President</td>
    </tr>
    <tr>
      <th>3</th>
      <td> Senior Advisor</td>
    </tr>
    <tr>
      <th>4</th>
      <td>     Technology</td>
    </tr>
  </tbody>
</table>
</div>



__Q:__ How many different Stats Club exec positions are there?
- Note that we can use DISTINCT within aggregate functions
- There is a one-to-many relationship between exec and exec_positions


```sql
SELECT COUNT(DISTINCT position) AS num_exec_positions
FROM exec_position;
```



<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>num_exec_positions</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td> 5</td>
    </tr>
  </tbody>
</table>
</div>

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

__Q:__ Where can a Correlated subquery can be placed?

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

<center>
(MathSoc Members) * 7
</center>
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

- The average of the score values for all of the foods at Stats Club events.

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


### Quiz: ORDER BY and LIMIT Clause

__Q:__ What are the top 10 highest priced items in expenses?

```
SELECT expense, price
FROM expenses
ORDER BY price
LIMIT 10;
```


<div style="max-height:1000px;max-width:1500px;overflow:auto;">
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>expense</th>
      <th>price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>   water</td>
      <td> 10.23</td>
    </tr>
    <tr>
      <th>1</th>
      <td> cookies</td>
      <td> 10.23</td>
    </tr>
    <tr>
      <th>2</th>
      <td> cookies</td>
      <td> 10.23</td>
    </tr>
    <tr>
      <th>3</th>
      <td> cookies</td>
      <td> 10.23</td>
    </tr>
    <tr>
      <th>4</th>
      <td>   water</td>
      <td> 10.52</td>
    </tr>
    <tr>
      <th>5</th>
      <td>   water</td>
      <td> 10.52</td>
    </tr>
    <tr>
      <th>6</th>
      <td>     pop</td>
      <td> 13.23</td>
    </tr>
    <tr>
      <th>7</th>
      <td>     pop</td>
      <td> 13.23</td>
    </tr>
    <tr>
      <th>8</th>
      <td>     pop</td>
      <td> 15.34</td>
    </tr>
    <tr>
      <th>9</th>
      <td>     pop</td>
      <td> 15.65</td>
    </tr>
  </tbody>
</table>
</div>
