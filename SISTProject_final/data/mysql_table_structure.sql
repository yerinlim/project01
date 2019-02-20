-- 교재 정보 테이블
CREATE TABLE SUBJECTBOOK_TB (
	subjectbook_id   VARCHAR(6)   NOT NULL, -- 교재_ID
	subjectbook_name VARCHAR(100) NULL,     -- 교재명
	subjectbook_isbn VARCHAR(13)  NULL      -- ISBN
);

-- 교재 정보 테이블
ALTER TABLE SUBJECTBOOK_TB
	ADD
		CONSTRAINT PK_SUBJECTBOOK_TB -- 교재 정보 테이블 기본키
		PRIMARY KEY (
			subjectbook_id -- 교재_ID
		);

-- 개설 과목 정보 테이블
CREATE TABLE OPEN_SUBJECT_TB (
	open_subject_id    VARCHAR(6) NOT NULL, -- 개설 과목 정보_ID
	subjectbook_id     VARCHAR(6) NULL,     -- 교재_ID
	subject_id         VARCHAR(6) NULL,     -- 과목_ID
	instructor_id      VARCHAR(6) NULL,     -- 강사_ID
	open_course_id     VARCHAR(6) NULL,     -- 개설 과정_ID
	subject_start_date DATETIME   NULL,     -- 과목시작일
	subject_end_date   DATETIME   NULL      -- 과목종료일
);

-- 개설 과목 정보 테이블
ALTER TABLE OPEN_SUBJECT_TB
	ADD
		CONSTRAINT PK_OPEN_SUBJECT_TB -- 개설 과목 정보 테이블 기본키
		PRIMARY KEY (
			open_subject_id -- 개설 과목 정보_ID
		);

-- 과목 정보 테이블
CREATE TABLE SUBJECT_TB (
	subject_id   VARCHAR(6)  NOT NULL, -- 과목_ID
	subject_name VARCHAR(20) NULL      -- 과목명
);

-- 과목 정보 테이블
ALTER TABLE SUBJECT_TB
	ADD
		CONSTRAINT PK_SUBJECT_TB -- 과목 정보 테이블 기본키
		PRIMARY KEY (
			subject_id -- 과목_ID
		);

-- 과목별 배점 정보 테이블
CREATE TABLE SUBJECT_POINT_TB (
	subject_point_id VARCHAR(6) NOT NULL, -- 과목별 배점 정보_ID
	exam_id          VARCHAR(8) NULL,     -- 시험_ID
	attendance_point INTEGER    NULL,     -- 출결배점
	write_point      INTEGER    NULL,     -- 필기배점
	skill_point      INTEGER    NULL      -- 실기배점
);

-- 과목별 배점 정보 테이블
ALTER TABLE SUBJECT_POINT_TB
	ADD
		CONSTRAINT PK_SUBJECT_POINT_TB -- 과목별 배점 정보 테이블 기본키
		PRIMARY KEY (
			subject_point_id -- 과목별 배점 정보_ID
		);

-- 시험 테이블
CREATE TABLE EXAM_TB (
	exam_id         VARCHAR(8)  NOT NULL, -- 시험_ID
	exam_date       DATETIME    NULL,     -- 시험 날짜
	exam_file       VARCHAR(50) NULL,     -- 시험 문제 파일
	open_subject_id VARCHAR(6)  NULL      -- 개설 과목 정보_ID
);

-- 시험 테이블
ALTER TABLE EXAM_TB
	ADD
		CONSTRAINT PK_EXAM_TB -- 시험 테이블 기본키
		PRIMARY KEY (
			exam_id -- 시험_ID
		);

-- 강사 정보 테이블
CREATE TABLE INSTRUCTOR_TB (
	instructor_id      VARCHAR(6)   NOT NULL, -- 강사_ID
	instructor_name    VARCHAR(10)  NULL,     -- 강사 이름
	instructor_phone   VARCHAR(13)  NULL,     -- 강사 전화번호
	instructor_regDate DATETIME     NULL,     -- 강사 등록일
	instructor_pw      VARCHAR(255) NULL      -- 강사 패스워드
);

-- 강사 정보 테이블
ALTER TABLE INSTRUCTOR_TB
	ADD
		CONSTRAINT PK_INSTRUCTOR_TB -- 강사 정보 테이블 기본키
		PRIMARY KEY (
			instructor_id -- 강사_ID
		);

