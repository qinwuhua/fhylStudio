package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglhsly;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglhslyServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;

@Service
public class GcglhslyServerImpl extends BaseOperate implements GcglhslyServer {

	public GcglhslyServerImpl() {
		super("gcglhsly", "jdbc");
	}

	@Override
	public Boolean inserthslyYb(Gcglhsly gcglhsly) {
		Gcglhsly gcglzhfz1=queryOne("queryYbByYf", gcglhsly);
		if(gcglzhfz1!=null){
			return false;
		}
		gcglhsly.setShzt("未审核");
		if(insert("inserthslyYb", gcglhsly)>0){
			if(gcglhsly.getSfsj()==9){
				gcglhsly.setSjzt("未上报");
				update("updateSjZT", gcglhsly);
			}
			if(gcglhsly.getSfsj()==11){
				gcglhsly.setXjzt("未上报");
				update("updateXjZT", gcglhsly);
			}
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selecthslyYbByJhidCount(Gcglhsly gcglhsly) {
		// TODO Auto-generated method stub
		return queryOne("selecthslyYbByJhidCount", gcglhsly);
	}

	@Override
	public List<Gcglhsly> selecthslyYbByJhid(Gcglhsly gcglhsly) {
		// TODO Auto-generated method stub
		return queryList("selecthslyYbByJhid",gcglhsly);
	}

	@Override
	public int selecthslyYbByJhidCount1(Gcglhsly gcglhsly) {
		// TODO Auto-generated method stub
		return queryOne("selecthslyYbByJhidCount1", gcglhsly);
	}

	@Override
	public List<Gcglhsly> selecthslyYbByJhid1(Gcglhsly gcglhsly) {
		// TODO Auto-generated method stub
		return queryList("selecthslyYbByJhid1",gcglhsly);
	}
	@Override
	public Boolean updatehslyYb(Gcglhsly gcglhsly) {
		Gcglhsly gcglzhfz1=queryOne("queryYbByYf", gcglhsly);
		if(gcglzhfz1!=null&&!gcglzhfz1.getId().equals(gcglhsly.getId())){
			return false;
		}
		if(update("updatehslyYb", gcglhsly)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deletehslyYb(Gcglhsly gcglhsly) {
		if(delete("deletehslyYb", gcglhsly)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shhslyYb(Gcglhsly gcglhsly) {
		if(update("shhslyYb", gcglhsly)>0){
			gcglhsly.setYhtype("7");
			int num3=queryOne("selectnumbyyh", gcglhsly);
			if(num3>0){
				gcglhsly.setSjsh("未审核");
				update("updateSJSH", gcglhsly);
			}else{
				gcglhsly.setSjsh("已审核");
				update("updateSJSH", gcglhsly);
			}
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertHslyCgs(Gcglhsly gcglhsly) {
		Gcglhsly gcglwqgz1=queryOne("queryCGSByYf", gcglhsly);
		if(gcglwqgz1!=null){
			return false;
		}
		if(insert("insertHslyCgs", gcglhsly)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectHslyCgsListCount(Gcglhsly gcglhsly) {
		// TODO Auto-generated method stub
		return queryOne("selectHslyCgsListCount", gcglhsly);
	}

	@Override
	public List<Gcglhsly> selectHslyCgsList(Gcglhsly gcglhsly) {
		// TODO Auto-generated method stub
		return queryList("selectHslyCgsList",gcglhsly);
	}

	@Override
	public Boolean updateHslyCgs(Gcglhsly gcglhsly) {
		Gcglhsly gcglwqgz1=queryOne("queryCGSByYf", gcglhsly);
		if(gcglwqgz1!=null&&!gcglwqgz1.getId().equals(gcglhsly.getId())){
			return false;
		}
		if(update("updateHslyCgs", gcglhsly)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteHslyCgs(Gcglhsly gcglhsly) {
		if(delete("deleteHslyCgs", gcglhsly)>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public boolean uploadWqgzFilesgxk(Gcglhsly gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglhsly gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglhsly gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglhsly downWqgzFile(Gcglhsly gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglhsly gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglhsly gcglwqgz) {
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglhsly gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglhsly gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglhsly> selectWqgzjhList(Gcglhsly gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglhsly selectWqgzjhFile(Gcglhsly gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}
	@Override
	public Boolean sbWqgzYb(Gcglhsly gcglabgc) {
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
}
