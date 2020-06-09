
-- 学生表：Student（编号sid，姓名sname，年龄sage，性别ssex)
-- 课程表：Course（课程编号cid，课程名称cname，教师编号tid）
-- 成绩表：Sc（学生编号sid，课程编号cid，成绩score）
-- 教师表：Teacher（教师编号tid，姓名tname）


1.查询“001”课程比“002”课程成绩高的所有学生的学号；
-- 查询   “001”课程比“002”课程    成绩高的(where条件)    所有学生的学号(名词作为字段)；

SELECT a.sid FROM 
(SELECT score,sid FROM sc  WHERE cid='001') a
INNER JOIN 
(SELECT score,sid FROM sc  WHERE cid='002') b
ON a.sid = b.sid WHERE a.score >b.score;

-- 2、查询平均成绩大于60分的同学的学号和平均成绩
-- 查询   平均成绩  大于60分   的同学的    学号和平均成绩
SELECT sid,AVG(score) FROM sc  GROUP BY sid HAVING AVG(score)>60;

-- 3、查询所有同学的学号、姓名、选课数、总成绩
SELECT a.sid,sname,COUNT(a.cid),SUM(score) FROM 
sc a ,student b 
WHERE a.`sid` = b.`sid` GROUP BY a.`sid`;

SELECT a.sid,sname,COUNT(*),SUM(score) FROM 
sc a ,student b 
WHERE a.`sid` = b.`sid` GROUP BY a.`sid`;

SELECT a.sid,sname,COUNT(*),SUM(score) FROM 
sc a INNER JOIN student b 
ON a.`sid` = b.`sid` GROUP BY a.`sid`;

-- 4、查询姓“李”的老师的个数
SELECT COUNT(DISTINCT(tid)) FROM teacher t WHERE tname LIKE '%李%' ;
elect Sno,Sname from Student where Sno not in (
select Sno from Score where Cno in (
select Cno from Course where Tno = (
select Tno from Teacher where Tname ='李诚')));

select Sno,Sname from Student where Sno not in(
select Score.Sno from Score inner join Course on Score.Cno=Course.Cno inner join Teacher on Course.Tno=Teacher.Tno where Tname='李诚');

-- 5、查询没学过“叶平”老师课的同学的学号、姓名


SELECT sid,sname FROM student WHERE sid NOT IN (
SELECT sid FROM sc WHERE cid IN (
SELECT cid FROM course WHERE tid = (
SELECT tid FROM teacher WHERE tname ='叶平')));


SELECT sid,sname FROM student WHERE sid NOT IN(
SELECT c.`sid` FROM sc c INNER JOIN course b ON c.`cid`=b.`cid` INNER JOIN teacher d ON b.`tid`=d.`tid` WHERE tname='叶平');


-- 6、查询学过“001”并且也学过编号“002”课程的同学的学号、姓名

SELECT a.sid,sname FROM student a INNER JOIN sc c ON a.`sid` = c.`sid` WHERE cid = '001' AND a.`sid` 
IN (SELECT a.sid FROM student a INNER JOIN sc c ON a.`sid` = c.`sid` WHERE cid = '002');

SELECT sid,sname FROM student WHERE sid IN(SELECT sid FROM sc WHERE cid='001') AND sid IN(SELECT sid FROM sc WHERE cid='002');
-- 7、查询学过“叶平”老师所教的所有课的同学的学号、姓名
SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc WHERE cid IN(
SELECT cid FROM course WHERE tid =(
SELECT tid FROM teacher WHERE tname = '叶平'))
GROUP BY sid 
HAVING COUNT(*)=(SELECT COUNT(*) FROM course,teacher WHERE course.tid=teacher.tid AND tname ='叶平')
);

SELECT student.sid,student.sname FROM student,sc,course,teacher WHERE student.sid=sc.sid
AND sc.cid=course.cid AND course.tid = teacher.tid AND teacher.tname='叶平'
GROUP BY sid 
HAVING COUNT(*) = (SELECT COUNT(*) FROM course,teacher WHERE course.tid= teacher.tid AND teacher.tname= '叶平');
-- 8、查询课程编号“002”的成绩比课程编号“001”课程低的所有同学的学号、姓名；

SELECT sid,sname FROM student a WHERE a.sid IN (SELECT sid FROM sc WHERE cid = '001');

SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc a2 WHERE cid='002' AND score>
(SELECT score FROM sc a1 WHERE cid='001' AND a1.sid=a2.sid));


SELECT sid,sname FROM 
(SELECT student.sid,student.sname,score,
(SELECT score FROM sc SC_2 WHERE SC_2.sid=student.sid AND SC_2.cid='002') sc2 
FROM student,sc WHERE student.sid=sc.sid AND cid ='001') S_2 WHERE sc2 > score; 

-- 9、查询所有课程成绩小于60分的同学的学号、姓名；
SELECT sid,sname FROM student a WHERE a.sid NOT IN (SELECT sid FROM sc WHERE score>60);
-- 10、查询没有学全所有课的同学的学号、姓名；
SELECT sid,sname FROM student WHERE sid NOT IN (
SELECT sid FROM sc GROUP BY sid
HAVING COUNT(*) = (
SELECT COUNT(DISTINCT(cid)) FROM sc));

SELECT sid,Sname FROM student WHERE sid NOT IN (
SELECT sid FROM sc GROUP BY sid
HAVING COUNT(*) = (
SELECT COUNT(*) FROM course));

SELECT student.sid,student.sname
FROM student,sc
WHERE student.sid=sc.sid GROUP BY  student.sid,student.sname 
HAVING COUNT(cid) <(SELECT COUNT(cid) FROM course);
-- 11、查询至少有一门课与学号为“1001”的同学所学相同的同学的学号和姓名；
SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc WHERE cid IN (
SELECT cid FROM sc WHERE sid = '1001'));   
-- 12、查询与“1001”同学所学课程相同的其他同学学号和姓名；
SELECT sid,sname FROM student WHERE sid IN(
SELECT sid FROM sc a WHERE cid IN (SELECT cid FROM sc WHERE sid='1001')
GROUP BY sid 
HAVING COUNT(*) = (SELECT COUNT(*) FROM sc WHERE sid='1001')
);
-- 14、查询和“1002”号的同学学习的课程完全相同的其他同学学号和姓名；
SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc WHERE sid NOT IN(
SELECT sid FROM sc WHERE cid NOT IN (SELECT cid FROM sc WHERE sid = '1002'))
GROUP BY sid
HAVING COUNT(cid) = (SELECT COUNT(cid) FROM sc WHERE sid = '1002'));
