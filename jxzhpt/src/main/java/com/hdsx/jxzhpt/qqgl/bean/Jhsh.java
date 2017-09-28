package com.hdsx.jxzhpt.qqgl.bean;

import java.io.Serializable;

public class Jhsh implements Serializable{
	private static final long serialVersionUID = 1L;
	private String jhxdsj;//计划下达时间
	private String yjsdj;
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
	private String bzxdnf;//编制     下达年份
	private String bzpfztz;//编制     批复总投资
	private String bzgz;//编制     国债
	private String bzsz;//编制     省债
	private String bzzq;//编制     债券
	private String bzdk;//编制     厅贷款
	private String bzjl;//编制     奖励
	private String bzqt;//编制     其他
	private String bzdfzc;//编制     奖励
	private String bzyhdk;//编制     其他
	private String bzcgs;//编制     车购税
	private String bztbsj;//编制  填报时间
	private String tbdw;//填报单位
	private String xzqhmc;//行政区划名称
	private String jhlc;//里程
	private String zq;//债券
	private String jl;//奖励
	private String qt;//其他
	private String sfsycgs;//是否使用车购税
	private String rys;//燃油税
	private String bzrys;//编制    燃油税
	private String zydpx;//重要度排序
	private String sbzt;//上报状态
	private String shzt;//审核状态
	private int page=1;
	private int rows=10;
	
	private String bcxd;//本次下达
	private String bcxdwh;//本次下达
	private String bcxdsj;//本次下达
	private String bcztz;//本次下达
	private String bccgs;//本次下达
	private String bcstz;//本次下达
	
	
	private String yhdk;
	private String gz;
	private String sz;
	private String jhxdwh;
	private String stc;
	private String dk;
	private String gzzq;
	private String szzq;
	
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
	private String ylxbh;//原路线编码
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
	private String jszlc;//总计
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
	private String ylxmc;//原路线名称
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
	private String zyjsnr;
	private String xzscnl;
	private String ylmlx;
	private String ylmjg;
	
	private String ghlxbm;
	private String ghlxmc;
	private String ghqdzh;
	private String ghzdzh;
	private String gxlxbm;
	private String gxqdzh;
	private String gxzdzh;
	private String zlc;
	private String xmklx;//项目库类型
	private String qdzh1;
	private String zdzh1;
	private String lsxmbm;
	private String lsxmnf;
	private String lsxmlx;
	private String sgtsjwh;
	private String sfqx="否";
	private String hszj;
	private String jhwj;
	private String name;
	private String ttc;
	private String gydwdm;
	private String parent;
	private String wbc;
	private String wbchd;
	
	//Jhsh_sfl    计划—示范路表
	private String tbz;        //厅补助(万元) 
	private String tbz_jaf;    //建安费(万元)
	private String tbz_gcjlf;  //工程监理费(万元)
	private String tbz_qqgzf;  //前期工作费(万元)
	private String thyy;       //退回原因
	private String cgs;         //车购税
	
	//jhsh_yhzx  计划—养护中心
	private String jbzj;
	
	//新线路编码
	private String xlxbm;
	//匹配文号
	private String pfwh;
	private String xqdzh;
	private String xzdzh;
	private String sjpfdw;
	private String sjpfsj;
    private String gcsl;	
    
	public String getGcsl() {
		return gcsl;
	}

	public void setGcsl(String gcsl) {
		this.gcsl = gcsl;
	}

	public String getSjpfsj() {
		return sjpfsj;
	}

	public void setSjpfsj(String sjpfsj) {
		this.sjpfsj = sjpfsj;
	}

	public String getSjpfdw() {
		return sjpfdw;
	}

	public void setSjpfdw(String sjpfdw) {
		this.sjpfdw = sjpfdw;
	}

	public String getXzdzh() {
		return xzdzh;
	}

	public void setXzdzh(String xzdzh) {
		this.xzdzh = xzdzh;
	}

	public String getXqdzh() {
		return xqdzh;
	}

	public void setXqdzh(String xqdzh) {
		this.xqdzh = xqdzh;
	}

	public String getPfwh() {
		return pfwh;
	}

	public void setPfwh(String pfwh) {
		this.pfwh = pfwh;
	}

	public String getXlxbm() {
		return xlxbm;
	}

	public void setXlxbm(String xlxbm) {
		this.xlxbm = xlxbm;
	}

