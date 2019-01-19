CREATE DATABASE SM;

\connect sm;


\echo 1.
create table W1(A integer,B Character(50));
create table W2(A integer,B Character(50));
insert into W1 values(1,'John'),(2,'Ellen'),(3,'Ann');
insert into W2 values(1,'John'),(2,'Ellen'),(2,'Linda'),(3,'Ann'),(4,'Ann'),(4,'Nick'),(4,'Vince'),(4,'Lisa');

--WITH E1 as (
--    select distinct w.a from w2 w where w.a in (select w1.a from w2 w1 where w.a=w1.a and w.b<>w1.b)
--  )
--  select * from E1
--  union
--  select w.a from w2 w
--where w.a not in (
--    select distinct w.a from E1
--  );
--WITH E1 as (
--    select distinct s.a from w1 s,w1 s1 where s.a=s1.a and s.b<>s1.b)
--  select * from E1
--  union

--  (select s.a from w1 s
--  except (
--    select distinct s.a from E1,w1 s where s.a<>E1.a
--  ));
WITH E1 as (
    select distinct s.a from w2 s inner join w2 s1 on s.a=s1.a and s.b<>s1.b)
  select * from E1
  union

  (select s.a from w2 s
  except (
    select distinct s.a from E1 inner join w2 s on s.a<>E1.a
  ));


\echo 2.

create table Student(sid integer,sname varchar(15),primary key(sid));
create table Major(sid integer,major varchar(15),primary key(sid,major),foreign key(sid) references Student(sid));
create table Book(bookno integer,title varchar(30),price integer,primary key(bookno));
create table Buys(sid integer,bookno integer,primary key(sid,bookno),foreign key(sid) references Student(sid),foreign key(bookno) references Book(bookno));
create table Cites(bookno integer,citedbookno integer,primary key(bookno,citedbookno),foreign key(bookno) references Book(bookno));

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


\echo a)

--select distinct s.sid,s.sname from student s,buys b
--              where s.sid=b.sid and b.bookno
--			                in (select c.bookno from cites c where c.bookno=b.bookno )
--select distinct s.sid,s.sname from student s,buys b,cites c
--              where s.sid=b.sid and b.bookno=c.bookno;
select distinct s.sid,s.sname from student s inner join buys b
        on s.sid=b.sid inner join cites c on b.bookno=c.bookno;


\echo b)
--select s1.sid,s1.sname from student s1,student s2 where s1.sid=s2.sid
--       and (s1.sid,s2.sid) in (select m1.sid,m2.sid from major m1,major m2 where m1.sid=m2.sid and m1.major<>m2.major)
--select distinct s1.sid,s1.sname from student s1,student s2,major m1,major m2 where s1.sid=s2.sid
--       and (s1.sid,s2.sid)=(m1.sid,m2.sid) and  m1.major<>m2.major;
select distinct s1.sid,s1.sname from student s1 inner join student s2 on s1.sid=s2.sid
inner join major m1 on s1.sid=m1.sid inner join major m2 on s2.sid=m2.sid and  m1.major<>m2.major;

\echo c)
--select b.sid from buys b where b.sid
--        not in(select b1.sid from buys b1,buys b2 where b1.sid=b2.sid and b1.bookno<>b2.bookno)
--select q.sid from
--      ((select b.sid from buys b)
--        except (select b1.sid from buys b1,buys b2 where b1.sid=b2.sid and b1.bookno<>b2.bookno))q;
select q.sid from
      ((select b.sid from buys b)
        except (select b1.sid from buys b1 inner join buys b2 on b1.sid=b2.sid and b1.bookno<>b2.bookno))q;


\echo d)
--select bookno,title from book where price <=ALL
--(select price from book where bookno in
--(select bookno from book
--EXCEPT
--(select bookno from book where price<=ALL(select price from book))))
--EXCEPT (select bookno,title from book where price<=ALL(select price from book));
--select bookno,title from book where price <=ALL((select price from book)
--EXCEPT (select price from book where price<=ALL(select price from book)))
--EXCEPT
--(select bookno,title from book where price<=ALL(select price from book));
with q as (select b.bookno,b.title,b.price from book b inner join book b1 on not b.price<=b1.price)

(select b.bookno,b.title from book b except
(select distinct q1.bookno,q1.title from q q1 inner join q q2 on not q1.price<=q2.price))

 except

 ((select distinct b1.bookno,b1.title from book b1 cross join book b2)
 except
 (select distinct b1.bookno,b1.title from book b1 inner join book b2 on not b1.price<=b2.price));
