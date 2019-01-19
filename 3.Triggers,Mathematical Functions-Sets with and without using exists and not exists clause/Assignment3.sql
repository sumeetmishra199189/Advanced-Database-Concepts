
CREATE DATABASE SM;

\connect sm;

\echo 1.
create table x(x integer);
insert into x values (1),(2),(3),(4),(5);
select x,sqrt(x) as square_root_x,x^2 as x_squared,2^x as two_to_the_power_x,x! as x_factorial,ln(x) as logarithm_x from x;
drop table x;
\echo 2.
create table A(a integer);
create table B(b integer);
insert into A values(1),(2),(3);
insert into B values(1),(3),(4),(5);

select not exists(select a from A where a not in(select b from B)) as empty_a_minus_b,
exists(select a from A where a not in(select b from B) UNION select b from B where b not in(select a from A) ) as not_empty_symmetric_difference,
not exists((select a from A)INTERSECT(Select b from B)) as empty_a_intersection_b;

drop table A;
drop table B;
\echo 3.
create table C(x integer,y integer);
insert into C values (1,3),(2,4),(3,1),(5,5),(6,2);
select c1.x as x1,c1.y as y1,c2.x as x2,c2.y as y2 from C c1,C c2 where c1.x<>c2.x and c1.y<>c2.y and (c1.x+c1.y)=(c2.x+c2.y);
drop table C;
\echo 4.
create table P (p boolean);
insert into P values('t'),('f'),(null);
select p1.p as p,p2.p as q,p3.p as r,not(not (p1.p) or p2.p) or p3.p as "not(not(p)or q)or r" from P p1,P p2,P p3 ;
drop table P;
\echo 5.
create table A(a integer);
create table B(b integer);
create table C(c integer);
insert into A values(1),(2);
insert into B values(1),(4),(5);
insert into C values(3),(4);
\echo a)
\echo 1.
select exists((select a from A)INTERSECT(Select b from B)) as answer;
\echo 2.
select exists (select a from A where a in(select b from B)) as answer;

\echo b)
\echo 1.
select not exists (select a from A except (select b from B)) as answer;
\echo 2.
select not exists (select a from A where a not in (select b from B)) as answer;

\echo c)
\echo 1.
select not exists((select c from C)except((select b from B) intersect (select c from C))) as answer;
\echo 2.
select not exists(select c from C where c not in(select c from C where c in (select b from B))) as answer;

\echo d)
\echo 1.
select exists (select a from A except (select b from B) Union(select b from B except(select a from A))) as answer;
\echo 2.
select exists (select a from A where a not in (select b from B) Union(select b from B where b not in(select a from A))) as answer;

\echo e)
insert into A values(5),(8);
\echo 1.
create view a_intersect_b as ((select a from A)intersect (select b from B));
select not exists(select a1.a,a2.a,a3.a from a_intersect_b a1,a_intersect_b a2,a_intersect_b a3
where a1.a<>a2.a and a1.a<>a3.a and a2.a<>a3.a) as answer;

\echo 2.
select not exists(select a1.a,a2.a,a3.a from A a1,A a2,A a3 where a1.a<>a2.a and a1.a<>a3.a and a2.a<>a3.a
  and a1.a in (select b from B) and a2.a in (select b from B) and a3.a in (select b from B)) as answer;
\echo f)
\echo 1.
select not exists (((select a from A)UNION(select b from B)) except (select c from C)) as answer;
\echo 2.
select not exists((select a from A where a not in (select c from C)) UNION (select b from B where b not in(select c from C))) as answer;
\echo g)

create view a_b_c as
((select a from A) except (select b from B)) union ((select b from B)except(select c from C));

select not exists(select a1.a , a2.a from a_b_c a1,a_b_c a2 where a1.a<>a2.a)
and exists(select a from a_b_c) as answer;

\echo 2.

select not exists((select a1.a,a2.a from A a1,A a2 where a1.a<>a2.a and a1.a not in (select b from B) and a2.a not in (select b from B)))
  and not exists((select b1.b,b2.b from B b1,B b2 where b1.b<>b2.b and b1.b not in (select c from C) and b2.b not in (select c from C)))
  and ( exists((select a from A where a not in(select b from B))) or exists ((select b from B where b not in(select c from C)))) as answer;
