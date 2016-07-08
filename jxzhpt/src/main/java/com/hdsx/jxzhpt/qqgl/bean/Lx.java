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
	
	public String getSbzj() {
		return sbzj;
	}
	public void setSbzj(String sbzj) {
		this.sbzj = sbzj;
	}
	private String yjsdj;
	private String sbzj;//省补资金
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
	
	
	
	//补助
	private String lqhntmc;
	private String gxlqhntmc;  
	private String snhntmc; 
	private String lqlmjdrzs;  
	private String lqlmcbrzs;  
	private String swjc;  
	private String lqlmpmlqjdlzs;  
	private String lqlmrhlqjdlzs;  
	private String lqlmcblzs;
	private String xzrxjc;  
	private String swjclzs;  
	private String xfc;  
	private String wcsnmb;  
	private String wcswjc;  
	private String snhntmchb;  
	private String bx;  
	private String snhntmcssh;
	//厚度
	private String lqhntmchd;
	private String gxlqhntmchd;  
	private String snhntmchd; 
	private String lqlmjdrzshd;  
	private String lqlmcbrzshd;  
	private String swjchd;  
	private String lqlmpmlqjdlzshd;  
	private String lqlmrhlqjdlzshd;  
	private String lqlmcblzshd;
	private String xzrxjchd;  
	private String swjclzshd;  
	private String xfchd;  
	private String wcsnmbhd;  
	private String wcswjchd;  
	private String snhntmchbhd;  
	private String bxhd;  
	private String snhntmcsshhd;
	//单价
	private String lqhntmcdj;
	private String gxlqhntmcdj;  
	private String snhntmcdj; 
	private String lqlmjdrzsdj;  
	private String lqlmcbrzsdj;  
	private String swjcdj;  
	private String lqlmpmlqjdlzsdj;  
	private String lqlmrhlqjdlzsdj;  
	private String lqlmcblzsdj;
	private String xzrxjcdj;  
	private String swjclzsdj;  
	private String xfcdj;  
	private String wcsnmbdj;  
	private String wcswjcdj;  
	private String snhntmchbdj;  
	private String bxdj;  
	private String snhntmcsshdj;
	private String lmkd;
	private String lxlmkd;
	
	
	
	
	
	
	
	
	
	
	public String getYjsdj() {
		return yjsdj;
	}
	public void setYjsdj(String yjsdj) {
		this.yjsdj = yjsdj;
	}
	public String getLxlmkd() {
		return lxlmkd;
	}
	public void setLxlmkd(String lxlmkd) {
		this.lxlmkd = lxlmkd;
	}
	public String getLmkd() {
		return lmkd;
	}
	public void setLmkd(String lmkd) {
		this.lmkd = lmkd;
	}
	public String getLqhntmc() {
		return lqhntmc;
	}
	public void setLqhntmc(String lqhntmc) {
		this.lqhntmc = lqhntmc;
	}
	public String getGxlqhntmc() {
		return gxlqhntmc;
	}
	public void setGxlqhntmc(String gxlqhntmc) {
		this.gxlqhntmc = gxlqhntmc;
	}
	public String getSnhntmc() {
		return snhntmc;
	}
	public void setSnhntmc(String snhntmc) {
		this.snhntmc = snhntmc;
	}
	public String getLqlmjdrzs() {
		return lqlmjdrzs;
	}
	public void setLqlmjdrzs(String lqlmjdrzs) {
		this.lqlmjdrzs = lqlmjdrzs;
	}
	public String getLqlmcbrzs() {
		return lqlmcbrzs;
	}
	public void setLqlmcbrzs(String lqlmcbrzs) {
		this.lqlmcbrzs = lqlmcbrzs;
	}
	public String getSwjc() {
		return swjc;
	}
	public void setSwjc(String swjc) {
		this.swjc = swjc;
	}
	public String getLqlmpmlqjdlzs() {
		return lqlmpmlqjdlzs;
	}
	public void setLqlmpmlqjdlzs(String lqlmpmlqjdlzs) {
		this.lqlmpmlqjdlzs = lqlmpmlqjdlzs;
	}
	public String getLqlmrhlqjdlzs() {
		return lqlmrhlqjdlzs;
	}
	public void setLqlmrhlqjdlzs(String lqlmrhlqjdlzs) {
		this.lqlmrhlqjdlzs = lqlmrhlqjdlzs;
	}
	public String getLqlmcblzs() {
		return lqlmcblzs;
	}
	public void setLqlmcblzs(String lqlmcblzs) {
		this.lqlmcblzs = lqlmcblzs;
	}
	public String getXzrxjc() {
		return xzrxjc;
	}
	public void setXzrxjc(String xzrxjc) {
		this.xzrxjc = xzrxjc;
	}
	public String getSwjclzs() {
		return swjclzs;
	}
	public void setSwjclzs(String swjclzs) {
		this.swjclzs = swjclzs;
	}
	public String getXfc() {
		return xfc;
	}
	public void setXfc(String xfc) {
		this.xfc = xfc;
	}
	public String getWcsnmb() {
		return wcsnmb;
	}
	public void setWcsnmb(String wcsnmb) {
		this.wcsnmb = wcsnmb;
	}
	public String getWcswjc() {
		return wcswjc;
	}
	public void setWcswjc(String wcswjc) {
		this.wcswjc = wcswjc;
	}
	public String getSnhntmchb() {
		return snhntmchb;
	}
	public void setSnhntmchb(String snhntmchb) {
		this.snhntmchb = snhntmchb;
	}
	public String getBx() {
		return bx;
	}
	public void setBx(String bx) {
		this.bx = bx;
	}
	public String getSnhntmcssh() {
		return snhntmcssh;
	}
	public void setSnhntmcssh(String snhntmcssh) {
		this.snhntmcssh = snhntmcssh;
	}
	public String getLqhntmchd() {
		return lqhntmchd;
	}
	public void setLqhntmchd(String lqhntmchd) {
		this.lqhntmchd = lqhntmchd;
	}
	public String getGxlqhntmchd() {
		return gxlqhntmchd;
	}
	public void setGxlqhntmchd(String gxlqhntmchd) {
		this.gxlqhntmchd = gxlqhntmchd;
	}
	public String getSnhntmchd() {
		return snhntmchd;
	}
	public void setSnhntmchd(String snhntmchd) {
		this.snhntmchd = snhntmchd;
	}
	public String getLqlmjdrzshd() {
		return lqlmjdrzshd;
	}
	public void setLqlmjdrzshd(String lqlmjdrzshd) {
		this.lqlmjdrzshd = lqlmjdrzshd;
	}
	public String getLqlmcbrzshd() {
		return lqlmcbrzshd;
	}
	public void setLqlmcbrzshd(String lqlmcbrzshd) {
		this.lqlmcbrzshd = lqlmcbrzshd;
	}
	public String getSwjchd() {
		return swjchd;
	}
	public void setSwjchd(String swjchd) {
		this.swjchd = swjchd;
	}
	public String getLqlmpmlqjdlzshd() {
		return lqlmpmlqjdlzshd;
	}
	public void setLqlmpmlqjdlzshd(String lqlmpmlqjdlzshd) {
		this.lqlmpmlqjdlzshd = lqlmpmlqjdlzshd;
	}
	public String getLqlmrhlqjdlzshd() {
		return lqlmrhlqjdlzshd;
	}
	public void setLqlmrhlqjdlzshd(String lqlmrhlqjdlzshd) {
		this.lqlmrhlqjdlzshd = lqlmrhlqjdlzshd;
	}
	public String getLqlmcblzshd() {
		return lqlmcblzshd;
	}
	public void setLqlmcblzshd(String lqlmcblzshd) {
		this.lqlmcblzshd = lqlmcblzshd;
	}
	public String getXzrxjchd() {
		return xzrxjchd;
	}
	public void setXzrxjchd(String xzrxjchd) {
		this.xzrxjchd = xzrxjchd;
	}
	public String getSwjclzshd() {
		return swjclzshd;
	}
	public void setSwjclzshd(String swjclzshd) {
		this.swjclzshd = swjclzshd;
	}
	public String getXfchd() {
		return xfchd;
	}
	public void setXfchd(String xfchd) {
		this.xfchd = xfchd;
	}
	public String getWcsnmbhd() {
		return wcsnmbhd;
	}
	public void setWcsnmbhd(String wcsnmbhd) {
		this.wcsnmbhd = wcsnmbhd;
	}
	public String getWcswjchd() {
		return wcswjchd;
	}
	public void setWcswjchd(String wcswjchd) {
		this.wcswjchd = wcswjchd;
	}
	public String getSnhntmchbhd() {
		return snhntmchbhd;
	}
	public void setSnhntmchbhd(String snhntmchbhd) {
		this.snhntmchbhd = snhntmchbhd;
	}
	public String getBxhd() {
		return bxhd;
	}
	public void setBxhd(String bxhd) {
		this.bxhd = bxhd;
	}
	public String getSnhntmcsshhd() {
		return snhntmcsshhd;
	}
	public void setSnhntmcsshhd(String snhntmcsshhd) {
		this.snhntmcsshhd = snhntmcsshhd;
	}
	public String getLqhntmcdj() {
		return lqhntmcdj;
	}
	public void setLqhntmcdj(String lqhntmcdj) {
		this.lqhntmcdj = lqhntmcdj;
	}
	public String getGxlqhntmcdj() {
		return gxlqhntmcdj;
	}
	public void setGxlqhntmcdj(String gxlqhntmcdj) {
		this.gxlqhntmcdj = gxlqhntmcdj;
	}
	public String getSnhntmcdj() {
		return snhntmcdj;
	}
	public void setSnhntmcdj(String snhntmcdj) {
		this.snhntmcdj = snhntmcdj;
	}
	public String getLqlmjdrzsdj() {
		return lqlmjdrzsdj;
	}
	public void setLqlmjdrzsdj(String lqlmjdrzsdj) {
		this.lqlmjdrzsdj = lqlmjdrzsdj;
	}
	public String getLqlmcbrzsdj() {
		return lqlmcbrzsdj;
	}
	public void setLqlmcbrzsdj(String lqlmcbrzsdj) {
		this.lqlmcbrzsdj = lqlmcbrzsdj;
	}
	public String getSwjcdj() {
		return swjcdj;
	}
	public void setSwjcdj(String swjcdj) {
		this.swjcdj = swjcdj;
	}
	public String getLqlmpmlqjdlzsdj() {
		return lqlmpmlqjdlzsdj;
	}
	public void setLqlmpmlqjdlzsdj(String lqlmpmlqjdlzsdj) {
		this.lqlmpmlqjdlzsdj = lqlmpmlqjdlzsdj;
	}
	public String getLqlmrhlqjdlzsdj() {
		return lqlmrhlqjdlzsdj;
	}
	public void setLqlmrhlqjdlzsdj(String lqlmrhlqjdlzsdj) {
		this.lqlmrhlqjdlzsdj = lqlmrhlqjdlzsdj;
	}
	public String getLqlmcblzsdj() {
		return lqlmcblzsdj;
	}
	public void setLqlmcblzsdj(String lqlmcblzsdj) {
		this.lqlmcblzsdj = lqlmcblzsdj;
	}
	public String getXzrxjcdj() {
		return xzrxjcdj;
	}
	public void setXzrxjcdj(String xzrxjcdj) {
		this.xzrxjcdj = xzrxjcdj;
	}
	public String getSwjclzsdj() {
		return swjclzsdj;
	}
	public void setSwjclzsdj(String swjclzsdj) {
		this.swjclzsdj = swjclzsdj;
	}
	public String getXfcdj() {
		return xfcdj;
	}
	public void setXfcdj(String xfcdj) {
		this.xfcdj = xfcdj;
	}
	public String getWcsnmbdj() {
		return wcsnmbdj;
	}
	public void setWcsnmbdj(String wcsnmbdj) {
		this.wcsnmbdj = wcsnmbdj;
	}
	public String getWcswjcdj() {
		return wcswjcdj;
	}
	public void setWcswjcdj(String wcswjcdj) {
		this.wcswjcdj = wcswjcdj;
	}
	public String getSnhntmchbdj() {
		return snhntmchbdj;
	}
	public void setSnhntmchbdj(String snhntmchbdj) {
		this.snhntmchbdj = snhntmchbdj;
	}
	public String getBxdj() {
		return bxdj;
	}
	public void setBxdj(String bxdj) {
		this.bxdj = bxdj;
	}
	public String getSnhntmcsshdj() {
		return snhntmcsshdj;
	}
	public void setSnhntmcsshdj(String snhntmcsshdj) {
		this.snhntmcsshdj = snhntmcsshdj;
	}
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
