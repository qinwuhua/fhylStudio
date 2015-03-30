package com.hdsx.jxzhpt.jhgl.bean;

import java.sql.Clob;
import java.util.Date;
import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;

public class Plan_abgc {
	private String id;//唯一ID
	private String sckid;
	private String jhnf;//计划年份
	private Date jhkgsj;//计划开工时间
	private Date jhwgsj;//计划完工时间
	private String sjdw;//设计单位
	private String sjpfdw;//设计批复单位
	private String pfwh;//批复文号
	private Date pfsj;//批复时间
	private String pfztz;//批复总投资
	private String jhsybbzje;//计划使用部补助金额
	private String jhsydfzczj;//计划使用地方自筹资金
	private String sfsqablbz;//是否申请按比例补助
	private String ablbzsqwh;//按比例补助申请文号
	private String remarks;//备注
	private String tbsj;//填报时间
	private String tbbm;//填报部门
	private String spzt;//审批状态
	private String spbm;//审批部门
	private Date spsj;//审批时间
	private String sbzt;//上报状态
	private String sbbm;//上报部门
	private Date sbsj;//上报时间
	private Date xdsj;//计划下达时间
	private String gkbgmc;//工可报告附件名称
	private String gkbglj;//工可报告附件路径
	private String sjsgtmc;//设计施工图名称
	private String sjsgtlj;//设计施工图路径
	private Date sjkgsj;//实际开工时间
	private Date sjwgsj;//实际完工时间
	private String sgdw;//施工单位
	private String jldw;//监理单位
	private String htje;//合同金额
	private String sgxkwj;//施工许可文件
	private String jgtcwj;//竣工通车文件
	private String jgyswj;//竣工验收文件
	private String wjsczt;//文件上传状态
	private String kgzt;//开工状态
	private String jgzt;//竣工状态
	private String wjgyy;//未竣工原因
	private String yjwgsj;//预计完工时间
	private String jhwc_c;//计划完成(处)
	private String jsdw;//建设单位
	private String jhxdwh;//计划下达问好
	private String xdzt;//下达状态
	private String xfzt;//下发状态
	private String xfsj;//下发时间
	private String xfbm;//下发部门
	private String  wjzt;//台账完结状态
	private String wjsj;//台账完结时间
	private String gys;//概预算
	private String jh_sbthcd;//上报退回状态的长度标示
	private String sbbmdm;//上报部门的部门代码
	private String spbmdm;//审批部门的部门代码
	private String sfylsjl;//最近年份是否有历史记录
	private Sckabgc jckabgc;
	private byte[] gkbgdata;
	private byte[] sjsgtdata;
	
	private String gydw;
	private String xzqhdm;
	private String xzqhmc;
	private String lxbm;
	private String lxmc;
	private String scqdzh;
	private String sczdzh;
	private String sczlc;
	private String scyhlc;
	private String gjxjnd;
	
	public String getSfylsjl() {
		return sfylsjl;
	}
	public void setSfylsjl(String sfylsjl) {
		this.sfylsjl = sfylsjl;
	}
	public String getSckid() {
		return sckid;
	}
	public void setSckid(String sckid) {
		this.sckid = sckid;
	}
	public String getJh_sbthcd() {
		return jh_sbthcd;
	}
	public void setJh_sbthcd(String jh_sbthcd) {
		this.jh_sbthcd = jh_sbthcd;
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
	public Sckabgc getJckabgc() {
		return jckabgc;
	}
	public void setJckabgc(Sckabgc jckabgc) {
		this.jckabgc = jckabgc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJhnf() {
		return jhnf;
	}
	public void setJhnf(String jhnf) {
		this.jhnf = jhnf;
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
	public String getJhsybbzje() {
		return jhsybbzje;
	}
	public void setJhsybbzje(String jhsybbzje) {
		this.jhsybbzje = jhsybbzje;
	}
	public String getJhsydfzczj() {
		return jhsydfzczj;
	}
	public void setJhsydfzczj(String jhsydfzczj) {
		this.jhsydfzczj = jhsydfzczj;
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
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getTbsj() {
		return tbsj;
	}
	public void setTbsj(String tbsj) {
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
	public Date getXdsj() {
		return xdsj;
	}
	public void setXdsj(Date xdsj) {
		this.xdsj = xdsj;
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
	public String getYjwgsj() {
		return yjwgsj;
	}
	public void setYjwgsj(String yjwgsj) {
		this.yjwgsj = yjwgsj;
	}
	public String getJhwc_c() {
		return jhwc_c;
	}
	public void setJhwc_c(String jhwc_c) {
		this.jhwc_c = jhwc_c;
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
	public String getXfsj() {
		return xfsj;
	}
	public void setXfsj(String xfsj) {
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
	public String getWjsj() {
		return wjsj;
	}
	public void setWjsj(String wjsj) {
		this.wjsj = wjsj;
	}
	public String getGys() {
		return gys;
	}
	public void setGys(String gys) {
		this.gys = gys;
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
	public String getScqdzh() {
		return scqdzh;
	}
	public void setScqdzh(String scqdzh) {
		this.scqdzh = scqdzh;
	}
	public String getSczdzh() {
		return sczdzh;
	}
	public void setSczdzh(String sczdzh) {
		this.sczdzh = sczdzh;
	}
	public String getSczlc() {
		return sczlc;
	}
	public void setSczlc(String sczlc) {
		this.sczlc = sczlc;
	}
	public String getScyhlc() {
		return scyhlc;
	}
	public void setScyhlc(String scyhlc) {
		this.scyhlc = scyhlc;
	}
	public String getGjxjnd() {
		return gjxjnd;
	}
	public void setGjxjnd(String gjxjnd) {
		this.gjxjnd = gjxjnd;
	}
	
}
