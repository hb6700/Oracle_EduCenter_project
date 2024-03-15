

--[과정명 기능]
--과정명 등록
insert into tblCourseName (courseName_seq, courseName) values(6,'(디지털컨버전스) Java기반 멀티 플랫폼 융합 SW개발자 양성 과정');
--과정명 
select courseName,courseName_seq as 과정명 from tblCourseName;
--과정명 수정
update tblCourseName set courseName = '(스마트웹&콘텐츠 개발) AI기반 스마트 플랫폼 Back-End SW개발자 양성 과정' where courseName_seq =3;
--과정명 삭제
delete from tblCourseName where couseName_seq=3;

--[과정 등록 기능]
--과정 등록
insert into tblCourse (course_seq, courseStartDate, courseEndDate, room_seq, courseStatus_seq,courseName_seq)
 valuses ( 25, 23/09/20, 24/02/20, (select room_seq from tblCourseRoom) , (select courseName_seq from tblCourseName);
 
--과정 
select * from tblcourse;
--과정 수정
update tblcourse set courseStartDate = 2022/02/14 where course_seq=1;
--과정 삭제
delete frome tblCourse where course_seq=1;

--[강의실 관리]
--강의실 등록
insert into tblCourseRoom (room_seq,population,availability) values (7,30,'사용중');
--강의실 
select * from tblcourseRoom;
-강의실 수정
update tblcourseRoom set population = 26 where room_seq=1;
--강의실 삭제
delete from tblcourseRoom where room_seq=5;

--[교재명 관리]
--교재 등록
insert into tblTextbook (textBook_seq, textbook, publihser, author. publishedDate, bookType)
values( 43 , 'ERD의 이해2', '한빛 아카데미' '오일석' ,2023-02-28, '공통교과');
--교재 
select textbook from tblTextbook where textbook_seq=3;
--교재 수정
update tblTextbook set author name= '윤성우' where textBook_seq=11;
--교재 삭제
delete from tblTextbook where textBook_seq=30;

--교사 등록
insert into tblTeacher (teacher_seq , teacherName, teacherPw, teacherTel)
values ( (select max( teacher_seq ) from tblTeacher) +1 , '박세인' , 1847596, '010-3847-3984');
--강사정보 수정
select * from tblTeacher;
update tblTeacher set teacherName ='박세인'
where teacher_seq=3;
--교사정보 삭제
delete from tblteacher where teacher_seq =3;
--교사정보 
select * from tblteacher where teacher_seq = 3;
--교사-> 학생정보 
select
s.student_seq as 학생번호,
cn.courseName as 과정명,
to_char(c.courseStartDate) || ' ~ ' || to_char(c.courseEndDate) as "과정기간",
cs.courseSubject_seq as 과목번호,
sj.subject as 과목명,
to_char(cs.courseSubjectStartDate) || ' ~ ' || to_char(cs.cousesubjectenddate) as "과목기간",
cr.room_seq as 강의실 
 
from tblTeacher t
inner join tblSubjectAvailability sa
on sa.teacher_seq= t.teacher_seq
inner join tblcourseSubject cs
on cs.subjectavailability_seq = sa.subjectavailability_seq
inner join tblTextbook tb
on tb.textBook_seq = cs.textBook_seq
inner join tblCourse c
on c.course_seq = cs.course_seq
inner join tblCourseRoom cr
on cr.room_seq = c.room_seq
inner join tblCourseName cn
on cn.coursename_seq = c.coursename_seq
inner join tblsubject sj
on sj.subject_seq = sa.subject_seq
inner join tblCourseReg crg
on c.course_seq = crg.course_seq
inner join tblStudent s
on s.student_seq= crg.student_seq
where s.student_seq = 1;

select
s.student_seq as 학생번호,
cn.courseName as 과정명,
to_char(c.courseStartDate) || ' ~ ' || to_char(c.courseEndDate) as "과정기간",
cs.courseSubject_seq as 과목번호,
sj.subject as 과목명,
to_char(cs.courseSubjectStartDate) || ' ~ ' || to_char(cs.cousesubjectenddate) as "과목기간",
cr.room_seq as 강의실 
 
from tblTeacher t
inner join tblSubjectAvailability sa
on sa.teacher_seq= t.teacher_seq
inner join tblcourseSubject cs
on cs.subjectavailability_seq = sa.subjectavailability_seq
inner join tblTextbook tb
on tb.textBook_seq = cs.textBook_seq
inner join tblCourse c
on c.course_seq = cs.course_seq
inner join tblCourseRoom cr
on cr.room_seq = c.room_seq
inner join tblCourseName cn
on cn.coursename_seq = c.coursename_seq
inner join tblsubject sj
on sj.subject_seq = sa.subject_seq
inner join tblCourseReg crg
on c.course_seq = crg.course_seq
inner join tblStudent s
on s.student_seq= crg.student_seq
where s.student_seq = 1;

개설 과목 정보 등록
insert into tblCourse (course_seq, courseStartDate, courseEndDate, room_seq, courseStatus_seq,courseName_seq)
valuses ( 25, 23/09/20, 24/02/20, (select room_seq from tblCourseRoom) , (select courseName_seq from tblCourseName);
개설 과목 정보 수정
update tblcourse set courseStartDate = 2022/02/14 where course_seq=1;
개설 과목 정보 삭제
delete frome tblCourse where course_seq=1;
개설 과목 정보 
select * from tblcourse;

--교육생 정보 등록
insert into tblStudent ( student_seq, studentName, studentPw, studentTel)
values( (select max ( student_seq) from tblStudent ) +1, '박세인', 1125957, '010-3954-3684');
--교육생 정보 수정
update tblStudent set studentName= '박세인' 
where student_seq=5;
교육생 정보 삭제
delete from tblStudent where student_seq=3;
교육생 정보 
select * from tblStudent where student_seq = 10;

--7.1
-- 특정 과정에 개설된 과목 목록 
-- 과목 정보 + 성적 등록 여부 + 시험문제 파일 등록 여부
-- 과목정보 :
-- 개설 과정 정보(과정명, 과정기간(시작 년월일, 끝 년월일), 강의실)
-- 과목명, 과목기간(시작 년월일, 끝 년월일), 교재명, 교사명
SELECT
 c.course_seq,
 cn.coursename,
 c.coursestartdate,
 c.courseenddate,
 c.room_seq,
 cs.coursesubject_seq,
 s.subject,
 cs.coursesubjectstartdate,
 cs.cousesubjectenddate,
 b.textbook,
 t.teachername,
 CASE
 WHEN subq.count2 <> subq.count1 THEN to_char(subq.count2 - subq.count1) || '명 입력 안함'
 ELSE '전부 입력함'
 END "성적 입력 여부",
 CASE
 WHEN cs.coursesubject_seq IN (SELECT coursesubject_seq FROM tblexam) THEN 'Y'
 ELSE 'N'
 END AS "시험문제 등록 여부"
FROM tblcoursesubject cs
 INNER JOIN tblcourse c
 ON cs.course_seq = c.course_seq
 INNER JOIN tblcoursename cn
 ON c.coursename_seq = cn.coursename_seq
 INNER JOIN tblsubjectavailability sa
 ON cs.subjectavailability_seq = sa.subjectavailability_seq
 INNER JOIN tblsubject s
 ON sa.subject_seq = s.subject_seq
 INNER JOIN tbltextbook b
 ON cs.textbook_seq = b.textbook_seq
 INNER JOIN tblteacher t
 ON sa.teacher_seq = t.teacher_seq
 INNER JOIN (SELECT ccc, COUNT(aaa) AS count1, count(*) AS count2
 FROM (SELECT 
 p.COURSESUBJECT_SEQ AS ccc,
 alls.STUDENT_SEQ AS bbb,
 CASE
 WHEN (count(alls.ATTENDSCORE) + count(alls.WSCORE) + count(alls.PSCORE)) <> 3 then null
 ELSE 1
 END AS aaa
 FROM tblcoursesubject cs
 INNER JOIN tblcourse c
 ON cs.course_seq = c.course_seq
 INNER JOIN TBLPOINT p
 ON cs.COURSESUBJECT_SEQ = p.COURSESUBJECT_SEQ
 INNER JOIN TBLALLSCORE alls
 ON p.POINTNUM = alls.POINTNUM 
 WHERE c.COURSE_SEQ = 14/*원하는 과정 번호*/
 GROUP BY p.COURSESUBJECT_SEQ, alls.STUDENT_SEQ 
 ORDER BY ccc) sub
 GROUP BY ccc) subq
 ON subq.ccc = cs.COURSESUBJECT_SEQ 
 WHERE c.course_seq = 14/*원하는 과정 번호*/;
/*
2. 과목별 성적 정보 
 - 개설 과정명, 개설 과정기간, 강의실명, 개설 과목명, 교사명, 교재명 등을 출력
 - 해당 개설 과목을 수강한 모든 교육생들의 성적 정보(교육생 이름, 주민번호 뒷자리, 필기, 실기)를 같이 출력
*/
SELECT
-- 개설 과정 정보 (과정명, 과정기간, 강의실)
c.course_seq,
cn.coursename,
c.coursestartdate,
c.courseenddate,
c.room_seq,
-- 과목명, 과목기간, 교재명, 교사명
cs.coursesubject_seq,
s.subject,
cs.coursesubjectstartdate,
cs.cousesubjectenddate,
b.textbook,
t.teachername,
score.*
FROM tblcoursesubject cs
INNER JOIN tblcourse c
ON cs.course_seq = c.course_seq
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblsubjectavailability sa
ON cs.subjectavailability_seq = sa.subjectavailability_seq
INNER JOIN tblsubject s
ON sa.subject_seq = s.subject_seq
INNER JOIN tbltextbook b
ON cs.textbook_seq = b.textbook_seq
INNER JOIN tblteacher t
ON sa.teacher_seq = t.teacher_seq
INNER JOIN (SELECT
cs.coursesubject_seq AS a,
std.studentname AS b,
std.studentpw AS c,
alls.wscore AS d,
alls.pscore AS e 
FROM tblcoursesubject cs
INNER JOIN tblcourse c
ON cs.course_seq = c.course_seq
INNER JOIN TBLPOINT p
ON cs.COURSESUBJECT_SEQ = p.COURSESUBJECT_SEQ
INNER JOIN TBLALLSCORE alls
ON p.POINTNUM = alls.POINTNUM 
INNER JOIN tblstudent std
ON alls.student_seq = std.student_seq
WHERE cs.coursesubject_seq = 100) score
ON score.a = cs.coursesubject_seq
WHERE cs.coursesubject_seq = 100/*원하는 개설과목 번호*/;
/*
3. 교육생 개인별 성적 정보 
 - 교육생 이름, 주민번호 뒷자리, 개설 과정명, 개설 과정기간, 강의실명 등을 출력
 - 교육생 개인이 수강한 모든 개설 과목에 대한 성적 정보(개설 과목명, 개설 과목 기간, 교사명, 출력, 필기, 실기)를 같이 출력
*/
SELECT
-- 교육생 이름, 주민번호 뒷자리
std.studentname,
std.studentpw,
-- 개설 과정명, 과정 기간, 강의실명
cn.coursename,
c.coursestartdate,
c.courseenddate,
c.room_seq,
--교육생이 수강한 과목정보
-- 과목명, 과목 기간, 교사명
s.subject,
cs.coursesubjectstartdate,
cs.cousesubjectenddate,
t.teachername,
--출결점수, 필기점수, 실기점수
alls.attendscore,
alls.wscore,
alls.pscore
FROM tblallscore alls
INNER JOIN tblstudent std
ON alls.student_seq = std.student_seq
INNER JOIN tblcoursereg cr
ON std.student_seq = cr.student_seq
INNER JOIN tblcourse c
ON cr.course_seq = c.course_seq
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblpoint p
ON alls.pointnum = p.pointnum
INNER JOIN tblcoursesubject cs
ON p.coursesubject_seq = cs.coursesubject_seq
-- INNER JOIN tblcoursesubject cs
-- ON c.course_seq = cs.course_seq
INNER JOIN tblsubjectavailability sa
ON cs.subjectavailability_seq = sa.subjectavailability_seq
INNER JOIN tblsubject s
ON sa.subject_seq = s.subject_seq
INNER JOIN tblteacher t
ON sa.teacher_seq = t.teacher_seq
WHERE std.student_seq = 1/*원하는 교육생 번호*/;
/*
- 과정 목록에서 특정 과정 선택시
1. 모든 일자의 모든 교육생에 대한 출결 정보를 출력
2. 특정 과정의 특정 기간별 출결 현황 
3. 특정 과정의 특정 교육생의 출결 현황 
4. 특정 특정 교육생의 특정 기간별 출결 현황 
모든 출결 는 근태 상황을 구분할 수 있어야 한다.(정상, 지각, 조퇴, 외출, 병가, 기타)
*/
-- 모든 일자 모든 교육생
SELECT
--과정 정보
c.course_seq,
cn.coursename,
c.coursestartdate,
c.courseenddate,
c.room_seq,
-- 학생 정보
std.student_seq,
std.studentname,
std.studentpw,
std.studenttel,
-- 출결 정보
a.attenddate,
ats.attendstate
 
FROM tblcourse c
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblcoursereg cr
ON c.course_seq = cr.course_seq
INNER JOIN tblstudent std
ON cr.student_seq = std.student_seq
INNER JOIN tblattend a
ON std.student_seq = a.student_seq
INNER JOIN tblattendstate ats
ON a.attendstate_seq = ats.attendstate_seq
WHERE c.course_seq = 14/*원하는 과정 번호*/
ORDER BY std.student_seq, a.attenddate;
-- 기간별 
SELECT
--과정 정보
c.course_seq,
cn.coursename,
c.coursestartdate,
c.courseenddate,
c.room_seq,
-- 학생 정보
std.student_seq,
std.studentname,
std.studentpw,
std.studenttel,
-- 출결 정보
a.attenddate,
ats.attendstate
 
FROM tblcourse c
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblcoursereg cr
ON c.course_seq = cr.course_seq
INNER JOIN tblstudent std
ON cr.student_seq = std.student_seq
INNER JOIN tblattend a
ON std.student_seq = a.student_seq
INNER JOIN tblattendstate ats
ON a.attendstate_seq = ats.attendstate_seq
WHERE c.course_seq = 14/*원하는 과정 번호*/ AND
a.attenddate BETWEEN to_date('2023/09/01', 'yyyy/mm/dd') AND to_date('2023/09/30', 'yyyy/mm/dd')
ORDER BY std.student_seq, a.attenddate;
-- 특정 교육생의 출결 현황
SELECT
--과정 정보
c.course_seq,
cn.coursename,
c.coursestartdate,
c.courseenddate,
c.room_seq,
-- 학생 정보
std.student_seq,
std.studentname,
std.studentpw,
std.studenttel,
-- 출결 정보
a.attenddate,
ats.attendstate
 
FROM tblcourse c
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblcoursereg cr
ON c.course_seq = cr.course_seq
INNER JOIN tblstudent std
ON cr.student_seq = std.student_seq
INNER JOIN tblattend a
ON std.student_seq = a.student_seq
INNER JOIN tblattendstate ats
ON a.attendstate_seq = ats.attendstate_seq
WHERE c.course_seq = 14/*원하는 과정 번호*/ AND
std.student_seq = 370/*원하는 학생 번호*/
ORDER BY std.student_seq, a.attenddate;
SELECT object_name
FROM user_objects
WHERE object_type = 'PROCEDURE';
-- 특정 교육생의 특정 기간별 출결 
SELECT
--과정 정보
c.course_seq,
cn.coursename,
c.coursestartdate,
c.courseenddate,
c.room_seq,
-- 학생 정보
std.student_seq,
std.studentname,
std.studentpw,
std.studenttel,
-- 출결 정보
a.attenddate,
ats.attendstate
 
FROM tblcourse c
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblcoursereg cr
ON c.course_seq = cr.course_seq
INNER JOIN tblstudent std
ON cr.student_seq = std.student_seq
INNER JOIN tblattend a
ON std.student_seq = a.student_seq
INNER JOIN tblattendstate ats
ON a.attendstate_seq = ats.attendstate_seq
WHERE c.course_seq = 14/*원하는 과정 번호*/ AND
a.attenddate BETWEEN to_date('2023/09/01', 'yyyy/mm/dd') AND to_date('2023/09/30', 'yyyy/mm/dd') AND /*원하는 기간*/
std.student_seq = 370/*원하는 학생 번호*/
ORDER BY std.student_seq, a.attenddate;

-- 컴퓨터 이상 
SELECT
--*
--강의실, 컴퓨터 번호, 상태?, 등록 시간 , 수리가 완료된 여부(완료날짜)
comm.commanagedate AS "등록 시간",
comm.room_seq || '강의실' AS 강의실명,
comm.comnum AS "컴퓨터 번호",
coms.comstate AS "컴퓨터 상태",
--comm.comendrepair AS "수리 완료 시간",
CASE
WHEN comm.comendrepair IS NULL THEN '미완료'
ELSE '완료'
END AS "수리 완료 여부"
FROM tblcommanage comm
INNER JOIN tblcomstate coms
ON comm.comstate_seq = coms.comstate_seq
ORDER BY "등록 시간", 강의실명, "컴퓨터 번호";
-- 컴퓨터 수리 완료 후 수정
SELECT * FROM tblcommanage ORDER BY room_seq, comnum;
-- 어떤 방식으로 수정할지??
-- 목록을 보고 목록 번호 중에서 선택할지
-- or 강의실과 컴퓨터 번호를 입력할지
UPDATE tblcommanage SET comendrepair = sysdate
WHERE commanage_seq = 20/*완료된 목록 번호*/;
-- or
UPDATE tblcommanage SET comendrepair = sysdate
WHERE commanage_seq =
(SELECT commanage_seq
FROM tblcommanage
WHERE room_seq = 6/*강의실번호*/ AND comnum = 1/*컴퓨터번호*/
AND comendrepair IS NULL);

/*
1. 수료가 완료된 과정 목록
- 특정 과정 선택
*/
SELECT
distinct
-- 개설 과정 정보 (과정명, 과정기간)
c.course_seq,
cn.coursename,
c.coursestartdate,
c.courseenddate
FROM tblcourse c
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblcoursereg cr
ON c.course_seq = cr.course_seq
WHERE cr.completestate_seq = 2/*수료 완료 상태*/
ORDER BY c.course_seq;
/*
2. 수료한 교육생 목록
 - 특정 교육생 선택
*/
SELECT
-- 개설 과정 정보 (과정명, 과정기간)
c.course_seq,
cn.coursename,
c.coursestartdate,
c.courseenddate,
--해당 과정의 교육생 목록
std.studentname,
std.studentpw,
std.studenttel
FROM tblcourse c
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblcoursereg cr
ON c.course_seq = cr.course_seq
INNER JOIN tblstudent std
ON cr.student_seq = std.student_seq
WHERE c.course_seq = 1/*원하는 과정 번호*/
ORDER BY c.course_seq;
/*
3. 특정 교육생의 취업 정보 
 - 교육생의 과정정보, 수료 상태, 경력사항
 - 자격증
 - 희망 근무 조건
 - 취업 현황
*/
SELECT
-- 교육생 정보
std.studentname,
std.studentpw,
std.studenttel,
--과정 정보
cn.coursename,
c.coursestartdate,
c.courseenddate,
cp.completestate_seq,
cp.completestate,
-- 경력
w.workspace,
w.workstartdate,
w.worrenddate,
w.worktask,
-- 자격증
cfn.certifyname,
-- 희망 근무 조건
hd.hopedutyfield,
hd.hopesalary,
ha.hopearea,
-- 취업 현황
e.companyname,
e.insurance,
e.hiredate
FROM tblstudent std
INNER JOIN tblcoursereg cr
ON std.student_seq = cr.student_seq
INNER JOIN tblcourse c
ON cr.course_seq = c.course_seq
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblcompletestate cp
ON cr.completestate_seq = cp.completestate_seq
LEFT OUTER JOIN tblworkexperiencerel wr
ON std.student_seq = wr.student_seq
LEFT OUTER JOIN tblworkexperience w
ON wr.workexperience_seq = w.workexperience_seq
LEFT OUTER JOIN tblcertify cf
ON std.student_seq = cf.student_seq
LEFT OUTER JOIN tblcertifyname cfn
ON cf.ceritifyname_seq = cfn.certifyname_seq
LEFT OUTER JOIN tblhopeduty hd
ON std.student_seq = hd.student_seq
LEFT OUTER JOIN tblhopearearel har
ON hd.hopeduty_seq = har.hopeduty_seq
LEFT OUTER JOIN tblhopearea ha
ON har.hopearea_seq = ha.hopearea_seq
LEFT OUTER JOIN tblemployment e
ON std.student_seq = e.student_seq
WHERE std.student_seq = 2/*원하는 교육생*/;
/*
4. 특정 교육생의 취업 정보 수정
 - 취업 현황
*/
-- 수정
UPDATE tblemployment SET companyname = '원하는 기업명' WHERE student_seq = 2/*원하는 학생*/;
UPDATE tblemployment SET insurance = '유/무' WHERE student_seq = 2/*원하는 학생*/;
UPDATE tblemployment SET hiredate = '원하는 날짜' WHERE student_seq = 2/*원하는 학생*/;
-- 취업현황 삭제
DELETE FROM tblemployment WHERE student_seq = 2/*원하는 학생*/;
/*
1. 설문조사 결과 
-교육생이 작성한 설문조사를 할 수 있다.
-설문조사 번호로 설문조사 파일 
2. 설문조사 파일 수정
3. 설문조사 파일 등록
*/
--1. 설문조사 파일 
SELECT * FROM tblsurveyfile;
--특정 과목에 대한 설문조사 파일 
SELECT
distinct
-- 개설 과정 정보 (과정명, 과정기간, 강의실)
c.course_seq,
cn.coursename,
c.coursestartdate,
c.courseenddate,
c.room_seq,
-- 과목명, 과목기간, 교재명, 교사명
cs.coursesubject_seq,
s.subject,
cs.coursesubjectstartdate,
cs.cousesubjectenddate,
b.textbook,
t.teachername,
svf.surveyfile
FROM tblcoursesubject cs
INNER JOIN tblcourse c
ON cs.course_seq = c.course_seq
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblsubjectavailability sa
ON cs.subjectavailability_seq = sa.subjectavailability_seq
INNER JOIN tblsubject s
ON sa.subject_seq = s.subject_seq
INNER JOIN tbltextbook b
ON cs.textbook_seq = b.textbook_seq
INNER JOIN tblteacher t
ON sa.teacher_seq = t.teacher_seq
LEFT OUTER JOIN tblsurvey sv
ON cs.coursesubject_seq = sv.coursesubject_seq
LEFT OUTER JOIN tblsurveyfile svf
ON sv.surveyfile_seq = svf.surveyfile_seq
WHERE cs.coursesubject_seq = 121/*원하는 개설과목 번호*/;
SELECT * FROM tblsurvey WHERE coursesubject_seq = 121;
-- 특정 교육생이 작성한 설문조사 
SELECT
distinct
-- 교육생 정보
std.studentname,
std.studentpw,
std.studenttel,
--과정 정보
cn.coursename,
c.coursestartdate,
c.courseenddate,
svf.surveyfile,
sv.surveydate
FROM tblstudent std
INNER JOIN tblcoursereg cr
ON std.student_seq = cr.student_seq
INNER JOIN tblcourse c
ON cr.course_seq = c.course_seq
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblcoursesubject cs
ON c.course_seq = cs.course_seq
INNER JOIN tblsurvey sv
ON std.student_seq = sv.student_seq
INNER JOIN tblsurveyfile svf
ON sv.surveyfile_seq = svf.surveyfile_seq
WHERE std.student_seq = 337 /*원하는 교육생*/;
SELECT * FROM tblsurvey;
--2. 설문조사 파일 수정
UPDATE tblsurveyfile SET surveyfile = '수정할 내용' WHERE surveyfile_seq = 1/*수정할 파일 번호*/;
--3. 설문조사 파일 등록
INSERT INTO tblSurveyFile (surveyFile_seq, surveyFile) VALUES (seqSurveyFile.nextVal, '파일명');

/*
1. 특정 과정을 선택하면
과목 목록
특정 과목에
2. 진단평가 파일을 등록
3. 진단평가 파일을 수정
4. 진단평가 파일을 
- 특정 과정에 대해 특정 교육생을 선택하면
1. 교육생 목록
 - 사전 평가들의 목록, 완료여부(완료날짜)
*/
SELECT * FROM tblevaluatefile;
-- 파일 등록
INSERT INTO tblEvaluateFile (evaluateFile_seq, evaluateFile) VALUES (seqEvaluateFile.nextVal, '파일 등록');
-- 파일 수정
UPDATE tblevaluatefile SET evaluatefile = '원하는 파일명' WHERE evaluatefile_seq = 1/*원하는 번호*/;
-- 파일 삭제
DELETE FROM tblEvaluateFile WHERE evaluatefile_seq = 1/*원하는 번호*/;
-- 개설 과목들의 진단평가 
-- tblEvaluate > 등록, 수정, 삭제 필요없음(수강생이 평가 하는거임)
SELECT
DISTINCT
c.course_seq,
cn.coursename,
c.coursestartdate,
c.courseenddate,
cs.coursesubject_seq,
s.subject,
cs.coursesubjectstartdate,
cs.cousesubjectenddate,
t.teachername,
evf.evaluatefile,
CASE 
WHEN evf.evaluatefile IS NULL THEN '미등록'
ELSE '등록'
END AS "평가파일 등록여부"
FROM tblcourse c
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblcoursesubject cs
ON c.course_seq = cs.course_seq
INNER JOIN tblsubjectavailability sa
ON cs.subjectavailability_seq = sa.subjectavailability_seq
INNER JOIN tblsubject s
ON sa.subject_seq = s.subject_seq
INNER JOIN tblteacher t
ON sa.teacher_seq = t.teacher_seq
LEFT OUTER JOIN tblevaluate ev
ON cs.coursesubject_seq =ev.coursesubject_seq
LEFT OUTER JOIN tblevaluatefile evf
ON ev.evaluatefile_seq = evf.evaluatefile_seq
ORDER BY c.course_seq
;
--
SELECT
DISTINCT
c.course_seq,
cn.coursename,
c.coursestartdate,
c.courseenddate,
cs.coursesubject_seq,
s.subject,
cs.coursesubjectstartdate,
cs.cousesubjectenddate,
t.teachername,
evf.evaluatefile,
ev.evaluatedate,
std.studentname,
std.studentpw,
std.studenttel
FROM tblcourse c
INNER JOIN tblcoursename cn
ON c.coursename_seq = cn.coursename_seq
INNER JOIN tblcoursesubject cs
ON c.course_seq = cs.course_seq
INNER JOIN tblsubjectavailability sa
ON cs.subjectavailability_seq = sa.subjectavailability_seq
INNER JOIN tblsubject s
ON sa.subject_seq = s.subject_seq
INNER JOIN tblteacher t
ON sa.teacher_seq = t.teacher_seq
LEFT OUTER JOIN tblevaluate ev
ON cs.coursesubject_seq =ev.coursesubject_seq
LEFT OUTER JOIN tblevaluatefile evf
ON ev.evaluatefile_seq = evf.evaluatefile_seq
INNER JOIN tblstudent std
ON ev.student_seq = std.student_seq
WHERE cs.coursesubject_seq = 150;

-- 학습안내서 
SELECT 
c.course_seq AS "과정번호",
cn.coursename AS "과정명",
to_char (c.coursestartdate,'yyyy-mm-dd') || ' ~ ' || to_char (c.courseenddate,'yyyy-mm-dd') AS "과정 기간",
sq.te AS "강사명",
sgf.studyguidefile_seq AS "학습안내서 파일번호",
sgf.studyguidefile AS "학습안내서 파일명"
FROM tblstudyguide sg
INNER JOIN tblstudyguidefile sgf
ON sg.studyguidefile_seq = sgf.studyguidefile_seq
INNER JOIN tblcourse c
ON c.course_seq = sg.course_seq
INNER JOIN tblcoursename cn
ON cn.coursename_seq = c.coursename_seq
INNER JOIN (SELECT 
course_seq AS seq
FROM tblcoursereg
GROUP BY course_seq) st
ON st.seq = c.course_seq
INNER JOIN (SELECT 
cs2.course_seq AS co,
t2.teachername AS te
FROM tblcoursesubject cs2
INNER JOIN tblsubjectavailability sa2
ON cs2.subjectavailability_seq = sa2.subjectavailability_seq
INNER JOIN tblteacher t2
ON sa2.teacher_seq = t2.teacher_seq
GROUP BY cs2.course_seq, t2.teachername
ORDER BY cs2.course_seq) sq
ON sq.co = c.course_seq
WHERE c.course_seq = 1;

-- 1. 강의 스케줄 정보 
SELECT 
 cn.courseName AS "과정명", 
 c.courseStartDate AS "과정 시작일", 
 c.courseEndDate AS "과정 종료일", 
 s.subject AS "과목명", 
 cs.courseSubjectStartDate AS "과목 시작일", 
 cs.couseSubjectEndDate AS "과목 종료일", --courseEndDate(X), couseEndDate(O) 
 cr.room_seq AS "강의실", 
 t.textBook AS "교재명"
FROM tblCourse c
INNER JOIN tblCourseRoom cr ON c.room_seq = cr.room_seq
INNER JOIN tblCourseStatus ccs ON c.courseStatus_seq = ccs.courseStatus_seq
INNER JOIN tblcourseName cn ON c.courseName_seq = cn.courseName_seq
INNER JOIN tblCourseSubject cs ON c.course_seq = cs.course_seq
 INNER JOIN tblTextbook t ON cs.textBook_seq = t.textBook_seq
 INNER JOIN tblSubjectAvailability sa ON cs.subjectAvailability_seq = sa.subjectAvailability_seq
 INNER JOIN tblSubject s ON sa.subject_seq = s.subject_seq
ORDER BY 1 DESC;
-- 2. 과정 등록 교육생 정보 
SELECT 
 s.studentName AS "학생명", 
 s.studentTel AS "전화번호", 
 c.courseStartDate AS "등록일", 
 cs.completeState AS "수료여부",
 1 || '회' AS "수강신청 횟수" --..이거 맞아 진짜?
FROM tblCourseReg cr
INNER JOIN tblStudent s ON cr.student_seq = s.student_seq
INNER JOIN tblCompleteState cs ON cs.completeState_seq = cr.completeState_seq
INNER JOIN tblCourse c ON c.course_seq = cr.course_seq
ORDER BY s.studentName ASC;

-- 1. 강의를 마친 과목의 목록 
SELECT 
 s.subject_seq AS "과목번호", 
 cn.courseName AS "과정명", 
 c.courseStartDate AS "과정 시작일", 
 c.courseEndDate AS "과정 종료일", 
 s.subject AS "과목명", 
 cs.courseSubjectStartDate AS "과목 시작일", 
 cs.couseSubjectEndDate AS "과목 종료일", --courseEndDate(X), couseEndDate(O) 
 cr.room_seq || '강의실' AS "강의실", 
 t.textBook AS "교재명",
 p.attendPoint AS "출결배점", 
 p.wPoint AS "필기배점", 
 p.pPoint AS "실기배점"
FROM tblCourse c
INNER JOIN tblCourseRoom cr ON c.room_seq = cr.room_seq
INNER JOIN tblCourseStatus ccs ON c.courseStatus_seq = ccs.courseStatus_seq
INNER JOIN tblcourseName cn ON c.courseName_seq = cn.courseName_seq
INNER JOIN tblCourseSubject cs ON c.course_seq = cs.course_seq
 INNER JOIN tblTextbook t ON cs.textBook_seq = t.textBook_seq
 INNER JOIN tblSubjectAvailability sa ON cs.subjectAvailability_seq = sa.subjectAvailability_seq
 INNER JOIN tblSubject s ON sa.subject_seq = s.subject_seq
 INNER JOIN tblPoint p ON p.courseSubject_seq = cs.courseSubject_seq
ORDER BY 3 ASC;
-- 2. 특정 과목 배점 정보 입력
UPDATE TBLPOINT 
SET 
attendPoint = 20,
wPoint = 30,
pPoint = 50;
WHERE courseSubject_seq = 1
SELECT * FROM tblpoint;
SELECT * FROM tblCoursesubject;

-- 1. 강의를 마친 과목의 목록 
SELECT 
 s.subject_seq AS 과목번호, 
 cn.courseName AS 과정명, 
 c.courseStartDate AS "과정 시작일", 
 c.courseEndDate AS "과정 종료일", 
 s.subject AS 과목명, 
 cs.courseSubjectStartDate AS "과목 시작일", 
 cs.couseSubjectEndDate AS "과목 종료일", --courseEndDate(X), couseEndDate(O) 
 cr.room_seq || '강의실' AS "강의실", 
 t.textBook AS "교재명",
 p.attendPoint AS "출결배점", 
 p.wPoint AS "필기배점", 
 p.pPoint AS "실기배점",
 CASE
 WHEN attendScore is not NULL AND wScore is not NULL AND pScore is not NULL THEN 'Y'
 ELSE 'N'
 END AS "성적 등록 여부"
FROM tblCourse c
INNER JOIN tblCourseRoom cr ON c.room_seq = cr.room_seq
INNER JOIN tblCourseStatus ccs ON c.courseStatus_seq = ccs.courseStatus_seq
INNER JOIN tblcourseName cn ON c.courseName_seq = cn.courseName_seq
INNER JOIN tblCourseSubject cs ON c.course_seq = cs.course_seq
 INNER JOIN tblTextbook t ON cs.textBook_seq = t.textBook_seq
 INNER JOIN tblSubjectAvailability sa ON cs.subjectAvailability_seq = sa.subjectAvailability_seq
 INNER JOIN tblSubject s ON sa.subject_seq = s.subject_seq
 INNER JOIN tblPoint p ON p.courseSubject_seq = cs.courseSubject_seq
 INNER JOIN tblAllScore a ON a.pointNum = p.pointNum
ORDER BY 1 ASC;
-- 2. 특정 과목의 성적 정보 
SELECT
 s.studentName AS "교육생 이름",
 s.studentTel AS "전화번호",
 cs.completeState AS "수료여부",
 a.attendScore AS "출석점수",
 a.wScore AS "필기성적",
 a.pScore AS "실기성적"
FROM tblStudent s
INNER JOIN tblAllScore a ON s.student_seq = a.student_seq
INNER JOIN tblCourseReg cr ON s.student_seq = cr.student_seq
 INNER JOIN tblCompleteState cs ON cs.completeState_seq = cr.completeState_seq
ORDER BY 1 ASC;
-- 3. 특정 과목의 성적 정보 입력
UPDATE tblAllScore 
SET 
attendScore = 100, --100
wScore = 96, --96
pScore = 80 --80
WHERE student_seq = 337 AND pointNum = 121;
SELECT * FROM tblAllScore WHERE student_seq = 337;
SELECT * FROM tblAllScore;

-- 1. 자신의 과정 목록  - 특정 과정 선택시
-- 교사명 교사전화번호 과목번호(??) 
SELECT 
t.teacherName AS "이름", 
t.teacherTel AS "전화번호",
cn.courseName AS "과정명",
s.subject AS "과목명",
cs.courseSubjectStartDate AS "과목 시작일",
cs.couseSubjectEndDate AS "과목 종료일"
FROM tblcourseSubject cs
INNER JOIN tblcourse c ON c.course_seq = cs.course_seq
INNER JOIN tblCourseName cn ON cn.courseName_seq = c.courseName_seq
INNER JOIN tblSubjectAvailability sa ON sa.subjectAvailability_seq = cs.subjectAvailability_seq
INNER JOIN tblSubject s ON s.subject_seq = sa.subject_seq
INNER JOIN tblTeacher t ON t.teacher_seq = sa.teacher_seq
WHERE t.teacher_seq = 1
ORDER BY cs.courseSubjectStartDate asc;
-- 2. 모든 일자의 모든 교육생에 대한 출결 정보를 출력
SELECT
s.student_seq AS "학생번호",
s.studentName AS "학생 이름",
a.attendDate AS "출결 날짜",
a.attendStartTime AS "등원시간",
a.attendEndTime AS "하원시간",
tas.attendState AS "출결상태"
FROM tblAttend a
INNER JOIN tblAttendState tas ON tas.attendState_seq = a.attendState_seq
INNER JOIN tblStudent s ON s.student_seq = a.student_seq
ORDER BY s.studentName ASC;
SELECT * FROM tblattend;
-- 3. 특정 기간별 출결 현황 
SELECT
s.student_seq AS "학생번호",
s.studentName AS "학생 이름",
a.attendDate AS "출결 날짜",
a.attendStartTime AS "등원시간",
a.attendEndTime AS "하원시간",
tas.attendState AS "출결상태"
FROM tblAttend a 
INNER JOIN tblAttendState tas ON tas.attendState_seq = a.attendState_seq
INNER JOIN tblStudent s ON s.student_seq = a.student_seq
WHERE a.attendDate > to_date('23/08/15', 'RRRR/MM/DD') -- = to_date('23/08/14', 'RRRR/MM/DD')
ORDER BY s.studentName, a.attendDate ASC;
-- 4. 교육생 1명의 출결 현황 
SELECT
s.studentName AS "학생 이름",
a.attendDate AS "출결 날짜",
a.attendStartTime AS "등원시간",
a.attendEndTime AS "하원시간",
tas.attendState AS "출결상태"
FROM tblAttend a 
INNER JOIN tblAttendState tas ON tas.attendState_seq = a.attendState_seq
INNER JOIN tblStudent s ON s.student_seq = a.student_seq
WHERE s.student_seq = 337
ORDER BY a.attendDate ASC;
-- 5. 특정 교육생의 특정 기간별 출결 현황 
SELECT
s.student_seq AS "학생번호",
s.studentName AS "학생 이름",
a.attendDate AS "출결 날짜",
a.attendStartTime AS "등원시간",
a.attendEndTime AS "하원시간",
tas.attendState AS "출결상태"
FROM tblAttend a 
INNER JOIN tblAttendState tas ON tas.attendState_seq = a.attendState_seq
INNER JOIN tblStudent s ON s.student_seq = a.student_seq
WHERE s.student_seq = 498 AND a.attendDate > to_date('23/08/15', 'RRRR/MM/DD')
ORDER BY s.studentName, a.attendDate ASC;
--GROUP BY a.attendDate
--HAVING a.attendDate > to_date('23/08/15', 'RRRR/MM/DD')

-- 1. 수료가 완료된 과정 목록
SELECT courseStatus FROM tblCourseStatus;
SELECT 
DISTINCT cn.courseName AS "과정명",
c.courseStartDate AS "과정 시작일",
c.courseEndDate AS "과정 종료일",
cr.completeDate AS "수료일",
cs.courseStatus AS "과정 진행상태"
FROM tblCourse c
INNER JOIN tblCourseReg cr ON c.course_seq = cr.course_seq
INNER JOIN tblCourseName cn ON cn.courseName_seq = c.courseName_seq
INNER JOIN tblCourseStatus cs ON cs.courseStatus_seq = c.courseStatus_seq
WHERE cs.courseStatus = '강의 종료';
-- 2. 수료한 교육생 목록
SELECT courseName FROM tblcourseName;
SELECT
s.studentName AS "학생명",
cn.courseName AS "과정명",
cr.completedate AS "수료일",
cs.completeState AS "수료여부"
FROM tblcourseReg cr
INNER JOIN tblStudent s ON s.student_seq = cr.student_seq
INNER JOIN tblCompleteState cs ON cs.completeState_seq = cr.completeState_seq
INNER JOIN tblCourse c ON c.course_seq = cr.course_seq
INNER JOIN tblCourseName cn ON cn.courseName_seq = c.courseName_seq
WHERE completeState = '수료';
-- 3. 특정 교육생의 취업 정보 
SELECT 
s.studentName AS "학생명",
cname.courseName AS "과정명",
cs.courseStatus AS "과정진행상태",
cr.completedate AS "수료일",
cn.certifyName AS "자격증",
we.workSpace AS "이전 근무처",
we.workStartDate AS "근무 시작일",
we.worrEndDate AS "근무 종료일", --workEndDate > worrEndDate
em.companyName AS "취업기업명",
em.hireDate AS "취업일",
hd.hopeDutyfield AS "취업 희망 분야",
ha.hopeArea AS "희망지역",
hd.hopeSalary AS "희망급여"
FROM tblStudent s
INNER JOIN tblCourseReg cr ON s.student_seq = cr.student_seq
INNER JOIN tblCourse c ON c.course_seq = cr.course_seq
INNER JOIN tblCourseStatus cs ON cs.courseStatus_seq = c.courseStatus_seq
INNER JOIN tblCourseName cname ON cname.courseName_seq = c.courseName_seq
INNER JOIN tblCertify cf ON s.student_seq = cf.student_seq
INNER JOIN tblCertifyName cn ON cn.certifyName_seq = cf.ceritifyName_seq --cf.certifyName_seq > ceritifyName_seq
INNER JOIN tblWorkExperienceRel wer ON s.student_seq = wer.student_seq
INNER JOIN tblWorkExperience we ON we.workExperience_seq = wer.workExperience_seq
INNER JOIN tblEmployment em ON s.student_seq = em.student_seq
INNER JOIN tblHopeDuty hd ON s.student_seq = hd.student_seq
INNER JOIN tblHopeAreaRel har ON hd.hopeDuty_seq = har.hopeDuty_seq
INNER JOIN tblHopeArea ha ON ha.hopeArea_seq = har.hopeArea_seq
ORDER BY s.studentName ASC;

-- 1. 특정 과정 선택시 해당 과정에 등록된 교육생 목록 
set serveroutput on;
select
 c.course_seq as 과정번호,
 c.courseStartDate as 과정시작일,
 cs.completeState as 수료상태,
 cn.coursename as 과정이름,
 s.student_seq as 교육생번호,
 s.studentName as 교육생이름,
 s.studentPw as 교육생비밀번호,
 s.studentTel as 교육생전화번호
from tblStudent s
 inner join tblCourseReg cr
 on s.student_seq = cr.student_seq
 inner join tblCourse c
 on cr.course_seq = c.course_seq
 inner join tblcoursename cn
 on c.courseName_seq = cn.coursename_seq
 inner join tblCompleteState cs
 on cr.completeState_seq = cs.completeState_seq;
 
 
 
-- 2. 특정 교육생의 설문조사 현황 
select
 s.student_seq as 교육생번호,
 s.studentname as 교육생이름,
 s.studenttel as 교육생전화번호,
 sv.surveyDate as 설문완료날짜,
 svf.surveyFile_seq ,
 svf.surveyfile,
 sj.subject_seq,
 sj.subject
from tblstudent s
 inner join tblSurvey sv
 on s.student_seq = sv.student_seq
 inner join tblsurveyfile svf
 on sv.surveyFile_seq = svf.surveyFile_seq
 inner join tblCourseSubject cs
 on sv.coursesubject_seq = cs.coursesubject_seq
 inner join tblSubjectAvailability sa
 on cs.subjectAvailability_seq = sa.subjectavailability_seq
 inner join tblSubject sj
 on sa.subject_seq = sj.subject_seq;
 
-- 1. 특정 과정 선택시 해당 과정에 등록된 교육생 목록 
set serveroutput on;
select
 c.course_seq as 과정번호,
 c.courseStartDate as 과정시작일,
 cs.completeState as 수료상태,
 cn.coursename as 과정이름,
 s.student_seq as 교육생번호,
 s.studentName as 교육생이름,
 s.studentPw as 교육생비밀번호,
 s.studentTel as 교육생전화번호
from tblStudent s
 inner join tblCourseReg cr
 on s.student_seq = cr.student_seq
 inner join tblCourse c
 on cr.course_seq = c.course_seq
 inner join tblcoursename cn
 on c.courseName_seq = cn.coursename_seq
 inner join tblCompleteState cs
 on cr.completeState_seq = cs.completeState_seq;
--3. 특정 교육생의 사전 진단평가 현황 
select
 s.student_seq as 교육생번호,
 s.studentname as 교육생이름,
 s.studenttel as 교육생전화번호,
 sj.subject as 과목명,
 ea.evaluateDate as 평가완료날짜
from tblstudent s
 inner join tblEvaluate ea
 on s.student_seq = ea.student_seq
 inner join tblEvaluateFile eaf
 on ea.evaluateFile_seq = eaf.evaluateFile_seq
 inner join tblCourseSubject cs
 on ea.coursesubject_seq = cs.coursesubject_seq
 inner join tblSubjectAvailability sa
 on cs.subjectAvailability_seq = sa.subjectavailability_seq
 inner join tblSubject sj
 on sa.subject_seq = 1
 where s.student_seq = 377;
 
--2. 자신이 진행중인 과정의 학습 안내서 
select
 t.teacher_seq as 강사번호,
 t.teacherName as 강사명,
 cn.coursename as 과정명,
 cst.courseStatus 과정진행상태,
 sgf.studyGuideFile_seq as 학습안내서번호,
 sgf.studyGuideFile as 학습안내서파일
from tblTeacher t
 inner join tblSubjectAvailability sa
 on t.teacher_seq = sa.teacher_seq
 inner join tblCourseSubject cs
 on sa.subjectAvailability_seq = cs.subjectAvailability_seq
 inner join tblCourse c
 on cs.course_seq = c.course_seq
 inner join tblStudyGuide sg
 on c.course_seq = sg.course_seq
 inner join tblStudyGuideFile sgf
 on sg.studyGuideFile_seq = sgf.studyGuideFile_seq
 inner join tblCourseStatus cst
 on c.courseStatus_seq = cst.courseStatus_seq
 inner join tblCourseName cn
 on c.courseName_seq = cn.courseName_seq
 where cst.coursestatus = '강의 중'; 
 
-- 모든 학습안내서 
select
 t.teacher_seq AS 강사번호,
 t.teacherName AS 강사명,
 cn.coursename AS 과정명,
 cst.courseStatus AS 과정진행상태,
 sgf.studyGuideFile AS 학습안내서파일
from tblTeacher t
 inner join tblSubjectAvailability sa
 on t.teacher_seq = sa.teacher_seq
 inner join tblCourseSubject cs
 on sa.subjectAvailability_seq = cs.subjectAvailability_seq
 inner join tblCourse c
 on cs.course_seq = c.course_seq
 inner join tblStudyGuide sg
 on c.course_seq = sg.course_seq
 inner join tblStudyGuideFile sgf
 on sg.studyGuideFile_seq = sgf.studyGuideFile_seq
 inner join tblCourseStatus cst
 on c.courseStatus_seq = cst.courseStatus_seq
 inner join tblCourseName cn
 on c.courseName_seq = cn.courseName_seq; 
 
--파일 등록
INSERT INTO tblStudyGuideFile (studyGuideFile_seq, studyGuideFile) 
 VALUES ((SELECT MAX(studyGuideFile_seq) FROM tblStudyGuideFile) + 1, 'Java(자바) Full-Stack 개발자 양성과정 학습안내서.docs');
--가이드 정보 등록
INSERT INTO tblStudyGuide (studyGuide_seq, course_seq, studyGuideFile_seq) 
VALUES ((SELECT MAX(studyGuide_seq) FROM tblStudyGuide) + 1, 1, (SELECT MAX(studyGuideFile_seq) FROM tblStudyGuideFile));

--1. 과목별로 
select
 s.student_seq as 교육생번호,
 s.studentname as 교육생이름,
 sj.subject as 과목명,
 allsc.attendScore as 출결성적,
 allsc.wScore as 필기성적,
 allsc.pScore as 실기성적
from tblStudent s
 inner join tblAllScore allsc
 on s.student_seq = allsc.student_seq
 inner join tblPoint p
 on allsc.pointNum = p.pointNum
 inner join tblCourseSubject cs
 on p.courseSubject_seq = cs.courseSubject_seq
 inner join tblSubjectAvailability sa
 on cs.subjectAvailability_seq = sa.subjectAvailability_seq
 inner join tblSubject sj
 on sa.subject_seq = sj.subject_seq
 where cs.courseSubject_seq = 3 and s.student_seq = 3;
 
-- 전체과목 성적 
select
 s.student_seq as 교육생번호,
 s.studentname as 교육생이름,
 sj.subject as 과목명,
 allsc.attendScore as 출결성적,
 allsc.wScore as 필기성적,
 allsc.pScore as 실기성적
from tblStudent s
 inner join tblAllScore allsc
 on s.student_seq = allsc.student_seq
 inner join tblPoint p
 on allsc.pointNum = p.pointNum
 inner join tblCourseSubject cs
 on p.courseSubject_seq = cs.courseSubject_seq
 inner join tblSubjectAvailability sa
 on cs.subjectAvailability_seq = sa.subjectAvailability_seq
 inner join tblSubject sj
 on sa.subject_seq = sj.subject_seq
 where s.student_seq = 3;
--출석등록
INSERT INTO tblAttend (attend_seq, student_seq, attendState_seq, attendDate, attendStartTime, attendEndTime) 
VALUES ((SELECT MAX(attend_seq) FROM tblAttend) + 1, 337, 1, to_date(sysdate, 'RRRR/MM/DD'), to_char(sysdate, 'hh24:mi'), null);
update tblAttend set attendendtime = to_char(sysdate, 'hh24:mi')
 where student_seq = 337 and attendDate = to_char(sysdate, 'yy/mm/dd');
 
--2. 모든 일자의 출결 정보 
select 
 s.student_seq as 교육생번호,
 s.studentname as 교육생이름,
 a.attenddate as 출결날짜,
 ast.attendState as 출결상태,
 a.attendstarttime as 등원시간,
 a.attendEndTime as 하원시간
from tblAttend a
 inner join tblAttendState ast
 on a.attendState_seq = ast.attendState_seq
 inner join tblStudent s
 on a.student_seq = s.student_seq
 where s.student_seq = 437;
--특정 날짜 출결 
select 
 s.student_seq as 교육생번호,
 s.studentname as 교육생이름,
 a.attenddate as 출결날짜,
 ast.attendState as 출결상태,
 a.attendstarttime as 등원시간,
 a.attendEndTime as 하원시간
from tblAttend a
 inner join tblAttendState ast
 on a.attendState_seq = ast.attendState_seq
 inner join tblStudent s
 on a.student_seq = s.student_seq
 where s.student_seq = 337 and attendDate = to_date('23/03/14');
-- 특정 기간 출결  ex) 23년 9월 출결 
SELECT 
 s.student_seq as 교육생번호,
 s.studentname as 교육생이름,
 a.attenddate as 출결날짜,
 ast.attendState as 출결상태,
 a.attendstarttime as 등원시간,
 a.attendEndTime as 하원시간
FROM tblAttend a
 INNER JOIN tblAttendState ast
 ON a.attendState_seq = ast.attendState_seq
 INNER JOIN tblStudent s
 ON a.student_seq = s.student_seq
 WHERE s.student_seq = 337 
 AND EXTRACT(YEAR FROM a.attenddate) = 2023
 AND EXTRACT(MONTH FROM a.attenddate) = 9;
 
—-사후관리 정보 
--본인의 과정 정보
SELECT 
cn2.coursename AS "과정명",
s.studentname AS "교육생 이름",
round(((alls.ats + alls.ws + alls.ps)/3), 2) AS "평균 점수",
sq.te AS "강사명",
to_char(c2.coursestartdate, 'yyyy-mm-dd') || ' ~ ' || to_char(c2.courseenddate, 'yyyy-mm-dd') AS "과정 기간",
cs3.coursestatus AS "과정 상태"
FROM tblstudent s
INNER JOIN tblcoursereg cr
ON s.student_seq = cr.student_seq
INNER JOIN tblcompletestate cs
ON cr.completestate_seq = cs.completestate_seq
INNER JOIN tblcourse c2
ON c2.course_seq = cr.course_seq
INNER JOIN tblcoursestatus cs3
ON c2.coursestatus_seq = cs3.coursestatus_seq
INNER JOIN tblcoursename cn2
ON cn2.coursename_seq = c2.coursename_seq
INNER JOIN (SELECT 
cs2.course_seq AS co,
t2.teachername AS te
FROM tblcoursesubject cs2
INNER JOIN tblsubjectavailability sa2
ON cs2.subjectavailability_seq = sa2.subjectavailability_seq
INNER JOIN tblteacher t2
ON sa2.teacher_seq = t2.teacher_seq
GROUP BY cs2.course_seq, t2.teachername
ORDER BY cs2.course_seq) sq
ON sq.co = c2.course_seq
INNER JOIN (SELECT alls.student_seq, avg(attendscore) AS ats, avg(wscore) AS ws, avg(pscore) AS ps FROM tblallscore alls INNER JOIN tblstudent s 
ON s.student_seq = alls.student_seq GROUP BY alls.student_seq) alls
ON alls.student_seq = s.student_seq
WHERE s.student_seq = 468
ORDER BY s.student_seq;
--자격증 검색
SELECT 
c.STUDENT_SEQ || c.CERITIFYNAME_SEQ AS "관리코드",
cn2.coursename AS "과정명",
s.studentname AS "교육생 이름",
cn.certifyname AS "자격증명"
FROM tblstudent s
INNER JOIN tblcertify c
ON s.student_seq = c.student_seq
INNER JOIN tblcertifyname cn
ON c.ceritifyname_seq = cn.certifyname_seq
INNER JOIN tblcoursereg cr
ON s.student_seq = cr.student_seq
INNER JOIN tblcourse c2
ON c2.course_seq = cr.course_seq
INNER JOIN tblcoursename cn2
ON cn2.coursename_seq = c2.coursename_seq
WHERE s.student_seq = 461
ORDER BY s.student_seq;
--경력사항
SELECT 
cn2.coursename AS "과정명",
s.studentname AS "교육생 이름",
we.workspace AS "회사명",
to_char(we.workstartdate, 'yyyy-mm-dd') || ' ~ ' || to_char(we.worrenddate, 'yyyy-mm-dd') AS "근무 기간",
we.worktask AS "직위" 
FROM tblstudent s 
INNER JOIN tblWorkExperienceRel wer
ON wer.student_seq = s.student_seq
INNER JOIN tblWorkExperience we
ON we.workexperience_seq = wer.workexperience_seq
INNER JOIN tblcoursereg cr
ON s.student_seq = cr.student_seq
INNER JOIN tblcourse c2
ON c2.course_seq = cr.course_seq
INNER JOIN tblcoursename cn2
ON cn2.coursename_seq = c2.coursename_seq
WHERE s.student_seq = 468
ORDER BY s.student_seq;
-- 희망 근무 조건
SELECT 
cn2.coursename AS "과정명",
s.studentname AS "교육생 이름",
hd.hopedutyfield AS "취업 희망분야",
ha.hopearea AS "희망지역",
hd.hopesalary AS "희망급여"
FROM tblstudent s
INNER JOIN tblcoursereg cr
ON s.student_seq = cr.student_seq
INNER JOIN tblcourse c2
ON c2.course_seq = cr.course_seq
INNER JOIN tblcoursename cn2
ON cn2.coursename_seq = c2.coursename_seq
INNER JOIN tblHopeDuty hd
ON hd.student_seq = s.student_seq
INNER JOIN tblHopeAreaRel har
ON har.hopeduty_seq = hd.hopeduty_seq
INNER JOIN tblhopearea ha
ON ha.hopearea_seq = har.hopearea_seq
WHERE s.student_seq = 468
ORDER BY s.student_seq;
-- 취업 현황
SELECT 
cn2.coursename AS "과정명",
s.studentname AS "교육생 이름",
e.companyname AS "기업명",
e.insurance AS "고용보험",
to_char(e.hiredate, 'yyyy-mm-dd') AS "취업일",
cs.completestate AS "수료상태",
to_char(cr.completedate, 'yyyy-mm-dd') AS "수료일"
FROM tblstudent s
INNER JOIN tblcoursereg cr
ON s.student_seq = cr.student_seq
INNER JOIN tblcompletestate cs
ON cs.completestate_seq = cr.completestate_seq
INNER JOIN tblcourse c2
ON c2.course_seq = cr.course_seq
INNER JOIN tblcoursename cn2
ON cn2.coursename_seq = c2.coursename_seq
INNER JOIN tblemployment e
ON e.student_seq = s.student_seq
WHERE s.student_seq = 468
ORDER BY s.student_seq;
—사후관리 정보 수정
--경력사항 수정
UPDATE tblworkexperience we SET we.workspace = '쌍용교육센터' WHERE we.workexperience_seq = 127;
--자격증 수정
UPDATE tblcertify SET ceritifyname_seq = 1 WHERE student_seq = 499;
--희망근무 조건 수정
UPDATE tblhopeduty SET hopedutyfield = '웹디자이너' WHERE student_seq = 502;
--취업관리사항
UPDATE tblemployment SET companyname = '쌍용교육센터' WHERE employment_seq = 288;

-- 컴퓨터 이상 보고(등록)
INSERT INTO tblcommanage (commanage_seq,comendrepair,comstate_seq,commanagedate,comnum,room_seq)
values((SELECT max(commanage_seq)+1 FROM tblcommanage),NULL,1,sysdate,34,2);
-- 컴퓨터 이상 목록 
SELECT 
c.commanage_seq AS "관리 번호",
cs.comstate AS "이상증세",
to_char(c.commanagedate,'yyyy-mm-dd') AS "수리신청 시간",
CASE 
WHEN c.comendrepair IS NOT NULL THEN '수리 완료'
WHEN c.comendrepair IS NULL THEN '수리 진행중'
END AS "수리완료여부",
c.room_seq AS "강의실 번호",
comnum AS "컴퓨터 번호",
cn.coursename AS "과정명",
cs2.coursestatus AS "진행상태"
FROM tblcommanage c
INNER JOIN tblcomstate cs
ON c.comstate_seq = cs.comstate_seq
INNER JOIN tblcourseroom cr
ON cr.room_seq = c.room_seq
INNER JOIN tblcourse course
ON course.room_seq = cr.room_seq
INNER JOIN tblcoursename cn
ON cn.coursename_seq = course.coursename_seq
INNER JOIN tblcoursestatus cs2
ON cs2.coursestatus_seq = course.coursestatus_seq
INNER JOIN tblcoursereg cr2
ON cr2.course_seq = course.course_seq
INNER JOIN tblstudent st
ON st.student_seq = cr2.student_seq
WHERE st.student_seq = 468 AND c.comnum = 11
ORDER BY c.commanage_seq;

-- 자신이 진행중인 설문조사 목록 
SELECT 
s.survey_seq AS "관리번호",
s2.subject AS "과목명",
to_char(cs.coursesubjectstartdate, 'yyyy-mm-dd') || ' ~ ' || to_char(cs.cousesubjectenddate, 'yyyy-mm-dd') AS "과목 기간",
sf.surveyfile || '.docs' AS "설문조사 파일명",
CASE 
WHEN s.surveydate IS NOT NULL THEN '완료'
WHEN s.surveydate IS NULL THEN '미완료'
END AS "완료여부",
s.surveydate AS "완료 날짜"
FROM tblSurvey s
INNER JOIN tblsurveyfile sf
ON s.surveyfile_seq = sf.surveyfile_seq
INNER JOIN tblstudent st
ON st.student_seq = s.student_seq
INNER JOIN tblcoursesubject cs
ON cs.coursesubject_seq = s.coursesubject_seq
INNER JOIN tblsubjectavailability sa
ON sa.subjectavailability_seq = cs.subjectavailability_seq
INNER JOIN tblsubject s2
ON s2.subject_seq = sa.subject_seq
WHERE st.student_seq = 468
ORDER BY s.survey_seq;
-- 설문조사 완료
UPDATE tblsurvey SET surveydate = sysdate WHERE survey_seq = 1496; 

-- 사전 진단평가
SELECT 
e.evaulate_seq AS "파일번호",
cn.coursename AS "과정명",
to_char(c.coursestartdate, 'yyyy-mm-dd') || ' ~ ' || to_char(c.courseenddate, 'yyyy-mm-dd') AS "과정 기간",
ef.evaluatefile AS "진단평가 파일명",
CASE 
WHEN e.evaluatedate IS NOT NULL THEN '완료'
WHEN e.evaluatedate IS NULL THEN '미완료'
END AS "완료여부",
e.evaluatedate AS "완료 날짜"
FROM tblevaluate e
INNER JOIN tblevaluatefile ef
ON e.evaluatefile_seq = ef.evaluatefile_seq
INNER JOIN tblstudent st
ON st.student_seq = e.student_seq
INNER JOIN tblcoursesubject cs
ON cs.coursesubject_seq = e.coursesubject_seq
INNER JOIN tblsubjectavailability sa
ON sa.subjectavailability_seq = cs.subjectavailability_seq
INNER JOIN tblsubject s2
ON s2.subject_seq = sa.subject_seq
INNER JOIN tblcourse c
ON cs.course_seq = c.course_seq 
INNER JOIN tblcoursename cn
ON cn.coursename_seq = c.coursename_seq
WHERE st.student_seq = 468
ORDER BY e.evaulate_seq;
-- 사전 진단평가 완료
UPDATE tblevaluate SET evaluatedate = sysdate WHERE evaulate_seq = 1496;

-- 학습안내서 
SELECT 
c.course_seq AS "과정번호",
cn.coursename AS "과정명",
to_char (c.coursestartdate,'yyyy-mm-dd') || ' ~ ' || to_char (c.courseenddate,'yyyy-mm-dd') AS "과정 기간",
sq.te AS "강사명",
sgf.studyguidefile_seq AS "학습안내서 파일번호",
sgf.studyguidefile AS "학습안내서 파일명"
FROM tblstudyguide sg
INNER JOIN tblstudyguidefile sgf
ON sg.studyguidefile_seq = sgf.studyguidefile_seq
INNER JOIN tblcourse c
ON c.course_seq = sg.course_seq
INNER JOIN tblcoursename cn
ON cn.coursename_seq = c.coursename_seq
INNER JOIN (SELECT 
course_seq AS seq
FROM tblcoursereg
GROUP BY course_seq) st
ON st.seq = c.course_seq
INNER JOIN (SELECT 
cs2.course_seq AS co,
t2.teachername AS te
FROM tblcoursesubject cs2
INNER JOIN tblsubjectavailability sa2
ON cs2.subjectavailability_seq = sa2.subjectavailability_seq
INNER JOIN tblteacher t2
ON sa2.teacher_seq = t2.teacher_seq
GROUP BY cs2.course_seq, t2.teachername
ORDER BY cs2.course_seq) sq
ON sq.co = c.course_seq
WHERE c.course_seq = 1;

-- 수강상태 
SELECT
cn.coursename AS "과목명",
to_char (c.coursestartdate,'yyyy-mm-dd') || ' ~ ' || to_char (c.courseenddate,'yyyy-mm-dd') AS "과정 기간",
cs.completestate AS "수료상태",
to_char(cr.completedate,'yyyy-mm-dd') AS "수료일",
s.studentname AS "수강자명",
round(((alls.ats + alls.ws + alls.ps)/3), 2) AS "평균 점수"
FROM tblcoursereg cr
INNER JOIN tblcourse c
ON cr.course_seq = c.course_seq
INNER JOIN tblcompletestate cs
ON cs.completestate_seq = cr.completestate_seq
INNER JOIN tblcoursename cn
ON cn.coursename_seq = c.coursename_seq
INNER JOIN tblstudent s
ON s.student_seq = cr.student_seq
INNER JOIN (SELECT alls.student_seq, avg(attendscore) AS ats, avg(wscore) AS ws, avg(pscore) AS ps FROM tblallscore alls INNER JOIN tblstudent s 
ON s.student_seq = alls.student_seq GROUP BY alls.student_seq) alls
ON alls.student_seq = s.student_seq
WHERE s.student_seq = 468;