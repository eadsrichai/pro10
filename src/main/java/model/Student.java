package model;

public class Student {
	private String id;
	private String pre;
	private String fname;
	private String lname;
	private int age;
	private Dep dep;
	
	
	public Student() {
	
	}
//	public Student(String id, String pre, String fname, String lname, int age) {
//		this.id = id;
//		this.pre = pre;
//		this.fname = fname;
//		this.lname = lname;
//		this.age = age;
//	}
	
	public String getId() {
		return id;
	}
	public Dep getDep() {
		return dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getPre() {
		return pre;
	}
	public void setPre(String pre) {
		this.pre = pre;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
