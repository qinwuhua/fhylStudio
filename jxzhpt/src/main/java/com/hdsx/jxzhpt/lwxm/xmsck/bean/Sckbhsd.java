package com.hdsx.jxzhpt.lwxm.xmsck.bean;

import java.io.Serializable;
import java.util.Date;
/**\
 * 项目审查库——病害隧道实体
 * @author LHP
 *
 */
public class Sckbhsd implements Serializable{

	private static final long serialVersionUID = 1L;
	private String sckid;
	private String xmkid;
	private String sck_sdcd;
	private String sck_sdkd;
	private String sck_sdgd;
	private String sck_xmnf;//项目年份
	private String tzgs;//投资估算
	private String spwh;//审批文号
	private String spdw;//审批单位
	private String sjdw;//设计单位
	private String sck_jsxz;//建设性质
	private String scbz;//备注
	private String scbmbm;//审核填报部门
	private String sck_sbzt;
	private String sck_sbsj;
	private String sck_sbbm;
	private String sck_shzt;
	private String sck_shsj;
	private String sck_shbm;
	private int page;
	private int rows;
	private int sck_sbthcd;
	private String sck_sbzt2;
	private String lrjh;
	private String zyjsnr;//主要建设内容
private String xmklx;//项目库类型
	
	public String getXmklx() {
		return xmklx;
	}
	public void setXmklx(String xmklx) {
		this.xmklx = xmklx;
	}
	private String sck_sddm;
	private String sck_lxbm;
	private String sck_sdzxzh;
	private String sck_lxmc;
	private String sck_nsddm;
	private String sck_nlxbm;
	private String sck_nsdzxzh;
	private String sck_nlxmc;
	private String sck_thyj;//退回意见
	private String sck_sdzt;//审定状态
	private String xtType;//系统类型 nc or gx	
		
	//基础库字段
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
	private String sbzt2;
	private String jswd;//进遂纬度
	private String jsjd;//进遂经度
	private String bhbw;//病害部位
	private String pdtime;//评定时间
	
	private String xmmc;//项目名称
	private String jsxz;//建设性质
	private String jsnx;//建设年限
	private String thyj;//退回意见
	private String sdzt;//审定状态
	
	private String nsddm;
	private String nlxbm;
	private String nsdzxzh;
	private String nlxmc;
	
	
	
	public Sckbhsd(){}
	
	public Sckbhsd(String sckid){
		this.sckid=sckid;
	}

	
	public String getPdtime() {
		return pdtime;
	}

	public void setPdtime(String pdtime) {
		this.pdtime = pdtime;
	}

	public String getSckid() {
		return sckid;
	}

	public void setSckid(String sckid) {
		this.sckid = sckid;
	}

	public String getXmkid() {
		return xmkid;
	}

	public void setXmkid(String xmkid) {
		this.xmkid = xmkid;
	}

	public String getSck_sdcd() {
		return sck_sdcd;
	}

	public void setSck_sdcd(String sck_sdcd) {
		this.sck_sdcd = sck_sdcd;
	}

	public String getSck_sdkd() {
		return sck_sdkd;
	}

	public void setSck_sdkd(String sck_sdkd) {
		this.sck_sdkd = sck_sdkd;
	}

	public String getSck_sdgd() {
		return sck_sdgd;
	}

	public void setSck_sdgd(String sck_sdgd) {
		this.sck_sdgd = sck_sdgd;
	}

	public String getSck_xmnf() {
		return sck_xmnf;
	}

	public void setSck_xmnf(String sck_xmnf) {
		this.sck_xmnf = sck_xmnf;
	}

	public String getTzgs() {
		return tzgs;
	}

	public void setTzgs(String tzgs) {
		this.tzgs = tzgs;
	}

	public String getSpwh() {
		return spwh;
	}

	public void setSpwh(String spwh) {
		this.spwh = spwh;
	}

	public String getSpdw() {
		return spdw;
	}

	public void setSpdw(String spdw) {
		this.spdw = spdw;
	}

	public String getSjdw() {
		return sjdw;
	}

	public void setSjdw(String sjdw) {
		this.sjdw = sjdw;
	}

	public String getSck_jsxz() {
		return sck_jsxz;
	}

