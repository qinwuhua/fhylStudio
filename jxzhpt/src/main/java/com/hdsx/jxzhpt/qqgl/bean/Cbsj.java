package com.hdsx.jxzhpt.qqgl.bean;

public class Cbsj {
	@Override
	public String toString() {
		return "Cbsj [id=" + id + ", xmbm=" + xmbm + ", xmmc=" + xmmc
				+ ", jsdw=" + jsdw + ", xzqh=" + xzqh + ", qdzh=" + qdzh
				+ ", zdzh=" + zdzh + ", jsjsdj=" + jsjsdj + ", jsxz=" + jsxz
				+ ", lj=" + lj + ", ql=" + ql + ", ql_ym=" + ql_ym + ", hd="
				+ hd + ", hd_m=" + hd_m + ", mc=" + mc + ", mc_lc=" + mc_lc
				+ ", jc=" + jc + ", jc_lc=" + jc_lc + ", dc=" + dc + ", dc_lc="
				+ dc_lc + ", sd=" + sd + ", sd_ym=" + sd_ym + ", dq=" + dq
				+ ", dq_cd=" + dq_cd + ", dq_dk=" + dq_dk + ", sdmc=" + sdmc
				+ ", sd_sfcd=" + sd_sfcd + ", sd_lx=" + sd_lx + ", kgsj="
				+ kgsj + ", wgsj=" + wgsj + ", gq=" + gq + ", sjdw=" + sjdw
				+ ", sjpfwh=" + sjpfwh + ", pfsj=" + pfsj + ", jaf=" + jaf
				+ ", sbzt=" + sbzt + ", shzt=" + shzt + ", sfbj=" + sfbj
				+ ", lc=" + lc + ", ghlxbh=" + ghlxbh + ", lxmc=" + lxmc
				+ ", xzqhdm=" + xzqhdm + ", xjsdj=" + xjsdj + ", tsdq=" + tsdq
				+ ", qdmc=" + qdmc + ", zdmc=" + zdmc + ", xmlx=" + xmlx
				+ ", ylxbh=" + ylxbh + ", jsfa=" + jsfa + ", lsjl=" + lsjl
				+ ", jdbs=" + jdbs + ", gpsqdzh=" + gpsqdzh + ", gpszdzh="
				+ gpszdzh + "]";
	}
	private String gcfl;//工程分类
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
	private String mc;//面层类型
	private String mc_lc;//面层里程
	private String jc;//基层类型
	private String jc_lc;//基层里程
	private String dc;//垫层类型
	private String dc_lc;//垫层里程
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
	private String sfbj;//是否编辑
	private String lc;//里程
	//以上是初步设计表中的字段，以下是立项审核中的字段
	private String ghlxbh;//路线编码
	private String lxmc;//路线名称
	private String xzqhdm;//行政区划代码
	private String xjsdj;//现技术等级
	private String tsdq;//特殊地区
	//路线字段
	private String qdmc;//起点桩号
	private String zdmc;//止点桩号
	//附加属性，用于代码判断
	private int xmlx;//项目类型：1—升级项目、2 — 改造项目、3 — 新建
	//路线编码
	private String ylxbh;//路线编码
	private String jsfa;//建设方案
	private String lsjl;;//是否有历史记录
	private String jdbs;//阶段标示
	private String gpsqdzh;//GPSRoad中的起点桩号
	private String gpszdzh;//GPSRoad中的止点桩号
	private String xjlxbm;//新建录像编码
	private String xjqdzh;//新建起点桩号
	private String xjzdzh;//新建止点桩号
	private String xjlc;//新建里程
	private String yilc;//一级公路里程
	private String erlc;//二级公路里程
	private String sanlc;//三级公路里程
	private String silc;//四级公路里程
	private String dwlc;//等外公路里程
	private String wllc;//无路里程
	private String jhyilc;//建设后一级公路里程
	private String jherlc;//建设后二级公路里程
	private String jhsanlc;//建设后三级公路里程
	private String jhsilc;//建设后四级公路里程
	private String jhdwlc;//建设后等外公路里程
	private String jhwllc;//建设后无路里程
	private String dfzc;//地方自筹
	private String yhdk;//银行贷款
	private String jszlc;//建设总里程
	private String xmsl;//路线数量
	public String getXmsl() {
		return xmsl;
	}
	public void setXmsl(String xmsl) {
		this.xmsl = xmsl;
	}
	public String getJszlc() {
		return jszlc;
	}
	public void setJszlc(String jszlc) {
		this.jszlc = jszlc;
	}
	public String getDfzc() {
		return dfzc;
	}
	public void setDfzc(String dfzc) {
		this.dfzc = dfzc.trim();
	}
	public String getYhdk() {
		return yhdk;
	}
	public void setYhdk(String yhdk) {
		this.yhdk = yhdk.trim();
	}
	public String getXjlxbm() {
		return xjlxbm;
	}
	public void setXjlxbm(String xjlxbm) {
		this.xjlxbm = xjlxbm.trim();
	}
	public String getXjqdzh() {
		return xjqdzh;
	}
	public void setXjqdzh(String xjqdzh) {
		this.xjqdzh = xjqdzh.trim();
	}
	public String getXjzdzh() {
		return xjzdzh;
	}
	public void setXjzdzh(String xjzdzh) {
		this.xjzdzh = xjzdzh.trim();
	}
	public String getXjlc() {
		return xjlc;
	}
	public void setXjlc(String xjlc) {
		this.xjlc = xjlc.trim();
	}
	public String getJhyilc() {
		return jhyilc;
	}
	public void setJhyilc(String jhyilc) {
		this.jhyilc = jhyilc.trim();
	}
	public String getJherlc() {
		return jherlc;
	}
	public void setJherlc(String jherlc) {
		this.jherlc = jherlc.trim();
	}
	public String getJhsanlc() {
		return jhsanlc;
	}
	public void setJhsanlc(String jhsanlc) {
		this.jhsanlc = jhsanlc.trim();
	}
	public String getJhsilc() {
		return jhsilc;
	}
	public void setJhsilc(String jhsilc) {
		this.jhsilc = jhsilc.trim();
	}
	public String getJhdwlc() {
		return jhdwlc;
	}
	public void setJhdwlc(String jhdwlc) {
		this.jhdwlc = jhdwlc.trim();
	}
	public String getJhwllc() {
		return jhwllc;
	}
	public void setJhwllc(String jhwllc) {
		this.jhwllc = jhwllc.trim();
	}
	public String getYilc() {
		return yilc;
	}
	public void setYilc(String yilc) {
		this.yilc = yilc.trim();
	}
	public String getErlc() {
		return erlc;
	}
	public void setErlc(String erlc) {
		this.erlc = erlc.trim();
	}
	public String getSanlc() {
		return sanlc;
	}
	public void setSanlc(String sanlc) {
		this.sanlc = sanlc.trim();
	}
	public String getSilc() {
		return silc;
	}
	public void setSilc(String silc) {
		this.silc = silc.trim();
	}
	public String getDwlc() {
		return dwlc;
	}
	public void setDwlc(String dwlc) {
		this.dwlc = dwlc.trim();
	}
	public String getWllc() {
		return wllc;
	}
	public void setWllc(String wllc) {
		this.wllc = wllc.trim();
	}
	public String getGpsqdzh() {
		return gpsqdzh;
	}
	public void setGpsqdzh(String gpsqdzh) {
		this.gpsqdzh = gpsqdzh.trim();
	}
	public String getGpszdzh() {
		return gpszdzh;
	}
	public void setGpszdzh(String gpszdzh) {
		this.gpszdzh = gpszdzh.trim();
	}
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl.trim();
	}
	public String getJsfa() {
		return jsfa;
	}
	public void setJsfa(String jsfa) {
		this.jsfa = jsfa.trim();
	}
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
		this.tsdq = tsdq.trim();
	}
	public String getXjsdj() {
		return xjsdj;
	}
	public void setXjsdj(String xjsdj) {
		this.xjsdj = xjsdj.trim();
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm.trim();
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc.trim();
	}
	public String getGhlxbh() {
		return ghlxbh;
	}
	public void setGhlxbh(String ghlxbh) {
		this.ghlxbh = ghlxbh.trim();
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
		this.xmmc = xmmc.trim();
	}
	public String getJsdw() {
		return jsdw;
	}
	public void setJsdw(String jsdw) {
		this.jsdw = jsdw.trim();
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh.trim();
	}
	public String getQdzh() {
		return qdzh;
	}
	public void setQdzh(String qdzh) {
		this.qdzh = qdzh.trim();
	}
	public String getZdzh() {
		return zdzh;
	}
	public void setZdzh(String zdzh) {
		this.zdzh = zdzh.trim();
	}
	public String getJsjsdj() {
		return jsjsdj;
	}
	public void setJsjsdj(String jsjsdj) {
		this.jsjsdj = jsjsdj.trim();
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz.trim();
	}
	public String getLj() {
		return lj;
	}
	public void setLj(String lj) {
		this.lj = lj.trim();
	}
	public String getQl() {
		return ql;
	}
	public void setQl(String ql) {
		this.ql = ql.trim();
	}
	public String getHd() {
		return hd;
	}
	public void setHd(String hd) {
		this.hd = hd.trim();
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc.trim();
	}
	public String getJc() {
		return jc;
	}
	public void setJc(String jc) {
		this.jc = jc.trim();
	}
	public String getDc() {
		return dc;
	}
	public void setDc(String dc) {
		this.dc = dc.trim();
	}
	public String getSd() {
		return sd;
	}
	public void setSd(String sd) {
		this.sd = sd.trim();
	}
	public String getDq() {
		return dq;
	}
	public void setDq(String dq) {
		this.dq = dq.trim();
	}
	public String getSdmc() {
		return sdmc;
	}
	public void setSdmc(String sdmc) {
		this.sdmc = sdmc.trim();
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
		this.gq = gq.trim();
	}
	public String getSjdw() {
		return sjdw;
	}
	public void setSjdw(String sjdw) {
		this.sjdw = sjdw.trim();
	}
	public String getSjpfwh() {
		return sjpfwh;
	}
	public void setSjpfwh(String sjpfwh) {
		this.sjpfwh = sjpfwh.trim();
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
		this.jaf = jaf.trim();
	}
	public String getQl_ym() {
		return ql_ym;
	}
	public void setQl_ym(String ql_ym) {
		this.ql_ym = ql_ym.trim();
	}
	public String getHd_m() {
		return hd_m;
	}
	public void setHd_m(String hd_m) {
		this.hd_m = hd_m.trim();
	}
	public String getSd_ym() {
		return sd_ym;
	}
	public void setSd_ym(String sd_ym) {
		this.sd_ym = sd_ym.trim();
	}
	public String getDq_cd() {
		return dq_cd;
	}
	public void setDq_cd(String dq_cd) {
		this.dq_cd = dq_cd.trim();
	}
	public String getDq_dk() {
		return dq_dk;
	}
	public void setDq_dk(String dq_dk) {
		this.dq_dk = dq_dk.trim();
	}
	public String getSd_sfcd() {
		return sd_sfcd;
	}
	public void setSd_sfcd(String sd_sfcd) {
		this.sd_sfcd = sd_sfcd.trim();
	}
	public String getSd_lx() {
		return sd_lx;
	}
	public void setSd_lx(String sd_lx) {
		this.sd_lx = sd_lx.trim();
	}
	public String getSfbj() {
		return sfbj;
	}
	public void setSfbj(String sfbj) {
		this.sfbj = sfbj;
	}
	public String getMc_lc() {
		return mc_lc;
	}
	public void setMc_lc(String mc_lc) {
		this.mc_lc = mc_lc.trim();
	}
	public String getJc_lc() {
		return jc_lc;
	}
	public void setJc_lc(String jc_lc) {
		this.jc_lc = jc_lc.trim();
	}
	public String getDc_lc() {
		return dc_lc;
	}
	public void setDc_lc(String dc_lc) {
		this.dc_lc = dc_lc.trim();
	}
	public String getYlxbh() {
		return ylxbh;
	}
	public void setYlxbh(String ylxbh) {
		this.ylxbh = ylxbh.trim();
	}
	public String getQdmc() {
		return qdmc;
	}
	public void setQdmc(String qdmc) {
		this.qdmc = qdmc.trim();
	}
	public String getZdmc() {
		return zdmc;
	}
	public void setZdmc(String zdmc) {
		this.zdmc = zdmc.trim();
	}
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
	public String getLc() {
		return lc;
	}
	public void setLc(String lc) {
		this.lc = lc.trim();
	}
	public String getGcfl() {
		return gcfl;
	}
	public void setGcfl(String gcfl) {
		this.gcfl = gcfl;
	}
}
