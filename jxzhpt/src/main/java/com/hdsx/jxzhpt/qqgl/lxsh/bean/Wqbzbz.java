package com.hdsx.jxzhpt.qqgl.lxsh.bean;

import java.io.Serializable;
import java.util.Date;

public class Wqbzbz implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String qllx;
	private String jsxz;
	private String jsdj;
	private String bzje;
	private String zdkd;
	private String bzjb;
	private String jsdj1;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQllx() {
		return qllx;
	}
	public void setQllx(String qllx) {
		this.qllx = qllx;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}
	public String getBzje() {
		return bzje;
	}
	public void setBzje(String bzje) {
		this.bzje = bzje;
	}
	public String getZdkd() {
		return zdkd;
	}
	public void setZdkd(String zdkd) {
		this.zdkd = zdkd;
	}
	public String getBzjb() {
		return bzjb;
	}
	public void setBzjb(String bzjb) {
		this.bzjb = bzjb;
	}
	public String getJsdj1() {
		return jsdj1;
	}
	public void setJsdj1(String jsdj1) {
		this.jsdj1 = jsdj1;
	}
	@Override
	public String toString() {
		return "Wqbzbz [id=" + id + ", qllx=" + qllx + ", jsxz=" + jsxz
				+ ", jsdj=" + jsdj + ", bzje=" + bzje + ", zdkd=" + zdkd
				+ ", bzjb=" + bzjb + ", jsdj1=" + jsdj1 + "]";
	}
	
}
