Solutions B561 Assignment 4
Expected outputs

Problem 2.a Find the sid and sname of each student who bought a book that cites another book.
 sid  |   sname
------+-----------
 1004 | Chin
 1005 | John
 1001 | Jean
 1014 | Filip
 1020 | Greg
 1008 | Emma
 1002 | Maria
 1010 | Linda
 1003 | Anna
 1013 | Lisa
 1011 | Nick
 1009 | Jan
 1040 | Pam
 1007 | Catherine
 1012 | Eric
 1017 | Ellen
 1023 | Melanie
 1006 | Ryan
(18 rows)

Problem 2.b Find the sid and sname of each student who has at least two majors.
 sid  |   sname
------+-----------
 1002 | Maria
 1013 | Lisa
 1007 | Catherine
 1001 | Jean
 1011 | Nick
(5 rows)

Problem 2.c
 sid
------
 1022
 1040
(2 rows)

Problem 2.d Find the bookno and title of each book with the second to lowest price.
 bookno |        title
--------+----------------------
   2007 | ProgrammingLanguages
(1 row)

Problem 2.e Find the bookno and title of each book that was only bought by the student with sid = 1001.
 bookno |        title
--------+---------------------
   2005 | DiscreteMathematics
   2004 | AI
(2 rows)

Problem 2.f Find the sid and sname of each student who bought at least two books that cost less than 50.
 sid  |   sname
------+-----------
 1009 | Jan
 1006 | Ryan
 1003 | Anna
 1005 | John
 1004 | Chin
 1010 | Linda
 1002 | Maria
 1007 | Catherine
 1017 | Ellen
 1001 | Jean
 1008 | Emma
(11 rows)

Problem 2.g Find the bookno of each book that was not bought by all students who major in CS.
 bookno
--------
   2008
   2004
   2014
   2012
   2011
   2013
   2007
   2002
   2003
   2005
   2001
   2006
   2010
   2009
(14 rows)

Problem 2.h Find the bookno of each book that is not cited by a book that cost more than 50.
 bookno
--------
   2004
   2012
   2009
   2003
   2011
   2014
   2010
   2013
   2002
   2006
   2007
   2005
   2008
(13 rows)

Problem 2.i Find the sid of each student who not only bought books that cost less than 30.
 sid
------
 1022
 1007
 1005
 1004
 1002
 1010
 1020
 1006
 1013
 1011
 1012
 1001
 1003
 1023
 1014
 1008
 1017
 1009
(18 rows)

Problem 2.j Find each pair $(s,b)$ such that $s$ is the sid of a student who bought a book that does not cite the book with bookno $b$.
 ssid | bbookno