\echo e)
--select b.bookno,b.title from book b where b.bookno
--not in(select b2.bookno from buys b2 where b2.sid<>1001);
--select q.bookno,b1.title from book b1,
--((select b.bookno from book b)
--except
--(select b2.bookno from buys b2 where b2.sid<>1001))q
 --where b1.bookno=q.bookno;
 with q as ((select b.bookno from book b)
 except
 (select b2.bookno from buys b2 where b2.sid<>1001))

 select q.bookno,b1.title from book b1 inner join q on b1.bookno=q.bookno;

\echo f)
--select sid,sname from student where sid in
--	(select b1.sid from buys b1,buys b2
--	 where b1.sid=b2.sid
--	 and b1.bookno<>b2.bookno
--	 and b1.bookno in(select bookno from book where price<50)
--	 and b2.bookno in(select bookno from book where price<50))
--select distinct s.sid,s.sname from student s,buys b1,buys b2,book b3,book b4
--where s.sid=b1.sid and  b1.sid=b2.sid and b1.bookno<>b2.bookno
--	 and b1.bookno=b3.bookno and b2.bookno=b4.bookno and b3.price<50 and b4.price<50;
select distinct s.sid,s.sname from student s inner join buys b1 on s.sid=b1.sid
inner join buys b2 on b1.sid=b2.sid inner join book b3 on b1.bookno=b3.bookno inner join book b4 on b2.bookno=b4.bookno
and b1.bookno<>b2.bookno and b3.price<50 and b4.price<50;


\echo g)
--select b.bookno from book b where b.bookno not in
--(select b1.sid from buys b1 where b1.bookno=b.bookno
--and b1.sid in
--(select m1.sid from major m1 where m1.major='CS'))
--select q1.bookno from (select b.bookno from book b
--except
--select q2.bookno
--from((select distinct b.bookno from buys b,student s where s.sid = b.sid)
--              except(select distinct b.bookno from buys b, major m
--                         where b.sid=m.sid and m.major = 'CS'))q2)q1
select q1.bookno from (select b.bookno from book b
except
select q2.bookno
from((select distinct b.bookno from buys b inner join student s on s.sid = b.sid)
              except(select distinct b.bookno from buys b inner join major m
                         on b.sid=m.sid and m.major = 'CS'))q2)q1;


\echo h)
--select bookno from book except
--(select b.bookno from book b where b.bookno in
--(select c.citedbookno from cites c
-- where c.bookno in(select bookno from book where price >50)))
--union(select bookno from book where bookno not in(select citedbookno from cites))
--select bookno from book except
--(select b.bookno from book b,cites c
-- where c.bookno=b.bookno and b.price>50)
--union
--((select bookno from book) except(select citedbookno from cites));
select bookno from book except
(select b.bookno from book b inner join cites c
 on c.bookno=b.bookno and b.price>50)
union
((select bookno from book) except(select citedbookno from cites));

\echo i)
--select sid from student where sid in
--(select sid from buys where bookno not in
--(select b.bookno from book b where price<30))

--select distinct b1.sid from buys b1,book b
--where b1.bookno=b.bookno and b.price>=30;
select distinct b1.sid from buys b1 inner join book b
on b1.bookno=b.bookno and b.price>=30;

\echo j)
--select s.sid,b.bookno from student s,book b where
--(s.sid,b.bookno) in(select b1.sid,b2.bookno from buys b1,book b2 where
--					 (b1.bookno,b2.bookno) not in (select c.bookno,c.citedbookno from cites c ) );

select distinct q.sid,q.citedbookno from
((select * from buys b1 cross join (select b.bookno as citedbookno from book b)q1)
except
(select b1.sid,b1.bookno,c.citedbookno from buys b1 inner join cites c on c.bookno=b1.bookno))q;


\echo k)
--select distinct b1.bookno,b2.bookno from book b1,book b2,student s where b1.bookno<>b2.bookno
--and s.sid in (select sid from major where major='CS')
--and b1.bookno in(select b3.bookno from buys b3 where b3.sid=s.sid)
--and b2.bookno in(select b4.bookno from buys b4 where b4.sid=s.sid)
--(select distinct b1.bookno,b2.bookno from book b1 inner join book b2 on b1.bookno<>b2.bookno)
--except
--(select c.bookno,c.t1books from
--((select distinct t1.bookno,t1.sid,q.t1books from buys t1 inner join major m on t1.sid=m.sid and m.major='CS'
-- cross join (select bookno as t1books from book)q)
--except
--(select distinct q.t1books,t1.sid,t1.bookno from buys t1 inner join major m on t1.sid=m.sid and m.major='CS'
-- cross join (select bookno as t1books from book)q))c )

