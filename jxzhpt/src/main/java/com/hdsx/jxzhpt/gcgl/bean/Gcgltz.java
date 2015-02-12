package com.hdsx.jxzhpt.gcgl.bean;

import java.io.Serializable;
import java.util.Date;

public class Gcgltz implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private Date reporttime;
	private String reportper;
	private String title;
	private String contens;
	private String tjdepartmentcode;
	private String reportperuid;
	private String ckzt;
	private String tzid;
	private byte[] tzfile;
	private String filename;
	private String fszt;
	private String fsdwmc;
	private Date kssj;
	private Date jssj;
	private int page;
	private int rows;
	private  byte[] sgxkwjfile;
	private  byte[] jgtcwjfile;
	private  byte[] jgyswjfile;
	public Date getKssj() {
		return kssj;
	}
	public void setKssj(Date kssj) {
		this.kssj = kssj;
	}
	public Date getJssj() {
		return jssj;
	}
	public void setJssj(Date jssj) {
		this.jssj = jssj;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getReporttime() {
		return reporttime;
	}
	public void setReporttime(Date reporttime) {
		this.reporttime = reporttime;
	}
	public String getReportper() {
		return reportper;
	}
	public void setReportper(String reportper) {
		this.reportper = reportper;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContens() {
		return contens;
	}
	public void setContens(String contens) {
		this.contens = contens;
	}
	public String getTjdepartmentcode() {
		return tjdepartmentcode;
	}
	public void setTjdepartmentcode(String tjdepartmentcode) {
		this.tjdepartmentcode = tjdepartmentcode;
	}
	public String getReportperuid() {
		return reportperuid;
	}
	public void setReportperuid(String reportperuid) {
		this.reportperuid = reportperuid;
	}
	public String getCkzt() {
		return ckzt;
	}
	public void setCkzt(String ckzt) {
		this.ckzt = ckzt;
	}
	public String getTzid() {
		return tzid;
	}
	public void setTzid(String tzid) {
		this.tzid = tzid;
	}
	public byte[] getTzfile() {
		return tzfile;
	}
	public void setTzfile(byte[] tzfile) {
		this.tzfile = tzfile;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getFszt() {
		return fszt;
	}
	public void setFszt(String fszt) {
		this.fszt = fszt;
	}
	public String getFsdwmc() {
		return fsdwmc;
	}
	public void setFsdwmc(String fsdwmc) {
		this.fsdwmc = fsdwmc;
	}
	public byte[] getSgxkwjfile() {
		return sgxkwjfile;
	}
	public void setSgxkwjfile(byte[] sgxkwjfile) {
		this.sgxkwjfile = sgxkwjfile;
	}
	public byte[] getJgtcwjfile() {
		return jgtcwjfile;
	}
	public void setJgtcwjfile(byte[] jgtcwjfile) {
		this.jgtcwjfile = jgtcwjfile;
	}
	public byte[] getJgyswjfile() {
		return jgyswjfile;
	}
	public void setJgyswjfile(byte[] jgyswjfile) {
		this.jgyswjfile = jgyswjfile;
	}
	
}
