package com.hdsx.jxzhpt.gcgl.bean;

import java.io.Serializable;
import java.util.Date;

public class Gcglgcgzgj implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String jgys;
	
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
	private String cscyj;//财审处意见
	
	//车购税  CGSDWZJ  TBYF  TBSJ  TBR
	private String cgsdwzj;
	private String tbyf;
	private String tbsj;
	private String tbr;
	
	private  byte[] sgxkwjfile;
	private  byte[] jgtcwjfile;
	private  byte[] jgyswjfile;
	//基础信息
	private String lxmc;//路线名称
	private String lxbm;//路线编码
	private String xzqhdm;//行政区划代码
	private String xzqhmc;//行政区划名称
	private String jsdd;//建设地点
	private String gydw;//管养单位
	private String gydwbm;//管养单位编码
	private String bhnr;//病害内容
	private String qdzh;//起点桩号
	private String zdzh;//止点桩号
	private String qzlc;//起止里程
	private String yhlc;//隐患里程
	private String ylmlx;//原路面类型
	private String yjsdj;
	private String lxbz;
	//审查
	private String fapgdw;//方案评估
	private String fascdw;//方案审查单位
	private String faspsj;//方案审批时间
	private String spwh;//审批文号
	private String tzgs;//投资估算
	private String jsxz;//建设性质
	private String jsnr;//建设内容
	private String bz;//备注

	private String sbnf;//上报年份
	private String jhkgsj;//计划开工时间
	private String jhwgsj;//计划完工时间
	private String xmmc;//项目名称
	private String lmkd;//
	private String sftqss;
	private String sjdw;//施工单位
	private String yhlb;//养护类别
	private String dc;//垫层
	private String jc;//基层
	private String mc;//面层
	private String sjpfdw;//施工批复单位
	private String pfwh;//批复文号
	private String pfsj;//批复时间
	private String pfztz;//批复总投资
	private String jhsybzje;//计划使用部补助金额
	private String jhsydfzcje;//计划使用地方自筹金额
	private String sjlmlx;//
	private String sfsqablbz;//是否申请按比例补助
	private String ablbzsqwh;//按比例补助申请文号
	private String sfgyhbm;
	private String gkbgmc;//工可报告附件名称
	private String gkbglj;//工可报告附件路径
	private String sjsgtmc;//设计施工图名称
	private String sjsgtlj;//设计施工图文件路径
	private String xdsj;//下达时间
	private String sjkgsj;//实际开工时间
	private String sjwgsj;//实际完工时间
	private String kgzt;//开工状态
	private String jgzt;//竣工状态
	private String yjwgsj;//预计完工时间
	private String sfqxkg;
	private String jsdw;//
	private String sgdw;//施工单位
	private String jldw;//监理单位
	private String htje;//合同金额
	private String sgxkwj;//施工许可文件
	private String jgtcwj;//交工通车文件
	private String jgyswj;//竣工验收文件
	private String wjsczt;//文件上传状态
	private String gsztz;//
	private String tiaojian;
	private String lxid;
	private String wjgyy;
	private String scbz;
	private String jhbz;	
	private Integer sfsj;
	private String sfth;
	private String lxjsdj;
	
	private int page;
	private int rows;
	
	private String xjzt;//xianji
	private String sjzt;//市级查看月报zt
	private String sjsh;//省级
	private String yhtype;
	private String stz;
	private String zdyf;
	private String sfgk;
	private String ssdctc;
	private String bndsslc;
	private String wkglc;
	private String sl;
	private String gldj;
	private String jsdj;
	private String ljbfzt;
	private String tsdq;
	private String yhdk;
	private String gz;
	private String sz;
	private String dwyhdk;
	private String dwgz;
	private String dwsz;
	
	public String getDwyhdk() {
		return dwyhdk;
	}
	public void setDwyhdk(String dwyhdk) {
		this.dwyhdk = dwyhdk;
	}
	public String getDwgz() {
		return dwgz;
	}
	public void setDwgz(String dwgz) {
		this.dwgz = dwgz;
	}
	public String getDwsz() {
		return dwsz;
	}
	public void setDwsz(String dwsz) {
		this.dwsz = dwsz;
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
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
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
	public String getLjbfzt() {
		return ljbfzt;
	}
	public void setLjbfzt(String ljbfzt) {
		this.ljbfzt = ljbfzt;
	}
	public String getSl() {
		return sl;
	}
	public void setSl(String sl) {
		this.sl = sl;
	}
	public String getWkglc() {
		return wkglc;
	}
	public void setWkglc(String wkglc) {
		this.wkglc = wkglc;
	}
	public String getBndsslc() {
		return bndsslc;
	}
	public void setBndsslc(String bndsslc) {
		this.bndsslc = bndsslc;
	}
	public String getSsdctc() {
		return ssdctc;
	}
	public void setSsdctc(String ssdctc) {
		this.ssdctc = ssdctc;
	}
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
	public String getJsdd() {
		return jsdd;
	}
	public void setJsdd(String jsdd) {
		this.jsdd = jsdd;
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
	public String getBhnr() {
		return bhnr;
	}
	public void setBhnr(String bhnr) {
		this.bhnr = bhnr;
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
	public String getYlmlx() {
		return ylmlx;
	}
	public void setYlmlx(String ylmlx) {
		this.ylmlx = ylmlx;
	}
	public String getYjsdj() {
		return yjsdj;
	}
	public void setYjsdj(String yjsdj) {
		this.yjsdj = yjsdj;
	}
	public String getLxbz() {
		return lxbz;
	}
	public void setLxbz(String lxbz) {
		this.lxbz = lxbz;
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
	public String getSpwh() {
		return spwh;
	}
	public void setSpwh(String spwh) {
		this.spwh = spwh;
	}
	public String getTzgs() {
		return tzgs;
	}
	public void setTzgs(String tzgs) {
		this.tzgs = tzgs;
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
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getSbnf() {
		return sbnf;
	}
	public void setSbnf(String sbnf) {
		this.sbnf = sbnf;
	}
	
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getLmkd() {
		return lmkd;
	}
	public void setLmkd(String lmkd) {
		this.lmkd = lmkd;
	}
	public String getSftqss() {
		return sftqss;
	}
	public void setSftqss(String sftqss) {
		this.sftqss = sftqss;
	}
	public String getSjdw() {
		return sjdw;
	}
	public void setSjdw(String sjdw) {
		this.sjdw = sjdw;
	}
	public String getYhlb() {
		return yhlb;
	}
	public void setYhlb(String yhlb) {
		this.yhlb = yhlb;
	}
	public String getDc() {
		return dc;
	}
	public void setDc(String dc) {
		this.dc = dc;
	}
	public String getJc() {
		return jc;
	}
	public void setJc(String jc) {
		this.jc = jc;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
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
	public String getSjlmlx() {
		return sjlmlx;
	}
	public void setSjlmlx(String sjlmlx) {
		this.sjlmlx = sjlmlx;
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
	public String getSfgyhbm() {
		return sfgyhbm;
	}
	public void setSfgyhbm(String sfgyhbm) {
		this.sfgyhbm = sfgyhbm;
	}
	public String getGkbgmc() {
		return gkbgmc;
	}
	public void setGkbgmc(String gkbgmc) {
		this.gkbgmc = gkbgmc;
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
	public String getSjsgtlj() {
		return sjsgtlj;
	}
	public void setSjsgtlj(String sjsgtlj) {
		this.sjsgtlj = sjsgtlj;
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
	
	public String getSfqxkg() {
		return sfqxkg;
	}
	public void setSfqxkg(String sfqxkg) {
		this.sfqxkg = sfqxkg;
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
	public String getWjsczt() {
		return wjsczt;
	}
	public void setWjsczt(String wjsczt) {
		this.wjsczt = wjsczt;
	}
	public String getGsztz() {
		return gsztz;
	}
	public void setGsztz(String gsztz) {
		this.gsztz = gsztz;
	}
	public String getTiaojian() {
		return tiaojian;
	}
	public void setTiaojian(String tiaojian) {
		this.tiaojian = tiaojian;
	}
	public String getLxid() {
		return lxid;
	}
	public void setLxid(String lxid) {
		this.lxid = lxid;
	}
	public String getWjgyy() {
		return wjgyy;
	}
	public void setWjgyy(String wjgyy) {
		this.wjgyy = wjgyy;
	}
	public String getScbz() {
		return scbz;
	}
	public void setScbz(String scbz) {
		this.scbz = scbz;
	}
	public String getJhbz() {
		return jhbz;
	}
	public void setJhbz(String jhbz) {
		this.jhbz = jhbz;
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
	public String getLxjsdj() {
		return lxjsdj;
	}
	public void setLxjsdj(String lxjsdj) {
		this.lxjsdj = lxjsdj;
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

	
}
