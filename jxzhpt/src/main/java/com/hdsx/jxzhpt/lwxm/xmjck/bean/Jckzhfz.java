package com.hdsx.jxzhpt.lwxm.xmjck.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 项目基础库——灾害防治实体
 * @author Administrator
 *
 */
public class Jckzhfz implements Serializable{
	private String gldj;
	private String jsdj;
	private String xmklx;
	private String lsjl;
	private String lsxmxx;
	private String ylxbm;//灾害防治-原路线编码
	private String yqdzh;//灾害防治-原起点桩号
	private String yzdzh;//灾害防治-原止点桩号
	private String ylxmc;//灾害防治-原路线名称
	private String lxbh;//灾害防治路线编码别称

	public String getLxbh() {
		return lxbh;
	}
	public void setLxbh(String lxbh) {
		this.lxbh = lxbh;
	}
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl;
	}
	public String getLsxmxx() {
		return lsxmxx;
	}
	public void setLsxmxx(String lsxmxx) {
		this.lsxmxx = lsxmxx;
	}
	public String getXmklx() {
		return xmklx;
	}
	public void setXmklx(String xmklx) {
		this.xmklx = xmklx;
	}
	public String getGldj() {
		return gldj;
	}
	public void setGldj(String gldj) {
		this.gldj = gldj;
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}
    //新添加
	public String getYlxbm() {
		return ylxbm;
	}
	public void setYlxbm(String ylxbm) {
		this.ylxbm = ylxbm;
	}
	public String getYqdzh() {
		return yqdzh;
	}
	public void setYqdzh(String yqdzh) {
		this.yqdzh = yqdzh;
	}
	public String getYzdzh() {
		return yzdzh;
	}
	public void setYzdzh(String yzdzh) {
		this.yzdzh = yzdzh;
	}
	public String getYlxmc() {
		return ylxmc;
	}
	public void setYlxmc(String ylxmc) {
		this.ylxmc = ylxmc;
	}

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
	private String sbzt;
	private Date sbsj;
	private String sbbm;
	private String shzt;
	private Date shsj;
	private String shbm;
	private String bz;
	private int sbthcd;
	private String tsdq;
	private int page;
	private int rows;
	private String sbzt2;
	private String gydwlx;
	
	public String getGydwlx() {
		return gydwlx;
	}
	public void setGydwlx(String gydwlx) {
		this.gydwlx = gydwlx;
	}
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
	public String getSbzt() {
		return sbzt;
	}
	public void setSbzt(String sbzt) {
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
	public String getShzt() {
		return shzt;
	}
	public void setShzt(String shzt) {
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
	public int getSbthcd() {
		return sbthcd;
	}
	public void setSbthcd(int sbthcd) {
		this.sbthcd = sbthcd;
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
	public String getSbzt2() {
		return sbzt2;
	}
	public void setSbzt2(String sbzt2) {
		this.sbzt2 = sbzt2;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	@Override
	public String toString() {
		return "Jckzhfz [gldj=" + gldj + ", jsdj=" + jsdj + ", xmklx=" + xmklx
				+ ", lsjl=" + lsjl + ", lsxmxx=" + lsxmxx + ", ylxbm=" + ylxbm
				+ ", yqdzh=" + yqdzh + ", yzdzh=" + yzdzh + ", ylxmc=" + ylxmc
				+ ", id=" + id + ", gydwdm=" + gydwdm + ", gydwbm=" + gydwbm
				+ ", gydw=" + gydw + ", xzqhdm=" + xzqhdm + ", xzqhmc="
				+ xzqhmc + ", lxjsdj=" + lxjsdj + ", lxbm=" + lxbm + ", lxmc="
				+ lxmc + ", qdzh=" + qdzh + ", zdzh=" + zdzh + ", qzlc=" + qzlc
				+ ", yhlc=" + yhlc + ", gjxjnd=" + gjxjnd + ", yhnr=" + yhnr
				+ ", tbbmbm=" + tbbmbm + ", tbsj=" + tbsj + ", xmnf=" + xmnf
				+ ", xmtype=" + xmtype + ", sbzt=" + sbzt + ", sbsj=" + sbsj
				+ ", sbbm=" + sbbm + ", shzt=" + shzt + ", shsj=" + shsj
				+ ", shbm=" + shbm + ", bz=" + bz + ", sbthcd=" + sbthcd
				+ ", tsdq=" + tsdq + ", page=" + page + ", rows=" + rows
				+ ", sbzt2=" + sbzt2 + ", gydwlx=" + gydwlx + "]";
	}
}
