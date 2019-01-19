CREATE DATABASE SumeetM;

\connect sumeetm;

\echo 1.
create table A(a integer);
create table X(x integer);
insert into A values(1),(2),(3);
insert into X values(1),(2);


create or replace function powerset(B anyarray) returns table(p_set integer[]) as
$$
DECLARE
    i integer;
	j record;
	var integer[];
BEGIN
drop table if exists powerset;
create table powerset(p_set integer[]);
insert into powerset values('{}');
    FOREACH i IN ARRAY B
	loop
	for j in (select * from powerset)
	loop
	var:=array_append(j.p_set,i);
	insert into powerset values(var);
	end loop;
	end loop;
return query (select * from powerset);
end;
$$ language plpgsql;

create or replace function SuperSetsOfSet(b anyarray) returns setof anyarray as
$$
begin
DROP TABLE IF EXISTS powerset2;
CREATE TABLE powerset2(p_set integer[]);
INSERT INTO powerset2 (SELECT powerset(array(select * from A)));
return query (select ps.p_set from powerset2 ps where b<@ps.p_set);
end
$$ language plpgsql;

select supersetsofset(array(select * from x));

\echo 2.

create table edge(source integer,target integer);
--insert into edge values(1,2),(2,3),(3,4),(4,5);
--insert into edge values(1,2),(2,3),(3,1),(0,1),(3,4),(4,5),(5,6);
insert into edge values(1,2),(2,3),(3,1);
--CREATE TABLE TC(source integer, target integer,path_length integer);
create or replace function TC() returns void as
$$
declare
i record;
j integer;
begin
drop table if exists TC;
create table TC(source integer,target integer,path_length integer);
insert into TC(select e.source,e.source,0 from edge e);
insert into TC(select e.target,e.target,0 from edge e where e.target<>e.source);
insert into TC(select e.source,e.target,1 from edge e);
j:=(select count(*) from edge)+1;
while(j!=0)
loop
j=j-1;
for i in (select * from new_TC_pairs())
loop
insert into TC values(i.source,i.target,i.weight);
end loop;
end loop;
end;
$$ language plpgsql;

create or replace function new_TC_pairs() returns table (source integer,target integer,weight integer) as
$$ begin
return query (select TC.source,edge.target,(1+TC.path_length) as weight
from TC inner join edge on (TC.target=edge.source));
end;
$$ language plpgsql;

select * from TC();
--select * from TC;

\echo a)

CREATE OR REPLACE FUNCTION connectedByEvenLengthPath() RETURNS TABLE(source integer, target integer) AS
$$
SELECT distinct t.source,t.target from TC t where mod(t.path_length,2)=0 order by t.source,t.target;
$$
language sql;
select * from connectedbyevenlengthpath();

\echo b)

CREATE OR REPLACE FUNCTION connectedByOddLengthPath() RETURNS TABLE(source integer, target integer) AS
$$
SELECT distinct t.source,t.target  from TC t where mod(t.path_length,2)<>0 order by t.source,t.target;
$$
language sql;
select * from connectedByOddLengthPath();

\echo 3.

create table graph(source integer,target integer);
insert into graph values(1,2),(1,3),(2,3),(2,4),(3,7),(7,4),(4,5),(4,6),(7,6);
--select * from graph;
create or replace function topological_sort() returns table(index integer,node integer) as
$$
declare
i record;
j record;
m integer;
begin
DROP TABLE IF EXISTS in_degree;
DROP TABLE IF EXISTS tt;
CREATE TABLE in_degree(target integer,indeg integer);
CREATE TABLE tt(index integer,node integer);
INSERT INTO in_degree (select g.target,count(g.target) from graph g group by g.target);
for i in (select * from graph)
loop
if(i.source not in (select t.target from in_degree t))
then
insert into in_degree values(i.source,0);
end if;
end loop;
m:=1;
while(select count(*) from in_degree)!=0
loop
for j in (select * from in_degree where indeg=0)
loop

