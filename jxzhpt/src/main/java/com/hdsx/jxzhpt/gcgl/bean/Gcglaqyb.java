package com.hdsx.jxzhpt.gcgl.bean;

import java.io.Serializable;

public class Gcglaqyb implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String xspath;//显示文件名
	private String sendingunits;//下发单位
	private String uploadpath;//上传路径
	private String uploadpeople;//上传人
	private String uploadtime;//时间
	private String filename;//文件名
	private String uploadepartment;//上传部门
	private String remark;//备注
	private String wenhao;//文号
	private String reportmonth;//上报年月
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXspath() {
		return xspath;
	}
	public void setXspath(String xspath) {
		this.xspath = xspath;
	}
	public String getSendingunits() {
		return sendingunits;
	}
	public void setSendingunits(String sendingunits) {
		this.sendingunits = sendingunits;
	}
	public String getUploadpath() {
		return uploadpath;
	}
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}
	public String getUploadpeople() {
		return uploadpeople;
	}
	public void setUploadpeople(String uploadpeople) {
		this.uploadpeople = uploadpeople;
	}
	public String getUploadtime() {
		return uploadtime;
	}
	public void setUploadtime(String uploadtime) {
		this.uploadtime = uploadtime;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUploadepartment() {
		return uploadepartment;
	}
	public void setUploadepartment(String uploadepartment) {
		this.uploadepartment = uploadepartment;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getWenhao() {
		return wenhao;
	}
	public void setWenhao(String wenhao) {
		this.wenhao = wenhao;
	}
	public String getReportmonth() {
		return reportmonth;
	}
	public void setReportmonth(String reportmonth) {
		this.reportmonth = reportmonth;
	}

	
}
