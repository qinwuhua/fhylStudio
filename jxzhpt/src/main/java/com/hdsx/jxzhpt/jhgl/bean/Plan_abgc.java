package com.hdsx.jxzhpt.jhgl.bean;

import java.sql.Clob;
import java.util.Date;
import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;

public class Plan_abgc {
	private String sckid;
	private String jhkgsj;//计划开工时间
	private String jhkgsj1;//计划审核导入Excel用到
	private String jhwgsj;//计划完工时间
	private String jhwgsj1;//计划审核导入Excel用到
	private String sjdw;//设计单位
	private String sjpfdw;//设计批复单位
	private String pfwh;//批复文号
	private String pfsj;//批复时间
	private String pfsj1;//计划审核导入Excel用到
	private String pfztz;//批复总投资
	private String jhsybbzje;//计划使用部补助金额
	private String jhsydfzczj;//计划使用地方自筹资金
	private String remarks;//备注
	private String tbsj;//填报时间
	private String tbbm;//填报部门
	private String spzt;//审批状态
	private String spbm;//审批部门
	private Date spsj;//审批时间
	private String sbbm;//上报部门
	private Date sbsj;//上报时间
	private String xdsj;//计划下达时间
	private String gkbgmc;//工可报告附件名称
	private String gkbglj;//工可报告附件路径
	private String sjsgtmc;//设计施工图名称
	private String sjsgtlj;//设计施工图路径
	private String sjkgsj;//实际开工时间
	private String sjwgsj;//实际完工时间
	private String sgdw;//施工单位
	private String jldw;//监理单位
	private String htje;//合同金额
	private String sgxkwj;//施工许可文件
	private String jgtcwj;//竣工通车文件
	private String jgyswj;//竣工验收文件
	private String wjsczt;//文件上传状态
	private String kgzt;//开工状态
	private String jgzt;//竣工状态
	private String wjgyy;//未竣工原因
	private String yjwgsj;//预计完工时间
	private String jhwc_c;//计划完成(处)
	private String jsdw;//建设单位
	private String jhxdwh;//计划下达问好
	private String xdzt;//下达状态
	private String xfzt;//下发状态
	private String xfsj;//下发时间
	private String xfbm;//下发部门
	private String  wjzt;//台账完结状态
	private String wjsj;//台账完结时间
	private String gys;//概预算
	private String jh_sbthcd;//上报退回状态的长度标示
	private String sbbmdm;//上报部门的部门代码
	private String spbmdm;//审批部门的部门代码
	private String sfylsjl;//最近年份是否有历史记录
	private Sckabgc jckabgc;
	private byte[] gkbgdata;
	private byte[] sjsgtdata;	
	private String xzqhmc;
	private String scqdzh;
	private String sczdzh;
	private String sczlc;
	private String scyhlc;
	private String scbz;
	private String gjxjnd;
	private String tzxz;//调整状态
	private String tzsj;//调整时间
	private String jhyhlc;//调整时间
	private String jhzlc;//调整时间
	private String id;

    private String province;

    private String town;

    private String county;

    private String unit;

    private String unitcode;

    private String roadcode;

    private String jsdj;

    private String fangx;

    private String roadstart;

    private String roadend;

    private String pcsj;

    private String ldfl;

    private String jtsgpcf;

    private String jtsgfxdj;

    private String gltjpcf;

    private String glfxdj;

    private String xbjyqx;

    private String lxxp;

    private String doup;

    private String sjbl;

    private String lcxy;

    private String hjfz;

    private String jckbgf;

    private String jtl;

    private String xchbc;

    private String csxsss;

    private String hul;

    private String bzbx;

    private String jshsxyd;

    private String aqssqt;

    private String tjgc;

    private String hjzz;

    private String bzbxcz;

    private String jckcz;

    private String jzhl;

    private String jshsxydcz;

    private String aqssqtcz;

    private String tzgs;

    private String jhnf;

    private String throadcode;

    private String throadstart;

    private String throadend;

    private String sgpb;

    private String dgjw;

    private String lxjw;

    private String jtlpbzb;

    private String dist;

    private String distcode;

    private String sbzt;

    private String cszt;

    private String zszt;

    private String csyj;

    private String zsyj;

    private String roadname;

    private String gldj;

    private String tsdq;

    private String xjgjnd;

    private String zlc;

