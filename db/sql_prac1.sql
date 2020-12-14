
-- Ñ§Éú±í£ºStudent£¨±àºÅsid£¬ÐÕÃûsname£¬ÄêÁäsage£¬ÐÔ±ðssex)
-- ¿Î³Ì±í£ºCourse£¨¿Î³Ì±àºÅcid£¬¿Î³ÌÃû³Æcname£¬½ÌÊ¦±àºÅtid£©
-- ³É¼¨±í£ºSc£¨Ñ§Éú±àºÅsid£¬¿Î³Ì±àºÅcid£¬³É¼¨score£©
-- ½ÌÊ¦±í£ºTeacher£¨½ÌÊ¦±àºÅtid£¬ÐÕÃûtname£©


1.²éÑ¯¡°001¡±¿Î³Ì±È¡°002¡±¿Î³Ì³É¼¨¸ßµÄËùÓÐÑ§ÉúµÄÑ§ºÅ£»
-- ²éÑ¯   ¡°001¡±¿Î³Ì±È¡°002¡±¿Î³Ì    ³É¼¨¸ßµÄ(whereÌõ¼þ)    ËùÓÐÑ§ÉúµÄÑ§ºÅ(Ãû´Ê×÷Îª×Ö¶Î)£»

SELECT a.sid FROM 
(SELECT score,sid FROM sc  WHERE cid='001') a
INNER JOIN 
(SELECT score,sid FROM sc  WHERE cid='002') b
ON a.sid = b.sid WHERE a.score >b.score;

-- 2¡¢²éÑ¯Æ½¾ù³É¼¨´óÓÚ60·ÖµÄÍ¬Ñ§µÄÑ§ºÅºÍÆ½¾ù³É¼¨
-- ²éÑ¯   Æ½¾ù³É¼¨  ´óÓÚ60·Ö   µÄÍ¬Ñ§µÄ    Ñ§ºÅºÍÆ½¾ù³É¼¨
SELECT sid,AVG(score) FROM sc  GROUP BY sid HAVING AVG(score)>60;

-- 3¡¢²éÑ¯ËùÓÐÍ¬Ñ§µÄÑ§ºÅ¡¢ÐÕÃû¡¢Ñ¡¿ÎÊý¡¢×Ü³É¼¨
SELECT a.sid,sname,COUNT(a.cid),SUM(score) FROM 
sc a ,student b 
WHERE a.`sid` = b.`sid` GROUP BY a.`sid`;

SELECT a.sid,sname,COUNT(*),SUM(score) FROM 
sc a ,student b 
WHERE a.`sid` = b.`sid` GROUP BY a.`sid`;

SELECT a.sid,sname,COUNT(*),SUM(score) FROM 
sc a INNER JOIN student b 
ON a.`sid` = b.`sid` GROUP BY a.`sid`;

-- 4¡¢²éÑ¯ÐÕ¡°Àî¡±µÄÀÏÊ¦µÄ¸öÊý
SELECT COUNT(DISTINCT(tid)) FROM teacher t WHERE tname LIKE '%Àî%' ;
elect Sno,Sname from Student where Sno not in (
select Sno from Score where Cno in (
select Cno from Course where Tno = (
select Tno from Teacher where Tname ='Àî³Ï')));

select Sno,Sname from Student where Sno not in(
select Score.Sno from Score inner join Course on Score.Cno=Course.Cno inner join Teacher on Course.Tno=Teacher.Tno where Tname='Àî³Ï');

-- 5¡¢²éÑ¯Ã»Ñ§¹ý¡°Ò¶Æ½¡±ÀÏÊ¦¿ÎµÄÍ¬Ñ§µÄÑ§ºÅ¡¢ÐÕÃû


SELECT sid,sname FROM student WHERE sid NOT IN (
SELECT sid FROM sc WHERE cid IN (
SELECT cid FROM course WHERE tid = (
SELECT tid FROM teacher WHERE tname ='Ò¶Æ½')));


SELECT sid,sname FROM student WHERE sid NOT IN(
SELECT c.`sid` FROM sc c INNER JOIN course b ON c.`cid`=b.`cid` INNER JOIN teacher d ON b.`tid`=d.`tid` WHERE tname='Ò¶Æ½');


-- 6¡¢²éÑ¯Ñ§¹ý¡°001¡±²¢ÇÒÒ²Ñ§¹ý±àºÅ¡°002¡±¿Î³ÌµÄÍ¬Ñ§µÄÑ§ºÅ¡¢ÐÕÃû

SELECT a.sid,sname FROM student a INNER JOIN sc c ON a.`sid` = c.`sid` WHERE cid = '001' AND a.`sid` 
IN (SELECT a.sid FROM student a INNER JOIN sc c ON a.`sid` = c.`sid` WHERE cid = '002');

