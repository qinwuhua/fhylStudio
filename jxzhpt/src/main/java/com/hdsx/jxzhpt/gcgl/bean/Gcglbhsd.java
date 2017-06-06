package com.hdsx.jxzhpt.gcgl.bean;

import java.io.Serializable;
import java.util.Date;

public class Gcglbhsd implements Serializable {

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
	private String cscyj;//审核意见
	private String tiaojian;
	//车购税  CGSDWZJ  TBYF  TBSJ  TBR
	private String cgsdwzj;
	private String tbyf;
	private String tbsj;
	private String tbr;
	
	//基础库
	private String sdmc;
	private String sddm;
	private String sdzxzh;
	private String xzqhmc;
	private String xzqhdm;
	private String gydw;
	private String lxmc;
	private String lxbm;
	private String sdcd;
	private String sdkd;
	private String sdgd;
	private String jsdj;
	private String pddj;
	private String xjgjnd;
	private String acdfl;
	private String xmnf;
	private String xmtype;
	private String bhnr;
	private String bz;
	private String tbman;
	
	//审查库
	private String tzgs;
	private String spwh;
	private String spdw;
	private String sjdw;
	private String sck_jsxz;
	private String zyjsnr;
	private String scbz;
	
	//计划库
	private String sbnf;
	private Date jhkgsj;
	private Date jhwgsj;
	private String pfztz;
	private String jhsybzje;
	private String jhsydfzcje;
	private String qtzj;
	private String zczjyls;//自筹资金已落实
	private String jhbz;//计划备注

	private Date xdsj;
	private Date sjkgsj;
	private Date yjjgsj;//预计竣工时间
	private String sgdw;
	private String jldw;
	private String jsdw;
	private String gys;
	private String htje;
	private Date sjwgsj;
	private String kgzt;
	private String jgzt;
	private String wjgyy;
	private String zbfzj;
	private String nxdzj;
	private String nbfzj;
	private String yhtype;
	private String zxdzj;
	
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
	
	//zyy add20150728
	private String yb_thyj;//
	private String tbbmbm;//填报部门编码
	private String xtType;//系统类型 nc or gx
	private String gldj;
	private String ljbfzt;
	
	private String zgshzt;
	private String zgshuser;
	private String zgshyj;
	private String thyy;
	private String zgthyy;
	private Date zgshtime;
	private String sbzt;
	
	public String getSbzt() {
		return sbzt;
	}
	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}
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
	
	public String getXtType() {
		return xtType;
	}
	public void setXtType(String xtType) {
		this.xtType = xtType;
	}
	public String getTbbmbm() {
		return tbbmbm;
	}
	public void setTbbmbm(String tbbmbm) {
		this.tbbmbm = tbbmbm;
	}
	public String getYb_thyj() {
		return yb_thyj;
	}
	public void setYb_thyj(String yb_thyj) {
		this.yb_thyj = yb_thyj;
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
	public String getSdzxzh() {
		return sdzxzh;
	}
	public void setSdzxzh(String sdzxzh) {
		this.sdzxzh = sdzxzh;
	}
	public String getSdcd() {
		return sdcd;
	}
	public void setSdcd(String sdcd) {
		this.sdcd = sdcd;
	}
	public String getSdkd() {
		return sdkd;
	}
	public void setSdkd(String sdkd) {
		this.sdkd = sdkd;
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
	public String getSpdw() {
		return spdw;
	}
	public void setSpdw(String spdw) {
		this.spdw = spdw;
	}
	public String getSck_jsxz() {
		return sck_jsxz;
	}
	public void setSck_jsxz(String sck_jsxz) {
		this.sck_jsxz = sck_jsxz;
	}
	public String getZyjsnr() {
		return zyjsnr;
	}
	public void setZyjsnr(String zyjsnr) {
		this.zyjsnr = zyjsnr;
	}
	public String getQtzj() {
		return qtzj;
	}
	public void setQtzj(String qtzj) {
		this.qtzj = qtzj;
	}
	public String getZczjyls() {
		return zczjyls;
	}
	public void setZczjyls(String zczjyls) {
		this.zczjyls = zczjyls;
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
	public String getTbman() {
		return tbman;
	}
	public void setTbman(String tbman) {
		this.tbman = tbman;
	}
	
	
}
