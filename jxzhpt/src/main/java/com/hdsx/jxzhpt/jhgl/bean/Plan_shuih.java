package com.hdsx.jxzhpt.jhgl.bean;

import java.util.Date;
import java.util.List;

public class Plan_shuih {
	private String id;//唯一编号
	private String xmkYhdzxId;//项目库养护大中修ID
	private String sbnf;//上报年份
	private Date jhkgsj;//计划开工时间
	private Date jhwgsj;//计划完工时间
	private String sjdw;//设计单位
	private String sjpfdw;//设计批复单位
	private String pfwh;//批复文号
	private Date pfsj;//批复时间
	private String yhlb;//养护类别
	private String sjlmlx;//
	private String dc;//垫层
	private String jc;//基层
	private String mc;//面层
	private String pfztz;//批复总投资
	private String jhsybzje;//计划使用部补助金额
	private String jhsydfzcje;//计划使用地方自筹金额
	private String sfsqablbz;//是否申请按比例补助
	private String ablbzsqwh;//按比例补助申请文号
	private Date tbsj;//填报时间
	private String tbbm;//填报部门
	private String sbzt;//上报状态
	private String sbbm;//上报部门
	private Date sbsj;//上报时间
	private String spzt;//审批状态
	private String spbm;//审批部门
	private Date spsj;//审批时间
	private Date xdsj;//下达时间
	private String gkbgmc;//工可报告附件名称
	private String gkbglj;//工可报告附件路径
	private String sjsgtmc;//设计施工图名称
	private String sjsgtlj;//设计施工图文件路径
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
	private Date yjwgsj;//预计完工时间
	private String xmmc;//项目名称
	private String lmkd;//
	private String sftqss;
	private String sfgyhbm;
	private String jsdw;//
	private String jhxdwh;//计划下达文号
	private String gksjwh;//
	private String sjpfwh;
	private String wjzt;//台账完结状态
	private String wjsj;//台账完结时间
	private String gsztz;//
	private String sfqxkg;
	private String fapgdw;//方案评估
	private String fascdw;//方案审查单位
	private String faspsj;//方案审批时间
	private String spwh;//审批文号
	private String tzgs;//投资估算
	private String jsxz;//建设性质
	private String jsnr;//建设内容
	private String jhbz;//备注
	private String scBz;//审查备注
	private String wjgyy;//未竣工原因
	private String jh_sbthcd;
	private String sbbmdm;
	private String spbmdm;
	private String sfylsjl;//最近年份是否有历史记录
	private List<Plan_lx_shuih> shuihs;//水毁路段集合
	public String getScBz() {
		return scBz;
	}
	public void setScBz(String scBz) {
		this.scBz = scBz;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXmkYhdzxId() {
		return xmkYhdzxId;
	}
	public void setXmkYhdzxId(String xmkYhdzxId) {
		this.xmkYhdzxId = xmkYhdzxId;
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
	public String getSjlmlx() {
		return sjlmlx;
	}
	public void setSjlmlx(String sjlmlx) {
		this.sjlmlx = sjlmlx;
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
	public String getSfgyhbm() {
		return sfgyhbm;
	}
	public void setSfgyhbm(String sfgyhbm) {
		this.sfgyhbm = sfgyhbm;
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
	public String getJhbz() {
		return jhbz;
	}
	public void setJhbz(String jhbz) {
		this.jhbz = jhbz;
	}
	public String getWjgyy() {
		return wjgyy;
	}
	public void setWjgyy(String wjgyy) {
		this.wjgyy = wjgyy;
	}
	public List<Plan_lx_shuih> getShuihs() {
		return shuihs;
	}
	public void setShuihs(List<Plan_lx_shuih> shuihs) {
		this.shuihs = shuihs;
	}
}
