CREATE DATABASE SumeetM;

\connect sumeetm;

create table Student(sid integer,sname varchar(15),primary key(sid));
create table Book(bookno integer,title varchar(30),price integer,primary key(bookno));
create table Buys(sid integer,bookno integer,primary key(sid,bookno),foreign key(sid) references Student(sid),foreign key(bookno) references Book(bookno));
create table Cites(bookno integer,citedbookno integer,primary key(bookno,citedbookno),foreign key(bookno) references Book(bookno));

--inserting into Student
  insert into student values('1001','Jean');
  insert into student values('1002','Maria');
  insert into student values('1003','Anna');
  insert into student values('1004','Chin');
  insert into student values('1005','John');
  insert into student values('1006','Ryan');
  insert into student values('1007','Catherine');
  insert into student values('1008','Emma');
  insert into student values('1009','Jan');
  insert into student values('1010','Linda');
  insert into student values('1011','Nick');
  insert into student values('1012','Eric');
  insert into student values('1013','Lisa');
  insert into student values('1014','Filip');
  insert into student values('1015','Dirk');
  insert into student values('1016','Mary');
  insert into student values('1017','Ellen');
  insert into student values('1020','Greg');
  insert into student values('1022','Qin');
  insert into student values('1023','Melanie');
  insert into student values('1040','Pam');

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

\echo 1.
--Unoptimized query

--select distinct s.sid,s.sname,b.bookno,b.title
--                  from student s cross join book b
--                         inner join buys t on
--						 ((s.sname ='Eric' or s.sname ='Anna')
--                              and s.sid =t.sid and b.price>20 and t.bookno = b.bookno);

--step1(projected the student information over names like 'Eric' and 'Anna')

--select distinct s.sid,s.sname,b.bookno,b.title
--                  from (select s.sid,s.sname from student s where s.sname ='Eric' or s.sname ='Anna')s
--				  inner join buys t on s.sid =t.sid
--				  inner join book b
--				   on t.bookno = b.bookno and b.price>20;

--step 2(projected the book id and title where price >20 )

--select distinct s.sid,s.sname,b.bookno,b.title
--                  from (select s.sid,s.sname from student s where s.sname ='Eric' or s.sname ='Anna')s
--				  inner join buys t on s.sid =t.sid
--				  inner join (select b.bookno,b.title from book b where b.price>20)b
--				   on t.bookno = b.bbookno;

--step3(replaced inner joins with natural joins)

--select distinct s.sid,s.sname,b.bookno,b.title
--                  from (select s.sid,s.sname from student s where s.sname ='Eric' or s.sname ='Anna')s
--				  natural join buys t
--				  inner join (select b.bookno,b.title from book b where b.price>20)b
--				   on t.bookno = b.bbookno;
--step4(replaced inner join with natural join for B )

  select distinct s.sid,s.sname,b.bookno,b.title
                             from (select s.sid,s.sname from student s where s.sname ='Eric' or s.sname ='Anna')s
           				  natural join buys t
           				  natural join (select b.bookno,b.title from book b where b.price>20)b;


\echo 2.
--Unoptimized query

--select distinct s.sid
--from student s
--cross join book b
--inner join buys t on ((s.sname = 'Eric' or s.sname = 'Anna') and
--s.sid = t.sid and b.price > 20 and t.bookno = b.bookno);

--step1(projected sid only for names like 'Eric' and 'Anna' from student)
--select distinct q.ssid
--from (select s.sid as ssid from student s where s.sname = 'Eric' or s.sname = 'Anna')q
--cross join book b
--inner join buys t on
--q.ssid = t.sid and b.price > 20 and t.bookno = b.bookno;

--step2(projected bookno only for price >20 from book)
--select distinct q.ssid
--from (select s.sid as ssid from student s where s.sname = 'Eric' or s.sname = 'Anna')q
--inner join buys t on q.ssid = t.sid
--inner join (select b.bookno as bbookno from book b where b.price > 20)p on t.bookno = p.bbookno;

--step3(replaced inner join with natural join for buys t)
--select distinct q.ssid
--from (select s.sid as ssid from student s where s.sname = 'Eric' or s.sname = 'Anna')q
--natural join buys t
--inner join (select b.bookno as bbookno from book b where b.price > 20)p on t.bookno = p.bbookno;

