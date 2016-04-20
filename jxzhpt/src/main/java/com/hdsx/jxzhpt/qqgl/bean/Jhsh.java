package com.hdsx.jxzhpt.qqgl.bean;

public class Jhsh {
	private String jsjsdj;
	private String xjsdj;
	private String tz;
	private String ghxlxbm;//规划路线编码
	private String ghxlxmc;//规划路线名称
	private String scxdnf;//首次下达年份
	private String xzdj;//行政等级
	private String xdzttj;//下达状态
	private String zjly;//资金来源
	private String xmnf;//项目年份
	private String gyfl;//管养分类
	
	public String getGyfl() {
		return gyfl;
	}
	public void setGyfl(String gyfl) {
		this.gyfl = gyfl;
	}
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getGhxlxbm() {
		return ghxlxbm;
	}
	public void setGhxlxbm(String ghxlxbm) {
		this.ghxlxbm = ghxlxbm;
	}
	public String getGhxlxmc() {
		return ghxlxmc;
	}
	public void setGhxlxmc(String ghxlxmc) {
		this.ghxlxmc = ghxlxmc;
	}
	public String getScxdnf() {
		return scxdnf;
	}
	public void setScxdnf(String scxdnf) {
		this.scxdnf = scxdnf;
	}
	public String getXzdj() {
		return xzdj;
	}
	public void setXzdj(String xzdj) {
		this.xzdj = xzdj;
	}
	public String getXdzttj() {
		return xdzttj;
	}
	public void setXdzttj(String xdzttj) {
		this.xdzttj = xdzttj;
	}
	public String getZjly() {
		return zjly;
	}
	public void setZjly(String zjly) {
		this.zjly = zjly;
	}
	public String getJsjsdj() {
		return jsjsdj;
	}
	public void setJsjsdj(String jsjsdj) {
		this.jsjsdj = jsjsdj;
	}
	public String getXjsdj() {
		return xjsdj;
	}
	public void setXjsdj(String xjsdj) {
		this.xjsdj = xjsdj;
	}
	public String getTz() {
		return tz;
	}
	public void setTz(String tz) {
		this.tz = tz;
	}
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
	private String yhdk;
	private String gz;
	private String sz;
	private String jhxdwh;
	private String stc;
	private String dk;
	private String gzzq;
	private String szzq;
	
	public String getGzzq() {
		return gzzq;
	}
	public void setGzzq(String gzzq) {
		this.gzzq = gzzq;
	}
	public String getSzzq() {
		return szzq;
	}
	public void setSzzq(String szzq) {
		this.szzq = szzq;
	}
	public String getStc() {
		return stc;
	}
	public void setStc(String stc) {
		this.stc = stc;
	}
	public String getDk() {
		return dk;
	}
	public void setDk(String dk) {
		this.dk = dk;
	}
	public String getJhxdwh() {
		return jhxdwh;
	}
	public void setJhxdwh(String jhxdwh) {
		this.jhxdwh = jhxdwh;
	}
	public String getYhdk() {
		return yhdk;
	}
	public void setYhdk(String yhdk) {
		this.yhdk = yhdk;
	}
	public String getGz() {
		return gz;
	}
	public void setGz(String gz) {
		this.gz = gz;
	}
	public String getSz() {
		return sz;
	}
	public void setSz(String sz) {
		this.sz = sz;
	}
	private String id;//ID
	private String xmmc;//项目名称
	private String xmbm;//项目编码
	private String xzqh;//行政区划
	private String qdzh;//起点桩号
	private String zdzh;//止点桩号
	private String kgsj;//开工时间
	private String wgsj;//完工时间
	private String gq;//工期（月）
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
	private String xmlxs;
	private String xmlx1;
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
	private String jszlc;//建设总里程
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
	//查询条件字段
	private String lxmc;//路线名称
	private String lxbm;//路线编码
	private String kgzt;//开工竣工
	//资金下达字段
	private String xdnf;
	private String xdzj;
	private String btzzj;
	private String stz;
	//判断是否有多条路线
	private String xmsl;
	
