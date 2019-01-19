--1.
CREATE DATABASE SM;

\connect sm;

create table sailor(sid integer,sname varchar(20),rating integer,age integer,primary key(sid));

create table boat(bid integer,bname varchar(15),color varchar(15),primary key(bid));

create table reserves(sid integer,bid integer,day varchar(10),primary key(sid,bid),foreign key(sid) references sailor(sid),foreign key(bid) references boat(bid));

insert into sailor values(22,   'Dustin',       7,      45);
insert into sailor values(29,   'Brutus',       1,      33);
insert into sailor values(31,   'Lubber',       8,      55);
insert into sailor values(32,   'Andy',         8,      25);
insert into sailor values(58,   'Rusty',        10,     35);
insert into sailor values(64,   'Horatio',      7,      35);
insert into sailor values(71,   'Zorba',        10,     16);
insert into sailor values(74,   'Horatio',      9,      35);
insert into sailor values(85,   'Art',          3,      25);
insert into sailor values(95,   'Bob',          3,      63);


insert into boat values(101,'Interlake','blue');
insert into boat values(102,'Sunset','red');
insert into boat values(103,'Clipper','green');
insert into boat values(104,'Marine','red');

insert into reserves values(22,101,'Monday');
insert into reserves values(22,102,'Tuesday');
insert into reserves values(22,103,'Wednesday');
insert into reserves values(31,102,'Thursday');
insert into reserves values(31,103,'Friday');
insert into reserves values(31,     104,'Saturday');
insert into reserves values(64,101,'Sunday');
insert into reserves values(64,102,'Monday');
insert into reserves values(74,102,'Saturday');

-----------------------------------------------------
--2
create table sailor1 as select * from sailor;
create table boat1 as select * from boat;
create table reserves1 as select * from reserves;
--with primary and foreign keys defined , we can’t delete those data from sailor or boat table that is used in reserves table due to foreign key constraints

delete from sailor where sid=22;
--ERROR:  update or delete on table "sailor" violates foreign key constraint "reserves_sid_fkey" on table "reserves"
--DETAIL:  Key (sid)=(22) is still referenced from table "reserves".

delete from boat where bid=104;
--ERROR:  update or delete on table "boat" violates foreign key constraint "reserves_bid_fkey" on table "reserves"
--DETAIL:  Key (bid)=(104) is still referenced from table "reserves".

--data not used in reserves table can be deleted from sailor

delete from sailor where sid=32;
--DELETE 1

--however data from reserves table could be deleted with ‘delete cascade’ or ‘delete restrict(by default)’
delete from reserves where bid=103;
--DELETE 2

/*select * from boat;
 bid |   bname   | color
-----+-----------+-------
 101 | Interlake | blue
 102 | Sunset    | red
 103 | Clipper   | green
 104 | Marine    | red
(4 rows)
*/
drop table reserves;
drop table sailor;
drop table boat;


alter table sailor1 rename to sailor;
alter table boat1 rename to boat;
alter table reserves1 rename to reserves;


--#####################################################
--3
--a
select rating from sailor;
--b
select bid,color from boat;
--c
select sname from sailor where age>=15 and age<=30;
--d
select bname from boat b,reserves r where b.bid=r.bid and r.day in ('Saturday','Sunday');
--e
select sname from sailor where sid in (select s.sid from sailor s,boat b,reserves r where s.sid=r.sid and r.bid in (select bid from boat where color= 'green') group by s.sid) and sid in (select s.sid from sailor s,boat b,reserves r where s.sid=r.sid and r.bid in (select bid from boat where color= 'red') group by s.sid);
--f
select sname from sailor where sid in (select s.sid from sailor s,boat b,reserves r where s.sid=r.sid and r.bid in (select bid from boat where color= 'red') group by s.sid) and sid not in (select s.sid from sailor s,boat b,reserves r where s.sid=r.sid and r.bid in (select bid from boat where color= 'green') group by s.sid) and sid not in (select s.sid from sailor s,boat b,reserves r where s.sid=r.sid and r.bid in (select bid from boat where color= 'blue') group by s.sid);
--g
select sname from sailor where sid in (select sid from reserves group by sid having count(sid)>=2);
--h
select sid from sailor where sid not in (select sid from reserves group by sid);
--i
select r1.sid as s1,r2.sid as s2 from reserves r1,reserves r2 where r1.day='Saturday' and r2.day='Saturday' and r1.sid<>r2.sid;
--j
select bid from boat where bid not in (select distinct b1.bid from boat b1,reserves r1,reserves r2 where b1.bid=r1.bid and b1.bid=r2.bid and r1.sid<>r2.sid) except (select bid from boat where bid not in(select bid from reserves));

\connect postgres;
drop DATABASE sm;
\q
