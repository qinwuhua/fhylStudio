package com.hdsx.jxzhpt.wjxt.bean;

import java.io.Serializable;
import java.util.Date;

public class Wjgl implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String fbsj;
	private String fbr;
	private String wjmc;
	private String wjgy;
	private String jsdw;
	private String fbdw;
	
	private String wjid;
	private byte[] wjfile;
	private String wjname;

	private int page;
	private int rows;
	private String kssj;
	private String jssj;
	
	public String getKssj() {
		return kssj;
	}
	public void setKssj(String kssj) {
		this.kssj = kssj;
	}
	public String getJssj() {
		return jssj;
	}
	public void setJssj(String jssj) {
		this.jssj = jssj;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFbsj() {
		return fbsj;
	}
	public void setFbsj(String fbsj) {
		this.fbsj = fbsj;
	}
	public String getFbr() {
		return fbr;
	}
	public void setFbr(String fbr) {
		this.fbr = fbr;
	}
	public String getWjmc() {
		return wjmc;
	}
	public void setWjmc(String wjmc) {
		this.wjmc = wjmc;
	}
	public String getWjgy() {
		return wjgy;
	}
	public void setWjgy(String wjgy) {
		this.wjgy = wjgy;
	}
	public String getJsdw() {
		return jsdw;
	}
	public void setJsdw(String jsdw) {
		this.jsdw = jsdw;
	}
	public String getFbdw() {
		return fbdw;
	}
	public void setFbdw(String fbdw) {
		this.fbdw = fbdw;
	}
	public String getWjid() {
		return wjid;
	}
	public void setWjid(String wjid) {
		this.wjid = wjid;
	}
	public byte[] getWjfile() {
		return wjfile;
	}
	public void setWjfile(byte[] wjfile) {
		this.wjfile = wjfile;
	}
	public String getWjname() {
		return wjname;
	}
	public void setWjname(String wjname) {
		this.wjname = wjname;
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

}