(select distinct b1.bookno,b2.bookno from book b1 inner join book b2 on b1.bookno<>b2.bookno)
except
(select c.bookno,c.t1books from

 (((select distinct q.t1books,t1.sid,t1.bookno from buys t1 inner join major m on t1.sid=m.sid and m.major='CS'
 cross join (select bookno as t1books from book)q)
except
(select distinct t1.bookno,t1.sid,q.t1books from buys t1 inner join major m on t1.sid=m.sid and m.major='CS'
 cross join (select bookno as t1books from book)q))
union
 ((select distinct t1.bookno,t1.sid,q.t1books from buys t1 inner join major m on t1.sid=m.sid and m.major='CS'
 cross join (select bookno as t1books from book)q)
except
(select distinct q.t1books,t1.sid,t1.bookno from buys t1 inner join major m on t1.sid=m.sid and m.major='CS'
 cross join (select bookno as t1books from book)q)))c);




\echo l)
--(select distinct s1.sid,s2.sid from student s1,student s2 where s1.sid<>s2.sid and
--             not exists ((select bookno from buys where sid=s1.sid )
--           except (select bookno from buys where sid=s2.sid )))

--(select distinct s1.sid,s2.sid from student s1,student s2 where s1.sid<>s2.sid)
--except
--(select distinct s1.sid,s2.sid from student s1,student s2 where s1.sid<>s2.sid and
--              exists ((select bookno from buys where sid=s1.sid )
--           except (select bookno from buys where sid=s2.sid )))

select q1.s1,q1.s2 from
((select distinct s1.sid as s1,s2.sid as s2 from student s1 inner join student s2 on s1.sid<>s2.sid cross join buys b)
  except
  select q2.s1,q2.s2
  from((select s1.sid as s1,s2.sid as s2,b.bookno from student s1 inner join student s2 on s1.sid<>s2.sid
  inner join buys b on b.sid=s1.sid)
		except	(select s1.sid,s2.sid,b.bookno from student s1 inner join student s2 on s1.sid<>s2.sid
				 inner join buys b on b.sid=s2.sid and b.sid<>s1.sid ))q2)q1;

\echo m)
--select b.bookno from book b where
--b.bookno in (select citedbookno from cites)
--and not exists(select b1.bookno,b2.bookno from book b1,book b2 where b1.bookno not in
--			   (select bookno from cites where citedbookno=b.bookno )
--			   and b2.bookno not in(select bookno from cites where citedbookno=b.bookno)  )

--(select b.bookno from book b,cites c where
--b.bookno=c.citedbookno)
--except



--(select b.bookno from book b,cites c where
--b.bookno=c.citedbookno
--and exists
--((select b1.bookno,b2.bookno from book b1,book b2)except
--	(select b1.bookno,b2.bookno from book b1,book b2,cites c
--			     where b1.bookno=c.bookno and b2.bookno=c.citedbookno)))
select q1.bookno from
((select b1.bookno as bookno,b2.bookno as bookno1 from book b1 inner join book b2 on b1.bookno<>b2.bookno
                             inner join cites c1 on b1.bookno=c1.citedbookno inner join cites c2 on b2.bookno=c2.citedbookno)
except

 (select q2.* from
	 ((select b1.bookno,b2.bookno from book b1 cross join book b2)
	 except
 (select c1.bookno,c2.bookno from
                         cites c inner join cites c1 on c1.bookno=c.citedbookno inner join
                                                       cites c2 on c2.bookno=c.citedbookno
                                                     ))q2))q1;




\echo 3.
\echo a)
--select distinct m.sid, m.major
--       from   major m,buys t, book b where m.sid=t.sid and t.bookno=b.bookno and b.price<20
--step1
select distinct m.sid, m.major
       from   major m inner join buys t on m.sid=t.sid
	   inner join book b on t.bookno=b.bookno and b.price<20;

\echo b)
---step1
--select distinct t.sid, b.bookno
--       from   buys t, book b
--       where  t.bookno = b.bookno and
--              b.price <= ALL (select b1.price
--                              from   buys t1, book b1
--                              where t1.bookno = b1.bookno and t1.sid = t.sid);
--step2
--(select distinct t.sid, b.bookno
--       from   buys t, book b where t.bookno=b.bookno)
--       except
--	   (select distinct t.sid, b.bookno
--       from   buys t, book b, buys t1, book b1
--                            where t.bookno=b.bookno and t1.bookno = b1.bookno and t1.sid = t.sid and
--							 not b.price<=b1.price);
--Step 3
(select distinct t.sid, b.bookno
       from   buys t inner join book b on t.bookno=b.bookno)
       except
	   (select distinct t.sid, b.bookno
       from   buys t inner join book b on t.bookno=b.bookno inner join buys t1 on
		t1.sid = t.sid inner join book b1 on t1.bookno = b1.bookno and not b.price<=b1.price);
