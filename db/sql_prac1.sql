
-- ѧ����Student�����sid������sname������sage���Ա�ssex)
-- �γ̱�Course���γ̱��cid���γ�����cname����ʦ���tid��
-- �ɼ���Sc��ѧ�����sid���γ̱��cid���ɼ�score��
-- ��ʦ��Teacher����ʦ���tid������tname��


1.��ѯ��001���γ̱ȡ�002���γ̳ɼ��ߵ�����ѧ����ѧ�ţ�
-- ��ѯ   ��001���γ̱ȡ�002���γ�    �ɼ��ߵ�(where����)    ����ѧ����ѧ��(������Ϊ�ֶ�)��

SELECT a.sid FROM 
(SELECT score,sid FROM sc  WHERE cid='001') a
INNER JOIN 
(SELECT score,sid FROM sc  WHERE cid='002') b
ON a.sid = b.sid WHERE a.score >b.score;

-- 2����ѯƽ���ɼ�����60�ֵ�ͬѧ��ѧ�ź�ƽ���ɼ�
-- ��ѯ   ƽ���ɼ�  ����60��   ��ͬѧ��    ѧ�ź�ƽ���ɼ�
SELECT sid,AVG(score) FROM sc  GROUP BY sid HAVING AVG(score)>60;

-- 3����ѯ����ͬѧ��ѧ�š�������ѡ�������ܳɼ�
SELECT a.sid,sname,COUNT(a.cid),SUM(score) FROM 
sc a ,student b 
WHERE a.`sid` = b.`sid` GROUP BY a.`sid`;

SELECT a.sid,sname,COUNT(*),SUM(score) FROM 
sc a ,student b 
WHERE a.`sid` = b.`sid` GROUP BY a.`sid`;

SELECT a.sid,sname,COUNT(*),SUM(score) FROM 
sc a INNER JOIN student b 
ON a.`sid` = b.`sid` GROUP BY a.`sid`;

-- 4����ѯ�ա������ʦ�ĸ���
SELECT COUNT(DISTINCT(tid)) FROM teacher t WHERE tname LIKE '%��%' ;
elect Sno,Sname from Student where Sno not in (
select Sno from Score where Cno in (
select Cno from Course where Tno = (
select Tno from Teacher where Tname ='���')));

select Sno,Sname from Student where Sno not in(
select Score.Sno from Score inner join Course on Score.Cno=Course.Cno inner join Teacher on Course.Tno=Teacher.Tno where Tname='���');

-- 5����ѯûѧ����Ҷƽ����ʦ�ε�ͬѧ��ѧ�š�����


SELECT sid,sname FROM student WHERE sid NOT IN (
SELECT sid FROM sc WHERE cid IN (
SELECT cid FROM course WHERE tid = (
SELECT tid FROM teacher WHERE tname ='Ҷƽ')));


SELECT sid,sname FROM student WHERE sid NOT IN(
SELECT c.`sid` FROM sc c INNER JOIN course b ON c.`cid`=b.`cid` INNER JOIN teacher d ON b.`tid`=d.`tid` WHERE tname='Ҷƽ');


-- 6����ѯѧ����001������Ҳѧ����š�002���γ̵�ͬѧ��ѧ�š�����

SELECT a.sid,sname FROM student a INNER JOIN sc c ON a.`sid` = c.`sid` WHERE cid = '001' AND a.`sid` 
IN (SELECT a.sid FROM student a INNER JOIN sc c ON a.`sid` = c.`sid` WHERE cid = '002');

SELECT sid,sname FROM student WHERE sid IN(SELECT sid FROM sc WHERE cid='001') AND sid IN(SELECT sid FROM sc WHERE cid='002');
-- 7����ѯѧ����Ҷƽ����ʦ���̵����пε�ͬѧ��ѧ�š�����
SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc WHERE cid IN(
SELECT cid FROM course WHERE tid =(
SELECT tid FROM teacher WHERE tname = 'Ҷƽ'))
GROUP BY sid 
HAVING COUNT(*)=(SELECT COUNT(*) FROM course,teacher WHERE course.tid=teacher.tid AND tname ='Ҷƽ')
);

SELECT student.sid,student.sname FROM student,sc,course,teacher WHERE student.sid=sc.sid
AND sc.cid=course.cid AND course.tid = teacher.tid AND teacher.tname='Ҷƽ'
GROUP BY sid 
HAVING COUNT(*) = (SELECT COUNT(*) FROM course,teacher WHERE course.tid= teacher.tid AND teacher.tname= 'Ҷƽ');
-- 8����ѯ�γ̱�š�002���ĳɼ��ȿγ̱�š�001���γ̵͵�����ͬѧ��ѧ�š�������

SELECT sid,sname FROM student a WHERE a.sid IN (SELECT sid FROM sc WHERE cid = '001');

SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc a2 WHERE cid='002' AND score>
(SELECT score FROM sc a1 WHERE cid='001' AND a1.sid=a2.sid));


SELECT sid,sname FROM 
(SELECT student.sid,student.sname,score,
(SELECT score FROM sc SC_2 WHERE SC_2.sid=student.sid AND SC_2.cid='002') sc2 
FROM student,sc WHERE student.sid=sc.sid AND cid ='001') S_2 WHERE sc2 > score; 

-- 9����ѯ���пγ̳ɼ�С��60�ֵ�ͬѧ��ѧ�š�������
SELECT sid,sname FROM student a WHERE a.sid NOT IN (SELECT sid FROM sc WHERE score>60);
-- 10����ѯû��ѧȫ���пε�ͬѧ��ѧ�š�������
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
-- 11����ѯ������һ�ſ���ѧ��Ϊ��1001����ͬѧ��ѧ��ͬ��ͬѧ��ѧ�ź�������
SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc WHERE cid IN (
SELECT cid FROM sc WHERE sid = '1001'));   
-- 12����ѯ�롰1001��ͬѧ��ѧ�γ���ͬ������ͬѧѧ�ź�������
SELECT sid,sname FROM student WHERE sid IN(
SELECT sid FROM sc a WHERE cid IN (SELECT cid FROM sc WHERE sid='1001')
GROUP BY sid 
HAVING COUNT(*) = (SELECT COUNT(*) FROM sc WHERE sid='1001')
);
-- 14����ѯ�͡�1002���ŵ�ͬѧѧϰ�Ŀγ���ȫ��ͬ������ͬѧѧ�ź�������
SELECT sid,sname FROM student WHERE sid IN (
SELECT sid FROM sc WHERE sid NOT IN(
SELECT sid FROM sc WHERE cid NOT IN (SELECT cid FROM sc WHERE sid = '1002'))
GROUP BY sid
HAVING COUNT(cid) = (SELECT COUNT(cid) FROM sc WHERE sid = '1002'));
