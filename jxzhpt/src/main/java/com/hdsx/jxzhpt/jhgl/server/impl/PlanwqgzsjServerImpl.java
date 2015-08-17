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
	public Planwqgzsj loadwqgzjhkbyid(String id) {
		return queryOne("loadwqgzjhkbyid", id);
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
	public Planwqgzsj loadwqgzsbzbyid(String id) {
		Planwqgzsj jck=queryOne("cxtiaojian", id);
		if("省直管试点县".indexOf(jck.getTsdq())!=-1){
			Wqbzbz wq1=queryOne("selectshibz", jck);
			if(wq1==null){
				System.out.println("未查出市级补助，请在审核时检查代码");
			}else{
				BigDecimal b1=new BigDecimal(jck.getScqlqc()).multiply(new BigDecimal(jck.getScqlqk()));
				BigDecimal b2=b1.multiply(new BigDecimal(wq1.getBzje())).divide(new BigDecimal("10000"));
				jck.setShibz(b2+"");
			}
		}
		Wqbzbz wq1=queryOne("selectshengbz", jck);
		if(wq1==null){
			System.out.println("未查出市级补助，请在审核时检查代码");
		}else{
			if(wq1.getZdkd()!=null&&wq1.getZdkd()!=""){
				if(Double.parseDouble(wq1.getZdkd())<Double.parseDouble(jck.getScqlqk())){
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
		BigDecimal b1=new BigDecimal(jck.getScqlqc()).multiply(new BigDecimal(jck.getScqlqk()));
		BigDecimal b2=b1.multiply(new BigDecimal(wq1.getBzje())).divide(new BigDecimal("10000"));
		if(jck.getShibz()==null){
			jck.setShibz("0");
		}
		jck.setShengbz(b2.add(new BigDecimal(jck.getShibz()))+"");	
		jck.setShibz("0");
		return jck;
	}
	
	@Override
	public boolean editwqgzsj(Planwqgzsj planwqgzsj) {
		return update("editwqgzsj", planwqgzsj)==1;
	}
	@Override
	public List<Planwqgzsj> selectwqjhksb(Planwqgzsj planwqgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectwqjhksb",planwqgzsj);
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
		if("省直管试点县".indexOf(planwqgzsj.getTsdq())!=-1){
			Wqbzbz wq1=queryOne("selectshibz", planwqgzsj);
			if(wq1==null){
				System.out.println("未查出市级补助，请在审核时检查代码");
			}else{
				BigDecimal b1=new BigDecimal(planwqgzsj.getScqlqc()).multiply(new BigDecimal(planwqgzsj.getScqlqk()));
				BigDecimal b2=b1.multiply(new BigDecimal(wq1.getBzje())).divide(new BigDecimal("10000"));
				planwqgzsj.setShibz(b2+"");
			}
		}
		Wqbzbz wq1=queryOne("selectshengbz", planwqgzsj);
		if(wq1==null){
			System.out.println("未查出省级补助，请在审核时检查代码");
		}else{
			if(wq1.getZdkd()!=null&&wq1.getZdkd()!=""){
				System.out.println(planwqgzsj.getScqlqk());
				if(Double.parseDouble(wq1.getZdkd())<Double.parseDouble(planwqgzsj.getScqlqk())){
					planwqgzsj.setScqlqk(wq1.getZdkd());
				}else{
					planwqgzsj.setScqlqk(planwqgzsj.getScqlqk());
				}
			}
			else{
				planwqgzsj.setScqlqk(planwqgzsj.getScqlqk());
			}
		}
		planwqgzsj.setScqlqc(planwqgzsj.getScqlqc());
		BigDecimal b1=new BigDecimal(planwqgzsj.getScqlqc()).multiply(new BigDecimal(planwqgzsj.getScqlqk()));
		BigDecimal b2=b1.multiply(new BigDecimal(wq1.getBzje())).divide(new BigDecimal("10000"));
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
		
}
