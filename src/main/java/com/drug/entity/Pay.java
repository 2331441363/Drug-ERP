package com.drug.entity;

import java.util.Date;

public class Pay {
	//编号
	private Integer pay_id;
	//付款日期
	private Date pay_date;
	//付款人
	private String pay_person;
	//部门
	private String dept;
	//分店
	private String pay_branch;
	//公司账户
	private String company_account;
	//付款金额
	private double money;
	//付款类型
	private String pay_type;
	//付款备注
	private String pay_note;
	
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public String getPay_person() {
		return pay_person;
	}
	public void setPay_person(String pay_person) {
		this.pay_person = pay_person;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getPay_branch() {
		return pay_branch;
	}
	public void setPay_branch(String pay_branch) {
		this.pay_branch = pay_branch;
	}
	public String getCompany_account() {
		return company_account;
	}
	public void setCompany_account(String company_account) {
		this.company_account = company_account;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public String getPay_note() {
		return pay_note;
	}
	public void setPay_note(String pay_note) {
		this.pay_note = pay_note;
	}
	public Integer getPay_id() {
		return pay_id;
	}
	public void setPay_id(Integer pay_id) {
		this.pay_id = pay_id;
	}
	
	
	public Pay(Integer pay_id, Date pay_date, String pay_person, String dept, String pay_branch, String company_account,
			double money, String pay_type, String pay_note) {
		super();
		this.pay_id = pay_id;
		this.pay_date = pay_date;
		this.pay_person = pay_person;
		this.dept = dept;
		this.pay_branch = pay_branch;
		this.company_account = company_account;
		this.money = money;
		this.pay_type = pay_type;
		this.pay_note = pay_note;
	}
	
	
	public Pay(Date pay_date, String pay_person, String dept, String pay_branch, String company_account, double money,
			String pay_type, String pay_note) {
		super();
		this.pay_date = pay_date;
		this.pay_person = pay_person;
		this.dept = dept;
		this.pay_branch = pay_branch;
		this.company_account = company_account;
		this.money = money;
		this.pay_type = pay_type;
		this.pay_note = pay_note;
	}
	public Pay() {}
	
}
