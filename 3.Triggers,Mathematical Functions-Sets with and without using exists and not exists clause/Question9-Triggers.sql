
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
      return new;
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









-------------------------------------------------------------------------
create or replace function waitlist_enrollment() returns trigger as

  $$
  BEGIN
  update course set total=total-1 where cno=old.cno;
  IF
   ((select count(1) from(select total from course where total<max and cno=old.cno)q)>=1)

 THEN
   insert into Enroll values((select sid from waitlist where position=(select min(position) from waitlist where cno=old.cno)),
																		 (select cno from waitlist where position=(select min(position) from waitlist where cno=old.cno)));
   delete from waitlist_view where sid=old.sid and cno=old.cno;

 END IF;
 return old;
 END;
$$ LANGUAGE 'plpgsql';
--------------------------------------------------------------------------------------
  CREATE TRIGGER delete_from_enroll
      AFTER DELETE ON Enroll
      FOR EACH ROW
      EXECUTE PROCEDURE waitlist_enrollment()





-----------------------------------------------------------------
create or replace function waitlist_delete() returns trigger as

  $$
declare pos_var int;
BEGIN
select position into pos_var from waitlist where cno=old.cno;
delete from waitlist where sid=old.sid and cno=old.Cno;
update waitlist set position=position-1 where cno=old.cno and position>pos_var;
return old;
END;
$$ LANGUAGE 'plpgsql';
-------------------
CREATE TRIGGER delete_from_waitlist_view
   INSTEAD OF DELETE ON waitlist_view
   FOR EACH row
   EXECUTE PROCEDURE waitlist_delete()
