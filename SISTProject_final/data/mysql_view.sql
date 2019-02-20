#1. 개설과정번호, 과정명, 개설과정시작일, 개설과정종료일, 강의실명, 개설과목등록갯수, 수강생등록인원 - admin_opencourse1.jsp / admin_grade_opencourse1.jsp / admin_grade_student2.jsp

  CREATE OR REPLACE VIEW open_course_list1_vw
  AS
 SELECT open_course_id, course_name, open_course_start_date ,open_course_end_date, classroom_name,  
          (SELECT COUNT(*)  
              FROM open_subject_tb
           WHERE open_course_id=oc.open_course_id) os_count, 
       (SELECT COUNT(*) FROM student_history_tb
             WHERE open_course_id=oc.open_course_id) d_count
      FROM open_course_tb oc, course_tb c, classroom_tb cr  WHERE oc.course_id = c.course_id AND oc.classroom_id=cr.classroom_id;


#2.개설과목번호, 과목명, 개설과목시작일, 개설과목종료일, 강사명, 교재명 - admin_opencourse2.jsp / admin_grade_opencourse2.jsp / admin_grade_student2.jsp

CREATE OR REPLACE VIEW open_subject_list1_VW1 
  AS
  SELECT open_subject_id, subject_name, subject_start_date, subject_end_date, 
          instructor_name, subjectbook_id, os.instructor_id, oc.open_course_id
      FROM subject_tb s, open_subject_tb os, instructor_tb i, open_course_tb oc
      WHERE s.subject_id = os.subject_id 
          AND i.instructor_id = os.instructor_id 
          AND os.open_course_id = oc.open_course_id;

 CREATE OR REPLACE VIEW open_subject_list1_VW2 
  AS 
  SELECT open_subject_id, subject_name, subject_start_date, subject_end_date,  
          instructor_name, subjectbook_name, instructor_id, open_course_id
      FROM open_subject_list1_VW1 v1 LEFT JOIN subjectbook_tb sb  
      ON sb.subjectbook_id = v1.subjectbook_id;

#3. 시험번호, 출결배점, 필기배점, 실기배점, 시험날짜, 시험문제파일 - admin_opencourse2.jsp / admin_grade_opencourse2.jsp / instructor_point2.jsp

 CREATE OR REPLACE VIEW exam_list1_VW1 
  AS 
  SELECT os.instructor_id, os.open_course_id, os.open_subject_id, os.subject_end_date,  
          os.subject_id, os.subject_start_date, os.subjectbook_id, e.exam_id, e.exam_date, e.exam_file 
      FROM open_subject_tb os, exam_tb e 
      WHERE os.open_subject_id = e.open_subject_id; 
      
CREATE OR REPLACE VIEW exam_list1_VW2 
  AS     
  SELECT v1.exam_date, v1.exam_file, v1.instructor_id, v1.open_course_id, v1.open_subject_id,  
          v1.subject_end_date , v1.subject_id , v1.subject_start_date , v1.subjectbook_id,  
          sp.attendance_point, sp.exam_id, sp.skill_point, sp.subject_point_id, sp.write_point  
      FROM  exam_list1_VW1 v1 LEFT JOIN subject_point_tb sp 
      ON v1.exam_id = sp.exam_id; 
      

