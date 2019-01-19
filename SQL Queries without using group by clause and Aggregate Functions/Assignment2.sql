CREATE DATABASE SM;

\connect sm;

create table Student(sid integer,sname varchar(15),primary key(sid));
create table Major(sid integer,major varchar(15),primary key(sid,major),foreign key(sid) references Student(sid));
create table Book(bookno integer,title varchar(30),price integer,primary key(bookno));
create table Cites(bookno integer,citedbookno integer,primary key(bookno,citedbookno),foreign key(bookno) references Book(bookno));
create table Buys(sid integer,bookno integer,primary key(sid,bookno),foreign key(sid) references Student(sid),foreign key(bookno) references Book(bookno));

--inserting into Student
  insert into student values('1001',' Jean');
  insert into student values('1002',' Maria');
  insert into student values('1003',' Anna ');
  insert into student values('1004',' Chin ');
  insert into student values('1005',' John ');
  insert into student values('1006',' Ryan');
  insert into student values('1007',' Catherine ');
  insert into student values('1008',' Emma ');
  insert into student values('1009',' Jan ');
  insert into student values('1010',' Linda');
  insert into student values('1011',' Nick ');
  insert into student values('1012',' Eric ');
  insert into student values('1013',' Lisa ');
  insert into student values('1014',' Filip');
  insert into student values('1015',' Dirk ');
  insert into student values('1016',' Mary ');
  insert into student values('1017',' Ellen ');
  insert into student values('1020',' Greg ');
  insert into student values('1022',' Qin ');
  insert into student values('1023',' Melanie ');
  insert into student values('1040',' Pam');

--inserting into Major
insert into major values('1001','Math');
insert into major values('1001','Physics');
insert into major values('1002','CS');
insert into major values('1002','Math');
insert into major values('1003','Math');
insert into major values('1004','CS');
insert into major values('1006','CS');
insert into major values('1007','CS');
insert into major values('1007','Physics');
insert into major values('1008','Physics');
insert into major values('1009','Biology');
insert into major values('1010','Biology');
insert into major values('1011','CS');
insert into major values('1011','Math');
insert into major values('1012','CS');
insert into major values('1013','CS');
insert into major values('1013','Psychology');
insert into major values('1014','Theater');
insert into major values('1017','Anthropology');
insert into major values('1022','CS');
insert into major values('1015','Chemistry');

--inserting into Book
insert into book values('2001','Databases','40');
insert into book values('2002','OperatingSystems','25');
insert into book values('2003','Networks','20');
insert into book values('2004','AI','45');
insert into book values('2005','DiscreteMathematics','20');
insert into book values('2006','SQL','25');
insert into book values('2007','ProgrammingLanguages','15');
insert into book values('2008','DataScience','50');
insert into book values('2009','Calculus','10');
insert into book values('2010','Philosophy','25');
insert into book values('2012','Geometry','80');
insert into book values('2013','RealAnalysis','35');
insert into book values('2011','Anthropology','50');
insert into book values('2014','Topology','70');

--inserting into Cites
insert into cites values('2012','2001');
insert into cites values('2008','2011');
insert into cites values('2008','2012');
insert into cites values('2001','2002');
insert into cites values('2001','2007');
insert into cites values('2002','2003');
insert into cites values('2003','2001');
insert into cites values('2003','2004');
insert into cites values('2003','2002');
insert into cites values('2010','2001');
insert into cites values('2010','2002');
insert into cites values('2010','2003');
insert into cites values('2010','2004');
insert into cites values('2010','2005');
insert into cites values('2010','2006');
insert into cites values('2010','2007');
insert into cites values('2010','2008');
insert into cites values('2010','2009');
insert into cites values('2010','2011');
insert into cites values('2010','2013');
insert into cites values('2010','2014');

