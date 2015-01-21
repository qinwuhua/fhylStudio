package com.hdsx.jxzhpt.gcgl.bean;

import java.io.Serializable;
import java.util.Date;

public class Gcglwqgz implements Serializable {

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
	private String bywcmc;
	private String kgdl;
	private String qksm;
	private String zjje;//追加金额
	private String xgcsyj;//相关处室意见
	private String cscyj;//财审处意见
	private String tiaojian;
	//车购税  CGSDWZJ  TBYF  TBSJ  TBR
	private String cgsdwzj;
	private String tbyf;
	private String tbsj;
	private String tbr;
	
	//基础库
	private String qlmc;
	private String qlbh;
	private String qlzxzh;
	private String xzqhmc;
	private String xzqhdm;
	private String gydw;
	private String lxmc;
	private String lxbm;
	private String qlkd;
	private String qlqc;
	private String kjzc;
	private String dkzdkj;
	private String jsdj;
	private String pddj;
	private String xjgjnd;
	private String akjfl;
	private String sbjgxs;
	private String xmnf;
	private String xmtype;
	private String ptx;
	private String pty;
	private String bhnr;
	private String bz;
	private String tsdq;
	//审查库
	private String tzgs;
	private String spwh;
	private String fapgdw;
	private String fascdw;
	private String faspsj;
	private String jsxz;
	private String jsnr;
	private String scbz;
	//计划库
	private String sbnf;
	private Date jhkgsj;
	private Date jhwgsj;
	private String sjdw;
	private String sjpfdw;
	private String pfwh;
	private Date pfsj;
	private String pfztz;
	private String jhsybzje;
	private String jhsydfzcje;
	private String sfsqablbz;
	private String ablbzsqwh;
	private String gkbglj;
	private String gkbgmc; 
	private String sjsgtmc;
	private String sjsgtlj;
	private String jhbz;//计划备注

	private Date xdsj;
	private Date sjkgsj;
	private Date yjjgsj;
	private String sgdw;
	private String jldw;
	private String jsdw;
	private String gys;
	private String htje;
	private Date sjwgsj;
	private String kgzt;
	private String jgzt;
	private String wjgyy;
	
	private String sgxkwj;
	private String jgtcwj;
	private String jgyswj;

	private String sfsj;
	private String sfth;
	
	
	public String getQlmc() {
		return qlmc;
	}
	public void setQlmc(String qlmc) {
		this.qlmc = qlmc;
	}
	public String getQlbh() {
		return qlbh;
	}
	public void setQlbh(String qlbh) {
		this.qlbh = qlbh;
	}
	public String getQlzxzh() {
		return qlzxzh;
	}
	public void setQlzxzh(String qlzxzh) {
		this.qlzxzh = qlzxzh;
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
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
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
	public String getQlkd() {
		return qlkd;
	}
	public void setQlkd(String qlkd) {
		this.qlkd = qlkd;
	}
	public String getQlqc() {
		return qlqc;
	}
	public void setQlqc(String qlqc) {
		this.qlqc = qlqc;
	}
	public String getKjzc() {
		return kjzc;
	}
	public void setKjzc(String kjzc) {
		this.kjzc = kjzc;
	}
	public String getDkzdkj() {
		return dkzdkj;
	}
	public void setDkzdkj(String dkzdkj) {
		this.dkzdkj = dkzdkj;
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
	public String getXjgjnd() {
		return xjgjnd;
	}
	public void setXjgjnd(String xjgjnd) {
		this.xjgjnd = xjgjnd;
	}
	public String getAkjfl() {
		return akjfl;
	}
	public void setAkjfl(String akjfl) {
		this.akjfl = akjfl;
	}
	public String getSbjgxs() {
		return sbjgxs;
	}
	public void setSbjgxs(String sbjgxs) {
		this.sbjgxs = sbjgxs;
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
	public String getPtx() {
		return ptx;
	}
	public void setPtx(String ptx) {
		this.ptx = ptx;
	}
	public String getPty() {
		return pty;
	}
	public void setPty(String pty) {
		this.pty = pty;
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
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
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
	public String getFapgdw() {
		return fapgdw;
	}
	public void setFapgdw(String fapgdw) {
		this.fapgdw = fapgdw;
	}
	public String getFascdw() {
		return fascdw;
	}
	public void setFascdw(String fascdw) {
		this.fascdw = fascdw;
	}
	public String getFaspsj() {
		return faspsj;
	}
	public void setFaspsj(String faspsj) {
		this.faspsj = faspsj;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}
	public String getJsnr() {
		return jsnr;
	}
	public void setJsnr(String jsnr) {
		this.jsnr = jsnr;
	}
	public String getScbz() {
		return scbz;
	}
	public void setScbz(String scbz) {
		this.scbz = scbz;
	}
	public String getSbnf() {
		return sbnf;
	}
	public void setSbnf(String sbnf) {
		this.sbnf = sbnf;
	}
	public Date getJhkgsj() {
		return jhkgsj;
	}
	public void setJhkgsj(Date jhkgsj) {
		this.jhkgsj = jhkgsj;
	}
	public Date getJhwgsj() {
		return jhwgsj;
	}
	public void setJhwgsj(Date jhwgsj) {
		this.jhwgsj = jhwgsj;
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
	public Date getPfsj() {
		return pfsj;
	}
	public void setPfsj(Date pfsj) {
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
	public String getGkbglj() {
		return gkbglj;
	}
	public void setGkbglj(String gkbglj) {
		this.gkbglj = gkbglj;
	}
	public String getSjsgtmc() {
		return sjsgtmc;
	}
	public void setSjsgtmc(String sjsgtmc) {
		this.sjsgtmc = sjsgtmc;
	}
	public String getJhbz() {
		return jhbz;
	}
	public void setJhbz(String jhbz) {
		this.jhbz = jhbz;
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
	public Date getYjjgsj() {
		return yjjgsj;
	}
	public void setYjjgsj(Date yjjgsj) {
		this.yjjgsj = yjjgsj;
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
	public String getGys() {
		return gys;
	}
	public void setGys(String gys) {
		this.gys = gys;
	}
	public String getHtje() {
		return htje;
	}
	public void setHtje(String htje) {
		this.htje = htje;
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
	public String getWjgyy() {
		return wjgyy;
	}
	public void setWjgyy(String wjgyy) {
		this.wjgyy = wjgyy;
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
	
	public String getTiaojian() {
		return tiaojian;
	}
	public void setTiaojian(String tiaojian) {
		this.tiaojian = tiaojian;
	}
	public String getGkbgmc() {
		return gkbgmc;
	}
	public void setGkbgmc(String gkbgmc) {
		this.gkbgmc = gkbgmc;
	}
	public String getSjsgtlj() {
		return sjsgtlj;
	}
	public void setSjsgtlj(String sjsgtlj) {
		this.sjsgtlj = sjsgtlj;
	}
	public String getSfsj() {
		return sfsj;
	}
	public void setSfsj(String sfsj) {
		this.sfsj = sfsj;
	}
	public String getSfth() {
		return sfth;
	}
	public void setSfth(String sfth) {
		this.sfth = sfth;
	}
	
	
}
