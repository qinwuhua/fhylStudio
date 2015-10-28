package com.hdsx.jxzhpt.gcxmybb.server.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcxmybb.server.GcybbServer;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;

@Service
public class GcybbServerImpl extends BaseOperate implements GcybbServer {

	public GcybbServerImpl() {
		super("gcybb", "jdbc");
	}

	@Override
	public List<Map<String, Object>> getWqgzybb(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getWqgzybb", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getWqgzxzqh(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getWqgzxzqh", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getWqgznf(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getWqgznf", gcglwqgz);
	}

	@Override
	public Excel_list getwqgzlist1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("getwqgzlist1", gcglwqgz);
	}

	@Override
	public Excel_list getwqgzlist2(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("getwqgzlist1", gcglwqgz);
	}

	@Override
	public Excel_list getwqgzlist3(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("getwqgzlist3", gcglwqgz);
	}

	@Override
	public List<Excel_list> getwqgzlist4(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getwqgzlist4", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getabgcybb(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getabgcybb", gcglabgc);
	}

	@Override
	public Excel_list getabgclist1(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("getabgclist1", gcglabgc);
	}

	@Override
	public List<Map<String, Object>> getAbgcxzqh(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getAbgcxzqh", gcglabgc);
	}

	@Override
	public Excel_list getabgclist3(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("getabgclist1", gcglabgc);
	}

	@Override
	public List<Map<String, Object>> getAbgcnf(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getAbgcnf", gcglabgc);
	}

	@Override
	public Excel_list getabgclist2(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryOne("getabgclist1", gcglabgc);
	}

	@Override
	public List<Excel_list> getabgclist4(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getabgclist4", gcglabgc);
	}

	@Override
	public List<Map<String, Object>> getzhfzybb(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getzhfzybb", gcglzhfz);
	}

	@Override
	public Excel_list getzhfzlist1(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryOne("getzhfzlist1", gcglzhfz);
	}

	@Override
	public List<Map<String, Object>> getZhfzxzqh(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getZhfzxzqh", gcglzhfz);
	}

	@Override
	public List<Map<String, Object>> getZhfznf(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getZhfznf", gcglzhfz);
	}

	@Override
	public List<Excel_list> getzhfzlist2(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getzhfzlist2", gcglzhfz);
	}

	@Override
	public List<Map<String, Object>> getShybb(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryList("getShybb", gcglsh);
	}

	@Override
	public List<Map<String, Object>> getwqgzbblist1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getwqgzbblist1", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getwqgzbblist2(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getwqgzbblist2", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getwqgzbblist3(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getwqgzbblist3", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getwqgzbblist4(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getwqgzbblist4", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getabgcbblist1(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getabgcbblist1", gcglabgc);
	}

	@Override
	public List<Map<String, Object>> getabgcbblist2(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getabgcbblist2", gcglabgc);
	}

	@Override
	public List<Map<String, Object>> getabgcbblist3(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getabgcbblist3", gcglabgc);
	}

	@Override
	public List<Map<String, Object>> getabgcbblist4(Gcglabgc gcglabgc) {
		// TODO Auto-generated method stub
		return queryList("getabgcbblist4", gcglabgc);
	}

	@Override
	public List<Map<String, Object>> getzhfzbblist1(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getzhfzbblist1",gcglzhfz);
	}

	@Override
	public List<Map<String, Object>> getzhfzbblist2(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getzhfzbblist2",gcglzhfz);
	}

	@Override
	public List<Map<String, Object>> getzhfzbblist3(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getzhfzbblist3",gcglzhfz);
	}

	@Override
	public List<Map<String, Object>> getzhfzbblist4(Gcglzhfz gcglzhfz) {
		// TODO Auto-generated method stub
		return queryList("getzhfzbblist4",gcglzhfz);
	}

	@Override
	public List<Map<String, Object>> getGjxjmxbsj(String sql) {
		// TODO Auto-generated method stub
		return queryList("getGjxjmxbsj", sql);
	}

	@Override
	public List<Map<String, Object>> getWqgzJsb(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getWqgzJsb", gcglwqgz);
	}

	@Override
	public List<Map<String, Object>> getAbgcJsb(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getAbgcJsb", gcglwqgz);
	}

	@Override
	public List<Excel_list> getWqgzJsb1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getWqgzJsb1", gcglwqgz);
	}

	@Override
	public List<Excel_list> getAbgcJsb1(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("getAbgcJsb1", gcglwqgz);
	}

	@Override
	public List<Excel_list> getWqgzjh(Gcglwqgz gcglwqgz) {
		List<Excel_list> l1=queryList("getWqgzjh1",gcglwqgz);
		List<Excel_list> l2=queryList("getWqgzjh2",gcglwqgz);
		List<Excel_list> l3=queryList("getWqgzjh3",gcglwqgz);
		int k=0;
		for (int i = 0; i < l2.size(); i++) {
			if(i==0){l2.get(i).setV_0("一");}if(i==1){l2.get(i).setV_0("二");}if(i==2){l2.get(i).setV_0("三");}if(i==3){l2.get(i).setV_0("四");}if(i==4){l2.get(i).setV_0("五");}if(i==5){l2.get(i).setV_0("六");}if(i==6){l2.get(i).setV_0("七");}if(i==7){l2.get(i).setV_0("八");}if(i==8){l2.get(i).setV_0("九");}if(i==9){l2.get(i).setV_0("十");}if(i==10){l2.get(i).setV_0("十一");}if(i==11){l2.get(i).setV_0("十二");}if(i==12){l2.get(i).setV_0("十三");}
			if(i==13){l2.get(i).setV_0("十四");}if(i==14){l2.get(i).setV_0("十五");}if(i==15){l2.get(i).setV_0("十六");}if(i==16){l2.get(i).setV_0("十七");}if(i==17){l2.get(i).setV_0("十八");}if(i==18){l2.get(i).setV_0("十九");}if(i==19){l2.get(i).setV_0("二十");}
			l1.add(l2.get(i));
			k=0;
			for (int j = 0; j < l3.size(); j++) {
				if(l2.get(i).getV_20().equals(l3.get(j).getV_20())){
					l3.get(j).setV_0(k+1+""); 
					k++;
					l1.add(l3.get(j));
				}
			}
		}
		if(l2.size()==0)return null;
		return l1;
	}

	@Override
	public List<Excel_list> getAbgcjh(Gcglwqgz gcglwqgz) {
		List<Excel_list> l1=queryList("getAbgcjh1",gcglwqgz);
		List<Excel_list> l2=queryList("getAbgcjh2",gcglwqgz);
		List<Excel_list> l3=queryList("getAbgcjh3",gcglwqgz);
		int k=0;
		for (int i = 0; i < l2.size(); i++) {
			l1.add(l2.get(i));
			k=0;
			for (int j = 0; j < l3.size(); j++) {
				if(l2.get(i).getV_20().equals(l3.get(j).getV_20())){
					l3.get(j).setV_0(k+1+""); 
					k++;
					l1.add(l3.get(j));
				}
			}
		}
		if(l2.size()==0)return null;
		return l1;
	}

	@Override
	public List<Excel_list> getWqgzjy(Gcglwqgz gcglwqgz) {
		List<Excel_list> l1=queryList("getWqgzjy1",gcglwqgz);
		List<Excel_list> l2=queryList("getWqgzjy2",gcglwqgz);
		List<Excel_list> l3=queryList("getWqgzjy3",gcglwqgz);
		int k=0;
		for (int i = 0; i < l2.size(); i++) {
			if(i==0){l2.get(i).setV_0("一");}if(i==1){l2.get(i).setV_0("二");}if(i==2){l2.get(i).setV_0("三");}if(i==3){l2.get(i).setV_0("四");}if(i==4){l2.get(i).setV_0("五");}if(i==5){l2.get(i).setV_0("六");}if(i==6){l2.get(i).setV_0("七");}if(i==7){l2.get(i).setV_0("八");}if(i==8){l2.get(i).setV_0("九");}if(i==9){l2.get(i).setV_0("十");}if(i==10){l2.get(i).setV_0("十一");}if(i==11){l2.get(i).setV_0("十二");}if(i==12){l2.get(i).setV_0("十三");}
			if(i==13){l2.get(i).setV_0("十四");}if(i==14){l2.get(i).setV_0("十五");}if(i==15){l2.get(i).setV_0("十六");}if(i==16){l2.get(i).setV_0("十七");}if(i==17){l2.get(i).setV_0("十八");}if(i==18){l2.get(i).setV_0("十九");}if(i==19){l2.get(i).setV_0("二十");}
			l1.add(l2.get(i));
			k=0;
			for (int j = 0; j < l3.size(); j++) {
				if(l2.get(i).getV_29().equals(l3.get(j).getV_29())){
					l3.get(j).setV_0(k+1+""); 
					k++;
					l1.add(l3.get(j));
				}
			}
		}
		if(l2.size()==0)return null;
		return l1;
	}

	@Override
	public List<Excel_list> getGlgzxj(Gcglabgc gcglabgc) {
		List<Excel_list> l1=queryList("getGlgzxj",gcglabgc);
		List<Excel_list> l2=queryList("getGlgzxj1",gcglabgc);
		List<Excel_list> l3=queryList("getGlgzxj2",gcglabgc);
		List<Excel_list> l4=queryList("getGlgzxj3",gcglabgc);
		List<Excel_list> l5=queryList("getGlgzxj4",gcglabgc);
		l4.addAll(l5);
		for (int i = 0; i < l2.size(); i++) {
			l4.add(l2.get(i));
			for (int j = 0; j < l3.size(); j++) {
				if(l2.get(i).getV_62().equals(l3.get(j).getV_62())){
					l4.add(l3.get(j));
				}
			}
			int t=1;
			for (int j = 0; j < l1.size(); j++) {
				if(l2.get(i).getV_62().equals(l1.get(j).getV_62())&&l2.get(i).getV_63().equals(l1.get(j).getV_63())){
					l1.get(j).setV_0(t+"");
					l4.add(l1.get(j));
					t++;
				}
			}
		}
		
		return l4;
	}

	

}
