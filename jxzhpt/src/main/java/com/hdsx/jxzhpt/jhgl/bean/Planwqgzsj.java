package com.hdsx.jxzhpt.jhgl.bean;

import java.io.Serializable;
import java.util.Date;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;

/**
 * 项目计划库——危桥改造
 * @author qwh
 *
 */
public class Planwqgzsj implements Serializable{

	private static final long serialVersionUID = 1L;
	private String id;
	private String qlmc;
	private String qlbh;
	private String xzqhmc;
	private String xzqhdm;
	private String lxmc;
	private String lxbm;
	private String gydw;
	private String gydwbm;
	private String gydwdm;
	private String xjgjnd;
	private String jsdj;
	private String pddj;
	private String qlzxzh;
	private String qlkd;
	private String qlqc;
	private String kjzc;
	private String dkzdkj;
	private String akjfl;
	private String sbjgxs;
	private String bhnr;
	private String bz;
	private String tbbmbm;
	private Date tbsj;
	private String ptx;
	private String pty;
	private String xmnf;
	private String xmtype;
	private String sbzt;
	private Date sbsj;
	private String sbbm;
	private String shzt;
	private Date shsj;
	private String shbm;
	private String sbthcd;
	private String tsdq;
	private int page;
	private int rows;
	private String sbzt2;
	private String qdzh;
	private String zdzh;
	private String qlyhgcs;
	private String qljggcs;
	private String czyjhjy;
	private String shzt1;
	private String shyj1;
	private String shyj2;
	private String xmrksj;
	private String jhjsxz;
	
	private String sckid;
	private String xmkid;
	private String scqdzh;
	private String sczdzh;
	private String sczlc;
	private String scyhlc;
	private String scqlqc;
	private String scqlqk;
	private String scxmnf;
	private String tzgs;
	private String spwh;
	private String fapgdw;
	private String fascdw;
	private String faspsj;
	private String jsxz;
	private String jsnr;
	private String scbz;
	private String scbmbm;
	private String sck_sbzt;
	private String sck_sbsj;
	private String sck_sbbm;
	private String sck_shzt;
	private String sck_shsj;
	private String sck_shbm;
	private int sck_sbthcd;
	private String sck_sbzt2;
	private String lrjh;
	private String bzls;
	private String sjdwmc;
	private String jsgmqc;
	private String jsgmqk;
	private String hzdj;
	private String sjhspl;
	private String sck_sbjgxs;
	private String kjzh;
	private String sck_xbjgxs;
	private String ztz;
	private String sgtpfsj;
	private String pfwh;
	private String zgq;
	private String xmsqbzzjje;
	private String sck_shzt1;
	private String sck_shyj1;
	private String sck_shyj2;
	private String sck_qlbh;
	private String shibz;
	private String shengbz;
	private String sck_qlzxzh;
	private String szxz;
	private String synf;
	private String qxjkuan;
	private String qxjkong;
	private String zqks;
	private String qmjk;
	private String kydwlx;
	private String thdj;
	private String glqlyt;
	private String qdlx;
	private String qtlx;
	private String pzlx;
	private String sfyapjh;
	private String  sqs;
	private String xsq;
	
	private String rksj;
	private String cjqz;
	private String scthdj;
	private String qljc;
	private String ydgldj;
	private String sjsd;
	private String scsqs;
	private String scxsq;
	private String scszxz;
	private String nsqbbz;
	private String scsjhspl;  
	
