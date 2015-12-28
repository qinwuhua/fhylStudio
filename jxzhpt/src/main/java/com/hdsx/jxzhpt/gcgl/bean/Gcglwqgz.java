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
	private String jhkgsj;
	private String jhwgsj;
	private String sjdw;
	private String sjpfdw;
	private String pfwh;
	private String pfsj;
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

	private String xdsj;
	private String sjkgsj;
	private String yjjgsj;
	private String sgdw;
	private String jldw;
	private String jsdw;
	private String gys;
	private String htje;
	private String sjwgsj;
	private String kgzt;
	private String jgzt;
	private String wjgyy;
	private String zbfzj;
	private String nxdzj;
	private String nbfzj;
	private String yhtype;
	private String zxdzj;
	private String zwczj;
	private String tablename;
	
	private String sgxkwj;
	private String jgtcwj;
	private String jgyswj;

	private Integer sfsj;
	private String sfth;
	private String sbthcd;
	
	private String wcqkmax;
	private String wcqkmin;
	
	private String nf;
	private  byte[] sgxkwjfile;
	private  byte[] jgtcwjfile;
	private  byte[] jgyswjfile;
	
	private String xjzt;
	private String sjzt;
	private String sjsh;
	private String stz;
	private String xdwh;
	private String sfylrbwqk;
	private String jhxdwh;
	private String qljsgm;
	private String zjc;
	private String xbgz;
	private String sbjg;
	private String zljdwj;
	private String jhqlqc;
	private String jhqlqk;
	private String zwcbtz;
	private String zwcstz;
	private String shengbz;
	private String gydwtj;
	private String ybzt;
	private String gldj;
	private String ljbfzt;
	private String xzqh;
	private String yhdk;
	private String gz;
	private String sz;
	private String xmlx;
	
	public String getXmlx() {
		return xmlx;
	}
	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}
	public String getYhdk() {
		return yhdk;
	}
	public void setYhdk(String yhdk) {
		this.yhdk = yhdk;
	}
	public String getGz() {
		return gz;
	}
	public void setGz(String gz) {
		this.gz = gz;
	}
	public String getSz() {
		return sz;
	}
	public void setSz(String sz) {
		this.sz = sz;
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
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	public String getYbzt() {
		return ybzt;
	}
	public void setYbzt(String ybzt) {
		this.ybzt = ybzt;
	}
	public String getGydwtj() {
		return gydwtj;
	}
	public void setGydwtj(String gydwtj) {
		this.gydwtj = gydwtj;
	}
	public String getShengbz() {
		return shengbz;
	}
	public void setShengbz(String shengbz) {
		this.shengbz = shengbz;
	}
	public String getZwcstz() {
		return zwcstz;
	}
	public void setZwcstz(String zwcstz) {
		this.zwcstz = zwcstz;
	}
	public String getZwcbtz() {
		return zwcbtz;
	}
	public void setZwcbtz(String zwcbtz) {
		this.zwcbtz = zwcbtz;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public String getZwczj() {
		return zwczj;
	}
	public void setZwczj(String zwczj) {
		this.zwczj = zwczj;
	}
	public String getJhqlqc() {
		return jhqlqc;
	}
	public void setJhqlqc(String jhqlqc) {
		this.jhqlqc = jhqlqc;
	}
	public String getJhqlqk() {
		return jhqlqk;
	}
	public void setJhqlqk(String jhqlqk) {
		this.jhqlqk = jhqlqk;
	}
	public String getZljdwj() {
		return zljdwj;
	}
	public void setZljdwj(String zljdwj) {
		this.zljdwj = zljdwj;
	}
	public String getZjc() {
		return zjc;
	}
	public void setZjc(String zjc) {
		this.zjc = zjc;
	}
	public String getXbgz() {
		return xbgz;
	}
	public void setXbgz(String xbgz) {
		this.xbgz = xbgz;
	}
	public String getSbjg() {
		return sbjg;
	}
	public void setSbjg(String sbjg) {
		this.sbjg = sbjg;
	}
	public String getQljsgm() {
		return qljsgm;
	}
	public void setQljsgm(String qljsgm) {
		this.qljsgm = qljsgm;
	}
	public String getJhxdwh() {
		return jhxdwh;
	}
	public void setJhxdwh(String jhxdwh) {
		this.jhxdwh = jhxdwh;
	}
	public String getSfylrbwqk() {
		return sfylrbwqk;
	}
	public void setSfylrbwqk(String sfylrbwqk) {
		this.sfylrbwqk = sfylrbwqk;
	}
	public String getXdwh() {
		return xdwh;
	}
	public void setXdwh(String xdwh) {
		this.xdwh = xdwh;
	}
	public String getStz() {
		return stz;
	}
	public void setStz(String stz) {
		this.stz = stz;
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
	public byte[] getSgxkwjfile() {
		return sgxkwjfile;
	}
	public void setSgxkwjfile(byte[] sgxkwjfile) {
		this.sgxkwjfile = sgxkwjfile;
	}
	public String getWcqkmax() {
		return wcqkmax;
	}
	public void setWcqkmax(String wcqkmax) {
		this.wcqkmax = wcqkmax;
	}
	public String getWcqkmin() {
		return wcqkmin;
	}
	public void setWcqkmin(String wcqkmin) {
		this.wcqkmin = wcqkmin;
	}
	public String getSbthcd() {
		return sbthcd;
	}
	public void setSbthcd(String sbthcd) {
		this.sbthcd = sbthcd;
	}
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
	public String getNf() {
		return nf;
	}
	public void setNf(String nf) {
		this.nf = nf;
	}
	public String getZbfzj() {
		return zbfzj;
	}
	public void setZbfzj(String zbfzj) {
		this.zbfzj = zbfzj;
	}
	public String getNxdzj() {
		return nxdzj;
	}
	public void setNxdzj(String nxdzj) {
		this.nxdzj = nxdzj;
	}
	public String getNbfzj() {
		return nbfzj;
	}
	public void setNbfzj(String nbfzj) {
		this.nbfzj = nbfzj;
	}
	public String getYhtype() {
		return yhtype;
	}
	public void setYhtype(String yhtype) {
		this.yhtype = yhtype;
	}
	public String getZxdzj() {
		return zxdzj;
	}
	public void setZxdzj(String zxdzj) {
		this.zxdzj = zxdzj;
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
	
	public Date getShtime() {
		return shtime;
	}
	public void setShtime(Date shtime) {
		this.shtime = shtime;
	}
	public String getPfsj() {
		return pfsj;
	}
	public void setPfsj(String pfsj) {
		this.pfsj = pfsj;
	}
	public String getXdsj() {
		return xdsj;
	}
	public void setXdsj(String xdsj) {
		this.xdsj = xdsj;
	}
	public String getSjkgsj() {
		return sjkgsj;
	}
	public void setSjkgsj(String sjkgsj) {
		this.sjkgsj = sjkgsj;
	}
	public String getYjjgsj() {
		return yjjgsj;
	}
	public void setYjjgsj(String yjjgsj) {
		this.yjjgsj = yjjgsj;
	}
	public String getSjwgsj() {
		return sjwgsj;
	}
	public void setSjwgsj(String sjwgsj) {
		this.sjwgsj = sjwgsj;
	}
}