SELECT sid,sname FROM student WHERE sid IN(SELECT sid FROM sc WHERE cid='001') AND sid IN(SELECT sid FROM sc WHERE cid='002');
-- 7¡¢²éÑ¯Ñ§¹ý¡°Ò¶Æ½¡±ÀÏÊ¦Ëù½ÌµÄËùÓÐ¿ÎµÄÍ¬Ñ§µÄÑ§ºÅ¡¢ÐÕÃû
SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc WHERE cid IN(
SELECT cid FROM course WHERE tid =(
SELECT tid FROM teacher WHERE tname = 'Ò¶Æ½'))
GROUP BY sid 
HAVING COUNT(*)=(SELECT COUNT(*) FROM course,teacher WHERE course.tid=teacher.tid AND tname ='Ò¶Æ½')
);

SELECT student.sid,student.sname FROM student,sc,course,teacher WHERE student.sid=sc.sid
AND sc.cid=course.cid AND course.tid = teacher.tid AND teacher.tname='Ò¶Æ½'
GROUP BY sid 
HAVING COUNT(*) = (SELECT COUNT(*) FROM course,teacher WHERE course.tid= teacher.tid AND teacher.tname= 'Ò¶Æ½');
-- 8¡¢²éÑ¯¿Î³Ì±àºÅ¡°002¡±µÄ³É¼¨±È¿Î³Ì±àºÅ¡°001¡±¿Î³ÌµÍµÄËùÓÐÍ¬Ñ§µÄÑ§ºÅ¡¢ÐÕÃû£»

SELECT sid,sname FROM student a WHERE a.sid IN (SELECT sid FROM sc WHERE cid = '001');

SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc a2 WHERE cid='002' AND score>
(SELECT score FROM sc a1 WHERE cid='001' AND a1.sid=a2.sid));


SELECT sid,sname FROM 
(SELECT student.sid,student.sname,score,
(SELECT score FROM sc SC_2 WHERE SC_2.sid=student.sid AND SC_2.cid='002') sc2 
FROM student,sc WHERE student.sid=sc.sid AND cid ='001') S_2 WHERE sc2 > score; 

-- 9¡¢²éÑ¯ËùÓÐ¿Î³Ì³É¼¨Ð¡ÓÚ60·ÖµÄÍ¬Ñ§µÄÑ§ºÅ¡¢ÐÕÃû£»
SELECT sid,sname FROM student a WHERE a.sid NOT IN (SELECT sid FROM sc WHERE score>60);
-- 10¡¢²éÑ¯Ã»ÓÐÑ§È«ËùÓÐ¿ÎµÄÍ¬Ñ§µÄÑ§ºÅ¡¢ÐÕÃû£»
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
-- 11¡¢²éÑ¯ÖÁÉÙÓÐÒ»ÃÅ¿ÎÓëÑ§ºÅÎª¡°1001¡±µÄÍ¬Ñ§ËùÑ§ÏàÍ¬µÄÍ¬Ñ§µÄÑ§ºÅºÍÐÕÃû£»
SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc WHERE cid IN (
SELECT cid FROM sc WHERE sid = '1001'));   
-- 12¡¢²éÑ¯Óë¡°1001¡±Í¬Ñ§ËùÑ§¿Î³ÌÏàÍ¬µÄÆäËûÍ¬Ñ§Ñ§ºÅºÍÐÕÃû£»
SELECT sid,sname FROM student WHERE sid IN(
SELECT sid FROM sc a WHERE cid IN (SELECT cid FROM sc WHERE sid='1001')
GROUP BY sid 
HAVING COUNT(*) = (SELECT COUNT(*) FROM sc WHERE sid='1001')
);
-- 14¡¢²éÑ¯ºÍ¡°1002¡±ºÅµÄÍ¬Ñ§Ñ§Ï°µÄ¿Î³ÌÍêÈ«ÏàÍ¬µÄÆäËûÍ¬Ñ§Ñ§ºÅºÍÐÕÃû£»
SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc WHERE sid NOT IN(
SELECT sid FROM sc WHERE cid NOT IN (SELECT cid FROM sc WHERE sid = '1002'))
GROUP BY sid
HAVING COUNT(cid) = (SELECT COUNT(cid) FROM sc WHERE sid = '1002'));
-- 15¡¢É¾³ýÑ§Ï°¡°Ò¶Æ½¡±ÀÏÊ¦¿ÎµÄSC±í¼ÇÂ¼£»
DELETE FROM sc WHERE cid IN (
SELECT cid FROM course WHERE tid IN (
SELECT tid FROM teacher WHERE tname='Ò¶Æ½'));
-- 16¡¢ÏòSC±íÖÐ²åÈëÒ»Ð©¼ÇÂ¼£¬ÕâÐ©¼ÇÂ¼ÒªÇó·ûºÏÒÔÏÂÌõ¼þ£ºÃ»ÓÐÉÏ¹ý±àºÅ¡°003¡±¿Î³ÌµÄÍ¬Ñ§Ñ§ºÅ¡¢¡¯002¡¯ºÅ¿ÎµÄÆ½¾ù³É¼¨£»
-- ÏÂÃæÕâ¸ösqlÃ»ÓÐÖ´ÐÐ³É¹¦£¬sqlÓÐÎÊÌâ
INSERT INTO sc (sid,cid,score)
VALUES
(SELECT sid,002,(SELECT AVG(score) FROM sc WHERE cid ='002' ) FROM student WHERE sid NOT IN (SELECT sid FROM sc WHERE cid = '003'));