#4. 개설과목번호, 과목명, 개설과목시작일, 개설과목종료일, 강사명, 교재명, 과정명, 개설과정시작일, 개설과정종료일, 강의실명 - admin_opensubject.jsp

 CREATE OR REPLACE VIEW open_subject_list2_VW1 
  AS 
  SELECT open_subject_id, subject_name, subject_start_date, subject_end_date, subjectbook_id, 
          instructor_name, course_name, open_course_start_date, open_course_end_date,  
          classroom_name, oc.open_course_id     
      FROM open_subject_tb os, subject_tb s, instructor_tb i,  
          open_course_tb oc, classroom_tb cr, course_tb c 
      WHERE os.subject_id = s.subject_id 
          AND os.instructor_id = i.instructor_id 
          AND os.open_course_id = oc.open_course_id 
          AND oc.course_id = c.course_id 
          AND oc.classroom_id = cr.classroom_id; 
          
 CREATE OR REPLACE VIEW open_subject_list2_VW2 
  AS 
  SELECT open_subject_id, subject_name, subject_start_date, subject_end_date, subjectbook_name, 
          instructor_name, course_name, open_course_start_date, open_course_end_date,  
          classroom_name, open_course_id 
      FROM open_subject_list2_VW1 v1 LEFT JOIN subjectbook_tb sb 
      ON v1.subjectbook_id = sb.subjectbook_id; 


#5. 수강생번호, 수강생이름, 수강생전화번호, 출결점수, 필기점수, 실기점수, 총점 - admin_grade_opencourse2.jsp

CREATE OR REPLACE VIEW student_list1_vw1
  AS 
SELECT s.student_id, student_name, student_phone, attendance_score, write_score, skill_score,
(attendance_score + write_score + skill_score) score, exam_id
   FROM student_tb s, student_score_tb sc
    WHERE s.student_id = sc.student_id;
    
 CREATE OR REPLACE VIEW student_list1_vw2
  AS 
  SELECT student_id, student_name, student_phone, attendance_score, write_score, skill_score,
      score, e.exam_id
      FROM exam_tb e LEFT JOIN student_list1_vw1 v1
      ON e.exam_id = v1.exam_id; 




#6. 수강생번호, 수강생이름, 수강생휴대폰번호, 수강생등록일, 수강횟수 - admin_grade_student1.jsp / admin_student_mng1.jsp / admin_student_mng2.jsp

CREATE OR REPLACE VIEW student_list2_vw
AS
SELECT student_id, student_name, student_phone, student_regdate,
        (SELECT COUNT(*) 
            FROM student_history_tb
            WHERE student_id = s.student_id) count_
    FROM student_tb s;

#6번 수정######################
CREATE OR REPLACE VIEW student_list2_vw
AS
SELECT s.student_id, student_name, student_phone, student_regdate,
        (SELECT COUNT(*) 
            FROM student_history_tb
            WHERE student_id = s.student_id) count_, student_photo_filepath
    FROM student_tb s, student_photo_tb sp
    where s.student_id= sp.student_id;

#7. 시험번호, 출결점수, 출결배점, 필기점수, 필기배점, 실기점수, 실기배점, 총점, 시험날짜, 시험문제 파일 - admin_grade_student2.jsp

CREATE OR REPLACE VIEW exam_list2_vw
AS
SELECT e.exam_id, attendance_score, attendance_point
      , write_score, write_point, skill_score, skill_point
        , (attendance_score + write_score + skill_score) score
        ,exam_date, exam_file, open_subject_id, student_id
      FROM exam_tb e, subject_point_tb sp, student_score_tb ss
      WHERE e.exam_id = sp.exam_id
      AND e.exam_id = ss.exam_id;

#8. 강사번호, 강사이름, 강사휴대폰번호, 강사등록일, 강의가능과목 - admin_instructor_mng1.jsp / instructor_schedule1.jsp

CREATE OR REPLACE VIEW instructor_list1_vw
AS
SELECT it.instructor_id, it.instructor_name, it.instructor_phone, it.instructor_regDate, subject_id
   FROM instructor_tb it LEFT JOIN instructor_possible_tb ip 
    ON it.instructor_id = ip.instructor_id;
    
   
CREATE OR REPLACE VIEW instructor_list1_vw2
AS
SELECT instructor_id, instructor_name, instructor_phone, instructor_regDate, subject_name
   FROM  instructor_list1_vw v1 LEFT JOIN  subject_tb st  
    ON v1.subject_id = st.subject_id;

