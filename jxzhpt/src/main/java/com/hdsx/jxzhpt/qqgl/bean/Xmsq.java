package com.hdsx.jxzhpt.qqgl.bean;

public class Xmsq {
	private String id;
	private String xmbm;//项目编码
	private String xmmc;//项目名称
	private String gcfl;//工程分类
	private String ghlxbh;//路线编号
	private String ylxbh;//原路线编号
	private String xzqh;//行政区划
	private String xzqhdm;//行政区划代码
	private String qdzh;//起点桩号
	private String zdzh;//止点桩号
	private String lc;//里程
	private String lmkd;//路面宽度
	private String jsdj;//技术等级
	private String ntz;//总投资
	private String jhkgsj;//计划开工时间
	private String jhwgsj;//计划完工时间
	private String gq;//工期（月）
	private String tsdq;//特殊地区
	private String gydw;//管养单位
	private String gydwdm;//管养单位代码
	private String jsfa;//建设方案
	private String lsjl;//历史记录
	private int sqzt;//申请状态
	private int xmlx;//项目类型 1：养护大中修；2：水毁  6：养护中心项目（zyy add 2016.1.12）
	private String qdmc;//起点名称
	private String zdmc;//止点名称
	private String jdbs;//阶段标示
	private String bz;//备注
	//----------------附加属性、路线表中的字段
	private String lxmc;//路线名称
	private String gpsqdzh;//GPSRoad中的起点桩号
	private String gpszdzh;//GPSRoad中的止点桩号
	private String xmsl;//路线数量
	
	private String yilc;//一级公路里程
	private String erlc;//二级公路里程
	private String sanlc;//三级公路里程
	private String silc;//四级公路里程
	private String dwlc;//等外公路里程
	private String wllc;//高速公路里程
	private String xmnf;
	
	//zyy add 2016.1.12
	private String qsmc;//区市名称
	private String xjmc;//县级名称
	private String jb;//级别 1--市级2--省级
	private String jsxz;//建设性质 1-新建2-扩建3-改建
	private String ydbmc;//原道班名称
	private String ztz;//总投资
	private String zbzzj;//总补助资金
	private String sbzzj;//省补助资金
	private String zddzjl;//重点打造奖励
	private String dfzc;//地方自筹资金
	private String lxzh;//所在路线桩号

	
	
	private String ghlxbm;
	private String ghlxmc;
	private String wnxmk;
	private String ylmlx;//原路面类型
	private String ylmjg;//原路面结构
	
	
	public String getYlmlx() {
		return ylmlx;
	}
	public void setYlmlx(String ylmlx) {
		this.ylmlx = ylmlx;
	}
	public String getYlmjg() {
		return ylmjg;
	}
	public void setYlmjg(String ylmjg) {
		this.ylmjg = ylmjg;
	}
	public String getGhlxbm() {
		return ghlxbm;
	}
	public void setGhlxbm(String ghlxbm) {
		this.ghlxbm = ghlxbm;
	}
	public String getWnxmk() {
		return wnxmk;
	}
	public void setWnxmk(String wnxmk) {
		this.wnxmk = wnxmk;
	}
	public String getGhlxmc() {
		return ghlxmc;
	}
	public void setGhlxmc(String ghlxmc) {
		this.ghlxmc = ghlxmc;
	}
	
	
	public String getQsmc() {
		return qsmc;
	}
	public void setQsmc(String qsmc) {
		this.qsmc = qsmc;
	}
	public String getXjmc() {
		return xjmc;
	}
	public void setXjmc(String xjmc) {
		this.xjmc = xjmc;
	}
	public String getJb() {
		return jb;
	}
	public void setJb(String jb) {
		this.jb = jb;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}
	public String getYdbmc() {
		return ydbmc;
	}
	public void setYdbmc(String ydbmc) {
		this.ydbmc = ydbmc;
	}
	public String getZtz() {
		return ztz;
	}
	public void setZtz(String ztz) {
		this.ztz = ztz;
	}
	public String getZbzzj() {
		return zbzzj;
	}
	public void setZbzzj(String zbzzj) {
		this.zbzzj = zbzzj;
	}
	public String getSbzzj() {
		return sbzzj;
	}
	public void setSbzzj(String sbzzj) {
		this.sbzzj = sbzzj;
	}
	public String getZddzjl() {
		return zddzjl;
	}
	public void setZddzjl(String zddzjl) {
		this.zddzjl = zddzjl;
	}
	public String getDfzc() {
		return dfzc;
	}
	public void setDfzc(String dfzc) {
		this.dfzc = dfzc;
	}
	public String getLxzh() {
		return lxzh;
	}
	public void setLxzh(String lxzh) {
		this.lxzh = lxzh;
	}
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getXmsl() {
		return xmsl;
	}
	public void setXmsl(String xmsl) {
		this.xmsl = xmsl;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
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
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	public int getXmlx() {
		return xmlx;
	}
	public void setXmlx(int xmlx) {
		this.xmlx = xmlx;
	}
	public int getSqzt() {
		return sqzt;
	}
	public void setSqzt(int sqzt) {
		this.sqzt = sqzt;
	}
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl;
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
	public String getGcfl() {
		return gcfl;
	}
	public void setGcfl(String gcfl) {
		this.gcfl = gcfl;
	}
	public String getGhlxbh() {
		return ghlxbh;
	}
	public void setGhlxbh(String ghlxbh) {
		this.ghlxbh = ghlxbh.trim();
	}
	public String getYlxbh() {
		return ylxbh;
	}
	public void setYlxbh(String ylxbh) {
		this.ylxbh = ylxbh.trim();
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh.trim();
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm.trim();
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
	public String getLc() {
		return lc;
	}
	public void setLc(String lc) {
		this.lc = lc.trim();
	}
	public String getLmkd() {
		return lmkd;
	}
	public void setLmkd(String lmkd) {
		this.lmkd = lmkd.trim();
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj.trim();
	}
	public String getNtz() {
		return ntz;
	}
	public void setNtz(String ntz) {
		this.ntz = ntz.trim();
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
	public String getGq() {
		return gq;
	}
	public void setGq(String gq) {
		this.gq = gq;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw.trim();
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm.trim();
	}
	public String getJsfa() {
		return jsfa;
	}
	public void setJsfa(String jsfa) {
		this.jsfa = jsfa;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
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
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
}