-- 17¡¢°´Æ½¾ù³É¼¨´Ó¸ßµ½µÍÏÔÊ¾ËùÓÐÑ§ÉúµÄ¡°JAVA¡±¡¢¡°C#¡±¡¢¡°C++¡±ÈýÃÅµÄ¿Î³Ì³É¼¨£¬°´ÈçÏÂÐÎÊ½ÏÔÊ¾£º Ñ§ÉúID,,C#,C++,JAVA,ÓÐÐ§¿Î³ÌÊý,ÓÐÐ§Æ½¾ù·Ö¡£

SELECT sid AS 'Ñ§ÉúID',
(SELECT score FROM sc a WHERE cid =(SELECT cid FROM course WHERE cname='C#') AND a.sid=SC.sid) AS 'C#',
(SELECT score FROM sc b WHERE cid =(SELECT cid FROM course WHERE cname='C++') AND b.sid=SC.sid) AS 'C++',
(SELECT score FROM sc c WHERE cid =(SELECT cid FROM course WHERE cname='JAVA') AND c.sid=SC.sid) AS 'JAVA',
COUNT(*) AS 'ÓÐÐ§¿Î³ÌÊý',
AVG(score) AS 'ÓÐÐ§Æ½¾ù·Ö'
FROM sc SC GROUP BY sid 
ORDER BY AVG(score) DESC;
-- 18查询各科成绩最高和最低的分：以如下形式显示：课程ID，最高分，最低分;

#自己写的
SELECT cid AS '¿Î³ÌID',MAX(score) AS '×î¸ß·Ö',MIN(score) AS '×îµÍ·Ö' FROM sc GROUP BY cid;
#网上的
SELECT L.Cno AS ¿Î³ÌID,L.score AS ×î¸ß·Ö,R.score AS ×îµÍ·Ö 
    FROM SC L ,SC AS R 
    WHERE L.Cno = R.Cno AND 
        L.Degree = (SELECT MAX(IL.Degree) 
                      FROM SC AS IL,Student AS IM 
                      WHERE L.Cno = IL.Cno AND IM.Sno=IL.Sno 
                      GROUP BY IL.Cno) 
        AND 
        R.Score = (SELECT MIN(IR.Degree) 
                      FROM SC AS IR 
                      WHERE R.Cno = IR.Cno 
                  GROUP BY IR.Cno
                    ); 
-- 19、按各科平均成绩从低到高和及格率的百分数从高到低顺序 ；
#自己写的
SELECT * FROM Score a ORDER BY 
(SELECT AVG(Degree) FROM Score b WHERE a.Cno=b.Cno GROUP BY Cno) ASC,
(SELECT COUNT(*) FROM Score c WHERE Degree > 60 AND a.Cno=c.Cno GROUP BY Cno)/(SELECT COUNT(*) FROM Score d WHERE a.Cno=d.Cno GROUP BY Cno) DESC;
#网上的
SELECT t.C# AS 课程号,max(course.Cname)AS 课程名,isnull(AVG(score),0) AS平均成绩,100 * SUM(CASE WHEN  isnull(score,0)>=60 THEN 1 ELSE 0 END)/COUNT(*) AS 及格百分数
    FROM SC T,Course
    WHERE t.C#=course.C#
    GROUP BY t.C#
    ORDER BY 100* SUM(CASE WHEN  ISNULL(score,0)>=60 THEN 1 ELSE 0 END)/COUNT(*) DESC
-- 23、统计列印各科成绩,各分数段人数:课程ID,课程名称,[100-85],[85-70],[70-60],[ <60]
SELECT sc.cid AS 课程ID, cname AS 课程名称 
        ,SUM(CASE WHEN score BETWEEN 85 AND 100 THEN 1 ELSE 0 END) AS abc
        ,SUM(CASE WHEN score BETWEEN 70 AND 85 THEN 1 ELSE 0 END) AS a2
        ,SUM(CASE WHEN score BETWEEN 60 AND 70 THEN 1 ELSE 0 END) AS a3
        ,SUM(CASE WHEN score < 60 THEN 1 ELSE 0 END) AS a4
    FROM sc,course 
    WHERE sc.`cid`=course.`cid` 
    GROUP BY sc.cid,cname;