create or replace view instructor_list1_vw3
as
SELECT il.instructor_id, il.instructor_name, il.instructor_phone, il.instructor_regDate,
(select group_concat(subject_name) from instructor_possible_tb ip, subject_tb s 
    where ip.subject_id = s.subject_id AND ip.instructor_id = il.instructor_id group by ip.instructor_id) instructor_possible,
(select group_concat(s.subject_id) from instructor_possible_tb ip, subject_tb s 
    where ip.subject_id = s.subject_id AND ip.instructor_id = il.instructor_id group by ip.instructor_id) instructor_pp,
    
    ipt.instructor_photo_id, ipt.instructor_photo_filePath,  
         (SELECT COUNT(*) FROM instructor_possible_tb WHERE instructor_id = il.instructor_id) count_
from instructor_tb il , instructor_photo_tb ipt where ipt.instructor_id=il.instructor_id;


#9. 
# 입력 - 강사아이디, 강의진행여부
# 출력 - 개설과목번호, 과목명, 개설과목시작일, 개설과목종료일, 과정명, 개설과정시작일, 개설과정종료일, 강의실명, 강의진행여부 
# 사용하는 VIEW- admin_instructor_mng2.jsp

CREATE OR REPLACE VIEW admin_instructor_lecture_vw1
AS 
  SELECT open_subject_id, subject_name, subject_start_date, subject_end_date, 
		course_name, open_course_start_date, open_course_end_date, classroom_name,
        CASE
			WHEN NOW() < open_course_start_date
				THEN '강의예정'
			WHEN NOW() > open_course_end_date
				THEN '강의종료'
			ELSE '강의중'
		END instructor_status, instructor_id
    FROM open_subject_tb os, subject_tb s, open_course_tb oc, course_tb c, classroom_tb cr
    WHERE os.subject_id = s.subject_id
		AND os.open_course_id = oc.open_course_id
        AND oc.course_id = c.course_id
        AND oc.classroom_id = cr.classroom_id;
    

#10. 강의실명, 최대정원, 수강인원, 중도탈락인원, 과정명, 개설과정시작일, 개설과정종료일 -admin_first.jsp

CREATE OR REPLACE VIEW admin_first_vw
AS
SELECT classroom_name, max_number, (SELECT 
            COUNT(*)
        FROM
            student_history_tb
        WHERE
            open_course_id = oc.open_course_id) student_count, 
            (SELECT 
            COUNT(*)
        FROM
            dropout_tb d
        WHERE
             d.open_course_id = oc.open_course_id) dropout_count
             , course_name, open_course_start_date, open_course_end_date
   FROM open_course_tb oc, classroom_tb cl, course_tb c
    WHERE oc.course_id = c.course_id
    AND oc.classroom_id = cl.classroom_id;


#11. 과정명, 개설과정시작일, 개설과정종료일, 과목명, 개설과목시작일, 개설과목종료일 - instructor_first.jsp

CREATE OR REPLACE VIEW instructor_first_vw
AS
SELECT course_name, open_course_start_date, open_course_end_date, subject_name, subject_start_date, subject_end_date
	FROM course_tb c, open_course_tb oc, subject_tb s, open_subject_tb os
    WHERE oc.course_id = c.course_id
    AND oc.open_course_id = os.open_course_id
    AND s.subject_id = os.subject_id;


#12. 
# 입력 - 강사아이디, 강의진행여부
# 출력 - 개설과목번호, 과목명, 개설과목시작일, 개설과목종료일, 과정명, 개설과정시작일, 개설과정종료일, 강의실명, 교재명, 수강생등록인원, 강의진행여부 
# 사용 VIEW - instructor_schedule1.jsp / instructor_point1.jsp / instructor_score1.jsp