\echo 6.
\echo a)
select ((select count(1) from ((select a from A)INTERSECT(Select b from B))q)>=1) as answer;
\echo b)
select ((select count(1) from (select a from A except (select b from B))q)=0) as answer;
\echo c)
select ((select count(1) from ((select c from C)except((select b from B) intersect (select c from C)))q)=0) as answer;
\echo d)
select (select count(1) from (select a from A except (select b from B) Union(select b from B except(select a from A)))q)>=1 as answer;
\echo e)
select (select count(1) from ((select a from A) INTERSECT (select b from B))q)<=2 as answer;
\echo f)
select (select count(1) from (((select a from A)UNION(select b from B)) except (select c from C))q)=0 as answer;
\echo g)
select (select count(1) from(((select a from A) except (select b from B))UNION((select b from B) except(select c from C)))q)=1 as answer;

\echo 7.
create table W1(A integer,B Character(50));
create table W2(A integer,B Character(50));
insert into W1 values(1,'John'),(2,'Ellen'),(3,'Ann');
insert into W2 values(1,'John'),(2,'Ellen'),(2,'Linda'),(3,'Ann'),(4,'Ann'),(4,'Nick'),(4,'Vince'),(4,'Lisa');

  WITH query as (
    select a from w2 group by a having count(a)>1
  )
  select * from query
  union all
  select a from w2
  group by a having count(a)=1
  and not exists (
    select * from query
  ) order by a;

\echo 8.
create table Student(sid integer,sname varchar(15),primary key(sid));
create table Major(sid integer,major varchar(15),primary key(sid,major),foreign key(sid) references Student(sid));
create table Book(bookno integer,title varchar(30),price integer,primary key(bookno));
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


\echo a)
\echo i)
create function booksBoughtbyStudent
(s1id int)returns table(bookno int,title varchar(30),price int) as $$
select bookno,title,price from book where bookno
in(select b.bookno from buys b where b.sid=s1id) $$ language sql;

\echo ii)
select * from booksBoughtbyStudent(1001);
select * from booksBoughtbyStudent(1015);

\echo iii)
\echo A)
select sid,sname from student where sid in(select b1.sid from buys b1 where b1.bookno in(
(select b.bookno from booksBoughtbyStudent(b1.sid) b where b.price<50))
 group by b1.sid having count(b1.sid)=1);
\echo B)
select s1.sid,s2.sid from student s1,student s2 where s1.sid<>s2.sid
and not exists((select * from booksBoughtbyStudent(s1.sid) ) except (select * from booksBoughtbyStudent(s2.sid) ) )
and not exists((select * from booksBoughtbyStudent(s2.sid) ) except (select * from booksBoughtbyStudent(s1.sid) ) );


\echo b)
\echo i)
create function studentsWhoBoughtBook(bookno1 int)
returns table(sid int, sname VARCHAR(15)) as $$
select * from student where sid in (select b.sid from buys b where b.bookno=bookno1)
$$ language sql;

\echo ii)
select * from studentsWhoBoughtBook(2001);
select * from studentsWhoBoughtBook(2010);

\echo iii)
(select b.bookno
from book b
where (select count(1)
                   from( (select  b1.sid
                                 from buys b1
                                 where b1.bookno = b.bookno)
                                INTERSECT
                                (select m.sid
                                from major m
                               where m.major = 'CS')) q) >=2)
intersect
(select distinct bookno from buys where sid in(select b1.sid from buys b1 where b1.bookno in(
(select b.bookno from booksBoughtbyStudent(b1.sid) b where b.price<50))
 group by b1.sid having count(b1.sid)>=1)) order by bookno;

\echo c)
\echo i)
select sid,major from major where sid in(select sid from buys where bookno
in(select distinct bookno from buys where bookno in(select bookno from book where price>30))
group by sid having count(sid)>=4)order by sid;

