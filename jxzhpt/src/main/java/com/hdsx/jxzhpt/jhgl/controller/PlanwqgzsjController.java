package com.hdsx.jxzhpt.jhgl.controller;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Planwqgzsj;
import com.hdsx.jxzhpt.jhgl.server.PlanwqgzsjServer;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class PlanwqgzsjController extends BaseActionSupport {
	private int page=1;
	private int rows=10;
	@Resource(name = "planwqgzsjServerImpl")
	private PlanwqgzsjServer planwqgzsjServer;
	private Planwqgzsj planwqgzsj=new Planwqgzsj();
	private String gydw;
 	private String xzqhdm;
 	private String lxmc;
 	private String qlmc;
 	private String sbnf;
 	private String jhzt;
 	private String jsdj;
 	private String akjfl;
 	private String sfylsjl;
 	private String tsdq;
 	
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
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	public String getQlmc() {
		return qlmc;
	}
	public void setQlmc(String qlmc) {
		this.qlmc = qlmc;
	}
	public String getSbnf() {
		return sbnf;
	}
	public void setSbnf(String sbnf) {
		this.sbnf = sbnf;
	}
	public String getJhzt() {
		return jhzt;
	}
	public void setJhzt(String jhzt) {
		this.jhzt = jhzt;
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}
	public String getAkjfl() {
		return akjfl;
	}
	public void setAkjfl(String akjfl) {
		this.akjfl = akjfl;
	}
	public String getSfylsjl() {
		return sfylsjl;
	}
	public void setSfylsjl(String sfylsjl) {
		this.sfylsjl = sfylsjl;
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public Planwqgzsj getPlanwqgzsj() {
		return planwqgzsj;
	}
	public void setPlanwqgzsj(Planwqgzsj planwqgzsj) {
		this.planwqgzsj = planwqgzsj;
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
	
	/**
	 * qwh
	 */
	public void selectwqjhkgl(){
		if(gydw.indexOf(",")==-1){
			planwqgzsj.setGydw("and tbbmbm like '%"+gydw+"%'");
		}else{
			planwqgzsj.setGydw("and tbbmbm in ("+gydw+")");
		}
		if(xzqhdm.indexOf(",")==-1){
			planwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhdm+"%'");
		}else{
			planwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhdm+")");
		}
		planwqgzsj.setLxmc(lxmc);
		planwqgzsj.setQlmc(qlmc);
		planwqgzsj.setSbnf(sbnf);
		planwqgzsj.setAkjfl(akjfl);
		planwqgzsj.setJsdj(jsdj);
		planwqgzsj.setSfylsjl(sfylsjl);
		
	}
	
}
