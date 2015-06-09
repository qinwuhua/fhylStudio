package com.hdsx.jxzhpt.qqgl.bean;

public class Jhsh {
	@Override
	public String toString() {
		return "Jhsh [id=" + id + ", xmmc=" + xmmc + ", xmbm=" + xmbm
				+ ", xzqh=" + xzqh + ", qdzh=" + qdzh + ", zdzh=" + zdzh
				+ ", kgsj=" + kgsj + ", wgsj=" + wgsj + ", gq=" + gq
				+ ", gkpfwh=" + gkpfwh + ", sjpfwh=" + sjpfwh + ", xdwh="
				+ xdwh + ", xdsj=" + xdsj + ", pfztz=" + pfztz + ", bbzzj="
				+ bbzzj + ", sbzzj=" + sbzzj + ", ghlxbh=" + ghlxbh
				+ ", xzqhdm=" + xzqhdm + ", xmlx=" + xmlx + "]";
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
	//附加属性，用于代码判断
	private int xmlx;//项目类型：1—升级项目、2 — 改造项目、3 — 新建
	private String tsdq;//特殊地区
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
}
