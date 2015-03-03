package com.hdsx.jxzhpt.jhgl.bean;

import java.util.Date;

public class Plan_lx_yhdzx {
	private String lxid;//路线ID
	private String lxmc;//路线名称
	private String lxbm;//路线编码
	private String qdzh;//起点桩号
	private String zdzh;//止点桩号
	private String qzlc;//起止里程
	private String hdlc;//核对里程
	private String ylmlx;//原路面类型
	private String ylmkd;//原路面宽度
	private String ylmjg;//原路面结构
	private String ylmhd;//原路面厚度
	private String yjsdj;//原技术等级
	private String xzqhdm;//行政区划代码
	private String xzqhmc;//行政区划名称
	private String gydwmc;//管养单位名称
	private String gydwdm;//管养单位代码
	private String tbbm;//填报部门
	private String tbbmdm;//填报部门代码
	private Date tbsj;//填报时间
	private String jhid;//计划ID
	private String tsdq;//特殊地区
	private String bhnr;
	private double dzxkd;//大中修宽度
	private String lmjg;//路面结构数据信息，存储的为json字符串
	private String aym;//按延米数据信息
	private String asl;//按数量数据信息
	private String glf;//管理费数据信息
	public String getLmjg() {
		return lmjg;
	}
	public void setLmjg(String lmjg) {
		this.lmjg = lmjg;
	}
	public String getAym() {
		return aym;
	}
	public void setAym(String aym) {
		this.aym = aym;
	}
	public String getAsl() {
		return asl;
	}
	public void setAsl(String asl) {
		this.asl = asl;
	}
	public String getGlf() {
		return glf;
	}
	public void setGlf(String glf) {
		this.glf = glf;
	}
	public double getDzxkd() {
		return dzxkd;
	}
	public void setDzxkd(double dzxkd) {
		this.dzxkd = dzxkd;
	}
	public String getBhnr() {
		return bhnr;
	}
	public void setBhnr(String bhnr) {
		this.bhnr = bhnr;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public String getLxid() {
		return lxid;
	}
	public void setLxid(String lxid) {
		this.lxid = lxid;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm;
	}
	public String getQdzh() {
		return qdzh;
	}
	public void setQdzh(String qdzh) {
		this.qdzh = qdzh;
	}
	public String getZdzh() {
		return zdzh;
	}
	public void setZdzh(String zdzh) {
		this.zdzh = zdzh;
	}
	public String getQzlc() {
		return qzlc;
	}
	public void setQzlc(String qzlc) {
		this.qzlc = qzlc;
	}
	public String getHdlc() {
		return hdlc;
	}
	public void setHdlc(String hdlc) {
		this.hdlc = hdlc;
	}
	public String getYlmlx() {
		return ylmlx;
	}
	public void setYlmlx(String ylmlx) {
		this.ylmlx = ylmlx;
	}
	public String getYlmkd() {
		return ylmkd;
	}
	public void setYlmkd(String ylmkd) {
		this.ylmkd = ylmkd;
	}
	public String getYlmjg() {
		return ylmjg;
	}
	public void setYlmjg(String ylmjg) {
		this.ylmjg = ylmjg;
	}
	public String getYlmhd() {
		return ylmhd;
	}
	public void setYlmhd(String ylmhd) {
		this.ylmhd = ylmhd;
	}
	public String getYjsdj() {
		return yjsdj;
	}
	public void setYjsdj(String yjsdj) {
		this.yjsdj = yjsdj;
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
	}
	public String getXzqhmc() {
		return xzqhmc;
	}
	public void setXzqhmc(String xzqhmc) {
		this.xzqhmc = xzqhmc;
	}
	public String getGydwmc() {
		return gydwmc;
	}
	public void setGydwmc(String gydwmc) {
		this.gydwmc = gydwmc;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
	public String getTbbm() {
		return tbbm;
	}
	public void setTbbm(String tbbm) {
		this.tbbm = tbbm;
	}
	public String getTbbmdm() {
		return tbbmdm;
	}
	public void setTbbmdm(String tbbmdm) {
		this.tbbmdm = tbbmdm;
	}
	public Date getTbsj() {
		return tbsj;
	}
	public void setTbsj(Date tbsj) {
		this.tbsj = tbsj;
	}
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
}
