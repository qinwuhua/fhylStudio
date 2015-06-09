package com.hdsx.jxzhpt.qqgl.bean;

public class Cbsj {
	@Override
	public String toString() {
		return "Cbsj [id=" + id + ", xmbm=" + xmbm + ", xmmc=" + xmmc
				+ ", jsdw=" + jsdw + ", xzqh=" + xzqh + ", qdzh=" + qdzh
				+ ", zdzh=" + zdzh + ", jsjsdj=" + jsjsdj + ", jsxz=" + jsxz
				+ ", lj=" + lj + ", ql=" + ql + ", hd=" + hd + ", mc=" + mc
				+ ", jc=" + jc + ", dc=" + dc + ", sd=" + sd + ", dq=" + dq
				+ ", sdmc=" + sdmc + ", kgsj=" + kgsj + ", wgsj=" + wgsj
				+ ", gq=" + gq + ", sjdw=" + sjdw + ", sjpfwh=" + sjpfwh
				+ ", pfsj=" + pfsj + ", jaf=" + jaf + ", sbzt=" + sbzt
				+ ", shzt=" + shzt + ", ghlxbh=" + ghlxbh + ", lxmc=" + lxmc
				+ ", xzqhdm=" + xzqhdm + ", xjsdj=" + xjsdj + ", tsdq=" + tsdq
				+ "]";
	}
	private String id;//唯一ID
	private String xmbm;//项目编码
	private String xmmc;//项目名称
	private String jsdw;//建设单位
	private String xzqh;//行政区划
	private String qdzh;//起点桩号
	private String zdzh;//止点桩号
	private String jsjsdj;//建设技术等级
	private String jsxz;//建设性质
	private String lj;//路基
	private String ql;//桥梁
	private String ql_ym;//桥梁延米
	private String hd;//涵洞
	private String hd_m;//涵洞米
	private String mc;//面层
	private String jc;//基层
	private String dc;//垫层
	private String sd;//隧道（延米/座）
	private String sd_ym;//隧道延米
	private String dq;//大桥（名称/长度/单跨）
	private String dq_cd;//大桥长度
	private String dq_dk;//大桥单跨
	private String sdmc;//隧道（名称/双幅长度/类型）
	private String sd_sfcd;//隧道双幅长度
	private String sd_lx;//隧道类型
	private String kgsj;//开工时间
	private String wgsj;//完工时间
	private String gq;//工期
	private String sjdw;//设计单位
	private String sjpfwh;//设计批复文号
	private String pfsj;//批复时间
	private String jaf;//建安费
	private int sbzt;//上报状态
	private int shzt;//审核状态
	//以上是初步设计表中的字段，以下是立项审核中的字段
	private String ghlxbh;//路线编码
	private String lxmc;//路线名称
	private String xzqhdm;//行政区划代码
	private String xjsdj;//现技术等级
	private String tsdq;//特殊地区
	//附加属性，用于代码判断
	private int xmlx;//项目类型：1—升级项目、2 — 改造项目、3 — 新建
	public int getXmlx() {
		return xmlx;
	}
	public void setXmlx(int xmlx) {
		this.xmlx = xmlx;
	}
	public int getSbzt() {
		return sbzt;
	}
	public void setSbzt(int sbzt) {
		this.sbzt = sbzt;
	}
	public int getShzt() {
		return shzt;
	}
	public void setShzt(int shzt) {
		this.shzt = shzt;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public String getXjsdj() {
		return xjsdj;
	}
	public void setXjsdj(String xjsdj) {
		this.xjsdj = xjsdj;
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	public String getGhlxbh() {
		return ghlxbh;
	}
	public void setGhlxbh(String ghlxbh) {
		this.ghlxbh = ghlxbh;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXmbm() {
		return xmbm;
	}
	public void setXmbm(String xmbm) {
		this.xmbm = xmbm;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getJsdw() {
		return jsdw;
	}
	public void setJsdw(String jsdw) {
		this.jsdw = jsdw;
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
	public String getJsjsdj() {
		return jsjsdj;
	}
	public void setJsjsdj(String jsjsdj) {
		this.jsjsdj = jsjsdj;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}
	public String getLj() {
		return lj;
	}
	public void setLj(String lj) {
		this.lj = lj;
	}
	public String getQl() {
		return ql;
	}
	public void setQl(String ql) {
		this.ql = ql;
	}
	public String getHd() {
		return hd;
	}
	public void setHd(String hd) {
		this.hd = hd;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getJc() {
		return jc;
	}
	public void setJc(String jc) {
		this.jc = jc;
	}
	public String getDc() {
		return dc;
	}
	public void setDc(String dc) {
		this.dc = dc;
	}
	public String getSd() {
		return sd;
	}
	public void setSd(String sd) {
		this.sd = sd;
	}
	public String getDq() {
		return dq;
	}
	public void setDq(String dq) {
		this.dq = dq;
	}
	public String getSdmc() {
		return sdmc;
	}
	public void setSdmc(String sdmc) {
		this.sdmc = sdmc;
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
	public String getSjdw() {
		return sjdw;
	}
	public void setSjdw(String sjdw) {
		this.sjdw = sjdw;
	}
	public String getSjpfwh() {
		return sjpfwh;
	}
	public void setSjpfwh(String sjpfwh) {
		this.sjpfwh = sjpfwh;
	}
	public String getPfsj() {
		return pfsj;
	}
	public void setPfsj(String pfsj) {
		this.pfsj = pfsj;
	}
	public String getJaf() {
		return jaf;
	}
	public void setJaf(String jaf) {
		this.jaf = jaf;
	}
	public String getQl_ym() {
		return ql_ym;
	}
	public void setQl_ym(String ql_ym) {
		this.ql_ym = ql_ym;
	}
	public String getHd_m() {
		return hd_m;
	}
	public void setHd_m(String hd_m) {
		this.hd_m = hd_m;
	}
	public String getSd_ym() {
		return sd_ym;
	}
	public void setSd_ym(String sd_ym) {
		this.sd_ym = sd_ym;
	}
	public String getDq_cd() {
		return dq_cd;
	}
	public void setDq_cd(String dq_cd) {
		this.dq_cd = dq_cd;
	}
	public String getDq_dk() {
		return dq_dk;
	}
	public void setDq_dk(String dq_dk) {
		this.dq_dk = dq_dk;
	}
	public String getSd_sfcd() {
		return sd_sfcd;
	}
	public void setSd_sfcd(String sd_sfcd) {
		this.sd_sfcd = sd_sfcd;
	}
	public String getSd_lx() {
		return sd_lx;
	}
	public void setSd_lx(String sd_lx) {
		this.sd_lx = sd_lx;
	}
}
