package com.hdsx.jxzhpt.jhgl.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.PlanZjqf;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjqfServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_zjqfController extends BaseActionSupport{
	private PlanZjqf zjqf;
	@Resource(name = "plan_zjqfServerImpl")
	private Plan_zjqfServer zjqfServer;
	private TreeNode xzqh;
	private Map<String, Object> result;
	
	public void queryChildGydw(){
		try {
			List<TreeNode> list =zjqfServer.queryChildGydw(xzqh);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryZjqfByGydwbm(){
		try {
			List<PlanZjqf> result = zjqfServer.queryZjqfByGydwbm(zjqf);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryZjqfByZjqf(){
		try {
			PlanZjqf result = zjqfServer.queryZjqfByZjqf(zjqf);
			System.out.println("资金切分："+result.getZhfz());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editOrSave(){
		try{
			String[] gydwbm = zjqf.getGydwbm().split("\\-");
			String[] parent = zjqf.getParent().split("\\-");
			String[] nf = zjqf.getNf().split("\\-");
			String[] wqgz = zjqf.getWqgz().split("\\-");
			String[] abgc = zjqf.getAbgc().split("\\-");
			String[] zhfz = zjqf.getZhfz().split("\\-");
			List<PlanZjqf> save=new ArrayList<PlanZjqf>();
			List<PlanZjqf> update=new ArrayList<PlanZjqf>();
			for (int i = 0; i < gydwbm.length; i++) {
				PlanZjqf zjqf=new PlanZjqf(null, gydwbm[i], parent[i], nf[i],wqgz[i].trim(), abgc[i].trim(), zhfz[i].trim());
				//如果查不到此数据
				System.out.println("管养单位："+zjqf.getGydwbm());
				if(zjqfServer.queryZjqfByZjqf(zjqf)==null){
					save.add(zjqf);
				}else{
					update.add(zjqf);
				}
			}
			System.out.println("保存个数："+save.size());
			System.out.println("修改个数："+update.size());
			zjqfServer.insertZjqfBatch(save);
			zjqfServer.updateZjqfBatch(update);
			System.out.println(zjqf.getWqgz());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void queryChildXzqh(){
		TreeNode treenode=new TreeNode();
		treenode.setId(xzqh.getId());
		List<TreeNode> queryChildXzqh = zjqfServer.queryChildXzqh(treenode);
		try {
			JsonUtils.write(queryChildXzqh, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//get set
	public PlanZjqf getZjqf() {
		return zjqf;
	}
	public void setZjqf(PlanZjqf zjqf) {
		this.zjqf = zjqf;
	}
	public Plan_zjqfServer getZjqfServer() {
		return zjqfServer;
	}
	public void setZjqfServer(Plan_zjqfServer zjqfServer) {
		this.zjqfServer = zjqfServer;
	}

	public TreeNode getXzqh() {
		return xzqh;
	}
	public void setXzqh(TreeNode xzqh) {
		this.xzqh = xzqh;
	}
}