	public void setSck_jsxz(String sck_jsxz) {
		this.sck_jsxz = sck_jsxz;
	}

	public String getScbz() {
		return scbz;
	}

	public void setScbz(String scbz) {
		this.scbz = scbz;
	}

	public String getScbmbm() {
		return scbmbm;
	}

	public void setScbmbm(String scbmbm) {
		this.scbmbm = scbmbm;
	}

	public String getSck_sbzt() {
		return sck_sbzt;
	}

	public void setSck_sbzt(String sck_sbzt) {
		this.sck_sbzt = sck_sbzt;
	}

	public String getSck_sbsj() {
		return sck_sbsj;
	}

	public void setSck_sbsj(String sck_sbsj) {
		this.sck_sbsj = sck_sbsj;
	}

	public String getSck_sbbm() {
		return sck_sbbm;
	}

	public void setSck_sbbm(String sck_sbbm) {
		this.sck_sbbm = sck_sbbm;
	}

	public String getSck_shzt() {
		return sck_shzt;
	}

	public void setSck_shzt(String sck_shzt) {
		this.sck_shzt = sck_shzt;
	}

	public String getSck_shsj() {
		return sck_shsj;
	}

	public void setSck_shsj(String sck_shsj) {
		this.sck_shsj = sck_shsj;
	}

	public String getSck_shbm() {
		return sck_shbm;
	}

	public void setSck_shbm(String sck_shbm) {
		this.sck_shbm = sck_shbm;
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

	public int getSck_sbthcd() {
		return sck_sbthcd;
	}

	public void setSck_sbthcd(int sck_sbthcd) {
		this.sck_sbthcd = sck_sbthcd;
	}

	public String getSck_sbzt2() {
		return sck_sbzt2;
	}

	public void setSck_sbzt2(String sck_sbzt2) {
		this.sck_sbzt2 = sck_sbzt2;
	}

	public String getLrjh() {
		return lrjh;
	}

	public void setLrjh(String lrjh) {
		this.lrjh = lrjh;
	}

	public String getZyjsnr() {
		return zyjsnr;
	}

	public void setZyjsnr(String zyjsnr) {
		this.zyjsnr = zyjsnr;
	}

	public String getSck_sddm() {
		return sck_sddm;
	}

	public void setSck_sddm(String sck_sddm) {
		this.sck_sddm = sck_sddm;
	}

	public String getSck_lxbm() {
		return sck_lxbm;
	}

	public void setSck_lxbm(String sck_lxbm) {
		this.sck_lxbm = sck_lxbm;
	}

	public String getSck_sdzxzh() {
		return sck_sdzxzh;
	}

	public void setSck_sdzxzh(String sck_sdzxzh) {
		this.sck_sdzxzh = sck_sdzxzh;
	}

	public String getSck_lxmc() {
		return sck_lxmc;
	}

	public void setSck_lxmc(String sck_lxmc) {
		this.sck_lxmc = sck_lxmc;
	}

	public String getSck_nsddm() {
		return sck_nsddm;
	}

	public void setSck_nsddm(String sck_nsddm) {
		this.sck_nsddm = sck_nsddm;
	}

	public String getSck_nlxbm() {
		return sck_nlxbm;
	}

	public void setSck_nlxbm(String sck_nlxbm) {
		this.sck_nlxbm = sck_nlxbm;
	}

	public String getSck_nsdzxzh() {
		return sck_nsdzxzh;
	}

	public void setSck_nsdzxzh(String sck_nsdzxzh) {
		this.sck_nsdzxzh = sck_nsdzxzh;
	}

	public String getSck_nlxmc() {
		return sck_nlxmc;
	}

	public void setSck_nlxmc(String sck_nlxmc) {
		this.sck_nlxmc = sck_nlxmc;
	}

	public String getSck_thyj() {
		return sck_thyj;
	}

	public void setSck_thyj(String sck_thyj) {
		this.sck_thyj = sck_thyj;
	}

	public String getSck_sdzt() {
		return sck_sdzt;
	}

	public void setSck_sdzt(String sck_sdzt) {
		this.sck_sdzt = sck_sdzt;
	}

	public String getXtType() {
		return xtType;
	}

	public void setXtType(String xtType) {
		this.xtType = xtType;
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