insert into tt(select m,j.target);
m:=m+1;
update in_degree set indeg=indeg-1 where target in(select g.target from graph g,
												   in_degree t where g.source=t.target and t.indeg=0);
delete from in_degree where target=j.target;

end loop;
end loop;

end;
$$ language plpgsql;
select * from topological_sort();
select * from tt;

\echo 4.



\echo 5.
create table graph_a(source integer,target integer);
insert into graph_a values(1,2),(2,3),(3,1);

create or replace function Hamiltonian() returns boolean as
$$
declare
i record;
j integer;
begin
drop table if exists HT;
create table HT(deg integer);
drop table if exists F_T;
create table F_T(deg integer);
insert into HT(select e.source from graph_a e union select e.target from graph_a e where e.target<>e.source);
insert into F_T(select * from HT order by deg limit 1);
j:=select * from F_T;
for i in (select * from HT)
loop
if(i.deg not in (select * from F_T)) then
if exists(select e.source from graph_a e,F_T f where e.target=i.deg and e.source=f.deg)
				 or exists(select e.target from graph_a e,F_T f where e.source=i.deg and e.target=f.deg)
then
insert into F_T values(i.deg);
delete from HT where deg=i.deg;
else return false;
end if;
end if;
end loop;
return true;
end;
$$ language plpgsql;

select * from Hamiltonian();

\echo 6.

create table document (doc int primary key,words text []);
insert into document values(1,array['a','b','c']);
insert into document values(2,array['b','c','d']);
insert into document values(3,array['b','b','a','d']);
insert into document values(4,array['e','f']);
insert into document values(5,array['a','d','g']);
insert into document values(6,array['c','b','a']);
insert into document values(7,array['b','a']);
insert into document values(8,array['a','e']);
--select * from document;
create or replace function powerset1(B anyarray) returns table(p_set text[]) as
$$
DECLARE
    i text;
	j record;
	var text[];
BEGIN
drop table if exists powerset1;
create table powerset1(p_set text[]);
insert into powerset1 values('{}');
    FOREACH i IN ARRAY B
	loop
	for j in (select * from powerset1)
	loop

	var:=array_append(j.p_set,i);
	insert into powerset1 values(var);
	end loop;
	end loop;
return query (select * from powerset1);
end;
$$ language plpgsql;


CREATE OR REPLACE FUNCTION array_sort (ANYARRAY)
RETURNS ANYARRAY
AS $$
SELECT ARRAY(SELECT distinct unnest($1) ORDER BY 1);
$$ LANGUAGE SQL;

create or replace function frequentSets(t int) returns table(frequentsets text[]) AS
$$ BEGIN
DROP TABLE IF EXISTS t_frequent;
CREATE TABLE t_frequent(powerset text[],t_count integer);

INSERT INTO t_frequent (SELECT powerset1(array_sort(d.words)),count(d.words) from document d group by powerset1(array_sort(d.words)));

return query (select g.powerset from t_frequent g where g.t_count>=t);
 END;
$$ language plpgsql;
select frequentsets(1);


\echo 7.

create table dataset(p integer,x float,y float);
insert into dataset values(1,1.5,2),(2,4,9),(3,5,3),(4,4.5,6.8),(5,1.9,7.8),(6,7,3),(7,10,15),(8,2.3,4),(9,6,9),(10,12,14);
--select * from dataset;

create or replace function k_means(k integer) returns table(p integer,x float,y float) AS
$$
declare
i record;
iterations integer;
BEGIN
DROP TABLE IF EXISTS k_means;
--DROP TABLE IF EXISTS centroids;
CREATE TABLE k_means(p integer,x float,y float);
INSERT INTO k_means(select * from dataset order by random() limit k);
iterations:=100;
while (iterations!=0)
loop
iterations:=iterations-1;
DROP TABLE IF EXISTS centroids;
CREATE TABLE centroids(p integer,x float,y float,label integer);
for i in (select * from dataset)
loop

