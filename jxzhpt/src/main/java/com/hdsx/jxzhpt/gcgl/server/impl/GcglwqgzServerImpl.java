package com.hdsx.jxzhpt.gcgl.server.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
@Service
public class GcglwqgzServerImpl extends BaseOperate implements GcglwqgzServer {

	public GcglwqgzServerImpl() {
		super("gcglwqgz", "jdbc");
	}

	@Override
	public Boolean insertWqgzYb(Gcglwqgz gcglwqgz) {
		gcglwqgz.setTbyf(gcglwqgz.getSbyf());
		Gcglwqgz gcglwqgz1=queryOne("queryYbByYf", gcglwqgz);
		if(gcglwqgz1!=null){
			return false;
		}
		gcglwqgz.setShzt("未审核");
		if(insert("insertWqgzYb", gcglwqgz)>0){
			if(gcglwqgz.getSfsj()==9){
				gcglwqgz.setSjzt("未上报");
				Gcglwqgz gcglwqgz3 =queryOne("querymaxybyf", gcglwqgz);//查最大月份
				gcglwqgz.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", gcglwqgz);
				update("updateSjZT", gcglwqgz);
			}
			if(gcglwqgz.getSfsj()==11){
				gcglwqgz.setXjzt("未上报");
				Gcglwqgz gcglwqgz3 =queryOne("querymaxybyf", gcglwqgz);//查最大月份
				gcglwqgz.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", gcglwqgz);
				update("updateXjZT", gcglwqgz);
			}
			if(gcglwqgz.getSfsj()==7){
				gcglwqgz.setSjsh("未审核");
				Gcglwqgz gcglwqgz3 =queryOne("querymaxybyf", gcglwqgz);//查最大月份
				gcglwqgz.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", gcglwqgz);
				update("updateSJSH", gcglwqgz);
			}
			return true;
		}else{
			return false;
		}
	}
	@Override
	public Boolean insertWqgzYb1(Gcglwqgz gcglwqgz) {
		gcglwqgz.setTbyf(gcglwqgz.getSbyf());
		Gcglwqgz gcglwqgz1=queryOne("queryYbByYf", gcglwqgz);
		if(gcglwqgz1!=null){
			return false;
		}
		gcglwqgz.setShzt("未审核");
		if(insert("insertWqgzYb1", gcglwqgz)>0){
			if(gcglwqgz.getSfsj()==9){
				gcglwqgz.setSjzt("未上报");
				Gcglwqgz gcglwqgz3 =queryOne("querymaxybyf", gcglwqgz);//查最大月份
				gcglwqgz.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", gcglwqgz);
				update("updateSjZT", gcglwqgz);
			}
			if(gcglwqgz.getSfsj()==11){
				gcglwqgz.setXjzt("未上报");
				Gcglwqgz gcglwqgz3 =queryOne("querymaxybyf", gcglwqgz);//查最大月份
				gcglwqgz.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", gcglwqgz);
				update("updateXjZT", gcglwqgz);
			}
			if(gcglwqgz.getSfsj()==7){
				gcglwqgz.setSjsh("未审核");
				Gcglwqgz gcglwqgz3 =queryOne("querymaxybyf", gcglwqgz);//查最大月份
				gcglwqgz.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", gcglwqgz);
				update("updateSJSH", gcglwqgz);
			}
			return true;
		}else{
			return false;
		}
	}
	@Override
	public int selectWqgzYbByJhidCount(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzYbByJhidCount", gcglwqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqgzYbByJhid(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzYbByJhid",gcglwqgz);
	}
	@Override
	public int selectWqgzYbByJhidCount1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzYbByJhidCount1", gcglwqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqgzYbByJhid1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzYbByJhid1",gcglwqgz);
	}
	
	
	@Override
	public Boolean updateWqgzYb(Gcglwqgz gcglwqgz) {
		Gcglwqgz gcglwqgz1=queryOne("queryYbByYf", gcglwqgz);
		if(gcglwqgz1!=null&&!gcglwqgz1.getId().equals(gcglwqgz.getId())){
			return false;
		}
		if(insert("updateWqgzYb", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteWqgzYb(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		if(delete("deleteWqgzYb", gcglwqgz)>0){
				Gcglwqgz gcglwqgz3 =queryOne("querymaxybyf", gcglwqgz);//查最大月份
				if(gcglwqgz3!=null)
				gcglwqgz.setSbyf(gcglwqgz3.getSbyf());
				else
					gcglwqgz.setSbyf("");
				update("updatezdyf", gcglwqgz);
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shwqgzyb(Gcglwqgz gcglwqgz) {
		if(update("shwqgzyb", gcglwqgz)>0){
			gcglwqgz.setYhtype("7");
			int num3=queryOne("selectnumbyyh", gcglwqgz);
			if(num3>0){
				gcglwqgz.setSjsh("未审核");
				update("updateSJSH", gcglwqgz);
			}else{
				gcglwqgz.setSjsh("已审核");
				update("updateSJSH", gcglwqgz);
			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzCgs(Gcglwqgz gcglwqgz) {
		/*Gcglwqgz gcglwqgz1=queryOne("queryCGSByYf", gcglwqgz);
		if(gcglwqgz1!=null){
			return false;
		}*/
		if(insert("insertWqgzCgs", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzCgsListCount(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzCgsListCount", gcglwqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqgzCgsList(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzCgsList",gcglwqgz);
	}

	@Override
	public Boolean updateWqgzCgs(Gcglwqgz gcglwqgz) {
		Gcglwqgz gcglwqgz1=queryOne("queryCGSByYf", gcglwqgz);
		if(gcglwqgz1!=null&&!gcglwqgz1.getId().equals(gcglwqgz.getId())){
			return false;
		}
		if(update("updateWqgzCgs", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deletewqgzCgs(Gcglwqgz gcglwqgz) {
		if(delete("deletewqgzCgs", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilesgxk(Gcglwqgz gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglwqgz gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglwqgz gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglwqgz downWqgzFile(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglwqgz gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglwqgz gcglwqgz) {
		//System.out.println(gcglwqgz.getJcqc()+"********");
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglwqgz gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqgzjhList(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglwqgz selectWqgzjhFile(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}

	@Override
	public Boolean deleteWqgzFile(Gcglwqgz gcglwqgz) {
		if(delete("deleteWqgzFile", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean sbWqgzYb(Gcglwqgz gcglwqgz) {
		if(update("sbWqgzYb", gcglwqgz)>0){
			gcglwqgz.setYhtype("11");
			int num1=queryOne("selectnumbyyh", gcglwqgz);
			if(num1>0){
				gcglwqgz.setXjzt("未上报");
				update("updateXjZT", gcglwqgz);
			}else{
				gcglwqgz.setXjzt("已上报");
				update("updateXjZT", gcglwqgz);
			}
			gcglwqgz.setYhtype("9");
			int num2=queryOne("selectnumbyyh", gcglwqgz);
			if(num2>0){
				gcglwqgz.setSjzt("未上报");
				update("updateSjZT", gcglwqgz);
			}else{
				gcglwqgz.setSjzt("已上报");
				update("updateSjZT", gcglwqgz);
			}
			gcglwqgz.setYhtype("7");
			int num3=queryOne("selectnumbyyh", gcglwqgz);
			if(num3>0){
				gcglwqgz.setSjsh("未审核");
				update("updateSJSH", gcglwqgz);
			}
//			else{
//				gcglwqgz.setSjsh("已审核");
//				update("updateXjZT", gcglwqgz);
//			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Gcglwqgz> selectWqgzyf(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzyf", gcglwqgz);
	}

	@Override
	public Gcglwqgz selectWqgzwcqk(Gcglwqgz gcglwqgz) {
		Gcglwqgz gcglwqgz1 = queryOne("selectWqgzwcqkmin", gcglwqgz);
		Gcglwqgz gcglwqgz2 = queryOne("selectWqgzwcqkmax", gcglwqgz);
		if(gcglwqgz1!=null){
			gcglwqgz.setWcqkmin(gcglwqgz1.getWcqkmin());
		}else{
			gcglwqgz.setWcqkmin("0");
		}
		if(gcglwqgz2!=null){
			gcglwqgz.setWcqkmax(gcglwqgz2.getWcqkmax());
		}else{
			gcglwqgz.setWcqkmax("100");
		}
		return gcglwqgz;
	}

	@Override
	public Gcglwqgz selectWqgzbzzj(Gcglwqgz gcglwqgz) {
		Gcglwqgz gcglwqgz1 = queryOne("selectwqzj1", gcglwqgz);
		Gcglwqgz gcglwqgz2 = queryOne("selectwqzj2", gcglwqgz);
		Gcglwqgz gcglwqgz3 = queryOne("selectwqzj3", gcglwqgz);
		Gcglwqgz gcglwqgz4 = queryOne("selectwqzj4", gcglwqgz);
		Gcglwqgz gcglwqgz5=null;
		if("gcgl_gcgzsj".equals(gcglwqgz.getTablename())){
			gcglwqgz5 = queryOne("selectwqzj6", gcglwqgz);
		}else if("gcgl_gcgzgj".equals(gcglwqgz.getTablename())||"gcgl_xj".equals(gcglwqgz.getTablename())||"gcgl_sh".equals(gcglwqgz.getTablename())){
			gcglwqgz5 = queryOne("selectwqzj7", gcglwqgz);
		}else{
			gcglwqgz5 = queryOne("selectwqzj5", gcglwqgz);
		}
		if(gcglwqgz1!=null)
		gcglwqgz.setZbfzj(gcglwqgz1.getZbfzj());
		if(gcglwqgz2!=null)
		gcglwqgz.setNbfzj(gcglwqgz2.getNbfzj());
		if(gcglwqgz3!=null)
		gcglwqgz.setNxdzj(gcglwqgz3.getNxdzj());
		if(gcglwqgz4!=null)
			gcglwqgz.setZxdzj(gcglwqgz4.getZxdzj());
		if(gcglwqgz5!=null){
			gcglwqgz.setZwczj(gcglwqgz5.getZwczj());
			gcglwqgz.setZwcbtz(gcglwqgz5.getZwcbtz());
			gcglwqgz.setZwcstz(gcglwqgz5.getZwcstz());
			gcglwqgz.setYhdk(gcglwqgz5.getYhdk());
			gcglwqgz.setGz(gcglwqgz5.getGz());
			gcglwqgz.setSz(gcglwqgz5.getSz());
		}
		return gcglwqgz;
	}

	@Override
	public Gcglwqgz queryCGSByYf(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("queryCGSByYf", gcglwqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqgzjhList1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList1", gcglwqgz);
	}

	@Override
	public int selectWqgzjhListcount1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListcount1", gcglwqgz);
	}

	@Override
	public Gcglwqgz selectcgsyf(Gcglwqgz gcglwqgz) {
		Gcglwqgz g=queryOne("selectcgsyf", gcglwqgz);
		if(g==null){
			gcglwqgz.setZjdw_btz("0");
			gcglwqgz.setZjdw_stz("0");
			gcglwqgz.setYhdk("0");
			gcglwqgz.setGz("0");
			gcglwqgz.setSz("0");
			return gcglwqgz;
		}else{
			return g;
		}
	}

	@Override
	public List<Excel_list> dcwqgzsjExcel(Gcglwqgz gcglwqgz) {
		List<Excel_list> list=new ArrayList<Excel_list>();
		Excel_list ll=queryOne("dcwqgzsjExcelhj", gcglwqgz);
		List<Excel_list> l=queryList("dcwqgzsjExcel", gcglwqgz);
		if(l.size()>0){
			list.add(ll);
			list.addAll(l);
		}
		return list;
	}

	@Override
	public boolean ybyshbwsh(Gcglwqgz gcglwqgz) {
		return update("ybyshbwsh", gcglwqgz)==1;
	}

	@Override
	public Gcglwqgz selectWqgzTj(Gcglwqgz gcglwqgz) {
		return queryOne("selectWqgzTj", gcglwqgz);
	}

	@Override
	public Gcglwqgz selectsfkwg(Gcglwqgz gcglwqgz) {
		Gcglwqgz g = queryOne("selectsfkwg", gcglwqgz);
		return g;
	}

	@Override
	public Gcglwqgz queryGcglwqtjInYb(String jhid) {
		return queryOne("queryGcglwqtjInYb", jhid);
	}

}
