CREATE TABLE tblAdmin (
admin_seq NUMBER primary key,
adminName VARCHAR(50) NOT NULL,
 adminPw VARCHAR(13) NOT NULL, 
adminTel VARCHAR(30) NOT NULL
);

CREATE TABLE tblStudent (
student_seq NUMBER primary key,
studentName VARCHAR(50) NOT NULL,
 studentPw VARCHAR(13) NOT NULL, 
studentTel VARCHAR(30) NOT NULL
);

CREATE TABLE tblTeacher (
teacher_seq NUMBER primary key,
teacherName VARCHAR(50) NOT NULL,
teacherPw VARCHAR(13) NOT NULL,
teacherTel VARCHAR(30) NOT NULL 
);

CREATE TABLE tblCourseReg (
courseReg_seq NUMBER primary key,
course_seq NUMBER NOT NULL references tblCourse(course_seq), 
student_seq NUMBER NOT NULL references tblStudent(student_seq), 
completeState_seq NUMBER NOT NULL references tblCompleteState(completeState_seq),
completedate DATE NULL
); 

CREATE TABLE tblCompleteState (
completeState_seq NUMBER primary key, 
completeState VARCHAR(255) NOT NULL 
);

CREATE TABLE tblComManage (
comManage_seq NUMBER primary key, 
comEndRepair DATE NULL, 
comState_seq NUMBER NOT NULL references tblComState(comState_seq), 
comManageDate DATE NOT NULL,
comNum NUMBER NOT NULL, 
room_seq NUMBER NOT NULL references tblCourseRoom(room_seq)
);

CREATE TABLE tblComState (
comState_seq NUMBER primary key, 
comState VARCHAR(255) NOT NULL
);

CREATE TABLE tblStudyGuide (
studyGuide_seq NUMBER primary key, 
course_seq NUMBER NOT NULL references tblCourse(course_seq), 
studyGuideFile_seq NUMBER NOT NULL references tblStudyGuideFile(studyGuideFile_seq)
);

CREATE TABLE tblStudyGuideFile (
studyGuideFile_seq NUMBER primary key,
studyGuideFile VARCHAR(255) NOT NULL 
);

CREATE TABLE tblSurvey (
survey_seq number primary key,
surveyFile_seq NUMBER NOT NULL references tblSurveyFile(surveyFile_seq), 
student_seq NUMBER NOT NULL references tblStudent(student_seq), 
courseSubject_seq NUMBER NOT NULL references tblCourseSubject(courseSubject_seq), 
surveyDate DATE NULL
);

CREATE TABLE tblSurveyFile (
surveyFile_seq NUMBER primary key,
surveyFile VARCHAR(255) NOT NULL 
);

CREATE TABLE tblEvaluate (
evaulate_seq NUMBER primary key, 
evaluateFile_seq NUMBER NOT NULL references tblEvaluateFile(evaluateFile_seq), 
student_seq NUMBER NOT NULL references tblStudent(student_seq),
evaluateDate DATE NULL ,
 courseSubject_seq NUMBER NOT NULL references tblCourseSubject(courseSubject_seq) -- 강좌과목 번호
);

CREATE TABLE tblEvaluateFile (
evaluateFile_seq NUMBER primary key, -- 평가파일 번호
evaluateFile VARCHAR(255) NOT NULL -- 평가파일
);

create table tblCourseRoom(
room_seq Number primary key,
population Number NOT NULL,
availability Varchar(255) NOT NULL
);

create table tblCourseStatus(
courseStatus_seq Number primary key,
courseStatus Varchar2(255) NOT NULL
);

create table tblCourseName(
 courseName_seq NUMBER primary key,
 courseName Varchar(255) Not Null
);

create table tblTextbook(
textBook_seq Number Primary key,
textbook Varchar(255) NOT NULL,
publisher Varchar(255) NOT NULL,
author Varchar(255) NOT NULL,
publishDate DATE NOT NULL ,
bookType Varchar(255) NOT NULL 
);

create table tblSubject(
subject_seq Number primary key ,
subject Varchar(50) NOT NULL
);

create table tblCourse(
 course_seq number primary key,
 courseStartDate date not null , 
 courseEndDate DATE not null,
 room_seq NUMBER not null references tblCourseRoom(room_seq), 
 courseStatus_seq number not null references tblCourseStatus(courseStatus_seq),
 courseName_seq number not null references tblCourseName(courseName_seq)
);

