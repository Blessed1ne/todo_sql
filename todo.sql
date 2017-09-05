Brians-MacBook-Pro:Desktop briankibagendi$ createdb todolistdb
Brians-MacBook-Pro:Desktop briankibagendi$ psql todolistdb
psql (9.6.5)
Type "help" for help.

todolistdb=# CREATE TABLE todos (
todolistdb(# todoID SERIAL PRIMARY KEY,
todolistdb(# title VARCHAR(255) NOT NULL,
todolistdb(# details text,
todolistdb(# priority integer(1) NOT NULL,
todolistdb(# created_at timestamp NOT NULL,
todolistdb(# completed_at timestamp
todolistdb(# );
ERROR:  syntax error at or near "("
LINE 5: priority integer(1) NOT NULL,
                        ^
todolistdb=# CREATE TABLE todos (
todoID SERIAL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
details text,
priority integer  NOT NULL,
created_at timestamp NOT NULL,
completed_at timestamp
);
CREATE TABLE
todolistdb=# \dt
            List of relations
 Schema | Name  | Type  |     Owner
--------+-------+-------+----------------
 public | todos | table | briankibagendi
(1 row)

todolistdb=# INSERT INTO todos(title,details,priority) VALUES('Car','Oil change','1');
ERROR:  null value in column "created_at" violates not-null constraint
DETAIL:  Failing row contains (1, Car, Oil change, 1, null, null).
todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Car','Oil change','1',);
ERROR:  syntax error at or near ")"
LINE 1: ...etails,priority,created_at) VALUES('Car','Oil change','1',);
                                                                     ^
todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Car','Oil change','1','2017-04-08');
INSERT 0 1
todolistdb=# SELECT * FROM todos;
 todoid | title |  details   | priority |     created_at      | completed_at
--------+-------+------------+----------+---------------------+--------------
      2 | Car   | Oil change |        1 | 2017-04-08 00:00:00 |
(1 row)

todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Food','Grocery shop','2','2017-04-08 07:00:00');
INSERT 0 1
todolistdb=# SELECT * FROM todos;
 todoid | title |   details    | priority |     created_at      | completed_at
--------+-------+--------------+----------+---------------------+--------------
      2 | Car   | Oil change   |        1 | 2017-04-08 00:00:00 |
      3 | Food  | Grocery shop |        2 | 2017-04-08 07:00:00 |
(2 rows)

todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Hospital','Annual checkup','3','2017-07-07 08:00:00');
INSERT 0 1
todolistdb=# SELECT * FROM todos;
 todoid |  title   |    details     | priority |     created_at      | completed_at
--------+----------+----------------+----------+---------------------+--------------
      2 | Car      | Oil change     |        1 | 2017-04-08 00:00:00 |
      3 | Food     | Grocery shop   |        2 | 2017-04-08 07:00:00 |
      4 | Hospital | Annual checkup |        3 | 2017-07-07 08:00:00 |
(3 rows)

todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Pick up','Grab from school','4','2017-08-08 06:30:00');
INSERT 0 1
todolistdb=# SELECT * FROM todos;
 todoid |  title   |     details      | priority |     created_at      | completed_at
--------+----------+------------------+----------+---------------------+--------------
      2 | Car      | Oil change       |        1 | 2017-04-08 00:00:00 |
      3 | Food     | Grocery shop     |        2 | 2017-04-08 07:00:00 |
      4 | Hospital | Annual checkup   |        3 | 2017-07-07 08:00:00 |
      5 | Pick up  | Grab from school |        4 | 2017-08-08 06:30:00 |
(4 rows)

todolistdb=# INSERT INTO todos(title,details,priority,created_at) VALUES('Dinner','Cook dinner','5','2017-08-08 05:25:00');
INSERT 0 1
todolistdb=# SELECT * FROM todos;
 todoid |  title   |     details      | priority |     created_at      | completed_at
--------+----------+------------------+----------+---------------------+--------------
      2 | Car      | Oil change       |        1 | 2017-04-08 00:00:00 |
      3 | Food     | Grocery shop     |        2 | 2017-04-08 07:00:00 |
      4 | Hospital | Annual checkup   |        3 | 2017-07-07 08:00:00 |
      5 | Pick up  | Grab from school |        4 | 2017-08-08 06:30:00 |
      6 | Dinner   | Cook dinner      |        5 | 2017-08-08 05:25:00 |
(5 rows)

todolistdb=# UPDATE todos SET completed_at = '2017-08-08 05:25:00'WHERE'todoid = 2;
todolistdb'# SELECT * FROM todos;
todolistdb'#
todolistdb'# SELECT * FROM todos;
todolistdb'# UPDATE todos SET completed_at = current_timestamp WHERE todoid = 2;
todolistdb'# SELECT * FROM todos;
todolistdb'# ';
ERROR:  invalid input syntax for type boolean: "todoid = 2;
SELECT * FROM todos;

SELECT * FROM todos;
UPDATE todos SET completed_at = current_timestamp WHERE todoid = 2;
SELECT * FROM todos;
"
LINE 1: ...odos SET completed_at = '2017-08-08 05:25:00'WHERE'todoid = ...
                                                             ^
todolistdb=# UPDATE todos SET completed_at = current_timestamp WHERE todoid = 2;
UPDATE 1
todolistdb=# select * from todos;
 todoid |  title   |     details      | priority |     created_at      |        completed_at
--------+----------+------------------+----------+---------------------+----------------------------
      3 | Food     | Grocery shop     |        2 | 2017-04-08 07:00:00 |
      4 | Hospital | Annual checkup   |        3 | 2017-07-07 08:00:00 |
      5 | Pick up  | Grab from school |        4 | 2017-08-08 06:30:00 |
      6 | Dinner   | Cook dinner      |        5 | 2017-08-08 05:25:00 |
      2 | Car      | Oil change       |        1 | 2017-04-08 00:00:00 | 2017-09-05 14:19:50.924242
(5 rows)

todolistdb=# SELECT * FROM todos WHERE created_at = IS NULL;
ERROR:  syntax error at or near "NULL"
LINE 1: SELECT * FROM todos WHERE created_at = IS NULL;
                                                  ^
todolistdb=# SELECT * FROM todos WHERE created_at = IS NULL;
ERROR:  syntax error at or near "NULL"
LINE 1: SELECT * FROM todos WHERE created_at = IS NULL;
                                                  ^
todolistdb=# SELECT * FROM todos WHERE completed_at is null;
 todoid |  title   |     details      | priority |     created_at      | completed_at
--------+----------+------------------+----------+---------------------+--------------
      3 | Food     | Grocery shop     |        2 | 2017-04-08 07:00:00 |
      4 | Hospital | Annual checkup   |        3 | 2017-07-07 08:00:00 |
      5 | Pick up  | Grab from school |        4 | 2017-08-08 06:30:00 |
      6 | Dinner   | Cook dinner      |        5 | 2017-08-08 05:25:00 |
(4 rows)

todolistdb=# SELECT * FROM todos WHERE priority > 1
todolistdb-# SELECT * FROM todos WHERE priority > 1;
ERROR:  syntax error at or near "SELECT"
LINE 2: SELECT * FROM todos WHERE priority > 1;
        ^
todolistdb=# SELECT * FROM todos WHERE priority > 1;
 todoid |  title   |     details      | priority |     created_at      | completed_at
--------+----------+------------------+----------+---------------------+--------------
      3 | Food     | Grocery shop     |        2 | 2017-04-08 07:00:00 |
      4 | Hospital | Annual checkup   |        3 | 2017-07-07 08:00:00 |
      5 | Pick up  | Grab from school |        4 | 2017-08-08 06:30:00 |
      6 | Dinner   | Cook dinner      |        5 | 2017-08-08 05:25:00 |
(4 rows)

todolistdb=# DELETE FROM todos WHERE completed_at IS NOT NULL;
DELETE 1
todolistdb=# SELECT * FROM todos;
 todoid |  title   |     details      | priority |     created_at      | completed_at
--------+----------+------------------+----------+---------------------+--------------
      3 | Food     | Grocery shop     |        2 | 2017-04-08 07:00:00 |
      4 | Hospital | Annual checkup   |        3 | 2017-07-07 08:00:00 |
      5 | Pick up  | Grab from school |        4 | 2017-08-08 06:30:00 |
      6 | Dinner   | Cook dinner      |        5 | 2017-08-08 05:25:00 |
(4 rows)

todolistdb=#