-- 강의 가능 과목 테이블               
CREATE TABLE INSTRUCTOR_POSSIBLE_TB (
	instructor_id VARCHAR(6) NOT NULL, -- 강사_ID
	subject_id    VARCHAR(6) NOT NULL  -- 과목_ID
);

-- 강의 가능 과목 테이블               
ALTER TABLE INSTRUCTOR_POSSIBLE_TB
	ADD
		CONSTRAINT PK_INSTRUCTOR_POSSIBLE_TB -- 강의 가능 과목 테이블                기본키
		PRIMARY KEY (
			instructor_id, -- 강사_ID
			subject_id     -- 과목_ID
		);

-- 강의실 테이블
CREATE TABLE CLASSROOM_TB (
	classroom_id   VARCHAR(4)  NOT NULL, -- 강의실_ID
	classroom_name VARCHAR(10) NULL,     -- 강의실명
	max_number     INTEGER     NULL      -- 최대 정원
);

-- 강의실 테이블
ALTER TABLE CLASSROOM_TB
	ADD
		CONSTRAINT PK_CLASSROOM_TB -- 강의실 테이블 기본키
		PRIMARY KEY (
			classroom_id -- 강의실_ID
		);

-- 개설 과정 정보 테이블
CREATE TABLE OPEN_COURSE_TB (
	open_course_id         VARCHAR(6) NOT NULL, -- 개설 과정_ID
	classroom_id           VARCHAR(4) NULL,     -- 강의실_ID
	course_id              VARCHAR(6) NULL,     -- 과정_ID
	open_course_start_date DATETIME   NULL,     -- 개설 과정 시작일
	open_course_end_date   DATETIME   NULL      -- 개설 과정 종료일
);

-- 개설 과정 정보 테이블
ALTER TABLE OPEN_COURSE_TB
	ADD
		CONSTRAINT PK_OPEN_COURSE_TB -- 개설 과정 정보 테이블 기본키
		PRIMARY KEY (
			open_course_id -- 개설 과정_ID
		);

-- 과정 정보 테이블
CREATE TABLE COURSE_TB (
	course_id   VARCHAR(6)  NOT NULL, -- 과정_ID
	course_name VARCHAR(50) NULL      -- 과정명
);

-- 과정 정보 테이블
ALTER TABLE COURSE_TB
	ADD
		CONSTRAINT PK_COURSE_TB -- 과정 정보 테이블 기본키
		PRIMARY KEY (
			course_id -- 과정_ID
		);

-- 수강생 성적 정보 테이블
CREATE TABLE STUDENT_SCORE_TB (
	student_score_id VARCHAR(7) NOT NULL, -- 수강생 성적 정보_ID
	attendance_score INTEGER    NULL,     -- 출결점수
	write_score      INTEGER    NULL,     -- 필기점수
	skill_score      INTEGER    NULL,     -- 실기점수
	exam_id          VARCHAR(8) NULL,     -- 시험_ID
	student_id       VARCHAR(7) NULL      -- 수강생_ID
);

-- 수강생 성적 정보 테이블
ALTER TABLE STUDENT_SCORE_TB
	ADD
		CONSTRAINT PK_STUDENT_SCORE_TB -- 수강생 성적 정보 테이블 기본키
		PRIMARY KEY (
			student_score_id -- 수강생 성적 정보_ID
		);

-- 수강생 테이블
CREATE TABLE STUDENT_TB (
	student_id      VARCHAR(7)  NOT NULL, -- 수강생_ID
	student_name    VARCHAR(10) NULL,     -- 수강생 이름
	student_phone   VARCHAR(13) NULL,     -- 수강생 전화번호
	student_regDate DATETIME    NULL,     -- 수강생 등록일
	student_pw      VARCHAR(20) NULL      -- 수강생 패스워드
);

-- 수강생 테이블
ALTER TABLE STUDENT_TB
	ADD
		CONSTRAINT PK_STUDENT_TB -- 수강생 테이블 기본키
		PRIMARY KEY (
			student_id -- 수강생_ID
		);

-- 수강 히스토리 테이블
CREATE TABLE STUDENT_HISTORY_TB (
	open_course_id VARCHAR(6) NOT NULL, -- 개설 과정_ID
	student_id     VARCHAR(7) NOT NULL  -- 수강생_ID
);

