package com.hdsx.jxzhpt.lwxm.xmjck.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 项目基础库——病害隧道
 * @author LHP
 *
 */
public class Jckbhsd implements Serializable{

	private static final long serialVersionUID = 1L;
	private String id;
	private String sdmc;//隧道名称
	private String sddm;//隧道代码
	private String xzqhmc;//行政区划名称
	private String xzqhdm;//行政区划代码
	private String lxmc;//路线名称
	private String lxbm;//路线编码
	private String gydw;//管养单位
	private String gydwbm;
	private String gydwdm;
	private String xjgjnd;//修建改建年度
	private String jsdj;//技术等级
	private String pddj;//评定等级
	private String pdtime;//评定等级
	private String sdzxzh;//隧道中心桩号
	private String sdkd;//隧道宽度
	private String sdcd;//隧道长度
	private String sdgd;//隧道高度
	private String acdfl;//按长度分类
	private String bhnr;//病害内容
	private String bz;//备注
	private String tbbmbm;//填报部门
	private Date tbsj;//填报时间
	private String xmnf;//项目年份
	private String xmtype;
	private String sbzt;//上报状态
	private Date sbsj;//上报时间
	private String sbbm;//上报部门
	private String shzt;//审核状态
	private Date shsj;//审核时间
	private String shbm;//审核部门
	private int sbthcd;
	private int page;
	private int rows;
	private String sbzt2;
	private String jswd;//进遂纬度
	private String jsjd;//进遂经度
	private String bhbw;//病害部位
	
	private String xmmc;//项目名称
	private String jsxz;//建设性质
	private String jsnx;//建设年限
	private String thyj;//退回意见
	private String sdzt;//审定状态
	private String xtType;//系统类型 nc or lx
	
	private String nsddm;
	private String nlxbm;
	private String nsdzxzh;
	private String nlxmc;
	private String qlzxzh;
	
	public String getQlzxzh() {
		return qlzxzh;
	}

	public void setQlzxzh(String qlzxzh) {
		this.qlzxzh = qlzxzh;
	}

	public Jckbhsd(){}
	
	public Jckbhsd(String id){
		this.id=id;
	}

	
	public String getPdtime() {
		return pdtime;
	}

	public void setPdtime(String pdtime) {
		this.pdtime = pdtime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSdmc() {
		return sdmc;
	}

	public void setSdmc(String sdmc) {
		this.sdmc = sdmc;
	}

	public String getSddm() {
		return sddm;
	}

	public void setSddm(String sddm) {
		this.sddm = sddm;
	}

	public String getXzqhmc() {
		return xzqhmc;
	}

	public void setXzqhmc(String xzqhmc) {
		this.xzqhmc = xzqhmc;
	}

	public String getXzqhdm() {
		return xzqhdm;
	}

	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
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

	public String getGydw() {
		return gydw;
	}

	public void setGydw(String gydw) {
		this.gydw = gydw;
	}

	public String getGydwbm() {
		return gydwbm;
	}

	public void setGydwbm(String gydwbm) {
		this.gydwbm = gydwbm;
	}

	public String getGydwdm() {
		return gydwdm;
	}

	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}

	public String getXjgjnd() {
		return xjgjnd;
	}

	public void setXjgjnd(String xjgjnd) {
		this.xjgjnd = xjgjnd;
	}

	public String getJsdj() {
		return jsdj;
	}

	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}

	public String getPddj() {
		return pddj;
	}

	public void setPddj(String pddj) {
		this.pddj = pddj;
	}

	public String getSdzxzh() {
		return sdzxzh;
	}

	public void setSdzxzh(String sdzxzh) {
		this.sdzxzh = sdzxzh;
	}

	public String getSdkd() {
		return sdkd;
	}

	public void setSdkd(String sdkd) {
		this.sdkd = sdkd;
	}

	public String getSdcd() {
		return sdcd;
	}

	public void setSdcd(String sdcd) {
		this.sdcd = sdcd;
	}

	public String getSdgd() {
		return sdgd;
	}

	public void setSdgd(String sdgd) {
		this.sdgd = sdgd;
	}

	public String getAcdfl() {
		return acdfl;
	}

	public void setAcdfl(String acdfl) {
		this.acdfl = acdfl;
	}

	public String getBhnr() {
		return bhnr;
	}

	public void setBhnr(String bhnr) {
		this.bhnr = bhnr;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
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

	public String getJswd() {
		return jswd;
	}

	public void setJswd(String jswd) {
		this.jswd = jswd;
	}

	public String getJsjd() {
		return jsjd;
	}

	public void setJsjd(String jsjd) {
		this.jsjd = jsjd;
	}

	public String getBhbw() {
		return bhbw;
	}

	public void setBhbw(String bhbw) {
		this.bhbw = bhbw;
	}

	public String getXmmc() {
		return xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}

	public String getJsxz() {
		return jsxz;
	}

	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}

	public String getJsnx() {
		return jsnx;
	}

	public void setJsnx(String jsnx) {
		this.jsnx = jsnx;
	}

	public String getThyj() {
		return thyj;
	}

	public void setThyj(String thyj) {
		this.thyj = thyj;
	}

	public String getSdzt() {
		return sdzt;
	}

	public void setSdzt(String sdzt) {
		this.sdzt = sdzt;
	}

	public String getXtType() {
		return xtType;
	}

	public void setXtType(String xtType) {
		this.xtType = xtType;
	}

	public String getNsddm() {
		return nsddm;
	}

	public void setNsddm(String nsddm) {
		this.nsddm = nsddm;
	}

	public String getNlxbm() {
		return nlxbm;
	}

	public void setNlxbm(String nlxbm) {
		this.nlxbm = nlxbm;
	}

	public String getNsdzxzh() {
		return nsdzxzh;
	}

	public void setNsdzxzh(String nsdzxzh) {
		this.nsdzxzh = nsdzxzh;
	}

	public String getNlxmc() {
		return nlxmc;
	}

	public void setNlxmc(String nlxmc) {
		this.nlxmc = nlxmc;
	}
	
	
	
	
	
	
}
