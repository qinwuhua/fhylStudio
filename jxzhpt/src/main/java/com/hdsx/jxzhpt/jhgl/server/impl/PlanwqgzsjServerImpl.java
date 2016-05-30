package com.hdsx.jxzhpt.jhgl.server.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Planwqgzsj;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.PlanwqgzsjServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Wqbzbz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class PlanwqgzsjServerImpl extends BaseOperate implements PlanwqgzsjServer {
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
	public PlanwqgzsjServerImpl() {
		super("planwqgzsj","jdbc");
	}
	@Override
	public List<Planwqgzsj> selectwqjhkgl(Planwqgzsj planwqgzsj) {
		return queryList("selectwqjhkgl",planwqgzsj);
	}
	@Override
	public int selectwqjhkglcount(Planwqgzsj planwqgzsj) {
		return queryOne("selectwqjhkglcount", planwqgzsj);
	}
	@Override
	public Planwqgzsj loadwqjhkglCount(Planwqgzsj planwqgzsj) {
		List<Planwqgzsj> list=queryList("loadwqjhkglCount", planwqgzsj);
		Planwqgzsj p=new Planwqgzsj();
		BigDecimal pfztz=new BigDecimal("0");
		BigDecimal btz=new BigDecimal("0");
		BigDecimal stz=new BigDecimal("0");
		BigDecimal qttz=new BigDecimal("0");
		int sl=0;
		for (Planwqgzsj pl : list) {
			sl=sl+pl.getSl();
			pfztz=pfztz.add(new BigDecimal(pl.getPfztz()==null ? "0":pl.getPfztz()));
			btz=btz.add(new BigDecimal(pl.getJhsybzje()==null ? "0":pl.getJhsybzje()));
			stz=stz.add(new BigDecimal(pl.getShengbz()==null ? "0":pl.getShengbz()));
			qttz=qttz.add(new BigDecimal(pl.getJhsydfzcje()==null ? "0":pl.getJhsydfzcje()));
		}
		p.setPfztz(pfztz+"");
		p.setJhsybzje(btz+"");
		p.setShengbz(stz+"");
		p.setJhsydfzcje(qttz+"");
		p.setSl(sl);
		return p;
	}
	@Override
	public Planwqgzsj loadwqjhksbCount(Planwqgzsj planwqgzsj) {
		List<Planwqgzsj> list=queryList("loadwqjhksbCount", planwqgzsj);
		Planwqgzsj p=new Planwqgzsj();
		BigDecimal pfztz=new BigDecimal("0");
		BigDecimal btz=new BigDecimal("0");
		BigDecimal stz=new BigDecimal("0");
		BigDecimal qttz=new BigDecimal("0");
		BigDecimal xdzj=new BigDecimal("0");
		int sl=0;
		for (Planwqgzsj pl : list) {
			sl=sl+pl.getSl();
			pfztz=pfztz.add(new BigDecimal(pl.getPfztz()==null ? "0":pl.getPfztz()));
			btz=btz.add(new BigDecimal(pl.getJhsybzje()==null ? "0":pl.getJhsybzje()));
			stz=stz.add(new BigDecimal(pl.getShengbz()==null ? "0":pl.getShengbz()));
			qttz=qttz.add(new BigDecimal(pl.getJhsydfzcje()==null ? "0":pl.getJhsydfzcje()));
			xdzj=xdzj.add(new BigDecimal(pl.getXdzj()==null ? "0":pl.getXdzj()));
		}
		p.setPfztz(pfztz+"");
		p.setJhsybzje(btz+"");
		p.setShengbz(stz+"");
		p.setJhsydfzcje(qttz+"");
		p.setXdzj(xdzj+"");
		p.setSl(sl);
		return p;
	}
	@Override
	public Planwqgzsj loadwqjhksbCount1(Planwqgzsj planwqgzsj) {
		List<Planwqgzsj> list=queryList("loadwqjhksbCount1", planwqgzsj);
		Planwqgzsj p=new Planwqgzsj();
		BigDecimal pfztz=new BigDecimal("0");
		BigDecimal btz=new BigDecimal("0");
		BigDecimal stz=new BigDecimal("0");
		BigDecimal qttz=new BigDecimal("0");
		BigDecimal xdzj=new BigDecimal("0");
		int sl=0;
		for (Planwqgzsj pl : list) {
			sl=sl+pl.getSl();
			pfztz=pfztz.add(new BigDecimal(pl.getPfztz()==null ? "0":pl.getPfztz()));
			btz=btz.add(new BigDecimal(pl.getJhsybzje()==null ? "0":pl.getJhsybzje()));
			stz=stz.add(new BigDecimal(pl.getShengbz()==null ? "0":pl.getShengbz()));
			qttz=qttz.add(new BigDecimal(pl.getJhsydfzcje()==null ? "0":pl.getJhsydfzcje()));
			xdzj=xdzj.add(new BigDecimal(pl.getXdzj()==null ? "0":pl.getXdzj()));
		}
		p.setPfztz(pfztz+"");
		p.setJhsybzje(btz+"");
		p.setShengbz(stz+"");
		p.setJhsydfzcje(qttz+"");
		p.setXdzj(xdzj+"");
		p.setSl(sl);
		return p;
	}
	@Override
	public Planwqgzsj loadwqjhksbCount11(Planwqgzsj planwqgzsj) {
		List<Planwqgzsj> list=queryList("loadwqjhksbCount11", planwqgzsj);
		Planwqgzsj p=new Planwqgzsj();
		BigDecimal pfztz=new BigDecimal("0");
		BigDecimal btz=new BigDecimal("0");
		BigDecimal stz=new BigDecimal("0");
		BigDecimal qttz=new BigDecimal("0");
		BigDecimal xdzj=new BigDecimal("0");
		int sl=0;
		for (Planwqgzsj pl : list) {
			sl=sl+pl.getSl();
			pfztz=pfztz.add(new BigDecimal(pl.getPfztz()==null ? "0":pl.getPfztz()));
			btz=btz.add(new BigDecimal(pl.getJhsybzje()==null ? "0":pl.getJhsybzje()));
			stz=stz.add(new BigDecimal(pl.getShengbz()==null ? "0":pl.getShengbz()));
			qttz=qttz.add(new BigDecimal(pl.getJhsydfzcje()==null ? "0":pl.getJhsydfzcje()));
			xdzj=xdzj.add(new BigDecimal(pl.getXdzj()==null ? "0":pl.getXdzj()));
		}
		p.setPfztz(pfztz+"");
		p.setJhsybzje(btz+"");
		p.setShengbz(stz+"");
		p.setJhsydfzcje(qttz+"");
		p.setXdzj(xdzj+"");
		p.setSl(sl);
		return p;
	}
	@Override
	public Planwqgzsj loadwqgzjhkbyid(String id) {
		return queryOne("loadwqgzjhkbyid", id);
	}
	@Override
	public Planwqgzsj loadwqgzjhkbyid1(String id) {
		return queryOne("loadwqgzjhkbyid1", id);
	}
	@Override
	public Planwqgzsj loadwqgzsckbyid(String id) {
		return queryOne("loadwqgzsckbyid", id);
	}
	@Override
	public Planwqgzsj loadwqgzxmkbyid(String id) {
		return queryOne("loadwqgzxmkbyid", id);
	}
	@Override
	public Planwqgzsj loadwqgzsbzbyid(String id,String jsxz) {
		Planwqgzsj jck=queryOne("cxtiaojian", id);
		jck.setJsxz(jsxz);
		if(jck.getTsdq()!=null)
		if(jck.getTsdq().indexOf("省直管试点县")!=-1){
			Wqbzbz wq1=queryOne("selectshibz", jck);
			if(wq1==null){
				System.out.println("未查出市级补助，请在审核时检查代码");
			}else{
				BigDecimal b1=new BigDecimal(jck.getScqlqc().trim()).multiply(new BigDecimal(jck.getScqlqk().trim()));
				BigDecimal b2=b1.multiply(new BigDecimal(wq1.getBzje().trim())).divide(new BigDecimal("10000"));
				jck.setShibz(b2+"");
			}
		}
		Wqbzbz wq1=queryOne("selectshengbz", jck);
		if(wq1==null){
			System.out.println("未查出市级补助，请在审核时检查代码");
		}else{
			if(wq1.getZdkd()!=null&&wq1.getZdkd()!=""){
				if(Double.parseDouble(wq1.getZdkd().trim())<Double.parseDouble(jck.getScqlqk().trim())){
					jck.setScqlqk(wq1.getZdkd());
				}else{
					jck.setScqlqk(jck.getScqlqk());
				}
			}
			else{
				jck.setScqlqk(jck.getScqlqk());
			}
		}
		jck.setScqlqc(jck.getScqlqc());
		BigDecimal b1=new BigDecimal(jck.getScqlqc().trim()).multiply(new BigDecimal(jck.getScqlqk().trim()));
		BigDecimal b2=b1.multiply(new BigDecimal(wq1.getBzje().trim())).divide(new BigDecimal("10000"));
		if(jck.getShibz()==null){
			jck.setShibz("0");
		}
		jck.setShengbz(b2.add(new BigDecimal(jck.getShibz()))+"");	
		jck.setShibz("0");
		return jck;
	}
	
	//省奖励
	@Override
	public Planwqgzsj loadwqgzsjlbyid(String id) {
		Planwqgzsj jck=queryOne("cxtiaojian", id);
		if(jck!=null){
			Wqbzbz w=queryOne("cxwqjlbz", jck);
			if(w != null)  jck.setNsqsjl(w.getJlzj());
			else jck.setNsqsjl("0");
			
			return jck;
		}else{
			Planwqgzsj j=new Planwqgzsj();
			j.setNsqsjl("0");
			return j;
		}
	}
	
	@Override
	public boolean editwqgzsj(Planwqgzsj planwqgzsj) {
		return update("editwqgzsj", planwqgzsj)==1;
	}
	@Override
	public boolean editwqgzsj1(Planwqgzsj planwqgzsj) {
		return update("editwqgzsj1", planwqgzsj)==1;
	}
	@Override
	public List<Planwqgzsj> selectwqjhksb(Planwqgzsj planwqgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectwqjhksb",planwqgzsj);
	}
	@Override
	public int selectwqjhksbcount1(Planwqgzsj planwqgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectwqjhksbcount1", planwqgzsj);
	}
	
	@Override
	public List<Planwqgzsj> selectwqjhksb1(Planwqgzsj planwqgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectwqjhksb1",planwqgzsj);
	}
	
	@Override
	public int selectwqjhksbcount11(Planwqgzsj planwqgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectwqjhksbcount11", planwqgzsj);
	}
	
	@Override
	public List<Planwqgzsj> selectwqjhksb11(Planwqgzsj planwqgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectwqjhksb11",planwqgzsj);
	}
	@Override
	public int selectwqjhksbcount(Planwqgzsj planwqgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectwqjhksbcount", planwqgzsj);
	}
	
	@Override
	public boolean sbWqgzjh(Planwqgzsj planwqgzsj) {
		String[] strs = planwqgzsj.getId().split(",");
		String[] sbth=planwqgzsj.getSbthcd().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("sbbm", planwqgzsj.getSbbm());
			hm.put("sbthcd", sbth[i]);
			lm.add(hm);
		}
		if(updateBatch("sbWqgzjh", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean shtyWqgzsbById(Planwqgzsj planwqgzsj) {
		return update("shtyWqgzsbById", planwqgzsj)==1;
	}
	@Override
	public boolean shbtyWqgzsbById(Planwqgzsj planwqgzsj) {
		return update("shbtyWqgzsbById", planwqgzsj)==1;
	}
	@Override
	public boolean shtyWqgzshById(Planwqgzsj planwqgzsj) {
		// TODO Auto-generated method stub
		return update("shtyWqgzshById", planwqgzsj)==1;
	}
	@Override
	public boolean shbtyWqgzshById(Planwqgzsj planwqgzsj) {
		// TODO Auto-generated method stub
		return update("shbtyWqgzshById", planwqgzsj)==1;
	}
	@Override
	public String lwBzsbz(Planwqgzsj planwqgzsj) {
		try{
		if(planwqgzsj.getTsdq()!=null)
		if(planwqgzsj.getTsdq().indexOf("省直管试点县")!=-1){
			Wqbzbz wq1=queryOne("selectshibz", planwqgzsj);
			if(wq1==null){
				System.out.println("未查出市级补助，请在审核时检查代码");
			}else{
				BigDecimal b1=new BigDecimal(planwqgzsj.getScqlqc().trim()).multiply(new BigDecimal(planwqgzsj.getScqlqk().trim()));
				BigDecimal b2=b1.multiply(new BigDecimal(wq1.getBzje().trim())).divide(new BigDecimal("10000"));
				planwqgzsj.setShibz(b2+"");
			}
		}
		Wqbzbz wq1=queryOne("selectshengbz", planwqgzsj);
		if(wq1==null){
			System.out.println("未查出省级补助，请在审核时检查代码");
		}else{
			if(wq1.getZdkd()!=null&&wq1.getZdkd()!=""){
				if(Double.parseDouble(wq1.getZdkd().trim())<Double.parseDouble(planwqgzsj.getScqlqk().trim())){
					planwqgzsj.setScqlqk(wq1.getZdkd().trim());
				}else{
					planwqgzsj.setScqlqk(planwqgzsj.getScqlqk().trim());
				}
			}
			else{
				planwqgzsj.setScqlqk(planwqgzsj.getScqlqk());
			}
		}
		planwqgzsj.setScqlqc(planwqgzsj.getScqlqc());
		BigDecimal b1=new BigDecimal(planwqgzsj.getScqlqc().trim()).multiply(new BigDecimal(planwqgzsj.getScqlqk().trim()));
		BigDecimal b2=b1.multiply(new BigDecimal(wq1.getBzje().trim())).divide(new BigDecimal("10000"));
		if(planwqgzsj.getShibz()==null){
			planwqgzsj.setShibz("0");
		}
		planwqgzsj.setShengbz(b2.add(new BigDecimal(planwqgzsj.getShibz()))+"");
		}catch(Exception e){
			e.printStackTrace();
		}
		return planwqgzsj.getShengbz();
	}
	@Override
	public List<Excel_list> dcwqgzsjjhExcel(Planwqgzsj planwqgzsj) {
		return queryList("dcwqgzsjjhExcel",planwqgzsj);
	}
	@Override
	public List<Excel_list> dcwqgzsjjhshExcel1(Planwqgzsj planwqgzsj) {
		return queryList("dcwqgzsjjhshExcel1",planwqgzsj);
	}
	@Override
	public List<Excel_list> dcwqgzsjjhshExcel2(Planwqgzsj planwqgzsj) {
		return queryList("dcwqgzsjjhshExcel2",planwqgzsj);
	}
	@Override
	public List<Excel_list> dcwqgzsjjhshExcel3(Planwqgzsj planwqgzsj) {
		return queryList("dcwqgzsjjhshExcel3",planwqgzsj);
	}
	
	@Override
	public List<Excel_list> dcwqgzsjjhshExcel4(Planwqgzsj planwqgzsj) {
		return queryList("dcwqgzsjjhshExcel4",planwqgzsj);
	}
	@Override
	public List<Excel_list> dcwqgzsjjhshExcel5(Planwqgzsj planwqgzsj) {
		return queryList("dcwqgzsjjhshExcel5",planwqgzsj);
	}
	@Override
	public List<Excel_list> dcwqgzsjjhshExcel6(Planwqgzsj planwqgzsj) {
		return queryList("dcwqgzsjjhshExcel6",planwqgzsj);
	}
	
	@Override
	public boolean tuihuiWqgzsjById(Planwqgzsj planwqgzsj) {
			String[] strs = planwqgzsj.getId().split(",");
			list = new ArrayList<String>();
			for (int i = 0; i < strs.length; i++) {
				list.add(strs[i]);
			}
			if(deleteBatch("tuihuiWqgzsjById", list)>0) return true;
			else return false;
		
	}
	@Override
	public boolean tzxz(Planwqgzsj id) {
		int a=update("tzxzyb", id);
		int b=0;
		Planwqgzsj planwqgzsj=queryOne("querytzbyid", id);
		 if(planwqgzsj==null){
			 b=insert("tzxztj", id);
		 }else{
			 b=update("tzxzxg", id);
		 }
		if(a==1&&b==1){
			if("取消".equals(id.getTzxz())){
				int c=delete("qxtzxz",id);
				return c==1;
			}else{
				return true;
			}
		}
		return false;
	}
	@Override
	public boolean thtz(Planwqgzsj planwqgzsj) {
		delete("qxtzxz",planwqgzsj);
		insert("thtz",planwqgzsj);
		delete("thtzxjhb",planwqgzsj);
		return true;
	}
	@Override
	public boolean thtz1(Planwqgzsj planwqgzsj) {
		insert("thtz",planwqgzsj);
		delete("thtzxjhb",planwqgzsj);
		return true;
	}
	@Override
	public List<Excel_list> selectwqjhexcel(Planwqgzsj planwqgzsj) {
		return queryList("selectwqjhexcel",planwqgzsj);
	}
	
}