-- 수강 히스토리 테이블
ALTER TABLE STUDENT_HISTORY_TB
	ADD
		CONSTRAINT PK_STUDENT_HISTORY_TB -- 수강 히스토리 테이블 기본키
		PRIMARY KEY (
			open_course_id, -- 개설 과정_ID
			student_id      -- 수강생_ID
		);

-- 중도 탈락 테이블
CREATE TABLE DROPOUT_TB (
	open_course_id VARCHAR(6) NOT NULL, -- 개설 과정_ID
	student_id     VARCHAR(7) NOT NULL, -- 수강생_ID
	dropout_date   DATETIME   NULL      -- 중도 탈락 일자
);

-- 중도 탈락 테이블
ALTER TABLE DROPOUT_TB
	ADD
		CONSTRAINT PK_DROPOUT_TB -- 중도 탈락 테이블 기본키
		PRIMARY KEY (
			open_course_id, -- 개설 과정_ID
			student_id      -- 수강생_ID
		);

-- 관리자 테이블
CREATE TABLE ADMIN_TB (
	admin_id      VARCHAR(8)   NOT NULL, -- 관리자_ID
	admin_name    VARCHAR(10)  NULL,     -- 관리자 이름
	admin_phone   VARCHAR(13)  NULL,     -- 관리자 전화번호
	admin_regDate DATETIME     NULL,     -- 관리자 등록일
	admin_pw      VARCHAR(255) NULL,     -- 관리자 패스워드
	admin_grade   VARCHAR(15)  NULL,     -- 관리자 등급
	admin_blind   BOOLEAN      NULL      -- 관리자 계정 잠금
);

-- 관리자 테이블
ALTER TABLE ADMIN_TB
	ADD
		CONSTRAINT PK_ADMIN_TB -- 관리자 테이블 기본키
		PRIMARY KEY (
			admin_id -- 관리자_ID
		);

-- 공지사항 테이블
CREATE TABLE NOTICE_TB (
	notice_id      VARCHAR(10)  NOT NULL, -- 공지사항_ID
	notice_content VARCHAR(255) NULL,     -- 공지사항 내용
	notice_regDate DATETIME     NULL,     -- 공지사항 작성일
	admin_id       VARCHAR(8)   NULL      -- 관리자_ID
);

-- 공지사항 테이블
ALTER TABLE NOTICE_TB
	ADD
		CONSTRAINT PK_NOTICE_TB -- 공지사항 테이블 기본키
		PRIMARY KEY (
			notice_id -- 공지사항_ID
		);

-- 수강생 사진 테이블
CREATE TABLE STUDENT_PHOTO_TB (
	student_photo_id       VARCHAR(8)   NOT NULL, -- 수강생 사진_ID
	student_photo_filepath VARCHAR(100) NULL,     -- 수강생 사진 경로
	student_id             VARCHAR(7)   NULL      -- 수강생_ID
);

-- 수강생 사진 테이블
ALTER TABLE STUDENT_PHOTO_TB
	ADD
		CONSTRAINT PK_STUDENT_PHOTO_TB -- 수강생 사진 테이블 기본키
		PRIMARY KEY (
			student_photo_id -- 수강생 사진_ID
		);

-- 강사 사진 테이블
CREATE TABLE INSTRUCTOR_PHOTO_TB (
	instructor_photo_id       VARCHAR(7)   NOT NULL, -- 강사 사진_ID
	instructor_photo_filepath VARCHAR(100) NULL,     -- 강사 사진 경로
	instructor_id             VARCHAR(6)   NULL      -- 강사_ID
);

-- 강사 사진 테이블
ALTER TABLE INSTRUCTOR_PHOTO_TB
	ADD
		CONSTRAINT PK_INSTRUCTOR_PHOTO_TB -- 강사 사진 테이블 기본키
		PRIMARY KEY (
			instructor_photo_id -- 강사 사진_ID
		);

