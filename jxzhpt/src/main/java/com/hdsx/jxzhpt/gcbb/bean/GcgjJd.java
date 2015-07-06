package com.hdsx.jxzhpt.gcbb.bean;

import java.util.Date;
import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;

public class GcgjJd {
	public GcgjJd() {
		super();
	}
	
	public GcgjJd(String jhid, String sfgyhbm, String jsdd, String lxbm,
			String qdzh, String zdzh, String yhlc, String yhlb, String sjkgsj,
			String sjwgsj, String ylmlx, String sjlmlx, String dc,
			String bywcdc, String bnwcdc, String zjwcdc, String jc,
			String bywcjc, String bnwcjc, String zjwcjc, String mc,
			String bywcmc, String bnwcmc, String zjwcmc, String pfztz,
			String gys, String bywcje, String bnwcje, String zjwcje,
			String kgzt, String jgzt, String xmmc, String bz,
			List<Plan_lx_gcgj> gjjdlx, List<Plan_lx_shuih> shjdlx) {
		super();
		this.jhid = jhid;
		this.sfgyhbm = sfgyhbm;
		this.jsdd = jsdd;
		this.lxbm = lxbm;
		this.qdzh = qdzh;
		this.zdzh = zdzh;
		this.yhlc = yhlc;
		this.yhlb = yhlb;
		this.sjkgsj = sjkgsj;
		this.sjwgsj = sjwgsj;
		this.ylmlx = ylmlx;
		this.sjlmlx = sjlmlx;
		this.dc = dc;
		this.bywcdc = bywcdc;
		this.bnwcdc = bnwcdc;
		this.zjwcdc = zjwcdc;
		this.jc = jc;
		this.bywcjc = bywcjc;
		this.bnwcjc = bnwcjc;
		this.zjwcjc = zjwcjc;
		this.mc = mc;
		this.bywcmc = bywcmc;
		this.bnwcmc = bnwcmc;
		this.zjwcmc = zjwcmc;
		this.pfztz = pfztz;
		this.gys = gys;
		this.bywcje = bywcje;
		this.bnwcje = bnwcje;
		this.zjwcje = zjwcje;
		this.kgzt = kgzt;
		this.jgzt = jgzt;
		this.xmmc = xmmc;
		this.bz = bz;
		this.gjjdlx = gjjdlx;
		this.shjdlx = shjdlx;
	}

	private String jhid;//计划ID
	private String sfgyhbm;//是否归管养单位
	private String jsdd;//建设地点
	private String lxbm;//路线编码
	private String qdzh;//起点装好
	private String zdzh;//止点桩号
	private String yhlc;//养护里程
	private String yhlb;//养护类别
	private String sjkgsj;//实际开工时间
	private String sjwgsj;//实际完工时间
	private String ylmlx;//原路面类型
	private String sjlmlx;//设计路面类型
	private String dc;//垫层
	private String bywcdc;//本月完成垫层
	private String bnwcdc;//本月完成垫层
	private String zjwcdc;//总计完成垫层
	private String jc;//基层
	private String bywcjc;//本月完成基层
	private String bnwcjc;//本年完成基层
	private String zjwcjc;//总计完成基层
	private String mc;//面层
	private String bywcmc;//本月完成面层
	private String bnwcmc;//本年完成面层
	private String zjwcmc;//总计完成面层
	private String pfztz;//批复总投资
	private String gys;//概预算
	private String bywcje;//本月万层金额
	private String bnwcje;//本月完成金额
	private String zjwcje;//总计完成金额
	private String kgzt;//开工状态
	private String jgzt;//竣工状态
	private String xmmc;//项目名称
	private String bz;//备注信息
	private List<Plan_lx_gcgj> gjjdlx;//改建进度
	private List<Plan_lx_shuih> shjdlx;//水毁进度
	public List<Plan_lx_gcgj> getGjjdlx() {
		return gjjdlx;
	}
	public void setGjjdlx(List<Plan_lx_gcgj> gjjdlx) {
		this.gjjdlx = gjjdlx;
	}
	public List<Plan_lx_shuih> getShjdlx() {
		return shjdlx;
	}
	public void setShjdlx(List<Plan_lx_shuih> shjdlx) {
		this.shjdlx = shjdlx;
	}
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	public String getSfgyhbm() {
		return sfgyhbm;
	}
	public void setSfgyhbm(String sfgyhbm) {
		this.sfgyhbm = sfgyhbm;
	}
	public String getJsdd() {
		return jsdd;
	}
	public void setJsdd(String jsdd) {
		this.jsdd = jsdd;
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm;
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
	public String getYhlc() {
		return yhlc;
	}
	public void setYhlc(String yhlc) {
		this.yhlc = yhlc;
	}
	public String getYhlb() {
		return yhlb;
	}
	public void setYhlb(String yhlb) {
		this.yhlb = yhlb;
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

	public String getYlmlx() {
		return ylmlx;
	}
	public void setYlmlx(String ylmlx) {
		this.ylmlx = ylmlx;
	}
	public String getSjlmlx() {
		return sjlmlx;
	}
	public void setSjlmlx(String sjlmlx) {
		this.sjlmlx = sjlmlx;
	}
	public String getDc() {
		return dc;
	}
	public void setDc(String dc) {
		this.dc = dc;
	}
	public String getBywcdc() {
		return bywcdc;
	}
	public void setBywcdc(String bywcdc) {
		this.bywcdc = bywcdc;
	}
	public String getBnwcdc() {
		return bnwcdc;
	}
	public void setBnwcdc(String bnwcdc) {
		this.bnwcdc = bnwcdc;
	}
	public String getZjwcdc() {
		return zjwcdc;
	}
	public void setZjwcdc(String zjwcdc) {
		this.zjwcdc = zjwcdc;
	}
	public String getJc() {
		return jc;
	}
	public void setJc(String jc) {
		this.jc = jc;
	}
	public String getBywcjc() {
		return bywcjc;
	}
	public void setBywcjc(String bywcjc) {
		this.bywcjc = bywcjc;
	}
	public String getBnwcjc() {
		return bnwcjc;
	}
	public void setBnwcjc(String bnwcjc) {
		this.bnwcjc = bnwcjc;
	}
	public String getZjwcjc() {
		return zjwcjc;
	}
	public void setZjwcjc(String zjwcjc) {
		this.zjwcjc = zjwcjc;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getBywcmc() {
		return bywcmc;
	}
	public void setBywcmc(String bywcmc) {
		this.bywcmc = bywcmc;
	}
	public String getBnwcmc() {
		return bnwcmc;
	}
	public void setBnwcmc(String bnwcmc) {
		this.bnwcmc = bnwcmc;
	}
	public String getZjwcmc() {
		return zjwcmc;
	}
	public void setZjwcmc(String zjwcmc) {
		this.zjwcmc = zjwcmc;
	}
	public String getPfztz() {
		return pfztz;
	}
	public void setPfztz(String pfztz) {
		this.pfztz = pfztz;
	}
	public String getGys() {
		return gys;
	}
	public void setGys(String gys) {
		this.gys = gys;
	}
	public String getBywcje() {
		return bywcje;
	}
	public void setBywcje(String bywcje) {
		this.bywcje = bywcje;
	}
	public String getBnwcje() {
		return bnwcje;
	}
	public void setBnwcje(String bnwcje) {
		this.bnwcje = bnwcje;
	}
	public String getZjwcje() {
		return zjwcje;
	}
	public void setZjwcje(String zjwcje) {
		this.zjwcje = zjwcje;
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
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
}