CREATE OR REPLACE VIEW instructor_lecture_vw1
AS
SELECT open_subject_id, subject_name, subject_start_date, subject_end_date,
    course_name, open_course_start_date, open_course_end_date, classroom_name, subjectbook_id,
    (SELECT COUNT(*)
        FROM student_history_tb
        WHERE open_course_id = oc.open_course_id) s_count,
    CASE
        WHEN NOW() < open_course_start_date
			THEN '강의예정'
        WHEN NOW() > open_course_end_date
			THEN '강의종료'
        ELSE '강의중'
    END instructor_status, instructor_id 
    FROM open_subject_tb os, subject_tb s, course_tb c, open_course_tb oc ,classroom_tb cl
   WHERE oc.course_id = c.course_id
    AND oc.open_course_id = os.open_course_id
    AND s.subject_id = os.subject_id
    AND oc.classroom_id = cl.classroom_id;
    
CREATE OR REPLACE VIEW instructor_lecture_vw2
AS
SELECT open_subject_id, subject_name, subject_start_date, subject_end_date,
    course_name, open_course_start_date, open_course_end_date, classroom_name,
    subjectbook_name, s_count, instructor_status, subjectbook_isbn, instructor_id
   FROM instructor_lecture_vw1 v1 LEFT JOIN subjectbook_tb sb
    ON sb.subjectbook_id = v1.subjectbook_id;


#13. 수강생번호, 수강생이름, 수강생휴대폰번호, 수강생등록일, 수료여부, 날짜 - instructor_schedule2.jsp

CREATE OR REPLACE VIEW student_list3_vw1
AS
SELECT classroom_id, oc.open_course_id, c.course_id, open_course_start_date,
	   open_course_end_date, s.student_id, student_name, student_phone, student_regdate,
       course_name, instructor_id, open_subject_id
    FROM open_course_tb oc, student_history_tb sh, student_tb s, course_tb c, open_subject_tb os
    WHERE oc.open_course_id = sh.open_course_id
        AND s.student_id = sh.student_id
        AND c.course_id = oc.course_id
        AND oc.open_course_id = os.open_course_id;
        

CREATE OR REPLACE VIEW student_list3_vw2
AS
SELECT classroom_id, course_id, open_course_end_date, v1.open_course_id,
        open_course_start_date, v1.student_id, student_name, student_phone, 
        student_regdate, instructor_id, open_subject_id, dropout_date, course_name
    FROM student_list3_vw1 v1 LEFT JOIN dropout_tb pc
    ON v1.open_course_id = pc.open_course_id
	AND v1.student_id = pc.student_id;
        

CREATE OR REPLACE VIEW student_list3_vw3
AS
SELECT student_id, student_name, student_phone, student_regdate, 
        CASE WHEN NOW() < open_course_start_date AND dropout_date is null THEN '수료예정'
            WHEN NOW() > open_course_end_date AND dropout_date is null THEN '수료완료'
            WHEN dropout_date IS NOT NULL THEN '중도탈락'
        else '진행중' END completion, 
        IFNULL(dropout_date, open_course_end_date) completion_date, instructor_id, open_subject_id
    FROM student_list3_vw2;


#14. 시험번호, 출결배점, 필기배점, 실기배점, 시험날짜, 시험문제, 성적등록인원수, 성적입력여부 - instructor_score2.jsp

CREATE OR REPLACE VIEW exam_list3_vw1
AS
SELECT e.exam_id, attendance_point, write_point, skill_point, exam_date, exam_file, 
        os.open_course_id, instructor_id, os.open_subject_id
    FROM exam_tb e, subject_point_tb sp, open_subject_tb os, open_course_tb oc
    WHERE e.exam_id = sp.exam_id
        AND e.open_subject_id = os.open_subject_id
        AND os.open_course_id = oc.open_course_id;


CREATE OR REPLACE VIEW exam_list3_vw2
AS
SELECT v1.exam_id, attendance_point, write_point, skill_point, exam_date, exam_file, 
        instructor_id, open_subject_id,
        (SELECT COUNT(*) 
            FROM student_score_tb ss 
            WHERE v1.exam_id = ss.exam_id) count_,
        (SELECT COUNT(*) 
            FROM student_history_tb sh 
            WHERE v1.open_course_id = sh.open_course_id) score_s
    FROM exam_list3_vw1 v1
    ORDER BY v1.exam_id;
    