	//zyy add 2016.1.14
	private String qsmc;//区市名称
	private String xjmc;//县级名称
	private String jb;//级别 1--市级2--省级
	private String jsxz;//建设性质 1-新建2-扩建3-改建
	private String ydbmc;//原道班名称
	private String zbzzj;//总补助资金
	private String zddzjl;//重点打造奖励
	private String dfzc;//地方自筹资金
	private String lxzh;//所在路线桩号
	private String gldj;
	

	
	public String getGldj() {
		return gldj;
	}
	public void setGldj(String gldj) {
		this.gldj = gldj;
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
	public String getZbzzj() {
		return zbzzj;
	}
	public void setZbzzj(String zbzzj) {
		this.zbzzj = zbzzj;
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
	public String getXdnf() {
		return xdnf;
	}
	public void setXdnf(String xdnf) {
		this.xdnf = xdnf;
	}
	public String getXdzj() {
		return xdzj;
	}
	public void setXdzj(String xdzj) {
		this.xdzj = xdzj;
	}
	public String getBtzzj() {
		return btzzj;
	}
	public void setBtzzj(String btzzj) {
		this.btzzj = btzzj;
	}
	public String getStz() {
		return stz;
	}
	public void setStz(String stz) {
		this.stz = stz;
	}
	public String getKgzt() {
		return kgzt;
	}
	public void setKgzt(String kgzt) {
		this.kgzt = kgzt==null ? "" : kgzt;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc==null ? "" :lxmc;
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm == null ? "" : lxbm;
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
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw==null ? "" : gydw.trim();
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
		this.gkpfwh = gkpfwh.trim();
	}
	public String getSjpfwh() {
		return sjpfwh;
	}
	public void setSjpfwh(String sjpfwh) {
		this.sjpfwh = sjpfwh.trim();
	}
	public String getXdwh() {
		return xdwh;
	}
	public void setXdwh(String xdwh) {
		this.xdwh = xdwh.trim();
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
		this.pfztz = pfztz.trim();
	}
	public String getBbzzj() {
		return bbzzj;
	}
	public void setBbzzj(String bbzzj) {
		this.bbzzj = bbzzj.trim();
	}
	public String getSbzzj() {
		return sbzzj;
	}
	public void setSbzzj(String sbzzj) {
		this.sbzzj = sbzzj.trim();
	}
	public String getGhlxbh() {
		return ghlxbh;
	}
	public void setGhlxbh(String ghlxbh) {
		this.ghlxbh = ghlxbh.trim();
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm.trim();
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
		this.ylxbh = ylxbh.trim();
	}
	public String getGcfl() {
		return gcfl;
	}
	public void setGcfl(String gcfl) {
		this.gcfl = gcfl.trim();
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
		this.lc = lc.trim();
	}
	public String getZtz() {
		return ztz;
	}
	public void setZtz(String ztz) {
		this.ztz = ztz.trim();
	}
	public String getSysbbzj() {
		return sysbbzj;
	}
	public void setSysbbzj(String sysbbzj) {
		this.sysbbzj = sysbbzj.trim();
	}
	public String getYqdbcgs() {
		return yqdbcgs;
	}
	public void setYqdbcgs(String yqdbcgs) {
		this.yqdbcgs = yqdbcgs.trim();
	}
	public String getMclmlx() {
		return mclmlx;
	}
	public void setMclmlx(String mclmlx) {
		this.mclmlx = mclmlx.trim();
	}
	public String getMclx() {
		return mclx;
	}
	public void setMclx(String mclx) {
		this.mclx = mclx.trim();
	}
	public String getMcsl() {
		return mcsl;
	}
	public void setMcsl(String mcsl) {
		this.mcsl = mcsl.trim();
	}
	public String getMcje() {
		return mcje;
	}
	public void setMcje(String mcje) {
		this.mcje = mcje.trim();
	}
	public String getJclx() {
		return jclx;
	}
	public void setJclx(String jclx) {
		this.jclx = jclx.trim();
	}
	public String getJcsl() {
		return jcsl;
	}
	public void setJcsl(String jcsl) {
		this.jcsl = jcsl.trim();
	}
	public String getJcje() {
		return jcje;
	}
	public void setJcje(String jcje) {
		this.jcje = jcje.trim();
	}
	public String getXfcsl() {
		return xfcsl;
	}
	public void setXfcsl(String xfcsl) {
		this.xfcsl = xfcsl.trim();
	}
	public String getXfcje() {
		return xfcje;
	}
	public void setXfcje(String xfcje) {
		this.xfcje = xfcje.trim();
	}
	public String getBxsl() {
		return bxsl;
	}
	public void setBxsl(String bxsl) {
		this.bxsl = bxsl.trim();
	}
	public String getBxje() {
		return bxje;
	}
	public void setBxje(String bxje) {
		this.bxje = bxje.trim();
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
		this.gfje = gfje.trim();
	}
	public String getLlcl() {
		return llcl;
	}
	public void setLlcl(String llcl) {
		this.llcl = llcl.trim();
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj.trim();
	}
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl;
	}
	public String getXmlxs() {
		return xmlxs;
	}
	public void setXmlxs(String xmlxs) {
		this.xmlxs = xmlxs;
	}
	public String getXmlx1() {
		return xmlx1;
	}
	public void setXmlx1(String xmlx1) {
		this.xmlx1 = xmlx1;
	}
	
}
