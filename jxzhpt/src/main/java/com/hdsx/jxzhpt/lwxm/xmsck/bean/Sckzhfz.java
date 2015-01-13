package com.hdsx.jxzhpt.lwxm.xmsck.bean;

import java.io.Serializable;
import java.util.Date;
/**\
 * 项目审查库——灾害防治实体
 * @author LHP
 *
 */
public class Sckzhfz implements Serializable{

	private static final long serialVersionUID = 1L;
		private String sckid;
		private String id;
		private String xmkid;
		private String scqdzh;
		private String sczdzh;
		private String sczlc;
		private String scyhlc;
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
		private int page;
		private int rows;
		//基础库字段
		private String gydwdm;
		private String gydwbm;
		private String gydw;
		private String xzqhdm;
		private String xzqhmc;
		private String lxjsdj;
		private String lxbm;
		private String lxmc;
		private String qdzh;
		private String zdzh;
		private String qzlc;
		private String yhlc;
		private String gjxjnd;
		private String yhnr;
		private String tbbmbm;	//填报部门编码
		private Date tbsj;
		private String xmnf;
		private String xmtype;  //项目状态
		private String sbzt;
		private Date sbsj;
		private String sbbm;
		private String shzt;
		private Date shsj;
		private String shbm;
		private String bz;
		
		public String getSckid() {
			return sckid;
		}
		public void setSckid(String sckid) {
			this.sckid = sckid;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
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

		public String getGydw() {
			return gydw;
		}
		public void setGydw(String gydw) {
			this.gydw = gydw;
		}
		public String getXzqhmc() {
			return xzqhmc;
		}
		public void setXzqhmc(String xzqhmc) {
			this.xzqhmc = xzqhmc;
		}
		public String getLxmc() {
			return lxmc;
		}
		public void setLxmc(String lxmc) {
			this.lxmc = lxmc;
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
		public String getShzt() {
			return shzt;
		}
		public void setShzt(String shzt) {
			this.shzt = shzt;
		}
		public String getLxjsdj() {
			return lxjsdj;
		}
		public void setLxjsdj(String lxjsdj) {
			this.lxjsdj = lxjsdj;
		}
		public String getLxbm() {
			return lxbm;
		}
		public void setLxbm(String lxbm) {
			this.lxbm = lxbm;
		}
		public String getGydwdm() {
			return gydwdm;
		}
		public void setGydwdm(String gydwdm) {
			this.gydwdm = gydwdm;
		}
		public String getGydwbm() {
			return gydwbm;
		}
		public void setGydwbm(String gydwbm) {
			this.gydwbm = gydwbm;
		}
		public String getXzqhdm() {
			return xzqhdm;
		}
		public void setXzqhdm(String xzqhdm) {
			this.xzqhdm = xzqhdm;
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
		public String getQzlc() {
			return qzlc;
		}
		public void setQzlc(String qzlc) {
			this.qzlc = qzlc;
		}
		public String getYhlc() {
			return yhlc;
		}
		public void setYhlc(String yhlc) {
			this.yhlc = yhlc;
		}
		public String getGjxjnd() {
			return gjxjnd;
		}
		public void setGjxjnd(String gjxjnd) {
			this.gjxjnd = gjxjnd;
		}
		public String getYhnr() {
			return yhnr;
		}
		public void setYhnr(String yhnr) {
			this.yhnr = yhnr;
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
		public String getBz() {
			return bz;
		}
		public void setBz(String bz) {
			this.bz = bz;
		}
		@Override
		public String toString() {
			return "Sckabgc [id=" + id + ", xmkid=" + xmkid + ", scqdzh="
					+ scqdzh + ", sczdzh=" + sczdzh + ", sczlc=" + sczlc
					+ ", scyhlc=" + scyhlc + ", tzgs=" + tzgs + ", spwh="
					+ spwh + ", fapgdw=" + fapgdw + ", fascdw=" + fascdw
					+ ", faspsj=" + faspsj + ", jsxz=" + jsxz + ", jsnr="
					+ jsnr + ", scbz=" + scbz + ", scbmbm=" + scbmbm
					+ ", sck_sbzt=" + sck_sbzt + ", sck_sbsj=" + sck_sbsj
					+ ", sck_sbbm=" + sck_sbbm + ", sck_shzt=" + sck_shzt
					+ ", sck_shsj=" + sck_shsj + ", sck_shbm=" + sck_shbm
					+ ", page=" + page + ", rows=" + rows + "]";
		}
		
}
