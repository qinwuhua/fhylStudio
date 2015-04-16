package com.hdsx.jxzhpt.gcgl.bean;

import java.io.Serializable;
import java.util.Date;

public class Gcglhsly implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String jhid;
	private String bfzj;
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
	
	//
	private String kgn;
	private String wgn;
	private String xmmc;
	private String xzqhdm;
	private String xzqhmc;
	private String jhnf;
	private String jsgmhj;
	private String jsgmy;
	private String jsgme;
	private String jsgms;
	private String jsgmf;
	private String jsgmdldq;
	private String ztz;
	private String zytz;
	private String dfta;
	private String gndk;
	private String lywz;
	private String jsxz;
	private String gkpfwh;
	private String sgtpfwh;
	private String zyjsnr;
	private String xzscl;
	private Date xdsj;
	private Date sjkgsj;
	private Date yjwgsj;
	private Date sjwgsj;
	private String sgdw;
	private String jldw;
	private String jsdw;
	private String htje;
	private String sgxkwj;
	private String jgtcwj;
	private String jgyswj;
	private String wjgyy;
	private String gsztz;
	private String sfqxkg;
	private String kgzt;
	private String jgzt;
	private String tiaojian;
	private Integer sfsj;
	private String sfth;
	private  byte[] sgxkwjfile;
	private  byte[] jgtcwjfile;
	private  byte[] jgyswjfile;
	private int page;
	private int rows;
	
	private String xjzt;
	private String sjzt;
	private String sjsh;
	private String yhtype;
	private String stz;
	private String zdyf;
	private String sfgk;
	private String ssdctc;
	private String bndsslc;
	private String wkglc;
	
	public String getZdyf() {
		return zdyf;
	}
	public void setZdyf(String zdyf) {
		this.zdyf = zdyf;
	}
	public String getSfgk() {
		return sfgk;
	}
	public void setSfgk(String sfgk) {
		this.sfgk = sfgk;
	}
	public String getSsdctc() {
		return ssdctc;
	}
	public void setSsdctc(String ssdctc) {
		this.ssdctc = ssdctc;
	}
	public String getBndsslc() {
		return bndsslc;
	}
	public void setBndsslc(String bndsslc) {
		this.bndsslc = bndsslc;
	}
	public String getWkglc() {
		return wkglc;
	}
	public void setWkglc(String wkglc) {
		this.wkglc = wkglc;
	}
	public String getStz() {
		return stz;
	}
	public void setStz(String stz) {
		this.stz = stz;
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
	public String getBfzj() {
		return bfzj;
	}
	public void setBfzj(String bfzj) {
		this.bfzj = bfzj;
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
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
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
	public String getJhnf() {
		return jhnf;
	}
	public void setJhnf(String jhnf) {
		this.jhnf = jhnf;
	}
	public String getJsgmhj() {
		return jsgmhj;
	}
	public void setJsgmhj(String jsgmhj) {
		this.jsgmhj = jsgmhj;
	}
	public String getJsgmy() {
		return jsgmy;
	}
	public void setJsgmy(String jsgmy) {
		this.jsgmy = jsgmy;
	}
	public String getJsgme() {
		return jsgme;
	}
	public void setJsgme(String jsgme) {
		this.jsgme = jsgme;
	}
	public String getJsgms() {
		return jsgms;
	}
	public void setJsgms(String jsgms) {
		this.jsgms = jsgms;
	}
	public String getJsgmf() {
		return jsgmf;
	}
	public void setJsgmf(String jsgmf) {
		this.jsgmf = jsgmf;
	}
	public String getJsgmdldq() {
		return jsgmdldq;
	}
	public void setJsgmdldq(String jsgmdldq) {
		this.jsgmdldq = jsgmdldq;
	}
	public String getZtz() {
		return ztz;
	}
	public void setZtz(String ztz) {
		this.ztz = ztz;
	}
	public String getZytz() {
		return zytz;
	}
	public void setZytz(String zytz) {
		this.zytz = zytz;
	}
	public String getDfta() {
		return dfta;
	}
	public void setDfta(String dfta) {
		this.dfta = dfta;
	}
	public String getGndk() {
		return gndk;
	}
	public void setGndk(String gndk) {
		this.gndk = gndk;
	}
	public String getLywz() {
		return lywz;
	}
	public void setLywz(String lywz) {
		this.lywz = lywz;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}
	public String getGkpfwh() {
		return gkpfwh;
	}
	public void setGkpfwh(String gkpfwh) {
		this.gkpfwh = gkpfwh;
	}
	public String getSgtpfwh() {
		return sgtpfwh;
	}
	public void setSgtpfwh(String sgtpfwh) {
		this.sgtpfwh = sgtpfwh;
	}
	public String getZyjsnr() {
		return zyjsnr;
	}
	public void setZyjsnr(String zyjsnr) {
		this.zyjsnr = zyjsnr;
	}
	public String getXzscl() {
		return xzscl;
	}
	public void setXzscl(String xzscl) {
		this.xzscl = xzscl;
	}
	public Date getXdsj() {
		return xdsj;
	}
	public void setXdsj(Date xdsj) {
		this.xdsj = xdsj;
	}
	public Date getSjkgsj() {
		return sjkgsj;
	}
	public void setSjkgsj(Date sjkgsj) {
		this.sjkgsj = sjkgsj;
	}
	public Date getYjwgsj() {
		return yjwgsj;
	}
	public void setYjwgsj(Date yjwgsj) {
		this.yjwgsj = yjwgsj;
	}
	public Date getSjwgsj() {
		return sjwgsj;
	}
	public void setSjwgsj(Date sjwgsj) {
		this.sjwgsj = sjwgsj;
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
	public String getJsdw() {
		return jsdw;
	}
	public void setJsdw(String jsdw) {
		this.jsdw = jsdw;
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
	public String getWjgyy() {
		return wjgyy;
	}
	public void setWjgyy(String wjgyy) {
		this.wjgyy = wjgyy;
	}
	public String getGsztz() {
		return gsztz;
	}
	public void setGsztz(String gsztz) {
		this.gsztz = gsztz;
	}
	public String getSfqxkg() {
		return sfqxkg;
	}
	public void setSfqxkg(String sfqxkg) {
		this.sfqxkg = sfqxkg;
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
	public String getKgn() {
		return kgn;
	}
	public void setKgn(String kgn) {
		this.kgn = kgn;
	}
	public String getWgn() {
		return wgn;
	}
	public void setWgn(String wgn) {
		this.wgn = wgn;
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
