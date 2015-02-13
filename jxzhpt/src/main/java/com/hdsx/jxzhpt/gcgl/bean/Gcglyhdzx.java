package com.hdsx.jxzhpt.gcgl.bean;

import java.io.Serializable;
import java.util.Date;

public class Gcglyhdzx implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String jhid;
	private String wc_btz;
	private String wc_stz;
	private String wc_qttz;
	private String zjdw_btz;
	private String zjdw_stz;
	private String zjdw_qttz;
	private String wcqk;
	private String sbyf;
	private String sbsj;
	private String sbbm;
	private String shzt;
	private String shuser;
	private Date shtime;
	private String bywcdc;
	private String bywcjc;
	private String bywcmc;
	private String kgdl;
	private String qksm;
	private String zjje;//追加金额
	private String xgcsyj;//相关处室意见
	private String cscyj;//财审处意见
	
	//车购税  CGSDWZJ  TBYF  TBSJ  TBR
	private String cgsdwzj;
	private String tbyf;
	private String tbsj;
	private String tbr;
	private  byte[] sgxkwjfile;
	private  byte[] jgtcwjfile;
	private  byte[] jgyswjfile;
	private String sbnf;
	private String lxmc;
	private String lxbm;
	private String gydw;
	private String gydwbm;
	private String qdzh;
	private String zdzh;
	private String qzlc;
	private String hdhlc;
	private String xzqhdm;
	private String xzqhmc;
	private String jsdj;
	private String tsdq;
	private String ylmkd;
	private String ylmlx;
	private String ylmhd;
	private String sczmsj;
	private String xchsqk;
	private String qtbz;
	
	private String classify;
	private String reportingfee;
	private String fee;
	private String newfee;
	private String totalinvest;
	private String totalplacefund;
	private String totalsubsidyfund;
	private String accumulativesubsidyfund;
	private String nowyearsubsidyfund;
	private String dianceng;
	private String jiceng;
	private String surface;
	private String mark;
	private String pqi;
	private String planhistorycompara;
	private String aadt;
	private String constructnumber;
	private String replynumber;
	private String devisenumbder;
	private String plandownnumber;
	private String remarks;
	private Date jhxdsj;
	private Date sjkgsj;
	private Date sjwgsj;
	private String kgzt;
	private String jgzt;
	private Date yjwgsj;
	private String jsdw;
	private String sgdw;
	private String jldw;
	private String htje;
	private String sgxkwj;
	private String jgtcwj;
	private String jgyswj;
	private String gys;
	private String wjgyy;
	private String tiaojian;
	private Integer sfsj;
	private String sfth;
	
	private int page;
	private int rows;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	public String getWc_btz() {
		return wc_btz;
	}
	public void setWc_btz(String wc_btz) {
		this.wc_btz = wc_btz;
	}
	public String getWc_stz() {
		return wc_stz;
	}
	public void setWc_stz(String wc_stz) {
		this.wc_stz = wc_stz;
	}
	public String getWc_qttz() {
		return wc_qttz;
	}
	public void setWc_qttz(String wc_qttz) {
		this.wc_qttz = wc_qttz;
	}
	public String getWcqk() {
		return wcqk;
	}
	public void setWcqk(String wcqk) {
		this.wcqk = wcqk;
	}
	public String getSbyf() {
		return sbyf;
	}
	public void setSbyf(String sbyf) {
		this.sbyf = sbyf;
	}
	public String getSbsj() {
		return sbsj;
	}
	public void setSbsj(String sbsj) {
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
	public String getShuser() {
		return shuser;
	}
	public void setShuser(String shuser) {
		this.shuser = shuser;
	}
	public Date getShtime() {
		return shtime;
	}
	public void setShtime(Date shtime) {
		this.shtime = shtime;
	}

	public String getBywcdc() {
		return bywcdc;
	}
	public void setBywcdc(String bywcdc) {
		this.bywcdc = bywcdc;
	}
	public String getBywcjc() {
		return bywcjc;
	}
	public void setBywcjc(String bywcjc) {
		this.bywcjc = bywcjc;
	}
	public String getBywcmc() {
		return bywcmc;
	}
	public void setBywcmc(String bywcmc) {
		this.bywcmc = bywcmc;
	}
	public String getKgdl() {
		return kgdl;
	}
	public void setKgdl(String kgdl) {
		this.kgdl = kgdl;
	}
	public String getQksm() {
		return qksm;
	}
	public void setQksm(String qksm) {
		this.qksm = qksm;
	}
	public String getZjje() {
		return zjje;
	}
	public void setZjje(String zjje) {
		this.zjje = zjje;
	}
	public String getXgcsyj() {
		return xgcsyj;
	}
	public void setXgcsyj(String xgcsyj) {
		this.xgcsyj = xgcsyj;
	}
	public String getCscyj() {
		return cscyj;
	}
	public void setCscyj(String cscyj) {
		this.cscyj = cscyj;
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
	
	public String getZjdw_btz() {
		return zjdw_btz;
	}
	public void setZjdw_btz(String zjdw_btz) {
		this.zjdw_btz = zjdw_btz;
	}
	public String getZjdw_stz() {
		return zjdw_stz;
	}
	public void setZjdw_stz(String zjdw_stz) {
		this.zjdw_stz = zjdw_stz;
	}
	public String getZjdw_qttz() {
		return zjdw_qttz;
	}
	public void setZjdw_qttz(String zjdw_qttz) {
		this.zjdw_qttz = zjdw_qttz;
	}
	public String getCgsdwzj() {
		return cgsdwzj;
	}
	public void setCgsdwzj(String cgsdwzj) {
		this.cgsdwzj = cgsdwzj;
	}
	public String getTbyf() {
		return tbyf;
	}
	public void setTbyf(String tbyf) {
		this.tbyf = tbyf;
	}
	public String getTbsj() {
		return tbsj;
	}
	public void setTbsj(String tbsj) {
		this.tbsj = tbsj;
	}
	public String getTbr() {
		return tbr;
	}
	public void setTbr(String tbr) {
		this.tbr = tbr;
	}
	public String getSbnf() {
		return sbnf;
	}
	public void setSbnf(String sbnf) {
		this.sbnf = sbnf;
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
	public String getHdhlc() {
		return hdhlc;
	}
	public void setHdhlc(String hdhlc) {
		this.hdhlc = hdhlc;
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
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public String getYlmkd() {
		return ylmkd;
	}
	public void setYlmkd(String ylmkd) {
		this.ylmkd = ylmkd;
	}
	public String getYlmlx() {
		return ylmlx;
	}
	public void setYlmlx(String ylmlx) {
		this.ylmlx = ylmlx;
	}
	public String getYlmhd() {
		return ylmhd;
	}
	public void setYlmhd(String ylmhd) {
		this.ylmhd = ylmhd;
	}
	public String getSczmsj() {
		return sczmsj;
	}
	public void setSczmsj(String sczmsj) {
		this.sczmsj = sczmsj;
	}
	public String getXchsqk() {
		return xchsqk;
	}
	public void setXchsqk(String xchsqk) {
		this.xchsqk = xchsqk;
	}
	public String getQtbz() {
		return qtbz;
	}
	public void setQtbz(String qtbz) {
		this.qtbz = qtbz;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public String getReportingfee() {
		return reportingfee;
	}
	public void setReportingfee(String reportingfee) {
		this.reportingfee = reportingfee;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getNewfee() {
		return newfee;
	}
	public void setNewfee(String newfee) {
		this.newfee = newfee;
	}
	public String getTotalinvest() {
		return totalinvest;
	}
	public void setTotalinvest(String totalinvest) {
		this.totalinvest = totalinvest;
	}
	public String getTotalplacefund() {
		return totalplacefund;
	}
	public void setTotalplacefund(String totalplacefund) {
		this.totalplacefund = totalplacefund;
	}
	public String getTotalsubsidyfund() {
		return totalsubsidyfund;
	}
	public void setTotalsubsidyfund(String totalsubsidyfund) {
		this.totalsubsidyfund = totalsubsidyfund;
	}
	public String getAccumulativesubsidyfund() {
		return accumulativesubsidyfund;
	}
	public void setAccumulativesubsidyfund(String accumulativesubsidyfund) {
		this.accumulativesubsidyfund = accumulativesubsidyfund;
	}
	public String getNowyearsubsidyfund() {
		return nowyearsubsidyfund;
	}
	public void setNowyearsubsidyfund(String nowyearsubsidyfund) {
		this.nowyearsubsidyfund = nowyearsubsidyfund;
	}
	public String getDianceng() {
		return dianceng;
	}
	public void setDianceng(String dianceng) {
		this.dianceng = dianceng;
	}
	public String getJiceng() {
		return jiceng;
	}
	public void setJiceng(String jiceng) {
		this.jiceng = jiceng;
	}
	public String getSurface() {
		return surface;
	}
	public void setSurface(String surface) {
		this.surface = surface;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getPqi() {
		return pqi;
	}
	public void setPqi(String pqi) {
		this.pqi = pqi;
	}
	public String getPlanhistorycompara() {
		return planhistorycompara;
	}
	public void setPlanhistorycompara(String planhistorycompara) {
		this.planhistorycompara = planhistorycompara;
	}
	public String getAadt() {
		return aadt;
	}
	public void setAadt(String aadt) {
		this.aadt = aadt;
	}
	public String getConstructnumber() {
		return constructnumber;
	}
	public void setConstructnumber(String constructnumber) {
		this.constructnumber = constructnumber;
	}
	public String getReplynumber() {
		return replynumber;
	}
	public void setReplynumber(String replynumber) {
		this.replynumber = replynumber;
	}
	public String getDevisenumbder() {
		return devisenumbder;
	}
	public void setDevisenumbder(String devisenumbder) {
		this.devisenumbder = devisenumbder;
	}
	public String getPlandownnumber() {
		return plandownnumber;
	}
	public void setPlandownnumber(String plandownnumber) {
		this.plandownnumber = plandownnumber;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Date getJhxdsj() {
		return jhxdsj;
	}
	public void setJhxdsj(Date jhxdsj) {
		this.jhxdsj = jhxdsj;
	}
	public Date getSjkgsj() {
		return sjkgsj;
	}
	public void setSjkgsj(Date sjkgsj) {
		this.sjkgsj = sjkgsj;
	}
	public Date getSjwgsj() {
		return sjwgsj;
	}
	public void setSjwgsj(Date sjwgsj) {
		this.sjwgsj = sjwgsj;
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
	public Date getYjwgsj() {
		return yjwgsj;
	}
	public void setYjwgsj(Date yjwgsj) {
		this.yjwgsj = yjwgsj;
	}
	public String getJsdw() {
		return jsdw;
	}
	public void setJsdw(String jsdw) {
		this.jsdw = jsdw;
	}
	public String getSgdw() {
		return sgdw;
	}
	public void setSgdw(String sgdw) {
		this.sgdw = sgdw;
	}
	public String getJldw() {
		return jldw;
	}
	public void setJldw(String jldw) {
		this.jldw = jldw;
	}
	public String getHtje() {
		return htje;
	}
	public void setHtje(String htje) {
		this.htje = htje;
	}
	public String getSgxkwj() {
		return sgxkwj;
	}
	public void setSgxkwj(String sgxkwj) {
		this.sgxkwj = sgxkwj;
	}
	public String getJgtcwj() {
		return jgtcwj;
	}
	public void setJgtcwj(String jgtcwj) {
		this.jgtcwj = jgtcwj;
	}
	public String getJgyswj() {
		return jgyswj;
	}
	public void setJgyswj(String jgyswj) {
		this.jgyswj = jgyswj;
	}
	public String getGys() {
		return gys;
	}
	public void setGys(String gys) {
		this.gys = gys;
	}
	public String getWjgyy() {
		return wjgyy;
	}
	public void setWjgyy(String wjgyy) {
		this.wjgyy = wjgyy;
	}
	public String getTiaojian() {
		return tiaojian;
	}
	public void setTiaojian(String tiaojian) {
		this.tiaojian = tiaojian;
	}
	
	public Integer getSfsj() {
		return sfsj;
	}
	public void setSfsj(Integer sfsj) {
		this.sfsj = sfsj;
	}
	public String getSfth() {
		return sfth;
	}
	public void setSfth(String sfth) {
		this.sfth = sfth;
	}
	public byte[] getSgxkwjfile() {
		return sgxkwjfile;
	}
	public void setSgxkwjfile(byte[] sgxkwjfile) {
		this.sgxkwjfile = sgxkwjfile;
	}
	public byte[] getJgtcwjfile() {
		return jgtcwjfile;
	}
	public void setJgtcwjfile(byte[] jgtcwjfile) {
		this.jgtcwjfile = jgtcwjfile;
	}
	public byte[] getJgyswjfile() {
		return jgyswjfile;
	}
	public void setJgyswjfile(byte[] jgyswjfile) {
		this.jgyswjfile = jgyswjfile;
	}

	
}