--inserting into Buys
insert into buys values('1023','2012');
insert into buys values('1023','2014');
insert into buys values('1040','2002');
insert into buys values('1001','2002');
insert into buys values('1001','2007');
insert into buys values('1001','2009');
insert into buys values('1001','2011');
insert into buys values('1001','2013');
insert into buys values('1002','2001');
insert into buys values('1002','2002');
insert into buys values('1002','2007');
insert into buys values('1002','2011');
insert into buys values('1002','2012');
insert into buys values('1002','2013');
insert into buys values('1003','2002');
insert into buys values('1003','2007');
insert into buys values('1003','2011');
insert into buys values('1003','2012');
insert into buys values('1003','2013');
insert into buys values('1004','2006');
insert into buys values('1004','2007');
insert into buys values('1004','2008');
insert into buys values('1004','2011');
insert into buys values('1004','2012');
insert into buys values('1004','2013');
insert into buys values('1005','2007');
insert into buys values('1005','2011');
insert into buys values('1005','2012');
insert into buys values('1005','2013');
insert into buys values('1006','2006');
insert into buys values('1006','2007');
insert into buys values('1006','2008');
insert into buys values('1006','2011');
insert into buys values('1006','2012');
insert into buys values('1006','2013');
insert into buys values('1007','2001');
insert into buys values('1007','2002');
insert into buys values('1007','2003');
insert into buys values('1007','2007');
insert into buys values('1007','2008');
insert into buys values('1007','2009');
insert into buys values('1007','2010');
insert into buys values('1007','2011');
insert into buys values('1007','2012');
insert into buys values('1007','2013');
insert into buys values('1008','2007');
insert into buys values('1008','2011');
insert into buys values('1008','2012');
insert into buys values('1008','2013');
insert into buys values('1009','2001');
insert into buys values('1009','2002');
insert into buys values('1009','2011');
insert into buys values('1009','2012');
insert into buys values('1009','2013');
insert into buys values('1010','2001');
insert into buys values('1010','2002');
insert into buys values('1010','2003');
insert into buys values('1010','2011');
insert into buys values('1010','2012');
insert into buys values('1010','2013');
insert into buys values('1011','2002');
insert into buys values('1011','2011');
insert into buys values('1011','2012');
insert into buys values('1012','2011');
insert into buys values('1012','2012');
insert into buys values('1013','2001');
insert into buys values('1013','2011');
insert into buys values('1013','2012');
insert into buys values('1014','2008');
insert into buys values('1014','2011');
insert into buys values('1014','2012');
insert into buys values('1017','2001');
insert into buys values('1017','2002');
insert into buys values('1017','2003');
insert into buys values('1017','2008');
insert into buys values('1017','2012');
insert into buys values('1020','2001');
insert into buys values('1020','2012');
insert into buys values('1022','2014');

\echo 1.
select sid,major from major where sid in(select sid from buys where bookno in(select bookno from book where price<20));
\echo 2.
select bookno,title from book where price>=20 and price<=40 and bookno in (select citedbookno from cites);
\echo 3.
select sid,sname from student where sid in (select sid from major where major='CS' and sid in (select sid from buys where bookno in  (select b1.bookno from book b1,book b2 where b1.bookno in(select citedbookno from cites) and b2.bookno in (select bookno from cites) and b2.price<b1.price)));
\echo 4.
select bookno,title from book where bookno in(select c.citedbookno from cites c where c.bookno in(select c1.citedbookno from cites c1) ) order by bookno;
\echo 5.
select bookno from book where price<=ALL(select price from book);
\echo 6.
select bookno,title from book
EXCEPT
(select b1.bookno,b1.title from book b1,book b2 where b1.price<b2.price and b1.bookno<>b2.bookno);
\echo 7.
select bookno,title from book where price >=ALL
(select price from book where bookno in
(select bookno from book
EXCEPT
(select bookno from book where price>=ALL(select price from book))))
EXCEPT (select bookno,title from book where price>=ALL(select price from book));
\echo 8.
select bookno, price from book where bookno in
(select citedbookno from cites where citedbookno in
(select bookno from cites where citedbookno in
(select bookno from book where price >20))
UNION (select bookno from book where bookno not in(select citedbookno from cites))) order by bookno;
\echo 9.
select bookno,title from book where bookno in(select bookno from buys where sid in(select sid from major where major='Biology' or major='Psychology')) order by bookno;
\echo 10.
select b.bookno,b.title from book b where exists((select m.sid from major m where m.major='CS') EXCEPT(select b1.sid from buys b1 where b1.bookno=b.bookno)) order by b.bookno;
\echo 11.
select b.bookno from book b where NOT EXISTS ((select b1.sid from buys b1 where b1.bookno=b.bookno) EXCEPT (select m.sid from major m where m.major='Biology')) order by b.bookno;
\echo 12.
select b.bookno,b.title from book b where NOT EXISTS(((select m.sid from major m where m.major='CS') INTERSECT(select m1.sid from major m1 where m1.major='Math')) EXCEPT (select b1.sid from buys b1 where b1.bookno=b.bookno)) order by b.bookno;
\echo 13.
select sid,sname from student where sid in
(select sid from buys where bookno not in(
(select b.bookno from book b where exists
(select b1.sid,b2.sid from buys b1,buys b2 where b1.bookno=b.bookno and b2.bookno=b.bookno and b1.sid<>b2.sid and
 b1.sid in(select sid from major where major='CS')and b2.sid in(select sid from major where major='CS')))));

