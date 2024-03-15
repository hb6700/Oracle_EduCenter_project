

1-1. 과정명 등록
create or replace procedure procCourseName AS
begin
insert into tblcourseName(courseName_seq, courseName)
select max(courseName_seq) +1 , '(스마트웹 개발) Java기반 스마트 플랫폼 Full-Stack SW개발자 양성 과정'
from tblcourseName;
end procCourseName;
1-2. 과정명 수정
CREATE OR REPLACE PROCEDURE UpdateCourseName AS
BEGIN
 UPDATE tblCourseName
 SET courseName = '(디지털컨버전스)AWS 클라우드와 Elasticsearch를 활용한 Java(자바) Full-Stack 개발자 양성과정'
 WHERE courseName_seq = 2;
 
 END UpdateCourseName;
1-3. 과정명 삭제
CREATE OR REPLACE PROCEDURE DeleteCourseName AS
BEGIN
 DELETE FROM tblCourseName WHERE courseName_seq = 1;
1-4. 과정명 조회
CREATE OR REPLACE PROCEDURE SelectCourseName AS
BEGIN
 FOR course_rec IN (SELECT * FROM tblCourseName WHERE course_seq = 1) LOOP
 DBMS_OUTPUT.PUT_LINE('Course Seq: ' || course_rec.course_seq);
 DBMS_OUTPUT.PUT_LINE('Course Name: ' || course_rec.courseName);
 END LOOP;
END SelectCourseName;


1. 강사 등록
--등록
CREATE OR REPLACE PROCEDURE procInsertTeacher AS
BEGIN
 
 INSERT INTO tblTeacher (teacher_seq, teacherName, teacherPw, teacherTel)
 SELECT MAX(teacher_seq) + 1, '박세인', 1847596, '010-3847-3984'
 FROM tblTeacher;
 
END procInsertTeacher;
2. 강사 수정
--수정
CREATE OR REPLACE PROCEDURE procUpdateTeacher AS
BEGIN
 UPDATE tblTeacher
 SET teacherName = '박세인'
 WHERE teacher_seq = 3;
END procUpdateTeacher;
3. 강사 삭제
--삭제
CREATE OR REPLACE PROCEDURE procDeleteTeacher AS
BEGIN
 
 DELETE FROM tblTeacher
 WHERE teacher_seq = 3;
 
END procDeleteTeacher;
4. 강사 조회
--조회
CREATE OR REPLACE PROCEDURE procSelectTeacher AS
BEGIN
 FOR teacher_rec IN (SELECT * FROM tblTeacher WHERE teacher_seq = 3) LOOP
 DBMS_OUTPUT.PUT_LINE('Teacher Seq: ' || teacher_rec.teacher_seq);
 DBMS_OUTPUT.PUT_LINE('Teacher Name: ' || teacher_rec.teacherName);
 DBMS_OUTPUT.PUT_LINE('Teacher Password: ' || teacher_rec.teacherPw);
 DBMS_OUTPUT.PUT_LINE('Teacher Telephone: ' || teacher_rec.teacherTel);
 
 END LOOP;
END procSelectTeacher;


1. 과정 등록
CREATE OR REPLACE PROCEDURE InsertCourseRecord AS
BEGIN
 INSERT INTO tblCourse (course_seq, courseStartDate, courseEndDate, room_seq, courseStatus_seq, courseName_seq)
 SELECT MAX(course_seq) + 1, TO_DATE('22/03/17', 'YY/MM/DD'), TO_DATE('22/07/30', 'YY/MM/DD'), 2, 3, 3
 FROM tblCourse;
end InsertCourseRecord;
2. 과정 수정
CREATE OR REPLACE PROCEDURE UpdateCourse AS
BEGIN
 UPDATE tblCourse
 SET room_seq = 3
 WHERE course_seq = 13;
 
END UpdateCourse;
3. 과정 삭제
CREATE OR REPLACE PROCEDURE DeleteCourse AS
BEGIN
 -- 데이터 삭제
 DELETE FROM tblCourse
 WHERE course_seq = 2;
END DeleteCourse;
4. 과정 조회
CREATE OR REPLACE PROCEDURE procCourse AS
BEGIN
 FOR course_rec IN (SELECT * FROM tblCourse WHERE course_seq = 1) LOOP
 DBMS_OUTPUT.PUT_LINE('Course Seq: ' || course_rec.course_seq);
 DBMS_OUTPUT.PUT_LINE('Course Start Date: ' || TO_CHAR(course_rec.courseStartDate, 'YY/MM/DD'));
 DBMS_OUTPUT.PUT_LINE('Course End Date: ' || TO_CHAR(course_rec.courseEndDate, 'YY/MM/DD'));
 DBMS_OUTPUT.PUT_LINE('Room Seq: ' || course_rec.room_seq);
 DBMS_OUTPUT.PUT_LINE('Course Status Seq: ' || course_rec.courseStatus_seq);
 DBMS_OUTPUT.PUT_LINE('Course Name Seq: ' || course_rec.courseName_seq);
 
 END LOOP;
END procCourse;

1. 학생 생성
CREATE OR REPLACE PROCEDURE procInsertStudent AS
BEGIN
 INSERT INTO tblStudent (student_seq, studentName, studentPw, studentTel)
 SELECT MAX(student_seq) + 1, '박세인', 1125957, '010-3954-3684'
 FROM tblStudent;
END procInsertStudent;
2. 수정
--수정
CREATE OR REPLACE PROCEDURE UpdateStudentName AS
BEGIN
 -- 데이터 업데이트
 UPDATE tblStudent
 SET studentName = '박세인'
 WHERE student_seq = 5;
END UpdateStudentName;
3. 삭제
--삭제
CREATE OR REPLACE PROCEDURE porcDeleteStudent AS
BEGIN
 -- 데이터 삭제
 DELETE FROM tblStudent
 WHERE student_seq = 3;
END porcDeleteStudent;
4. 조회
--조회
CREATE OR REPLACE PROCEDURE SelectStudent AS
BEGIN
 FOR student_rec IN (SELECT * FROM tblStudent WHERE student_seq = 10) LOOP
 DBMS_OUTPUT.PUT_LINE('Student Seq: ' || student_rec.student_seq);
 DBMS_OUTPUT.PUT_LINE('Student Name: ' || student_rec.studentName);
 DBMS_OUTPUT.PUT_LINE('Student Password: ' || student_rec.studentPw);
 DBMS_OUTPUT.PUT_LINE('Student Telephone: ' || student_rec.studentTel);
 
 END LOOP;
END SelectStudent;

1-1. 성적 입력 여부
CREATE OR REPLACE VIEW vwCourseScores AS
SELECT
 c.course_seq AS 과정번호,
 cn.coursename AS 과정명,
 c.coursestartdate AS 과정시작일,
 c.courseenddate AS 과정종료일,
 cs.coursesubject_seq AS 과목번호,
 s.subject AS 과목명,
 cs.coursesubjectstartdate AS 과목시작일,
 cs.cousesubjectenddate AS 과목종료일,
 b.textbook AS 교재명,
 t.teachername AS 교사명,
 CASE
 WHEN subq.cntall <> subq.cntregistered THEN 'N'
 ELSE 'Y'
 END AS 성적입력여부,
 CASE
 WHEN cs.coursesubject_seq IN (SELECT coursesubject_seq FROM tblexam) THEN 'Y'
 ELSE 'N'
 END AS 시험문제등록여부
FROM tblcoursesubject cs
 INNER JOIN tblcourse c
 ON cs.course_seq = c.course_seq
 INNER JOIN tblcoursename cn
 ON c.coursename_seq = cn.coursename_seq
 INNER JOIN tblsubjectavailability sa
 ON cs.subjectavailability_seq = sa.subjectavailability_seq
 INNER JOIN tblsubject s;
 
1. 출결정보 조회
-- 출결
CREATE OR REPLACE VIEW vwCourseAttendance AS
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
ORDER BY std.student_seq, a.attenddate;
SELECT * FROM vwCourseAttendance WHERE course_seq = 17;
CREATE OR REPLACE PROCEDURE procCourseAttendance (
 p_course_seq IN NUMBER
)
IS
 v_course_info vwCourseAttendance%ROWTYPE; 
BEGIN
 SELECT *
 INTO v_course_info
 FROM vwCourseAttendance
 WHERE course_seq = p_course_seq
 AND ROWNUM = 1;
 DBMS_OUTPUT.PUT_LINE('과정 번호: ' || v_course_info.course_seq);
 DBMS_OUTPUT.PUT_LINE('과정명: ' || v_course_info.coursename);
 DBMS_OUTPUT.PUT_LINE('과정 시작일: ' || TO_CHAR(v_course_info.coursestartdate, 'YYYY-MM-DD'));
 DBMS_OUTPUT.PUT_LINE('과정 종료일: ' || TO_CHAR(v_course_info.courseenddate, 'YYYY-MM-DD'));
 DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------');
 DBMS_OUTPUT.PUT_LINE('교육생 번호 | 교육생 이름 | 주민번호 뒷자리 | 교육생 전화번호 | 출결 날짜 | 출결 상태');
 DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------');
 FOR student_info IN (SELECT * FROM vwCourseAttendance WHERE course_seq = p_course_seq)
 LOOP
 DBMS_OUTPUT.PUT_LINE(
 student_info.student_seq || ' | ' || 
 student_info.studentname || ' | ' || 
 student_info.studentpw || ' | ' || 
 student_info.studenttel || ' | ' || 
 TO_CHAR(student_info.attenddate, 'YYYY-MM-DD') || ' | ' || 
 student_info.attendstate
 );
 END LOOP;
END;
BEGIN
procCourseAttendance(17);
END;
2. 특정기간 출결 현황 조회
CREATE OR REPLACE PROCEDURE procCourseAttendanceByDate (
 p_course_seq IN NUMBER,
 p_start_date IN DATE,
 p_end_date IN DATE
)
IS
 v_course_info vwCourseAttendance%ROWTYPE; 
BEGIN
 
 SELECT *
 INTO v_course_info
 FROM vwCourseAttendance
 WHERE course_seq = p_course_seq
 AND ROWNUM = 1; 
 DBMS_OUTPUT.PUT_LINE('과정 번호: ' || v_course_info.course_seq);
 DBMS_OUTPUT.PUT_LINE('과정명: ' || v_course_info.coursename);
 DBMS_OUTPUT.PUT_LINE('과정 시작일: ' || TO_CHAR(v_course_info.coursestartdate, 'YYYY-MM-DD'));
 DBMS_OUTPUT.PUT_LINE('과정 종료일: ' || TO_CHAR(v_course_info.courseenddate, 'YYYY-MM-DD'));
 DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------');
 DBMS_OUTPUT.PUT_LINE('교육생 번호 | 교육생 이름 | 주민번호 뒷자리 | 교육생 전화번호 | 출결 날짜 | 출결 상태');
 DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------');
 FOR student_info IN (SELECT * FROM vwCourseAttendance WHERE course_seq = p_course_seq AND attenddate BETWEEN p_start_date AND 
p_end_date)
 LOOP
 DBMS_OUTPUT.PUT_LINE(
 student_info.student_seq || ' | ' || 
 student_info.studentname || ' | ' || 
 student_info.studentpw || ' | ' || 
 student_info.studenttel || ' | ' || 
 TO_CHAR(student_info.attenddate, 'YYYY-MM-DD') || ' | ' || 
 student_info.attendstate
 );
 END LOOP;