CREATE OR REPLACE VIEW exam_list3_vw3
AS
SELECT exam_id, attendance_point, write_point, skill_point, exam_date, exam_file, open_subject_id,
     
  count_, instructor_id,
    CASE
  WHEN count_ THEN '성적 입력 전'
    else '성적 입력 완료'
   END score_state
    FROM exam_list3_vw2 v2;
    

#15. 수강생번호, 수강생이름, 수강생휴대폰번호, 수강생등록일, 수료여부, 날짜, 출석점수, 필기점수, 실기점수, 총점 - instructor_score2.jsp

CREATE OR REPLACE VIEW instructor_score2_list2_vw1
AS
SELECT s.student_id, student_name, student_phone, student_regDate, 
        (SELECT dropout_date 
            FROM dropout_tb d 
            WHERE d.open_course_id = sh.open_course_id 
                AND d.student_id = sh.student_id) drop_date, 
        open_course_start_date, open_course_end_date, 
        attendance_score, write_score, skill_score, open_subject_id, instructor_id, exam_id
    FROM student_score_tb ss, student_tb s, student_history_tb sh, open_course_tb oc, open_subject_tb os
    WHERE ss.student_id = s.student_id
        AND s.student_id = sh.student_id
        AND oc.open_course_id = sh.open_course_id
        AND oc.open_course_id = os.open_course_id;
        
CREATE OR REPLACE VIEW instructor_score2_list2_vw2
AS
SELECT student_id, student_name, student_phone, student_regDate, open_subject_id, drop_date,
        open_course_end_date, instructor_id, exam_id, 
        CASE
            WHEN NOW() < open_course_start_date AND drop_date is null THEN '수료예정'
            WHEN NOW() > open_course_end_date AND drop_date is null THEN '수료완료'
            WHEN drop_date IS NOT NULL THEN '중도탈락'
            else '진행중'
        END completion_status, 
        attendance_score, write_score, skill_score, 
        attendance_score+write_score+skill_score AS total_score
    FROM instructor_score2_list2_vw1;

CREATE OR REPLACE VIEW instructor_score2_list2_vw3
AS
SELECT student_id, student_name, student_phone, student_regDate, completion_status, 
        CASE completion_status 
            WHEN '중도탈락' THEN drop_date 
            ELSE open_course_end_date 
        END completion_date,
        attendance_score, write_score, skill_score, total_score, open_subject_id, exam_id
    FROM instructor_score2_list2_vw2;


#16. 개설과정번호, 과정명, 개설과정시작일, 개설과정종료일, 강의실명, 수료여부 - student_score1.jsp / student_score2.jsp


CREATE OR REPLACE VIEW open_course_list3_vw1
AS
SELECT oc.open_course_id, course_name, open_course_start_date, open_course_end_date, 
	   classroom_name, sh.student_id, 
       (SELECT dropout_date 
            FROM dropout_tb d 
            WHERE d.open_course_id = oc.open_course_id 
                AND d.student_id = sh.student_id) drop_date
    FROM open_course_tb oc, course_tb c ,classroom_tb cl, student_history_tb sh
    WHERE c.course_id = oc.course_id
        AND cl.classroom_id = oc.classroom_id
        AND oc.open_course_id = sh.open_course_id; 



CREATE OR REPLACE VIEW open_course_list3_vw2
AS
SELECT open_course_id, course_name, open_course_start_date, open_course_end_date, classroom_name,
        CASE
            WHEN NOW() < open_course_end_date AND drop_date is null THEN '수료예정'
            WHEN drop_date IS NOT NULL THEN '중도탈락'
            else '수료'
        END completion
    FROM open_course_list3_vw1;
    


#17. 
# 입력 - 수강생번호, 개설과정번호
# 출력 - 과목명, 과목시작일, 과목종료일, 교재명, 강사이름, 강사사진경로, 시험날짜, 출결점수, 출결배점, 필기점수, 필기배점, 실기점수, 실기배점, 시험문제 - student_score2.jsp