\echo ii)
select distinct b3.sid,b4.sid from buys b3,buys b4 where b3.sid<>b4.sid
and (select count(1) from((select sum(b1.price) from booksBoughtbyStudent(b3.sid) b1)
except (select sum(b2.price) from booksBoughtbyStudent(b4.sid) b2) )q)=0;
\echo iii)
select sid,sname from student where sid in
(select b1.sid from book b,buys b1 where b.bookno=b1.bookno group by b1.sid having sum(b.price)
>
(with q as(select sum(b.price) as sum1 from book b,buys b1 where b.bookno=b1.bookno
		  and b1.sid in (select m.sid from major m where m.major='CS')
		  group by b1.sid)
select avg(sum1) from q));

\echo iv)
select bookno,title from book where price in(
select max(price) from book where price in(
select price from book except
((select max(price) from book where price in(
(select price from book)except(select max(price) from book)))
UNION (select max(price) from book))));

\echo v)
select b.bookno,b.title
from book b
where(select count(1)
                   from (select b1.sid
                                 from buys b1
                                 where b1.bookno = b.bookno
                                 except
                                 select m.sid
                                 from major m
                                 where m.major = 'CS') q)=0;

\echo vi)
select sid,sname from student where sid in
(select sid from buys where bookno not in(
(select b.bookno from book b where
 (select count(1) from
(select b1.sid,b2.sid from buys b1,buys b2 where b1.bookno=b.bookno and b2.bookno=b.bookno and b1.sid<>b2.sid and
 b1.sid in(select sid from major where major='CS')and b2.sid in(select sid from major where major='CS'))q
															   )>=1)));

\echo vii)
select b.sid as s,b.bookno as b from buys b where b.bookno in (select bookno from book where price<(
select avg(price) from book where bookno in(select b1.bookno from buys b1 where b1.sid=b.sid )
)) order by sid;

\echo viii)

select distinct m1.sid,m2.sid from major m1,major m2 where m1.sid<>m2.sid and m1.major=m2.major
and
((select count(1) from((select count(b1.bookno) from booksBoughtbyStudent(m1.sid) b1)
except (select count(b2.bookno) from booksBoughtbyStudent(m2.sid) b2) )q)=0);

\echo ix)
create function count_diff(s1 integer,s2 integer)
returns bigint as $$
select count(1) from((select b1.bookno from booksBoughtbyStudent(s1) b1)
		except (select b2.bookno from booksBoughtbyStudent(s2) b2))q
 $$ language sql;

 select distinct m1.sid,m2.sid,count_diff(m1.sid,m2.sid) from major m1,major m2 where m1.sid<>m2.sid and m1.major=m2.major
 order by m1.sid,m2.sid;


\echo x)
create view cs_students as select * from major where major='CS';
  select b.bookno from book b where ((select count(1) from(
  select b1.sid,b2.sid from cs_students b1,cs_students b2 where b1.sid<>b2.sid and
  b1.sid not in (select b3.sid from buys b3 where b3.bookno=b.bookno) and
  b2.sid not in (select b4.sid from buys b4 where b4.bookno=b.bookno))q)=0);


drop table student cascade;
drop table major cascade;
drop table buys cascade;
drop table book cascade;
\echo 9.