	private String sbnf;//上报年份
	private String jhkgsj;//计划开工时间
	private String jhwgsj;//计划完工时间
	private String sjdw;//设计单位
	private String sjpfdw;//设计批复单位
	private Date pfsj;//批复时间
	private String pfztz;//批复总投资
	private String jhsybzje;//计划使用部不住金额
	private String jhsydfzcje;//计划使用地方自筹金额
	private String sfsqablbz;//是否申请按比例补助
	private String ablbzsqwh;//按比例补助申请文号
	private String tbbm;//填报部门
	private String spzt;//审批状态
	private String spbm;//审批部门
	private Date spsj;//审批时间
	private String xdsj;//计划下达时间
	private String gkbgmc;//工可报告附件名称
	private String gkbglj;//工可报告附件路径
	private String sjsgtmc;
	private String sjsgtlj;
	private String sjkgsj;//实际开工时间
	private String sjwgsj;//实际完工时间
	private String sgdw;//施工单位
	private String jldw;//监理单位
	private String htje;//合同金额
	private String sgxkwj;//施工许可文件
	private String jgtcwj;//交工通车文件
	private String jgyswj;//竣工验收文件
	private String wjsczt;//文件上传状态
	private String kgzt;//开工状态
	private String jgzt;//竣工状态
	private String yjjgsj;//预计竣工时间
	private String wjgyy;//未竣工原因
	private String jsdw;//建设单位
	private String jhxdwh;//计划下达文号
	private String xdzt;//下达状态
	private String xfzt;//下发状态
	private Date xfsj;//下发时间
	private String xfbm;//下发部门
	private String wjzt;//台账完结状态
	private Date wjsj;//台账完结时间
	private String gys;//概预算
	private Sckwqgz jckwqgz;
	private String jh_sbthcd;
	private String sbbmdm;
	private String spbmdm;
	private String sfylsjl;//最近年份是否有历史记录
	private byte[] gkbgdata;
	private byte[] sjsgtdata;
	
	private String sfylrbwqk;
	private String sfkxg;
	private int sl;
	private String qlszxz;
	private String qljsgm;
	private String zyjsnr;
	private String shzt2;
	private String shyj;
	
	private String xmid;//对应项目编码
	private String xdnf;
	private String xdzj;
	private String sfzj;//是否是追加资金
	private String tbdw;
	private String tbtime;//计划下达时间
	private String btzzj;//部投资金额
	private String stz;//省投资
	private String xmmc;//项目名称
	private String lxxx;//路线信息
	private String jhqlqc;
	private String jhqlqk;
	