CREATE OR REPLACE VIEW student_transcript_vw1
AS
SELECT subject_name, subject_start_date, subject_end_date, instructor_name, instructor_phone, instructor_photo_filepath, open_course_id, subjectbook_id, open_subject_id
	FROM subject_tb s, open_subject_tb os, instructor_tb ins, instructor_photo_tb insp
	WHERE s.subject_id = os.subject_id
		AND os.instructor_id = ins.instructor_id
		AND ins.instructor_id = insp.instructor_id;
        
CREATE OR REPLACE VIEW student_transcript_vw2
AS
SELECT subject_name, subject_start_date, subject_end_date, instructor_name, instructor_phone, instructor_photo_filepath, open_course_id, open_subject_id, sb.subjectbook_id, subjectbook_name, subjectbook_isbn
	FROM student_transcript_vw1 v1 LEFT JOIN subjectbook_tb sb
		ON v1.subjectbook_id = sb.subjectbook_id;
    
CREATE OR REPLACE VIEW student_transcript_vw3
AS
SELECT subject_name, subject_start_date, subject_end_date, instructor_name, instructor_phone, instructor_photo_filepath, open_course_id, subjectbook_name, subjectbook_isbn, exam_date, exam_file, exam_id
	FROM student_transcript_vw2 v2 LEFT JOIN exam_tb e
		ON v2.open_subject_id = e.open_subject_id;
        
CREATE OR REPLACE VIEW student_transcript_vw4
AS
SELECT subject_name, subject_start_date, subject_end_date, instructor_name, instructor_phone, instructor_photo_filepath, open_course_id, subjectbook_name, subjectbook_isbn, exam_date, exam_file, v3.exam_id, attendance_point, write_point, skill_point
	FROM student_transcript_vw3 v3 LEFT JOIN subject_point_tb sp
		ON v3.exam_id = sp.exam_id;
        
CREATE OR REPLACE VIEW student_transcript_vw5
AS
SELECT subject_name, subject_start_date, subject_end_date, instructor_name, instructor_phone, instructor_photo_filepath, open_course_id, subjectbook_name, subjectbook_isbn, exam_date, exam_file, v4.exam_id, attendance_point, write_point, skill_point, attendance_score, write_score, skill_score, student_id
	FROM student_transcript_vw4 v4 LEFT JOIN student_score_tb ss
		ON v4.exam_id = ss.exam_id;
  
#18. 
 CREATE OR REPLACE VIEW pass_non_view1 
     AS 
     SELECT oc.open_course_id, course_name, open_course_start_date,  open_course_end_date 
     , classroom_name, student_name, s.student_id 
     FROM student_tb s, open_course_tb oc, classroom_tb cr, course_tb c, student_history_tb sh 
     WHERE cr.classroom_id = oc.classroom_id 
     AND c.course_id = oc.course_id 
     AND oc.open_course_id = sh.open_course_id 
     AND s.student_id = sh.student_id; 
      
 CREATE OR REPLACE VIEW pass_non_view2 
     AS 
     SELECT view1.open_course_id, course_name, open_course_start_date, open_course_end_date 
     , classroom_name, student_name, view1.student_id 
     , CASE WHEN NOW() < open_course_start_date AND dropout_date is null THEN '수료예정'
            WHEN NOW() > open_course_end_date AND dropout_date is null THEN '수료완료'
            WHEN dropout_date IS NOT NULL THEN '중도탈락' else '진행중' END completion_status
     FROM pass_non_view1 view1 LEFT JOIN dropout_tb dt1
     ON view1.open_course_id = dt1.open_course_id ;
     
CREATE OR REPLACE VIEW pass_non_view3
     AS 
     SELECT view2.open_course_id, course_name, open_course_start_date, open_course_end_date 
     , classroom_name, student_name, view2.student_id, completion_status
     FROM pass_non_view2 view2
      LEFT JOIN dropout_tb dt2
      ON view2.student_id = dt2.student_id; 