\echo 14.
select sid,sname from student EXCEPT
(select s.sid,s.sname from student s where exists
(select b1.bookno,b2.bookno from buys b1,buys b2 where b1.sid=s.sid and b2.sid=s.sid and b1.bookno<>b2.bookno and b1.bookno in
(select b.bookno from book b where b.price>20) and b2.bookno in
(select b.bookno from book b where b.price>20))) order by sid;
\echo 15.
select b.sid as s,b.bookno as b from buys b where bookno in (select bookno from book where price<=ALL(
select price from book where bookno in(select b1.bookno from buys b1 where b1.sid=b.sid )
)) order by sid;

\echo 16.
select count(1)
from
(select distinct m1.sid,m2.sid from major m1,major m2 where m1.sid<>m2.sid and m1.major=m2.major
and exists
((select b.bookno from buys b where b.sid=m1.sid and b.bookno not in
(select b3.bookno from buys b3 where b3.sid=m2.sid))
UNION
(select b.bookno from buys b where b.sid=m2.sid and b.bookno not in
(select b4.bookno from buys b4 where b4.sid=m1.sid))))c;

\echo 17.

select count(1)
from
(select s1.sid,s2.sid,b.bookno from student s1,student s2,book b where s1.sid<>s2.sid
 and exists
(select b1.bookno from buys b1 where b1.sid=s1.sid and b.bookno=b1.bookno and b.bookno not in(
select b2.bookno from buys b2 where b2.sid=s2.sid and b.bookno=b1.bookno))) c;

\echo 18.

select count(1)
from
(select s1.sid,s2.sid from student s1,student s2 where s1.sid<>s2.sid and exists
(select b.bookno from book b where b.bookno in(select b1.bookno from buys b1 where b1.sid=s1.sid)
and b.bookno in (select b2.bookno from buys b2 where b2.sid=s2.sid))
EXCEPT
((select s3.sid,s4.sid from student s3,student s4 where s3.sid<>s4.sid and exists
(select b1.bookno,b2.bookno from book b1,book b2 where b1.bookno<>b2.bookno and b1.bookno in(select b3.bookno from buys b3 where b3.sid=s3.sid)
and b2.bookno in (select b4.bookno from buys b4 where b4.sid=s4.sid)
and b1.bookno in (select b4.bookno from buys b4 where b4.sid=s4.sid)
and b2.bookno in (select b3.bookno from buys b3 where b3.sid=s3.sid)))))c;


\echo 19.
create view cs_students as select * from major where major='CS';
  select b.bookno from book b where not exists(
  select b1.sid,b2.sid from cs_students b1,cs_students b2 where b1.sid<>b2.sid and
  b1.sid not in (select b3.sid from buys b3 where b3.bookno=b.bookno) and
  b2.sid not in (select b4.sid from buys b4 where b4.bookno=b.bookno));  

\connect postgres
drop database sm;
