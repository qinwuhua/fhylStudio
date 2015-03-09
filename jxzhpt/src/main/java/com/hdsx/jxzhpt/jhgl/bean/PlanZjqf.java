package com.hdsx.jxzhpt.jhgl.bean;

public class PlanZjqf {
	public PlanZjqf(){
		super();
	}
	public PlanZjqf(String id, String nf, String xzqhdm, String zjqf) {
		super();
		this.id = id;
		this.nf = nf;
		this.xzqhdm = xzqhdm;
		this.zjqf = zjqf;
	}
	private String id;//唯一ID
	private String nf;//年份
	private String xzqhdm;//行政区划
	private String zjqf;//此行政区划下级的资金切分情况
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNf() {
		return nf;
	}
	public void setNf(String nf) {
		this.nf = nf;
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
	}
	public String getZjqf() {
		return zjqf;
	}
	public void setZjqf(String zjqf) {
		this.zjqf = zjqf;
	}
}
