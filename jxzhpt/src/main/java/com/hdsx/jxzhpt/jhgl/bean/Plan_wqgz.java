package com.hdsx.jxzhpt.jhgl.bean;

import java.io.Serializable;
import java.util.Date;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;

public class Plan_wqgz implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String id;//唯一ID
	private String sckid;//危桥改造项目库ID
	private String sbnf;//上报年份
	private String jhkgsj;//计划开工时间
	private String jhkgsj1;//计划审核导入Excel
	private String jhwgsj;//计划完工时间
	private String jhwgsj1;//计划审核导入Excel
	private String sjdw;//设计单位
	private String sjpfdw;//设计批复单位
	private String pfwh;//批复文号
	private String pfsj;//批复时间
	private String pfsj1;//批复时间，用于计划库审核导入数据时使用
	private String pfztz;//批复总投资
	private String jhsybzje;//计划使用部不住金额
	private String jhsydfzcje;//计划使用地方自筹金额
	private String sfsqablbz;//是否申请按比例补助
	private String ablbzsqwh;//按比例补助申请文号
	private String bz;//备注
	private Date tbsj;//填报时间
	private String tbbm;//填报部门
	private String spzt;//审批状态
	private String spbm;//审批部门
	private Date spsj;//审批时间
	private String sbzt;//上报状态
	private String sbbm;//上报部门
	private Date sbsj;//上报时间
	private String xdsj;//计划下达时间
	private String gkbgmc;//工可报告附件名称
	private String gkbglj;//工可报告附件路径
	private String sjsgtmc;
	private String sjsgtlj;
	private String sjkgsj;//实际开工时间
	private String sjwgsj;//实际完工时间
	private String sgdw;//施工单位
	private String jldw;//监理单位
	private String htje;//合同金额
	private String sgxkwj;//施工许可文件
	private String jgtcwj;//交工通车文件
	private String jgyswj;//竣工验收文件
	private String wjsczt;//文件上传状态
	private String kgzt;//开工状态
	private String jgzt;//竣工状态
	private String yjjgsj;//预计竣工时间
	private String wjgyy;//未竣工原因
	private String jsdw;//建设单位
	private String jhxdwh;//计划下达文号
	private String xdzt;//下达状态
	private String xfzt;//下发状态
	private Date xfsj;//下发时间
	private String xfbm;//下发部门
	private String wjzt;//台账完结状态
	private Date wjsj;//台账完结时间
	private String gys;//概预算
	private Sckwqgz jckwqgz;
	private String jh_sbthcd;
	private String sbbmdm;
	private String spbmdm;
	private String sfylsjl;//最近年份是否有历史记录
	private String qlqc;
	private String qlkd;
	private byte[] gkbgdata;
	private byte[] sjsgtdata;
	//路线和审查库信息
	private String gydw;
	private String xzqhdm;
	private String xzqhmc;
	private String lxbm;
	private String lxmc;
	private String qlbh;
	private String qlmc;
	private String qlzxzh;
	private String scqlqc;
	private String scqlqk;
	private String fapgdw;
	private String fascdw;
	private String faspsj;
	private String tzgs;
	private String spwh;
	private String jsxz;
	private String jsnr;
	private String scbz;
	private String xjgjnd;
	private String sfylrbwqk;
	
	private String xlxbm;//原路线编码
	private String xqlbm;//原桥梁编码
	private String xzxzh;//原中心桩号
	private String xlxmc;//原路线名称
	private String xqlmc;//原桥梁名称
	
	private String shengbz;//省补助
	
	public String getShengbz() {
		return shengbz;
	}
	public void setShengbz(String shengbz) {
		this.shengbz = shengbz;
	}
	public String getXlxbm() {
		return xlxbm;
	}
	public void setXlxbm(String xlxbm) {
		this.xlxbm = xlxbm;
	}
	public String getXqlbm() {
		return xqlbm;
	}
	public void setXqlbm(String xqlbm) {
		this.xqlbm = xqlbm;
	}
	public String getXzxzh() {
		return xzxzh;
	}
	public void setXzxzh(String xzxzh) {
		this.xzxzh = xzxzh;
	}
	public String getXlxmc() {
		return xlxmc;
	}
	public void setXlxmc(String xlxmc) {
		this.xlxmc = xlxmc;
	}
	public String getXqlmc() {
		return xqlmc;
	}
	public void setXqlmc(String xqlmc) {
		this.xqlmc = xqlmc;
	}
	public String getJhkgsj1() {
		return jhkgsj1;
	}
	public void setJhkgsj1(String jhkgsj1) {
		this.jhkgsj1 = jhkgsj1;
	}
	public String getJhwgsj1() {
		return jhwgsj1;
	}
	public void setJhwgsj1(String jhwgsj1) {
		this.jhwgsj1 = jhwgsj1;
	}
	public String getPfsj1() {
		return pfsj1;
	}
	public void setPfsj1(String pfsj1) {
		this.pfsj1 = pfsj1;
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
	public String getScqlqc() {
		return scqlqc;
	}
	public void setScqlqc(String scqlqc) {
		this.scqlqc = scqlqc;
	}
	public String getScqlqk() {
		return scqlqk;
	}
	public void setScqlqk(String scqlqk) {
		this.scqlqk = scqlqk;
	}
	public String getSfylrbwqk() {
		return sfylrbwqk;
	}
	public void setSfylrbwqk(String sfylrbwqk) {
		this.sfylrbwqk = sfylrbwqk;
	}
	public String getJh_sbthcd() {
		return jh_sbthcd;
	}
	public void setJh_sbthcd(String jh_sbthcd) {
		this.jh_sbthcd = jh_sbthcd;
	}
	public String getSfylsjl() {
		return sfylsjl;
	}
	public void setSfylsjl(String sfylsjl) {
		this.sfylsjl = sfylsjl;
	}
	public String getSbbmdm() {
		return sbbmdm;
	}
	public void setSbbmdm(String sbbmdm) {
		this.sbbmdm = sbbmdm;
	}
	public String getSpbmdm() {
		return spbmdm;
	}
	public void setSpbmdm(String spbmdm) {
		this.spbmdm = spbmdm;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSckid() {
		return sckid;
	}
	public void setSckid(String sckid) {
		this.sckid = sckid;
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
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public Date getTbsj() {
		return tbsj;
	}
	public void setTbsj(Date tbsj) {
		this.tbsj = tbsj;
	}
	public String getTbbm() {
		return tbbm;
	}
	public void setTbbm(String tbbm) {
		this.tbbm = tbbm;
	}
	public String getSpzt() {
		return spzt;
	}
	public void setSpzt(String spzt) {
		this.spzt = spzt;
	}
	public String getSpbm() {
		return spbm;
	}
	public void setSpbm(String spbm) {
		this.spbm = spbm;
	}
	public Date getSpsj() {
		return spsj;
	}
	public void setSpsj(Date spsj) {
		this.spsj = spsj;
	}
	public String getSbzt() {
		return sbzt;
	}
	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}
	public String getSbbm() {
		return sbbm;
	}
	public void setSbbm(String sbbm) {
		this.sbbm = sbbm;
	}
	public Date getSbsj() {
		return sbsj;
	}
	public void setSbsj(Date sbsj) {
		this.sbsj = sbsj;
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
	public String getJsdw() {
		return jsdw;
	}
	public void setJsdw(String jsdw) {
		this.jsdw = jsdw;
	}
	public String getJhxdwh() {
		return jhxdwh;
	}
	public void setJhxdwh(String jhxdwh) {
		this.jhxdwh = jhxdwh;
	}
	public String getXdzt() {
		return xdzt;
	}
	public void setXdzt(String xdzt) {
		this.xdzt = xdzt;
	}
	public String getXfzt() {
		return xfzt;
	}
	public void setXfzt(String xfzt) {
		this.xfzt = xfzt;
	}
	public Date getXfsj() {
		return xfsj;
	}
	public void setXfsj(Date xfsj) {
		this.xfsj = xfsj;
	}
	public String getXfbm() {
		return xfbm;
	}
	public void setXfbm(String xfbm) {
		this.xfbm = xfbm;
	}
	public String getWjzt() {
		return wjzt;
	}
	public void setWjzt(String wjzt) {
		this.wjzt = wjzt;
	}
	public Date getWjsj() {
		return wjsj;
	}
	public void setWjsj(Date wjsj) {
		this.wjsj = wjsj;
	}
	public String getGys() {
		return gys;
	}
	public void setGys(String gys) {
		this.gys = gys;
	}
	public Sckwqgz getJckwqgz() {
		return jckwqgz;
	}
	public void setJckwqgz(Sckwqgz jckwqgz) {
		this.jckwqgz = jckwqgz;
	}
	public String getQlqc() {
		return qlqc;
	}
	public void setQlqc(String qlqc) {
		this.qlqc = qlqc;
	}
	public String getQlkd() {
		return qlkd;
	}
	public void setQlkd(String qlkd) {
		this.qlkd = qlkd;
	}
	public byte[] getGkbgdata() {
		return gkbgdata;
	}
	public void setGkbgdata(byte[] gkbgdata) {
		this.gkbgdata = gkbgdata;
	}
	public byte[] getSjsgtdata() {
		return sjsgtdata;
	}
	public void setSjsgtdata(byte[] sjsgtdata) {
		this.sjsgtdata = sjsgtdata;
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
	public String getQlbh() {
		return qlbh;
	}
	public void setQlbh(String qlbh) {
		this.qlbh = qlbh;
	}
	public String getQlmc() {
		return qlmc;
	}
	public void setQlmc(String qlmc) {
		this.qlmc = qlmc;
	}
	public String getQlzxzh() {
		return qlzxzh;
	}
	public void setQlzxzh(String qlzxzh) {
		this.qlzxzh = qlzxzh;
	}
	public String getXjgjnd() {
		return xjgjnd;
	}
	public void setXjgjnd(String xjgjnd) {
		this.xjgjnd = xjgjnd;
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
	public String getYjjgsj() {
		return yjjgsj;
	}
	public void setYjjgsj(String yjjgsj) {
		this.yjjgsj = yjjgsj;
	}
}
