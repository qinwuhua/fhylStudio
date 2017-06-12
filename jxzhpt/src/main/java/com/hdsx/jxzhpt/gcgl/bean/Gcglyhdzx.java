package com.hdsx.jxzhpt.gcgl.bean;

import java.io.Serializable;
import java.util.Date;

public class Gcglyhdzx implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String jgys;
	private String xdzj;
	private String bfzj;
	private String sbzt;
	private String dk;
	private String ghlxbm;
	private String ghqdzh;
	private String ghzdzh;
	private String lxbm1;
	private String qdzh1;
	private String zdzh1;
	private String xmzt;
	
	public String getXmzt() {
		return xmzt;
	}
	public void setXmzt(String xmzt) {
		this.xmzt = xmzt;
	}
	public String getGhlxbm() {
		return ghlxbm;
	}
	public void setGhlxbm(String ghlxbm) {
		this.ghlxbm = ghlxbm;
	}
	public String getGhqdzh() {
		return ghqdzh;
	}
	public void setGhqdzh(String ghqdzh) {
		this.ghqdzh = ghqdzh;
	}
	public String getGhzdzh() {
		return ghzdzh;
	}
	public void setGhzdzh(String ghzdzh) {
		this.ghzdzh = ghzdzh;
	}
	public String getLxbm1() {
		return lxbm1;
	}
	public void setLxbm1(String lxbm1) {
		this.lxbm1 = lxbm1;
	}
	public String getQdzh1() {
		return qdzh1;
	}
	public void setQdzh1(String qdzh1) {
		this.qdzh1 = qdzh1;
	}
	public String getZdzh1() {
		return zdzh1;
	}
	public void setZdzh1(String zdzh1) {
		this.zdzh1 = zdzh1;
	}
	public String getDk() {
		return dk;
	}
	public void setDk(String dk) {
		this.dk = dk;
	}
	public String getSbzt() {
		return sbzt;
	}
	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}
	
	
	public String getXdzj() {
		return xdzj;
	}
	public void setXdzj(String xdzj) {
		this.xdzj = xdzj;
	}
	public String getBfzj() {
		return bfzj;
	}
	public String getJgys() {
		return jgys;
	}
	public void setJgys(String jgys) {
		this.jgys = jgys;
	}
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
	private String cscyj;//审核意见
	private String tbman;//填报人
	
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
	private String gydwmc;
	private String gydwbm;
	private String qdzh;
	private String zdzh;
	private String qzlc;
	private String yhlc;
	private String hdlc;
	private String hdhlc;
	private String xzqhdm;
	private String xzqhmc;
	private String jsdj;
	private String tsdq;
	private String ylmkd;
	private String ylmlx;
	private String ylmhd;
	private String yjsdj;
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
	private String jhxdsj;
	private String sjkgsj;
	private String sjwgsj;
	private String kgzt;
	private String jgzt;
	private String yjwgsj;
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
	
	private String lxjsdj;
	private String faspsj;
	private String spsj;
	private String xmnf;
	private String jsxz;
	private String sjdw;
	private String sjpfdw;
	private String pfwh;
	private String pfsj;
	private String pfztz;
	private String jhsybzje;
	private String jhsydfzcje;
	private String sfsqablbz;
	private String ablbzsqwh;
	private String jhkgsj;
	private String jhwgsj;
	private String xdsj;
	
	//燃油税，厅贷款，其他
	private String rys;
	private String yhdk;
	private String qt;
	
	private String xjzt;
	private String sjzt;
	private String sjsh;
	private int page;
	private int rows;
	private String yhtype;
	private String stj;
	private String sfgk;
	private String stz;
	private String gldj;
	private String ljbfzt;
	private String xmmc;
	
	private String zgshzt;
	private String zgshuser;
	private String zgshyj;
	private String thyy;
	private String zgthyy;
	private Date zgshtime;
	
	public String getZgshzt() {
		return zgshzt;
	}
	public void setZgshzt(String zgshzt) {
		this.zgshzt = zgshzt;
	}
	public String getZgshuser() {
		return zgshuser;
	}
	public void setZgshuser(String zgshuser) {
		this.zgshuser = zgshuser;
	}
	public String getZgshyj() {
		return zgshyj;
	}
	public void setZgshyj(String zgshyj) {
		this.zgshyj = zgshyj;
	}
	public String getThyy() {
		return thyy;
	}
	public void setThyy(String thyy) {
		this.thyy = thyy;
	}
	public String getZgthyy() {
		return zgthyy;
	}
	public void setZgthyy(String zgthyy) {
		this.zgthyy = zgthyy;
	}
	public Date getZgshtime() {
		return zgshtime;
	}
	public void setZgshtime(Date zgshtime) {
		this.zgshtime = zgshtime;
	}
	
	public String getRys() {
		return rys;
	}
	public void setRys(String rys) {
		this.rys = rys;
	}
	
	public String getYhdk() {
		return yhdk;
	}
	public void setYhdk(String yhdk) {
		this.yhdk = yhdk;
	}
	public String getQt() {
		return qt;
	}
	public void setQt(String qt) {
		this.qt = qt;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getGldj() {
		return gldj;
	}
	public void setGldj(String gldj) {
		this.gldj = gldj;
	}
	public String getLjbfzt() {
		return ljbfzt;
	}
	public void setLjbfzt(String ljbfzt) {
		this.ljbfzt = ljbfzt;
	}
	public String getStz() {
		return stz;
	}
	public void setStz(String stz) {
		this.stz = stz;
	}
	public String getSfgk() {
		return sfgk;
	}
	public void setSfgk(String sfgk) {
		this.sfgk = sfgk;
	}
	public String getStj() {
		return stj;
	}
	public void setStj(String stj) {
		this.stj = stj;
	}
	public String getYhtype() {
		return yhtype;
	}
	public void setYhtype(String yhtype) {
		this.yhtype = yhtype;
	}
	public String getXjzt() {
		return xjzt;
	}
	public void setXjzt(String xjzt) {
		this.xjzt = xjzt;
	}
	public String getSjzt() {
		return sjzt;
	}
	public void setSjzt(String sjzt) {
		this.sjzt = sjzt;
	}
	public String getSjsh() {
		return sjsh;
	}
	public void setSjsh(String sjsh) {
		this.sjsh = sjsh;
	}
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
	public String getYhlc() {
		return yhlc;
	}
	public void setYhlc(String yhlc) {
		this.yhlc = yhlc;
	}
	public String getLxjsdj() {
		return lxjsdj;
	}
	public void setLxjsdj(String lxjsdj) {
		this.lxjsdj = lxjsdj;
	}
	public String getFaspsj() {
		return faspsj;
	}
	public void setFaspsj(String faspsj) {
		this.faspsj = faspsj;
	}
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}
	public String getSjdw() {
		return sjdw;
	}
	public void setSjdw(String sjdw) {
		this.sjdw = sjdw;
	}
	public String getSjpfdw() {
		return sjpfdw;
	}
	public void setSjpfdw(String sjpfdw) {
		this.sjpfdw = sjpfdw;
	}
	public String getPfwh() {
		return pfwh;
	}
	public void setPfwh(String pfwh) {
		this.pfwh = pfwh;
	}
	public String getPfsj() {
		return pfsj;
	}
	public void setPfsj(String pfsj) {
		this.pfsj = pfsj;
	}
	public String getPfztz() {
		return pfztz;
	}
	public void setPfztz(String pfztz) {
		this.pfztz = pfztz;
	}
	public String getJhsybzje() {
		return jhsybzje;
	}
	public void setJhsybzje(String jhsybzje) {
		this.jhsybzje = jhsybzje;
	}
	public String getJhsydfzcje() {
		return jhsydfzcje;
	}
	public void setJhsydfzcje(String jhsydfzcje) {
		this.jhsydfzcje = jhsydfzcje;
	}
	public String getSfsqablbz() {
		return sfsqablbz;
	}
	public void setSfsqablbz(String sfsqablbz) {
		this.sfsqablbz = sfsqablbz;
	}
	public String getAblbzsqwh() {
		return ablbzsqwh;
	}
	public void setAblbzsqwh(String ablbzsqwh) {
		this.ablbzsqwh = ablbzsqwh;
	}
	public String getJhkgsj() {
		return jhkgsj;
	}
	public void setJhkgsj(String jhkgsj) {
		this.jhkgsj = jhkgsj;
	}
	public String getJhwgsj() {
		return jhwgsj;
	}
	public void setJhwgsj(String jhwgsj) {
		this.jhwgsj = jhwgsj;
	}
	public String getXdsj() {
		return xdsj;
	}
	public void setXdsj(String xdsj) {
		this.xdsj = xdsj;
	}
	public String getHdlc() {
		return hdlc;
	}
	public void setHdlc(String hdlc) {
		this.hdlc = hdlc;
	}
	public String getYjsdj() {
		return yjsdj;
	}
	public void setYjsdj(String yjsdj) {
		this.yjsdj = yjsdj;
	}
	public String getSpsj() {
		return spsj;
	}
	public void setSpsj(String spsj) {
		this.spsj = spsj;
	}
	public String getGydwmc() {
		return gydwmc;
	}
	public void setGydwmc(String gydwmc) {
		this.gydwmc = gydwmc;
	}
	public String getJhxdsj() {
		return jhxdsj;
	}
	public void setJhxdsj(String jhxdsj) {
		this.jhxdsj = jhxdsj;
	}
	public String getSjkgsj() {
		return sjkgsj;
	}
	public void setSjkgsj(String sjkgsj) {
		this.sjkgsj = sjkgsj;
	}
	public String getSjwgsj() {
		return sjwgsj;
	}
	public void setSjwgsj(String sjwgsj) {
		this.sjwgsj = sjwgsj;
	}
	public String getYjwgsj() {
		return yjwgsj;
	}
	public void setYjwgsj(String yjwgsj) {
		this.yjwgsj = yjwgsj;
	}
	public String getTbman() {
		return tbman;
	}
	public void setTbman(String tbman) {
		this.tbman = tbman;
	}
	public void setBfzj(String bfzj) {
		this.bfzj = bfzj;
	}
	
}