--Step4(replaced inner join with natural join for p)
select distinct q.ssid
from (select s.sid as ssid from student s where s.sname = 'Eric' or s.sname = 'Anna')q
natural join buys t
natural join (select b.bookno as bbookno from book b where b.price > 20)p ;

\echo 3.
--Unoptimized query
--select
--distinct s.sid, b1.price as b1_price, b2.price as b2_price
--from (select s.sid from student s where s.sname <> 'Eric') s
--cross join book b2
--inner join book b1 on (b1.bookno <> b2.bookno and b1.price > 60 and b2.price >= 50)
--inner join buys t1 on (t1.bookno = b1.bookno and t1.sid = s.sid)
--inner join buys t2 on (t2.bookno = b2.bookno and t2.sid = s.sid);

--step1(replaced inner joins with natural joins)
--select
--distinct s.sid, b1.price as b1_price, b2.price as b2_price
--from (select s.sid from student s where s.sname <> 'Eric') s
--natural join buys t1
--natural join book b1
--inner join book b2 on b1.bookno <> b2.bookno and b1.price > 60 and b2.price >= 50
--inner join buys t2
--on (t2.bookno = b2.bookno and t2.sid = s.sid);

--step2(projecting only bookno and price from book)
--select
--distinct s.sid, b1.price as b1_price, b2.price as b2_price
--from (select s.sid from student s where s.sname <> 'Eric') s
--natural join buys t1
--natural join (select b.bookno,b.price from book b)b1
--inner join (select b.bookno,b.price from book b)b2 on b1.bookno <> b2.bookno and b1.price > 60 and b2.price >= 50
--inner join buys t2
--on (t2.bookno = b2.bookno and t2.sid = s.sid);
--step3(replaced inner join with natural join by pushing natural join inside inner join)
select
distinct s.sid, b1.price as b1_price, b2.price as b2_price
from (select s.sid from student s where s.sname <> 'Eric') s
natural join buys t1
natural join (select b.bookno,b.price from book b where b.price > 60)b1
inner join ((select b.bookno,b.price from book b where b.price >= 50)b2 natural join buys t2)
on b1.bookno <> b2.bookno and t2.sid = s.sid;

\echo 4.
--Unoptimized query
--select q.sid from (select
--				   s.sid, s.sname from student s
--except
--select s.sid, s.sname from student s
--inner join buys t on (s.sid = t.sid)
--inner join book b on (t.bookno = b.bookno and b.price > 50)) q;

--step1(removed projection of q and removed projection of sname from student and natural join of buys t)
--select s.sid from student s
--except
--select s.sid from student s
--natural join buys t
--inner join book b
--on (t.bookno = b.bookno and b.price > 50) ;

--step2(replaced inner join with natural joins)
--select s.sid from student s
--except
--select s.sid from student s
--natural join buys t
--natural join (select b.bookno,b.price from book b where b.price>50)q;

--step3(absorbed student table)
--select s.sid from student s
--except
--select t.sid from
--buys t
--natural join (select b.bookno,b.price from book b where b.price>50)q;

--Step4(removed projection of price from q)
select s.sid from student s
except
select t.sid from
buys t
natural join (select b.bookno from book b where b.price>50)q;

\echo 5.
--Unoptimized query
--select q.sid,q.sname
--from (select s.sid, s.sname, 2007 as bookno
--from student s
--cross join book b
--intersect
--select s.sid, s.sname, b.bookno from student s
--cross join book b inner join buys t on (s.sid=t.sid and t.bookno=b.bookno and b.price<25))q;

--step1(for buys t and book b after union replaced inner joins with natural joins and projected bookno only from book)
--select q.sid,q.sname
--from (select s.sid, s.sname, 2007 as bookno
--from student s
--cross join book b
--intersect
--select s.sid, s.sname, p.bookno from student s
--natural join buys t
--natural join (select b.bookno from book b where b.price<25 )p)q ;

--step2(removed book table)
--select q.sid,q.sname
--from (select distinct s.sid, s.sname, 2007 as bookno
--from student s
--intersect
--select s.sid, s.sname, p.bookno from student s
--natural join buys t
--natural join (select b.bookno from book b where b.price<25 )p)q ;

--step3(pushed bookno to the query after intersection and removed 1st part of the query)
select s.sid, s.sname from student s
natural join buys t
natural join (select b.bookno from book b where b.price<25 and b.bookno=2007 )p ;


