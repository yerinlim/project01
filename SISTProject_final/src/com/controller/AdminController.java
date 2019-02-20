package com.controller;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.domain.Admin;
import com.domain.Classroom;
import com.domain.Course;
import com.domain.Exam;
import com.domain.Instructor;
import com.domain.OpenCourse;
import com.domain.OpenSubject;
import com.domain.Student;
import com.domain.Subject;
import com.domain.Subjectbook;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.AdminService;
import com.service.ClassroomService;
import com.service.CourseService;
import com.service.ExamService;
import com.service.InstructorService;
import com.service.OpenCourseService;
import com.service.OpenSubjectService;
import com.service.StudentService;
import com.service.SubjectService;
import com.service.SubjectbookService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ServletContext context;

	@Resource(name = "adminService")
	private AdminService adminService;

	@Resource(name = "classroomService")
	private ClassroomService classroomService;

	@Resource(name = "courseService")
	private CourseService courseSerivce;

	@Resource(name = "subjectService")
	private SubjectService subjectService;

	@Resource(name = "subjectbookService")
	private SubjectbookService subjectbookService;

	@Resource(name = "instructorService")
	private InstructorService instructorService;

	@Resource(name = "openSubjectService")
	private OpenSubjectService openSubjectService;

	@Resource(name = "examService")
	private ExamService examService;

	@Resource(name = "openCourseService")
	private OpenCourseService openCourseService;

	@Resource(name = "studentService")
	private StudentService studentService;

	@RequestMapping("/first")
	public String first(Model model) {
		
		model.addAttribute("list", this.openSubjectService.print1());
		
		return "admin/admin_first";
	}
	
	@RequestMapping("/info")
	public String info(Model model) {
		
		return "admin/admin_info";
	}
	
	@RequestMapping("/changepw")
	public String changepw(Admin admin, RedirectAttributes rttr) {
		String txt="fail";
		int result=this.adminService.changepw(admin);
		if(result==1) {
			txt="success";
		}
		rttr.addFlashAttribute("result", txt);
		return "redirect:/admin/first";
	}

	
	// 예린
	/*11111111111111111111111111111111111111111111111111*/
	
	/** 강의실 관리 */
	//강의실 목록 출력
	@RequestMapping("/basic/classroom")
	public String classroomList(Model model) {
		model.addAttribute("list", this.classroomService.print1());
		return "admin/admin_basic_classroom";
	}
	
	//강의실 수정
	@RequestMapping("/basic/classroom/update")
	public String classroomUpdate(Classroom cr, RedirectAttributes rttr) {
		String txt="fail";
		int result=this.classroomService.update(cr);
		if(result==1) {
			txt="success";
		}
		rttr.addFlashAttribute("result", txt);
		return "redirect:/admin/basic/classroom";
	}
	
	//강의실 삭제
	@RequestMapping("/basic/classroom/delete")
	public String classroomDelete(Classroom cr, RedirectAttributes rttr) {
		String txt="fail";
		System.out.println(cr.getClassroom_id());
		int result = this.classroomService.delete(cr);
		if(result==1) {
			txt="success";
		}
		System.out.println(txt);
		rttr.addFlashAttribute("result", txt);
		return "redirect:/admin/basic/classroom";
	}
	
	//강의실 등록
	@RequestMapping("/basic/classroom/insert")
	public String classroomInsert(Classroom cr, RedirectAttributes rttr) {
		String txt="fail";
		int result =this.classroomService.insert(cr);
		if(result==1) {
			txt="success";
		}
		rttr.addFlashAttribute("result", txt);
		return "redirect:/admin/basic/classroom";
	}
	
	/** 과정 관리 */
	//과정 출력
	@RequestMapping("/basic/course")
	public String courseList(Model model) {
		model.addAttribute("list", this.courseSerivce.print1());
		return "admin/admin_basic_course";
	}
	
	// 과정 수정
	@RequestMapping("/basic/course/update")
	public String courseUpdate(Course cs, RedirectAttributes rttr) {
		int result=this.courseSerivce.update(cs);
		rttr.addFlashAttribute("result",result);
		return "redirect:/admin/basic/course";
	}
	
	// 과정 삭제
	@RequestMapping("/basic/course/delete")
	public String courseDelete(Course cs, RedirectAttributes rttr) {
		int result =this.courseSerivce.delete(cs);
		rttr.addFlashAttribute("result", result);
		return "redirect:/admin/basic/course";
	}
	
	// 과정 등록
	@RequestMapping("/basic/course/insert")
	public String courseInsert(Course cs, RedirectAttributes rttr) {
		String txt="fail";
		int result = this.courseSerivce.insert(cs);
		if(result==1) {
			txt="success";
		}
		System.out.println(txt);
		rttr.addFlashAttribute("result", txt);
		return "redirect:/admin/basic/course";
	}
	
	
	/** 과목 관리 */
	//과목 출력
	@RequestMapping("/basic/subject")
	public String subjectList(Model model) {
		model.addAttribute("list", this.subjectService.print1());
		return "admin/admin_basic_subject";
	}
	
	// 과목 수정
	@RequestMapping("/basic/subject/update")
	public String subjectUpdate(Subject sub, RedirectAttributes rttr) {
		int result = this.subjectService.update(sub);
		rttr.addFlashAttribute("result", result);
		return "redirect:/admin/basic/subject";
	}
	
	// 과목 삭제
	@RequestMapping("/basic/subject/delete")
	public String subjectDelete(Subject sub, RedirectAttributes rttr) {
		int result =this.subjectService.delete(sub);
		rttr.addFlashAttribute("result", result);
		return "redirect:/admin/basic/subject";
	}
	
	// 과목 등록
	@RequestMapping("/basic/subject/insert")
	public String subjectInsert(Subject sub, RedirectAttributes rttr) {
		String txt="fail";
		int result =this.subjectService.insert(sub);
		if(result==1) {
			txt="success";
		}
		System.out.println(txt);
		rttr.addFlashAttribute("result", txt);
		return "redirect:/admin/basic/subject";
	}
	
	
	/** 교재 관리 */
	//교재 출력
	@RequestMapping("/basic/subjectbook")
	public String subjectbookList(Model model) {
		model.addAttribute("list", this.subjectbookService.print1());
		return "admin/admin_basic_subjectbook";
	}
	
	// 교재 수정
	@RequestMapping("/basic/subjectbook/update")
	public String subjectbookUpdate(Subjectbook sb, RedirectAttributes rttr) {
		rttr.addFlashAttribute("result",this.subjectbookService.update(sb));
		return "redirect:/admin/basic/subjectbook";
	}
	
	// 교재 삭제
	@RequestMapping("/basic/subjectbook/delete")
	public String subjectbookDelete(Subjectbook sb, RedirectAttributes rttr) {
		int result =this.subjectbookService.delete(sb);
		rttr.addFlashAttribute("result", result);
		return "redirect:/admin/basic/subjectbook";
	}
	
	// 교재 등록
	@RequestMapping("/basic/subjectbook/insert")
	public String subjectbookInsert(Subjectbook sb, RedirectAttributes rttr) {
		String txt="fail";
		int result = this.subjectbookService.insert(sb);
		if(result==1) {
			txt="success";
		}
		rttr.addFlashAttribute("result", txt);
		return "redirect:/admin/basic/subjectbook";
	}

	/** 강사 계정 관리 */
	// 강사 출력
	@RequestMapping("/instructor/mng1")
	public String instructorList(Model model) {
		model.addAttribute("list", this.instructorService.print1());
		model.addAttribute("sName", this.subjectService.print1());
		return "admin/admin_instructor_mng1";
	}
	
	// 강사 등록
	@RequestMapping(value="/instructor/mng1/insert", method=RequestMethod.POST)
	public String instructorInsert(MultipartFile filePath, Instructor ins, RedirectAttributes rttr) throws IOException{
		System.out.println("파일 업로드 액션 처리중!");
		System.out.println(filePath.getOriginalFilename());
		String uploadPath = this.context.getRealPath("") + "resources/img" + File.separator;
		System.out.println(uploadPath);
		String temp = filePath.getOriginalFilename();
		String ext = temp.substring(temp.lastIndexOf("."));
		String newFileName = "img_"+java.util.UUID.randomUUID() + ext;
		FileCopyUtils.copy(filePath.getBytes(), new File(uploadPath + newFileName));
		ins.setInstructor_photo_filepath(newFileName);
		
		int result = this.instructorService.insert(ins);
		String txt="";
		if(result==1) {
			txt="success";
		}else {
			txt="fail";
		}
		System.out.println(txt);
		rttr.addFlashAttribute("result", result);
		return "redirect:/admin/instructor/mng1";
	}
	
	// 강사 수정
	@RequestMapping(value="/instructor/mng1/update", method=RequestMethod.POST)
	public String instructorUpdate(MultipartFile filePath, Instructor ins, RedirectAttributes rttr) throws IOException{
			System.out.println("파일 업로드 액션 처리중!");
			System.out.println(filePath.getOriginalFilename());
			String uploadPath = this.context.getRealPath("") + "resources/img" + File.separator;
			System.out.println(uploadPath);
			String temp = filePath.getOriginalFilename();
			String ext = temp.substring(temp.lastIndexOf("."));
			String newFileName = "img_"+java.util.UUID.randomUUID() + ext;
			FileCopyUtils.copy(filePath.getBytes(), new File(uploadPath + newFileName));	
			ins.setInstructor_photo_filepath(newFileName);

		int result =this.instructorService.update1(ins);
		int result2= this.instructorService.update2(ins);
		System.out.println(result+result2);
		if((result>=1 && result2>=1) || result>=1) {
			rttr.addFlashAttribute("result", result);
			rttr.addFlashAttribute("result", result2);
		}else {
			rttr.addFlashAttribute("result", result);
		}
		
		return "redirect:/admin/instructor/mng1";
	}
	// 강사 삭제
	@RequestMapping("/instructor/mng1/delete")
	public String instructorDelete(Instructor ins, RedirectAttributes rttr) {
		rttr.addFlashAttribute("result",this.instructorService.delete(ins));
		return "redirect:/admin/instructor/mng1";
	}

	// 강사 비밀번호 초기화
	@RequestMapping("/instructor/mng1/reset")
	public String reset(Instructor ins, RedirectAttributes rttr) {
		rttr.addFlashAttribute("result", this.instructorService.reset(ins));
		return "redirect:/admin/instructor/mng1";
	}

	// 강사 검색
	@RequestMapping("/instructor/mng1/search")
	public String instructorSearch(String key, String value, Model model) {
		List<Instructor> list = this.instructorService.search(key, value);
		model.addAttribute("list", list);
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		
		return "admin/admin_instructor_mng1";
	}

	// 강의가능과목관리
	@RequestMapping("/instructor/mng1/possible")
	public String instructorPossible(OpenSubject os, @RequestParam(value="check_subject", required=false) String[] check_subject ,RedirectAttributes rttr) {
		System.out.println(os.getInstructor_id());
		
		this.openSubjectService.osDel(os);
		if(!Objects.isNull(check_subject)) { 
			for(String s: check_subject) {
				os.setSubject_id(s);
				this.openSubjectService.osInsert(os);
		}
		}
		return "redirect:/admin/instructor/mng1";
	}

	/** 강의 과목 관리 */

	// 강사 - 강의 과목 검색
	@RequestMapping("/instructor/mng2")
	public String openSubjectSearch(Model model, OpenSubject os, String key, String value) {
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		model.addAttribute("os", os);
		return "admin/admin_instructor_mng2";
	}
	
	// 인터파크 도서검색
	@RequestMapping("/book/info")
	public @ResponseBody Map<?, ?> infoBook(String isbn) throws IOException {
	
		String str = String.format("http://book.interpark.com/api/search.api?"
				+ "key=790818C2D3B8DFB5483E7ABEC92B35B752A61FA367C03C1FEBDF484FAECE0BF9"
				+ "&query=%s&queryType=isbn&output=json", isbn);
	
		URL url = new URL(str);
	
		ObjectMapper mapper = new ObjectMapper();
		Map<?, ?> temp = mapper.readValue(url.openStream(), Map.class);
	
		return temp;
	}
	
	// 강의가능 과목 조회Ajax
	@RequestMapping(value = "/instructorAjax", method = RequestMethod.POST)
	@ResponseBody
	public List<OpenSubject> score2Ajax(Model model, OpenSubject os, String key, String value) {

		List<OpenSubject> list = null;
		
		if (key == null) {
			list = this.openSubjectService.print1(os);
		} else {
			list = this.openSubjectService.search3(os, key, value);
		}

		model.addAttribute("key", key);
		model.addAttribute("value", value);
		System.out.println(key+value);
		return list;
	}

	/*--------------------------------------------------*/
	
	// 은미
	/*22222222222222222222222222222222222222222222222222*/
	// admin_opencourse1.jsp

	// 과정 출력
	@RequestMapping("/opencourse1")
	public String openCourseList(Model model) {

		model.addAttribute("list", this.openCourseService.print1());
		model.addAttribute("course", this.courseSerivce.print1());
		model.addAttribute("classroom", this.classroomService.print1());

		return "admin/admin_opencourse1";
	}

	// 과정 등록
	@RequestMapping("/opencourse1/insert")
	public String openCourseInsert(OpenCourse oc, RedirectAttributes rttr) {

		String txt = "fail";
		int result = this.openCourseService.insert(oc);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return "redirect:/admin/opencourse1";
	}

	// 과정 삭제
	@RequestMapping("/opencourse1/delete")
	public String openCourseDelete(OpenCourse oc, RedirectAttributes rttr) {

		String txt = "fail";
		int result = this.openCourseService.delete(oc);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return "redirect:/admin/opencourse1";
	}

	// 과정 수정
	@RequestMapping("/opencourse1/update")
	public String openCourseUpdate(OpenCourse oc, RedirectAttributes rttr) {

		System.out.println("22");
		String txt = "fail";
		int result = this.openCourseService.update(oc);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return "redirect:/admin/opencourse1";
	}

	// 개설 과정 정보 검색
	@RequestMapping("/opencourse1/search")
	public String openCourseSearch1(String key, String value, Model model) {

		model.addAttribute("list", this.openCourseService.search1(key, value));
		return "admin/admin_opencourse1";
	}

	// --------------------------------------------------------------------
	// admin_opencourse2.jsp
	

	// 과목 출력
	@RequestMapping("/opencourse2")
	public String openSubjectList1(Model model, OpenCourse openCourse) {
		model.addAttribute("list", this.openSubjectService.print3(openCourse));
		model.addAttribute("os", this.openSubjectService.print6(openCourse));

		return "admin/admin_opencourse2";
	}

	// AJAX(시험 페이지)
	@RequestMapping(value = "/opencourse2Ajax", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public List<Exam> examAjax(Exam exam) {

		List<Exam> examList = this.examService.print1(exam);

		return examList;
	}

	// ---------------------------------------------------------------------
	// admin_opensubject.jsp

	// 과목 출력
	@RequestMapping("/opensubject")
	public String openSubjectList3(Model model) {
		model.addAttribute("list", this.openSubjectService.print4());
		model.addAttribute("openCourse", this.openCourseService.print1());
		model.addAttribute("subject", this.subjectService.print1());
		model.addAttribute("subjectbook", this.subjectbookService.print1());
		model.addAttribute("instructor", this.instructorService.print2());
		return "admin/admin_opensubject";
	}

	// 개설 과목 등록
	@RequestMapping("/opensubject/insert")
	public String openSubjectInsert(OpenSubject os, RedirectAttributes rttr) {

		String txt = "fail";
		int result = this.openSubjectService.insert(os);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return "redirect:/admin/opensubject";
	}

	// 과목 삭제
	@RequestMapping("/opensubject/delete")
	public String openSubjectDelete(OpenSubject os, RedirectAttributes rttr) {

		String txt = "fail";
		int result = this.openSubjectService.delete(os);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return "redirect:/admin/opensubject";
	}

	// 과목 수정
	@RequestMapping("/opensubject/update")
	public String openSubjectUpdate(OpenSubject os, RedirectAttributes rttr) {

		String txt = "fail";
		int result = this.openSubjectService.update(os);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return "redirect:/admin/opensubject";
	}

	// 개설 과목 정보 검색
	@RequestMapping("/opensubject/search")
	public String openSubjectSearch1(String key, String value, Model model) {
		model.addAttribute("list", this.openSubjectService.search1(key, value));
		return "admin/admin_opensubject";
	}

	// ---------------------------------------------------------------------
	// admin_student_mng1.jsp
	// 전체 수강생 출력
	@RequestMapping("/student/mng1")
	public String studentmng1List(Model model) {
		model.addAttribute("list", this.studentService.printj1());
		return "admin/admin_student_mng1";
	}

	// 수강생 등록
	@RequestMapping(value = "/student/mng1/insert", method = RequestMethod.POST)
	public String studentmng1Insert(Student s, RedirectAttributes rttr) throws IOException {
		System.out.println("파일 업로드 액션 처리중!");
		System.out.println(s.getStudent_photo_file().getOriginalFilename());
		String uploadPath = this.context.getRealPath("") + "resources/img" + File.separator;
		System.out.println(uploadPath);
		String temp = s.getStudent_photo_file().getOriginalFilename();
		String ext = temp.substring(temp.lastIndexOf("."));
		String newFileName = "img_" + java.util.UUID.randomUUID() + ext;
		FileCopyUtils.copy(s.getStudent_photo_file().getBytes(), new File(uploadPath + newFileName));
		s.setStudent_photo_filepath(newFileName);

		String txt = "fail";
		int result = this.studentService.insert(s);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return "redirect:/admin/student/mng1";
	}

	// 수강생 삭제
	@RequestMapping("/student/mng1/delete")
	public String studentmng1Delete(Student s, RedirectAttributes rttr) {

		String txt = "fail";
		int result = this.studentService.delete(s);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return "redirect:/admin/student/mng1";
	}

	// 수강생 수정
	@RequestMapping(value = "/student/mng1/update", method = RequestMethod.POST)
	public String studentmng1Update1(Student s, RedirectAttributes rttr) throws IOException {
		System.out.println("파일 업로드 액션 처리중!");
		System.out.println(s.getStudent_photo_file().getOriginalFilename());
		String uploadPath = this.context.getRealPath("") + "resources/img" + File.separator;
		System.out.println(uploadPath);
		String temp = s.getStudent_photo_file().getOriginalFilename();
		String ext = temp.substring(temp.lastIndexOf("."));
		String newFileName = "img_" + java.util.UUID.randomUUID() + ext;
		FileCopyUtils.copy(s.getStudent_photo_file().getBytes(), new File(uploadPath + newFileName));
		s.setStudent_photo_filepath(newFileName);

		String txt = "fail";
		int result = this.studentService.update(s);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return "redirect:/admin/student/mng1";
	}

	// 비밀번호 초기화
	@RequestMapping("/student/mng1/pwupdate")
	public String studentmng1Update2(Student s, RedirectAttributes rttr) {

		String txt = "fail";
		int result = 0;

		if (s.getStudent_new_pw().equals(s.getStudent_new_pw2())) {
			result = this.studentService.changepw(s);
		}

		if (result == 1) {
			txt = "success";
		}

		rttr.addFlashAttribute("result", txt);

		return "redirect:/admin/student/mng1";
	}

	// 수강생 검색
	@RequestMapping("/student/mng1/search")
	public String studentmng1Search1(String key, String value, Model model) {

		model.addAttribute("list", this.studentService.search(key, value));

		return "admin/admin_student_mng1";
	}

	// ---------------------------------------------------------------------
	// admin_student_mng2.jsp
	// 수강생 출력
	@RequestMapping("/student/mng2")
	public String studentmng2List(OpenCourse oc, Exam exam, Model model) {
		System.out.println("1");
		model.addAttribute("list", this.examService.print2(exam));
		model.addAttribute("openCourse", this.openCourseService.print1());
		model.addAttribute("studentCourse", this.openCourseService.printj1(oc));

		return "admin/admin_student_mng2";
	}

	// 수강생 과정 등록
	@RequestMapping("/student/mng2/insert")
	public String studentmng2Insert(Student s, RedirectAttributes rttr) {

		String txt = "fail";
		int result = this.studentService.insertCourse(s);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return String.format("redirect:/admin/student/mng2?student_id=%s", s.getStudent_id());
	}

	// 수강생 과정 삭제
	@RequestMapping("/student/mng2/delete")
	public String studentmng2Delete(Student s, RedirectAttributes rttr) {

		String txt = "fail";
		int result = this.studentService.deleteCourse(s);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return String.format("redirect:/admin/student/mng2?student_id=%s", s.getStudent_id());
	}

	// 수강생 과정 수정
	@RequestMapping("/student/mng2/update")
	public String studentmng2Update1(Student s, RedirectAttributes rttr) {

		String txt = "fail";
		int result = this.studentService.insertDrop(s);
		if (result == 1) {
			txt = "success";
		}
		rttr.addFlashAttribute("result", txt);

		return String.format("redirect:/admin/student/mng2?student_id=%s", s.getStudent_id());
	}

	// AJAX(중도탈락 페이지)
	@RequestMapping(value = "/student/mng2Ajax", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public List<OpenCourse> mng2Ajax(OpenCourse oc) {

		List<OpenCourse> ocList = this.openCourseService.printj2(oc);

		return ocList;
	}
	
	// 수강생 과정 검색
	@RequestMapping("/student/mng2/search")
	public String studentmng2Search1(String key, String value, Model model) {
		return "redirect:/studentmng2/list";
	}
	/*--------------------------------------------------*/
	
	// 현아
	/* 33333333333333333333333333333333333333333333333333 */

	// 개설 과정 정보 출력
	@RequestMapping("/grade/opencourse1")
	public String openCourseList1(Model model) {
		model.addAttribute("list", this.openCourseService.print1());
		return "admin/admin_grade_opencourse1";
	}

	// 개설 과정 정보 검색
	@RequestMapping("/opencourse/search")
	public String openCourseSearch(String key, String value, Model model) {
		model.addAttribute("list", this.openCourseService.search1(key, value));
		return "admin/admin_grade_opencourse1";
	}

	// 개설 과목 정보 출력
	@RequestMapping("/grade/opencourse2")
	public String openSubjectList2(Model model, String oc_id) {
		model.addAttribute("title", this.openCourseService.title(oc_id));
		model.addAttribute("list", this.openSubjectService.print3(oc_id));
		return "admin/admin_grade_opencourse2";
	}

	//개설 과목 시험 정보 출력
	// AJAX(개설 과목 시험 정보)
	@RequestMapping(value = "/osExamAjax", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public List<Exam> osExamAjax(Exam exam) {
		List<Exam> examList = this.examService.print1(exam);
		return examList;
	}
	
	//학생 성적 정보 출력
	// AJAX
	@RequestMapping(value = "/studentScoreAjax", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public List<Exam> studentScoreAjax(Exam exam) {
		List<Exam> studentScoreList = this.examService.print4_1(exam);
		return studentScoreList;
	}

	// 수강생 정보 출력
	@RequestMapping("/grade/student1")
	public String studentList(Model model) {
		model.addAttribute("list", this.studentService.print1());
		return "admin/admin_grade_student1";
	}

	// 수강생 정보 검색
	@RequestMapping("/grade_student1/search")
	public String studentSearch(String key, String value, Model model) {
		model.addAttribute("list", this.studentService.search(key, value));
		return "admin/admin_grade_student1";
	}

	// 특정 수강생 수강 과정 정보 출력
	@RequestMapping("/grade/student2")
	public String studentOpencourseList(Model model, String student_id) {
		model.addAttribute("title", this.studentService.title(student_id));
		model.addAttribute("list", this.openCourseService.print2(student_id));
		return "admin/admin_grade_student2";
	}

	
	// 특정 개설과정의 개설 과목 정보 출력
	// AJAX
	@RequestMapping(value = "/osAjax", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public List<OpenSubject> opensubjectList(OpenCourse opencourse) {
		List<OpenSubject> opensubjectList = this.openSubjectService.print3(opencourse);
		return opensubjectList;
	}

	// 특정 수강생의 특정 개설과목 시험 정보 출력
	@RequestMapping(value = "/studentScoreAjax2", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public List<Exam> studentScoreList2(Exam exam) {
		List<Exam> studentScoreList2 = this.examService.print5(exam);
		return studentScoreList2;
	}
	/*--------------------------------------------------*/
}
