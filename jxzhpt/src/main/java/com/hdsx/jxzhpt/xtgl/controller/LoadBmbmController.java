/*package com.hdsx.jxzhpt.xtgl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;

import com.hdsx.webutil.struts.BaseActionSupport;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.jxzhpt.xtgl.bean.Unit;
import com.hdsx.jxzhpt.xtgl.server.XtglServer;

@Controller
public class LoadBmbmController extends BaseActionSupport{
*//**
	 * 
	 *//*
	private static final long serialVersionUID = 1L;
	@Resource (name="loadBmbmServerImpl")
	private XtglServer xtglServer;
	private Unit unit;
	
	private  HashMap<String,List<String>> hm=new  HashMap<String,List<String>>();
	private  List<HashMap<String,String>> list;
	private  HashMap<String,List<Unit>> treehm=new  HashMap<String,List<Unit>>();
	private Lock bankLock=new ReentrantLock();
	
	public void selAllBm(){
		try {
	        List<TreeNode> l=xtglServer.selAllBm(yhdw);
		    String s=JSONArray.fromObject(l).toString();
	        ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void selAllBm2(){
		try {
	        List<TreeNode> l=xtglServer.selAllBm2(yhdw);
		    String s=JSONArray.fromObject(l).toString();
	        ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*//**
	 * bmbm树
	 *//*
	public void selectBmbmList(){
		int count = xtglServer.selectBmbmListCount(unit);
		List<Unit> list = xtglServer.selectBmbmList(unit);
		int len=unit.getId().length();
		for(int i=0;i<list.size();i++){
			if(!unit.getId().equals(list.get(i).getId()))
			{
				list.get(i).set_parentId(list.get(i).getParent());
			}
			if(list.get(i).getId().length()==len+2){
				list.get(i).setState("closed");
			}
		}
		EasyUIPage<Unit> ep = new EasyUIPage<Unit>();
		ep.setTotal(count);
		ep.setRows(list);
		try {
			JsonUtils.write(ep, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void createBmbmByName(){
		int count = xtglServer.selectBmbmListCount(unit);
		List<Unit> list = xtglServer.selectBmbmList(unit);
		int len=unit.getId().length();
		for(int i=0;i<list.size();i++){
			if(!unit.getId().equals(list.get(i).getId()))
			{
				list.get(i).set_parentId(list.get(i).getParent());
			}
			if(list.get(i).getId().length()==len+2){
				list.get(i).setState("closed");
			}
			
		}
		
		for(int i=0;i<list.size();i++){
			if(list.get(i).get("ID").length()==4){
				List<String> list2=new ArrayList<String>();
				name=list.get(i).get("NAME");
				hm.put(name, list2);
				
				List<BmTree> listTree=new ArrayList<BmTree>();
				treehm.put(name, listTree);
			}else{
				hm.get(name).add(list.get(i).get("NAME"));
				
				BmTree bmTree=new BmTree();
				bmTree.setId("'"+list.get(i).get("NAME")+"'");
				bmTree.setText(list.get(i).get("NAME"));
				bmTree.setChecked(false);
				bmTree.setIconCls("icon-none");
				treehm.get(name).add(bmTree);
			}
		}
	}
	
	public void getBmbmByName(){
		String[] s=name.split(",");
		List<List<String>> llist=new ArrayList<List<String>>();
		for(int i=0;i<s.length;i++){
			List<String> nalist=hm.get(s[i]);
			if(nalist ==null){
				createBmbmByName();
				nalist=hm.get(s[i]);
				if(nalist ==null){
					nalist =new ArrayList<String>();
				}
			}
			llist.add(nalist);
		}
		
		try {
			JsonUtils.write(llist, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			bankLock.unlock();
		}
			
	}
	
	public void getBmbmTreeByName(){
		
		String[] s=name.split(",");
		List<List<BmTree>> llist=new ArrayList<List<BmTree>>();
		
		for(int i=0;i<s.length;i++){
			List<BmTree> nalist=treehm.get(s[i]);
			if(nalist ==null){
				createBmbmByName();
				nalist=treehm.get(s[i]);
				if(nalist ==null){
					nalist =new ArrayList<BmTree>();
				}
			}
			llist.add(nalist);
		}
		
		try {
			JsonUtils.write(llist, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			bankLock.unlock();
		}
			
	}

	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		bankLock.lock();
		this.unit = unit;
	}
	
	
}
*/