\echo 6.
--Unoptimized query
--select distinct q.bookno
--from (select s.sid,s.sname,b.bookno,b.title
--	 from student s cross join book b
--	 except
--	  select s.sid,s.sname,b.bookno,b.title from student s
--	  cross join book b
--	  inner join buys t on (s.sid=t.sid and t.bookno=b.bookno and b.price<20)
--	 )q;

--step1(replaced cross and inner joins with natural joins and projected bookno and title only for price<20 from book)

--select distinct q.bookno
--from
--(select s.sid,s.sname,b.bookno,b.title
--from student s cross join book b
--except
--select s.sid,s.sname,q1.bookno,q.title
--from student s
--natural join buys t
--natural join (select b.bookno,b.title from book b where b.price<20 )q1
--)q;

--step2(removed projection of title and absorbed student table)
--select distinct q.bookno
--from
--(select s.sid,b.bookno
--from student s cross join book b
--except
--select t.sid,q1.bookno
--from
 --buys t
--natural join (select b.bookno from book b where b.price<20 )q1
--)q;

--step3(projected only sid and bookno from student and book respectively)
select distinct q.bookno
from
(select p.sid,c.bookno
from (select s.sid from student s)p cross join (select b.bookno from book b)c
except
select t.sid,q1.bookno
from
 buys t
natural join (select b.bookno from book b where b.price<20 )q1
)q;

\echo 7.
--Unoptimized query
--select s.sid
--from student s
--except
--(select s1.sid from student s1
--inner join student s2 on (s1.sid <> s2.sid)
--inner join buys t1 on (s1.sid = t1.sid)
--union
--select s1.sid
--from student s1
--inner join student s2 on (s1.sid <> s2.sid)
--inner join buys t1 on (s1.sid = t1.sid)
--inner join buys t2 on (t1.bookno = t2.bookno and t2.sid = s2.sid)
--inner join book b on (t2.bookno = b.bookno and b.price = 80));

--step1(replaced inner joins with natural joins for table t1 and project sid only from buys t,student s)
--select s.sid
--from student s
--except
--(select s1.sid from student s1
--natural join (select t.sid from buys t) t1
--inner join (select s.sid from student s)s2 on (s1.sid <> s2.sid)
--union
--select s1.sid
--from  (select s.sid from student s) s1
--natural join buys t1
--inner join (select s.sid from student s)s2 on s1.sid<>s2.sid
--inner join buys t2 on (t1.bookno = t2.bookno and t2.sid = s2.sid)
--inner join book b on (t2.bookno = b.bookno and b.price = 80));

--step2(absorbed student table s1 and s2)
--select s.sid
--from student s
--except
--(select t1.sid from buys t1
--inner join (select t.sid from buys t)t2 on (t1.sid <> t2.sid)
--union
--select s1.sid
--from  (select s.sid from student s) s1
--natural join buys t1
--inner join (select s.sid from student s)s2 on s1.sid<>s2.sid
--inner join buys t2 on (t1.bookno = t2.bookno and t2.sid = s2.sid)
--inner join book b on (t2.bookno = b.bookno and b.price = 80));

 --step3(absorbed student table s1 and s2 after union)
 --select s.sid
--from student s
--except
--(select t1.sid from buys t1
--inner join (select t.sid from buys t)t2 on (t1.sid <> t2.sid)
--union
--select t1.sid
--from  buys t1
--inner join buys t2 on (t1.bookno = t2.bookno and t2.sid <> t1.sid)
--inner join (select b.bookno from book b where b.price=80)b
--on (t2.bookno = b.bookno));

--step4(replaced inner joins with natural joins)
--select s.sid
--from student s
--except
--(select t1.sid from buys t1
--inner join (select t.sid from buys t)t2 on (t1.sid <> t2.sid)
--union
--select t1.sid
--from  buys t2
--natural join (select b.bookno from book b where b.price=80)b
--natural join buys t1 where (t1.bookno = t2.bookno and t2.sid <> t1.sid));

--step5(removed query after union as it is a subset of the query before union)
--select s.sid
--from student s
--except
--(select t1.sid from buys t1
--inner join (select t.sid from buys t)t2 on (t1.sid <> t2.sid));
--step6(absorbed buys t2 as not used)
select s.sid
from student s
except
(select t1.sid from buys t1);

\connect postgres
drop database sumeetm;