	public String getCgs() {
		return cgs;
	}

	public void setCgs(String cgs) {
		this.cgs = cgs;
	}

	public Jhsh() {super();}
	
	public String getJbzj() {
		return jbzj;
	}

	public void setJbzj(String jbzj) {
		this.jbzj = jbzj;
	}

	public String getThyy() {
		return thyy;
	}

	public void setThyy(String thyy) {
		this.thyy = thyy;
	}


	public String getTbz() {
		return tbz;
	}
	public void setTbz(String tbz) {
		this.tbz = tbz;
	}
	public String getTbz_jaf() {
		return tbz_jaf;
	}
	public void setTbz_jaf(String tbz_jaf) {
		this.tbz_jaf = tbz_jaf;
	}

	public String getTbz_gcjlf() {
		return tbz_gcjlf;
	}

	public void setTbz_gcjlf(String tbz_gcjlf) {
		this.tbz_gcjlf = tbz_gcjlf;
	}

	public String getTbz_qqgzf() {
		return tbz_qqgzf;
	}
	public void setTbz_qqgzf(String tbz_qqgzf) {
		this.tbz_qqgzf = tbz_qqgzf;
	}
	public String getWbc() {
		return wbc;
	}
	public void setWbc(String wbc) {
		this.wbc = wbc;
	}
	public String getWbchd() {
		return wbchd;
	}
	public void setWbchd(String wbchd) {
		this.wbchd = wbchd;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTtc() {
		return ttc;
	}
	public void setTtc(String ttc) {
		this.ttc = ttc;
	}
	public String getJhwj() {
		return jhwj;
	}
	public void setJhwj(String jhwj) {
		this.jhwj = jhwj;
	}
	public String getHszj() {
		return hszj;
	}
	public void setHszj(String hszj) {
		this.hszj = hszj;
	}
	public String getSgtsjwh() {
		return sgtsjwh;
	}
	public void setSgtsjwh(String sgtsjwh) {
		this.sgtsjwh = sgtsjwh;
	}
	public String getSfqx() {
		return sfqx;
	}
	public void setSfqx(String sfqx) {
		this.sfqx = sfqx;
	}
	public String getLsxmnf() {
		return lsxmnf;
	}
	public void setLsxmnf(String lsxmnf) {
		this.lsxmnf = lsxmnf;
	}
	public String getLsxmlx() {
		return lsxmlx;
	}
	public void setLsxmlx(String lsxmlx) {
		this.lsxmlx = lsxmlx;
	}
	public String getLsxmbm() {
		return lsxmbm;
	}
	public void setLsxmbm(String lsxmbm) {
		this.lsxmbm = lsxmbm;
	}
	public String getQdzh1() {
		return qdzh1;
	}
	public void setQdzh1(String qdzh1) {
		this.qdzh1 = qdzh1;
	}
	public String getZdzh1() {
		return zdzh1;
	}
	public void setZdzh1(String zdzh1) {
		this.zdzh1 = zdzh1;
	}
	public String getJhxdsj() {
		return jhxdsj;
	}
	public void setJhxdsj(String jhxdsj) {
		this.jhxdsj = jhxdsj;
	}
	public String getXmklx() {
		return xmklx;
	}
	public void setXmklx(String xmklx) {
		this.xmklx = xmklx;
	}
	public String getZlc() {
		return zlc;
	}
	public void setZlc(String zlc) {
		this.zlc = zlc;
	}
	public String getGhlxbm() {
		return ghlxbm;
	}
	public void setGhlxbm(String ghlxbm) {
		this.ghlxbm = ghlxbm;
	}
	public String getGhlxmc() {
		return ghlxmc;
	}
	public void setGhlxmc(String ghlxmc) {
		this.ghlxmc = ghlxmc;
	}
	public String getGhqdzh() {
		return ghqdzh;
	}
	public void setGhqdzh(String ghqdzh) {
		this.ghqdzh = ghqdzh;
	}
	public String getGhzdzh() {
		return ghzdzh;
	}
	public void setGhzdzh(String ghzdzh) {
		this.ghzdzh = ghzdzh;
	}
	public String getGxlxbm() {
		return gxlxbm;
	}
	public void setGxlxbm(String gxlxbm) {
		this.gxlxbm = gxlxbm;
	}
	public String getGxqdzh() {
		return gxqdzh;
	}
	public void setGxqdzh(String gxqdzh) {
		this.gxqdzh = gxqdzh;
	}
	public String getGxzdzh() {
		return gxzdzh;
	}
	public void setGxzdzh(String gxzdzh) {
		this.gxzdzh = gxzdzh;
	}
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
	public String getBzdfzc() {
		return bzdfzc;
	}
	public void setBzdfzc(String bzdfzc) {
		this.bzdfzc = bzdfzc;
	}
	public String getBzyhdk() {
		return bzyhdk;
	}
	public void setBzyhdk(String bzyhdk) {
		this.bzyhdk = bzyhdk;
	}
	public String getZyjsnr() {
		return zyjsnr;
	}
	public void setZyjsnr(String zyjsnr) {
		this.zyjsnr = zyjsnr;
	}
	public String getXzscnl() {
		return xzscnl;
	}
	public void setXzscnl(String xzscnl) {
		this.xzscnl = xzscnl;
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
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getGyfl() {
		return gyfl;
	}
	public void setGyfl(String gyfl) {
		this.gyfl = gyfl;
	}
	public String getBzxdnf() {
		return bzxdnf;
	}
	public void setBzxdnf(String bzxdnf) {
		this.bzxdnf = bzxdnf;
	}
	public String getBzpfztz() {
		return bzpfztz;
	}
	public void setBzpfztz(String bzpfztz) {
		this.bzpfztz = bzpfztz;
	}
	public String getBzgz() {
		return bzgz;
	}
	public void setBzgz(String bzgz) {
		this.bzgz = bzgz;
	}
	public String getBzsz() {
		return bzsz;
	}
	public void setBzsz(String bzsz) {
		this.bzsz = bzsz;
	}
	public String getBzzq() {
		return bzzq;
	}
	public void setBzzq(String bzzq) {
		this.bzzq = bzzq;
	}
	public String getBzdk() {
		return bzdk;
	}
	public void setBzdk(String bzdk) {
		this.bzdk = bzdk;
	}
	public String getBzjl() {
		return bzjl;
	}
	public void setBzjl(String bzjl) {
		this.bzjl = bzjl;
	}
	public String getBzqt() {
		return bzqt;
	}
	public void setBzqt(String bzqt) {
		this.bzqt = bzqt;
	}
	public String getBzcgs() {
		return bzcgs;
	}
	public void setBzcgs(String bzcgs) {
		this.bzcgs = bzcgs;
	}
	public String getBztbsj() {
		return bztbsj;
	}
	public void setBztbsj(String bztbsj) {
		this.bztbsj = bztbsj;
	}
	public String getTbdw() {
		return tbdw;
	}
	public void setTbdw(String tbdw) {
		this.tbdw = tbdw;
	}
	public String getXzqhmc() {
		return xzqhmc;
	}
	public void setXzqhmc(String xzqhmc) {
		this.xzqhmc = xzqhmc;
	}
	public String getJhlc() {
		return jhlc;
	}
	public void setJhlc(String jhlc) {
		this.jhlc = jhlc;
	}
	public String getZq() {
		return zq;
	}
	public void setZq(String zq) {
		this.zq = zq;
	}
	public String getJl() {
		return jl;
	}
	public void setJl(String jl) {
		this.jl = jl;
	}
	public String getQt() {
		return qt;
	}
	public void setQt(String qt) {
		this.qt = qt;
	}
	public String getSfsycgs() {
		return sfsycgs;
	}
	public void setSfsycgs(String sfsycgs) {
		this.sfsycgs = sfsycgs;
	}
	public String getRys() {
		return rys;
	}
	public void setRys(String rys) {
		this.rys = rys;
	}
	public String getBzrys() {
		return bzrys;
	}
	public void setBzrys(String bzrys) {
		this.bzrys = bzrys;
	}
	public String getZydpx() {
		return zydpx;
	}
	public void setZydpx(String zydpx) {
		this.zydpx = zydpx;
	}
	public String getSbzt() {
		return sbzt;
	}
	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}
	public String getShzt() {
		return shzt;
	}
	public void setShzt(String shzt) {
		this.shzt = shzt;
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
	public String getJhxdwh() {
		return jhxdwh;
	}
	public void setJhxdwh(String jhxdwh) {
		this.jhxdwh = jhxdwh;
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
	public int getXdzt() {
		return xdzt;
	}
	public void setXdzt(int xdzt) {
		this.xdzt = xdzt;
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
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl;
	}
	public int getXmlx() {
		return xmlx;
	}
	public void setXmlx(int xmlx) {
		this.xmlx = xmlx;
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
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
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
	public String getJszlc() {
		return jszlc;
	}
	public void setJszlc(String jszlc) {
		this.jszlc = jszlc;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
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
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	public String getYlxmc() {
		return ylxmc;
	}
	public void setYlxmc(String ylxmc) {
		this.ylxmc = ylxmc;
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm;
	}
	public String getKgzt() {
		return kgzt;
	}
	public void setKgzt(String kgzt) {
		this.kgzt = kgzt;
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
	public String getXmsl() {
		return xmsl;
	}
	public void setXmsl(String xmsl) {
		this.xmsl = xmsl;
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
	public String getGldj() {
		return gldj;
	}
	public void setGldj(String gldj) {
		this.gldj = gldj;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getBcxd() {
		return bcxd;
	}
	public void setBcxd(String bcxd) {
		this.bcxd = bcxd;
	}
	public String getBcxdwh() {
		return bcxdwh;
	}
	public void setBcxdwh(String bcxdwh) {
		this.bcxdwh = bcxdwh;
	}
	public String getBcxdsj() {
		return bcxdsj;
	}
	public void setBcxdsj(String bcxdsj) {
		this.bcxdsj = bcxdsj;
	}
	public String getBcztz() {
		return bcztz;
	}
	public void setBcztz(String bcztz) {
		this.bcztz = bcztz;
	}
	public String getBccgs() {
		return bccgs;
	}
	public void setBccgs(String bccgs) {
		this.bccgs = bccgs;
	}
	public String getBcstz() {
		return bcstz;
	}
	public void setBcstz(String bcstz) {
		this.bcstz = bcstz;
	}
	public String getYjsdj() {
		return yjsdj;
	}
	public void setYjsdj(String yjsdj) {
		this.yjsdj = yjsdj;
	}

	@Override
	public String toString() {
		return "Jhsh [jhxdsj=" + jhxdsj + ", yjsdj=" + yjsdj + ", jsjsdj="
				+ jsjsdj + ", xjsdj=" + xjsdj + ", tz=" + tz + ", ghxlxbm="
				+ ghxlxbm + ", ghxlxmc=" + ghxlxmc + ", scxdnf=" + scxdnf
				+ ", xzdj=" + xzdj + ", xdzttj=" + xdzttj + ", zjly=" + zjly
				+ ", xmnf=" + xmnf + ", gyfl=" + gyfl + ", bzxdnf=" + bzxdnf
				+ ", bzpfztz=" + bzpfztz + ", bzgz=" + bzgz + ", bzsz=" + bzsz
				+ ", bzzq=" + bzzq + ", bzdk=" + bzdk + ", bzjl=" + bzjl
				+ ", bzqt=" + bzqt + ", bzdfzc=" + bzdfzc + ", bzyhdk="
				+ bzyhdk + ", bzcgs=" + bzcgs + ", bztbsj=" + bztbsj
				+ ", tbdw=" + tbdw + ", xzqhmc=" + xzqhmc + ", jhlc=" + jhlc
				+ ", zq=" + zq + ", jl=" + jl + ", qt=" + qt + ", sfsycgs="
				+ sfsycgs + ", rys=" + rys + ", bzrys=" + bzrys + ", zydpx="
				+ zydpx + ", sbzt=" + sbzt + ", shzt=" + shzt + ", page="
				+ page + ", rows=" + rows + ", bcxd=" + bcxd + ", bcxdwh="
				+ bcxdwh + ", bcxdsj=" + bcxdsj + ", bcztz=" + bcztz
				+ ", bccgs=" + bccgs + ", bcstz=" + bcstz + ", yhdk=" + yhdk
				+ ", gz=" + gz + ", sz=" + sz + ", jhxdwh=" + jhxdwh + ", stc="
				+ stc + ", dk=" + dk + ", gzzq=" + gzzq + ", szzq=" + szzq
				+ ", id=" + id + ", xmmc=" + xmmc + ", xmbm=" + xmbm
				+ ", xzqh=" + xzqh + ", qdzh=" + qdzh + ", zdzh=" + zdzh
				+ ", kgsj=" + kgsj + ", wgsj=" + wgsj + ", gq=" + gq
				+ ", gkpfwh=" + gkpfwh + ", sjpfwh=" + sjpfwh + ", xdwh="
				+ xdwh + ", xdsj=" + xdsj + ", pfztz=" + pfztz + ", bbzzj="
				+ bbzzj + ", sbzzj=" + sbzzj + ", xdzt=" + xdzt + ", ghlxbh="
				+ ghlxbh + ", xzqhdm=" + xzqhdm + ", lsjl=" + lsjl + ", xmlx="
				+ xmlx + ", xmlxs=" + xmlxs + ", xmlx1=" + xmlx1 + ", tsdq="
				+ tsdq + ", ylxbh=" + ylxbh + ", gcfl=" + gcfl + ", jhkgsj="
				+ jhkgsj + ", jhwgsj=" + jhwgsj + ", lc=" + lc + ", ztz=" + ztz
				+ ", sysbbzj=" + sysbbzj + ", yqdbcgs=" + yqdbcgs + ", mclmlx="
				+ mclmlx + ", mclx=" + mclx + ", mcsl=" + mcsl + ", mcje="
				+ mcje + ", jclx=" + jclx + ", jcsl=" + jcsl + ", jcje=" + jcje
				+ ", xfcsl=" + xfcsl + ", xfcje=" + xfcje + ", bxsl=" + bxsl
				+ ", bxje=" + bxje + ", gfcd=" + gfcd + ", gfje=" + gfje
				+ ", llcl=" + llcl + ", jsdj=" + jsdj + ", jszlc=" + jszlc
				+ ", gydw=" + gydw + ", qdmc=" + qdmc + ", zdmc=" + zdmc
				+ ", gpsqdzh=" + gpsqdzh + ", gpszdzh=" + gpszdzh + ", yilc="
				+ yilc + ", erlc=" + erlc + ", sanlc=" + sanlc + ", silc="
				+ silc + ", dwlc=" + dwlc + ", wllc=" + wllc + ", lxmc=" + lxmc
				+ ", ylxmc=" + ylxmc + ", lxbm=" + lxbm + ", kgzt=" + kgzt
				+ ", xdnf=" + xdnf + ", xdzj=" + xdzj + ", btzzj=" + btzzj
				+ ", stz=" + stz + ", xmsl=" + xmsl + ", qsmc=" + qsmc
				+ ", xjmc=" + xjmc + ", jb=" + jb + ", jsxz=" + jsxz
				+ ", ydbmc=" + ydbmc + ", zbzzj=" + zbzzj + ", zddzjl="
				+ zddzjl + ", dfzc=" + dfzc + ", lxzh=" + lxzh + ", gldj="
				+ gldj + ", zyjsnr=" + zyjsnr + ", xzscnl=" + xzscnl
				+ ", ylmlx=" + ylmlx + ", ylmjg=" + ylmjg + ", ghlxbm="
				+ ghlxbm + ", ghlxmc=" + ghlxmc + ", ghqdzh=" + ghqdzh
				+ ", ghzdzh=" + ghzdzh + ", gxlxbm=" + gxlxbm + ", gxqdzh="
				+ gxqdzh + ", gxzdzh=" + gxzdzh + ", zlc=" + zlc + ", xmklx="
				+ xmklx + ", qdzh1=" + qdzh1 + ", zdzh1=" + zdzh1 + ", lsxmbm="
				+ lsxmbm + ", lsxmnf=" + lsxmnf + ", lsxmlx=" + lsxmlx
				+ ", sgtsjwh=" + sgtsjwh + ", sfqx=" + sfqx + ", hszj=" + hszj
				+ ", jhwj=" + jhwj + ", name=" + name + ", ttc=" + ttc
				+ ", gydwdm=" + gydwdm + ", parent=" + parent + ", wbc=" + wbc
				+ ", wbchd=" + wbchd + ", tbz=" + tbz + ", tbz_jaf=" + tbz_jaf
				+ ", tbz_gcjlf=" + tbz_gcjlf + ", tbz_qqgzf=" + tbz_qqgzf
				+ ", thyy=" + thyy + ", jbzj=" + jbzj + "]";
	}
}
