package com.hdsx.jxzhpt.jhgl.bean;

import java.util.Date;
import java.util.List;

public class Plan_yhdzx {
	private String id;
	private String classify;//工程分类
	private String ordernum;
	private String planhistorycompara;//历史对比
	private Date jhkgsj;//计划开工时间
	private Date jhwgsj;//计划完工时间
	private String ygcode;//管养单位编码
	private String spzt;//审批状态
	private Date spsj;//审批时间
	private String sbzt;//上报状态
	private Date sbsj;//上报时间
	private String wjzt;//台账完结状态
	private String wjsj;//台账完结时间
	private Date xdsj;//计划下达时间
	private Date sjkgsj;//实际开工时间
	private Date sjwgsj;//实际完工时间
	private String sgdw;//施工单位
	private String jldw;//监理单位
	private String htje;//合同金额
	private String kgzt;//开工状态
	private String jgzt;//竣工状态
	private Date yjwgsj;//预计完工时间
	private String jsdw;//建设单位
	private String description;//技术处置描述
	private String xchsqk;//现场核实情况
	private String aadt;//交通量
	private String dianceng;//垫层
	private String jiceng;//基层
	private String surface;//面层
	private String pqi;//PQI指标
	private String fee;//核算经费
	private String reportingfee;//上报经费
	private String newfee;//审定经费
	private String totalinvest;//总投资
	private String totalsubsidyfund;//总补助资金
	private String totalplacefund;//地方配套总投资
	private String accumulativesubsidyfund;//累计补助资金
	private String nowyearsubsidyfund;//本年补助资金
	private String constructnumber;//施工图文号
	private String replynumber;//工可批复文号
	private String devisenumber;//设计批复文号
	private String plandownnumber;//计划下达文号
	private String sgxkwj;//施工许可文件
	private String jgtcwj;//交工通车文件
	private String jgyswj;//竣工验收文件
	private String wjsczt;//文件上传状态
	private String gys;//概预算
	private String wjgyy;//未竣工原因
	private String remarks;//省统筹备注
	private String qtbz;//其他备注
	private Plan_lx_yhdzx plan_lx_yhdzx;
	private List<Plan_lx_yhdzx> plan_lx_yhdzxs;
	private String jh_sbthcd;//计划上报退回长度
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Plan_lx_yhdzx getPlan_lx_yhdzx() {
		return plan_lx_yhdzx;
	}
	public void setPlan_lx_yhdzx(Plan_lx_yhdzx plan_lx_yhdzx) {
		this.plan_lx_yhdzx = plan_lx_yhdzx;
	}
	public List<Plan_lx_yhdzx> getPlan_lx_yhdzxs() {
		return plan_lx_yhdzxs;
	}
	public void setPlan_lx_yhdzxs(List<Plan_lx_yhdzx> plan_lx_yhdzxs) {
		this.plan_lx_yhdzxs = plan_lx_yhdzxs;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public String getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	public String getPlanhistorycompara() {
		return planhistorycompara;
	}
	public void setPlanhistorycompara(String planhistorycompara) {
		this.planhistorycompara = planhistorycompara;
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
	public String getYgcode() {
		return ygcode;
	}
	public void setYgcode(String ygcode) {
		this.ygcode = ygcode;
	}
	public String getSpzt() {
		return spzt;
	}
	public void setSpzt(String spzt) {
		this.spzt = spzt;
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
	public Date getSbsj() {
		return sbsj;
	}
	public void setSbsj(Date sbsj) {
		this.sbsj = sbsj;
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
	public String getJsdw() {
		return jsdw;
	}
	public void setJsdw(String jsdw) {
		this.jsdw = jsdw;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getXchsqk() {
		return xchsqk;
	}
	public void setXchsqk(String xchsqk) {
		this.xchsqk = xchsqk;
	}
	public String getAadt() {
		return aadt;
	}
	public void setAadt(String aadt) {
		this.aadt = aadt;
	}
	public String getDianceng() {
		return dianceng;
	}
	public void setDianceng(String dianceng) {
		this.dianceng = dianceng;
	}
	public String getJiceng() {
		return jiceng;
	}
	public void setJiceng(String jiceng) {
		this.jiceng = jiceng;
	}
	public String getSurface() {
		return surface;
	}
	public void setSurface(String surface) {
		this.surface = surface;
	}
	public String getPqi() {
		return pqi;
	}
	public void setPqi(String pqi) {
		this.pqi = pqi;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getReportingfee() {
		return reportingfee;
	}
	public void setReportingfee(String reportingfee) {
		this.reportingfee = reportingfee;
	}
	public String getNewfee() {
		return newfee;
	}
	public void setNewfee(String newfee) {
		this.newfee = newfee;
	}
	public String getTotalinvest() {
		return totalinvest;
	}
	public void setTotalinvest(String totalinvest) {
		this.totalinvest = totalinvest;
	}
	public String getTotalsubsidyfund() {
		return totalsubsidyfund;
	}
	public void setTotalsubsidyfund(String totalsubsidyfund) {
		this.totalsubsidyfund = totalsubsidyfund;
	}
	public String getTotalplacefund() {
		return totalplacefund;
	}
	public void setTotalplacefund(String totalplacefund) {
		this.totalplacefund = totalplacefund;
	}
	public String getAccumulativesubsidyfund() {
		return accumulativesubsidyfund;
	}
	public void setAccumulativesubsidyfund(String accumulativesubsidyfund) {
		this.accumulativesubsidyfund = accumulativesubsidyfund;
	}
	public String getNowyearsubsidyfund() {
		return nowyearsubsidyfund;
	}
	public void setNowyearsubsidyfund(String nowyearsubsidyfund) {
		this.nowyearsubsidyfund = nowyearsubsidyfund;
	}
	public String getConstructnumber() {
		return constructnumber;
	}
	public void setConstructnumber(String constructnumber) {
		this.constructnumber = constructnumber;
	}
	public String getReplynumber() {
		return replynumber;
	}
	public void setReplynumber(String replynumber) {
		this.replynumber = replynumber;
	}
	public String getDevisenumber() {
		return devisenumber;
	}
	public void setDevisenumber(String devisenumber) {
		this.devisenumber = devisenumber;
	}
	public String getPlandownnumber() {
		return plandownnumber;
	}
	public void setPlandownnumber(String plandownnumber) {
		this.plandownnumber = plandownnumber;
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
	public String getGys() {
		return gys;
	}
	public void setGys(String gys) {
		this.gys = gys;
	}
	public String getWjgyy() {
		return wjgyy;
	}
	public void setWjgyy(String wjgyy) {
		this.wjgyy = wjgyy;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getQtbz() {
		return qtbz;
	}
	public void setQtbz(String qtbz) {
		this.qtbz = qtbz;
	}
	public String getJh_sbthcd() {
		return jh_sbthcd;
	}
	public void setJh_sbthcd(String jh_sbthcd) {
		this.jh_sbthcd = jh_sbthcd;
	}
}
