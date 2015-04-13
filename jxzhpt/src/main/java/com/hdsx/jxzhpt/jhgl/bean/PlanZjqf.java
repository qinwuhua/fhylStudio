package com.hdsx.jxzhpt.jhgl.bean;

public class PlanZjqf {
	public PlanZjqf(){
		super();
	}
	public PlanZjqf(String id, String gydwbm, String parent, String nf,
			String wqgz, String abgc, String zhfz) {
		super();
		this.id = id;
		this.gydwbm = gydwbm;
		this.parent = parent;
		this.nf = nf;
		this.wqgz = wqgz;
		this.abgc = abgc;
		this.zhfz = zhfz;
	}
	private String id;
	private String gydwbm;
	private String parent;
	private String nf;
	private String wqgz;
	private String abgc;
	private String zhfz;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGydwbm() {
		return gydwbm;
	}
	public void setGydwbm(String gydwbm) {
		this.gydwbm = gydwbm;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getNf() {
		return nf;
	}
	public void setNf(String nf) {
		this.nf = nf;
	}
	public String getWqgz() {
		return wqgz;
	}
	public void setWqgz(String wqgz) {
		this.wqgz = wqgz;
	}
	public String getAbgc() {
		return abgc;
	}
	public void setAbgc(String abgc) {
		this.abgc = abgc;
	}
	public String getZhfz() {
		return zhfz;
	}
	public void setZhfz(String zhfz) {
		this.zhfz = zhfz;
	}
}
