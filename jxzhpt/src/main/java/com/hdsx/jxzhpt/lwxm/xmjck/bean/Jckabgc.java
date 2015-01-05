package com.hdsx.jxzhpt.lwxm.xmjck.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 项目基础库——安保工程实体
 * @author lhp
 *
 */
public class Jckabgc implements Serializable{

	private static final long serialVersionUID = 1L;
	private String id;
	private String gydwdm;
	private String gydwbm;
	private String gydw;
	private String xzqhdm;
	private String xzqhmc;
	private String lxjsdj;
	private String lxbm;
	private String lxmc;
	private String qdzh;
	private String zdzh;
	private String qzlc;
	private String yhlc;
	private String gjxjnd;
	private String yhnr;
	private String tbbmbm;	//填报部门编码
	private Date tbsj;
	private String xmnf;
	private String xmtype;  //项目状态
	private Integer sbzt;
	private Date sbsj;
	private String sbbm;
	private Integer shzt;
	private Date shsj;
	private String shbm;
	private String bz;
	
	private int page;
	private int rows;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
	public String getGydwbm() {
		return gydwbm;
	}
	public void setGydwbm(String gydwbm) {
		this.gydwbm = gydwbm;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
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
	public String getLxjsdj() {
		return lxjsdj;
	}
	public void setLxjsdj(String lxjsdj) {
		this.lxjsdj = lxjsdj;
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
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
	public String getYhlc() {
		return yhlc;
	}
	public void setYhlc(String yhlc) {
		this.yhlc = yhlc;
	}
	public String getGjxjnd() {
		return gjxjnd;
	}
	public void setGjxjnd(String gjxjnd) {
		this.gjxjnd = gjxjnd;
	}
	public String getYhnr() {
		return yhnr;
	}
	public void setYhnr(String yhnr) {
		this.yhnr = yhnr;
	}
	public String getTbbmbm() {
		return tbbmbm;
	}
	public void setTbbmbm(String tbbmbm) {
		this.tbbmbm = tbbmbm;
	}
	public Date getTbsj() {
		return tbsj;
	}
	public void setTbsj(Date tbsj) {
		this.tbsj = tbsj;
	}
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getXmtype() {
		return xmtype;
	}
	public void setXmtype(String xmtype) {
		this.xmtype = xmtype;
	}
	public Integer getSbzt() {
		return sbzt;
	}
	public void setSbzt(Integer sbzt) {
		this.sbzt = sbzt;
	}
	public Date getSbsj() {
		return sbsj;
	}
	public void setSbsj(Date sbsj) {
		this.sbsj = sbsj;
	}
	public String getSbbm() {
		return sbbm;
	}
	public void setSbbm(String sbbm) {
		this.sbbm = sbbm;
	}
	public Integer getShzt() {
		return shzt;
	}
	public void setShzt(Integer shzt) {
		this.shzt = shzt;
	}
	public Date getShsj() {
		return shsj;
	}
	public void setShsj(Date shsj) {
		this.shsj = shsj;
	}
	public String getShbm() {
		return shbm;
	}
	public void setShbm(String shbm) {
		this.shbm = shbm;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
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
	@Override
	public String toString() {
		return "Abgc [id=" + id + ", gydwdm=" + gydwdm + ", gydwbm=" + gydwbm
				+ ", gydw=" + gydw + ", xzqhdm=" + xzqhdm + ", xzqhmc="
				+ xzqhmc + ", lxjsdj=" + lxjsdj + ", lxbm=" + lxbm + ", lxmc="
				+ lxmc + ", qdzh=" + qdzh + ", zdzh=" + zdzh + ", qzlc=" + qzlc
				+ ", yhlc=" + yhlc + ", gjxjnd=" + gjxjnd + ", yhnr=" + yhnr
				+ ", tbbmbm=" + tbbmbm + ", tbsj=" + tbsj + ", xmnf=" + xmnf
				+ ", xmtype=" + xmtype + ", sbzt=" + sbzt + ", sbsj=" + sbsj
				+ ", sbbm=" + sbbm + ", shzt=" + shzt + ", shsj=" + shsj
				+ ", shbm=" + shbm + ", bz=" + bz + ", page=" + page
				+ ", rows=" + rows + "]";
	}
	
}
