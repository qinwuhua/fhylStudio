package com.hdsx.jxzhpt.qqgl.bean;

public class Lx {
	public Lx(){
		super();
	};
	private String jszlc;
	
	public String getJszlc() {
		return jszlc;
	}
	public void setJszlc(String jszlc) {
		this.jszlc = jszlc;
	}
	public Lx(String xmid,String qdzh,String zdzh,String qdmc,String zdmc,String yilc,String erlc,String sanlc,String silc,String dwlc,String wllc){
		super();
		this.xmid=xmid;
		this.qdzh=qdzh;
		this.zdzh=zdzh;
		this.qdmc=qdmc;
		this.zdmc=zdmc;
		this.yilc=yilc;
		this.erlc=erlc;
		this.sanlc=sanlc;
		this.silc=silc;
		this.dwlc=dwlc;
		this.wllc=wllc;
	}
	public Lx(String xmid,String lxbm,String lxmc,String xzqh,
			String xzqhdm, String gydw, String gydwdm, String qdzh,
			String zdzh,String lc,String xjsdj,String jsxz,
			String qdmc, String zdmc,String sffirst){
		this.xmid=xmid;
		this.lxbm=lxbm;
		this.lxmc=lxmc;
		this.xzqh=xzqh;
		this.xzqhdm=xzqhdm;
		this.gydw=gydw;
		this.gydwdm=gydwdm;
		this.qdzh=qdzh;
		this.zdzh=zdzh;
		this.lc=lc;
		this.xjsdj=xjsdj;
		this.jsxz=jsxz;
		this.qdmc=qdmc;
		this.zdmc=zdmc;
		this.sffirst=sffirst;
	}
	
	public Lx(String id, String xmid, String lxbm, String lxmc, String xzqh,
			String xzqhdm, String gydw, String gydwdm, String qdzh,
			String zdzh, String jsjsdj, String lc, String xjsdj, String jsxz,
			String qdmc, String zdmc, String bzcs, String sffirst) {
		super();
		this.id = id;
		this.xmid = xmid;
		this.lxbm = lxbm;
		this.lxmc = lxmc;
		this.xzqh = xzqh;
		this.xzqhdm = xzqhdm;
		this.gydw = gydw;
		this.gydwdm = gydwdm;
		this.qdzh = qdzh;
		this.zdzh = zdzh;
		this.jsjsdj = jsjsdj;
		this.lc = lc;
		this.xjsdj = xjsdj;
		this.jsxz = jsxz;
		this.qdmc = qdmc;
		this.zdmc = zdmc;
		this.bzcs = bzcs;
		this.sffirst = sffirst;
	}
	private String id;//ID
	private String xmid;//项目编码
	private String lxmc;//路线名称
	private String xzqh;//行政区划
	private String xzqhdm;//行政区划代码
	private String gydw;//管养单位
	private String gydwdm;//管养单位代码
	private String lc;//里程
	private String jsxz;//建设性质
	private String qdmc;//起点名称
	private String zdmc;//止点名称
	private String bzcs;//补助测算
	private String sffirst;//是否是第一条路线
	private String ylmlx;//路面类型
	private String jdbs;//阶段备注
	
	private String lxbm;//路线编码
	private String qdzh;//起点桩号
	private String zdzh;//止点桩号
	private String xjsdj;//现技术等级
	private String jsjsdj;//建设技术等级
	private String gpsqdzh;//获取的GPSroad表中的起点装号
	private String gpszdzh;//获取的GPSroad表中的止点桩号
	private String jsfa;//建设方案
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
	private String xjlxbm;//新建路线编码
	private String xjqdzh;//新建起点桩号
	private String xjzdzh;//新建止点桩号
	private String xjlc;//新建里程
	//历史数据字段
	private String ylxbm;//路线编码
	private String yqdzh;//原起点桩号
	private String yzdzh;//原止点桩号
	private String xmmc;//项目名称
	private String xmnf;
	
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getJhyilc() {
		return jhyilc;
	}
	public void setJhyilc(String jhyilc) {
		this.jhyilc = jhyilc;
	}
	public String getJherlc() {
		return jherlc;
	}
	public void setJherlc(String jherlc) {
		this.jherlc = jherlc;
	}
	public String getJhsanlc() {
		return jhsanlc;
	}
	public void setJhsanlc(String jhsanlc) {
		this.jhsanlc = jhsanlc;
	}
	public String getJhsilc() {
		return jhsilc;
	}
	public void setJhsilc(String jhsilc) {
		this.jhsilc = jhsilc;
	}
	public String getJhdwlc() {
		return jhdwlc;
	}
	public void setJhdwlc(String jhdwlc) {
		this.jhdwlc = jhdwlc;
	}
	public String getJhwllc() {
		return jhwllc;
	}
	public void setJhwllc(String jhwllc) {
		this.jhwllc = jhwllc;
	}
	public String getXjlxbm() {
		return xjlxbm;
	}
	public void setXjlxbm(String xjlxbm) {
		this.xjlxbm = xjlxbm;
	}
	public String getXjqdzh() {
		return xjqdzh;
	}
	public void setXjqdzh(String xjqdzh) {
		this.xjqdzh = xjqdzh;
	}
	public String getXjzdzh() {
		return xjzdzh;
	}
	public void setXjzdzh(String xjzdzh) {
		this.xjzdzh = xjzdzh;
	}
	public String getXjlc() {
		return xjlc;
	}
	public void setXjlc(String xjlc) {
		this.xjlc = xjlc;
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
	public String getYlxbm() {
		return ylxbm;
	}
	public void setYlxbm(String ylxbm) {
		this.ylxbm = ylxbm;
	}
	public String getYqdzh() {
		return yqdzh;
	}
	public void setYqdzh(String yqdzh) {
		this.yqdzh = yqdzh;
	}
	public String getYzdzh() {
		return yzdzh;
	}
	public void setYzdzh(String yzdzh) {
		this.yzdzh = yzdzh;
	}
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
	public String getYlmlx() {
		return ylmlx;
	}
	public void setYlmlx(String ylmlx) {
		this.ylmlx = ylmlx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXmid() {
		return xmid;
	}
	public void setXmid(String xmid) {
		this.xmid = xmid;
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
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
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
	public String getLc() {
		return lc;
	}
	public void setLc(String lc) {
		this.lc = lc;
	}
	public String getXjsdj() {
		return xjsdj;
	}
	public void setXjsdj(String xjsdj) {
		this.xjsdj = xjsdj;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
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
	public String getBzcs() {
		return bzcs;
	}
	public void setBzcs(String bzcs) {
		this.bzcs = bzcs;
	}
	public String getSffirst() {
		return sffirst;
	}
	public void setSffirst(String sffirst) {
		this.sffirst = sffirst;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getJsfa() {
		return jsfa;
	}
	public void setJsfa(String jsfa) {
		this.jsfa = jsfa;
	}
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
}
