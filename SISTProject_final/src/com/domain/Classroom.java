package com.domain;

public class Classroom {
	// Field
	private String classroom_id;			// 강의실 아이디
	private String classroom_name;			// 강의실 이름
	private int max_number;					// 최대 정원
	private int count_;						// 삭제 가능 여부

	// Getter
	public String getClassroom_id() {
		return classroom_id;
	}

	public String getClassroom_name() {
		return classroom_name;
	}

	public int getMax_number() {
		return max_number;
	}

	public int getCount_() {
		return count_;
	}

	// Setter
	public void setClassroom_id(String classroom_id) {
		this.classroom_id = classroom_id;
	}

	public void setClassroom_name(String classroom_name) {
		this.classroom_name = classroom_name;
	}

	public void setMax_number(int max_number) {
		this.max_number = max_number;
	}
	
	public void setCount_(int count_) {
		this.count_ = count_;
	}

}
