package com.hdsx.jxzhpt.jhgl.bean;

import java.util.Date;
import java.util.List;

public class Plan_gcsj {
	private String id;//唯一编码
	private String jhnf;//计划年份
	private Date jhkgsj;//计划开工时间
	private Date jhwgsj;//计划完工时间
	private String sjdw;//设计单位
	private String sjpfdw;//设计批复单位
	private String pfwh;//批复文号
	private Date pfsj;//批复时间
	private String ql;//桥梁个数 
	private String ql_m;//桥梁延米
	private String sd;//隧道个数
	private String sd_m;//隧道延米
	private String hd;//涵洞个数
	private String ljtsf;//路基土石方
	private String dc;//垫层(公里)
	private String jc;//基层(公里)
	private String lqlm;//沥青路面(公里)
	private String snlm;//水泥路面(公里)
	private String gjhjsdj;//改建后技术等级
	private String pftz;//批复投资
	private String jhsybbzje;//计划使用部补助金额
	private String jhsydfzczj;//计划使用地方自筹资金
	private String sfsqablbz;//是否申请按比例补助
	private String ablbzsqwh;//按比例补助申请文号
	private String remarks;//备注
	private Date tbsj;//填报时间
	private String tbbm;//填报部门
	private String sbzt;//上报状态
	private String sbbm;//上报部门
	private Date sbsj;//上报时间
	private String spzt;//审批状态
	private String spbm;//审批部门
	private Date spsj;//审批时间
	private String xmwybh;//项目唯一编号(手填)
	private String xdsj;//计划下达时间
	private String gkbgmc;//工可报告附件名称
	private byte[] gkbgwj;//工可报告附件路径
	private String sjsgtmc;//设计施工图附件名称
	private byte[] sjsgtwj;//设计施工图附件路径
	private Date sjkgsj;//实际开工时间
	private Date sjwgsj;//实际完工时间
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
	private String yjwgsj;//预计完工时间
	private String xmmc;//计划项目名称
	private String jsjsbz;//建设技术标准
	private String sftqss;//是否提前实施
	private String jsdw;//建设单位
	private String jhxdwh;//计划下达文号
	private String gksjwh;//工可批复文号
	private String sjpfwh;//设计批复问好
	private String wjzt;//台账完结状态
	private String wjsj;//台账完结时间
	private int gsztz;//概算总投资
	private String sfqxkg;//全线开工状态
	private String fapgdw;//方案评估单位
	private String fascdw;//方案审查单位
	private String faspsj;//方案审批时间
	private String spwh;//审批文号
	private String tzgs;//投资估算(万元)
	private String jsxz;//建设性质
	private String jsnr;//建设内容
	private String scBz;
	private String jh_sbthcd;//上报退回状态的长度标示  设置默认值1是指搜索条件忽略状态一栏
	private String sbbmdm;//上报部门的部门代码
	private String spbmdm;//审批部门的部门代码
	private String sfylsjl;//最近年份是否有历史记录
	private List<Plan_lx_gcsj> plan_lx_gcsjs;
	public List<Plan_lx_gcsj> getPlan_lx_gcsjs() {
		return plan_lx_gcsjs;
	}
	public void setPlan_lx_gcsjs(List<Plan_lx_gcsj> plan_lx_gcsjs) {
		this.plan_lx_gcsjs = plan_lx_gcsjs;
	}
	public String getSfylsjl() {
		return sfylsjl;
	}
	public void setSfylsjl(String sfylsjl) {
		this.sfylsjl = sfylsjl;
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
	public String getScBz() {
		return scBz;
	}
	public void setScBz(String scBz) {
		this.scBz = scBz;
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
	public String getQl() {
		return ql;
	}
	public void setQl(String ql) {
		this.ql = ql;
	}
	public String getQl_m() {
		return ql_m;
	}
	public void setQl_m(String ql_m) {
		this.ql_m = ql_m;
	}
	public String getSd() {
		return sd;
	}
	public void setSd(String sd) {
		this.sd = sd;
	}
	public String getSd_m() {
		return sd_m;
	}
	public void setSd_m(String sd_m) {
		this.sd_m = sd_m;
	}
	public String getHd() {
		return hd;
	}
	public void setHd(String hd) {
		this.hd = hd;
	}
	public String getLjtsf() {
		return ljtsf;
	}
	public void setLjtsf(String ljtsf) {
		this.ljtsf = ljtsf;
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
	public String getLqlm() {
		return lqlm;
	}
	public void setLqlm(String lqlm) {
		this.lqlm = lqlm;
	}
	public String getSnlm() {
		return snlm;
	}
	public void setSnlm(String snlm) {
		this.snlm = snlm;
	}
	public String getGjhjsdj() {
		return gjhjsdj;
	}
	public void setGjhjsdj(String gjhjsdj) {
		this.gjhjsdj = gjhjsdj;
	}
	public String getPftz() {
		return pftz;
	}
	public void setPftz(String pftz) {
		this.pftz = pftz;
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
	public String getXmwybh() {
		return xmwybh;
	}
	public void setXmwybh(String xmwybh) {
		this.xmwybh = xmwybh;
	}
	public String getXdsj() {
		return xdsj;
	}
	public void setXdsj(String xdsj) {
		this.xdsj = xdsj;
	}
	public String getGkbgmc() {
		return gkbgmc;
	}
	public void setGkbgmc(String gkbgmc) {
		this.gkbgmc = gkbgmc;
	}
	public byte[] getGkbgwj() {
		return gkbgwj;
	}
	public void setGkbgwj(byte[] gkbgwj) {
		this.gkbgwj = gkbgwj;
	}
	public byte[] getSjsgtwj() {
		return sjsgtwj;
	}
	public void setSjsgtwj(byte[] sjsgtwj) {
		this.sjsgtwj = sjsgtwj;
	}
	public String getSjsgtmc() {
		return sjsgtmc;
	}
	public void setSjsgtmc(String sjsgtmc) {
		this.sjsgtmc = sjsgtmc;
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
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getJsjsbz() {
		return jsjsbz;
	}
	public void setJsjsbz(String jsjsbz) {
		this.jsjsbz = jsjsbz;
	}
	public String getSftqss() {
		return sftqss;
	}
	public void setSftqss(String sftqss) {
		this.sftqss = sftqss;
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
	public String getWjsj() {
		return wjsj;
	}
	public void setWjsj(String wjsj) {
		this.wjsj = wjsj;
	}
	public int getGsztz() {
		return gsztz;
	}
	public void setGsztz(int gsztz) {
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
}