------+---------
 1013 |    2002
 1008 |    2014
 1006 |    2002
 1006 |    2007
 1013 |    2007
 1023 |    2004
 1014 |    2010
 1020 |    2008
 1012 |    2007
 1022 |    2013
 1009 |    2009
 1005 |    2012
 1012 |    2013
 1004 |    2012
 1010 |    2008
 1022 |    2007
 1002 |    2011
 1006 |    2013
 1008 |    2004
 1013 |    2013
 1007 |    2008
 1022 |    2002
 1002 |    2012
 1009 |    2010
 1004 |    2011
 1023 |    2014
 1005 |    2011
 1010 |    2004
 1011 |    2014
 1006 |    2001
 1013 |    2001
 1008 |    2008
 1017 |    2011
 1012 |    2001
 1022 |    2003
 1022 |    2005
 1017 |    2012
 1007 |    2004
 1020 |    2014
 1014 |    2006
 1006 |    2005
 1013 |    2005
 1010 |    2014
 1040 |    2011
 1011 |    2004
 1001 |    2012
 1003 |    2012
 1012 |    2005
 1003 |    2011
 1023 |    2008
 1001 |    2011
 1009 |    2006
 1020 |    2004
 1012 |    2003
 1040 |    2012
 1022 |    2001
 1007 |    2014
 1006 |    2003
 1013 |    2003
 1020 |    2012
 1014 |    2005
 1040 |    2004
 1011 |    2011
 1009 |    2001
 1022 |    2006
 1017 |    2014
 1011 |    2012
 1001 |    2004
 1003 |    2004
 1014 |    2003
 1020 |    2011
 1002 |    2008
 1014 |    2001
 1007 |    2012
 1017 |    2004
 1009 |    2005
 1040 |    2014
 1010 |    2011
 1009 |    2003
 1012 |    2006
 1010 |    2012
 1004 |    2008
 1001 |    2014
 1003 |    2014
 1005 |    2008
 1007 |    2011
 1006 |    2006
 1013 |    2006
 1008 |    2011
 1017 |    2008
 1002 |    2004
 1022 |    2010
 1009 |    2002
 1014 |    2013
 1004 |    2004
 1005 |    2004
 1009 |    2007
 1008 |    2012
 1022 |    2009
 1040 |    2008
 1012 |    2009
 1009 |    2013
 1014 |    2002
 1023 |    2012
 1002 |    2014
 1006 |    2009
 1013 |    2009
 1006 |    2010
 1013 |    2010
 1014 |    2007
 1023 |    2011
 1001 |    2008
 1003 |    2008
 1004 |    2014
 1012 |    2010
 1005 |    2014
 1001 |    2010
 1003 |    2010
 1012 |    2008
 1023 |    2003
 1008 |    2001
 1040 |    2009
 1010 |    2013
 1004 |    2006
 1005 |    2006
 1011 |    2002
 1006 |    2008
 1013 |    2008
 1020 |    2007
 1002 |    2006
 1007 |    2013
 1011 |    2007
 1040 |    2010
 1001 |    2009
 1003 |    2009
 1023 |    2005
 1020 |    2002
 1017 |    2009
 1008 |    2005
 1007 |    2007
 1010 |    2002
 1011 |    2013
 1020 |    2013
 1017 |    2010
 1008 |    2003
 1007 |    2002
 1023 |    2001
 1010 |    2007
 1022 |    2008
 1006 |    2014
 1007 |    2003
 1013 |    2014
 1008 |    2002
 1002 |    2009
 1011 |    2001
 1001 |    2006
 1003 |    2006
 1010 |    2005
 1009 |    2011
 1004 |    2010
 1012 |    2014
 1005 |    2010
 1023 |    2013
 1008 |    2007
 1040 |    2006
 1009 |    2012
 1005 |    2009
 1004 |    2009
 1010 |    2003
 1022 |    2004
 1002 |    2010
 1007 |    2005
 1020 |    2001
 1011 |    2005
 1012 |    2004
 1020 |    2003
 1014 |    2011
 1013 |    2004
 1006 |    2004
 1008 |    2013
 1023 |    2007
 1010 |    2001
 1022 |    2014
 1017 |    2006
 1007 |    2001
 1023 |    2002
 1020 |    2005
 1014 |    2012
 1011 |    2003
 1002 |    2013
 1007 |    2006
 1006 |    2011
 1013 |    2011
 1023 |    2010
 1017 |    2001
 1012 |    2011
 1014 |    2004
 1001 |    2003
 1003 |    2003
 1009 |    2014
 1040 |    2005
 1023 |    2009
 1010 |    2006
 1004 |    2013
 1005 |    2013
 1003 |    2005
 1012 |    2012
 1001 |    2005
 1006 |    2012
 1013 |    2012
 1014 |    2014
 1009 |    2004
 1020 |    2006
 1002 |    2002
 1008 |    2009
 1022 |    2012
 1040 |    2001
 1017 |    2005
 1004 |    2007
 1005 |    2007
 1017 |    2003
 1008 |    2010
 1001 |    2001
 1003 |    2001
 1022 |    2011
 1002 |    2007
 1004 |    2002
 1005 |    2002
 1011 |    2006
 1023 |    2006
 1040 |    2013
 1009 |    2008
 1005 |    2003
 1004 |    2003
 1010 |    2009
 1007 |    2010
 1017 |    2002
 1002 |    2005
 1007 |    2009
 1002 |    2003
 1005 |    2005
 1001 |    2013
 1003 |    2013
 1017 |    2007
 1004 |    2005
 1010 |    2010
 1001 |    2007
 1003 |    2007
 1017 |    2013
 1040 |    2002
 1002 |    2001
 1011 |    2009
 1014 |    2008
 1020 |    2010
 1003 |    2002
 1001 |    2002
 1020 |    2009
 1011 |    2010
 1008 |    2006
 1040 |    2007
 1005 |    2001
 1004 |    2001
 1012 |    2002
 1014 |    2009
 1011 |    2008
(265 rows)

Problem 2.k Find the pair of different booknos $(b_1,b_2)$ that where bought by the same CS students.
 bookno | bookno
--------+--------
   2010 |   2009
   2009 |   2003
   2012 |   2011
   2005 |   2004
   2013 |   2007
   2007 |   2013
   2011 |   2012
   2010 |   2003
   2003 |   2009
   2004 |   2005
   2009 |   2010
   2003 |   2010
(12 rows)

Problem 2.l Find the pairs of different sid (s1,s2) of students such that all books bought by student s1 were also bought by student s2.
 sid  | sid
