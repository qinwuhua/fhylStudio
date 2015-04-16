package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;

@Service
public class GcglshServerImpl extends BaseOperate implements GcglshServer {

	public GcglshServerImpl() {
		super("gcglsh", "jdbc");
	}

	@Override
	public Boolean insertshYb(Gcglsh gcglsh) {
		Gcglsh gcglzhfz1=queryOne("queryYbByYf", gcglsh);
		if(gcglzhfz1!=null){
			return false;
		}
		gcglsh.setShzt("未审核");
		if(insert("insertshYb", gcglsh)>0){
			if(gcglsh.getSfsj()==9){
				gcglsh.setSjzt("未上报");
				Gcglsh gcglwqgz3 =queryOne("querymaxybyf", gcglsh);//查最大月份
				gcglsh.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", gcglsh);
				update("updateSjZT", gcglsh);
			}
			if(gcglsh.getSfsj()==11){
				gcglsh.setXjzt("未上报");
				Gcglsh gcglwqgz3 =queryOne("querymaxybyf", gcglsh);//查最大月份
				gcglsh.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", gcglsh);
				update("updateXjZT", gcglsh);
			}
			if(gcglsh.getSfsj()==7){
				gcglsh.setSjsh("未审核");
				Gcglsh gcglwqgz3 =queryOne("querymaxybyf", gcglsh);//查最大月份
				gcglsh.setSbyf(gcglwqgz3.getSbyf());
				update("updatezdyf", gcglsh);
				update("updateSJSH", gcglsh);
			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectshYbByJhidCount(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryOne("selectshYbByJhidCount", gcglsh);
	}

	@Override
	public List<Gcglsh> selectshYbByJhid(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryList("selectshYbByJhid",gcglsh);
	}
	@Override
	public int selectshYbByJhidCount1(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryOne("selectshYbByJhidCount1", gcglsh);
	}

	@Override
	public List<Gcglsh> selectshYbByJhid1(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryList("selectshYbByJhid1",gcglsh);
	}

	@Override
	public Boolean updateshYb(Gcglsh gcglsh) {
		Gcglsh gcglzhfz1=queryOne("queryYbByYf", gcglsh);
		if(gcglzhfz1!=null&&!gcglzhfz1.getId().equals(gcglsh.getId())){
			return false;
		}
		if(update("updateshYb", gcglsh)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteshYb(Gcglsh gcglsh) {
		if(delete("deleteshYb", gcglsh)>0){
			Gcglsh gcglwqgz3 =queryOne("querymaxybyf", gcglsh);//查最大月份
			if(gcglwqgz3!=null)
				gcglsh.setSbyf(gcglwqgz3.getSbyf());
			else
				gcglsh.setSbyf("");
			update("updatezdyf", gcglsh);
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shShYb(Gcglsh gcglsh) {
		if(update("shShYb", gcglsh)>0){
			gcglsh.setYhtype("7");
			int num3=queryOne("selectnumbyyh", gcglsh);
			if(num3>0){
				gcglsh.setSjsh("未审核");
				update("updateSJSH", gcglsh);
			}else{
				gcglsh.setSjsh("已审核");
				update("updateSJSH", gcglsh);
			}
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertShCgs(Gcglsh gcglsh) {
		Gcglsh gcglwqgz1=queryOne("queryCGSByYf", gcglsh);
		if(gcglwqgz1!=null){
			return false;
		}
		if(insert("insertShCgs", gcglsh)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectShCgsListCount(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryOne("selectShCgsListCount", gcglsh);
	}

	@Override
	public List<Gcglsh> selectShCgsList(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryList("selectShCgsList",gcglsh);
	}

	@Override
	public Boolean updateShCgs(Gcglsh gcglsh) {
		Gcglsh gcglwqgz1=queryOne("queryCGSByYf", gcglsh);
		if(gcglwqgz1!=null&&!gcglwqgz1.getId().equals(gcglsh.getId())){
			return false;
		}
		if(update("updateShCgs", gcglsh)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteShCgs(Gcglsh gcglsh) {
		if(delete("deleteShCgs", gcglsh)>0){
			return true;
		}else{
			return false;
		}
	}

	
	@Override
	public boolean uploadWqgzFilesgxk(Gcglsh gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglsh gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglsh gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglsh downWqgzFile(Gcglsh gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglsh gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglsh gcglwqgz) {
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglsh gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglsh gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglsh> selectWqgzjhList(Gcglsh gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglsh selectWqgzjhFile(Gcglsh gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}
	@Override
	public Boolean sbWqgzYb(Gcglsh gcglabgc) {
		if(update("sbWqgzYb", gcglabgc)>0){
			int num1=queryOne("selectnumbyyh", gcglabgc);
			if(num1>0){
				gcglabgc.setXjzt("未上报");
				update("updateXjZT", gcglabgc);
			}else{
				gcglabgc.setXjzt("已上报");
				update("updateXjZT", gcglabgc);
			}
			gcglabgc.setYhtype("9");
			int num2=queryOne("selectnumbyyh", gcglabgc);
			if(num2>0){
				gcglabgc.setSjzt("未上报");
				update("updateSjZT", gcglabgc);
			}else{
				gcglabgc.setSjzt("已上报");
				update("updateSjZT", gcglabgc);
			}
			gcglabgc.setYhtype("7");
			int num3=queryOne("selectnumbyyh", gcglabgc);
			if(num3>0){
				gcglabgc.setSjsh("未审核");
				update("updateSJSH", gcglabgc);
			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Gcglsh> exportAbyb1(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglsh);
	}

	@Override
	public Gcglsh queryCGSByYf(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryOne("queryCGSByYf", gcglsh);
	}

	@Override
	public List<Plan_shuih> queryGcgjList(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryList("queryGcgjList", gcglsh);
	}

	@Override
	public int queryGcgjListCount(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryOne("queryGcgjListCount", gcglsh);
	}

	@Override
	public List<Plan_shuih> selectWqgzjhList2(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList2", gcglsh);
	}

	@Override
	public int selectWqgzjhListcount1(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListcount1", gcglsh);
	}
}
