package com.hdsx.jxzhpt.jhgl.bean;

import java.util.Date;
import java.util.List;

public class Plan_yhdzx {
	private String id;//计划ID
	private String sbnf;//上报年份
	private Date jhkgsj;//计划开工时间
	private Date jhwgsj;//计划完工时间
	private String sjdw;//设计单位
	private String sjpfdw;//审计批复单位
	private String pfwh;//批复文号
	private Date pfsj;//批复时间
	private String yhlb;//养护类别
	private String dc;//垫层
	private String jc;//基层
	private String mc;//面层
	private String pfztz;//批复总投资
	private String jhsybzje;//计划使用部补助金额
	private String jhsydfzcje;//计划使用地方自筹金额
	private String sfsqablbz;//是否申请按比例补助
	private String ablbzsqwh;//按比例补助申请文号
	private String bz;//备注信息
	private Date tbsj;//填报时间
	private String tbbm;//填报部门
	private String sbzt;//上报状态
	private String sbbm;//上报部门
	private Date sbsj;//上报时间
	private String spzt;//审批状态
	private String spbm;//审批部门
	private Date spsj;//审批时间
	private Date xdsj;//下达时间
	private String gkbgmc;//工可报告名称
	private String gkbglj;//工可报告路径
	private String sjsgtmc;//设计施工图名称
	private String sjsgtlj;//设计施工图路径
	private Date sjkgsj;//设计开工时间
	private Date sjwgsj;//设计完工时间
	private String sgdw;//施工单位
	private String jldw;//监理单位
	private String htje;//合同金额
	private String sgxkwj;//施工许可文件
	private String jgtcwj;//交工通车文件
	private String jgyswj;//竣工验收文件
	private String wjsczt;//文件上传状态
	private String kgzt;//开工状态
	private String jgzt;//竣工状态
	private String wjgyy;//未竣工原因
	private Date yjwgsj;//预计完工时间
	private String xmmc;//项目名称
	private String lmkd;//路面宽度
	private String sftqss;//是否提前实施
	private String sfgyhdm;//是否归市局管养单位
	private String jsdw;//建设单位
	private String jhxdwh;//计划下达文号
	private String gksjwh;//工可批复文号
	private String sjpfwh;//设计批复文号
	private String wjzt;//台账完结状态
	private Date wjsj;//台账完结时间
	private String gsztz;//概算总投资
	private String sfqxkg;//是否全线开工
	private String jh_sbthcd;//上报退回长度
	private String sbbmdm;//上报部门代码
	private String spbmdm;//审批部门代码
	private Plan_lx_yhdzx plan_yhdzx;
	private List<Plan_lx_yhdzx> plan_yhdzxs;
	
	private String fapgdw;//方案评估单位
	private String fascdw;//方案审查单位
	private Date faspsj;//方案审批时间
	private String spwh;//方案审批文号
	private String tzgs;//投资估算
	private String jsxz;//建设性质
	private String jsnr;///建设内容
	private String spbz;//审批备注
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Date getYjwgsj() {
		return yjwgsj;
	}
	public void setYjwgsj(Date yjwgsj) {
		this.yjwgsj = yjwgsj;
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
	public String getSfgyhdm() {
		return sfgyhdm;
	}
	public void setSfgyhdm(String sfgyhdm) {
		this.sfgyhdm = sfgyhdm;
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
	public String getGksjwh() {
		return gksjwh;
	}
	public void setGksjwh(String gksjwh) {
		this.gksjwh = gksjwh;
	}
	public String getSjpfwh() {
		return sjpfwh;
	}
	public void setSjpfwh(String sjpfwh) {
		this.sjpfwh = sjpfwh;
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
	public Date getFaspsj() {
		return faspsj;
	}
	public void setFaspsj(Date faspsj) {
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
	public String getSpbz() {
		return spbz;
	}
	public void setSpbz(String spbz) {
		this.spbz = spbz;
	}
	public Plan_lx_yhdzx getPlan_yhdzx() {
		return plan_yhdzx;
	}
	public void setPlan_yhdzx(Plan_lx_yhdzx plan_yhdzx) {
		this.plan_yhdzx = plan_yhdzx;
	}
	public List<Plan_lx_yhdzx> getPlan_yhdzxs() {
		return plan_yhdzxs;
	}
	public void setPlan_yhdzxs(List<Plan_lx_yhdzx> plan_yhdzxs) {
		this.plan_yhdzxs = plan_yhdzxs;
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
}
