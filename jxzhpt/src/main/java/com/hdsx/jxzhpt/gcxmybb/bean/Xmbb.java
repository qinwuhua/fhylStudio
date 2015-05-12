package com.hdsx.jxzhpt.gcxmybb.bean;

import java.io.Serializable;
import java.util.Date;

public class Xmbb implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String kgzt;
	private String jgzt;
	private String gydw;
	private String gydwmc;
	private String xzqh;
	private String xzqhmc;
	private String jhxdnf;
	private String jszt;
	private String qxkg;
	private String ljbf;
	private String wbf;
	private String xmmc;
	private String tsdq;
	private String tiaojian;
	private String ybny;//月报年月
	private String sbnf;//上报年份
	private String flag;
	private String lxmc;
	
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getSbnf() {
		return sbnf;
	}
	public void setSbnf(String sbnf) {
		this.sbnf = sbnf;
	}
	public String getYbny() {
		return ybny;
	}
	public void setYbny(String ybny) {
		this.ybny = ybny;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getGydwmc() {
		return gydwmc;
	}
	public void setGydwmc(String gydwmc) {
		this.gydwmc = gydwmc;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	public String getXzqhmc() {
		return xzqhmc;
	}
	public void setXzqhmc(String xzqhmc) {
		this.xzqhmc = xzqhmc;
	}
	public String getJhxdnf() {
		return jhxdnf;
	}
	public void setJhxdnf(String jhxdnf) {
		this.jhxdnf = jhxdnf;
	}
	public String getJszt() {
		return jszt;
	}
	public void setJszt(String jszt) {
		this.jszt = jszt;
	}
	public String getQxkg() {
		return qxkg;
	}
	public void setQxkg(String qxkg) {
		this.qxkg = qxkg;
	}
	public String getLjbf() {
		return ljbf;
	}
	public void setLjbf(String ljbf) {
		this.ljbf = ljbf;
	}
	public String getWbf() {
		return wbf;
	}
	public void setWbf(String wbf) {
		this.wbf = wbf;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public String getTiaojian() {
		return tiaojian;
	}
	public void setTiaojian(String tiaojian) {
		this.tiaojian = tiaojian;
	}
	public String getKgzt() {
		return kgzt;
	}
	public void setKgzt(String kgzt) {
		this.kgzt = kgzt;
	}
	public String getJgzt() {
		return jgzt;
	}
	public void setJgzt(String jgzt) {
		this.jgzt = jgzt;
	}
	@Override
	public String toString() {
		return "Xmbb [id=" + id + ", kgzt=" + kgzt + ", jgzt=" + jgzt
				+ ", gydw=" + gydw + ", gydwmc=" + gydwmc + ", xzqh=" + xzqh
				+ ", xzqhmc=" + xzqhmc + ", jhxdnf=" + jhxdnf + ", jszt="
				+ jszt + ", qxkg=" + qxkg + ", ljbf=" + ljbf + ", wbf=" + wbf
				+ ", xmmc=" + xmmc + ", tsdq=" + tsdq + ", tiaojian="
				+ tiaojian + ", ybny=" + ybny + ", sbnf=" + sbnf + "]";
	}
	
}