-- 개설 과목 정보 테이블
ALTER TABLE OPEN_SUBJECT_TB
	ADD
		CONSTRAINT FK_SUBJECTBOOK_TB_TO_OPEN_SUBJECT_TB -- 교재 정보 테이블 -> 개설 과목 정보 테이블
		FOREIGN KEY (
			subjectbook_id -- 교재_ID
		)
		REFERENCES SUBJECTBOOK_TB ( -- 교재 정보 테이블
			subjectbook_id -- 교재_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 개설 과목 정보 테이블
ALTER TABLE OPEN_SUBJECT_TB
	ADD
		CONSTRAINT FK_SUBJECT_TB_TO_OPEN_SUBJECT_TB -- 과목 정보 테이블 -> 개설 과목 정보 테이블
		FOREIGN KEY (
			subject_id -- 과목_ID
		)
		REFERENCES SUBJECT_TB ( -- 과목 정보 테이블
			subject_id -- 과목_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 개설 과목 정보 테이블
ALTER TABLE OPEN_SUBJECT_TB
	ADD
		CONSTRAINT FK_INSTRUCTOR_TB_TO_OPEN_SUBJECT_TB -- 강사 정보 테이블 -> 개설 과목 정보 테이블
		FOREIGN KEY (
			instructor_id -- 강사_ID
		)
		REFERENCES INSTRUCTOR_TB ( -- 강사 정보 테이블
			instructor_id -- 강사_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 개설 과목 정보 테이블
ALTER TABLE OPEN_SUBJECT_TB
	ADD
		CONSTRAINT FK_OPEN_COURSE_TB_TO_OPEN_SUBJECT_TB -- 개설 과정 정보 테이블 -> 개설 과목 정보 테이블
		FOREIGN KEY (
			open_course_id -- 개설 과정_ID
		)
		REFERENCES OPEN_COURSE_TB ( -- 개설 과정 정보 테이블
			open_course_id -- 개설 과정_ID
		)
		ON DELETE CASCADE
		ON UPDATE NO ACTION;

-- 과목별 배점 정보 테이블
ALTER TABLE SUBJECT_POINT_TB
	ADD
		CONSTRAINT FK_EXAM_TB_TO_SUBJECT_POINT_TB -- 시험 테이블 -> 과목별 배점 정보 테이블
		FOREIGN KEY (
			exam_id -- 시험_ID
		)
		REFERENCES EXAM_TB ( -- 시험 테이블
			exam_id -- 시험_ID
		)
		ON DELETE CASCADE
		ON UPDATE NO ACTION;

-- 시험 테이블
ALTER TABLE EXAM_TB
	ADD
		CONSTRAINT FK_OPEN_SUBJECT_TB_TO_EXAM_TB -- 개설 과목 정보 테이블 -> 시험 테이블
		FOREIGN KEY (
			open_subject_id -- 개설 과목 정보_ID
		)
		REFERENCES OPEN_SUBJECT_TB ( -- 개설 과목 정보 테이블
			open_subject_id -- 개설 과목 정보_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 강의 가능 과목 테이블               
ALTER TABLE INSTRUCTOR_POSSIBLE_TB
	ADD
		CONSTRAINT FK_SUBJECT_TB_TO_INSTRUCTOR_POSSIBLE_TB -- 과목 정보 테이블 -> 강의 가능 과목 테이블               
		FOREIGN KEY (
			subject_id -- 과목_ID
		)
		REFERENCES SUBJECT_TB ( -- 과목 정보 테이블
			subject_id -- 과목_ID
		)
		ON DELETE CASCADE
		ON UPDATE NO ACTION;

-- 강의 가능 과목 테이블               
ALTER TABLE INSTRUCTOR_POSSIBLE_TB
	ADD
		CONSTRAINT FK_INSTRUCTOR_TB_TO_INSTRUCTOR_POSSIBLE_TB -- 강사 정보 테이블 -> 강의 가능 과목 테이블               
		FOREIGN KEY (
			instructor_id -- 강사_ID
		)
		REFERENCES INSTRUCTOR_TB ( -- 강사 정보 테이블
			instructor_id -- 강사_ID
		)
		ON DELETE CASCADE
		ON UPDATE NO ACTION;

-- 개설 과정 정보 테이블
ALTER TABLE OPEN_COURSE_TB
	ADD
		CONSTRAINT FK_CLASSROOM_TB_TO_OPEN_COURSE_TB -- 강의실 테이블 -> 개설 과정 정보 테이블
		FOREIGN KEY (
			classroom_id -- 강의실_ID
		)
		REFERENCES CLASSROOM_TB ( -- 강의실 테이블
			classroom_id -- 강의실_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 개설 과정 정보 테이블
ALTER TABLE OPEN_COURSE_TB
	ADD
		CONSTRAINT FK_COURSE_TB_TO_OPEN_COURSE_TB -- 과정 정보 테이블 -> 개설 과정 정보 테이블
		FOREIGN KEY (
			course_id -- 과정_ID
		)
		REFERENCES COURSE_TB ( -- 과정 정보 테이블
			course_id -- 과정_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 수강생 성적 정보 테이블
ALTER TABLE STUDENT_SCORE_TB
	ADD
		CONSTRAINT FK_EXAM_TB_TO_STUDENT_SCORE_TB -- 시험 테이블 -> 수강생 성적 정보 테이블
		FOREIGN KEY (
			exam_id -- 시험_ID
		)
		REFERENCES EXAM_TB ( -- 시험 테이블
			exam_id -- 시험_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 수강생 성적 정보 테이블
ALTER TABLE STUDENT_SCORE_TB
	ADD
		CONSTRAINT FK_STUDENT_TB_TO_STUDENT_SCORE_TB -- 수강생 테이블 -> 수강생 성적 정보 테이블
		FOREIGN KEY (
			student_id -- 수강생_ID
		)
		REFERENCES STUDENT_TB ( -- 수강생 테이블
			student_id -- 수강생_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 수강 히스토리 테이블
ALTER TABLE STUDENT_HISTORY_TB
	ADD
		CONSTRAINT FK_OPEN_COURSE_TB_TO_STUDENT_HISTORY_TB -- 개설 과정 정보 테이블 -> 수강 히스토리 테이블
		FOREIGN KEY (
			open_course_id -- 개설 과정_ID
		)
		REFERENCES OPEN_COURSE_TB ( -- 개설 과정 정보 테이블
			open_course_id -- 개설 과정_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 수강 히스토리 테이블
ALTER TABLE STUDENT_HISTORY_TB
	ADD
		CONSTRAINT FK_STUDENT_TB_TO_STUDENT_HISTORY_TB -- 수강생 테이블 -> 수강 히스토리 테이블
		FOREIGN KEY (
			student_id -- 수강생_ID
		)
		REFERENCES STUDENT_TB ( -- 수강생 테이블
			student_id -- 수강생_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 중도 탈락 테이블
ALTER TABLE DROPOUT_TB
	ADD
		CONSTRAINT FK_STUDENT_HISTORY_TB_TO_DROPOUT_TB -- 수강 히스토리 테이블 -> 중도 탈락 테이블
		FOREIGN KEY (
			open_course_id, -- 개설 과정_ID
			student_id      -- 수강생_ID
		)
		REFERENCES STUDENT_HISTORY_TB ( -- 수강 히스토리 테이블
			open_course_id, -- 개설 과정_ID
			student_id      -- 수강생_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 공지사항 테이블
ALTER TABLE NOTICE_TB
	ADD
		CONSTRAINT FK_ADMIN_TB_TO_NOTICE_TB -- 관리자 테이블 -> 공지사항 테이블
		FOREIGN KEY (
			admin_id -- 관리자_ID
		)
		REFERENCES ADMIN_TB ( -- 관리자 테이블
			admin_id -- 관리자_ID
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 수강생 사진 테이블
ALTER TABLE STUDENT_PHOTO_TB
	ADD
		CONSTRAINT FK_STUDENT_TB_TO_STUDENT_PHOTO_TB -- 수강생 테이블 -> 수강생 사진 테이블
		FOREIGN KEY (
			student_id -- 수강생_ID
		)
		REFERENCES STUDENT_TB ( -- 수강생 테이블
			student_id -- 수강생_ID
		)
		ON DELETE CASCADE
		ON UPDATE NO ACTION;

-- 강사 사진 테이블
ALTER TABLE INSTRUCTOR_PHOTO_TB
	ADD
		CONSTRAINT FK_INSTRUCTOR_TB_TO_INSTRUCTOR_PHOTO_TB -- 강사 정보 테이블 -> 강사 사진 테이블
		FOREIGN KEY (
			instructor_id -- 강사_ID
		)
		REFERENCES INSTRUCTOR_TB ( -- 강사 정보 테이블
			instructor_id -- 강사_ID
		)
		ON DELETE CASCADE
		ON UPDATE NO ACTION;