create table Student(sid integer,sname text,primary key(sid));
create table Course(cno int,cname text,total int,max int,primary key(cno));
create table Prerequisite(cno int,prereq int,foreign key(cno) references Course(cno),foreign key(prereq) references Course(cno));
create table HasTaken(sid int,cno int,foreign key(sid) references Student(sid),foreign key(cno) references Course(cno));
create table Enroll(sid int,cno int,foreign key(sid) references Student(sid),foreign key(cno) references Course(cno));
create table Waitlist(sid int,cno int,position int ,foreign key(sid) references Student(sid),foreign key(cno) references Course(cno));

  INSERT INTO Course values(201,'Programming',0,3);
    INSERT INTO Course values(202,'Calculus',0,3);
    INSERT INTO Course values(203,'Probability',0,3);
    INSERT INTO Course values(204,'AI',0,2);
    INSERT INTO Course values(301,'DiscreteMathematics',0,2);
    INSERT INTO Course values(302,'OS',0,2);
    INSERT INTO Course values(303,'Databases',0,2);
    INSERT INTO Course values(401,'DataScience',0,2);
    INSERT INTO Course values(402,'Networks',0,2);
    INSERT INTO Course values(403,'Philosophy',0,2);

    INSERT INTO Prerequisite values(301,201);
    INSERT INTO Prerequisite values(301,202);
    INSERT INTO Prerequisite values(302,201);
    INSERT INTO Prerequisite values(302,202);
    INSERT INTO Prerequisite values(302,203);
    INSERT INTO Prerequisite values(401,301);
    INSERT INTO Prerequisite values(401,204);
    INSERT INTO Prerequisite values(402,302);

    INSERT INTO Student values(1,'Jean');
    INSERT INTO Student values(2,'Eric');
    INSERT INTO Student values(3,'Ahmed');
    INSERT INTO Student values(4,'Qin');
    INSERT INTO Student values(5,'Filip');
    INSERT INTO Student values(6,'Pam');
    INSERT INTO Student values(7,'Lisa');

    INSERT INTO Hastaken values(1,201);
    INSERT INTO Hastaken values(1,202);
    INSERT INTO Hastaken values(1,301);
    INSERT INTO Hastaken values(2,201);
    INSERT INTO Hastaken values(2,202);
    INSERT INTO Hastaken values(3,201);
    INSERT INTO Hastaken values(4,201);
    INSERT INTO Hastaken values(4,202);
    INSERT INTO Hastaken values(4,203);
    INSERT INTO Hastaken values(4,204);
    INSERT INTO Hastaken values(5,201);
    INSERT INTO Hastaken values(5,202);
    INSERT INTO Hastaken values(5,301);
    INSERT INTO Hastaken values(5,204);
--create view waitlist_view as select * from waitlist;

create or replace function prerequisite_check() returns trigger as
  $$
BEGIN
IF
((select count(1) from((select prereq from prerequisite where cno=new.cno)
except(select cno from Hastaken where sid=new.sid))q)=0)

THEN
  IF
   ((select count(1) from(select total from course where total<max and cno=new.cno)q)=0 )
  THEN
    insert into Waitlist values(new.sid,new.cno,((select count(position) from waitlist)+1));
    return null;
  ELSE
    update Course set total=total+1 where cno=new.cno;
      return new;
  END iF;
ELSE
  Raise Exception 'One or more prerequisites are not fulfilled';

END IF;
return new;
  END;$$ LANGUAGE 'plpgsql';

--------------------------------------------

CREATE TRIGGER courses_by_Students
  BEFORE INSERT
   ON Enroll
   FOR EACH ROW
   EXECUTE PROCEDURE prerequisite_check();

---------------------------------------------------------------------------------------
   create or replace function waitlist_enrollment() returns trigger as

     $$
     BEGIN
     update course set total=total-1 where cno=old.cno;
     IF
      ((select count(1) from(select total from course where total<max and cno=old.cno)q)>=1)

    THEN
      IF
        ((select count(1) from (select sid,cno from Enroll where sid=old.sid and cno=old.cno)q)=0)
      THEN
        insert into Enroll values((select sid from waitlist where position=(select min(position) from waitlist where cno=old.cno)),
                                     (select cno from waitlist where position=(select min(position) from waitlist where cno=old.cno)));
        delete from waitlist where sid=old.sid and cno=old.cno;

      END IF;
    END IF;
    return old;
    END;
   $$ LANGUAGE 'plpgsql';

--------------------------------------------------------------------------------------
     CREATE TRIGGER delete_from_enroll
         AFTER DELETE ON Enroll
         FOR EACH ROW
         EXECUTE PROCEDURE waitlist_enrollment();

-----------------------------------------------------------------------------------------

create or replace function waitlist_delete() returns trigger as

$$
declare pos_var int;
BEGIN

  select position into pos_var from waitlist where cno=old.cno and sid=old.sid;
  --delete from waitlist where sid=old.sid and cno=old.sid;
  update waitlist set position=position-1 where cno=old.cno and position>pos_var;

return old;
END;
$$ LANGUAGE 'plpgsql';
-------------------
CREATE TRIGGER delete_from_waitlist
BEFORE DELETE ON waitlist
FOR EACH row
EXECUTE PROCEDURE waitlist_delete();


\connect postgres
drop database sm;