	public String getJhjsxz() {
		return jhjsxz;
	}
	public void setJhjsxz(String jhjsxz) {
		this.jhjsxz = jhjsxz;
	}
	public String getSck_qlzxzh() {
		return sck_qlzxzh;
	}
	public void setSck_qlzxzh(String sck_qlzxzh) {
		this.sck_qlzxzh = sck_qlzxzh;
	}
	public String getJhqlqc() {
		return jhqlqc;
	}
	public void setJhqlqc(String jhqlqc) {
		this.jhqlqc = jhqlqc;
	}
	public String getJhqlqk() {
		return jhqlqk;
	}
	public void setJhqlqk(String jhqlqk) {
		this.jhqlqk = jhqlqk;
	}
	public String getXmid() {
		return xmid;
	}
	public void setXmid(String xmid) {
		this.xmid = xmid;
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
	public String getSfzj() {
		return sfzj;
	}
	public void setSfzj(String sfzj) {
		this.sfzj = sfzj;
	}
	public String getTbdw() {
		return tbdw;
	}
	public void setTbdw(String tbdw) {
		this.tbdw = tbdw;
	}
	public String getTbtime() {
		return tbtime;
	}
	public void setTbtime(String tbtime) {
		this.tbtime = tbtime;
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
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getLxxx() {
		return lxxx;
	}
	public void setLxxx(String lxxx) {
		this.lxxx = lxxx;
	}
	public String getShzt2() {
		return shzt2;
	}
	public void setShzt2(String shzt2) {
		this.shzt2 = shzt2;
	}
	public String getShyj() {
		return shyj;
	}
	public void setShyj(String shyj) {
		this.shyj = shyj;
	}
	public String getQlszxz() {
		return qlszxz;
	}
	public void setQlszxz(String qlszxz) {
		this.qlszxz = qlszxz;
	}
	public String getQljsgm() {
		return qljsgm;
	}
	public void setQljsgm(String qljsgm) {
		this.qljsgm = qljsgm;
	}
	public String getZyjsnr() {
		return zyjsnr;
	}
	public void setZyjsnr(String zyjsnr) {
		this.zyjsnr = zyjsnr;
	}
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	public String getSfylrbwqk() {
		return sfylrbwqk;
	}
	public void setSfylrbwqk(String sfylrbwqk) {
		this.sfylrbwqk = sfylrbwqk;
	}
	public String getSfkxg() {
		return sfkxg;
	}
	public void setSfkxg(String sfkxg) {
		this.sfkxg = sfkxg;
	}
	public String getScsjhspl() {
		return scsjhspl;
	}
	public void setScsjhspl(String scsjhspl) {
		this.scsjhspl = scsjhspl;
	}
	public String getRksj() {
		return rksj;
	}
	public void setRksj(String rksj) {
		this.rksj = rksj;
	}
	public String getCjqz() {
		return cjqz;
	}
	public void setCjqz(String cjqz) {
		this.cjqz = cjqz;
	}
	public String getScthdj() {
		return scthdj;
	}
	public void setScthdj(String scthdj) {
		this.scthdj = scthdj;
	}
	public String getQljc() {
		return qljc;
	}
	public void setQljc(String qljc) {
		this.qljc = qljc;
	}
	public String getYdgldj() {
		return ydgldj;
	}
	public void setYdgldj(String ydgldj) {
		this.ydgldj = ydgldj;
	}
	public String getSjsd() {
		return sjsd;
	}
	public void setSjsd(String sjsd) {
		this.sjsd = sjsd;
	}
	public String getScsqs() {
		return scsqs;
	}
	public void setScsqs(String scsqs) {
		this.scsqs = scsqs;
	}
	public String getScxsq() {
		return scxsq;
	}
	public void setScxsq(String scxsq) {
		this.scxsq = scxsq;
	}
	public String getScszxz() {
		return scszxz;
	}
	public void setScszxz(String scszxz) {
		this.scszxz = scszxz;
	}
	public String getNsqbbz() {
		return nsqbbz;
	}
	public void setNsqbbz(String nsqbbz) {
		this.nsqbbz = nsqbbz;
	}
	public String getSzxz() {
		return szxz;
	}
	public void setSzxz(String szxz) {
		this.szxz = szxz;
	}
	public String getSynf() {
		return synf;
	}
	public void setSynf(String synf) {
		this.synf = synf;
	}
	public String getQxjkuan() {
		return qxjkuan;
	}
	public void setQxjkuan(String qxjkuan) {
		this.qxjkuan = qxjkuan;
	}
	public String getQxjkong() {
		return qxjkong;
	}
	public void setQxjkong(String qxjkong) {
		this.qxjkong = qxjkong;
	}
	public String getZqks() {
		return zqks;
	}
	public void setZqks(String zqks) {
		this.zqks = zqks;
	}
	public String getQmjk() {
		return qmjk;
	}
	public void setQmjk(String qmjk) {
		this.qmjk = qmjk;
	}
	public String getKydwlx() {
		return kydwlx;
	}
	public void setKydwlx(String kydwlx) {
		this.kydwlx = kydwlx;
	}
	public String getThdj() {
		return thdj;
	}
	public void setThdj(String thdj) {
		this.thdj = thdj;
	}
	public String getGlqlyt() {
		return glqlyt;
	}
	public void setGlqlyt(String glqlyt) {
		this.glqlyt = glqlyt;
	}
	public String getQdlx() {
		return qdlx;
	}
	public void setQdlx(String qdlx) {
		this.qdlx = qdlx;
	}
	public String getQtlx() {
		return qtlx;
	}
	public void setQtlx(String qtlx) {
		this.qtlx = qtlx;
	}
	public String getPzlx() {
		return pzlx;
	}
	public void setPzlx(String pzlx) {
		this.pzlx = pzlx;
	}
	public String getSfyapjh() {
		return sfyapjh;
	}
	public void setSfyapjh(String sfyapjh) {
		this.sfyapjh = sfyapjh;
	}
	public String getSqs() {
		return sqs;
	}
	public void setSqs(String sqs) {
		this.sqs = sqs;
	}
	public String getXsq() {
		return xsq;
	}
	public void setXsq(String xsq) {
		this.xsq = xsq;
	}
	public String getShibz() {
		return shibz;
	}
	public void setShibz(String shibz) {
		this.shibz = shibz;
	}
	public String getShengbz() {
		return shengbz;
	}
	public void setShengbz(String shengbz) {
		this.shengbz = shengbz;
	}
	public String getSck_qlbh() {
		return sck_qlbh;
	}
	public void setSck_qlbh(String sck_qlbh) {
		this.sck_qlbh = sck_qlbh;
	}
	public String getSck_shzt1() {
		return sck_shzt1;
	}
	public void setSck_shzt1(String sck_shzt1) {
		this.sck_shzt1 = sck_shzt1;
	}
	public String getSck_shyj1() {
		return sck_shyj1;
	}
	public void setSck_shyj1(String sck_shyj1) {
		this.sck_shyj1 = sck_shyj1;
	}
	public String getSck_shyj2() {
		return sck_shyj2;
	}
	public void setSck_shyj2(String sck_shyj2) {
		this.sck_shyj2 = sck_shyj2;
	}
	public String getSjdwmc() {
		return sjdwmc;
	}
	public void setSjdwmc(String sjdwmc) {
		this.sjdwmc = sjdwmc;
	}
	public String getJsgmqc() {
		return jsgmqc;
	}
	public void setJsgmqc(String jsgmqc) {
		this.jsgmqc = jsgmqc;
	}
	public String getJsgmqk() {
		return jsgmqk;
	}
	public void setJsgmqk(String jsgmqk) {
		this.jsgmqk = jsgmqk;
	}
	public String getHzdj() {
		return hzdj;
	}
	public void setHzdj(String hzdj) {
		this.hzdj = hzdj;
	}
	public String getSjhspl() {
		return sjhspl;
	}
	public void setSjhspl(String sjhspl) {
		this.sjhspl = sjhspl;
	}
	public String getSck_sbjgxs() {
		return sck_sbjgxs;
	}
	public void setSck_sbjgxs(String sck_sbjgxs) {
		this.sck_sbjgxs = sck_sbjgxs;
	}
	public String getKjzh() {
		return kjzh;
	}
	public void setKjzh(String kjzh) {
		this.kjzh = kjzh;
	}
	public String getSck_xbjgxs() {
		return sck_xbjgxs;
	}
	public void setSck_xbjgxs(String sck_xbjgxs) {
		this.sck_xbjgxs = sck_xbjgxs;
	}
	public String getZtz() {
		return ztz;
	}
	public void setZtz(String ztz) {
		this.ztz = ztz;
	}
	public String getSgtpfsj() {
		return sgtpfsj;
	}
	public void setSgtpfsj(String sgtpfsj) {
		this.sgtpfsj = sgtpfsj;
	}
	public String getPfwh() {
		return pfwh;
	}
	public void setPfwh(String pfwh) {
		this.pfwh = pfwh;
	}
	public String getZgq() {
		return zgq;
	}
	public void setZgq(String zgq) {
		this.zgq = zgq;
	}
	public String getXmsqbzzjje() {
		return xmsqbzzjje;
	}
	public void setXmsqbzzjje(String xmsqbzzjje) {
		this.xmsqbzzjje = xmsqbzzjje;
	}
	public String getSckid() {
		return sckid;
	}
	public void setSckid(String sckid) {
		this.sckid = sckid;
	}
	public String getXmkid() {
		return xmkid;
	}
	public void setXmkid(String xmkid) {
		this.xmkid = xmkid;
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
	public String getScqlqc() {
		return scqlqc;
	}
	public void setScqlqc(String scqlqc) {
		this.scqlqc = scqlqc;
	}
	public String getScqlqk() {
		return scqlqk;
	}
	public void setScqlqk(String scqlqk) {
		this.scqlqk = scqlqk;
	}
	public String getScxmnf() {
		return scxmnf;
	}
	public void setScxmnf(String scxmnf) {
		this.scxmnf = scxmnf;
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
	public String getScbmbm() {
		return scbmbm;
	}
	public void setScbmbm(String scbmbm) {
		this.scbmbm = scbmbm;
	}
	public String getSck_sbzt() {
		return sck_sbzt;
	}
	public void setSck_sbzt(String sck_sbzt) {
		this.sck_sbzt = sck_sbzt;
	}
	public String getSck_sbsj() {
		return sck_sbsj;
	}
	public void setSck_sbsj(String sck_sbsj) {
		this.sck_sbsj = sck_sbsj;
	}
	public String getSck_sbbm() {
		return sck_sbbm;
	}
	public void setSck_sbbm(String sck_sbbm) {
		this.sck_sbbm = sck_sbbm;
	}
	public String getSck_shzt() {
		return sck_shzt;
	}
	public void setSck_shzt(String sck_shzt) {
		this.sck_shzt = sck_shzt;
	}
	public String getSck_shsj() {
		return sck_shsj;
	}
	public void setSck_shsj(String sck_shsj) {
		this.sck_shsj = sck_shsj;
	}
	public String getSck_shbm() {
		return sck_shbm;
	}
	public void setSck_shbm(String sck_shbm) {
		this.sck_shbm = sck_shbm;
	}
	public int getSck_sbthcd() {
		return sck_sbthcd;
	}
	public void setSck_sbthcd(int sck_sbthcd) {
		this.sck_sbthcd = sck_sbthcd;
	}
	public String getSck_sbzt2() {
		return sck_sbzt2;
	}
	public void setSck_sbzt2(String sck_sbzt2) {
		this.sck_sbzt2 = sck_sbzt2;
	}
	public String getLrjh() {
		return lrjh;
	}
	public void setLrjh(String lrjh) {
		this.lrjh = lrjh;
	}
	public String getBzls() {
		return bzls;
	}
	public void setBzls(String bzls) {
		this.bzls = bzls;
	}
	public String getXmrksj() {
		return xmrksj;
	}
	public void setXmrksj(String xmrksj) {
		this.xmrksj = xmrksj;
	}
	public String getShzt1() {
		return shzt1;
	}
	public void setShzt1(String shzt1) {
		this.shzt1 = shzt1;
	}
	public String getShyj1() {
		return shyj1;
	}
	public void setShyj1(String shyj1) {
		this.shyj1 = shyj1;
	}
	public String getShyj2() {
		return shyj2;
	}
	public void setShyj2(String shyj2) {
		this.shyj2 = shyj2;
	}
	public String getQlyhgcs() {
		return qlyhgcs;
	}
	public void setQlyhgcs(String qlyhgcs) {
		this.qlyhgcs = qlyhgcs;
	}
	public String getQljggcs() {
		return qljggcs;
	}
	public void setQljggcs(String qljggcs) {
		this.qljggcs = qljggcs;
	}
	public String getCzyjhjy() {
		return czyjhjy;
	}
	public void setCzyjhjy(String czyjhjy) {
		this.czyjhjy = czyjhjy;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getQlmc() {
		return qlmc;
	}
	public void setQlmc(String qlmc) {
		this.qlmc = qlmc;
	}
	public String getQlbh() {
		return qlbh;
	}
	public void setQlbh(String qlbh) {
		this.qlbh = qlbh;
	}
	public String getXzqhmc() {
		return xzqhmc;
	}
	public void setXzqhmc(String xzqhmc) {
		this.xzqhmc = xzqhmc;
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
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getGydwbm() {
		return gydwbm;
	}
	public void setGydwbm(String gydwbm) {
		this.gydwbm = gydwbm;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
	public String getXjgjnd() {
		return xjgjnd;
	}
	public void setXjgjnd(String xjgjnd) {
		this.xjgjnd = xjgjnd;
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}
	public String getPddj() {
		return pddj;
	}
	public void setPddj(String pddj) {
		this.pddj = pddj;
	}
	public String getQlzxzh() {
		return qlzxzh;
	}
	public void setQlzxzh(String qlzxzh) {
		this.qlzxzh = qlzxzh;
	}
	public String getQlkd() {
		return qlkd;
	}
	public void setQlkd(String qlkd) {
		this.qlkd = qlkd;
	}
	public String getQlqc() {
		return qlqc;
	}
	public void setQlqc(String qlqc) {
		this.qlqc = qlqc;
	}
	public String getKjzc() {
		return kjzc;
	}
	public void setKjzc(String kjzc) {
		this.kjzc = kjzc;
	}
	public String getDkzdkj() {
		return dkzdkj;
	}
	public void setDkzdkj(String dkzdkj) {
		this.dkzdkj = dkzdkj;
	}
	public String getAkjfl() {
		return akjfl;
	}
	public void setAkjfl(String akjfl) {
		this.akjfl = akjfl;
	}
	public String getSbjgxs() {
		return sbjgxs;
	}
	public void setSbjgxs(String sbjgxs) {
		this.sbjgxs = sbjgxs;
	}
	public String getBhnr() {
		return bhnr;
	}
	public void setBhnr(String bhnr) {
		this.bhnr = bhnr;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getTbbmbm() {
		return tbbmbm;
	}
	public void setTbbmbm(String tbbmbm) {
		this.tbbmbm = tbbmbm;
	}
	public Date getTbsj() {
		return tbsj;
	}
	public void setTbsj(Date tbsj) {
		this.tbsj = tbsj;
	}
	public String getPtx() {
		return ptx;
	}
	public void setPtx(String ptx) {
		this.ptx = ptx;
	}
	public String getPty() {
		return pty;
	}
	public void setPty(String pty) {
		this.pty = pty;
	}
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getXmtype() {
		return xmtype;
	}
	public void setXmtype(String xmtype) {
		this.xmtype = xmtype;
	}
	public String getSbzt() {
		return sbzt;
	}
	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}
	public Date getSbsj() {
		return sbsj;
	}
	public void setSbsj(Date sbsj) {
		this.sbsj = sbsj;
	}
	public String getSbbm() {
		return sbbm;
	}
	public void setSbbm(String sbbm) {
		this.sbbm = sbbm;
	}
	public String getShzt() {
		return shzt;
	}
	public void setShzt(String shzt) {
		this.shzt = shzt;
	}
	public Date getShsj() {
		return shsj;
	}
	public void setShsj(Date shsj) {
		this.shsj = shsj;
	}
	public String getShbm() {
		return shbm;
	}
	public void setShbm(String shbm) {
		this.shbm = shbm;
	}
	public String getSbthcd() {
		return sbthcd;
	}
	public void setSbthcd(String sbthcd) {
		this.sbthcd = sbthcd;
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
	public String getSbzt2() {
		return sbzt2;
	}
	public void setSbzt2(String sbzt2) {
		this.sbzt2 = sbzt2;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	@Override
	public String toString() {
		return "Jckwqgzsj [id=" + id + ", qlmc=" + qlmc + ", qlbh=" + qlbh
				+ ", xzqhmc=" + xzqhmc + ", xzqhdm=" + xzqhdm + ", lxmc="
				+ lxmc + ", lxbm=" + lxbm + ", gydw=" + gydw + ", gydwbm="
				+ gydwbm + ", gydwdm=" + gydwdm + ", xjgjnd=" + xjgjnd
				+ ", jsdj=" + jsdj + ", pddj=" + pddj + ", qlzxzh=" + qlzxzh
				+ ", qlkd=" + qlkd + ", qlqc=" + qlqc + ", kjzc=" + kjzc
				+ ", dkzdkj=" + dkzdkj + ", akjfl=" + akjfl + ", sbjgxs="
				+ sbjgxs + ", bhnr=" + bhnr + ", bz=" + bz + ", tbbmbm="
				+ tbbmbm + ", tbsj=" + tbsj + ", ptx=" + ptx + ", pty=" + pty
				+ ", xmnf=" + xmnf + ", xmtype=" + xmtype + ", sbzt=" + sbzt
				+ ", sbsj=" + sbsj + ", sbbm=" + sbbm + ", shzt=" + shzt
				+ ", shsj=" + shsj + ", shbm=" + shbm + ", sbthcd=" + sbthcd
				+ ", tsdq=" + tsdq + ", page=" + page + ", rows=" + rows
				+ ", sbzt2=" + sbzt2 + ", qdzh=" + qdzh + ", zdzh=" + zdzh
				+ ", qlyhgcs=" + qlyhgcs + ", qljggcs=" + qljggcs
				+ ", czyjhjy=" + czyjhjy + ", shzt1=" + shzt1 + ", shyj1="
				+ shyj1 + ", shyj2=" + shyj2 + ", xmrksj=" + xmrksj
				+ ", sckid=" + sckid + ", xmkid=" + xmkid + ", scqdzh="
				+ scqdzh + ", sczdzh=" + sczdzh + ", sczlc=" + sczlc
				+ ", scyhlc=" + scyhlc + ", scqlqc=" + scqlqc + ", scqlqk="
				+ scqlqk + ", scxmnf=" + scxmnf + ", tzgs=" + tzgs + ", spwh="
				+ spwh + ", fapgdw=" + fapgdw + ", fascdw=" + fascdw
				+ ", faspsj=" + faspsj + ", jsxz=" + jsxz + ", jsnr=" + jsnr
				+ ", scbz=" + scbz + ", scbmbm=" + scbmbm + ", sck_sbzt="
				+ sck_sbzt + ", sck_sbsj=" + sck_sbsj + ", sck_sbbm="
				+ sck_sbbm + ", sck_shzt=" + sck_shzt + ", sck_shsj="
				+ sck_shsj + ", sck_shbm=" + sck_shbm + ", sck_sbthcd="
				+ sck_sbthcd + ", sck_sbzt2=" + sck_sbzt2 + ", lrjh=" + lrjh
				+ ", bzls=" + bzls + ", sjdwmc=" + sjdwmc + ", jsgmqc="
				+ jsgmqc + ", jsgmqk=" + jsgmqk + ", hzdj=" + hzdj
				+ ", sjhspl=" + sjhspl + ", sck_sbjgxs=" + sck_sbjgxs
				+ ", kjzh=" + kjzh + ", sck_xbjgxs=" + sck_xbjgxs + ", ztz="
				+ ztz + ", sgtpfsj=" + sgtpfsj + ", pfwh=" + pfwh + ", zgq="
				+ zgq + ", xmsqbzzjje=" + xmsqbzzjje + "]";
	}
	public String getSbnf() {
		return sbnf;
	}
	public void setSbnf(String sbnf) {
		this.sbnf = sbnf;
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
	public Date getPfsj() {
		return pfsj;
	}
	public void setPfsj(Date pfsj) {
		this.pfsj = pfsj;
	}
	public String getPfztz() {
		return pfztz;
	}
	public void setPfztz(String pfztz) {
		this.pfztz = pfztz;
	}
	public String getJhsybzje() {
		return jhsybzje;
	}
	public void setJhsybzje(String jhsybzje) {
		this.jhsybzje = jhsybzje;
	}
	public String getJhsydfzcje() {
		return jhsydfzcje;
	}
	public void setJhsydfzcje(String jhsydfzcje) {
		this.jhsydfzcje = jhsydfzcje;
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
	public Date getXfsj() {
		return xfsj;
	}
	public void setXfsj(Date xfsj) {
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
	public Date getWjsj() {
		return wjsj;
	}
	public void setWjsj(Date wjsj) {
		this.wjsj = wjsj;
	}
	public String getGys() {
		return gys;
	}
	public void setGys(String gys) {
		this.gys = gys;
	}
	public Sckwqgz getJckwqgz() {
		return jckwqgz;
	}
	public void setJckwqgz(Sckwqgz jckwqgz) {
		this.jckwqgz = jckwqgz;
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
	public String getSfylsjl() {
		return sfylsjl;
	}
	public void setSfylsjl(String sfylsjl) {
		this.sfylsjl = sfylsjl;
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
	public String getYjjgsj() {
		return yjjgsj;
	}
	public void setYjjgsj(String yjjgsj) {
		this.yjjgsj = yjjgsj;
	}
	
}
