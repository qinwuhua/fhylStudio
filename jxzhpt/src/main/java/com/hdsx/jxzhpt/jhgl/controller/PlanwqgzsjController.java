package com.hdsx.jxzhpt.jhgl.controller;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Planwqgzsj;
import com.hdsx.jxzhpt.jhgl.server.PlanwqgzsjServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
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
 	private String sfylrbwqk;
 	private String sbthcd;
 	private String gldj;
 	private String id;
 	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGldj() {
		return gldj;
	}
	public void setGldj(String gldj) {
		this.gldj = gldj;
	}
	public String getSbthcd() {
		return sbthcd;
	}
	public void setSbthcd(String sbthcd) {
		this.sbthcd = sbthcd;
	}
	public String getSfylrbwqk() {
		return sfylrbwqk;
	}
	public void setSfylrbwqk(String sfylrbwqk) {
		this.sfylrbwqk = sfylrbwqk;
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
		try{
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
			planwqgzsj.setTsdq(tsdq);
			planwqgzsj.setSfylrbwqk(sfylrbwqk);
			planwqgzsj.setPage(page);
			planwqgzsj.setRows(rows);
			planwqgzsj.setLxbm(gldj);
			if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
				planwqgzsj.setSbzt(jhzt);
			}
			if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
				planwqgzsj.setShzt(jhzt);
			}
			planwqgzsj.setSbthcd(sbthcd);
			List<Planwqgzsj> list = planwqgzsjServer.selectwqjhkgl(planwqgzsj);
			int count = planwqgzsjServer.selectwqjhkglcount(planwqgzsj);
			
			EasyUIPage<Planwqgzsj> eui = new EasyUIPage<Planwqgzsj>();
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void loadwqjhkglCount(){
		try{
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
			planwqgzsj.setTsdq(tsdq);
			planwqgzsj.setSfylrbwqk(sfylrbwqk);
			planwqgzsj.setPage(page);
			planwqgzsj.setRows(rows);
			planwqgzsj.setLxbm(gldj);
			if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
				planwqgzsj.setSbzt(jhzt);
			}
			if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
				planwqgzsj.setShzt(jhzt);
			}
			planwqgzsj.setSbthcd(sbthcd);
			Planwqgzsj p = planwqgzsjServer.loadwqjhkglCount(planwqgzsj);
			JsonUtils.write(p, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void loadwqgzjhkbyid(){
		try{
			Planwqgzsj p = planwqgzsjServer.loadwqgzjhkbyid(id);
			JsonUtils.write(p, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void loadwqgzsckbyid(){
		try{
			Planwqgzsj p = planwqgzsjServer.loadwqgzsckbyid(id);
			JsonUtils.write(p, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void loadwqgzxmkbyid(){
		try{
			Planwqgzsj p = planwqgzsjServer.loadwqgzxmkbyid(id);
			JsonUtils.write(p, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void loadwqgzsbzbyid(){
		try{
			Planwqgzsj p = planwqgzsjServer.loadwqgzsbzbyid(id);
			JsonUtils.write(p, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void editwqgzsj(){
		
		if(planwqgzsj.getAblbzsqwh()==null)
			planwqgzsj.setAblbzsqwh("");
		boolean bl=planwqgzsjServer.editwqgzsj(planwqgzsj);
		ResponseUtils.write(getresponse(), bl+"");
	}
	
	public void selectwqjhksb(){
		try{
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
			planwqgzsj.setTsdq(tsdq);
			planwqgzsj.setSfylrbwqk(sfylrbwqk);
			planwqgzsj.setPage(page);
			planwqgzsj.setRows(rows);
			planwqgzsj.setLxbm(gldj);
			if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
				planwqgzsj.setSbzt(jhzt);
			}
			if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
				planwqgzsj.setShzt(jhzt);
			}
			planwqgzsj.setSbthcd(sbthcd);
			List<Planwqgzsj> list = planwqgzsjServer.selectwqjhksb(planwqgzsj);
			int count = planwqgzsjServer.selectwqjhksbcount(planwqgzsj);
			
			EasyUIPage<Planwqgzsj> eui = new EasyUIPage<Planwqgzsj>();
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void loadwqjhksbCount(){
		try{
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
			planwqgzsj.setTsdq(tsdq);
			planwqgzsj.setSfylrbwqk(sfylrbwqk);
			planwqgzsj.setPage(page);
			planwqgzsj.setRows(rows);
			planwqgzsj.setLxbm(gldj);
			if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
				planwqgzsj.setSbzt(jhzt);
			}
			if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
				planwqgzsj.setShzt(jhzt);
			}
			planwqgzsj.setSbthcd(sbthcd);
			Planwqgzsj p = planwqgzsjServer.loadwqjhksbCount(planwqgzsj);
			JsonUtils.write(p, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void sbWqgzjh(){
		boolean bl=planwqgzsjServer.sbWqgzjh(planwqgzsj);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void shtyWqgzsbById(){
		boolean bl=planwqgzsjServer.shtyWqgzsbById(planwqgzsj);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void shbtyWqgzsbById(){
		boolean bl=planwqgzsjServer.shbtyWqgzsbById(planwqgzsj);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void shtyWqgzshById(){
		boolean bl=planwqgzsjServer.shtyWqgzshById(planwqgzsj);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void shbtyWqgzshById(){
		boolean bl=planwqgzsjServer.shbtyWqgzshById(planwqgzsj);
		ResponseUtils.write(getresponse(), bl+"");
	}
}