insert into centroids(select i.p,i.x,i.y,km.p from k_means km
					  where sqrt((i.x-km.x)^2+(i.y-km.y)^2)= (select min(sqrt((i.x-kmk.x)^2+(i.y-kmk.y)^2))
															  from k_means kmk ) );
end loop;
update k_means km set x=q.x,y=q.y from (select avg(c.x) as x,avg(c.y) as y,c.label
											  from centroids c group by c.label)q
 where km.p=q.label;

end loop;
return query (select km.p,km.x,km.y from k_means km);
 END;
$$ language plpgsql;
--drop function k_means(integer);
--select * from dataset;
select * from k_means(2);
--select * from centroids;



\echo 8.

create table partSubPart(pid integer,sid integer,quantity integer);
create table Parts(pid integer,weight integer);
insert into partsubpart values(1,2,4),(1,3,1),(3,4,1),(3,5,2);
insert into Parts values(2,5),(4,50),(5,3);
--select * from parts;
create or replace function aggregatedWeight(p integer) returns integer as
$$
declare
w integer:=0;
ww integer:=0;
--i record;
j record;
begin
if (select not exists(select weight from parts where pid=p))
then
for j in (select sid from partsubpart where pid=p)
loop
	 if(not exists(select s.pid from parts s where s.pid=j.sid ))
	 then
	 w:= w+(select k.quantity from partsubpart k where k.sid=j.sid) * aggregatedweight(j.sid);
else
ww:=(select ps.quantity*s.weight from partsubpart ps,parts s where ps.sid=j.sid and s.pid=j.sid);
w:=w+ww;
end if;
end loop;
else
w:=(select weight from parts where pid=p);
end if;
return w;
end;
$$ language plpgsql;
select aggregatedWeight(1);

\echo 9.
create table graph_g(source integer,target integer,weight integer);
insert into graph_g values(0,1,2),(1,0,2),(0,4,10),(4,0,10),(1,3,3),(3,1,3),(1,4,7),(4,1,7),(2,3,4),
(3,2,4),(3,4,5),(4,3,5),(4,2,6),(2,4,6);


create or replace function Dijkstra(s integer) returns table(target integer,s_path_length integer) as
$$
declare
i record;
j integer;
begin
drop table if exists dj;
create table dj(source integer,target integer,s_path_length integer);
insert into dj(select g.source,g.target,g.weight from graph_g g where g.source=s);
j:=(select count(*) from graph_g);
while(j!=0)
loop
j=j-1;
for i in (select * from new1_TC_pairs())
loop
insert into dj values(i.source,i.target,i.weight);
end loop;
end loop;
update dj set s_path_length=0 where dj.source=dj.target;
return query(select d.target,min(d.s_path_length) as s_path_length from dj d group by d.source,d.target order by d.target);
end;
$$ language plpgsql;

create or replace function new1_TC_pairs() returns table (source integer,target integer,weight integer) as
$$ begin
return query (select dj.source,graph_g.target,(graph_g.weight+dj.s_path_length) as weight
from dj inner join graph_g on (dj.target=graph_g.source)
							  --union (select * from new1_TC_pairs());
except
((select dj.source,graph_g.target,dj.s_path_length
from dj,graph_g where dj.source=graph_g.target))	);
end;
$$ language plpgsql;

select * from dijkstra(0);
--select * from dj;
--select * from graph_g;


\echo 10.
create table R(A integer,B integer);
insert into R values(1,2),(1,3),(2,3),(2,4),(3,4),(4,4);
--select * from R;
 create table S(A integer,B integer);
insert into S values(1,2),(1,4),(2,5),(5,4),(6,4),(8,2);
--select * from S;


\echo a)
WITH
        map_output AS
        (SELECT r.a,1 as one
         FROM   r r),

        group_output AS
        (SELECT p.a,array_agg(one)
         FROM   map_output p
         GROUP BY p.a),

     reduce_output AS
         (SELECT t.a
          FROM   group_output t order by t.a)

