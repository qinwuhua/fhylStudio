package com.hdsx.jxzhpt.gcgl.server.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglbhsd;
import com.hdsx.jxzhpt.gcgl.server.GcglbhsdServer;
@Service
public class GcglbhsdServerImpl extends BaseOperate implements GcglbhsdServer {

	public GcglbhsdServerImpl() {
		super("gcglbhsd", "jdbc");
	}

	@Override
	public Boolean insertWqgzYb(Gcglbhsd gcglbhsd) {
		gcglbhsd.setTbyf(gcglbhsd.getSbyf());
		Gcglbhsd Gcglbhsd1=queryOne("queryYbByYf", gcglbhsd);
		if(Gcglbhsd1!=null){
			return false;
		}
		gcglbhsd.setShzt("未审核");
		if(insert("insertBhsdYb", gcglbhsd)>0){
			if(gcglbhsd.getSfsj()==4){
				gcglbhsd.setSjzt("未上报");
				Gcglbhsd gcglbhsd3 =queryOne("querymaxybyf", gcglbhsd);//查最大月份
				gcglbhsd.setSbyf(gcglbhsd3.getSbyf());
				update("updatezdyf", gcglbhsd);
				update("updateSjZT", gcglbhsd);
			}
			if(gcglbhsd.getSfsj()==6){
				gcglbhsd.setXjzt("未上报");
				Gcglbhsd gcglbhsd3 =queryOne("querymaxybyf", gcglbhsd);//查最大月份
				gcglbhsd.setSbyf(gcglbhsd3.getSbyf());
				update("updatezdyf", gcglbhsd);
				update("updateXjZT", gcglbhsd);
			}
			if(gcglbhsd.getSfsj()==2){
				gcglbhsd.setSjsh("未审核");
				Gcglbhsd gcglbhsd3 =queryOne("querymaxybyf", gcglbhsd);//查最大月份
				gcglbhsd.setSbyf(gcglbhsd3.getSbyf());
				update("updatezdyf", gcglbhsd);
				update("updateSJSH", gcglbhsd);
			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzYbByJhidCount(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryOne("selectBhsdYbByJhidCount", Gcglbhsd);
	}

	@Override
	public List<Gcglbhsd> selectWqgzYbByJhid(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryList("selectBhsdYbByJhid",Gcglbhsd);
	}
	@Override
	public int selectWqgzYbByJhidCount1(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryOne("selectBhsdYbByJhidCount1", Gcglbhsd);
	}

	@Override
	public List<Gcglbhsd> selectWqgzYbByJhid1(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryList("selectBhsdYbByJhid1",Gcglbhsd);
	}
	
	
	@Override
	public Boolean updateWqgzYb(Gcglbhsd Gcglbhsd) {
		Gcglbhsd Gcglbhsd1=queryOne("queryYbByYf", Gcglbhsd);
		if(Gcglbhsd1!=null&&!Gcglbhsd1.getId().equals(Gcglbhsd.getId())){
			return false;
		}
		if(insert("updateBhsdYb", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteWqgzYb(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		if(delete("deleteBhsdYb", Gcglbhsd)>0){
				Gcglbhsd Gcglbhsd3 =queryOne("querymaxybyf", Gcglbhsd);//查最大月份
				if(Gcglbhsd3!=null)
				Gcglbhsd.setSbyf(Gcglbhsd3.getSbyf());
				else
					Gcglbhsd.setSbyf("");
				update("updatezdyf", Gcglbhsd);
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shwqgzyb(Gcglbhsd Gcglbhsd) {
		if(update("shbhsdyb", Gcglbhsd)>0){
			Gcglbhsd.setYhtype("2");
			int num3=queryOne("selectnumbyyh", Gcglbhsd);
			if(num3>0){
				Gcglbhsd.setSjsh("未审核");
				update("updateSJSH", Gcglbhsd);
			}else{
				Gcglbhsd.setSjsh("已审核");
				update("updateSJSH", Gcglbhsd);
			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzCgs(Gcglbhsd Gcglbhsd) {
		Gcglbhsd Gcglbhsd1=queryOne("queryCGSByYf", Gcglbhsd);
		if(Gcglbhsd1!=null){
			return false;
		}
		if(insert("insertBhsdCgs", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzCgsListCount(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryOne("selectBhsdCgsListCount", Gcglbhsd);
	}

	@Override
	public List<Gcglbhsd> selectWqgzCgsList(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryList("selectBhsdCgsList",Gcglbhsd);
	}

	@Override
	public Boolean updateWqgzCgs(Gcglbhsd Gcglbhsd) {
		Gcglbhsd Gcglbhsd1=queryOne("queryCGSByYf", Gcglbhsd);
		if(Gcglbhsd1!=null&&!Gcglbhsd1.getId().equals(Gcglbhsd.getId())){
			return false;
		}
		if(update("updateBhsdCgs", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deletewqgzCgs(Gcglbhsd Gcglbhsd) {
		if(delete("deletebhsdCgs", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilesgxk(Gcglbhsd Gcglbhsd) {
		if(update("uploadBhsdFilesgxk", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglbhsd Gcglbhsd) {
		if(update("uploadBhsdFilejgtc", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglbhsd Gcglbhsd) {
		if(update("uploadBhsdFilejgys", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglbhsd downWqgzFile(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryOne("downBhsdFile", Gcglbhsd);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglbhsd Gcglbhsd) {
		if(update("insertBhsdwwg", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglbhsd Gcglbhsd) {
		Gcglbhsd.setJgzt("1");
		if(update("insertBhsdwg", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglbhsd Gcglbhsd) {
		Gcglbhsd.setKgzt("1");
		if(update("insertBhsdkg", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryOne("selectBhsdjhListCount", Gcglbhsd);
	}

	@Override
	public List<Gcglbhsd> selectWqgzjhList(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryList("selectBhsdjhList", Gcglbhsd);
	}

	@Override
	public Gcglbhsd selectWqgzjhFile(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryOne("selectBhsdjhFile", Gcglbhsd);
	}

	@Override
	public Boolean deleteWqgzFile(Gcglbhsd Gcglbhsd) {
		if(delete("deleteBhsdFile", Gcglbhsd)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean sbWqgzYb(Gcglbhsd Gcglbhsd) {
		if(update("sbBhsdYb", Gcglbhsd)>0){
			Gcglbhsd.setYhtype("6");
			int num1=queryOne("selectnumbyyh", Gcglbhsd);
			if(num1>0){
				Gcglbhsd.setXjzt("未上报");
				update("updateXjZT", Gcglbhsd);
			}else{
				Gcglbhsd.setXjzt("已上报");
				update("updateXjZT", Gcglbhsd);
			}
			Gcglbhsd.setYhtype("4");
			int num2=queryOne("selectnumbyyh", Gcglbhsd);
			if(num2>0){
				Gcglbhsd.setSjzt("未上报");
				update("updateSjZT", Gcglbhsd);
			}else{
				Gcglbhsd.setSjzt("已上报");
				update("updateSjZT", Gcglbhsd);
			}
			Gcglbhsd.setYhtype("2");
			int num3=queryOne("selectnumbyyh", Gcglbhsd);
			if(num3>0){
				Gcglbhsd.setSjsh("未审核");
				update("updateSJSH", Gcglbhsd);
			}
//			else{
//				Gcglbhsd.setSjsh("已审核");
//				update("updateXjZT", Gcglbhsd);
//			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Gcglbhsd> selectWqgzyf(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryList("selectBhsdyf", Gcglbhsd);
	}

	@Override
	public Gcglbhsd selectWqgzwcqk(Gcglbhsd Gcglbhsd) {
		Gcglbhsd Gcglbhsd1 = queryOne("selectBhsdwcqkmin", Gcglbhsd);
		Gcglbhsd Gcglbhsd2 = queryOne("selectBhsdwcqkmax", Gcglbhsd);
		if(Gcglbhsd1!=null){
			Gcglbhsd.setWcqkmin(Gcglbhsd1.getWcqkmin());
		}else{
			Gcglbhsd.setWcqkmin("0");
		}
		if(Gcglbhsd2!=null){
			Gcglbhsd.setWcqkmax(Gcglbhsd2.getWcqkmax());
		}else{
			Gcglbhsd.setWcqkmax("100");
		}
		return Gcglbhsd;
	}

	@Override
	public Gcglbhsd selectWqgzbzzj(Gcglbhsd Gcglbhsd) {
		Gcglbhsd Gcglbhsd1 = queryOne("selectbhzj1", Gcglbhsd);
		Gcglbhsd Gcglbhsd2 = queryOne("selectbhzj2", Gcglbhsd);
		Gcglbhsd Gcglbhsd3 = queryOne("selectbhzj3", Gcglbhsd);
		Gcglbhsd Gcglbhsd4 = queryOne("selectbhzj4", Gcglbhsd);
		if(Gcglbhsd1!=null)
		Gcglbhsd.setZbfzj(Gcglbhsd1.getZbfzj());
		if(Gcglbhsd2!=null)
		Gcglbhsd.setNbfzj(Gcglbhsd2.getNbfzj());
		if(Gcglbhsd3!=null)
		Gcglbhsd.setNxdzj(Gcglbhsd3.getNxdzj());
		if(Gcglbhsd4!=null)
			Gcglbhsd.setZxdzj(Gcglbhsd4.getZxdzj());
		return Gcglbhsd;
	}

	@Override
	public Gcglbhsd queryCGSByYf(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryOne("queryCGSByYf", Gcglbhsd);
	}

	@Override
	public List<Gcglbhsd> selectWqgzjhList1(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryList("selectBhsdjhList1", Gcglbhsd);
	}

	@Override
	public int selectWqgzjhListcount1(Gcglbhsd Gcglbhsd) {
		// TODO Auto-generated method stub
		return queryOne("selectBhsdjhListcount1", Gcglbhsd);
	}

	@Override
	public Gcglbhsd selectcgsyf(Gcglbhsd Gcglbhsd) {
		Gcglbhsd g=queryOne("selectcgsyf", Gcglbhsd);
		if(g==null){
			Gcglbhsd.setZjdw_btz("0");
			Gcglbhsd.setZjdw_stz("0");
			return Gcglbhsd;
		}else{
			return g;
		}
	}

}