    private String sbthcd;
    
    private String sbzt2;
    
    private String yhlc;
    
    private String gpsqd;
    
    private String gpszd;
    
    private String tbbmbm;
    
    private int page;
    
	private int rows;
    
	    private String gydw;

	    private String gydwdm;

	    private String lxbm;


	    private String qdzh;

	    private String zdzh;

	    private String lxmc;

	    private String sbthbmcd;

	    private String fapgdw;

	    private String fascdw;

	    private String faspsj;

	    private String spwh;

	    private String czzlc;

	    private String cztzgs;

	    private String jsxz;

	    private String jsnr;

	    private String bz;

	    private String shzt;

	    private String tbdwdm;

	    private String xmkid;

	    private String sfsqablbz;

	    private String ablbzsqwh;

	    private String xzqhdm;

	    private String xzqh;

	    private String shyj;

	    private String xuh;

	    private String xmbm;
	    
	    private String bzls;
	    
	    private String str1;

	    private String str2;

	    private String str3;

	    private String str4;

	    private String str5;

	    private String str6;

	    private String str7;
	    
	    private String xmlx;
	    private String thlxbm;
	    
	    private String shengbz;	    
	    
	public String getShengbz() {
			return shengbz;
		}
		public void setShengbz(String shengbz) {
			this.shengbz = shengbz;
		}
	public String getThlxbm() {
			return thlxbm;
		}
		public void setThlxbm(String thlxbm) {
			this.thlxbm = thlxbm;
		}
	public String getXmlx() {
			return xmlx;
		}
		public void setXmlx(String xmlx) {
			this.xmlx = xmlx;
		}
	public String getTzxz() {
		return tzxz;
	}
	public void setTzxz(String tzxz) {
		this.tzxz = tzxz;
	}
	public String getTzsj() {
		return tzsj;
	}
	public void setTzsj(String tzsj) {
		this.tzsj = tzsj;
	}
	public String getJhkgsj1() {
		return jhkgsj1;
	}
	public void setJhkgsj1(String jhkgsj1) {
		this.jhkgsj1 = jhkgsj1;
	}
	public String getJhwgsj1() {
		return jhwgsj1;
	}
	public void setJhwgsj1(String jhwgsj1) {
		this.jhwgsj1 = jhwgsj1;
	}
	public String getPfsj1() {
		return pfsj1;
	}
	public void setPfsj1(String pfsj1) {
		this.pfsj1 = pfsj1;
	}
	public String getTzgs() {
		return tzgs;
	}
	public void setTzgs(String tzgs) {
		this.tzgs = tzgs;
	}
	public String getSpwh() {
		return spwh;
	}
	public void setSpwh(String spwh) {
		this.spwh = spwh;
	}
	public String getFapgdw() {
		return fapgdw;
	}
	public void setFapgdw(String fapgdw) {
		this.fapgdw = fapgdw;
	}
	public String getFascdw() {
		return fascdw;
	}
	public void setFascdw(String fascdw) {
		this.fascdw = fascdw;
	}
	public String getFaspsj() {
		return faspsj;
	}
	public void setFaspsj(String faspsj) {
		this.faspsj = faspsj;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}
	public String getJsnr() {
		return jsnr;
	}
	public void setJsnr(String jsnr) {
		this.jsnr = jsnr;
	}
	public String getScbz() {
		return scbz;
	}
	public void setScbz(String scbz) {
		this.scbz = scbz;
	}
	public String getSfylsjl() {
		return sfylsjl;
	}
	public void setSfylsjl(String sfylsjl) {
		this.sfylsjl = sfylsjl;
	}
	public String getSckid() {
		return sckid;
	}
	public void setSckid(String sckid) {
		this.sckid = sckid;
	}
	public String getJh_sbthcd() {
		return jh_sbthcd;
	}
	public void setJh_sbthcd(String jh_sbthcd) {
		this.jh_sbthcd = jh_sbthcd;
	}
	public String getSbbmdm() {
		return sbbmdm;
	}
	public void setSbbmdm(String sbbmdm) {
		this.sbbmdm = sbbmdm;
	}
	public String getSpbmdm() {
		return spbmdm;
	}
	public void setSpbmdm(String spbmdm) {
		this.spbmdm = spbmdm;
	}
	public Sckabgc getJckabgc() {
		return jckabgc;
	}
	public void setJckabgc(Sckabgc jckabgc) {
		this.jckabgc = jckabgc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJhnf() {
		return jhnf;
	}
	public void setJhnf(String jhnf) {
		this.jhnf = jhnf;
	}
	
	public String getSjdw() {
		return sjdw;
	}
	public void setSjdw(String sjdw) {
		this.sjdw = sjdw;
	}
	public String getSjpfdw() {
		return sjpfdw;
	}
	public void setSjpfdw(String sjpfdw) {
		this.sjpfdw = sjpfdw;
	}
	public String getPfwh() {
		return pfwh;
	}
	public void setPfwh(String pfwh) {
		this.pfwh = pfwh;
	}
	
	public String getPfztz() {
		return pfztz;
	}
	public void setPfztz(String pfztz) {
		this.pfztz = pfztz;
	}
	public String getJhsybbzje() {
		return jhsybbzje;
	}
	public void setJhsybbzje(String jhsybbzje) {
		this.jhsybbzje = jhsybbzje;
	}
	public String getJhsydfzczj() {
		return jhsydfzczj;
	}
	public void setJhsydfzczj(String jhsydfzczj) {
		this.jhsydfzczj = jhsydfzczj;
	}
	public String getSfsqablbz() {
		return sfsqablbz;
	}
	public void setSfsqablbz(String sfsqablbz) {
		this.sfsqablbz = sfsqablbz;
	}
	public String getAblbzsqwh() {
		return ablbzsqwh;
	}
	public void setAblbzsqwh(String ablbzsqwh) {
		this.ablbzsqwh = ablbzsqwh;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getTbsj() {
		return tbsj;
	}
	public void setTbsj(String tbsj) {
		this.tbsj = tbsj;
	}
	public String getTbbm() {
		return tbbm;
	}
	public void setTbbm(String tbbm) {
		this.tbbm = tbbm;
	}
	public String getSpzt() {
		return spzt;
	}
	public void setSpzt(String spzt) {
		this.spzt = spzt;
	}
	public String getSpbm() {
		return spbm;
	}
	public void setSpbm(String spbm) {
		this.spbm = spbm;
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
	public String getSbbm() {
		return sbbm;
	}
	public void setSbbm(String sbbm) {
		this.sbbm = sbbm;
	}
	public Date getSbsj() {
		return sbsj;
	}
	public void setSbsj(Date sbsj) {
		this.sbsj = sbsj;
	}
	
	public String getGkbgmc() {
		return gkbgmc;
	}
	public void setGkbgmc(String gkbgmc) {
		this.gkbgmc = gkbgmc;
	}
	public String getGkbglj() {
		return gkbglj;
	}
	public void setGkbglj(String gkbglj) {
		this.gkbglj = gkbglj;
	}
	public String getSjsgtmc() {
		return sjsgtmc;
	}
	public void setSjsgtmc(String sjsgtmc) {
		this.sjsgtmc = sjsgtmc;
	}
	public String getSjsgtlj() {
		return sjsgtlj;
	}
	public void setSjsgtlj(String sjsgtlj) {
		this.sjsgtlj = sjsgtlj;
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
	public String getWjgyy() {
		return wjgyy;
	}
	public void setWjgyy(String wjgyy) {
		this.wjgyy = wjgyy;
	}
	public String getYjwgsj() {
		return yjwgsj;
	}
	public void setYjwgsj(String yjwgsj) {
		this.yjwgsj = yjwgsj;
	}
	public String getJhwc_c() {
		return jhwc_c;
	}
	public void setJhwc_c(String jhwc_c) {
		this.jhwc_c = jhwc_c;
	}
	public String getJsdw() {
		return jsdw;
	}
	public void setJsdw(String jsdw) {
		this.jsdw = jsdw;
	}
	public String getJhxdwh() {
		return jhxdwh;
	}
	public void setJhxdwh(String jhxdwh) {
		this.jhxdwh = jhxdwh;
	}
	public String getXdzt() {
		return xdzt;
	}
	public void setXdzt(String xdzt) {
		this.xdzt = xdzt;
	}
	public String getXfzt() {
		return xfzt;
	}
	public void setXfzt(String xfzt) {
		this.xfzt = xfzt;
	}
	public String getXfsj() {
		return xfsj;
	}
	public void setXfsj(String xfsj) {
		this.xfsj = xfsj;
	}
	public String getXfbm() {
		return xfbm;
	}
	public void setXfbm(String xfbm) {
		this.xfbm = xfbm;
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
	public String getGys() {
		return gys;
	}
	public void setGys(String gys) {
		this.gys = gys;
	}
	public byte[] getGkbgdata() {
		return gkbgdata;
	}
	public void setGkbgdata(byte[] gkbgdata) {
		this.gkbgdata = gkbgdata;
	}
	public byte[] getSjsgtdata() {
		return sjsgtdata;
	}
	public void setSjsgtdata(byte[] sjsgtdata) {
		this.sjsgtdata = sjsgtdata;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
	}
	public String getXzqhmc() {
		return xzqhmc;
	}
	public void setXzqhmc(String xzqhmc) {
		this.xzqhmc = xzqhmc;
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
	public String getScqdzh() {
		return scqdzh;
	}
	public void setScqdzh(String scqdzh) {
		this.scqdzh = scqdzh;
	}
	public String getSczdzh() {
		return sczdzh;
	}
	public void setSczdzh(String sczdzh) {
		this.sczdzh = sczdzh;
	}
	public String getSczlc() {
		return sczlc;
	}
	public void setSczlc(String sczlc) {
		this.sczlc = sczlc;
	}
	public String getScyhlc() {
		return scyhlc;
	}
	public void setScyhlc(String scyhlc) {
		this.scyhlc = scyhlc;
	}
	public String getGjxjnd() {
		return gjxjnd;
	}
	public void setGjxjnd(String gjxjnd) {
		this.gjxjnd = gjxjnd;
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
	public String getPfsj() {
		return pfsj;
	}
	public void setPfsj(String pfsj) {
		this.pfsj = pfsj;
	}
	public String getXdsj() {
		return xdsj;
	}
	public void setXdsj(String xdsj) {
		this.xdsj = xdsj;
	}
	public String getSjkgsj() {
		return sjkgsj;
	}
	public void setSjkgsj(String sjkgsj) {
		this.sjkgsj = sjkgsj;
	}
	public String getSjwgsj() {
		return sjwgsj;
	}
	public void setSjwgsj(String sjwgsj) {
		this.sjwgsj = sjwgsj;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getUnitcode() {
		return unitcode;
	}
	public void setUnitcode(String unitcode) {
		this.unitcode = unitcode;
	}
	public String getRoadcode() {
		return roadcode;
	}
	public void setRoadcode(String roadcode) {
		this.roadcode = roadcode;
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}
	public String getFangx() {
		return fangx;
	}
	public void setFangx(String fangx) {
		this.fangx = fangx;
	}
	public String getRoadstart() {
		return roadstart;
	}
	public void setRoadstart(String roadstart) {
		this.roadstart = roadstart;
	}
	public String getRoadend() {
		return roadend;
	}
	public void setRoadend(String roadend) {
		this.roadend = roadend;
	}
	public String getPcsj() {
		return pcsj;
	}
	public void setPcsj(String pcsj) {
		this.pcsj = pcsj;
	}
	public String getLdfl() {
		return ldfl;
	}
	public void setLdfl(String ldfl) {
		this.ldfl = ldfl;
	}
	public String getJtsgpcf() {
		return jtsgpcf;
	}
	public void setJtsgpcf(String jtsgpcf) {
		this.jtsgpcf = jtsgpcf;
	}
	public String getJtsgfxdj() {
		return jtsgfxdj;
	}
	public void setJtsgfxdj(String jtsgfxdj) {
		this.jtsgfxdj = jtsgfxdj;
	}
	public String getGltjpcf() {
		return gltjpcf;
	}
	public void setGltjpcf(String gltjpcf) {
		this.gltjpcf = gltjpcf;
	}
	public String getGlfxdj() {
		return glfxdj;
	}
	public void setGlfxdj(String glfxdj) {
		this.glfxdj = glfxdj;
	}
	public String getXbjyqx() {
		return xbjyqx;
	}
	public void setXbjyqx(String xbjyqx) {
		this.xbjyqx = xbjyqx;
	}
	public String getLxxp() {
		return lxxp;
	}
	public void setLxxp(String lxxp) {
		this.lxxp = lxxp;
	}
	public String getDoup() {
		return doup;
	}
	public void setDoup(String doup) {
		this.doup = doup;
	}
	public String getSjbl() {
		return sjbl;
	}
	public void setSjbl(String sjbl) {
		this.sjbl = sjbl;
	}
	public String getLcxy() {
		return lcxy;
	}
	public void setLcxy(String lcxy) {
		this.lcxy = lcxy;
	}
	public String getHjfz() {
		return hjfz;
	}
	public void setHjfz(String hjfz) {
		this.hjfz = hjfz;
	}
	public String getJckbgf() {
		return jckbgf;
	}
	public void setJckbgf(String jckbgf) {
		this.jckbgf = jckbgf;
	}
	public String getJtl() {
		return jtl;
	}
	public void setJtl(String jtl) {
		this.jtl = jtl;
	}
	public String getXchbc() {
		return xchbc;
	}
	public void setXchbc(String xchbc) {
		this.xchbc = xchbc;
	}
	public String getCsxsss() {
		return csxsss;
	}
	public void setCsxsss(String csxsss) {
		this.csxsss = csxsss;
	}
	public String getHul() {
		return hul;
	}
	public void setHul(String hul) {
		this.hul = hul;
	}
	public String getBzbx() {
		return bzbx;
	}
	public void setBzbx(String bzbx) {
		this.bzbx = bzbx;
	}
	public String getJshsxyd() {
		return jshsxyd;
	}
	public void setJshsxyd(String jshsxyd) {
		this.jshsxyd = jshsxyd;
	}
	public String getAqssqt() {
		return aqssqt;
	}
	public void setAqssqt(String aqssqt) {
		this.aqssqt = aqssqt;
	}
	public String getTjgc() {
		return tjgc;
	}
	public void setTjgc(String tjgc) {
		this.tjgc = tjgc;
	}
	public String getHjzz() {
		return hjzz;
	}
	public void setHjzz(String hjzz) {
		this.hjzz = hjzz;
	}
	public String getBzbxcz() {
		return bzbxcz;
	}
	public void setBzbxcz(String bzbxcz) {
		this.bzbxcz = bzbxcz;
	}
	public String getJckcz() {
		return jckcz;
	}
	public void setJckcz(String jckcz) {
		this.jckcz = jckcz;
	}
	public String getJzhl() {
		return jzhl;
	}
	public void setJzhl(String jzhl) {
		this.jzhl = jzhl;
	}
	public String getJshsxydcz() {
		return jshsxydcz;
	}
	public void setJshsxydcz(String jshsxydcz) {
		this.jshsxydcz = jshsxydcz;
	}
	public String getAqssqtcz() {
		return aqssqtcz;
	}
	public void setAqssqtcz(String aqssqtcz) {
		this.aqssqtcz = aqssqtcz;
	}
	public String getThroadcode() {
		return throadcode;
	}
	public void setThroadcode(String throadcode) {
		this.throadcode = throadcode;
	}
	public String getThroadstart() {
		return throadstart;
	}
	public void setThroadstart(String throadstart) {
		this.throadstart = throadstart;
	}
	public String getThroadend() {
		return throadend;
	}
	public void setThroadend(String throadend) {
		this.throadend = throadend;
	}
	public String getSgpb() {
		return sgpb;
	}
	public void setSgpb(String sgpb) {
		this.sgpb = sgpb;
	}
	public String getDgjw() {
		return dgjw;
	}
	public void setDgjw(String dgjw) {
		this.dgjw = dgjw;
	}
	public String getLxjw() {
		return lxjw;
	}
	public void setLxjw(String lxjw) {
		this.lxjw = lxjw;
	}
	public String getJtlpbzb() {
		return jtlpbzb;
	}
	public void setJtlpbzb(String jtlpbzb) {
		this.jtlpbzb = jtlpbzb;
	}
	public String getDist() {
		return dist;
	}
	public void setDist(String dist) {
		this.dist = dist;
	}
	public String getDistcode() {
		return distcode;
	}
	public void setDistcode(String distcode) {
		this.distcode = distcode;
	}
	public String getCszt() {
		return cszt;
	}
	public void setCszt(String cszt) {
		this.cszt = cszt;
	}
	public String getZszt() {
		return zszt;
	}
	public void setZszt(String zszt) {
		this.zszt = zszt;
	}
	public String getCsyj() {
		return csyj;
	}
	public void setCsyj(String csyj) {
		this.csyj = csyj;
	}
	public String getZsyj() {
		return zsyj;
	}
	public void setZsyj(String zsyj) {
		this.zsyj = zsyj;
	}
	public String getRoadname() {
		return roadname;
	}
	public void setRoadname(String roadname) {
		this.roadname = roadname;
	}
	public String getGldj() {
		return gldj;
	}
	public void setGldj(String gldj) {
		this.gldj = gldj;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public String getXjgjnd() {
		return xjgjnd;
	}
	public void setXjgjnd(String xjgjnd) {
		this.xjgjnd = xjgjnd;
	}
	public String getZlc() {
		return zlc;
	}
	public void setZlc(String zlc) {
		this.zlc = zlc;
	}
	public String getSbthcd() {
		return sbthcd;
	}
	public void setSbthcd(String sbthcd) {
		this.sbthcd = sbthcd;
	}
	public String getSbzt2() {
		return sbzt2;
	}
	public void setSbzt2(String sbzt2) {
		this.sbzt2 = sbzt2;
	}
	public String getYhlc() {
		return yhlc;
	}
	public void setYhlc(String yhlc) {
		this.yhlc = yhlc;
	}
	public String getGpsqd() {
		return gpsqd;
	}
	public void setGpsqd(String gpsqd) {
		this.gpsqd = gpsqd;
	}
	public String getGpszd() {
		return gpszd;
	}
	public void setGpszd(String gpszd) {
		this.gpszd = gpszd;
	}
	public String getTbbmbm() {
		return tbbmbm;
	}
	public void setTbbmbm(String tbbmbm) {
		this.tbbmbm = tbbmbm;
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
	public String getSbthbmcd() {
		return sbthbmcd;
	}
	public void setSbthbmcd(String sbthbmcd) {
		this.sbthbmcd = sbthbmcd;
	}
	public String getCzzlc() {
		return czzlc;
	}
	public void setCzzlc(String czzlc) {
		this.czzlc = czzlc;
	}
	public String getCztzgs() {
		return cztzgs;
	}
	public void setCztzgs(String cztzgs) {
		this.cztzgs = cztzgs;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getShzt() {
		return shzt;
	}
	public void setShzt(String shzt) {
		this.shzt = shzt;
	}
	public String getTbdwdm() {
		return tbdwdm;
	}
	public void setTbdwdm(String tbdwdm) {
		this.tbdwdm = tbdwdm;
	}
	public String getXmkid() {
		return xmkid;
	}
	public void setXmkid(String xmkid) {
		this.xmkid = xmkid;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	public String getShyj() {
		return shyj;
	}
	public void setShyj(String shyj) {
		this.shyj = shyj;
	}
	public String getXuh() {
		return xuh;
	}
	public void setXuh(String xuh) {
		this.xuh = xuh;
	}
	public String getXmbm() {
		return xmbm;
	}
	public void setXmbm(String xmbm) {
		this.xmbm = xmbm;
	}
	public String getBzls() {
		return bzls;
	}
	public void setBzls(String bzls) {
		this.bzls = bzls;
	}
	public String getStr1() {
		return str1;
	}
	public void setStr1(String str1) {
		this.str1 = str1;
	}
	public String getStr2() {
		return str2;
	}
	public void setStr2(String str2) {
		this.str2 = str2;
	}
	public String getStr3() {
		return str3;
	}
	public void setStr3(String str3) {
		this.str3 = str3;
	}
	public String getStr4() {
		return str4;
	}
	public void setStr4(String str4) {
		this.str4 = str4;
	}
	public String getStr5() {
		return str5;
	}
	public void setStr5(String str5) {
		this.str5 = str5;
	}
	public String getStr6() {
		return str6;
	}
	public void setStr6(String str6) {
		this.str6 = str6;
	}
	public String getStr7() {
		return str7;
	}
	public void setStr7(String str7) {
		this.str7 = str7;
	}
	public String getJhyhlc() {
		return jhyhlc;
	}
	public void setJhyhlc(String jhyhlc) {
		this.jhyhlc = jhyhlc;
	}
	public String getJhzlc() {
		return jhzlc;
	}
	public void setJhzlc(String jhzlc) {
		this.jhzlc = jhzlc;
	}
	
}