SELECT *
FROM   reduce_output;

\echo b)
WITH
        map_output AS
        (SELECT r.a,'r'as one
         FROM   r r
    union
     SELECT s.a,'s'as one
         FROM   s s),
     group_output AS
        (SELECT p.a, array_agg(p.one) as two
         FROM   map_output p group by p.a),
     reduce_output AS
         (SELECT t.a
          FROM   group_output t where array['r'] <@ t.two and t.two<@array['r'])



SELECT *
FROM   reduce_output;

\echo c)
drop table S;
create table S(B integer,C integer);
insert into S values(1,2),(1,4),(2,5),(5,4),(6,4),(8,2);

  WITH
          map_output AS
          (SELECT r.b,array[text('r'),text(r.a)] as one
           FROM   r r
 		 union
 		  SELECT s.b,array[text('s'),text(s.c)] as one
           FROM   s s),
group_output as
(select m1.b,m1.one as a,m2.one as c
from map_output m1,map_output m2 where m1.b=m2.b and m1<>m2 ),

 reduce_output as
 			(select g.b,cast(g.a[2] as integer) as a,cast(g.c[2] as integer) as c
      from group_output g where array['r']<@g.a
 			 and array['s']<@g.c )


 SELECT *
 FROM   reduce_output;



  \connect postgres
  drop database sumeetm;



  --Test Preparation

  --Queue and stack

  create or replace function queue(a int[],x integer)
  returns int[] as
  $$
  select a || x;
  $$ language sql;

  create or replace function stack(a int[],x integer)
  returns int[] as
  $$
  select x || a;
  $$ language sql;

  create or replace function pop(a int[])
  returns int[] as
  $$
  select array_remove(a,a[1]);
  $$ language sql;



  --Number of children

  create table graph(
  source integer,
  target integer);

  insert into graph(source,target) values
  (1,2),
  (1,3),
  (2,3),
  (2,4),
  (3,7),
  (7,4),
  (4,5),
  (4,6),
  (7,6);

  create table base_graph as
  select g.source, g.target, 1 as length, 1 as flag from graph g
  union
  select g1.source, g2.target, 2 as length, 0 as flag from graph g1, graph g2
  where g1.target = g2.source
  order by length, source, target;

  create or replace function pathLength()
  returns void as
  $$ declare
  n int8 := 2;
  f int8 := 1;
  counter int;
  begin
  loop

  counter := count (1) from
  (select 1 from base_graph g1, graph g2
  where g1.target = g2.source
  and g1.length = n) c;

  exit when counter = 0;

  insert into base_graph
  select g1.source, g2.target, n+1 as length, f as flag from base_graph g1, graph g2
  where g1.target = g2.source
  and g1.length = n
  order by length;

  create table grouped_graph as
  select g.source, g.target, min(length) as length, g.flag from base_graph g
  group by source,target,flag
  order by length;

  drop table base_graph;

  create table base_graph as
  select * from grouped_graph;

  drop table grouped_graph;

  n := n+1;
  f := 1-f;
  end loop;
  end;
  $$ language plpgsql;

  do $$ begin
  perform pathLength();
  end $$;

  create or replace function Descendants(s integer)
  returns bigint as
  $$
  select count(1) from
  (select distinct source, target from base_graph where s = source) s;

  $$ language sql;​