------+------
 1016 | 1015
 1016 | 1040
 1016 | 1004
 1005 | 1007
 1016 | 1023
 1005 | 1006
 1016 | 1008
 1013 | 1007
 1006 | 1004
 1016 | 1010
 1012 | 1005
 1014 | 1004
 1016 | 1002
 1011 | 1002
 1040 | 1009
 1011 | 1010
 1016 | 1014
 1009 | 1007
 1022 | 1023
 1015 | 1009
 1015 | 1013
 1016 | 1022
 1012 | 1003
 1015 | 1023
 1015 | 1008
 1012 | 1007
 1015 | 1040
 1015 | 1004
 1008 | 1002
 1012 | 1006
 1020 | 1007
 1015 | 1002
 1008 | 1004
 1040 | 1010
 1012 | 1011
 1011 | 1009
 1015 | 1010
 1003 | 1007
 1040 | 1002
 1015 | 1014
 1016 | 1009
 1015 | 1016
 1016 | 1013
 1020 | 1017
 1005 | 1003
 1015 | 1022
 1020 | 1013
 1016 | 1017
 1012 | 1009
 1008 | 1003
 1015 | 1020
 1009 | 1010
 1011 | 1007
 1001 | 1007
 1015 | 1003
 1012 | 1013
 1009 | 1002
 1015 | 1012
 1040 | 1003
 1020 | 1009
 1005 | 1004
 1008 | 1005
 1013 | 1002
 1016 | 1007
 1013 | 1010
 1005 | 1008
 1016 | 1006
 1014 | 1006
 1014 | 1007
 1016 | 1011
 1016 | 1001
 1015 | 1005
 1005 | 1002
 1040 | 1017
 1012 | 1014
 1010 | 1007
 1015 | 1017
 1016 | 1012
 1016 | 1020
 1002 | 1007
 1013 | 1009
 1016 | 1003
 1015 | 1007
 1011 | 1003
 1012 | 1004
 1015 | 1006
 1020 | 1002
 1040 | 1007
 1003 | 1002
 1012 | 1008
 1004 | 1006
 1020 | 1010
 1017 | 1007
 1015 | 1011
 1015 | 1001
 1012 | 1010
 1016 | 1005
 1008 | 1007
 1040 | 1001
 1040 | 1011
 1012 | 1002
 1008 | 1006
(102 rows)

Problem 2.m Find the bookno of each book that is cited by all but one book.
 bbookno
---------
(0 rows)

Problem 3.a Find the sid and major of each student who bought a book that cost less than 20.
 sid  |  major
------+---------
 1001 | Math
 1001 | Physics
 1002 | CS
 1002 | Math
 1003 | Math
 1004 | CS
 1006 | CS
 1007 | CS
 1007 | Physics
 1008 | Physics
(10 rows)

Problem 3.b Find each $(s,b)$ pair where $s$ is the sid of a student and where $b$ is the bookno of a book whose price is the cheapest among the books bought by that student
 sid  | bookno
------+--------
 1001 |   2009
 1002 |   2007
 1003 |   2007
 1004 |   2007
 1005 |   2007
 1006 |   2007
 1007 |   2009
 1008 |   2007
 1009 |   2002
 1010 |   2003
 1011 |   2002
 1012 |   2011
 1013 |   2001
 1014 |   2008
 1014 |   2011
 1017 |   2003
 1020 |   2001
 1022 |   2014
 1023 |   2014
 1040 |   2002
(20 rows)

Problem 3.c Find the bookno and title of each book that cost between 20 and 40 and that is cited by another book.
 bookno |        title
--------+---------------------
   2013 | RealAnalysis
   2001 | Databases
   2006 | SQL
   2003 | Networks
   2005 | DiscreteMathematics
   2002 | OperatingSystems
(6 rows)

Problem 3.d Find the sid and name of each student who majors in CS and who bought a book that is cited by a lower priced book.
 sid  |   sname
------+-----------
 1002 | Maria
 1004 | Chin
 1006 | Ryan
 1007 | Catherine
 1011 | Nick
 1012 | Eric
 1013 | Lisa
 1022 | Qin
(8 rows)

Problem 3.e Find the bookno and title of each book that is not bought by all students who major in CS.
 bookno |        title
--------+----------------------
   2001 | Databases
   2002 | OperatingSystems
   2003 | Networks
   2004 | AI
   2005 | DiscreteMathematics
   2006 | SQL
   2007 | ProgrammingLanguages
   2008 | DataScience
   2009 | Calculus
   2010 | Philosophy
   2011 | Anthropology
   2012 | Geometry
   2013 | RealAnalysis
   2014 | Topology
(14 rows)

Problem 3.f Find the bookno and title of each book that is bought by all students who major in both CS and in Math.
 bookno |      title
--------+------------------
   2012 | Geometry
   2002 | OperatingSystems
   2011 | Anthropology
(3 rows)
