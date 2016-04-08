package com.hdsx.jxzhpt.jhgl.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Planwqgzsj;
import com.hdsx.jxzhpt.jhgl.server.PlanwqgzsjServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
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
 	private String jsxz;
 	private String tzxz;
 	private String lxbm;
 	private String pddj;
 	
	public String getPddj() {
		return pddj;
	}
	public void setPddj(String pddj) {
		this.pddj = pddj;
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm;
	}
	public String getTzxz() {
		return tzxz;
	}
	public void setTzxz(String tzxz) {
		this.tzxz = tzxz;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}
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
				if(gydw.length()==9)
					planwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else
				planwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				planwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			planwqgzsj.setGldj(gldj);
			planwqgzsj.setLxbm(lxbm);
			planwqgzsj.setPddj(pddj);
			if(planwqgzsj.getTsdq()!=null)
				if(planwqgzsj.getTsdq().length()>0){
					String[] tsdqs=planwqgzsj.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setTsdq(tsdq);
				}
				if(planwqgzsj.getGldj()!=null)
				if(planwqgzsj.getGldj().length()>0){
					String[] tsdqs=planwqgzsj.getGldj().split(",");
					String tsdq="and substr(sck_qlbh,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setGldj(tsdq);
				}
				if(planwqgzsj.getAkjfl()!=null)
				if(planwqgzsj.getAkjfl().length()>0){
					String[] tsdqs=planwqgzsj.getAkjfl().split(",");
					String tsdq="and akjfl in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setAkjfl(tsdq);
				}
				if(planwqgzsj.getJsdj()!=null)
				if(planwqgzsj.getJsdj().length()>0){
					String[] tsdqs=planwqgzsj.getJsdj().split(",");
					String tsdq="and substr(jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						else
							tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setJsdj(tsdq);
				}
			
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
				if(gydw.length()==9)
					planwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else

				planwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				planwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			planwqgzsj.setGldj(gldj);
			planwqgzsj.setLxbm(lxbm);
			planwqgzsj.setPddj(pddj);
			if(planwqgzsj.getTsdq()!=null)
				if(planwqgzsj.getTsdq().length()>0){
					String[] tsdqs=planwqgzsj.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setTsdq(tsdq);
				}
				if(planwqgzsj.getGldj()!=null)
				if(planwqgzsj.getGldj().length()>0){
					String[] tsdqs=planwqgzsj.getGldj().split(",");
					String tsdq="and substr(sck_qlbh,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setGldj(tsdq);
				}
				if(planwqgzsj.getAkjfl()!=null)
				if(planwqgzsj.getAkjfl().length()>0){
					String[] tsdqs=planwqgzsj.getAkjfl().split(",");
					String tsdq="and akjfl in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setAkjfl(tsdq);
				}
				if(planwqgzsj.getJsdj()!=null)
				if(planwqgzsj.getJsdj().length()>0){
					String[] tsdqs=planwqgzsj.getJsdj().split(",");
					String tsdq="and substr(jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						else
							tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setJsdj(tsdq);
				}
			
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
	public void loadwqgzjhkbyid1(){
		try{
			Planwqgzsj p = planwqgzsjServer.loadwqgzjhkbyid1(id);
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
			Planwqgzsj p = planwqgzsjServer.loadwqgzsbzbyid(id,jsxz);
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
	public void editwqgzsj1(){
			
			if(planwqgzsj.getAblbzsqwh()==null)
				planwqgzsj.setAblbzsqwh("");
			boolean bl=planwqgzsjServer.editwqgzsj1(planwqgzsj);
			ResponseUtils.write(getresponse(), bl+"");
		}
	public void selectwqjhksb1(){
		try{
			if(gydw.indexOf(",")==-1){
				if(gydw.length()==9)
					planwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else

				planwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				planwqgzsj.setGydw("and gydwbm in ("+gydw+")");
			}
			if(xzqhdm.indexOf(",")==-1){
				planwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhdm+"%'");
			}else{
				planwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhdm+")");
			}
			//System.out.println(planwqgzsj.getJhzt());
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
			planwqgzsj.setLxbm(lxbm);
			planwqgzsj.setPddj(pddj);
			planwqgzsj.setGldj(gldj);
			if(planwqgzsj.getTsdq()!=null)
				if(planwqgzsj.getTsdq().length()>0){
					String[] tsdqs=planwqgzsj.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setTsdq(tsdq);
				}
				if(planwqgzsj.getGldj()!=null)
				if(planwqgzsj.getGldj().length()>0){
					String[] tsdqs=planwqgzsj.getGldj().split(",");
					String tsdq="and substr(sck_qlbh,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setGldj(tsdq);
				}
				if(planwqgzsj.getAkjfl()!=null)
				if(planwqgzsj.getAkjfl().length()>0){
					String[] tsdqs=planwqgzsj.getAkjfl().split(",");
					String tsdq="and akjfl in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setAkjfl(tsdq);
				}
				if(planwqgzsj.getJsdj()!=null)
				if(planwqgzsj.getJsdj().length()>0){
					String[] tsdqs=planwqgzsj.getJsdj().split(",");
					String tsdq="and substr(jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						else
							tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setJsdj(tsdq);
				}
			
			if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
				planwqgzsj.setSbzt(jhzt);
			}
			if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
				planwqgzsj.setShzt(jhzt);
			}
			planwqgzsj.setSbthcd(sbthcd);
			List<Planwqgzsj> list = planwqgzsjServer.selectwqjhksb1(planwqgzsj);
			int count = planwqgzsjServer.selectwqjhksbcount1(planwqgzsj);
			
			EasyUIPage<Planwqgzsj> eui = new EasyUIPage<Planwqgzsj>();
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectwqjhksb11(){
		try{
			if(gydw.indexOf(",")==-1){
				if(gydw.length()==9)
					planwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else

				planwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				planwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			planwqgzsj.setLxbm(lxbm);
			planwqgzsj.setPddj(pddj);
			planwqgzsj.setGldj(gldj);
			if(planwqgzsj.getTsdq()!=null)
				if(planwqgzsj.getTsdq().length()>0){
					String[] tsdqs=planwqgzsj.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setTsdq(tsdq);
				}
				if(planwqgzsj.getGldj()!=null)
				if(planwqgzsj.getGldj().length()>0){
					String[] tsdqs=planwqgzsj.getGldj().split(",");
					String tsdq="and substr(sck_qlbh,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setGldj(tsdq);
				}
				if(planwqgzsj.getAkjfl()!=null)
				if(planwqgzsj.getAkjfl().length()>0){
					String[] tsdqs=planwqgzsj.getAkjfl().split(",");
					String tsdq="and akjfl in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setAkjfl(tsdq);
				}
				if(planwqgzsj.getJsdj()!=null)
				if(planwqgzsj.getJsdj().length()>0){
					String[] tsdqs=planwqgzsj.getJsdj().split(",");
					String tsdq="and substr(jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						else
							tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setJsdj(tsdq);
				}
			planwqgzsj.setTzxz(tzxz);
			if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
				planwqgzsj.setSbzt(jhzt);
			}
			if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
				planwqgzsj.setShzt(jhzt);
			}
			planwqgzsj.setSbthcd(sbthcd);
			List<Planwqgzsj> list = planwqgzsjServer.selectwqjhksb11(planwqgzsj);
			int count = planwqgzsjServer.selectwqjhksbcount11(planwqgzsj);
			
			EasyUIPage<Planwqgzsj> eui = new EasyUIPage<Planwqgzsj>();
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void loadwqjhksbCount1(){
		try{
			if(gydw.indexOf(",")==-1){
				if(gydw.length()==9)
					planwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else

				planwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				planwqgzsj.setGydw("and gydwbm in ("+gydw+")");
			}
			if(xzqhdm.indexOf(",")==-1){
				planwqgzsj.setXzqhdm("and xzqhdm like '%"+xzqhdm+"%'");
			}else{
				planwqgzsj.setXzqhdm("and xzqhdm in ("+xzqhdm+")");
			}
			//System.out.println(planwqgzsj.getJhzt());
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
			planwqgzsj.setLxbm(lxbm);
			planwqgzsj.setPddj(pddj);
			planwqgzsj.setGldj(gldj);
			if(planwqgzsj.getTsdq()!=null)
				if(planwqgzsj.getTsdq().length()>0){
					String[] tsdqs=planwqgzsj.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setTsdq(tsdq);
				}
				if(planwqgzsj.getGldj()!=null)
				if(planwqgzsj.getGldj().length()>0){
					String[] tsdqs=planwqgzsj.getGldj().split(",");
					String tsdq="and substr(sck_qlbh,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setGldj(tsdq);
				}
				if(planwqgzsj.getAkjfl()!=null)
				if(planwqgzsj.getAkjfl().length()>0){
					String[] tsdqs=planwqgzsj.getAkjfl().split(",");
					String tsdq="and akjfl in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setAkjfl(tsdq);
				}
				if(planwqgzsj.getJsdj()!=null)
				if(planwqgzsj.getJsdj().length()>0){
					String[] tsdqs=planwqgzsj.getJsdj().split(",");
					String tsdq="and substr(jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						else
							tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setJsdj(tsdq);
				}
			if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
				planwqgzsj.setSbzt(jhzt);
			}
			if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
				planwqgzsj.setShzt(jhzt);
			}
			planwqgzsj.setSbthcd(sbthcd);
			Planwqgzsj p = planwqgzsjServer.loadwqjhksbCount1(planwqgzsj);
			JsonUtils.write(p, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void loadwqjhksbCount11(){
		try{
			if(gydw.indexOf(",")==-1){
				if(gydw.length()==9)
					planwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else

				planwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				planwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			planwqgzsj.setLxbm(lxbm);
			planwqgzsj.setPddj(pddj);
			planwqgzsj.setGldj(gldj);
			if(planwqgzsj.getTsdq()!=null)
				if(planwqgzsj.getTsdq().length()>0){
					String[] tsdqs=planwqgzsj.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setTsdq(tsdq);
				}
				if(planwqgzsj.getGldj()!=null)
				if(planwqgzsj.getGldj().length()>0){
					String[] tsdqs=planwqgzsj.getGldj().split(",");
					String tsdq="and substr(sck_qlbh,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setGldj(tsdq);
				}
				if(planwqgzsj.getAkjfl()!=null)
				if(planwqgzsj.getAkjfl().length()>0){
					String[] tsdqs=planwqgzsj.getAkjfl().split(",");
					String tsdq="and akjfl in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setAkjfl(tsdq);
				}
				if(planwqgzsj.getJsdj()!=null)
				if(planwqgzsj.getJsdj().length()>0){
					String[] tsdqs=planwqgzsj.getJsdj().split(",");
					String tsdq="and substr(jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						else
							tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setJsdj(tsdq);
				}
			planwqgzsj.setTzxz(tzxz);
			if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
				planwqgzsj.setSbzt(jhzt);
			}
			if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
				planwqgzsj.setShzt(jhzt);
			}
			planwqgzsj.setSbthcd(sbthcd);
			Planwqgzsj p = planwqgzsjServer.loadwqjhksbCount11(planwqgzsj);
			JsonUtils.write(p, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectwqjhksb(){
		try{
			if(gydw.indexOf(",")==-1){
				if(gydw.length()==9)
					planwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else

				planwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				planwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			planwqgzsj.setLxbm(lxbm);
			planwqgzsj.setGldj(gldj);
			planwqgzsj.setPddj(pddj);
			planwqgzsj.setGldj(gldj);
			if(planwqgzsj.getTsdq()!=null)
				if(planwqgzsj.getTsdq().length()>0){
					String[] tsdqs=planwqgzsj.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setTsdq(tsdq);
				}
				if(planwqgzsj.getGldj()!=null)
				if(planwqgzsj.getGldj().length()>0){
					String[] tsdqs=planwqgzsj.getGldj().split(",");
					String tsdq="and substr(sck_qlbh,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setGldj(tsdq);
				}
				if(planwqgzsj.getAkjfl()!=null)
				if(planwqgzsj.getAkjfl().length()>0){
					String[] tsdqs=planwqgzsj.getAkjfl().split(",");
					String tsdq="and akjfl in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setAkjfl(tsdq);
				}
				if(planwqgzsj.getJsdj()!=null)
				if(planwqgzsj.getJsdj().length()>0){
					String[] tsdqs=planwqgzsj.getJsdj().split(",");
					String tsdq="and substr(jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						else
							tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setJsdj(tsdq);
				}
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
				if(gydw.length()==9)
					planwqgzsj.setGydw("and (gydwbm='"+gydw+"'||'00' or gydwbm in(select id from xtgl_department where parent='"+gydw+"'||'00'))");					else

				planwqgzsj.setGydw("and gydwbm like '%'||substr('"+gydw+"',0,4)||'_'||substr('"+gydw+"',6)||'%'");
			}else{
				planwqgzsj.setGydw("and gydwbm in ("+gydw+")");
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
			planwqgzsj.setLxbm(lxbm);
			planwqgzsj.setPddj(pddj);
			planwqgzsj.setGldj(gldj);
			if(planwqgzsj.getTsdq()!=null)
				if(planwqgzsj.getTsdq().length()>0){
					String[] tsdqs=planwqgzsj.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setTsdq(tsdq);
				}
				if(planwqgzsj.getGldj()!=null)
				if(planwqgzsj.getGldj().length()>0){
					String[] tsdqs=planwqgzsj.getGldj().split(",");
					String tsdq="and substr(sck_qlbh,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setGldj(tsdq);
				}
				if(planwqgzsj.getAkjfl()!=null)
				if(planwqgzsj.getAkjfl().length()>0){
					String[] tsdqs=planwqgzsj.getAkjfl().split(",");
					String tsdq="and akjfl in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setAkjfl(tsdq);
				}
				if(planwqgzsj.getJsdj()!=null)
				if(planwqgzsj.getJsdj().length()>0){
					String[] tsdqs=planwqgzsj.getJsdj().split(",");
					String tsdq="and substr(jsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						else
							tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					planwqgzsj.setJsdj(tsdq);
				}
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
	public void lwBzsbz(){
		String sbz=planwqgzsjServer.lwBzsbz(planwqgzsj);
		planwqgzsj.setShengbz(sbz);
		try {
			JsonUtils.write(planwqgzsj, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dcwqgzsjjhExcel(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			planwqgzsj.setGydw("and xm.gydwbm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			planwqgzsj.setGydw("and xm.gydwbm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			planwqgzsj.setXzqhdm("and xm.xzqhdm like '%"+xzqhs+"%'");
		}else{
			planwqgzsj.setXzqhdm("and xm.xzqhdm in ("+xzqhs+")");
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
		planwqgzsj.setLxbm(lxbm);
		planwqgzsj.setPddj(pddj);
		planwqgzsj.setGldj(gldj);
		if(planwqgzsj.getTsdq()!=null)
			if(planwqgzsj.getTsdq().length()>0){
				String[] tsdqs=planwqgzsj.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setTsdq(tsdq);
			}
			if(planwqgzsj.getGldj()!=null)
			if(planwqgzsj.getGldj().length()>0){
				String[] tsdqs=planwqgzsj.getGldj().split(",");
				String tsdq="and substr(sck_qlbh,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setGldj(tsdq);
			}
			if(planwqgzsj.getAkjfl()!=null)
			if(planwqgzsj.getAkjfl().length()>0){
				String[] tsdqs=planwqgzsj.getAkjfl().split(",");
				String tsdq="and akjfl in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setAkjfl(tsdq);
			}
			if(planwqgzsj.getJsdj()!=null)
			if(planwqgzsj.getJsdj().length()>0){
				String[] tsdqs=planwqgzsj.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
				
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setJsdj(tsdq);
			}
		if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
			planwqgzsj.setSbzt(jhzt);
		}
		if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
			planwqgzsj.setShzt(jhzt);
		}
		planwqgzsj.setSbthcd(sbthcd);
		List<Excel_list> l = planwqgzsjServer.dcwqgzsjjhExcel(planwqgzsj);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("危桥改造（交通局）");//设置第一行
		eldata.setSheetName("危桥改造（交通局）");//设置sheeet名
		eldata.setFileName("危桥改造（交通局）");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,2,0,0));
		et.add(new Excel_tilte("设区市",1,2,1,1));
		et.add(new Excel_tilte("县(市、区)",1,2,2,2));
		et.add(new Excel_tilte("所在乡镇",1,2,3,3));
		et.add(new Excel_tilte("项目库",1,1,4,32));
		et.add(new Excel_tilte("审查库",1,1,33,58));
		et.add(new Excel_tilte("计划库",1,1,59,72));
		et.add(new Excel_tilte("备注",1,2,73,73));
		et.add(new Excel_tilte("桥梁名称",2,2,4,4));
		et.add(new Excel_tilte("桥梁编号",2,2,5,5));
		et.add(new Excel_tilte("路线编码",2,2,6,6));
		et.add(new Excel_tilte("路线名称",2,2,7,7));
		et.add(new Excel_tilte("公路行政等级",2,2,8,8));
		et.add(new Excel_tilte("公路技术等级",2,2,9,9));
		et.add(new Excel_tilte("中心桩号",2,2,10,10));
		et.add(new Excel_tilte("建成时间(年份)",2,2,11,11));
		et.add(new Excel_tilte("桥梁长度(米)",2,2,12,12));
		et.add(new Excel_tilte("按跨径分类",2,2,13,13));
		et.add(new Excel_tilte("按建筑材料和使用年限分类",2,2,14,14));
		et.add(new Excel_tilte("跨径总长(米)",2,2,15,15));
		et.add(new Excel_tilte("单孔最大跨径(米)",2,2,16,16));
		et.add(new Excel_tilte("设计洪水频率(年)",2,2,17,17));
		et.add(new Excel_tilte("桥下净宽(米)",2,2,18,18));
		et.add(new Excel_tilte("桥下净空(米)",2,2,19,19));
		et.add(new Excel_tilte("主桥孔数(孔)",2,2,20,20));
		et.add(new Excel_tilte("桥面净宽(米)",2,2,21,21));
		et.add(new Excel_tilte("跨越地物类型",2,2,22,22));
		et.add(new Excel_tilte("通航等级",2,2,23,23));
		et.add(new Excel_tilte("公路桥梁用途",2,2,24,24));
		et.add(new Excel_tilte("上部结构",2,2,25,25));
		et.add(new Excel_tilte("桥墩类型",2,2,26,26));
		et.add(new Excel_tilte("桥台类型",2,2,27,27));
		et.add(new Excel_tilte("铺装类型",2,2,28,28));
		et.add(new Excel_tilte("评定等级分类",2,2,29,29));
		et.add(new Excel_tilte("入库时间",2,2,30,30));
		et.add(new Excel_tilte("桥梁养护工程师",2,2,31,31));
		et.add(new Excel_tilte("桥梁监管工程师",2,2,32,32));
		et.add(new Excel_tilte("桥梁全长",2,2,33,33));
		et.add(new Excel_tilte("桥梁全宽",2,2,34,34));
		et.add(new Excel_tilte("项目年份",2,2,35,35));
		et.add(new Excel_tilte("方案评估单位",2,2,36,36));
		et.add(new Excel_tilte("方案审查单位",2,2,37,37));
		et.add(new Excel_tilte("方案审批时间",2,2,38,38));
		et.add(new Excel_tilte("审批文号",2,2,39,39));
		et.add(new Excel_tilte("建设性质",2,2,40,40));
		et.add(new Excel_tilte("投资估算",2,2,41,41));
		et.add(new Excel_tilte("设计单位名称",2,2,42,42));
		et.add(new Excel_tilte("荷载等级",2,2,43,43));
		et.add(new Excel_tilte("设计洪水频率",2,2,44,44));
		et.add(new Excel_tilte("跨径组合",2,2,45,45));
		et.add(new Excel_tilte("上部结构形式",2,2,46,46));
		et.add(new Excel_tilte("下部结构形式",2,2,47,47));
		et.add(new Excel_tilte("施工图批复时间",2,2,48,48));
		et.add(new Excel_tilte("批复文号",2,2,49,49));
		et.add(new Excel_tilte("总工期",2,2,50,50));
		et.add(new Excel_tilte("入库时间",2,2,51,51));
		et.add(new Excel_tilte("重建桥址",2,2,52,52));
		et.add(new Excel_tilte("通航等级",2,2,53,53));
		et.add(new Excel_tilte("桥梁基础",2,2,54,54));
		et.add(new Excel_tilte("引道行政等级",2,2,55,55));
		et.add(new Excel_tilte("设计速度(km/h)",2,2,56,56));
		et.add(new Excel_tilte("总投资",2,2,57,57));
		et.add(new Excel_tilte("拟申请部(省)级补助资金(万元)",2,2,58,58));
		et.add(new Excel_tilte("桥梁全长",2,2,59,59));
		et.add(new Excel_tilte("桥梁全宽",2,2,60,60));
		et.add(new Excel_tilte("上报年份",2,2,61,61));
		et.add(new Excel_tilte("计划开工时间",2,2,62,62));
		et.add(new Excel_tilte("计划完工时间",2,2,63,63));
		et.add(new Excel_tilte("设计单位",2,2,64,64));
		et.add(new Excel_tilte("设计批复单位",2,2,65,65));
		et.add(new Excel_tilte("批复文号",2,2,66,66));
		et.add(new Excel_tilte("批复时间",2,2,67,67));
		et.add(new Excel_tilte("是否申请按比例补助",2,2,68,68));
		et.add(new Excel_tilte("按比例补助申请文号",2,2,69,69));
		et.add(new Excel_tilte("批复总投资(万元)",2,2,70,70));
		et.add(new Excel_tilte("计划省(部)补助金额(万元)",2,2,71,71));
		et.add(new Excel_tilte("计划地方自筹资金(万元)：",2,2,72,72));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_exportbyXH(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dcwqgzsjjhshExcel(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			planwqgzsj.setGydw("and xm.gydwbm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			planwqgzsj.setGydw("and xm.gydwbm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			planwqgzsj.setXzqhdm("and xm.xzqhdm like '%"+xzqhs+"%'");
		}else{
			planwqgzsj.setXzqhdm("and xm.xzqhdm in ("+xzqhs+")");
		}
		planwqgzsj.setLxmc(lxmc);
		planwqgzsj.setQlmc(qlmc);
		planwqgzsj.setSbnf(sbnf);
		planwqgzsj.setAkjfl(akjfl);
		planwqgzsj.setJsdj(jsdj);
		planwqgzsj.setSfylsjl(sfylsjl);
		planwqgzsj.setTsdq(tsdq);
		planwqgzsj.setSfylrbwqk(sfylrbwqk);
		planwqgzsj.setLxbm(lxbm);
		planwqgzsj.setPddj(pddj);
		planwqgzsj.setGldj(gldj);
		if(planwqgzsj.getTsdq()!=null)
			if(planwqgzsj.getTsdq().length()>0){
				String[] tsdqs=planwqgzsj.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setTsdq(tsdq);
			}
			if(planwqgzsj.getGldj()!=null)
			if(planwqgzsj.getGldj().length()>0){
				String[] tsdqs=planwqgzsj.getGldj().split(",");
				String tsdq="and substr(sck_qlbh,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setGldj(tsdq);
			}
			if(planwqgzsj.getAkjfl()!=null)
			if(planwqgzsj.getAkjfl().length()>0){
				String[] tsdqs=planwqgzsj.getAkjfl().split(",");
				String tsdq="and akjfl in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setAkjfl(tsdq);
			}
			if(planwqgzsj.getJsdj()!=null)
			if(planwqgzsj.getJsdj().length()>0){
				String[] tsdqs=planwqgzsj.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
				
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setJsdj(tsdq);
			}
		if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
			planwqgzsj.setSbzt(jhzt);
		}
		if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
			planwqgzsj.setShzt(jhzt);
		}
		planwqgzsj.setSbthcd(sbthcd);
		List<Excel_list> l=new ArrayList<Excel_list>();
		List<Excel_list> l1 = planwqgzsjServer.dcwqgzsjjhshExcel1(planwqgzsj);
		List<Excel_list> l2= planwqgzsjServer.dcwqgzsjjhshExcel2(planwqgzsj);
		List<Excel_list> l3= planwqgzsjServer.dcwqgzsjjhshExcel3(planwqgzsj);
		if(l3.size()>0){
			l.addAll(l1);
			for (int i = 0; i < l2.size(); i++) {
				if(i==0){l2.get(i).setV_0("一");}if(i==6){l2.get(i).setV_0("七");}if(i==12){l2.get(i).setV_0("十三");}
				if(i==1){l2.get(i).setV_0("二");}if(i==7){l2.get(i).setV_0("八");}if(i==13){l2.get(i).setV_0("十四");}
				if(i==2){l2.get(i).setV_0("三");}if(i==8){l2.get(i).setV_0("九");}if(i==14){l2.get(i).setV_0("十五");}
				if(i==3){l2.get(i).setV_0("四");}if(i==9){l2.get(i).setV_0("十");}if(i==15){l2.get(i).setV_0("十六");}
				if(i==4){l2.get(i).setV_0("五");}if(i==10){l2.get(i).setV_0("十一");}if(i==16){l2.get(i).setV_0("十七");}
				if(i==5){l2.get(i).setV_0("六");}if(i==11){l2.get(i).setV_0("十二");}if(i==17){l2.get(i).setV_0("十八");}
				l.add(l2.get(i));
				int k=1;
				for (int j = 0; j < l3.size(); j++) {
					if(l3.get(j).getV_30().equals(l2.get(i).getV_30())){
						l3.get(j).setV_0(k+"");
						k++;
						l.add(l3.get(j));
					}
				}
			}
		}

		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路路网结构改造工程建设计划（危桥改造项目）");//设置第一行
		eldata.setSheetName("危桥");//设置sheeet名
		eldata.setFileName("农村公路路网结构改造工程计划项目表（中央车购税补助全省合计）");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,1,0,0));
		et.add(new Excel_tilte("设区市",1,1,1,1));
		et.add(new Excel_tilte("县(市、区)",1,1,2,2));
		et.add(new Excel_tilte("所在乡镇",1,1,3,3));
		et.add(new Excel_tilte("桥梁编码",1,1,4,4));
		et.add(new Excel_tilte("桥梁名称",1,1,5,5));
		et.add(new Excel_tilte("桥长（米）",1,1,6,6));
		et.add(new Excel_tilte("桥宽（米）",1,1,7,7));
		et.add(new Excel_tilte("建设性质",1,1,8,8));
		et.add(new Excel_tilte("建设内容",1,1,9,9));
		et.add(new Excel_tilte("总投资（万元）",1,1,10,10));
		et.add(new Excel_tilte("中央投资（万元）",1,1,11,11));
		et.add(new Excel_tilte("地方自筹资金（万元）",1,1,12,12));
		et.add(new Excel_tilte("开工年",1,1,13,13));
		et.add(new Excel_tilte("完工年",1,1,14,14));
		et.add(new Excel_tilte("路线编码",1,1,15,15));
		et.add(new Excel_tilte("路线名称",1,1,16,16));
		et.add(new Excel_tilte("中心桩号",1,1,17,17));
		et.add(new Excel_tilte("批复文号",1,1,18,18));
		et.add(new Excel_tilte("备注",1,1,19,19));
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_exportjhsh(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dcwqgzsjjhshExcelJhkgl(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			planwqgzsj.setGydw("and xm.gydwbm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			planwqgzsj.setGydw("and xm.gydwbm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			planwqgzsj.setXzqhdm("and xm.xzqhdm like '%"+xzqhs+"%'");
		}else{
			planwqgzsj.setXzqhdm("and xm.xzqhdm in ("+xzqhs+")");
		}
		planwqgzsj.setLxmc(lxmc);
		planwqgzsj.setQlmc(qlmc);
		planwqgzsj.setSbnf(sbnf);
		planwqgzsj.setAkjfl(akjfl);
		planwqgzsj.setSfylsjl(sfylsjl);
		planwqgzsj.setTsdq(tsdq);
		planwqgzsj.setSfylrbwqk(sfylrbwqk);
		if(planwqgzsj.getTsdq()!=null)
			if(planwqgzsj.getTsdq().length()>0){
				String[] tsdqs=planwqgzsj.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setTsdq(tsdq);
			}
			if(planwqgzsj.getGldj()!=null)
			if(planwqgzsj.getGldj().length()>0){
				String[] tsdqs=planwqgzsj.getGldj().split(",");
				String tsdq="and substr(sck_qlbh,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setGldj(tsdq);
			}
			if(planwqgzsj.getAkjfl()!=null)
			if(planwqgzsj.getAkjfl().length()>0){
				String[] tsdqs=planwqgzsj.getAkjfl().split(",");
				String tsdq="and akjfl in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setAkjfl(tsdq);
			}
		
		planwqgzsj.setSbthcd(sbthcd);
		List<Excel_list> l=new ArrayList<Excel_list>();
		List<Excel_list> l1 = planwqgzsjServer.dcwqgzsjjhshExcel1(planwqgzsj);
		List<Excel_list> l2= planwqgzsjServer.dcwqgzsjjhshExcel2(planwqgzsj);
		List<Excel_list> l3= planwqgzsjServer.dcwqgzsjjhshExcel3(planwqgzsj);
		if(l3.size()>0){
			l.addAll(l1);
			for (int i = 0; i < l2.size(); i++) {
				if(i==0){l2.get(i).setV_0("一");}if(i==6){l2.get(i).setV_0("七");}if(i==12){l2.get(i).setV_0("十三");}
				if(i==1){l2.get(i).setV_0("二");}if(i==7){l2.get(i).setV_0("八");}if(i==13){l2.get(i).setV_0("十四");}
				if(i==2){l2.get(i).setV_0("三");}if(i==8){l2.get(i).setV_0("九");}if(i==14){l2.get(i).setV_0("十五");}
				if(i==3){l2.get(i).setV_0("四");}if(i==9){l2.get(i).setV_0("十");}if(i==15){l2.get(i).setV_0("十六");}
				if(i==4){l2.get(i).setV_0("五");}if(i==10){l2.get(i).setV_0("十一");}if(i==16){l2.get(i).setV_0("十七");}
				if(i==5){l2.get(i).setV_0("六");}if(i==11){l2.get(i).setV_0("十二");}if(i==17){l2.get(i).setV_0("十八");}
				l.add(l2.get(i));
				int k=1;
				for (int j = 0; j < l3.size(); j++) {
					if(l3.get(j).getV_30().equals(l2.get(i).getV_30())){
						l3.get(j).setV_0(k+"");
						k++;
						l.add(l3.get(j));
					}
				}
			}
		}

		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路路网结构改造工程建设计划（危桥改造项目）");//设置第一行
		eldata.setSheetName("危桥");//设置sheeet名
		eldata.setFileName("农村公路路网结构改造工程计划项目表（中央车购税补助全省合计）");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,1,0,0));
		et.add(new Excel_tilte("设区市",1,1,1,1));
		et.add(new Excel_tilte("县(市、区)",1,1,2,2));
		et.add(new Excel_tilte("所在乡镇",1,1,3,3));
		et.add(new Excel_tilte("桥梁编码",1,1,4,4));
		et.add(new Excel_tilte("桥梁名称",1,1,5,5));
		et.add(new Excel_tilte("桥长（米）",1,1,6,6));
		et.add(new Excel_tilte("桥宽（米）",1,1,7,7));
		et.add(new Excel_tilte("建设性质",1,1,8,8));
		et.add(new Excel_tilte("建设内容",1,1,9,9));
		et.add(new Excel_tilte("总投资（万元）",1,1,10,10));
		et.add(new Excel_tilte("中央投资（万元）",1,1,11,11));
		et.add(new Excel_tilte("地方自筹资金（万元）",1,1,12,12));
		et.add(new Excel_tilte("开工年",1,1,13,13));
		et.add(new Excel_tilte("完工年",1,1,14,14));
		et.add(new Excel_tilte("路线编码",1,1,15,15));
		et.add(new Excel_tilte("路线名称",1,1,16,16));
		et.add(new Excel_tilte("中心桩号",1,1,17,17));
		et.add(new Excel_tilte("批复文号",1,1,18,18));
		et.add(new Excel_tilte("备注",1,1,19,19));
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_exportjhsh(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dcwqgzsjjhshExcel1(){
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String gydws=(String) session.getAttribute("gydwbb");	
		String xzqhs=(String) session.getAttribute("xzqhbb");
		if(gydws.indexOf(",")==-1){
			planwqgzsj.setGydw("and xm.gydwbm like '%'||substr('"+gydws+"',0,4)||'_'||substr('"+gydws+"',6)||'%'");
		}else{
			planwqgzsj.setGydw("and xm.gydwbm in ("+gydws+")");
		}
		if(xzqhs.indexOf(",")==-1){
			planwqgzsj.setXzqhdm("and xm.xzqhdm like '%"+xzqhs+"%'");
		}else{
			planwqgzsj.setXzqhdm("and xm.xzqhdm in ("+xzqhs+")");
		}
		planwqgzsj.setLxmc(lxmc);
		planwqgzsj.setQlmc(qlmc);
		planwqgzsj.setSbnf(sbnf);
		planwqgzsj.setAkjfl(akjfl);
		planwqgzsj.setJsdj(jsdj);
		planwqgzsj.setSfylsjl(sfylsjl);
		planwqgzsj.setTsdq(tsdq);
		planwqgzsj.setTzxz(tzxz);
		planwqgzsj.setSfylrbwqk(sfylrbwqk);
		planwqgzsj.setLxbm(lxbm);
		planwqgzsj.setPddj(pddj);
		planwqgzsj.setGldj(gldj);
		if(planwqgzsj.getTsdq()!=null)
			if(planwqgzsj.getTsdq().length()>0){
				String[] tsdqs=planwqgzsj.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setTsdq(tsdq);
			}
			if(planwqgzsj.getGldj()!=null)
			if(planwqgzsj.getGldj().length()>0){
				String[] tsdqs=planwqgzsj.getGldj().split(",");
				String tsdq="and substr(sck_qlbh,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setGldj(tsdq);
			}
			if(planwqgzsj.getAkjfl()!=null)
			if(planwqgzsj.getAkjfl().length()>0){
				String[] tsdqs=planwqgzsj.getAkjfl().split(",");
				String tsdq="and akjfl in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setAkjfl(tsdq);
			}
			if(planwqgzsj.getJsdj()!=null)
			if(planwqgzsj.getJsdj().length()>0){
				String[] tsdqs=planwqgzsj.getJsdj().split(",");
				String tsdq="and substr(jsdj,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					else
						tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
				
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				planwqgzsj.setJsdj(tsdq);
			}
		if("未上报".equals(jhzt)||"已上报".equals(jhzt)){
			planwqgzsj.setSbzt(jhzt);
		}
		if("未审核".equals(jhzt)||"已审核".equals(jhzt)){
			planwqgzsj.setShzt(jhzt);
		}
		planwqgzsj.setSbthcd(sbthcd);
		List<Excel_list> l=new ArrayList<Excel_list>();
		List<Excel_list> l1 = planwqgzsjServer.dcwqgzsjjhshExcel4(planwqgzsj);
		List<Excel_list> l2= planwqgzsjServer.dcwqgzsjjhshExcel5(planwqgzsj);
		List<Excel_list> l3= planwqgzsjServer.dcwqgzsjjhshExcel6(planwqgzsj);
		if(l3.size()>0){
			l.addAll(l1);
			for (int i = 0; i < l2.size(); i++) {
				if(i==0){l2.get(i).setV_0("一");}if(i==6){l2.get(i).setV_0("七");}if(i==12){l2.get(i).setV_0("十三");}
				if(i==1){l2.get(i).setV_0("二");}if(i==7){l2.get(i).setV_0("八");}if(i==13){l2.get(i).setV_0("十四");}
				if(i==2){l2.get(i).setV_0("三");}if(i==8){l2.get(i).setV_0("九");}if(i==14){l2.get(i).setV_0("十五");}
				if(i==3){l2.get(i).setV_0("四");}if(i==9){l2.get(i).setV_0("十");}if(i==15){l2.get(i).setV_0("十六");}
				if(i==4){l2.get(i).setV_0("五");}if(i==10){l2.get(i).setV_0("十一");}if(i==16){l2.get(i).setV_0("十七");}
				if(i==5){l2.get(i).setV_0("六");}if(i==11){l2.get(i).setV_0("十二");}if(i==17){l2.get(i).setV_0("十八");}
				l.add(l2.get(i));
				int k=1;
				for (int j = 0; j < l3.size(); j++) {
					if(l3.get(j).getV_30().equals(l2.get(i).getV_30())){
						l3.get(j).setV_0(k+"");
						k++;
						l.add(l3.get(j));
					}
				}
			}
		}

		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路路网结构改造工程建设计划（危桥改造项目）");//设置第一行
		eldata.setSheetName("危桥");//设置sheeet名
		eldata.setFileName("农村公路路网结构改造工程计划项目表（中央车购税补助全省合计）");//设置文件名
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,1,0,0));
		et.add(new Excel_tilte("设区市",1,1,1,1));
		et.add(new Excel_tilte("县(市、区)",1,1,2,2));
		et.add(new Excel_tilte("所在乡镇",1,1,3,3));
		et.add(new Excel_tilte("桥梁编码",1,1,4,4));
		et.add(new Excel_tilte("桥梁名称",1,1,5,5));
		et.add(new Excel_tilte("桥长（米）",1,1,6,6));
		et.add(new Excel_tilte("桥宽（米）",1,1,7,7));
		et.add(new Excel_tilte("建设性质",1,1,8,8));
		et.add(new Excel_tilte("建设内容",1,1,9,9));
		et.add(new Excel_tilte("总投资（万元）",1,1,10,10));
		et.add(new Excel_tilte("中央投资（万元）",1,1,11,11));
		et.add(new Excel_tilte("地方自筹资金（万元）",1,1,12,12));
		et.add(new Excel_tilte("开工年",1,1,13,13));
		et.add(new Excel_tilte("完工年",1,1,14,14));
		et.add(new Excel_tilte("路线编码",1,1,15,15));
		et.add(new Excel_tilte("路线名称",1,1,16,16));
		et.add(new Excel_tilte("中心桩号",1,1,17,17));
		et.add(new Excel_tilte("批复文号",1,1,18,18));
		et.add(new Excel_tilte("备注",1,1,19,19));
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		
			Excel_export.excel_exportjhsh(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void tuihuiWqgzsjById(){
		try {
			JsonUtils.write(planwqgzsjServer.tuihuiWqgzsjById(planwqgzsj),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void tzxz(){
		ResponseUtils.write(getresponse(),planwqgzsjServer.tzxz(planwqgzsj)+"");
	}
	public void thtz(){
		ResponseUtils.write(getresponse(),planwqgzsjServer.thtz(planwqgzsj)+"");
	}
	public void thtz1(){
		ResponseUtils.write(getresponse(),planwqgzsjServer.thtz1(planwqgzsj)+"");
	}
}