\echo c)
--select distinct b.bookno, b.title
--   from   book b,cites c
--   where  20 <= b.price and b.price <= 40 and
--          b.bookno= c.citedbookno;
--step-1

select distinct b.bookno, b.title
   from   book b inner join cites c on b.bookno= c.citedbookno
   and  20 <= b.price and b.price <= 40;
\echo d)
--select distinct s.sid, s.sname
--   from   student s,major m,buys t, cites c, book b1, book b2
--   where  s.sid=m.sid and m.major = 'CS'
--   and s.sid = t.sid and t.bookno = c.citedbookno and
--                         c.citedbookno = b1.bookno and c.bookno = b2.bookno and
--                         b1.price > b2.price;
--step1
select distinct s.sid, s.sname
   from   student s inner join major m on s.sid=m.sid inner join buys t on s.sid = t.sid inner join cites c on
   t.bookno = c.citedbookno inner join book b1 on c.citedbookno = b1.bookno inner join book b2 on c.bookno = b2.bookno
   and m.major = 'CS' and b1.price > b2.price;



\echo e)
--select b.bookno, b.title
--   from   book b
--   where  exists (select m.sid
--                  from   major m
--                  where  m.major = 'CS' except
--                         (select t.sid
--                                      from   buys t
--                                      where  t.bookno = b.bookno));
--step1
--select distinct b.bookno, b.title
--   from   book b,student s
--   where  s.sid in (select m.sid
--                  from   major m
--                  where  m.major = 'CS' except
--                         (select t.sid
--                                      from   buys t
--                                      where  t.bookno = b.bookno));
--step2
--select distinct q.bookno,q.title from
--((select distinct s.sid,b.bookno, b.title
--   from   book b,student s,major m
--   where  s.sid=m.sid and  m.major = 'CS') except
--                   (select t.sid,b.bookno,b.title
--                              from   buys t,book b
--                                      where  t.bookno = b.bookno))q;
--step3
select distinct q.bookno,q.title from
((select distinct s.sid,b.bookno, b.title
   from   book b cross join student s inner join major m
   on s.sid=m.sid and  m.major = 'CS') except
                   (select t.sid,b.bookno,b.title
                              from   buys t inner join book b
                                      on t.bookno = b.bookno))q;
\echo f)
--select b.bookno, b.title
--  from   book b
--except
--(select b.bookno, b.title
--  from   book b
--  where exists ((select s.sid
--                     from   student s,major m1,major m2
--                     where  s.sid=m1.sid and m1.major = 'CS' and s.sid=m2.sid and m2.major = 'Math')
--                            except (select t.sid from   buys t where  t.bookno = b.bookno)));

--step1
--(select b.bookno,b.title from book b)
--except
--(select b.bookno,b.title from book b,student s,major m1,major m2
-- where s.sid=m1.sid and m1.major = 'CS' and s.sid=m2.sid and m2.major = 'Math'
-- and s.sid
 --not in(select t.sid from   buys t where  t.bookno = b.bookno) )

--step2
--(select b.bookno,b.title from book b)
--except
--	(select q.bookno,q.title
--	from (select b.bookno,b.title,s.sid from book b,student s,major m1,major m2
--	 where s.sid=m1.sid and m1.major = 'CS' and s.sid=m2.sid and m2.major = 'Math'

--	 except
--	 select b.bookno,b.title,s.sid from book b,student s,major m1,major m2,buys t
-- where s.sid=m1.sid and m1.major = 'CS' and s.sid=m2.sid and m2.major = 'Math'
--	 and t.sid = s.sid and t.bookNo = b.bookno)q)
---step3
(select b.bookno,b.title from book b)
except
	(select q.bookno,q.title
	from ((select b.bookno,b.title,s.sid from book b cross join student s inner join major m1 on s.sid=m1.sid
		  inner join major m2 on s.sid=m2.sid and m1.major = 'CS' and m2.major = 'Math' )

	 except
	 select b.bookno,b.title,s.sid from book b cross join student s inner join major m1 on s.sid=m1.sid
		  inner join major m2 on s.sid=m2.sid and m1.major = 'CS' and m2.major = 'Math' inner join buys t
	 on t.sid = s.sid and t.bookno = b.bookno)q);

   \connect postgres
   drop database sm;
