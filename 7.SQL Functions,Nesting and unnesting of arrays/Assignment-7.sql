CREATE DATABASE SumeetM;

\connect sumeetm;

create table Student(sid integer,sname varchar(15),primary key(sid));
create table Book(bookno integer,title varchar(30),price integer,primary key(bookno));
create table Buys(sid integer,bookno integer,primary key(sid,bookno),foreign key(sid) references Student(sid),foreign key(bookno) references Book(bookno));
create table Cites(bookno integer,citedbookno integer,primary key(bookno,citedbookno),foreign key(bookno) references Book(bookno));
create table Major(sid integer,major varchar(15),primary key(sid,major),foreign key(sid) references Student(sid));

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


\echo 1.

create or replace function memberof(x anyelement, A anyarray)
        returns boolean as
$$
  select x = SOME(A);
$$ language sql;
----------------------------------------------------------------
create or replace function setunion(A anyarray, B anyarray)
         returns anyarray as
     $$ select ARRAY(select unnest(A)
                     union
                     select unnest(B));
     $$ language sql;



\echo a)

create or replace function setintersect(A anyarray, B anyarray)
         returns anyarray as
     $$ select ARRAY(select unnest(A)
                     intersect
                     select unnest(B));
     $$ language sql;

\echo b)

create or replace function setexcept(A anyarray, B anyarray)
         returns anyarray as
     $$ select ARRAY(select unnest(A)
                     except
                     select unnest(B));
     $$ language sql;

\echo 2.

create or replace view student_books as
     select s.sid as sid, array(select t.bookno
                                from   buys t
                                where  t.sid = s.sid
                                order by bookno) as books
     from   student s
     order by sid;
select * from student_books;

\echo a)

create or replace view book_students as
     select b.bookno as bookno, array(select t.sid
                                from   buys t
                                where  t.bookno = b.bookno
                                order by t.sid) as students
     from   book b
     order by bookno;
     select * from book_students;

\echo b)

create or replace view book_citedbooks as
     select b.bookno as bookno, array(select c.citedbookno
                                from   cites c
                                where  c.bookno = b.bookno
                                order by c.citedbookno) as citedbooks
     from   book b
     order by bookno;
     select * from book_citedbooks;

\echo c)

create or replace view book_citingbooks as
     select b.bookno as bookno, array(select c.bookno
                                from   cites c
                                where  c.citedbookno = b.bookno
                                order by c.bookno) as citingbooks
     from   book b
     order by bookno;
     select * from book_citingbooks;

\echo d)

create or replace view major_students as
     select distinct m.major as major, array(select m1.sid
                                from   major m1
                                where  m1.major = m.major
                                order by m1.sid) as students
     from   major m
     order by major;
     select * from major_students;

\echo e)

create or replace view student_majors as
     select s.sid as sid, array(select m.major
                                from   major m
                                where  s.sid = m.sid
                                order by m.major) as majors
     from   student s
     order by sid;
     select * from student_majors;

\echo 3.

\echo a)

select sid
from student_books sb
where cardinality(sb.books) =2;

\echo b)

select sb1.sid
from student_books sb1,student_books sb2 where
sb2.sid=1001 and sb2.books <@ sb1.books;

\echo c)

select bc.bookno from book_citedbooks bc
where cardinality(setintersect( bc.citedbooks ,array(select b.bookno from book b where b.price>30)))<2;

\echo d)

select bs.bookno,b.title from book_students bs,book b where bs.bookno=b.bookno
and
cardinality(setexcept(bs.students,array((select ms.students from major_students ms
											where ms.major='CS') intersect (select ms.students from major_students ms
											where ms.major='Math') ))) >=1;

\echo e)

select sb.sid,q.bookno from student_books sb,
(select bc.bookno from book_citingbooks bc where
 cardinality(setintersect( bc.citingbooks,array(select b.bookno from book b where b.price<50)))>=2)q
where memberof(q.bookno, sb.books);

\echo f)

select (setintersect(array(select ms1.students from major_students ms1 where ms1.major='CS'),
										 array(select ms2.students from major_students ms2 where ms2.major='Math'))) as students;

\echo g)

select * from student_majors sm where
cardinality(setexcept(array(select sm.sid from student_majors)
 ,array(select sb.sid from student_books sb where
cardinality(setintersect(array(select sb.books from student_books sb where sb.sid=1001),sb.books))>0)))>0;

\echo h)

select array(select sb.bookno from book_students sb where
cardinality((setintersect( sb.students,array(select ms1.students from major_students ms1 where ms1.major='CS'))))>0) as books;

\echo i)

select array(select sb.sid from student_books sb where
cardinality(setintersect(sb.books,
array(select bc.bookno from book_citedbooks bc
where cardinality( bc.citedbooks )>=2)))>0);

\echo j)

select bs.bookno,(setintersect(bs.students,
(select
array(select sm.sid from student_majors sm where (memberof('CS', sm.majors)))))) as students
from book_students bs
where cardinality(bs.students)>0 ;

\echo k)

select sb.sid from student_books sb where cardinality(setexcept(sb.books
,
(select
setexcept(array(select bs.bookno from book_students bs where cardinality(setintersect(bs.students,
(select
array(select sm.sid from student_majors sm where (memberof('CS', sm.majors))))))>0),

array(select bs.bookno from book_students bs where cardinality(setintersect(bs.students,
(select
array(select sm.sid from student_majors sm where (memberof('Math', sm.majors))))))>0)))))=0
														   and cardinality(sb.books)>0;

\echo l)

select bs1.bookno,bs2.bookno from book_students bs1,book_students bs2
where bs1.bookno<> bs2.bookno and bs1.students<@bs2.students and bs2.students<@bs1.students;

\echo m)

select p.bookno as b1,q.bookno as b2 from
(select bs.bookno,(setintersect(bs.students,
(select
array(select sm.sid from student_majors sm where (memberof('Math', sm.majors)))))) as students
from book_students bs
where cardinality(bs.students)>0)p,(select bs.bookno,(setintersect(bs.students,
(select
array(select sm.sid from student_majors sm where (memberof('CS', sm.majors)))))) as students
from book_students bs
where cardinality(bs.students)>0)q
where p.bookno<>q.bookno and cardinality(p.students)<cardinality(q.students) and cardinality(p.students)>0
order by p.bookno,q.bookno;

\echo n)

select sb.sid from student_books sb
where cardinality(setexcept( sb.books ,array(select b.bookno from book b where b.price<50)))>0
and cardinality(setexcept( array(select b.bookno from book b where b.price>50),sb.books))=1;


\connect postgres
drop database sumeetm;