END;
BEGIN
 procCourseAttendanceByDate(17, TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-30', 'YYYY-MM-DD'));
END;
4. 특정 교육생의 특정 기간별 출결 현황 조회
CREATE OR REPLACE PROCEDURE procStudentAttendanceByDate (
 p_student_seq IN NUMBER,
 p_start_date IN DATE,
 p_end_date IN DATE
)
IS
BEGIN
 -- 컬럼명 출력
 DBMS_OUTPUT.PUT_LINE('교육생 번호 | 과정번호 | 과정명 | 출결 날짜 | 출결 상태');
 DBMS_OUTPUT.PUT_LINE('----------------------------------------------------');
 
 -- 출결 정보 조회 및 출력
 FOR attendance_info IN (
 SELECT
 course_seq AS course_id,
 coursename AS course_name,
 attenddate AS attendance_date,
 attendstate AS attendance_state
 FROM vwCourseAttendance
 WHERE student_seq = p_student_seq
 AND attenddate BETWEEN p_start_date AND p_end_date
 ) 
 LOOP
 DBMS_OUTPUT.PUT_LINE(
 p_student_seq || ' | ' || 
 attendance_info.course_id || ' | ' || 
 attendance_info.course_name || ' | ' || 
 TO_CHAR(attendance_info.attendance_date, 'YYYY-MM-DD') || ' | ' || 
 attendance_info.attendance_state
 );
 END LOOP;
END;
BEGIN
 procStudentAttendanceByDate(교육생번호, TO_DATE('시작날짜', 'YYYY-MM-DD'), TO_DATE('종료날짜', 'YYYY-MM-DD'));
END;

1. 이상이 보고된 컴퓨터 조회
CREATE OR REPLACE VIEW vwComputerStatus AS
SELECT
comm.commanagedate AS "등록 일자",
comm.room_seq || '강의실' AS 강의실명,
comm.comnum AS "컴퓨터 번호",
coms.comstate AS "컴퓨터 상태",
CASE
WHEN comm.comendrepair IS NULL THEN '미완료'
ELSE '완료'
END AS "수리 완료 여부"
FROM tblcommanage comm
INNER JOIN tblcomstate coms
ON comm.comstate_seq = coms.comstate_seq
ORDER BY "등록 일자", 강의실명, "컴퓨터 번호";
/
SELECT * FROM vwComputerStatus;
/
CREATE OR REPLACE PROCEDURE printComputerStatus
IS
BEGIN
 DBMS_OUTPUT.PUT_LINE('등록 일자 | 강의실명 | 컴퓨터 번호 | 컴퓨터 상태 | 수리 완료 여부');
 DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------');
 
 FOR computer_info IN (SELECT * FROM vwComputerStatus)
 LOOP
 DBMS_OUTPUT.PUT_LINE(
 computer_info."등록 일자" || ' | ' || 
 computer_info.강의실명 || ' | ' || 
 computer_info."컴퓨터 번호" || ' | ' || 
 computer_info."컴퓨터 상태" || ' | ' || 
 computer_info."수리 완료 여부"
 );
 END LOOP;
END;
/
BEGIN
 printComputerStatus;
END;
2. 컴퓨터 이상보고 수정
-- PL/SQL 프로시저: 목록 번호를 기반으로 수정
CREATE OR REPLACE PROCEDURE updateComputerRepairByList(
 p_commanage_seq IN tblcommanage.commanage_seq%TYPE
)
IS
BEGIN
 UPDATE tblcommanage
 SET comendrepair = SYSDATE
 WHERE commanage_seq = p_commanage_seq;
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('컴퓨터가 수리 완료되었습니다.');
EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다.');
END;
/
-- PL/SQL 프로시저: 강의실 번호와 컴퓨터 번호를 입력하여 수정
CREATE OR REPLACE PROCEDURE updateComputerRepairByRoomAndComputer(
 p_room_seq IN tblcommanage.room_seq%TYPE,
 p_comnum IN tblcommanage.comnum%TYPE
)
IS
BEGIN
 UPDATE tblcommanage
 SET comendrepair = SYSDATE
 WHERE room_seq = p_room_seq
 AND comnum = p_comnum
 AND comendrepair IS NULL;
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('컴퓨터가 수리 완료되었습니다.');
EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다.');
 ROLLBACK;
END;
-- 목록 번호를 기반으로 수정
BEGIN
 updateComputerRepairByList(20); -- 원하는 목록 번호 입력
END;
-- 강의실 번호와 컴퓨터 번호를 입력하여 수정
BEGIN
 updateComputerRepairByRoomAndComputer(6, 1); -- 강의실 번호와 컴퓨터 번호 입력
END;

1. 교육생의 취업정보 조회
-- vwStudentEmploymentDetails 뷰 생성
CREATE OR REPLACE VIEW vwStudentEmploymentDetails AS
SELECT
-- 교육생 정보
std.student_seq AS "교육생 번호",
std.studentname AS "교육생 이름",
std.studentpw AS "주민번호 뒷자리",
std.studenttel AS "교육생 전화번호",
--과정 정보
c.course_seq AS "과정 번호",
cn.coursename AS "과정명",
c.coursestartdate AS "과정 시작일",
c.courseenddate AS "과정 종료일",
cp.completestate_seq AS "수료 상태 번호",
cp.completestate AS "수료 상태",
-- 경력
w.workspace AS "경력",
w.workstartdate AS "경력 시작일",
w.worrenddate AS "경력 종료일",
w.worktask AS "경력 업무",
-- 자격증
cfn.certifyname AS "자격증",
-- 희망 근무 조건
hd.hopedutyfield AS "희망 근무 분야",
hd.hopesalary AS "희망 연봉",
ha.hopearea AS "희망 근무 지역",
-- 취업 현황
e.companyname AS "취업 회사명",
e.insurance AS "취업 보험 여부",
e.hiredate AS "취업 일자"
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
ON std.student_seq = e.student_seq;/
-- 프로시저 생성
CREATE OR REPLACE PROCEDURE procCourseEmploymentDetails (
 p_course_seq IN number
)
IS
 v_course_info vwStudentEmploymentDetails%ROWTYPE;
BEGIN
 SELECT *
 INTO v_course_info
 FROM vwStudentEmploymentDetails
 WHERE "과정 번호" = p_course_seq and rownum = 1;
 DBMS_OUTPUT.PUT_LINE('과정번호: ' || p_course_seq);
 DBMS_OUTPUT.PUT_LINE('과정명: ' || v_course_info."과정명");
 DBMS_OUTPUT.PUT_LINE('과정 시작일: ' || v_course_info."과정 시작일");
 DBMS_OUTPUT.PUT_LINE('과정 종료일: ' || v_course_info."과정 종료일");
 
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------------');
 DBMS_OUTPUT.PUT_LINE('교육생 이름 | 수료 상태 | 경력 | 자격증 | 희망 근무 분야 | 희망 연봉 | 희망 근무 지역 | 취업 회사명 | 취업 보험 여부
| 취업 일자');
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------------');
 FOR student_info IN (SELECT * FROM vwStudentEmploymentDetails WHERE "과정 번호" = p_course_seq)
 LOOP
 DBMS_OUTPUT.PUT_LINE(
 student_info."교육생 이름" || ' | ' || 
 student_info."수료 상태" || ' | ' || 
 NVL(student_info."경력", '없음') || ' | ' || 
 NVL(student_info."자격증", '없음') || ' | ' || 
 student_info."희망 근무 분야" || ', ' || 
 student_info."희망 연봉" || ', ' || 
 student_info."희망 근무 지역" || ' | ' || 
 student_info."취업 회사명" || ', ' || 
 student_info."취업 보험 여부" || ', ' || 
 student_info."취업 일자"
 );
 END LOOP;
END;

1. 설문조사 파일 목록 조회
SELECT * FROM tblsurveyfile;
2. 특정 과목에 대한 설문조사 파일 조회
SELECT * FROM vwSurveySubjDetails WHERE course_seq = 1;/
-- 특정 과정의 설문조사 조회
CREATE OR REPLACE VIEW vwSurveySubjDetails AS
SELECT
 DISTINCT
 -- 개설 과정 정보 (과정명, 과정기간, 강의실)
 c.course_seq AS course_seq,
 cn.coursename AS coursename,
 c.coursestartdate AS coursestartdate,
 c.courseenddate AS courseenddate,
 c.room_seq AS room_seq,
 -- 과목명, 과목기간, 교재명, 교사명
 cs.coursesubject_seq AS coursesubject_seq,
 s.subject AS subject,
 cs.coursesubjectstartdate AS coursesubjectstartdate,
 cs.cousesubjectenddate AS coursesubjectenddate,
 b.textbook AS textbook,
 t.teachername AS teachername,
 svf.surveyfile AS surveyfile,
 case 
 when svf.surveyfile is null then '미등록'
 else '등록'
 end as "파일 등록 여부"
FROM tblcoursesubject cs
 INNER JOIN tblcourse c ON cs.course_seq = c.course_seq
 INNER JOIN tblcoursename cn ON c.coursename_seq = cn.coursename_seq
 INNER JOIN tblsubjectavailability sa ON cs.subjectavailability_seq = sa.subjectavailability_seq
 INNER JOIN tblsubject s ON sa.subject_seq = s.subject_seq
 INNER JOIN tbltextbook b ON cs.textbook_seq = b.textbook_seq
 INNER JOIN tblteacher t ON sa.teacher_seq = t.teacher_seq
 LEFT OUTER JOIN tblsurvey sv ON cs.coursesubject_seq = sv.coursesubject_seq
 LEFT OUTER JOIN tblsurveyfile svf ON sv.surveyfile_seq = svf.surveyfile_seq;/
select * from VWSURVEYSUBJDETAILS;
CREATE OR REPLACE PROCEDURE procSurveyDetails (
 p_course_seq IN vwSurveySubjDetails.course_seq%TYPE
)
IS
 v_course_info vwSurveySubjDetails%ROWTYPE;
BEGIN
 SELECT *
 INTO v_course_info
 FROM vwSurveySubjDetails
 WHERE course_seq = p_course_seq and rownum = 1;
 DBMS_OUTPUT.PUT_LINE('과정 번호: ' || v_course_info.course_seq);
 DBMS_OUTPUT.PUT_LINE('과정 명: ' || v_course_info.coursename);
 DBMS_OUTPUT.PUT_LINE('과정 시작일: ' || v_course_info.coursestartdate);
 DBMS_OUTPUT.PUT_LINE('과정 종료일: ' || v_course_info.courseenddate);
 DBMS_OUTPUT.PUT_LINE('강의실: ' || v_course_info.room_seq);
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------');
 DBMS_OUTPUT.PUT_LINE('과목번호 | 과목명 | 과목 시작일 | 과목 종료일 | 교재명 | 교사명 | 설문파일 | 파일 등록 여부');
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------');
 FOR survey_info IN (SELECT * FROM vwSurveySubjDetails WHERE course_seq = p_course_seq)
 LOOP
 DBMS_OUTPUT.PUT_LINE(
 survey_info.coursesubject_seq || ' | ' || survey_info.subject || ' | ' || survey_info.coursesubjectstartdate || ' | ' ||
 survey_info.coursesubjectenddate || ' | ' || survey_info.textbook || ' | ' || survey_info.teachername || ' | ' ||
 survey_info.surveyfile || ' | ' || survey_info."파일 등록 여부"
 );
 END LOOP;
END;
/
BEGIN
 procSurveyDetails(17);
END;
3.
-- 특정 교육생이 작성한 설문조사 조회
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
WHERE std.student_seq = 337 /*원하는 교육생*/;/
SELECT * FROM tblsurvey;/
--뷰
CREATE OR REPLACE VIEW vwStudentSurveyDetails AS
SELECT
 distinct
 std.student_seq,
 std.studentname,
 std.studentpw,
 std.studenttel,
 c.course_seq,
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
 ON sv.surveyfile_seq = svf.surveyfile_seq;
/
select * from vwStudentSurveyDetails;
--프로시저
CREATE OR REPLACE PROCEDURE procStudentSurveyDetails (
 p_student_seq IN tblstudent.student_seq%TYPE
)
IS
 v_student_info vwStudentSurveyDetails%ROWTYPE;
BEGIN
 SELECT * INTO v_student_info
 FROM vwStudentSurveyDetails
 WHERE student_seq = p_student_seq and rownum = 1;
 
 DBMS_OUTPUT.PUT_LINE('과정번호: ' || v_student_info.course_seq);
 DBMS_OUTPUT.PUT_LINE('과정명: ' || v_student_info.coursename);
 DBMS_OUTPUT.PUT_LINE('과정 시작일: ' || v_student_info.coursestartdate);
 DBMS_OUTPUT.PUT_LINE('과정 종료일: ' || v_student_info.courseenddate);
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------');
 
 DBMS_OUTPUT.PUT_LINE('교육생 번호: ' || v_student_info.student_seq);
 DBMS_OUTPUT.PUT_LINE('교육생 이름: ' || v_student_info.studentname);
 DBMS_OUTPUT.PUT_LINE('교육생 비밀번호: ' || v_student_info.studentpw);
 DBMS_OUTPUT.PUT_LINE('교육생 전화번호: ' || v_student_info.studenttel);
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------');
 DBMS_OUTPUT.PUT_LINE('과정번호 | 설문 파일 | 설문 작성일');
 DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------');
 FOR survey_info IN (SELECT * FROM vwStudentSurveyDetails WHERE student_seq = p_student_seq)
 LOOP
 DBMS_OUTPUT.PUT_LINE(survey_info.course_seq || ' | ' || survey_info.surveyfile || ' | ' || survey_info.surveydate);
 END LOOP;
END;
/
BEGIN
 procStudentSurveyDetails(337); -- 원하는 교육생 번호 입력
END;
/
4. 설문조사 파일 수정
UPDATE tblsurveyfile SET surveyfile = '수정할 내용' WHERE surveyfile_seq = 1/*수정할 파일 번호*/;
CREATE OR REPLACE PROCEDURE procUpdateSurveyFile(
 pSurveyFileSeq NUMBER,
 pNewContent VARCHAR2
) AS
BEGIN
 -- 설문조사 파일 수정
 UPDATE tblsurveyfile SET surveyfile = pNewContent WHERE surveyfile_seq = pSurveyFileSeq;
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('설문조사 파일이 수정되었습니다.');
END;
BEGIN
 procUpdateSurveyFile(1, '수정할 내용');
END;
5. 설문조사 파일 등록
INSERT INTO tblSurveyFile (surveyFile_seq, surveyFile) VALUES (seqSurveyFile.nextVal, '파일명');
CREATE OR REPLACE PROCEDURE procUploadSurveyFile(
 pFileName VARCHAR2
) AS
BEGIN
 -- 설문조사 파일 등록
 INSERT INTO tblSurveyFile (surveyFile_seq, surveyFile) VALUES (seqSurveyFile.nextVal, pFileName);
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('설문조사 파일이 등록되었습니다.');
END;
BEGIN
 procUploadSurveyFile('새로운파일.txt');
END;

1. 파일 조회
SELECT * FROM tblevaluatefile;
CREATE OR REPLACE PROCEDURE procEvaluateFileList AS
BEGIN
 -- 파일 조회 쿼리
 FOR file_data IN (SELECT * FROM tblevaluatefile)
 LOOP
 DBMS_OUTPUT.PUT_LINE('Evaluate File Seq: ' || file_data.evaluatefile_seq);
 DBMS_OUTPUT.PUT_LINE('Evaluate File Name: ' || file_data.evaluatefile);
 END LOOP;
END;
2. 파일 등록
INSERT INTO tblEvaluateFile (evaluateFile_seq, evaluateFile) VALUES (seqEvaluateFile.nextVal, '파일 등록');
CREATE OR REPLACE PROCEDURE procEvaluateFileInsert (
 p_file_name IN VARCHAR2
)
AS
BEGIN
 -- 파일 등록 쿼리
 INSERT INTO tblEvaluateFile (evaluateFile_seq, evaluateFile)
 VALUES (seqEvaluateFile.nextVal, p_file_name);
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('파일이 등록되었습니다.');
EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('파일 등록 중 오류가 발생했습니다.');
END;
/
3-1. 파일 수정
UPDATE tblevaluatefile SET evaluatefile = '원하는 파일명' WHERE evaluatefile_seq = 1/*원하는 번호*/;
CREATE OR REPLACE PROCEDURE procEvaluateFileUpdate (
 p_file_seq IN NUMBER,
 p_new_file_name IN VARCHAR2
)
AS
BEGIN
 -- 파일 수정 쿼리
 UPDATE tblevaluatefile
 SET evaluatefile = p_new_file_name
 WHERE evaluatefile_seq = p_file_seq;
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('파일이 수정되었습니다.');
EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('파일 수정 중 오류가 발생했습니다.');
END;
3-2. 파일 삭제
DELETE FROM tblEvaluateFile WHERE evaluatefile_seq = 1/*원하는 번호*/;
CREATE OR REPLACE PROCEDURE procEvaluateFileDelete (
 p_file_seq IN NUMBER
)
AS
BEGIN
 -- 파일 삭제 쿼리
 DELETE FROM tblevaluatefile WHERE evaluatefile_seq = p_file_seq;
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('파일이 삭제되었습니다.');
EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('파일 삭제 중 오류가 발생했습니다.');
END;
/
4.개설 과목들의 진단평가 조회
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
WHERE c.course_seq = 17
ORDER BY c.course_seq, cs.coursesubject_seq
;
/
5. 특정 과정선택시 교육생 목록
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
/
CREATE OR REPLACE VIEW vwCsEvaluation AS
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


CREATE OR REPLACE PROCEDURE procStudentStudyGuide(
 studentNum NUMBER
) IS
BEGIN
 FOR op IN (
 SELECT 
 c.course_seq AS aaa,
 cn.coursename AS bbb,
 TO_CHAR(c.coursestartdate, 'yyyy-mm-dd') || ' ~ ' || TO_CHAR(c.courseenddate, 'yyyy-mm-dd') AS ccc,
 sq.te AS ddd,
 sgf.studyguidefile_seq AS eee,
 sgf.studyguidefile AS fff
 FROM tblstudyguide sg
 INNER JOIN tblstudyguidefile sgf ON sg.studyguidefile_seq = sgf.studyguidefile_seq
 INNER JOIN tblcourse c ON c.course_seq = sg.course_seq
 INNER JOIN tblcoursename cn ON cn.coursename_seq = c.coursename_seq
 INNER JOIN (SELECT course_seq AS seq FROM tblcoursereg GROUP BY course_seq) st ON st.seq = c.course_seq
 INNER JOIN (SELECT cs2.course_seq AS co, t2.teachername AS te
 FROM tblcoursesubject cs2
 INNER JOIN tblsubjectavailability sa2 ON cs2.subjectavailability_seq = sa2.subjectavailability_seq
 INNER JOIN tblteacher t2 ON sa2.teacher_seq = t2.teacher_seq
 GROUP BY cs2.course_seq, t2.teachername
 ORDER BY cs2.course_seq) sq ON sq.co = c.course_seq
 WHERE c.course_seq = studentNum
 ) LOOP
 DBMS_OUTPUT.PUT_LINE('과정 기간: ' || op.ccc || ' | 강사명: ' || op.ddd || ' | 학습안내서 파일번호: ' || op.eee ||' | 학습안내서 파일명: 
' || op.fff);
 END LOOP;
END procStudentStudyGuide;
DECLARE
coursenum NUMBER := 1; -- 과정번호
BEGIN
procStudentCourse(coursenum);
 DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------');
 procStudentStudyGuide(coursenum);
END;

1-1. 강의 스케줄 조회(강의 진행 여부 포함)
create or replace procedure procTeacherSchedule(sq in number)
as
 v_current_date date := sysdate; -- 현재 날짜를 가져옴
 v_course_status varchar2(20); -- 강의 상태를 저장할 변수
begin
 for rec in(
SELECT
s.subject_seq AS "과목번호", 
cn.courseName AS "과정명", 
c.courseStartDate AS "과정 시작일", 
c.courseEndDate AS "과정 종료일", 
s.subject AS "과목명", 
cs.courseSubjectStartDate AS "과목 시작일", 
cs.couseSubjectEndDate AS "과목 종료일", --courseEndDate(X), couseEndDate(O) 
cr.room_seq AS "강의실", 
t.textBook AS "교재명"
from tblCourse c
 INNER JOIN tblCourseRoom cr ON c.room_seq = cr.room_seq
 INNER JOIN tblCourseStatus ccs ON c.courseStatus_seq = ccs.courseStatus_seq
 INNER JOIN tblcourseName cn ON c.courseName_seq = cn.courseName_seq
 INNER JOIN tblCourseSubject cs ON c.course_seq = cs.course_seq
 INNER JOIN tblTextbook t ON cs.textBook_seq = t.textBook_seq
 INNER JOIN tblSubjectAvailability sa ON cs.subjectAvailability_seq = sa.subjectAvailability_seq
 INNER JOIN tblSubject s ON sa.subject_seq = s.subject_seq
 WHERE s.subject_seq = sq
 ORDER BY s.subject_seq DESC
)
 loop
 -- 강의 상태 계산
 IF v_current_date < rec."과정 시작일" THEN
 v_course_status := '강의예정';
 ELSIF v_current_date >= rec."과정 시작일" AND v_current_date <= rec."과정 종료일" THEN
 v_course_status := '강의중';
 ELSE
 v_course_status := '강의종료';
 END IF;
 
 dbms_output.put_line('과정명 : ' || rec."과정명" || '(' || rec."강의실" || '강의실)');
 dbms_output.put_line('과정 기간 : ' || rec."과정 시작일" || ' ~ ' || rec."과정 종료일");
 dbms_output.put_line('과목명 : ' || rec."과목명" || ' 교재 : ' || rec."교재명");
 dbms_output.put_line('과목 기간 : ' || rec."과목 시작일" || ' ~ ' || rec."과목 종료일");
 dbms_output.put_line('강의 상태 : ' || v_course_status);
 DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
 end loop; 
end procTeacherSchedule;
BEGIN
 procTeacherSchedule(1);
END;
1-2. 교육생 정보조회(수료 여부 포함)
CREATE OR REPLACE PROCEDURE procStudentInfo(sq IN number)
AS
BEGIN
FOR rec IN(
SELECT 
s.student_seq AS "학생번호",
s.studentName AS "학생명", 
s.studentTel AS "전화번호", 
c.courseStartDate AS "등록일", 
cs.completeState AS "수료여부",
 1 || '회' AS "수강신청 횟수"
 FROM tblCourseReg cr
INNER JOIN tblStudent s ON cr.student_seq = s.student_seq
INNER JOIN tblCompleteState cs ON cs.completeState_seq = cr.completeState_seq
INNER JOIN tblCourse c ON c.course_seq = cr.course_seq
WHERE s.student_seq = sq
ORDER BY s.studentName ASC
)
LOOP
dbms_output.put_line('학생명 : ' || rec."학생명" || '(' || rec."전화번호" || ')');
dbms_output.put_line('등록일 : ' || rec."등록일");
dbms_output.put_line('수강신청 횟수 : ' || rec."수강신청 횟수");
dbms_output.put_line('수료여부 : ' || rec."수료여부");
END LOOP;
END procStudentInfo;
BEGIN
procStudentInfo(1);
END;

1. 강의를 마친 과목의 목록 조회
CREATE OR REPLACE PROCEDURE procCourseSubjectInfo(sq IN number)
AS
BEGIN
 FOR rec IN (
 SELECT 
 s.subject_seq AS "과목번호", 
 cn.courseName AS "과정명", 
 c.courseStartDate AS "과정 시작일", 
 c.courseEndDate AS "과정 종료일", 
 s.subject AS "과목명", 
 cs.courseSubjectStartDate AS "과목 시작일", 
 cs.couseSubjectEndDate AS "과목 종료일", 
 cr.room_seq || '강의실' AS "강의실", 
 t.textBook AS "교재명",
 p.attendPoint AS "출결배점", 
 p.wPoint AS "필기배점", 
 p.pPoint AS "실기배점",
 CASE
 WHEN SYSDATE > cs.couseSubjectEndDate THEN '종료'
 ELSE '진행 중'
 END AS "과목상태"
 FROM tblCourse c
 INNER JOIN tblCourseRoom cr ON c.room_seq = cr.room_seq
 INNER JOIN tblCourseStatus ccs ON c.courseStatus_seq = ccs.courseStatus_seq
 INNER JOIN tblCourseName cn ON c.courseName_seq = cn.courseName_seq
 INNER JOIN tblCourseSubject cs ON c.course_seq = cs.course_seq
 INNER JOIN tblTextbook t ON cs.textBook_seq = t.textBook_seq
 INNER JOIN tblSubjectAvailability sa ON cs.subjectAvailability_seq = sa.subjectAvailability_seq
 INNER JOIN tblSubject s ON sa.subject_seq = s.subject_seq
 INNER JOIN tblPoint p ON p.courseSubject_seq = cs.courseSubject_seq
 WHERE s.subject_seq = sq
 ORDER BY 3 ASC
 )
 LOOP
 IF rec."과목상태" = '종료' THEN
 dbms_output.put_line('과정명 : ' || rec."과정명" || '(' || rec."과정 시작일" || ' ~ ' || rec."과정 종료일" || ')');
 dbms_output.put_line('과목명 : ' || rec."과목명" || '(' || rec."과목 시작일" || ' ~ ' || rec."과목 종료일" || ')');
 dbms_output.put_line('강의실 : ' || rec."강의실");
 dbms_output.put_line('교재명 : ' || rec."교재명");
 dbms_output.put_line('배점 : [' || '출결 : ' || rec."출결배점" || ' 필기 : ' || rec."필기배점" || ' 실기 : ' || rec."실기배점" || ']');
 DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
 END IF;
 END LOOP;
END procCourseSubjectInfo;
2. 특정 과목 배점 정보 입력
CREATE OR REPLACE PROCEDURE procUpdatePoint(cs IN NUMBER, ap IN NUMBER, wp IN NUMBER, pp IN NUMBER)
AS
 totalPoint NUMBER;
BEGIN
 -- 세 배점의 합 계산
 totalPoint := ap + wp + pp;
 -- 출결배점이 20점 이하인 경우 예외 처리
 IF ap < 20 THEN
 dbms_output.put_line('출결점수는 20점 이상이어야 합니다.');
 RETURN; -- 예외 발생 시 프로시저 종료
 END IF;
 
 -- 세 배점의 합이 100이 아닌 경우 예외 처리
 IF totalPoint <> 100 THEN
 dbms_output.put_line('출결점수, 필기점수, 실기점수의 합은 100이어야 합니다.');
 RETURN; -- 예외 발생 시 프로시저 종료
 END IF;
 -- 예외가 발생하지 않으면 점수 업데이트
 UPDATE TBLPOINT
 SET
 attendPoint = ap,
 wPoint = wp,
 pPoint = pp
 WHERE courseSubject_seq = cs;
 -- COMMIT; -- 커밋 필요 시 주석 해제
EXCEPTION
 WHEN OTHERS THEN
 dbms_output.put_line('오류입니다');
 -- ROLLBACK; -- 롤백하여 트랜잭션 롤백 (예외 발생 시)
 -- RAISE; -- 예외를 다시 발생시켜 상위 레벨로 전파
END procUpdatePoint;

1. 강의를 마친 과목의 목록 조회
CREATE OR REPLACE PROCEDURE procEndCourseInfo(sq IN number)
AS
BEGIN
FOR rec IN(
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
WHERE s.subject_seq = sq
ORDER BY 1 ASC
)
LOOP
dbms_output.put_line('과정명 : ' || rec."과정명" || '(' || rec."과정 시작일" || ' ~ ' || rec."과정 종료일" || ')');
dbms_output.put_line('과목명 : ' || rec."과목명" || '(' || rec."과목 시작일" || ' ~ ' || rec."과목 종료일" || ')');
dbms_output.put_line('강의실 : ' || rec."강의실");
dbms_output.put_line('교재명 : ' || rec."교재명");
dbms_output.put_line('[출결배점 : ' || rec."출결배점" || ' 필기배점 : ' || rec."필기배점" || ' 실기배점 : ' || rec."실기배점" || ']');
dbms_output.put_line('성적 등록 여부 : ' || rec."성적 등록 여부");
DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
END LOOP;
END procEndCourseInfo;
2. 특정 과목의 성적 정보 조회
CREATE OR REPLACE PROCEDURE procStudentScore(sq IN number)
AS
BEGIN
FOR rec IN(
SELECT
 s.studentName AS "교육생 이름",
 s.studentTel AS "전화번호",
 cs.completeState AS "수료여부",
 a.attendScore AS "출석점수",
 a.wScore AS "필기성적",
 a.pScore AS "실기성적",
 sub.subject AS "과목명",
 cn.courseName AS "과정명"
FROM tblStudent s
INNER JOIN tblAllScore a ON s.student_seq = a.student_seq
INNER JOIN tblCourseReg cr ON s.student_seq = cr.student_seq
 INNER JOIN tblCompleteState cs ON cs.completeState_seq = cr.completeState_seq
 INNER JOIN tblCourse c ON c.course_seq = cr.course_seq
 INNER JOIN tblCourseName cn ON cn.courseName_seq = c.courseName_seq
INNER JOIN tblCourseSubject css ON c.course_seq = css.course_seq
INNER JOIN tblSubjectAvailability sa ON sa.subjectAvailability_seq = css.subjectavailability_seq
INNER JOIN tblSubject sub ON sub.subject_seq = sa.subject_seq
WHERE s.student_seq = sq
ORDER BY 1 ASC
)
LOOP
dbms_output.put_line('교육생 이름 : ' || rec."교육생 이름" || '(' || rec."전화번호" || ')');
dbms_output.put_line('과정명 : ' ||rec."과정명");
dbms_output.put_line('수료여부 : ' || rec."수료여부");
dbms_output.put_line('과목명 : ' || rec."과목명");
dbms_output.put_line('출석점수 : ' || rec."출석점수" || ' 필기성적 : ' || rec."필기성적" || ' 실기성적 : ' || rec."실기성적");
DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
END LOOP;
END procStudentScore;
3. 특정 과목의 성적 정보 입력
CREATE OR REPLACE PROCEDURE procUpdateScore(sq IN NUMBER, pn IN NUMBER, a IN NUMBER, ws IN NUMBER, ps IN number)
AS
BEGIN
 UPDATE tblAllScore 
SET 
attendScore = a,
wScore = ws,
pScore = ps
WHERE student_seq = sq AND pointNum = pn;
EXCEPTION
 WHEN OTHERS THEN
 dbms_output.put_line('오류입니다');
END procUpdateScore;

1. 자신의 과정 목록 조회
CREATE OR REPLACE PROCEDURE procTeacherCourseCheck(ts IN number)
AS
BEGIN
FOR rec IN(
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
WHERE t.teacher_seq = ts
ORDER BY cs.courseSubjectStartDate asc
)
LOOP
dbms_output.put_line('이름 : ' || rec."이름");
dbms_output.put_line('전화번호 : ' || rec."전화번호");
dbms_output.put_line('과정명 : ' || rec."과정명");
dbms_output.put_line('과목명 : ' || rec."과목명");
dbms_output.put_line('과목 시작일 : ' || rec."과목 시작일" || ' 과목 종료일 : ' || rec."과목 종료일");
END LOOP;
END procTeacherCourseCheck;
2. 모든 일자의 모든 교육생에 대한 출결 정보를 출력
CREATE OR REPLACE PROCEDURE procStudentAllDateAttend(sq IN number)
AS
BEGIN
FOR rec IN(
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
WHERE s.student_seq = sq
ORDER BY s.studentName ASC
)
LOOP
dbms_output.put_line('학생번호 : ' || rec."학생번호");
dbms_output.put_line('학생 이름 : ' || rec."학생 이름");
dbms_output.put_line('출결 날짜 : ' || rec."출결 날짜");
dbms_output.put_line('등원시간 : ' || rec."등원시간" || ' 하원시간 : ' || rec."하원시간");
dbms_output.put_line('출결상태 : ' || rec."출결상태");
END LOOP;
END procStudentAllDateAttend;
3. 특정 기간별 출결 현황 조회
CREATE OR REPLACE PROCEDURE procCheckAttend(inputDate IN DATE, sq IN number)
AS
BEGIN
 FOR rec IN (
 SELECT
 s.student_seq AS "학생번호",
 s.studentName AS "학생이름",
 a.attendDate AS "출결날짜",
 a.attendStartTime AS "등원시간",
 a.attendEndTime AS "하원시간",
 tas.attendState AS "출결상태" 
 FROM tblAttend a 
 INNER JOIN tblAttendState tas ON tas.attendState_seq = a.attendState_seq
 INNER JOIN tblStudent s ON s.student_seq = a.student_seq
 WHERE a.attendDate > inputDate AND s.student_seq = sq
 ORDER BY s.studentName, a.attendDate ASC
 )
 LOOP
 dbms_output.put_line('학생이름 : ' || rec."학생이름");
 dbms_output.put_line('출결날짜 : ' || rec."출결날짜" || '(' || rec."출결상태" || ')');
 dbms_output.put_line('등원시간 : ' || rec."등원시간" || ' | ' || '하원시간 : ' || rec."하원시간");
 DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
 END LOOP;
EXCEPTION
 WHEN OTHERS THEN
 dbms_output.put_line('오류 발생');
END procCheckAttend;
4. 교육생 1명의 출결 현황 조회
CREATE OR REPLACE PROCEDURE procStudentAttendInfo(sq IN number)
AS
BEGIN
FOR rec IN(
SELECT
s.studentName AS "학생 이름",
a.attendDate AS "출결날짜",
a.attendStartTime AS "등원시간",
a.attendEndTime AS "하원시간",
tas.attendState AS "출결상태"
FROM tblAttend a 
INNER JOIN tblAttendState tas ON tas.attendState_seq = a.attendState_seq
INNER JOIN tblStudent s ON s.student_seq = a.student_seq
WHERE s.student_seq = sq
ORDER BY a.attendDate ASC
)
LOOP
dbms_output.put_line('학생 이름 : ' || rec."학생 이름");
dbms_output.put_line('출결날짜 : ' || rec."출결날짜" || ' 출결상태 : ' || rec."출결상태");
dbms_output.put_line('등원시간 : ' || rec."등원시간" || ' 하원시간 : ' || rec."하원시간");
END LOOP;
END procStudentAttendInfo;

1. 수료가 완료된 과정 목록
CREATE OR REPLACE PROCEDURE procEndCourseInfo(cseq IN number)
AS
BEGIN
FOR rec IN(
SELECT 
DISTINCT cn.courseName AS "과정명",
c.courseStartDate AS "과정시작일",
c.courseEndDate AS "과정종료일",
cr.completeDate AS "수료일",
cs.courseStatus AS "과정 진행상태"
FROM tblCourse c
INNER JOIN tblCourseReg cr ON c.course_seq = cr.course_seq
INNER JOIN tblCourseName cn ON cn.courseName_seq = c.courseName_seq
INNER JOIN tblCourseStatus cs ON cs.courseStatus_seq = c.courseStatus_seq
WHERE c.course_seq = cseq
)
LOOP
dbms_output.put_line('과정명 : ' || rec."과정명");
dbms_output.put_line('과정시작일 : ' || rec."과정시작일" || ' ~ ' || rec."과정종료일");
dbms_output.put_line('수료일 : ' || rec."수료일" || '(' ||rec."과정 진행상태" || ')');
END LOOP;
END procEndCourseInfo;
2. 수료한 교육생 목록
CREATE OR REPLACE PROCEDURE procCompletionStudent(sq IN number)
AS
BEGIN
FOR rec IN(
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
WHERE s.student_seq = sq
)
LOOP
dbms_output.put_line('학생명 : ' || rec."학생명");
dbms_output.put_line('과정명 : ' || rec."과정명");
dbms_output.put_line('수료일 : ' || rec."수료일" || '(' || rec."수료여부" || ')');
END LOOP;
END procCompletionStudent;
3. 특정 교육생의 취업 정보 조회
CREATE OR REPLACE PROCEDURE procStudentHireInfo(sq IN number)
AS
BEGIN
 FOR rec IN(
 SELECT 
 s.STUDENT_SEQ AS "학생번호",
 s.studentName AS "학생명",
 cname.courseName AS "과정명",
 cs.courseStatus AS "과정진행상태",
 cr.completedate AS "수료일",
 cn.certifyName AS "자격증",
 we.workSpace AS "이전 근무처",
 we.workStartDate AS "근무 시작일",
 we.worrEndDate AS "근무 종료일",
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
 LEFT JOIN tblCertify cf ON s.student_seq = cf.student_seq
 LEFT JOIN tblCertifyName cn ON cn.certifyName_seq = cf.ceritifyName_seq
 LEFT JOIN tblWorkExperienceRel wer ON s.student_seq = wer.student_seq
 LEFT JOIN tblWorkExperience we ON we.workExperience_seq = wer.workExperience_seq
 INNER JOIN tblEmployment em ON s.student_seq = em.student_seq
 INNER JOIN tblHopeDuty hd ON s.student_seq = hd.student_seq
 INNER JOIN tblHopeAreaRel har ON hd.hopeDuty_seq = har.hopeDuty_seq
 INNER JOIN tblHopeArea ha ON ha.hopeArea_seq = har.hopeArea_seq
 WHERE s.student_seq = sq
 )
 LOOP
 dbms_output.put_line('학생명 : ' || rec."학생명");
 dbms_output.put_line('과정명 : ' || rec."과정명" || ' > ' || rec."과정진행상태" || ' (수료일 : ' || rec."수료일" || ')');
 dbms_output.put_line('자격증 : ' || rec."자격증");
 DBMS_OUTPUT.PUT_LINE('이전 근무처 : ' || rec."이전 근무처" || ' 근무 시작일 : ' || TO_CHAR(rec."근무 시작일", 'RRRR/MM/DD') || ' 근무
종료일 : ' || TO_CHAR(rec."근무 종료일", 'RRRR/MM/DD'));
 DBMS_OUTPUT.PUT_LINE('취업기업명 : ' || rec."취업기업명" || ' 취업일 : ' || TO_CHAR(rec."취업일", 'RRRR/MM/DD'));
 dbms_output.put_line('취업 희망 분야 : ' || rec."취업 희망 분야" || ' 희망지역 : ' || rec."희망지역" || ' 희망급여 : ' || rec."희망급여"); 
 DBMS_OUTPUT.PUT_LINE('——————————————————————');
 END LOOP;
END procStudentHireInfo;

1. 특정 과정 선택시 해당 과정에 등록된 교육생 목록 조회[설문조사]
create or replace procedure procstudentinfo(pc in number) 
as
begin
 for rec in (
select
 c.course_seq as 과정번호,
 c.courseStartDate as 과정시작일,
 cs.completeState as 수료상태,
 cn.coursename as 과정이름,
 sv.surveydate as 설문완료날짜,
 s.student_seq as 교육생번호,
 s.studentName as 교육생이름,
 s.studentPw as 교육생비밀번호,
 s.studentTel as 교육생전화번호,
 svf.surveyfile as 설문조사파일
from tblStudent s
 inner join tblCourseReg cr
 on s.student_seq = cr.student_seq
 inner join tblCourse c
 on cr.course_seq = c.course_seq
 inner join tblcoursename cn
 on c.courseName_seq = cn.coursename_seq
 inner join tblCompleteState cs
 on cr.completeState_seq = cs.completeState_seq
 inner join tblSurvey sv
 on s.student_seq = sv.student_seq
 inner join tblsurveyfile svf
 on sv.surveyFile_seq = svf.surveyFile_seq
 where c.course_seq = pc -- 과정번호
 
 ) 
 loop
 dbms_output.put_line(rec.과정이름 || ' ' ||'설문조사 현황');
 dbms_output.put_line('교육생번호: ' || rec.교육생번호);
 dbms_output.put_line('교육생이름: ' || rec.교육생이름);
 dbms_output.put_line('교육생전화번호: ' || rec.교육생전화번호);
 dbms_output.put_line('설문조사파일: ' || rec.설문조사파일);
 dbms_output.put_line('설문완료날짜: ' || rec.설문완료날짜 || chr(10) || chr(10));
 end loop;
end procstudentinfo;
--프로시저 출력
begin
 procstudentinfo(12);
end;
--------------------------------------------------------------------------------
2. 특정 교육생 설문조사 현황 조회
create or replace procedure procStudentsurveyInfo(pss in number, psn in varchar2)
as
begin
for rec in (
select
 s.student_seq as 교육생번호,
 s.studentname as 교육생이름,
 s.studenttel as 교육생전화번호,
 sv.surveyDate as 설문완료날짜,
 svf.surveyfile as 설문조사파일,
 sj.subject as 과목명
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
 on sa.subject_seq = sj.subject_seq
 where s.student_seq = pss
 and s.studentname = psn
 ) 
 loop
 
 dbms_output.put_line(rec.교육생이름 || ' ' ||'설문조사 현황');
 dbms_output.put_line('교육생번호: ' || rec.교육생번호);
 dbms_output.put_line('교육생이름: ' || rec.교육생이름);
 dbms_output.put_line('교육생전화번호: ' || rec.교육생전화번호);
 dbms_output.put_line('설문조사파일: ' || rec.설문조사파일);
 dbms_output.put_line('설문완료날짜: ' || rec.설문완료날짜 || chr(10) || chr(10));
 
 end loop;
end procStudentsurveyInfo;
--프로시저 출력
begin
 procStudentsurveyInfo(337, '정수원');
end;

1. 특정 과정 선택시 해당 과정에 등록된 교육생 목록 조회[진단평가]
create or replace procedure procStudentEvalInfo(pc in number) 
as
begin
 for rec in (
select
 c.course_seq as 과정번호,
 c.courseStartDate as 과정시작일,
 cs.completeState as 수료상태,
 cn.coursename as 과정이름,
 ea.evaluateDate as 평가완료날짜,
 s.student_seq as 교육생번호,
 s.studentName as 교육생이름,
 s.studentPw as 교육생비밀번호,
 s.studentTel as 교육생전화번호,
 eaf.evaluatefile as 평일가파일
from tblStudent s
 inner join tblCourseReg cr
 on s.student_seq = cr.student_seq
 inner join tblCourse c
 on cr.course_seq = c.course_seq
 inner join tblcoursename cn
 on c.courseName_seq = cn.coursename_seq
 inner join tblCompleteState cs
 on cr.completeState_seq = cs.completeState_seq
 inner join tblEvaluate ea
 on s.student_seq = ea.student_seq
 inner join tblEvaluateFile eaf
 on ea.evaluateFile_seq = eaf.evaluateFile_seq
 where c.course_seq = pc -- 과정번호
 
 ) 
 loop
 dbms_output.put_line(rec.과정이름 || ' ' ||'진단평가 현황');
 dbms_output.put_line('교육생번호: ' || rec.교육생번호);
 dbms_output.put_line('교육생이름: ' || rec.교육생이름);
 dbms_output.put_line('교육생전화번호: ' || rec.교육생전화번호);
 dbms_output.put_line('평일가파일: ' || rec.평일가파일);
 dbms_output.put_line('평가완료날짜: ' || rec.평가완료날짜 || chr(10) || chr(10));
 end loop;
end procStudentEvalInfo;
--프로시저 출력
begin
 procStudentEvalInfo(14);
end;
--------------------------------------------------------------------------------
2. 특정 교육생 진단평가 현황 조회
create or replace procedure procEvaluateinfo(pss in number, psn in varchar2)
as
begin
 for rec in(
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
 on sa.subject_seq = sj.subject_seq
 where s.student_seq = pss
 and s.studentname = psn
 )
 
 loop
 dbms_output.put_line(rec.교육생이름 || ' ' ||'진단평가 현황');
 dbms_output.put_line('교육생번호: ' || rec.교육생번호);
 dbms_output.put_line('교육생이름: ' || rec.교육생이름);
 dbms_output.put_line('교육생전화번호: ' || rec.교육생전화번호);
 dbms_output.put_line('과목명: ' || rec.과목명);
 dbms_output.put_line('평가완료날짜: ' || rec.평가완료날짜 || chr(10) || chr(10));
 end loop;
 
end procEvaluateinfo;
begin
 procEvaluateinfo(337, '정수원');
end;

1. 자신이 진행중인 과정의 학습 안내서 조회
CREATE OR REPLACE PROCEDURE procStudyGuide(pts IN NUMBER, ptn in varchar2)
AS
BEGIN
 FOR rec IN (
 SELECT
 t.teacher_seq AS 강사번호,
 t.teacherName AS 강사명,
 cn.coursename AS 과정명,
 cst.courseStatus AS 과정진행상태,
 sgf.studyGuideFile AS 학습안내서파일
 FROM tblTeacher t
 INNER JOIN tblSubjectAvailability sa 
 ON t.teacher_seq = sa.teacher_seq
 INNER JOIN tblCourseSubject cs 
 ON sa.subjectAvailability_seq = cs.subjectAvailability_seq
 INNER JOIN tblCourse c 
 ON cs.course_seq = c.course_seq
 INNER JOIN tblStudyGuide sg 
 ON c.course_seq = sg.course_seq
 INNER JOIN tblStudyGuideFile sgf 
 ON sg.studyGuideFile_seq = sgf.studyGuideFile_seq
 INNER JOIN tblCourseStatus cst 
 ON c.courseStatus_seq = cst.courseStatus_seq
 INNER JOIN tblCourseName cn 
 ON c.courseName_seq = cn.courseName_seq
 WHERE t.teacher_seq = pts
 and t.teachername = ptn
 AND cst.courseStatus = '강의 중'
 )
 LOOP
 dbms_output.put_line(rec.강사명 || ' ' || '진행 중인 과정 학습안내서');
 dbms_output.put_line('강사번호: ' || rec.강사번호);
 dbms_output.put_line('강사명: ' || rec.강사명);
 dbms_output.put_line('과정명: ' || rec.과정명);
 dbms_output.put_line('과정진행상태: ' || rec.과정진행상태);
 dbms_output.put_line('학습안내서파일: ' || rec.학습안내서파일 || CHR(10) || CHR(10));
 END LOOP;
END procStudyGuide;
-- 프로시저 출력
begin
 procStudyGuide(4, '이승만');
end;
--------------------------------------------------------------------------------
1-2. 모든 학습안내서 조회
CREATE OR REPLACE PROCEDURE procAllStudyGuide(pts IN NUMBER, ptn in varchar2)
AS
BEGIN
 FOR rec IN (
 SELECT
 t.teacher_seq AS 강사번호,
 t.teacherName AS 강사명,
 cn.coursename AS 과정명,
 cst.courseStatus AS 과정진행상태,
 sgf.studyGuideFile AS 학습안내서파일
 FROM tblTeacher t
 INNER JOIN tblSubjectAvailability sa 
 ON t.teacher_seq = sa.teacher_seq
 INNER JOIN tblCourseSubject cs 
 ON sa.subjectAvailability_seq = cs.subjectAvailability_seq
 INNER JOIN tblCourse c 
 ON cs.course_seq = c.course_seq
 INNER JOIN tblStudyGuide sg 
 ON c.course_seq = sg.course_seq
 INNER JOIN tblStudyGuideFile sgf 
 ON sg.studyGuideFile_seq = sgf.studyGuideFile_seq
 INNER JOIN tblCourseStatus cst 
 ON c.courseStatus_seq = cst.courseStatus_seq
 INNER JOIN tblCourseName cn
 on c.courseName_seq = cn.courseName_seq
 WHERE t.teacher_seq = pts
 and t.teachername = ptn
 )
 LOOP
 dbms_output.put_line(rec.강사명 || ' ' || '학습안내서');
 dbms_output.put_line('강사번호: ' || rec.강사번호);
 dbms_output.put_line('강사명: ' || rec.강사명);
 dbms_output.put_line('과정명: ' || rec.과정명);
 dbms_output.put_line('과정진행상태: ' || rec.과정진행상태);
 dbms_output.put_line('학습안내서파일: ' || rec.학습안내서파일 || CHR(10) || CHR(10));
 END LOOP;
END procAllStudyGuide;
--프로시저 출력
begin
 procAllStudyGuide(2, '곽재우');
end;
--------------------------------------------------------------------------------
2. 자신이 진행중인 과정의 학습 안내서 등록
CREATE OR REPLACE PROCEDURE procStudyGuide(pfn IN VARCHAR2, pCourseSeq IN NUMBER)
AS
BEGIN
 DECLARE
 vsgfs NUMBER;
 vseq NUMBER;
 vfseq number;
 BEGIN
 SELECT MAX(studyGuideFile_seq) + 1 INTO vsgfs FROM tblStudyGuideFile;
 INSERT INTO tblStudyGuideFile (studyGuideFile_seq, studyGuideFile)
 VALUES (vsgfs, pfn);
 
 SELECT MAX(studyGuide_seq) + 1 INTO vSeq FROM tblStudyGuide;
 SELECT MAX(studyGuideFile_seq) into vFseq FROM tblStudyGuideFile;
 
 INSERT INTO tblStudyGuide (studyGuide_seq, course_seq, studyGuideFile_seq) 
 VALUES (vseq, pCourseSeq, vfseq); 
 COMMIT;
 
 dbms_output.put_line('학습안내서 등록 완료');
 EXCEPTION
 WHEN OTHERS THEN
 dbms_output.put_line('오류 발생: ' || SQLERRM);
 ROLLBACK;
 END;
END procStudyGuide;
-- 프로시저 출력
begin
 procStudyGuide('테스트 안내서 입니다3',2);
end;

-- 과목별 교육생 성적 확인 - 교육생
CREATE OR REPLACE PROCEDURE procStudentScore(pcs in varchar2, pss in number, psn in varchar2)
AS
BEGIN
 FOR rec IN (
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
 where sj.subject = pcs 
 and s.student_seq = pss
 and s.studentname = psn
 )
 LOOP
 dbms_output.put_line(rec.과목명 || ' ' || '성적 조회');
 dbms_output.put_line('교육생번호: ' || rec.교육생번호);
 dbms_output.put_line('교육생이름: ' || rec.교육생이름);
 dbms_output.put_line('과목명: ' || rec.과목명);
 dbms_output.put_line('출결성적: ' || rec.출결성적);
 dbms_output.put_line('필기성적: ' || rec.필기성적);
 dbms_output.put_line('실기성적: ' || rec.실기성적 || CHR(10) || CHR(10));
 END LOOP;
END procStudentScore;
 
begin
 procStudentScore('자바', 1, '박준민');
end;
--------------------------------------------------------------------------------
--교육생 전체과목 성적조회
CREATE OR REPLACE PROCEDURE procStudentScoreAll(pss in number, psn in varchar2)
AS
BEGIN
 FOR rec IN (
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
 where s.student_seq = pss
 and s.studentname = psn
 )
 LOOP
 dbms_output.put_line(rec.과목명 || ' ' || '성적 조회');
 dbms_output.put_line('교육생번호: ' || rec.교육생번호);
 dbms_output.put_line('교육생이름: ' || rec.교육생이름);
 dbms_output.put_line('과목명: ' || rec.과목명);
 dbms_output.put_line('출결성적: ' || rec.출결성적);
 dbms_output.put_line('필기성적: ' || rec.필기성적);
 dbms_output.put_line('실기성적: ' || rec.실기성적 || CHR(10) || CHR(10));
 END LOOP;
END procStudentScoreAll;
-- 프로시저 출력
begin
 procStudentScoreAll(160, '박준민');
end;

1. -출결 등록 - 교육생
CREATE OR REPLACE PROCEDURE procInsertAttend(pStudentSeq IN NUMBER, pAttendStateSeq IN NUMBER)
AS
BEGIN
 DECLARE
 vAttendSeq NUMBER;
 BEGIN
 
 SELECT MAX(attend_seq) + 1 INTO vAttendSeq FROM tblAttend;
 
 
 INSERT INTO tblAttend (attend_seq, student_seq, attendState_seq, attendDate, attendStartTime, attendEndTime) 
 VALUES (vAttendSeq, pStudentSeq, pAttendStateSeq, SYSDATE, TO_CHAR(SYSDATE, 'HH24:MI'), NULL);
 
 commit;
 
 DBMS_OUTPUT.PUT_LINE('새로운 출결 레코드가 등록되었습니다.');
 EXCEPTION
 WHEN OTHERS THEN
 
 DBMS_OUTPUT.PUT_LINE('오류 발생: ' || SQLERRM);
 ROLLBACK;
 END;
END procInsertAttend;
2. 프로시저 출력
begin
 procInsertAttend(376, 1);
end;
--------------------------------------------------------------------------------\
-- 퇴근 등록 - 교육생
CREATE OR REPLACE PROCEDURE procUpdateAttendEndTime(pss IN NUMBER)
AS
BEGIN
 update tblAttend set attendendtime = to_char(sysdate, 'hh24:mi')
 where student_seq = pss and TO_CHAR(attendDate, 'YY/MM/DD') = TO_CHAR(SYSDATE, 'YY/MM/DD');
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('퇴근 시간이 업데이트되었습니다.');
EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('오류 발생: ' || SQLERRM);
 ROLLBACK;
END procUpdateAttendEndTime;
--프로시저 실행
begin
 procUpdateAttendEndTime(376);
end;
--------------------------------------------------------------------------------
3. 모든 일자 출결 조회 - 교육생
CREATE OR REPLACE PROCEDURE procStudentAttendAll(pss in number ,psn in varchar2)
AS
BEGIN
 FOR rec IN (
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
 where s.student_seq = pss
 and s.studentname = psn
 )
 LOOP
 dbms_output.put_line(rec.교육생이름 || ' ' || '출결 조회');
 dbms_output.put_line('교육생번호: ' || rec.교육생번호);
 dbms_output.put_line('교육생이름: ' || rec.교육생이름);
 dbms_output.put_line('출결날짜: ' || rec.출결날짜);
 dbms_output.put_line('출결상태: ' || rec.출결상태);
 dbms_output.put_line('등원시간: ' || rec.등원시간);
 dbms_output.put_line('하원시간: ' || rec.하원시간 || CHR(10) || CHR(10));
 END LOOP;
END procStudentAttendAll;
 
-- 프로시저 출력
begin
 procStudentAttendAll(387, '박준원');
end;
--------------------------------------------------------------------------------
4.지정 날짜 출결 확인 -교육생
CREATE OR REPLACE PROCEDURE procStudentAttendselect(psn in varchar2, pss in number, pad in date default sysdate)
AS
BEGIN
 FOR rec IN (
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
 where s.student_seq = pss 
 and s.studentname = psn
 and attendDate = pad
 )
 LOOP
 dbms_output.put_line(rec.교육생이름 || ' ' || '출결 조회');
 dbms_output.put_line('교육생번호: ' || rec.교육생번호);
 dbms_output.put_line('교육생이름: ' || rec.교육생이름);
 dbms_output.put_line('출결날짜: ' || rec.출결날짜);
 dbms_output.put_line('출결상태: ' || rec.출결상태);
 dbms_output.put_line('등원시간: ' || rec.등원시간);
 dbms_output.put_line('하원시간: ' || rec.하원시간 || CHR(10) || CHR(10));
 END LOOP;
END procStudentAttendselect;
--프로시저 출력
begin
 procStudentAttendselect('정수원', 337, to_date('2023-03-14'));
end;
--------------------------------------------------------------------------------
5. 특정 기간 출결 확인 -교육생
CREATE OR REPLACE PROCEDURE procStudentAttendselectm(pss in number, psn in varchar2, padm IN NUMBER DEFAULT NULL, pady IN 
NUMBER DEFAULT NULL)
AS
BEGIN
 FOR rec IN (
 
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
 where s.student_seq = pss
 and s.studentname = psn
 and extract(month from a.attenddate) = padm
 and extract(year from a.attenddate) = pady
 )
 LOOP
 dbms_output.put_line(rec.교육생이름 || ' ' || '출결 조회');
 dbms_output.put_line('교육생번호: ' || rec.교육생번호);
 dbms_output.put_line('교육생이름: ' || rec.교육생이름);
 dbms_output.put_line('출결날짜: ' || rec.출결날짜);
 dbms_output.put_line('출결상태: ' || rec.출결상태);
 dbms_output.put_line('등원시간: ' || rec.등원시간);
 dbms_output.put_line('하원시간: ' || rec.하원시간 || CHR(10) || CHR(10));
 END LOOP;
END procStudentAttendselectm;
--프로시저 출력
begin
 procStudentAttendselectm(337, '정수원', 09, 2023);
end;

1. 본인의 과정 정보
CREATE OR REPLACE PROCEDURE procstudentCourseState(
 studentNum NUMBER
)IS
BEGIN
FOR op IN (SELECT 
 cn2.coursename AS aaa,
 s.studentname AS bbb,
 round(((alls.ats + alls.ws + alls.ps)/3), 2) AS ccc,
 sq.te AS ddd,
 TO_CHAR(c2.coursestartdate, 'yyyy-mm-dd') || ' ~ ' || TO_CHAR(c2.courseenddate, 'yyyy-mm-dd') AS eee,
 cs3.coursestatus AS fff
 FROM tblstudent s
 INNER JOIN tblcoursereg cr ON s.student_seq = cr.student_seq
 INNER JOIN tblcompletestate cs ON cr.completestate_seq = cs.completestate_seq
 INNER JOIN tblcourse c2 ON c2.course_seq = cr.course_seq
 INNER JOIN tblcoursestatus cs3 ON c2.coursestatus_seq = cs3.coursestatus_seq
 INNER JOIN tblcoursename cn2 ON cn2.coursename_seq = c2.coursename_seq
 INNER JOIN (SELECT 
 cs2.course_seq AS co,
 t2.teachername AS te
 FROM tblcoursesubject cs2
 INNER JOIN tblsubjectavailability sa2 ON cs2.subjectavailability_seq = sa2.subjectavailability_seq
 INNER JOIN tblteacher t2 ON sa2.teacher_seq = t2.teacher_seq
 GROUP BY cs2.course_seq, t2.teachername
 ORDER BY cs2.course_seq
 ) sq ON sq.co = c2.course_seq
 INNER JOIN (SELECT
 alls.student_seq,
 AVG(attendscore) AS ats,
 AVG(wscore) AS ws,
 AVG(pscore) AS ps
 FROM tblallscore alls
 INNER JOIN tblstudent s ON s.student_seq = alls.student_seq
 GROUP BY alls.student_seq) alls ON alls.student_seq = s.student_seq
 WHERE s.student_seq = studentNum
 ORDER BY s.student_seq
 )LOOP
 DBMS_OUTPUT.PUT_LINE('과정명: ' || op.aaa);
 DBMS_OUTPUT.PUT_LINE('교육생 이름: ' || op.bbb);
 DBMS_OUTPUT.PUT_LINE('평균 점수: ' || op.ccc);
 DBMS_OUTPUT.PUT_LINE('강사명: ' || op.ddd);
 DBMS_OUTPUT.PUT_LINE('과정 기간: ' || op.eee);
 DBMS_OUTPUT.PUT_LINE('과정 상태: ' || op.fff);
 END LOOP;
END procstudentCourseState;
BEGIN
 procstudentCourseState(468);
END;
--과정명 뽑기용
CREATE OR REPLACE PROCEDURE procStudentCourseSN(
 studentNum NUMBER
) 
IS
BEGIN
 FOR op IN (
 SELECT 
cn2.coursename AS aaa
FROM tblstudent s
INNER JOIN tblcertify c ON s.student_seq = c.student_seq
INNER JOIN tblcertifyname cn ON c.ceritifyname_seq = cn.certifyname_seq
INNER JOIN tblcoursereg cr ON s.student_seq = cr.student_seq
INNER JOIN tblcourse c2 ON c2.course_seq = cr.course_seq
INNER JOIN tblcoursename cn2 ON cn2.coursename_seq = c2.coursename_seq
WHERE s.student_seq = studentNum
GROUP BY cn2.coursename)
 LOOP
DBMS_OUTPUT.PUT_LINE('과정명: ' || op.aaa);
 END LOOP;
END procStudentCourseSN;
-- 과정명 뽑기용2
CREATE OR REPLACE PROCEDURE procStudentCourse(
 coursenum NUMBER
)IS
BEGIN
FOR op IN (
SELECT 
 c.course_seq AS aaa,
 cn.coursename AS bbb
 FROM tblstudyguide sg
 INNER JOIN tblstudyguidefile sgf ON sg.studyguidefile_seq = sgf.studyguidefile_seq
 INNER JOIN tblcourse c ON c.course_seq = sg.course_seq
 INNER JOIN tblcoursename cn ON cn.coursename_seq = c.coursename_seq
 INNER JOIN (SELECT course_seq AS seq FROM tblcoursereg GROUP BY course_seq) st ON st.seq = c.course_seq
 INNER JOIN (SELECT cs2.course_seq AS co, t2.teachername AS te
 FROM tblcoursesubject cs2
 INNER JOIN tblsubjectavailability sa2 ON cs2.subjectavailability_seq = sa2.subjectavailability_seq
 INNER JOIN tblteacher t2 ON sa2.teacher_seq = t2.teacher_seq
 GROUP BY cs2.course_seq, t2.teachername
 ORDER BY cs2.course_seq) sq ON sq.co = c.course_seq
 WHERE c.course_seq = coursenum
 GROUP BY c.course_seq, cn.coursename)
LOOP
DBMS_OUTPUT.PUT_LINE('과정명: ' || op.bbb);
END LOOP;
END procStudentCourse;
2. 자격증 검색
CREATE OR REPLACE PROCEDURE procFindCertifyStudent(
 studentNum NUMBER
) 
IS
BEGIN
 FOR op IN (SELECT 
 c.STUDENT_SEQ || c.CERITIFYNAME_SEQ AS ddd,
 c.STUDENT_SEQ AS aaa,
 s.studentname AS bbb,
 cn.certifyname AS ccc
 FROM tblstudent s
 INNER JOIN tblcertify c ON s.student_seq = c.student_seq
 INNER JOIN tblcertifyname cn ON c.ceritifyname_seq = cn.certifyname_seq
 INNER JOIN tblcoursereg cr ON s.student_seq = cr.student_seq
 INNER JOIN tblcourse c2 ON c2.course_seq = cr.course_seq
 INNER JOIN tblcoursename cn2 ON cn2.coursename_seq = c2.coursename_seq
 WHERE s.student_seq = studentNum
 ORDER BY s.student_seq) 
 
 LOOP
 DBMS_OUTPUT.PUT_LINE('관리 코드: ' || op.ddd || ' | 교육생 이름: ' || op.bbb || ' | 자격증명: ' || op.ccc);
 END LOOP;
END procFindCertifyStudent;
DECLARE
studentNum NUMBER := 468;
BEGIN
procStudentCourseSN(studentNum);
 DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------');
 procFindCertifyStudent(studentNum);
END;
2-2. 자격증 수정
CREATE OR REPLACE PROCEDURE procStudentCertifyUpdate(
 code varchar2,
 certifycode varchar2
) IS
BEGIN
 UPDATE tblcertify SET ceritifyname_seq = (SELECT CERTIFYNAME_SEQ FROM TBLCERTIFYNAME WHERE CERTIFYNAME = certifycode) 
WHERE STUDENT_SEQ || CERITIFYNAME_SEQ = code;
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('변경되었습니다.');
EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('잘못된 데이터입니다.');
END procStudentCertifyUpdate;
BEGIN
 procStudentCertifyUpdate('4682', '네트워크관리사2급'); --(관리코드, 자격증명)
END;
3. 경력사항
CREATE OR REPLACE PROCEDURE procStudentWorkExperience(
 studentNum NUMBER
) 
IS
BEGIN
 FOR op IN (SELECT
 we.WORKEXPERIENCE_SEQ AS aaa,
 s.studentname AS bbb,
 we.workspace AS ccc,
 TO_CHAR(we.workstartdate, 'yyyy-mm-dd') || ' ~ ' || TO_CHAR(we.worrenddate, 'yyyy-mm-dd') AS ddd,
 we.worktask AS eee
 FROM tblstudent s
 INNER JOIN tblWorkExperienceRel wer ON wer.student_seq = s.student_seq
 INNER JOIN tblWorkExperience we ON we.workexperience_seq = wer.workexperience_seq
 INNER JOIN tblcoursereg cr ON s.student_seq = cr.student_seq
 INNER JOIN tblcourse c2 ON c2.course_seq = cr.course_seq
 INNER JOIN tblcoursename cn2 ON cn2.coursename_seq = c2.coursename_seq
 WHERE s.student_seq = studentNum
 ORDER BY s.student_seq
 ) LOOP
 DBMS_OUTPUT.PUT_LINE('관리 코드: ' || op.aaa ||' | 교육생 이름: ' || op.bbb||' | 회사명: ' || op.ccc||' | 근무 기간: ' || op.ddd||' | 
담당업무: ' || op.eee);
 END LOOP;
END procStudentWorkExperience;
DECLARE
studentNum NUMBER := 468;
BEGIN
procStudentCourseSN(studentNum);
DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------');
 procStudentWorkExperience(studentNum);
END;
3-2. 경력사항 수정
CREATE OR REPLACE PROCEDURE procStudentWorkExper(
 code NUMBER,
updatename varchar2,
updatedate varchar2
) IS
BEGIN
 CASE updatename
 WHEN '회사명' THEN
 UPDATE tblworkexperience SET WORKSPACE = updatedate WHERE WORKEXPERIENCE_SEQ = code;
 WHEN '입사일자' THEN
 UPDATE tblworkexperience SET WORKSTARTDATE = TO_DATE(updatedate, 'yyyy-mm-dd') WHERE WORKEXPERIENCE_SEQ = 
code;
 WHEN '퇴사일자' THEN
 UPDATE tblworkexperience SET WORRENDDATE = TO_DATE(updatedate, 'yyyy-mm-dd') WHERE WORKEXPERIENCE_SEQ = 
code;
 WHEN '담당업무' THEN
 UPDATE tblworkexperience SET WORKTASK = updatedate WHERE WORKEXPERIENCE_SEQ = code;
 END CASE;
 COMMIT;
DBMS_OUTPUT.PUT_LINE('변경되었습니다.');
EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('잘못된 데이터입니다.');
END procStudentWorkExper;
BEGIN
 procStudentWorkExper(44, '회사명', '쌍용교육센터'); -- (관리코드, 바꿀컬럼(회사명,입사일자,퇴사일자,담당업무), 값)
END;
4. 희망 근무 조건
CREATE OR REPLACE PROCEDURE procStudentHopeDuty(
 studentNum NUMBER
) 
IS
BEGIN
 FOR op IN (SELECT 
 cn2.coursename AS aaa,
 s.studentname AS bbb,
 hd.hopedutyfield AS ccc,
 ha.hopearea AS ddd,
 hd.hopesalary AS eee
 FROM tblstudent s
 INNER JOIN tblcoursereg cr ON s.student_seq = cr.student_seq
 INNER JOIN tblcourse c2 ON c2.course_seq = cr.course_seq
 INNER JOIN tblcoursename cn2 ON cn2.coursename_seq = c2.coursename_seq
 INNER JOIN tblHopeDuty hd ON hd.student_seq = s.student_seq
 INNER JOIN tblHopeAreaRel har ON har.hopeduty_seq = hd.hopeduty_seq
 INNER JOIN tblhopearea ha ON ha.hopearea_seq = har.hopearea_seq
 WHERE s.student_seq = studentNum
 ORDER BY s.student_seq
 ) LOOP
 DBMS_OUTPUT.PUT_LINE('과정명: ' || op.aaa);
 DBMS_OUTPUT.PUT_LINE('교육생 이름: ' || op.bbb);
 DBMS_OUTPUT.PUT_LINE('희망분야: ' || op.ccc);
 DBMS_OUTPUT.PUT_LINE('희망지역: ' || op.ddd);
 DBMS_OUTPUT.PUT_LINE('희망급여: ' || op.eee);
 END LOOP;
END procStudentHopeDuty;
BEGIN
 procStudentHopeDuty(468);
END;
4-2. 희망근무 조건 수정
CREATE OR REPLACE PROCEDURE procStudentHope(
 code NUMBER,
updatename varchar2,
updatedate varchar2
) IS
BEGIN
 CASE updatename
 WHEN '희망분야' THEN
 UPDATE TBLHOPEDUTY SET HOPEDUTYFIELD = updatedate WHERE HOPEDUTY_SEQ = code;
 WHEN '희망지역' THEN
 UPDATE TBLHOPEAREAREL SET HOPEAREA_SEQ = (SELECT HOPEAREA_SEQ FROM TBLHOPEAREA WHERE HOPEAREA = 
updatedate) WHERE HOPEDUTY_SEQ = code;
 WHEN '희망급여' THEN
 UPDATE TBLHOPEDUTY SET HOPESALARY = TO_NUMBER(updatedate) WHERE HOPEDUTY_SEQ = code;
 END CASE;
 COMMIT;
DBMS_OUTPUT.PUT_LINE('변경되었습니다.');
EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('잘못된 데이터입니다.');
END procStudentHope;
DECLARE
 p_code NUMBER := 468; -- 학생코드
 p_updatename VARCHAR2(100) := '희망분야'; --바꾸고싶은 컬럼
 p_updatedate VARCHAR2(100) := '백엔드 개발자'; --바꿀내용
BEGIN
 procStudentHope(p_code, p_updatename, p_updatedate);
END;
5. 취업 현황
CREATE OR REPLACE PROCEDURE procStudentEmployment(
 studentNum NUMBER
) IS
BEGIN
 FOR op IN (SELECT 
cn2.coursename AS aaa,
s.studentname AS bbb,
e.companyname AS ccc,
e.insurance AS ddd,
to_char(e.hiredate, 'yyyy-mm-dd') AS eee,
cs.completestate AS fff,
to_char(cr.completedate, 'yyyy-mm-dd') AS ggg
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
WHERE s.student_seq = studentNum
ORDER BY s.student_seq
 ) LOOP
 DBMS_OUTPUT.PUT_LINE('과정명: ' || op.aaa);
 DBMS_OUTPUT.PUT_LINE('교육생 이름: ' || op.bbb);
 DBMS_OUTPUT.PUT_LINE('기업명: ' || op.ccc);
 DBMS_OUTPUT.PUT_LINE('고용보험: ' || op.ddd);
 DBMS_OUTPUT.PUT_LINE('취업일: ' || op.eee);
 DBMS_OUTPUT.PUT_LINE('수료상태: ' || op.fff);
 DBMS_OUTPUT.PUT_LINE('수료일: ' || op.ggg);
 DBMS_OUTPUT.PUT_LINE(' '); 
 END LOOP;
END procStudentEmployment;
BEGIN
 procStudentEmployment(204);
END;
5-2. 취업 현황 수정
CREATE OR REPLACE PROCEDURE procStudentEmploymentUpdate(
 code NUMBER,
 updatename VARCHAR2,
 updatedate VARCHAR2
) IS
BEGIN
 CASE updatename
 WHEN '기업명' THEN
 UPDATE tblemployment SET COMPANYNAME = updatedate WHERE EMPLOYMENT_SEQ = code;
 WHEN '고용보험' THEN
 UPDATE tblemployment SET INSURANCE = updatedate WHERE EMPLOYMENT_SEQ = code;
 WHEN '취업일' THEN
 IF updatedate = 'null' THEN
 UPDATE tblemployment SET HIREDATE = null WHERE EMPLOYMENT_SEQ = code;
 ELSE
 UPDATE tblemployment SET HIREDATE = TO_DATE(updatedate, 'yyyy-mm-dd') WHERE EMPLOYMENT_SEQ = code;
 END IF;
 END CASE;
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('변경되었습니다.');
EXCEPTION
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('잘못된 데이터입니다.');
END procStudentEmploymentUpdate;
DECLARE
 p_code NUMBER := 204; --학생코드
 p_updatename VARCHAR2(100) := '고용보험'; -- 바꿀 컬럼
 p_updatedate VARCHAR2(100) := '무'; -- 변경될 값
BEGIN
 procStudentEmploymentUpdate(p_code, p_updatename, p_updatedate);
END;

1. 컴퓨터 이상 보고(등록)
CREATE OR REPLACE PROCEDURE procStudentComManageInsert(
proom NUMBER,
pcomn NUMBER,
pcoms NUMBER
)
AS 
BEGIN
INSERT INTO tblcommanage (COMMANAGE_SEQ , comendrepair, comstate_seq, commanagedate, comnum, room_seq) 
VALUES ((SELECT MAX(commanage_seq) + 1 FROM tblcommanage), NULL, pcoms, SYSDATE, pcomn, proom);
COMMIT;
 DBMS_OUTPUT.PUT_LINE('등록되었습니다.');
EXCEPTION
WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('잘못된 데이터입니다.');
END procStudentComManageInsert;
DECLARE
proom NUMBER := 5; -- 강의실 번호
pcomn NUMBER := 32; -- 컴퓨터 번호
pcoms NUMBER := 2; -- 컴퓨터 상태 번호
BEGIN
 procStudentComManageInsert(proom, pcomn, pcoms);
END;
2. 컴퓨터 이상 목록 조회
CREATE OR REPLACE PROCEDURE procStudentComManage(
 studentNum NUMBER,
 studentComNum NUMBER
) IS
BEGIN
 FOR op IN ( SELECT 
 c.commanage_seq AS aaa,
 cs.comstate AS bbb,
 TO_CHAR(c.commanagedate, 'yyyy-mm-dd') AS ccc,
 CASE 
 WHEN c.comendrepair IS NOT NULL THEN '수리 완료'
 WHEN c.comendrepair IS NULL THEN '수리 진행중'
 END AS ddd,
 c.room_seq AS eee,
 c.comnum AS fff,
 cn.coursename AS ggg,
 cs2.coursestatus AS hhh
 FROM tblcommanage c
 INNER JOIN tblcomstate cs ON c.comstate_seq = cs.comstate_seq
 INNER JOIN tblcourseroom cr ON cr.room_seq = c.room_seq
 INNER JOIN tblcourse course ON course.room_seq = cr.room_seq
 INNER JOIN tblcoursename cn ON cn.coursename_seq = course.coursename_seq
 INNER JOIN tblcoursestatus cs2 ON cs2.coursestatus_seq = course.coursestatus_seq
 INNER JOIN tblcoursereg cr2 ON cr2.course_seq = course.course_seq
 INNER JOIN tblstudent st ON st.student_seq = cr2.student_seq
 WHERE st.student_seq = studentNum AND c.comnum = studentComNum
 ORDER BY c.commanage_seq
 ) 
 LOOP
 DBMS_OUTPUT.PUT_LINE('관리 번호: ' || op.aaa || ' | 강의실 번호: ' || op.eee || ' | 컴퓨터 번호: ' || op.fff || ' | 이상증세: ' || op.bbb || ' 
| 수리신청 시간: ' || op.ccc || ' | 수리완료여부: ' || op.ddd);
 
 END LOOP;
END procStudentComManage;
DECLARE
 studentNum NUMBER := 468;
 comNum NUMBER := 32;
BEGIN
 procStudentCourseSN(studentNum);
DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------');
 procStudentComManage(studentNum, comNum);
END;

1. 자신이 진행중인 설문조사 목록 조회
CREATE OR REPLACE PROCEDURE procStudentSurvey(
 studentNum NUMBER
) IS
BEGIN
 FOR op IN (
 SELECT 
 s.survey_seq AS aaa,
 s2.subject AS bbb,
 TO_CHAR(cs.coursesubjectstartdate, 'yyyy-mm-dd') || ' ~ ' || TO_CHAR(cs.cousesubjectenddate, 'yyyy-mm-dd') AS ccc,
 sf.surveyfile || '.docs' AS ddd,
 CASE 
 WHEN s.surveydate IS NOT NULL THEN '완료'
 WHEN s.surveydate IS NULL THEN '미완료'
 END AS eee,
 s.surveydate AS fff
 FROM tblSurvey s
 INNER JOIN tblsurveyfile sf ON s.surveyfile_seq = sf.surveyfile_seq
 INNER JOIN tblstudent st ON st.student_seq = s.student_seq
 INNER JOIN tblcoursesubject cs ON cs.coursesubject_seq = s.coursesubject_seq
 INNER JOIN tblsubjectavailability sa ON sa.subjectavailability_seq = cs.subjectavailability_seq
 INNER JOIN tblsubject s2 ON s2.subject_seq = sa.subject_seq
 WHERE st.student_seq = studentNum
 ORDER BY s.survey_seq
 ) LOOP
 DBMS_OUTPUT.PUT_LINE('관리번호: ' || op.aaa||' | 과목명: ' || op.bbb||' | 과목 기간: ' || op.ccc||' | 설문조사 파일명: ' || op.ddd||' | 
완료여부: ' || op.eee||' | 완료 날짜: ' || op.fff);
 END LOOP;
END procStudentSurvey;
BEGIN
 procStudentSurvey(468);
END;
2. 설문조사 완료
CREATE OR REPLACE PROCEDURE procStudentUpdateSurvey(
 p_survey_seq NUMBER
) IS
BEGIN
 UPDATE TBLSURVEY 
 SET SURVEYDATE = SYSDATE
 WHERE survey_seq = p_survey_seq;
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('설문조사가 완료되었습니다.');
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('해당 관리번호는 존재하지않습니다.');
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('오류 발생');
END procStudentUpdateSurvey;
BEGIN
 procStudentUpdateSurvey(1280);
END; 

1. 사전 진단평가
CREATE OR REPLACE PROCEDURE procStudentEvaluate(
 studentNum NUMBER
) IS
BEGIN
 FOR op IN (
 SELECT 
 e.evaulate_seq AS aaa,
 cn.coursename AS bbb,
 TO_CHAR(c.coursestartdate, 'yyyy-mm-dd') || ' ~ ' || TO_CHAR(c.courseenddate, 'yyyy-mm-dd') AS ccc,
 ef.evaluatefile AS ddd,
 CASE 
 WHEN e.evaluatedate IS NOT NULL THEN '완료'
 WHEN e.evaluatedate IS NULL THEN '미완료'
 END AS eee,
 e.evaluatedate AS fff
 FROM tblevaluate e
 INNER JOIN tblevaluatefile ef ON e.evaluatefile_seq = ef.evaluatefile_seq
 INNER JOIN tblstudent st ON st.student_seq = e.student_seq
 INNER JOIN tblcoursesubject cs ON cs.coursesubject_seq = e.coursesubject_seq
 INNER JOIN tblsubjectavailability sa ON sa.subjectavailability_seq = cs.subjectavailability_seq
 INNER JOIN tblsubject s2 ON s2.subject_seq = sa.subject_seq
 INNER JOIN tblcourse c ON cs.course_seq = c.course_seq 
 INNER JOIN tblcoursename cn ON cn.coursename_seq = c.coursename_seq
 WHERE st.student_seq = studentNum
 ORDER BY e.evaulate_seq
 ) LOOP
 DBMS_OUTPUT.PUT_LINE('파일번호: ' || op.aaa ||' | 진단평가 파일명: ' || op.ddd||' | 완료여부: ' || op.eee||' | 완료 날짜: ' || op.fff);
 END LOOP;
END procStudentEvaluate;
DECLARE
studentnum NUMBER := 468;
BEGIN
 procStudentCourseSN(studentNum);
DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------');
 procStudentEvaluate(studentnum);
END;
2. 사전 진단평가 완료
CREATE OR REPLACE PROCEDURE procStudentUpdateEvaluate(
 p_evaluate_seq NUMBER
) IS
BEGIN
 UPDATE tblevaluate
 SET evaluatedate = SYSDATE
 WHERE evaulate_seq = p_evaluate_seq;
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('진단평가 완료되었습니다.');
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('해당 관리코드는 존재하지 않습니다.');
 WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE('오류 발생');
END procStudentUpdateEvaluate;
BEGIN
 procStudentUpdateEvaluate(1176);
END;

1. 학습안내서 조회
CREATE OR REPLACE PROCEDURE procStudentStudyGuide(
 studentNum NUMBER
) IS
BEGIN
 FOR op IN (
 SELECT 
 c.course_seq AS aaa,
 cn.coursename AS bbb,
 TO_CHAR(c.coursestartdate, 'yyyy-mm-dd') || ' ~ ' || TO_CHAR(c.courseenddate, 'yyyy-mm-dd') AS ccc,
 sq.te AS ddd,
 sgf.studyguidefile_seq AS eee,
 sgf.studyguidefile AS fff
 FROM tblstudyguide sg
 INNER JOIN tblstudyguidefile sgf ON sg.studyguidefile_seq = sgf.studyguidefile_seq
 INNER JOIN tblcourse c ON c.course_seq = sg.course_seq
 INNER JOIN tblcoursename cn ON cn.coursename_seq = c.coursename_seq
 INNER JOIN (SELECT course_seq AS seq FROM tblcoursereg GROUP BY course_seq) st ON st.seq = c.course_seq
 INNER JOIN (SELECT cs2.course_seq AS co, t2.teachername AS te
 FROM tblcoursesubject cs2
 INNER JOIN tblsubjectavailability sa2 ON cs2.subjectavailability_seq = sa2.subjectavailability_seq
 INNER JOIN tblteacher t2 ON sa2.teacher_seq = t2.teacher_seq
 GROUP BY cs2.course_seq, t2.teachername
 ORDER BY cs2.course_seq) sq ON sq.co = c.course_seq
 WHERE c.course_seq = studentNum
 ) LOOP
 DBMS_OUTPUT.PUT_LINE('과정 기간: ' || op.ccc || ' | 강사명: ' || op.ddd || ' | 학습안내서 파일번호: ' || op.eee ||' | 학습안내서 파일명: 
' || op.fff);
 END LOOP;
END procStudentStudyGuide;
DECLARE
coursenum NUMBER := 1; -- 과정번호
BEGIN
procStudentCourse(coursenum);
 DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------');
 procStudentStudyGuide(coursenum);
END;

-- 수강상태 조회
CREATE OR REPLACE PROCEDURE procStudentCourseReg(
 studnetNum NUMBER
) IS
BEGIN
 FOR op IN (
 SELECT 
 cn.coursename AS aaa,
 TO_CHAR(c.coursestartdate, 'yyyy-mm-dd') || ' ~ ' || TO_CHAR(c.courseenddate, 'yyyy-mm-dd') AS bbb,
 cs.completestate AS ccc,
 TO_CHAR(cr.completedate, 'yyyy-mm-dd') AS ddd,
 s.studentname AS eee,
 ROUND(((alls.ats + alls.ws + alls.ps) / 3), 2) AS fff
 FROM tblcoursereg cr
 INNER JOIN tblcourse c ON cr.course_seq = c.course_seq
 INNER JOIN tblcompletestate cs ON cs.completestate_seq = cr.completestate_seq
 INNER JOIN tblcoursename cn ON cn.coursename_seq = c.coursename_seq
 INNER JOIN tblstudent s ON s.student_seq = cr.student_seq
 INNER JOIN (
 SELECT alls.student_seq, AVG(attendscore) AS ats, AVG(wscore) AS ws, AVG(pscore) AS ps
 FROM tblallscore alls
 INNER JOIN tblstudent s ON s.student_seq = alls.student_seq
 GROUP BY alls.student_seq
 ) alls ON alls.student_seq = s.student_seq
 WHERE s.student_seq = studnetNum
 ) LOOP
 DBMS_OUTPUT.PUT_LINE('과목명: ' || op.aaa);
 DBMS_OUTPUT.PUT_LINE('과정 기간: ' || op.bbb);
 DBMS_OUTPUT.PUT_LINE('수료상태: ' || op.ccc);
 DBMS_OUTPUT.PUT_LINE('수료일: ' || op.ddd);
 DBMS_OUTPUT.PUT_LINE('수강자명: ' || op.eee);
 DBMS_OUTPUT.PUT_LINE('평균 점수: ' || op.fff);
 DBMS_OUTPUT.PUT_LINE(' ');
 END LOOP;
END procStudentCourseReg;
BEGIN
 procStudentCourseReg(468);
END;