------------------------------
------------------------------
------------------------------

  \! echo "mapreduce"


  \! echo "10 a - projection"

  /*
  mapper - (a,a), (b,b), (a,a),....
  grouper - (a, {a,a}), (b, {b}),....
  reducer - (a,a), (b,b)
  */


  create table R(A int, B int);
  insert into R values (1,2),(1,3),(4,5),(3,0),(4,9),(2,9),(2,6);


  CREATE OR REPLACE FUNCTION mapper(A int)
  RETURNS TABLE (A integer, pair integer)
  AS $$
  SELECT A, A as pair;
  $$ LANGUAGE SQL;

  CREATE OR REPLACE FUNCTION reducer(A int, pairs INTEGER[])
  RETURNS TABLE(A int, pair INTEGER)
  AS $$
  SELECT reducer.A, pairs[1];
  $$ LANGUAGE SQL;

  WITH
  map_output AS
  (SELECT q.A, q.pair FROM R r, LATERAL(SELECT p.A, p.pair FROM mapper(r.A) p) q),
  group_output AS
  (SELECT p.A, array_agg(p.pair) as pairs FROM map_output p GROUP BY (p.A)),
  reduce_output AS
  (SELECT t.A, t.pair FROM group_output r, LATERAL(SELECT s.A, s.pair FROM reducer(r.A, r.pairs) s) t)

  \! echo "OUTPUT"

  SELECT pair as "A" FROM reduce_output;



  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




  \! echo "10 b R-S"

  /*
  mapper - (a,R1), (b,R1), (c,S1), (b,S1),...
  grouper - (a, {R1}), (b, {R,S1}), (c, {S1}),....
  reducer - (a,a)
  result -> a
  */


  create table R1(A int);
  create table S1(A int);
  insert into R1 values (1),(9),(0),(8),(100);
  insert into S1 values (1),(0),(3),(8);

  CREATE OR REPLACE FUNCTION mapper(x int, tab varchar(2))
  RETURNS TABLE (A int, n varchar(2))
  AS $$
  SELECT x, tab;
  $$ LANGUAGE SQL;


  CREATE OR REPLACE FUNCTION reducer(A int, pairs varchar[])
  RETURNS TABLE(A int, pair int)
  AS $$
  SELECT A, A where '{"R1"}' <@ pairs and pairs <@ '{"R1"}';
  $$ LANGUAGE SQL;

  WITH
  map_output AS
  (SELECT q.A, q.n FROM R1 r, LATERAL(SELECT p.A, p.n FROM mapper(r.A, 'R1') p)q UNION SELECT q.A, q.n FROM S1 r, LATERAL(SELECT p.A, p.n FROM mapper(r.A, 'S1') p)q),
  group_output AS
  (SELECT p.A, array_agg(p.n) as pairs FROM map_output p GROUP BY (p.A)),
  reduce_output AS
  (SELECT t.A, t.pair FROM group_output r, LATERAL(SELECT s.A, s.pair FROM reducer(r.A, r.pairs) s) t)

  SELECT pair FROM reduce_output;





  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




  \! echo "10 c - join"

  /*
  0 <- Relation R
  1 <- Relation S
  mapper - (b1,{0,a1}), (b1,{1,c1}), (b2,{0,a2}), (b2,{1,c1}),.....
  grouper - (b1, {0,a1,1,c1}), (b2, {0,a2,1,c1}),....
  reducer - (a1,b1,c1), (a2,b2,c1)
  */

  --create table R(A int, B int);

  --insert into R values (1,2),(1,3),(4,5),(3,0),(4,9),(2,9),(2,6);
  create table S(B int, C int);

  insert into S values (2,3),(3,4),(0,6),(9,6),(9,3),(2,6);

  CREATE OR REPLACE FUNCTION mapper(x int, t int, y int)
  RETURNS TABLE (B int, n int[])
  AS $$
  SELECT x, (array[t]||array[y]);
  $$ LANGUAGE SQL;


  \! echo "10 c - map-output"


  WITH
  map AS
  (SELECT q.B, q.n FROM R r, LATERAL(SELECT p.B, p.n FROM mapper(r.B, 0 ,r.A) p)q UNION SELECT q.B, q.n FROM S r, LATERAL(SELECT p.B, p.n FROM mapper(r.B, 1 , r.C) p)q)
  select * from map;

  create table map_output(B int, n int[]);
  create table group_output(B int, p int[]);



  insert into
  map_output
  (SELECT q.B, q.n FROM R r, LATERAL(SELECT p.B, p.n FROM mapper(r.B, 0 ,r.A) p)q UNION SELECT q.B, q.n FROM S r, LATERAL(SELECT p.B, p.n FROM mapper(r.B, 1 , r.C) p)q);






  CREATE OR REPLACE FUNCTION grouping_p()
  RETURNS TABLE(A int, pair int[]) AS $$
  DECLARE
  r RECORD;
  s RECORD;
  begin
  for r in (select * from map_output where n[1]=0)
  loop
  for s in (select * from map_output where n[1]=1)
  loop
  if s.B = r.B then
  insert into group_output values (r.B, r.n||s.n);
  end if;
  end loop;
  end loop;
  END;
  $$ language plpgsql;


  select * from grouping_p();

  \! echo "10 c - group-output"
  select * from group_output;

  create table reduce_output(a int, b int, c int);

  CREATE OR REPLACE FUNCTION reducer()
  RETURNS void
  AS $$
  insert into reduce_output (SELECT p[2],b,p[4] from group_output);
  $$ LANGUAGE SQL;


  select * from reducer();

  \! echo "10 c - reduce-output"
  SELECT * FROM reduce_output;​