create table tblCourseSubject( 
 courseSubject_seq Number Primary key,
subjectAvailability_seq Number NOT NULL references tblSUbjectAvailability(subjectAvailability_seq), 
course_seq Number NOT NULL references tblcourse(course_seq),
courseSubjectStartDate DATE NOT NULL,
couseSubjectEndDate DATE NOT NULL,
textBook_seq Number NOT NULL references tbltextbook(textBook_seq)
);

create table tblSubjectAvailability ( 
 subjectAvailability_seq Number Primary key,
 subject_seq NUMBER NOT NULL references tblSubject (subject_seq),
 teacher_seq NUMBER NOT NULL references tblTeacher (teacher_seq)
);

CREATE TABLE tblAllScore (
 allScore_seq NUMBER PRIMARY KEY,
 pointNum NUMBER NOT NULL references tblPoint (pointNum), 
 student_seq NUMBER NOT NULL references tblStudent (student_seq),
 attendScore NUMBER NULL, 
 wScore NUMBER NULL, 
 pScore NUMBER NULL 
);

CREATE TABLE tblExamScore (
examScore_seq NUMBER PRIMARY KEY, -- 시험 점수 번호
exam_seq NUMBER NOT NULL REFERENCES tblExam(exam_seq), -- 시험지 번호
 student_seq NUMBER NOT NULL REFERENCES tblStudent(student_seq), -- 교육생번호
examScore NUMBER NULL -- 시험점수
);

CREATE TABLE tblExam (
exam_seq NUMBER PRIMARY KEY, -- 시험지 번호
examType VARCHAR(255) NOT NULL, -- 실기/필기
examFile VARCHAR(255) NOT NULL, -- 시험문제파일
courseSubject_seq NUMBER NOT NULL REFERENCES tblCourseSubject(courseSubject_seq), -- 강좌과목 번호
examDate DATE NOT NULL -- 시험날
);

CREATE TABLE tblPoint (
pointNum NUMBER PRIMARY KEY, -- 시험 점수 번호
courseSubject_seq NUMBER NOT NULL REFERENCES tblCourseSubject(courseSubject_seq), --강좌과목 번호
 attendPoint NUMBER NULL, -- 출결배점
wPoint NUMBER NULL, -- 필기배점
pPoint NUMBER NULL -- 실기배점
);

CREATE TABLE tblAttend (
attend_seq NUMBER PRIMARY KEY, -- 출결 번호
student_seq NUMBER NOT NULL REFERENCES tblStudent(student_seq), -- 교육생번호
attendState_seq NUMBER NOT NULL REFERENCES tblAttendState(attendState_seq), -- 출결상태번호
attendDate DATE NOT NULL, -- 출결날짜
attendStartTime DATE NULL,
 attendEndTimeDATE DATE NULL
);

CREATE TABLE tblAttendState (
attendState_seq NUMBER PRIMARY KEY, -- 출결상태번호
attendState VARCHAR(255) NOT NULL -- 출결상태
);

CREATE TABLE tblWorkExperienceRel (
student_seq NUMBER NOT NULL references tblStudent(student_seq),
workExperience_seq NUMBER NOT NULL references tblWorkExperience(workExperience_seq)
);

CREATE TABLE tblWorkExperience (
workExperience_seq NUMBER PRIMARY KEY, 
workSpace VARCHAR(255) NULL, 
workStartDate DATE NULL, 
worrEndDate DATE NULL, 
workTask VARCHAR(255) NULL 
);

CREATE TABLE tblHopeDuty (
hopeDuty_seq NUMBER PRIMARY KEY, 
hopeDutyfield VARCHAR(255) NULL, 
hopeSalary NUMBER NULL, 
student_seq NUMBER NOT NULL references tblStudent(student_seq)
);

CREATE TABLE tblHopeAreaRel (
hopeDuty_seq NUMBER NOT NULL references tblHopeDuty(hopeDuty_seq),
hopeArea_seq NUMBER NOT NULL references tblHopeArea(hopeArea_seq)
);

CREATE TABLE tblHopeArea (
hopeArea_seq NUMBER PRIMARY KEY, 
hopeArea VARCHAR(255) NOT NULL 
);

create table tblCertify( 
 ceritifyName_seq NUMBER NOT NULL references tblCertifyName(certifyName_seq),
 student_seq NUMBER NOT NULL references tblStudent(student_seq)
);

create table tblCertifyName( 
certifyName_seq Number Primary key,
certifyName Varchar(255) NOT NULL
);

create table tblEmployment ( 
employment_seq Number Primary Key,
companyName Varchar(255) NULL,
insurance Varchar(255) NULL,
hireDate Date NULL,
student_seq Number Not Null references tblStudent(student_seq)
);




