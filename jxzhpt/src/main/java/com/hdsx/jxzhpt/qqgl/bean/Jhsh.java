package com.hdsx.jxzhpt.qqgl.bean;

public class Jhsh {
	@Override
	public String toString() {
		return "Jhsh [id=" + id + ", xmmc=" + xmmc + ", xmbm=" + xmbm
				+ ", xzqh=" + xzqh + ", qdzh=" + qdzh + ", zdzh=" + zdzh
				+ ", kgsj=" + kgsj + ", wgsj=" + wgsj + ", gq=" + gq
				+ ", gkpfwh=" + gkpfwh + ", sjpfwh=" + sjpfwh + ", xdwh="
				+ xdwh + ", xdsj=" + xdsj + ", pfztz=" + pfztz + ", bbzzj="
				+ bbzzj + ", sbzzj=" + sbzzj + ", xdzt=" + xdzt + ", ghlxbh="
				+ ghlxbh + ", xzqhdm=" + xzqhdm + ", lsjl=" + lsjl + ", xmlx="
				+ xmlx + ", tsdq=" + tsdq + ", ylxbh=" + ylxbh + ", gcfl="
				+ gcfl + ", jhkgsj=" + jhkgsj + ", jhwgsj=" + jhwgsj + ", lc="
				+ lc + ", ztz=" + ztz + ", sysbbzj=" + sysbbzj + ", yqdbcgs="
				+ yqdbcgs + ", mclmlx=" + mclmlx + ", mclx=" + mclx + ", mcsl="
				+ mcsl + ", mcje=" + mcje + ", jclx=" + jclx + ", jcsl=" + jcsl
				+ ", jcje=" + jcje + ", xfcsl=" + xfcsl + ", xfcje=" + xfcje
				+ ", bxsl=" + bxsl + ", bxje=" + bxje + ", gfcd=" + gfcd
				+ ", gfje=" + gfje + ", llcl=" + llcl + ", jsdj=" + jsdj
				+ ", gydw=" + gydw + ", qdmc=" + qdmc + ", zdmc=" + zdmc
				+ ", gpsqdzh=" + gpsqdzh + ", gpszdzh=" + gpszdzh + ", yilc="
				+ yilc + ", erlc=" + erlc + ", sanlc=" + sanlc + ", silc="
				+ silc + ", dwlc=" + dwlc + ", wllc=" + wllc + "]";
	}
	private String id;//ID
	private String xmmc;//项目名称
	private String xmbm;//项目编码
	private String xzqh;//行政区划
	private String qdzh;//起点桩号
	private String zdzh;//止点桩号
	private String kgsj;//开工时间
	private String wgsj;//完工时间
	private String gq;//工期
	private String gkpfwh;//工可批复文号
	private String sjpfwh;//设计批复文号
	private String xdwh;//下达文号
	private String xdsj;//下达时间
	private String pfztz;//批复总投资
	private String bbzzj;//部补助投资
	private String sbzzj;//省补助资金
	private int xdzt;//下达状态
	//用到立项审核表中的数据
	private String ghlxbh;//路线编码
	private String xzqhdm;//行政区划代码
	private String lsjl;//历史记录
	//附加属性，用于代码判断
	private int xmlx;//项目类型：1—升级项目、2 — 改造项目、3 — 新建
	private String tsdq;//特殊地区
	//养护和水毁的字段
	private String ylxbh;//原路线编号
	private String gcfl;//工程分类
	private String jhkgsj;//计划开工时间
	private String jhwgsj;//计划完工时间
	private String lc;//里程
	private String ztz;//总投资
	private String sysbbzj;//省以上补助资金
	private String yqdbcgs;//以确定部车购税
	private String mclmlx;//面层路面类型
	private String mclx;//面层类型
	private String mcsl;//面层数量
	private String mcje;//面层金额
	private String jclx;//基层类型
	private String jcsl;//基层数量
	private String jcje;//基层金额
	private String xfcsl;//下封层数量
	private String xfcje;//下封层金额
	private String bxsl;//标线数量
	private String bxje;//标线金额
	private String gfcd;//灌缝路线长度
	private String gfje;//灌缝金额
	private String llcl;//老路处理
	private String jsdj;//技术等级
	//用于路线信息的字段
	private String gydw;//管养单位
	private String qdmc;//起点名称
	private String zdmc;//止点名称
	private String gpsqdzh;//GPSRoad中的起点桩号
	private String gpszdzh;//GPSRoad中的止点桩号
	private String yilc;//一级公路里程
	private String erlc;//二级公路里程
	private String sanlc;//三级公路里程
	private String silc;//四级公路里程
	private String dwlc;//等外公路里程
	private String wllc;//高速公路里程
	public String getYilc() {
		return yilc;
	}
	public void setYilc(String yilc) {
		this.yilc = yilc;
	}
	public String getErlc() {
		return erlc;
	}
	public void setErlc(String erlc) {
		this.erlc = erlc;
	}
	public String getSanlc() {
		return sanlc;
	}
	public void setSanlc(String sanlc) {
		this.sanlc = sanlc;
	}
	public String getSilc() {
		return silc;
	}
	public void setSilc(String silc) {
		this.silc = silc;
	}
	public String getDwlc() {
		return dwlc;
	}
	public void setDwlc(String dwlc) {
		this.dwlc = dwlc;
	}
	public String getWllc() {
		return wllc;
	}
	public void setWllc(String wllc) {
		this.wllc = wllc;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getGpsqdzh() {
		return gpsqdzh;
	}
	public void setGpsqdzh(String gpsqdzh) {
		this.gpsqdzh = gpsqdzh;
	}
	public String getGpszdzh() {
		return gpszdzh;
	}
	public void setGpszdzh(String gpszdzh) {
		this.gpszdzh = gpszdzh;
	}
	public String getQdmc() {
		return qdmc;
	}
	public void setQdmc(String qdmc) {
		this.qdmc = qdmc;
	}
	public String getZdmc() {
		return zdmc;
	}
	public void setZdmc(String zdmc) {
		this.zdmc = zdmc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getXmbm() {
		return xmbm;
	}
	public void setXmbm(String xmbm) {
		this.xmbm = xmbm;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
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
	public String getKgsj() {
		return kgsj;
	}
	public void setKgsj(String kgsj) {
		this.kgsj = kgsj;
	}
	public String getWgsj() {
		return wgsj;
	}
	public void setWgsj(String wgsj) {
		this.wgsj = wgsj;
	}
	public String getGq() {
		return gq;
	}
	public void setGq(String gq) {
		this.gq = gq;
	}
	public String getGkpfwh() {
		return gkpfwh;
	}
	public void setGkpfwh(String gkpfwh) {
		this.gkpfwh = gkpfwh;
	}
	public String getSjpfwh() {
		return sjpfwh;
	}
	public void setSjpfwh(String sjpfwh) {
		this.sjpfwh = sjpfwh;
	}
	public String getXdwh() {
		return xdwh;
	}
	public void setXdwh(String xdwh) {
		this.xdwh = xdwh;
	}
	public String getXdsj() {
		return xdsj;
	}
	public void setXdsj(String xdsj) {
		this.xdsj = xdsj;
	}
	public String getPfztz() {
		return pfztz;
	}
	public void setPfztz(String pfztz) {
		this.pfztz = pfztz;
	}
	public String getBbzzj() {
		return bbzzj;
	}
	public void setBbzzj(String bbzzj) {
		this.bbzzj = bbzzj;
	}
	public String getSbzzj() {
		return sbzzj;
	}
	public void setSbzzj(String sbzzj) {
		this.sbzzj = sbzzj;
	}
	public String getGhlxbh() {
		return ghlxbh;
	}
	public void setGhlxbh(String ghlxbh) {
		this.ghlxbh = ghlxbh;
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
	}
	public int getXmlx() {
		return xmlx;
	}
	public void setXmlx(int xmlx) {
		this.xmlx = xmlx;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public int getXdzt() {
		return xdzt;
	}
	public void setXdzt(int xdzt) {
		this.xdzt = xdzt;
	}
	public String getYlxbh() {
		return ylxbh;
	}
	public void setYlxbh(String ylxbh) {
		this.ylxbh = ylxbh;
	}
	public String getGcfl() {
		return gcfl;
	}
	public void setGcfl(String gcfl) {
		this.gcfl = gcfl;
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
	public String getLc() {
		return lc;
	}
	public void setLc(String lc) {
		this.lc = lc;
	}
	public String getZtz() {
		return ztz;
	}
	public void setZtz(String ztz) {
		this.ztz = ztz;
	}
	public String getSysbbzj() {
		return sysbbzj;
	}
	public void setSysbbzj(String sysbbzj) {
		this.sysbbzj = sysbbzj;
	}
	public String getYqdbcgs() {
		return yqdbcgs;
	}
	public void setYqdbcgs(String yqdbcgs) {
		this.yqdbcgs = yqdbcgs;
	}
	public String getMclmlx() {
		return mclmlx;
	}
	public void setMclmlx(String mclmlx) {
		this.mclmlx = mclmlx;
	}
	public String getMclx() {
		return mclx;
	}
	public void setMclx(String mclx) {
		this.mclx = mclx;
	}
	public String getMcsl() {
		return mcsl;
	}
	public void setMcsl(String mcsl) {
		this.mcsl = mcsl;
	}
	public String getMcje() {
		return mcje;
	}
	public void setMcje(String mcje) {
		this.mcje = mcje;
	}
	public String getJclx() {
		return jclx;
	}
	public void setJclx(String jclx) {
		this.jclx = jclx;
	}
	public String getJcsl() {
		return jcsl;
	}
	public void setJcsl(String jcsl) {
		this.jcsl = jcsl;
	}
	public String getJcje() {
		return jcje;
	}
	public void setJcje(String jcje) {
		this.jcje = jcje;
	}
	public String getXfcsl() {
		return xfcsl;
	}
	public void setXfcsl(String xfcsl) {
		this.xfcsl = xfcsl;
	}
	public String getXfcje() {
		return xfcje;
	}
	public void setXfcje(String xfcje) {
		this.xfcje = xfcje;
	}
	public String getBxsl() {
		return bxsl;
	}
	public void setBxsl(String bxsl) {
		this.bxsl = bxsl;
	}
	public String getBxje() {
		return bxje;
	}
	public void setBxje(String bxje) {
		this.bxje = bxje;
	}
	public String getGfcd() {
		return gfcd;
	}
	public void setGfcd(String gfcd) {
		this.gfcd = gfcd;
	}
	public String getGfje() {
		return gfje;
	}
	public void setGfje(String gfje) {
		this.gfje = gfje;
	}
	public String getLlcl() {
		return llcl;
	}
	public void setLlcl(String llcl) {
		this.llcl = llcl;
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl;
	}
}