--###############################################
--##############################################
-- Natural join
 --Create Tables
 DROP TABLE IF EXISTS R;
 CREATE TABLE R(A INTEGER,B INTEGER);
 DROP TABLE IF EXISTS S;
 CREATE TABLE S(B INTEGER,C INTEGER);
 CREATE TYPE tuple AS (First INTEGER,Second INTEGER);
 CREATE TYPE tuple2 AS (Rel TEXT,Val INTEGER);
 -- Populate table
 INSERT INTO R VALUES (1, 2), (2, 4), (3, 6);INSERT INTO S VALUES (4, 7), (5, 8), (6, 9);
 -- Map function
 CREATE OR REPLACE FUNCTION Map(KeyIn TEXT, ValIn tuple) RETURNS TABLE(KeyOut INTEGER, ValOut tuple2) AS
 $$SELECT ValIn.Second, (KeyIn, ValIn.First)::tuple2 WHERE KeyIn = 'R'
 UNION
 SELECT ValIn.First,(KeyIn, ValIn.Second)::tuple2 WHERE KeyIn = 'S';$$ LANGUAGE SQL;
 -- Reduce function
 CREATE OR REPLACE FUNCTION Reduce(KeyIn INTEGER, ValIn tuple2[])RETURNS TABLE(KeyOut RECORD, ValOut RECORD) AS
 $$SELECT ((t1.v).Val, t1.KeyIn, (t2.v).Val) AS KeyOut, ((t1.v).Val, t1.KeyIn, (t2.v).Val) AS ValOut
 FROM (SELECT KeyIn, UNNEST(ValIn) AS v) t1,
 (SELECT KeyIn, UNNEST(ValIn) AS v) t2 WHERE (t1.v).Rel = 'R'AND (t2.v).Rel = 'S'AND t1.KeyIn = t2.KeyIn;
 $$ LANGUAGE SQL;
 -- Test MapReduce
WITHMap_Phase AS (SELECT m.KeyOut, m.ValOut FROM ( SELECT 'R' AS relname, (A, B)::tuple AS valFROM R
UNION
SELECT 'S' AS relname,(B, C)::tuple AS valFROM S) r_union_s, LATERAL(SELECT KeyOut, ValOutFROM Map(r_union_s.relname, r_union_s.val)) m),
Group_Phase AS (SELECT DISTINCT mp.KeyOut, (SELECT ARRAY(SELECT mp2.ValOutFROM Map_Phase mp2WHERE mp2.KeyOut = mp.KeyOut))
AS ValOutFROM Map_Phase mp),Reduce_Phase AS (SELECT r.KeyOut, r.ValOut FROM Group_Phase gp,
  LATERAL(SELECT KeyOut, ValOutFROM Reduce(gp.KeyOut, gp.ValOut)) r)SELECT KeyOut, ValOut FROM Reduce_Phase;
