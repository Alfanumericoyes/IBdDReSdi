
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Iker$Books         |
| Iker$MASTERBASE    |
| Iker$default       |
| information_schema |
| performance_schema |
+--------------------+
5 rows in set (0.02 sec)

mysql> show tables;
+----------------------+
| Tables_in_Iker$Books |
+----------------------+
| AUTHORS              |
| BOOKS                |
| CATEGORIES           |
+----------------------+
3 rows in set (0.00 sec)

mysql> select * 
    -> from AUTHORS
    -> INNER join BOOKS
    -> on AUTHORS.ID=BOOKS.AUTHORID;
+----+----------+----+--------+-------+------------+----------+
| ID | NAME     | ID | NAME   | PRICE | CATEGORYID | AUTHORID |
+----+----------+----+--------+-------+------------+----------+
|  2 | Author-B |  1 | Book-A |   100 |          1 |        2 |
|  2 | Author-B |  2 | Book-B |   200 |          2 |        2 |
|  2 | Author-B |  3 | Book-C |   150 |          3 |        2 |
|  1 | Author-A |  4 | Book-D |   100 |          3 |        1 |
|  1 | Author-A |  5 | Book-E |   200 |          3 |        1 |
|  1 | Author-A |  6 | Book-F |   150 |          4 |        1 |
+----+----------+----+--------+-------+------------+----------+
6 rows in set (0.00 sec)

mysql> select *
    -> from AUTHORS
    -> left outer join BOOKS
    -> on AUTHORS.ID=BOOKS.AUTHORID;
+----+----------+------+--------+-------+------------+----------+
| ID | NAME     | ID   | NAME   | PRICE | CATEGORYID | AUTHORID |
+----+----------+------+--------+-------+------------+----------+
|  1 | Author-A |    6 | Book-F |   150 |          4 |        1 |
|  1 | Author-A |    5 | Book-E |   200 |          3 |        1 |
|  1 | Author-A |    4 | Book-D |   100 |          3 |        1 |
|  2 | Author-B |    3 | Book-C |   150 |          3 |        2 |
|  2 | Author-B |    2 | Book-B |   200 |          2 |        2 |
|  2 | Author-B |    1 | Book-A |   100 |          1 |        2 |
|  3 | Author-C | NULL | NULL   |  NULL |       NULL |     NULL |
| 10 | Author-D | NULL | NULL   |  NULL |       NULL |     NULL |
| 12 | Author-E | NULL | NULL   |  NULL |       NULL |     NULL |
+----+----------+------+--------+-------+------------+----------+
9 rows in set (0.00 sec)

mysql> select * 
    -> from AUTHORS
    -> right outer join BOOKS
    -> on AUTHORS.ID=BOOKS.AUTHORID;
+------+----------+----+--------+-------+------------+----------+
| ID   | NAME     | ID | NAME   | PRICE | CATEGORYID | AUTHORID |
+------+----------+----+--------+-------+------------+----------+
|    2 | Author-B |  1 | Book-A |   100 |          1 |        2 |
|    2 | Author-B |  2 | Book-B |   200 |          2 |        2 |
|    2 | Author-B |  3 | Book-C |   150 |          3 |        2 |
|    1 | Author-A |  4 | Book-D |   100 |          3 |        1 |
|    1 | Author-A |  5 | Book-E |   200 |          3 |        1 |
|    1 | Author-A |  6 | Book-F |   150 |          4 |        1 |
| NULL | NULL     |  7 | Book-G |   100 |          5 |        5 |
| NULL | NULL     |  8 | Book-H |   200 |          5 |        6 |
| NULL | NULL     |  9 | Book-I |   150 |          7 |        8 |
+------+----------+----+--------+-------+------------+----------+
9 rows in set (0.00 sec)

mysql> select *
    -> from AUTHORS
    -> left join BOOKS
    -> on AUTHORS.ID=BOOKS.AUTHORID
    -> where BOOKS.AUTHORID is null;
+----+----------+------+------+-------+------------+----------+
| ID | NAME     | ID   | NAME | PRICE | CATEGORYID | AUTHORID |
+----+----------+------+------+-------+------------+----------+
|  3 | Author-C | NULL | NULL |  NULL |       NULL |     NULL |
| 10 | Author-D | NULL | NULL |  NULL |       NULL |     NULL |
| 12 | Author-E | NULL | NULL |  NULL |       NULL |     NULL |
+----+----------+------+------+-------+------------+----------+
3 rows in set (0.00 sec)

mysql> select *
    -> from AUTHORS
    -> right join BOOKS 
    -> on AUTHORS.ID=BOOKS.AUTHORID
    -> where AUTHORS.ID is null;
+------+------+----+--------+-------+------------+----------+
| ID   | NAME | ID | NAME   | PRICE | CATEGORYID | AUTHORID |
+------+------+----+--------+-------+------------+----------+
| NULL | NULL |  7 | Book-G |   100 |          5 |        5 |
| NULL | NULL |  8 | Book-H |   200 |          5 |        6 |
| NULL | NULL |  9 | Book-I |   150 |          7 |        8 |
+------+------+----+--------+-------+------------+----------+
3 rows in set (0.00 sec)

mysql> select * from AUTHORS left join BOOKS on AUTHORS.ID=BOOKS.AUTHORID where BOOKS.AUTHORID is null
    -> UNION ALL
    -> select * from AUTHORS right join BOOKS  on AUTHORS.ID=BOOKS.AUTHORID where AUTHORS.ID is null;
+------+----------+------+--------+-------+------------+----------+
| ID   | NAME     | ID   | NAME   | PRICE | CATEGORYID | AUTHORID |
+------+----------+------+--------+-------+------------+----------+
|    3 | Author-C | NULL | NULL   |  NULL |       NULL |     NULL |
|   10 | Author-D | NULL | NULL   |  NULL |       NULL |     NULL |
|   12 | Author-E | NULL | NULL   |  NULL |       NULL |     NULL |
| NULL | NULL     |    7 | Book-G |   100 |          5 |        5 |
| NULL | NULL     |    8 | Book-H |   200 |          5 |        6 |
| NULL | NULL     |    9 | Book-I |   150 |          7 |        8 |
+------+----------+------+--------+-------+------------+----------+
6 rows in set (0.00 sec)