CREATE OR REPLACE VIEW pass_non_view4
AS
SELECT open_course_id, course_name, open_course_start_date, open_course_end_date, classroom_name, completion_status, student_id,
DATEDIFF(NOW(), open_course_start_date)/DATEDIFF(open_course_end_date, open_course_start_date) *100 as percent
FROM pass_non_view3;

#19. 
CREATE OR REPLACE VIEW student_history_list1_vw1
AS
SELECT oc.open_course_id, course_name, open_course_start_date, open_course_end_date, s.student_id
   FROM course_tb c, open_course_tb oc, student_history_tb sh, student_tb s
    WHERE c.course_id = oc.course_id
    AND oc.open_course_id = sh.open_course_id
    AND sh.student_id = s.student_id;
    
#20. 강사번호, 강사이름, 강사휴대폰번호, 강사등록일, 강사사진아이디, 강사사진경로 - instructor_schedule1.jsp
CREATE OR REPLACE VIEW instructor_info_vw1
AS
SELECT ins.instructor_id, instructor_name, instructor_phone, instructor_regDate, 
		instructor_photo_id, instructor_photo_filepath
	FROM instructor_tb ins, instructor_photo_tb insp
    WHERE ins.instructor_id = insp.instructor_id;
    
#21. 과정명, 개설과정 시작일, 개설 과정 종료일, 과목명, 과목시작일, 과목종료일 - instructor_schedule2.jsp, instructor_point2.jsp, instructor_score2.jsp
CREATE OR REPLACE VIEW open_subject_title_vw1
AS 
SELECT os.open_subject_id, subject_name, subject_start_date, subject_end_date, course_name, 
        open_course_start_date, open_course_end_date, i.instructor_id
    FROM subject_tb s, open_subject_tb os, course_tb c, open_course_tb oc, classroom_tb cr, 
        instructor_tb i
    WHERE s.subject_id = os.subject_id
        AND oc.open_course_id = os.open_course_id
        AND c.course_id = oc.course_id
        AND cr.classroom_id = oc.classroom_id
        AND i.instructor_id = os.instructor_id;
        
#22. 수강생번호, 수강생이름, 수강생휴대폰번호, 수강생등록일, 수강생사진아이디, 수강생사진경로 - student_score1.jsp
CREATE OR REPLACE VIEW student_info_vw1
AS
SELECT st.student_id, student_name, student_phone, student_regDate, 
		student_photo_id, student_photo_filepath
	FROM student_tb st, student_photo_tb stp
    WHERE st.student_id = stp.student_id;




#######################없는 뷰 추가##################################
#개설 과목 갯수 수정해야 ㄷ됨
CREATE OR REPLACE VIEW open_course_list1_vw2
AS 
SELECT oc.open_course_id, course_name, open_course_start_date, open_course_end_date
	, classroom_name, (select count(*) from OPEN_COURSE_TB oc, OPEN_SUBJECT_TB os where oc.open_course_id=os.open_course_id) os_count, student_id
    FROM OPEN_COURSE_TB oc, COURSE_TB c, CLASSROOM_TB cr, STUDENT_HISTORY_TB sh
    where oc.open_course_id = sh.open_course_id
    and oc.course_id=c.course_id
    and oc.classroom_id = cr.classroom_id;


CREATE OR REPLACE VIEW open_subject_list3_vw
AS 
SELECT course_name, open_course_start_date, open_course_end_date ,subject_name, subject_start_date, subject_end_date, i.instructor_id	
		FROM  OPEN_COURSE_TB oc, subject_tb s, course_tb c, open_subject_tb os, INSTRUCTOR_TB i
        where oc.open_course_id = os.open_course_id
        and oc.course_id = c.course_id
        and os.subject_id = s.subject_id
        and os.instructor_id = i.instructor_id;
