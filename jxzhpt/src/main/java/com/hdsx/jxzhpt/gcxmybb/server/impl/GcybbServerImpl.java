package com.hdsx.jxzhpt.gcxmybb.server.impl;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcxmybb.server.GcybbServer;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

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
				if(l2.get(i).getV_30().equals(l3.get(j).getV_30())){
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
		String sql="create or replace view glgzxjmxb as"
		+" select jh.xmbm v_1,(select name from xtgl_xzqh where id=substr(cb.xzqhdm,0,4)||'00') v_2,"
		+" cb.xzqh v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,sc.xdnf v_7,lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,lx.xmlc v_15,lx.qdzh v_16,lx.zdzh v_17,"
		+" (nvl(jh.bbzzj, 0) + nvl(jh.gz, 0) + nvl(jh.sz, 0) + nvl(jh.zq, 0) +nvl(jh.dk, 0) + nvl(jh.jl, 0) + nvl(jh.qt, 0) + nvl(jh.dfzc, 0) + nvl(jh.yhdk, 0)) v_18,"
		+" jh.bbzzj v_19,jh.gz v_20,jh.sz v_21,jh.zq v_22,jh.dk v_23,jh.jl v_24,jh.qt v_25,jh.dfzc v_26,jh.yhdk v_27,xd.bnjh v_28,xd.qzbtz v_29,"
		+" jz.bndsslc v_30,(case when jh.kgzt = '1'and jh.jgzt = '0' then  '1' else '0' end) v_31,(case when jh.kgzt = '1'and jh.jgzt = '1' then '1' else '0' end) v_32,(case when jh.kgzt = '0'and jh.jgzt = '0' then '1' else '0' end) v_33,"
		+" substr(cb.kgsj,0,4) v_34,substr(cb.wgsj,0,4) v_35,(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) + nvl(cgs.zq, 0) +nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) +nvl(cgs.yhdk, 0)) v_36,"
		+" cgs.cgs v_37,cgs.gz v_38,cgs.sz v_39,cgs.zq v_40,cgs.dk v_41,cgs.jl v_42,cgs.qt v_43,cgs.dfzc v_44,cgs.yhdk v_45,jz1.ztz v_46,"
		+" decode((nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0)),'0','0',null,'0',round((jz1.ztz /(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) +nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0))) * 100), 2) v_47,"
		+" jz1.wclc v_48,jz1.yiji v_49,jz1.erji v_50,jz1.sanji v_51,jz1.siji v_52,jz1.lq v_53,jz1.sn v_54,jz.ssdctc v_55,byxz.xzzj v_56,byxz1.wclc v_57,byxz1.wczj v_58,"
		+" (nvl(cgs1.cgs, 0) + nvl(cgs1.gz, 0) + nvl(cgs1.sz, 0) + nvl(cgs1.zq, 0) +nvl(cgs1.dk, 0) + nvl(cgs1.jl, 0) + nvl(cgs1.qt, 0) + nvl(cgs1.dfzc, 0) +nvl(cgs1.yhdk, 0)) v_59,"
		+" cgs1.cgs v_60,cgs1.gz v_61,cgs1.sz v_62,cgs1.zq v_63,cgs1.dk v_64,cgs1.jl v_65,cgs1.qt v_66,cgs1.dfzc v_67,cgs1.yhdk v_68,"
		+" jz2.ztz v_69,jz2.wclc v_70,jz2.yiji v_71,jz2.erji v_72,jz2.sanji v_73,jz2.siji v_74,jz2.lq v_75,jz2.sn v_76,jz3.ssdctc v_77,jz3.wwcgcl v_78,"
		+" round(jz2.wclc / lx.xmlc * 100, 2) v_79,"
		+" decode(xd1.qzbtz,'0','0',null,'0',round(cgs1.cgs / xd1.qzbtz * 100, 0)) v_80,"
		+" decode(xd1.bnjh,'0','0',null,'0',round(round((nvl(cgs1.cgs, 0) + nvl(cgs1.gz, 0) + nvl(cgs1.sz, 0) + nvl(cgs1.zq, 0) +nvl(cgs1.dk, 0) + nvl(cgs1.jl, 0) + nvl(cgs1.qt, 0) + nvl(cgs1.dfzc, 0) +nvl(cgs1.yhdk, 0)) / xd1.bnjh * 100, 0) / xd1.bnjh * 100, 0)) v_81,"
		+" cb.bz v_82, lx.xzqhdm v_83,'新建' v_84,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm, 0, 4) xmnf,lx.lxbm lxbm,"
		+" (case when kgzt = '0' then '未开工' when jgzt = '1' then '完工' else '已开工'end) jzzt,substr(cb.xzqhdm, 0, 4) || '00' xzqhdm,"
		+" (select name from xtgl_xzqh where id = substr(cb.xzqhdm, 0, 4) || '00') xzqhmc"
		+" from jhsh_xj jh,cbsj_xj cb,kxxyj_xj kx,lxsh_xj l,"
		     +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(GHQDZH)), ',', '、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxbm)), ',', '、') lxbm,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxmc)), ',', '、') lxmc,replace(WMSYS.WM_CONCAT(to_char(ghZDZH)), ',', '、') ZDZH,sum(decode(substr(xmid, 11, 1),'1',(nvl(jhyilc, 0) + nvl(jherlc, 0) + nvl(jhsanlc, 0) +nvl(jhsilc, 0) + nvl(jhdwlc, 0) + nvl(jhwllc, 0)),(nvl(yilc, 0) + nvl(erlc, 0) + nvl(sanlc, 0) +nvl(silc, 0) + nvl(dwlc, 0) + nvl(wllc, 0)))) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)), ',', ',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)), ',', ',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(ghlxbm, 0, 1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh, '市') + 1,length(xzqh)))),',','、') szxs from lxsh_lx where jdbs = '2' group by xmid) lx,"
		     +" (select min(xdnf) xdnf,xmid from plan_zjxd where jhxdwh is not null group by xmid) sc,"
		     +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf = substr('"+gcglabgc.getSbyf()+"', 0, 4)  and jhxdwh is not null group by zj.xmid) xd,"
		     +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where substr(g.ybyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and ybyf = fun_zdjdyf(xmbm,'"+gcglabgc.getSbyf()+"') and zgshzt='1' group by g.xmbm) jz,"
		     +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs,"
		     +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
		     +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,sum(lq) lq,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0) - nvl(sum(lq), 0)) sn,"
		     +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g where substr(g.ybyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and g.ybyf<='"+gcglabgc.getSbyf()+"'  and zgshzt='1' group by g.xmbm) jz1,"
		     +" (select jhid,nvl(sum(c.cgsdwzj), 0) + nvl(sum(c.gz), 0) + nvl(sum(c.sz), 0) + nvl(sum(c.zq), 0) +nvl(sum(c.dk), 0) + nvl(sum(c.jl), 0) + nvl(sum(c.qt), 0) + nvl(sum(c.dfzc), 0) +nvl(sum(c.yhdk), 0) xzzj from gcgl_cgs c where c.tbyf='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) byxz,"
		     +" (select  xmbm,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,"
		     +" (nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) wczj from gcgl_xmjd g where g.ybyf='"+gcglabgc.getSbyf()+"'  and zgshzt='1' group by g.xmbm) byxz1,"
		     +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs1,"
		     +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
		     +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,sum(lq) lq,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0) - nvl(sum(lq), 0)) sn,"
		     +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g where g.ybyf<='"+gcglabgc.getSbyf()+"' and zgshzt='1' group by g.xmbm) jz2,"
		     +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where ybyf = fun_zdjdyf(xmbm,'"+gcglabgc.getSbyf()+"') and zgshzt='1' group by g.xmbm) jz3,"
		     +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf <= substr('"+gcglabgc.getSbyf()+"', 0, 4) and jhxdwh is not null group by zj.xmid) xd1"
		     +" where jh.xmbm=cb.xmbm(+) and jh.xmbm=kx.xmbm(+) and jh.xmbm=l.xmbm(+) and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=xd1.xmid(+)"
		     +" and jh.xmbm=sc.xmid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=cgs.jhid(+) and jh.xmbm=cgs1.jhid(+) and jh.xmbm=jz1.xmbm(+)"
		     +" and jh.xmbm=jz.xmbm(+) and jh.xmbm=jz1.xmbm(+) and jh.xmbm=jz2.xmbm(+) and jh.xmbm=jz3.xmbm(+) and jh.xmbm=byxz.jhid(+) and jh.xmbm=byxz1.xmbm(+)"
		     +" and jh.xmbm in(select xmid from plan_zjxd where jhxdwh is not null)"
		     +" union all "
		+" select jh.xmbm v_1,(select name from xtgl_xzqh where id=substr(cb.xzqhdm,0,4)||'00') v_2,"
		+" cb.xzqh v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,sc.xdnf v_7,lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,lx.xmlc v_15,lx.qdzh v_16,lx.zdzh v_17,"
		+" (nvl(jh.bbzzj, 0) + nvl(jh.gz, 0) + nvl(jh.sz, 0) + nvl(jh.zq, 0) +nvl(jh.dk, 0) + nvl(jh.jl, 0) + nvl(jh.qt, 0) + nvl(jh.dfzc, 0) + nvl(jh.yhdk, 0)) v_18,"
		+" jh.bbzzj v_19,jh.gz v_20,jh.sz v_21,jh.zq v_22,jh.dk v_23,jh.jl v_24,jh.qt v_25,jh.dfzc v_26,jh.yhdk v_27,xd.bnjh v_28,xd.qzbtz v_29,"
		+" jz.bndsslc v_30,(case when jh.kgzt = '1'and jh.jgzt = '0' then  '1' else '0' end) v_31,(case when jh.kgzt = '1'and jh.jgzt = '1' then '1' else '0' end) v_32,(case when jh.kgzt = '0'and jh.jgzt = '0' then '1' else '0' end) v_33,"
		+" substr(cb.kgsj,0,4) v_34,substr(cb.wgsj,0,4) v_35,(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) + nvl(cgs.zq, 0) +nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) +nvl(cgs.yhdk, 0)) v_36,"
		+" cgs.cgs v_37,cgs.gz v_38,cgs.sz v_39,cgs.zq v_40,cgs.dk v_41,cgs.jl v_42,cgs.qt v_43,cgs.dfzc v_44,cgs.yhdk v_45,jz1.ztz v_46,"
		+" decode((nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0)),'0','0',null,'0',round((jz1.ztz /(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) +nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0))) * 100), 2) v_47,"
		+" jz1.wclc v_48,jz1.yiji v_49,jz1.erji v_50,jz1.sanji v_51,jz1.siji v_52,jz1.lq v_53,jz1.sn v_54,jz.ssdctc v_55,byxz.xzzj v_56,byxz1.wclc v_57,byxz1.wczj v_58,"
		+" (nvl(cgs1.cgs, 0) + nvl(cgs1.gz, 0) + nvl(cgs1.sz, 0) + nvl(cgs1.zq, 0) +nvl(cgs1.dk, 0) + nvl(cgs1.jl, 0) + nvl(cgs1.qt, 0) + nvl(cgs1.dfzc, 0) +nvl(cgs1.yhdk, 0)) v_59,"
		+" cgs1.cgs v_60,cgs1.gz v_61,cgs1.sz v_62,cgs1.zq v_63,cgs1.dk v_64,cgs1.jl v_65,cgs1.qt v_66,cgs1.dfzc v_67,cgs1.yhdk v_68,"
		+" jz2.ztz v_69,jz2.wclc v_70,jz2.yiji v_71,jz2.erji v_72,jz2.sanji v_73,jz2.siji v_74,jz2.lq v_75,jz2.sn v_76,jz3.ssdctc v_77,jz3.wwcgcl v_78,"
		+" round(jz2.wclc / lx.xmlc * 100, 2) v_79,"
		+" decode(xd1.qzbtz,'0','0',null,'0',round(cgs1.cgs / xd1.qzbtz * 100, 0)) v_80,"
		+" decode(xd1.bnjh,'0','0',null,'0',round(round((nvl(cgs1.cgs, 0) + nvl(cgs1.gz, 0) + nvl(cgs1.sz, 0) + nvl(cgs1.zq, 0) +nvl(cgs1.dk, 0) + nvl(cgs1.jl, 0) + nvl(cgs1.qt, 0) + nvl(cgs1.dfzc, 0) +nvl(cgs1.yhdk, 0)) / xd1.bnjh * 100, 0) / xd1.bnjh * 100, 0)) v_81,"
		+" cb.bz v_82, lx.xzqhdm v_83,'改建' v_84,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm, 0, 4) xmnf,lx.lxbm lxbm,"
		+" (case when kgzt = '0' then '未开工' when jgzt = '1' then '完工' else '已开工'end) jzzt,substr(cb.xzqhdm, 0, 4) || '00' xzqhdm,"
		+" (select name from xtgl_xzqh where id = substr(cb.xzqhdm, 0, 4) || '00') xzqhmc"
		+" from jhsh_sjgz jh,cbsj_sjgz cb,kxxyj_sjgz kx,lxsh_sjgz l,"
		     +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(GHQDZH)), ',', '、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxbm)), ',', '、') lxbm,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxmc)), ',', '、') lxmc,replace(WMSYS.WM_CONCAT(to_char(ghZDZH)), ',', '、') ZDZH,sum(decode(substr(xmid, 11, 1),'1',(nvl(jhyilc, 0) + nvl(jherlc, 0) + nvl(jhsanlc, 0) +nvl(jhsilc, 0) + nvl(jhdwlc, 0) + nvl(jhwllc, 0)),(nvl(yilc, 0) + nvl(erlc, 0) + nvl(sanlc, 0) +nvl(silc, 0) + nvl(dwlc, 0) + nvl(wllc, 0)))) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)), ',', ',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)), ',', ',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(ghlxbm, 0, 1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh, '市') + 1,length(xzqh)))),',','、') szxs from lxsh_lx where jdbs = '2' group by xmid) lx,"
		     +" (select min(xdnf) xdnf,xmid from plan_zjxd where jhxdwh is not null group by xmid) sc,"
		     +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf = substr('"+gcglabgc.getSbyf()+"', 0, 4)  and jhxdwh is not null group by zj.xmid) xd,"
		     +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where substr(g.ybyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and ybyf = fun_zdjdyf(xmbm,'"+gcglabgc.getSbyf()+"') and zgshzt='1' group by g.xmbm) jz,"
		     +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs,"
		     +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
		     +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,sum(lq) lq,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0) - nvl(sum(lq), 0)) sn,"
		     +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g where substr(g.ybyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and g.ybyf<='"+gcglabgc.getSbyf()+"'  and zgshzt='1' group by g.xmbm) jz1,"
		     +" (select jhid,nvl(sum(c.cgsdwzj), 0) + nvl(sum(c.gz), 0) + nvl(sum(c.sz), 0) + nvl(sum(c.zq), 0) +nvl(sum(c.dk), 0) + nvl(sum(c.jl), 0) + nvl(sum(c.qt), 0) + nvl(sum(c.dfzc), 0) +nvl(sum(c.yhdk), 0) xzzj from gcgl_cgs c where c.tbyf='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) byxz,"
		     +" (select  xmbm,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,"
		     +" (nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) wczj from gcgl_xmjd g where g.ybyf='"+gcglabgc.getSbyf()+"'  and zgshzt='1' group by g.xmbm) byxz1,"
		     +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs1,"
		     +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
		     +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,sum(lq) lq,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0) - nvl(sum(lq), 0)) sn,"
		     +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g where g.ybyf<='"+gcglabgc.getSbyf()+"' and zgshzt='1' group by g.xmbm) jz2,"
		     +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where ybyf = fun_zdjdyf(xmbm,'"+gcglabgc.getSbyf()+"') and zgshzt='1' group by g.xmbm) jz3,"
		     +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf <= substr('"+gcglabgc.getSbyf()+"', 0, 4) and jhxdwh is not null group by zj.xmid) xd1"
		     +" where jh.xmbm=cb.xmbm(+) and jh.xmbm=kx.xmbm(+) and jh.xmbm=l.xmbm(+) and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=xd1.xmid(+)"
		     +" and jh.xmbm=sc.xmid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=cgs.jhid(+) and jh.xmbm=cgs1.jhid(+) and jh.xmbm=jz1.xmbm(+)"
		     +" and jh.xmbm=jz.xmbm(+) and jh.xmbm=jz1.xmbm(+) and jh.xmbm=jz2.xmbm(+) and jh.xmbm=jz3.xmbm(+) and jh.xmbm=byxz.jhid(+) and jh.xmbm=byxz1.xmbm(+)"
		     +" and jh.xmbm in(select xmid from plan_zjxd where jhxdwh is not null)"
		     +" union all"
		+" select jh.xmbm v_1,(select name from xtgl_xzqh where id=substr(cb.xzqhdm,0,4)||'00') v_2,"
		+" cb.xzqh v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,sc.xdnf v_7,lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,lx.xmlc v_15,lx.qdzh v_16,lx.zdzh v_17,"
		+" (nvl(jh.bbzzj, 0) + nvl(jh.gz, 0) + nvl(jh.sz, 0) + nvl(jh.zq, 0) +nvl(jh.dk, 0) + nvl(jh.jl, 0) + nvl(jh.qt, 0) + nvl(jh.dfzc, 0) + nvl(jh.yhdk, 0)) v_18,"
		+" jh.bbzzj v_19,jh.gz v_20,jh.sz v_21,jh.zq v_22,jh.dk v_23,jh.jl v_24,jh.qt v_25,jh.dfzc v_26,jh.yhdk v_27,xd.bnjh v_28,xd.qzbtz v_29,"
		+" jz.bndsslc v_30,(case when jh.kgzt = '1'and jh.jgzt = '0' then  '1' else '0' end) v_31,(case when jh.kgzt = '1'and jh.jgzt = '1' then '1' else '0' end) v_32,(case when jh.kgzt = '0'and jh.jgzt = '0' then '1' else '0' end) v_33,"
		+" substr(cb.kgsj,0,4) v_34,substr(cb.wgsj,0,4) v_35,(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) + nvl(cgs.zq, 0) +nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) +nvl(cgs.yhdk, 0)) v_36,"
		+" cgs.cgs v_37,cgs.gz v_38,cgs.sz v_39,cgs.zq v_40,cgs.dk v_41,cgs.jl v_42,cgs.qt v_43,cgs.dfzc v_44,cgs.yhdk v_45,jz1.ztz v_46,"
		+" decode((nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0)),'0','0',null,'0',round((jz1.ztz /(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) +nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0))) * 100), 2) v_47,"
		+" jz1.wclc v_48,jz1.yiji v_49,jz1.erji v_50,jz1.sanji v_51,jz1.siji v_52,jz1.lq v_53,jz1.sn v_54,jz.ssdctc v_55,byxz.xzzj v_56,byxz1.wclc v_57,byxz1.wczj v_58,"
		+" (nvl(cgs1.cgs, 0) + nvl(cgs1.gz, 0) + nvl(cgs1.sz, 0) + nvl(cgs1.zq, 0) +nvl(cgs1.dk, 0) + nvl(cgs1.jl, 0) + nvl(cgs1.qt, 0) + nvl(cgs1.dfzc, 0) +nvl(cgs1.yhdk, 0)) v_59,"
		+" cgs1.cgs v_60,cgs1.gz v_61,cgs1.sz v_62,cgs1.zq v_63,cgs1.dk v_64,cgs1.jl v_65,cgs1.qt v_66,cgs1.dfzc v_67,cgs1.yhdk v_68,"
		+" jz2.ztz v_69,jz2.wclc v_70,jz2.yiji v_71,jz2.erji v_72,jz2.sanji v_73,jz2.siji v_74,jz2.lq v_75,jz2.sn v_76,jz3.ssdctc v_77,jz3.wwcgcl v_78,"
		+" round(jz2.wclc / lx.xmlc * 100, 2) v_79,"
		+" decode(xd1.qzbtz,'0','0',null,'0',round(cgs1.cgs / xd1.qzbtz * 100, 0)) v_80,"
		+" decode(xd1.bnjh,'0','0',null,'0',round(round((nvl(cgs1.cgs, 0) + nvl(cgs1.gz, 0) + nvl(cgs1.sz, 0) + nvl(cgs1.zq, 0) +nvl(cgs1.dk, 0) + nvl(cgs1.jl, 0) + nvl(cgs1.qt, 0) + nvl(cgs1.dfzc, 0) +nvl(cgs1.yhdk, 0)) / xd1.bnjh * 100, 0) / xd1.bnjh * 100, 0)) v_81,"
		+" cb.bz v_82, lx.xzqhdm v_83,'路面改造' v_84,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm, 0, 4) xmnf,lx.lxbm lxbm,"
		+" (case when kgzt = '0' then '未开工' when jgzt = '1' then '完工' else '已开工'end) jzzt,substr(cb.xzqhdm, 0, 4) || '00' xzqhdm,"
		+" (select name from xtgl_xzqh where id = substr(cb.xzqhdm, 0, 4) || '00') xzqhmc"
		+" from jhsh_lmgz jh,cbsj_lmgz cb,kxxyj_lmgz kx,lxsh_lmgz l,"
		     +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(GHQDZH)), ',', '、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxbm)), ',', '、') lxbm,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxmc)), ',', '、') lxmc,replace(WMSYS.WM_CONCAT(to_char(ghZDZH)), ',', '、') ZDZH,sum(decode(substr(xmid, 11, 1),'1',(nvl(jhyilc, 0) + nvl(jherlc, 0) + nvl(jhsanlc, 0) +nvl(jhsilc, 0) + nvl(jhdwlc, 0) + nvl(jhwllc, 0)),(nvl(yilc, 0) + nvl(erlc, 0) + nvl(sanlc, 0) +nvl(silc, 0) + nvl(dwlc, 0) + nvl(wllc, 0)))) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)), ',', ',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)), ',', ',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(ghlxbm, 0, 1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh, '市') + 1,length(xzqh)))),',','、') szxs from lxsh_lx where jdbs = '2' group by xmid) lx,"
		     +" (select min(xdnf) xdnf,xmid from plan_zjxd where jhxdwh is not null group by xmid) sc,"
		     +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf = substr('"+gcglabgc.getSbyf()+"', 0, 4)  and jhxdwh is not null group by zj.xmid) xd,"
		     +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where substr(g.ybyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and ybyf = fun_zdjdyf(xmbm,'"+gcglabgc.getSbyf()+"') and zgshzt='1' group by g.xmbm) jz,"
		     +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs,"
		     +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
		     +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,sum(lq) lq,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0) - nvl(sum(lq), 0)) sn,"
		     +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g where substr(g.ybyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and g.ybyf<='"+gcglabgc.getSbyf()+"'  and zgshzt='1' group by g.xmbm) jz1,"
		     +" (select jhid,nvl(sum(c.cgsdwzj), 0) + nvl(sum(c.gz), 0) + nvl(sum(c.sz), 0) + nvl(sum(c.zq), 0) +nvl(sum(c.dk), 0) + nvl(sum(c.jl), 0) + nvl(sum(c.qt), 0) + nvl(sum(c.dfzc), 0) +nvl(sum(c.yhdk), 0) xzzj from gcgl_cgs c where c.tbyf='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) byxz,"
		     +" (select  xmbm,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,"
		     +" (nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) wczj from gcgl_xmjd g where g.ybyf='"+gcglabgc.getSbyf()+"'  and zgshzt='1' group by g.xmbm) byxz1,"
		     +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs1,"
		     +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
		     +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,sum(lq) lq,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0) - nvl(sum(lq), 0)) sn,"
		     +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g where g.ybyf<='"+gcglabgc.getSbyf()+"' and zgshzt='1' group by g.xmbm) jz2,"
		     +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where ybyf = fun_zdjdyf(xmbm,'"+gcglabgc.getSbyf()+"') and zgshzt='1' group by g.xmbm) jz3,"
		     +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf <= substr('"+gcglabgc.getSbyf()+"', 0, 4) and jhxdwh is not null group by zj.xmid) xd1"
		     +" where jh.xmbm=cb.xmbm(+) and jh.xmbm=kx.xmbm(+) and jh.xmbm=l.xmbm(+) and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=xd1.xmid(+)"
		     +" and jh.xmbm=sc.xmid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=cgs.jhid(+) and jh.xmbm=cgs1.jhid(+) and jh.xmbm=jz1.xmbm(+)"
		     +" and jh.xmbm=jz.xmbm(+) and jh.xmbm=jz1.xmbm(+) and jh.xmbm=jz2.xmbm(+) and jh.xmbm=jz3.xmbm(+) and jh.xmbm=byxz.jhid(+) and jh.xmbm=byxz1.xmbm(+)"
		     +" and jh.xmbm in(select xmid from plan_zjxd where jhxdwh is not null)"
		     +" union all"
		+" select jh.xmbm v_1,(select name from xtgl_xzqh where id=substr(cb.xzqhdm,0,4)||'00') v_2,"
		+" cb.xzqh v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,sc.xdnf v_7,lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,lx.xmlc v_15,lx.qdzh v_16,lx.zdzh v_17,"
		+" (nvl(jh.bbzzj, 0) + nvl(jh.gz, 0) + nvl(jh.sz, 0) + nvl(jh.zq, 0) +nvl(jh.dk, 0) + nvl(jh.jl, 0) + nvl(jh.qt, 0)) v_18,"
		+" jh.bbzzj v_19,jh.gz v_20,jh.sz v_21,jh.zq v_22,jh.dk v_23,jh.jl v_24,jh.qt v_25,0 v_26,0 v_27,xd.bnjh v_28,xd.qzbtz v_29,"
		+" jz.bndsslc v_30,(case when jh.kgzt = '1'and jh.jgzt = '0' then  '1' else '0' end) v_31,(case when jh.kgzt = '1'and jh.jgzt = '1' then '1' else '0' end) v_32,(case when jh.kgzt = '0'and jh.jgzt = '0' then '1' else '0' end) v_33,"
		+" substr(cb.kgsj,0,4) v_34,substr(cb.wgsj,0,4) v_35,(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) + nvl(cgs.zq, 0) +nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) +nvl(cgs.yhdk, 0)) v_36,"
		+" cgs.cgs v_37,cgs.gz v_38,cgs.sz v_39,cgs.zq v_40,cgs.dk v_41,cgs.jl v_42,cgs.qt v_43,cgs.dfzc v_44,cgs.yhdk v_45,jz1.ztz v_46,"
		+" decode((nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0)),'0','0',null,'0',round((jz1.ztz /(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) +nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0))) * 100), 2) v_47,"
		+" jz1.wclc v_48,jz1.yiji v_49,jz1.erji v_50,jz1.sanji v_51,jz1.siji v_52,jz1.lq v_53,jz1.sn v_54,jz.ssdctc v_55,byxz.xzzj v_56,byxz1.wclc v_57,byxz1.wczj v_58,"
		+" (nvl(cgs1.cgs, 0) + nvl(cgs1.gz, 0) + nvl(cgs1.sz, 0) + nvl(cgs1.zq, 0) +nvl(cgs1.dk, 0) + nvl(cgs1.jl, 0) + nvl(cgs1.qt, 0) + nvl(cgs1.dfzc, 0) +nvl(cgs1.yhdk, 0)) v_59,"
		+" cgs1.cgs v_60,cgs1.gz v_61,cgs1.sz v_62,cgs1.zq v_63,cgs1.dk v_64,cgs1.jl v_65,cgs1.qt v_66,cgs1.dfzc v_67,cgs1.yhdk v_68,"
		+" jz2.ztz v_69,jz2.wclc v_70,jz2.yiji v_71,jz2.erji v_72,jz2.sanji v_73,jz2.siji v_74,jz2.lq v_75,jz2.sn v_76,jz3.ssdctc v_77,jz3.wwcgcl v_78,"
		+" round(jz2.wclc / lx.xmlc * 100, 2) v_79,"
		+" decode(xd1.qzbtz,'0','0',null,'0',round(cgs1.cgs / xd1.qzbtz * 100, 0)) v_80,"
		+" decode(xd1.bnjh,'0','0',null,'0',round(round((nvl(cgs1.cgs, 0) + nvl(cgs1.gz, 0) + nvl(cgs1.sz, 0) + nvl(cgs1.zq, 0) +nvl(cgs1.dk, 0) + nvl(cgs1.jl, 0) + nvl(cgs1.qt, 0) + nvl(cgs1.dfzc, 0) +nvl(cgs1.yhdk, 0)) / xd1.bnjh * 100, 0) / xd1.bnjh * 100, 0)) v_81,"
		+" cb.bz v_82, lx.xzqhdm v_83,'灾毁重建' v_84,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm, 0, 4) xmnf,lx.lxbm lxbm,"
		+" (case when kgzt = '0' then '未开工' when jgzt = '1' then '完工' else '已开工'end) jzzt,substr(cb.xzqhdm, 0, 4) || '00' xzqhdm,"
		+" (select name from xtgl_xzqh where id = substr(cb.xzqhdm, 0, 4) || '00') xzqhmc"
		+" from jhsh_sh jh,cbsj_sh cb,xmsq_sh l,"
		     +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(GHQDZH)), ',', '、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxbm)), ',', '、') lxbm,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxmc)), ',', '、') lxmc,replace(WMSYS.WM_CONCAT(to_char(ghZDZH)), ',', '、') ZDZH,sum(decode(substr(xmid, 11, 1),'1',(nvl(jhyilc, 0) + nvl(jherlc, 0) + nvl(jhsanlc, 0) +nvl(jhsilc, 0) + nvl(jhdwlc, 0) + nvl(jhwllc, 0)),(nvl(yilc, 0) + nvl(erlc, 0) + nvl(sanlc, 0) +nvl(silc, 0) + nvl(dwlc, 0) + nvl(wllc, 0)))) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)), ',', ',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)), ',', ',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(ghlxbm, 0, 1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh, '市') + 1,length(xzqh)))),',','、') szxs from lxsh_lx where jdbs = '2' group by xmid) lx,"
		     +" (select min(xdnf) xdnf,xmid from plan_zjxd where jhxdwh is not null group by xmid) sc,"
		     +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf = substr('"+gcglabgc.getSbyf()+"', 0, 4)  and jhxdwh is not null group by zj.xmid) xd,"
		     +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where substr(g.ybyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and ybyf = fun_zdjdyf(xmbm,'"+gcglabgc.getSbyf()+"') and zgshzt='1' group by g.xmbm) jz,"
		     +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs,"
		     +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
		     +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,sum(lq) lq,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0) - nvl(sum(lq), 0)) sn,"
		     +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g where substr(g.ybyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and g.ybyf<='"+gcglabgc.getSbyf()+"'  and zgshzt='1' group by g.xmbm) jz1,"
		     +" (select jhid,nvl(sum(c.cgsdwzj), 0) + nvl(sum(c.gz), 0) + nvl(sum(c.sz), 0) + nvl(sum(c.zq), 0) +nvl(sum(c.dk), 0) + nvl(sum(c.jl), 0) + nvl(sum(c.qt), 0) + nvl(sum(c.dfzc), 0) +nvl(sum(c.yhdk), 0) xzzj from gcgl_cgs c where c.tbyf='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) byxz,"
		     +" (select  xmbm,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,"
		     +" (nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) wczj from gcgl_xmjd g where g.ybyf='"+gcglabgc.getSbyf()+"'  and zgshzt='1' group by g.xmbm) byxz1,"
		     +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs1,"
		     +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
		     +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,sum(lq) lq,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0) - nvl(sum(lq), 0)) sn,"
		     +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g where g.ybyf<='"+gcglabgc.getSbyf()+"' and zgshzt='1' group by g.xmbm) jz2,"
		     +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where ybyf = fun_zdjdyf(xmbm,'"+gcglabgc.getSbyf()+"') and zgshzt='1' group by g.xmbm) jz3,"
		     +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf <= substr('"+gcglabgc.getSbyf()+"', 0, 4) and jhxdwh is not null group by zj.xmid) xd1"
		     +" where jh.xmbm=cb.xmbm(+) and jh.xmbm=l.xmbm(+) and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=xd1.xmid(+)"
		     +" and jh.xmbm=sc.xmid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=cgs.jhid(+) and jh.xmbm=cgs1.jhid(+) and jh.xmbm=jz1.xmbm(+)"
		     +" and jh.xmbm=jz.xmbm(+) and jh.xmbm=jz1.xmbm(+) and jh.xmbm=jz2.xmbm(+) and jh.xmbm=jz3.xmbm(+) and jh.xmbm=byxz.jhid(+) and jh.xmbm=byxz1.xmbm(+)"
		     +" and jh.xmbm in(select xmid from plan_zjxd where jhxdwh is not null)";
		insert("glgzxjmxb", sql);
		List<Excel_list> l1=queryList("getGlgzxj",gcglabgc);
		List<Excel_list> l2=queryList("getGlgzxj1",gcglabgc);
		List<Excel_list> l3=queryList("getGlgzxj2",gcglabgc);
		List<Excel_list> l4=queryList("getGlgzxj3",gcglabgc);
		List<Excel_list> l5=queryList("getGlgzxj4",gcglabgc);
		l4.addAll(l5);
		for (int i = 0; i < l2.size(); i++) {
			l4.add(l2.get(i));
			for (int j = 0; j < l3.size(); j++) {
				if(l2.get(i).getV_83().equals(l3.get(j).getV_83())){
					l4.add(l3.get(j));
				}
			}
			int t=1;
			for (int j = 0; j < l1.size(); j++) {
				if(l2.get(i).getV_83().equals(l1.get(j).getV_83())){
					l1.get(j).setV_0(t+"");
					l4.add(l1.get(j));
					t++;
				}
			}
		}
		
		return l4;
	}

	
	
	
	
	
	@Override
	public List<Excel_list> getXgjwcmxb(Gcglabgc gcglabgc) {
		String sql="create or replace view xgjwcmxb as"
			    +" select distinct jh.xmbm v_1,(select name from xtgl_xzqh where id=substr(cb.xzqhdm,0,4)||'00') v_2,"
			    +" decode(substr(cb.xzqh,3,1),'市',replace(cb.xzqh,substr(cb.xzqh,1,3),''),replace(cb.xzqh,substr(cb.xzqh,1,4),'')) v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,sc.xdnf v_7,lx.xzdj v_8,lzh.qdzh v_9,lzh.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,lx.xmlc v_15,lzh.qdzh v_16,lzh.zdzh v_17,"
			    +" (nvl(jh.bbzzj, 0) + nvl(jh.gz, 0) + nvl(jh.sz, 0) + nvl(jh.zq, 0) +nvl(jh.dk, 0) + nvl(jh.jl, 0) + nvl(jh.qt, 0) + nvl(jh.dfzc, 0) + nvl(jh.yhdk, 0)) v_18,"
			    +" jh.bbzzj v_19,jh.gz v_20,jh.sz v_21,jh.zq v_22,jh.dk v_23,jh.jl v_24,jh.qt v_25,jh.dfzc v_26,jh.yhdk v_27,xd.bnjh v_28,xd.qzbtz v_29,"
			    +" jzs.bndsslc v_30,(case when kgzt = '0' then '未开工' when jgzt = '1' then '完工' else '在建'end) v_31,"
			    +" substr(cb.kgsj,0,4) v_32,substr(cb.wgsj,0,4) v_33,(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) + nvl(cgs.zq, 0) +nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) +nvl(cgs.yhdk, 0)) v_34,"
			    +" cgs.cgs v_35,cgs.gz v_36,cgs.sz v_37,cgs.zq v_38,cgs.dk v_39,cgs.jl v_40,cgs.qt v_41,cgs.dfzc v_42,cgs.yhdk v_43,jz1.ztz v_44,"
			    +" decode((nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0)),'0','0',null,'0',round((jz1.ztz /(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) +nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0))) * 100), 2) v_45,"
			    +" jz1.wclc v_46,jz1.yiji v_47,jz1.erji v_48,jz1.sanji v_49,jz1.siji v_50,jz1.lq v_51,jz1.sn v_52,jz.ssdctc v_53,byxz.xzzj v_54,byxz1.wclc v_55,byxz1.wczj v_56,"
			    +" (nvl(cgs1.cgs, 0) + nvl(cgs1.gz, 0) + nvl(cgs1.sz, 0) + nvl(cgs1.zq, 0) +nvl(cgs1.dk, 0) + nvl(cgs1.jl, 0) + nvl(cgs1.qt, 0) + nvl(cgs1.dfzc, 0) +nvl(cgs1.yhdk, 0)) v_57,"
			    +" cgs1.cgs v_58,cgs1.gz v_59,cgs1.sz v_60,cgs1.zq v_61,cgs1.dk v_62,cgs1.jl v_63,cgs1.qt v_64,cgs1.dfzc v_65,cgs1.yhdk v_66,"
			    +" jz2.ztz v_67,jz2.wclc v_68,jz2.yiji v_69,jz2.erji v_70,jz2.sanji v_71,jz2.siji v_72,jz2.lq v_73,jz2.sn v_74,jz3.ssdctc v_75,lx.xmlc-jz2.wclc v_76,"
			    +" round(jz2.wclc / lx.xmlc * 100, 2) v_77,"
			    +" decode(xd1.qzbtz,'0','0',null,'0',round(cgs1.cgs / xd1.qzbtz * 100, 0)) v_78,"
			    +" decode(xd1.bnjh,'0','0',null,'0',round(jz2.ztz / xd1.bnjh * 100, 0)) v_79,"
			    +" cb.bz v_80, lx.xzqhdm v_83,'新建' v_84,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm, 0, 4) xmnf,lx.lxbm lxbm,"
			    +" (case when kgzt = '0' then '未开工' when jgzt = '1' then '完工' else '在建'end) jzzt,substr(cb.xzqhdm, 0, 4) || '00' xzqhdm,"
			    +" (select name from xtgl_xzqh where id = substr(cb.xzqhdm, 0, 4) || '00') xzqhmc"
			    +" from jhsh_xj jh,cbsj_xj cb,kxxyj_xj kx,lxsh_xj l,"
			         +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(GHQDZH)), ',', '、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxbm)), ',', '、') lxbm,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxmc)), ',', '、') lxmc,replace(WMSYS.WM_CONCAT(to_char(ghZDZH)), ',', '、') ZDZH,sum(decode(substr(xmid, 11, 1),'1',(nvl(jhyilc, 0) + nvl(jherlc, 0) + nvl(jhsanlc, 0) +nvl(jhsilc, 0) + nvl(jhdwlc, 0) + nvl(jhwllc, 0)),(nvl(yilc, 0) + nvl(erlc, 0) + nvl(sanlc, 0) +nvl(silc, 0) + nvl(dwlc, 0) + nvl(wllc, 0)))) xmlc,replace(WMSYS.WM_CONCAT(distinct to_char(xjsdj)), ',', ',') yjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(jsjsdj)), ',', ',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(ghlxbm, 0, 1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh, '市') + 1,length(xzqh)))),',','、') szxs from lxsh_lx where jdbs = '2' group by xmid) lx,"
		         	 +" (select xmid,decode(instr(WMSYS.WM_CONCAT(distinct z.zxlwlxbm),','),0,fun_char(to_char(min(to_number(z.zxlwqdzh))),3),WMSYS.WM_CONCAT(distinct to_char(ghqdzh))) qdzh,decode(instr(WMSYS.WM_CONCAT(distinct z.zxlwlxbm),','),0,fun_char(to_char(max(to_number(z.zxlwzdzh))),3),WMSYS.WM_CONCAT(distinct to_char(ghzdzh))) zdzh from lxsh_lx l left join zgb_zxlwzhtx_lxsh z on l.id=z.id where jdbs=2	group by l.xmid ) lzh, "
			         +" (select min(xdnf) xdnf,xmid from plan_zjxd where jhxdwh is not null group by xmid) sc,"
			         +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf = substr('"+gcglabgc.getYbsj()+"', 0, 4)  and jhxdwh is not null group by zj.xmid) xd,"
			         +" (select g.xmbm, sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where to_date(g.ybrq,'yyyy-mm-dd') >=to_date('"+gcglabgc.getSbyf()+"-01','yyyy-mm-dd')  and to_date(g.ybrq,'yyyy-mm-dd') <=to_date('"+gcglabgc.getYbsj()+"','yyyy-mm-dd') and zgshzt='1' group by g.xmbm) jz,"
			         +" (select g.xmbm, sum(g.bnsslc) bndsslc from GCGL_BNSS g where nf = substr('"+gcglabgc.getYbsj()+"', 0, 4) group by g.xmbm) jzs,"
			         +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs,"
			         +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
			         +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,decode(instr(min(mc),'沥青'),0,0,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0))) lq,decode(instr(min(mc),'沥青'),0,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)),0) sn,"
			         +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g left join cbgsdgz c on g.xmbm=c.xmbm where substr(g.ybyf, 0, 4) = substr('"+gcglabgc.getYbsj()+"', 0, 4) and to_date(g.ybrq,'yyyy-mm-dd') <=to_date('"+gcglabgc.getYbsj()+"','yyyy-mm-dd')  and zgshzt='1' group by g.xmbm) jz1,"
			         +" (select jhid,nvl(sum(c.cgsdwzj), 0) + nvl(sum(c.gz), 0) + nvl(sum(c.sz), 0) + nvl(sum(c.zq), 0) +nvl(sum(c.dk), 0) + nvl(sum(c.jl), 0) + nvl(sum(c.qt), 0) + nvl(sum(c.dfzc), 0) +nvl(sum(c.yhdk), 0) xzzj from gcgl_cgs c where c.tbyf='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) byxz,"
			         +" (select  xmbm,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,"
			         +" (nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) wczj from gcgl_xmjd g where to_date(g.ybrq,'yyyy-mm-dd') >=to_date('"+gcglabgc.getSbyf()+"-01','yyyy-mm-dd')  and to_date(g.ybrq,'yyyy-mm-dd') <=to_date('"+gcglabgc.getYbsj()+"','yyyy-mm-dd')  and zgshzt='1' group by g.xmbm) byxz1,"
			         +" (select jhid,sum(nvl(c.cgsdwzj,0)) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs1,"
			         +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
			         +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,decode(instr(min(mc),'沥青'),0,0,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0))) lq,decode(instr(min(mc),'沥青'),0,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)),0) sn,"
			         +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g left join cbgsdgz c on g.xmbm=c.xmbm where to_date(g.ybrq,'yyyy-mm-dd') <=to_date('"+gcglabgc.getYbsj()+"','yyyy-mm-dd') and zgshzt='1' group by g.xmbm) jz2,"
			         +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where  to_date(g.ybrq,'yyyy-mm-dd') <=to_date('"+gcglabgc.getYbsj()+"','yyyy-mm-dd')  and zgshzt='1' group by g.xmbm) jz3,"
			         +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf <= substr('"+gcglabgc.getSbyf()+"', 0, 4) and jhxdwh is not null group by zj.xmid) xd1"
			         +" where jh.xmbm=cb.xmbm(+) and jh.xmbm=kx.xmbm(+) and jh.xmbm=l.xmbm(+) and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=xd1.xmid(+)"
			         +" and jh.xmbm=lzh.xmid(+) and jh.xmbm=sc.xmid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=cgs.jhid(+) and jh.xmbm=cgs1.jhid(+) and jh.xmbm=jz1.xmbm(+)"
			         +" and jh.xmbm=jz.xmbm(+) and jh.xmbm=jzs.xmbm(+) and jh.xmbm=jz1.xmbm(+) and jh.xmbm=jz2.xmbm(+) and jh.xmbm=jz3.xmbm(+) and jh.xmbm=byxz.jhid(+) and jh.xmbm=byxz1.xmbm(+)"
			         +" and jh.xmbm in(select xmid from plan_zjxd where jhxdwh is not null)"
			         +" union all "
			    +" select distinct jh.xmbm v_1,(select name from xtgl_xzqh where id=substr(cb.xzqhdm,0,4)||'00') v_2,"
			    +" decode(substr(cb.xzqh,3,1),'市',replace(cb.xzqh,substr(cb.xzqh,1,3),''),replace(cb.xzqh,substr(cb.xzqh,1,4),'')) v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,sc.xdnf v_7,lx.xzdj v_8,lzh.qdzh v_9,lzh.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,lx.xmlc v_15,lzh.qdzh v_16,lzh.zdzh v_17,"
			    +" (nvl(jh.bbzzj, 0) + nvl(jh.gz, 0) + nvl(jh.sz, 0) + nvl(jh.zq, 0) +nvl(jh.dk, 0) + nvl(jh.jl, 0) + nvl(jh.qt, 0) + nvl(jh.dfzc, 0) + nvl(jh.yhdk, 0)) v_18,"
			    +" jh.bbzzj v_19,jh.gz v_20,jh.sz v_21,jh.zq v_22,jh.dk v_23,jh.jl v_24,jh.qt v_25,jh.dfzc v_26,jh.yhdk v_27,xd.bnjh v_28,xd.qzbtz v_29,"
			    +" jzs.bndsslc v_30,(case when kgzt = '0' then '未开工' when jgzt = '1' then '完工' else '在建'end) v_31,"
			    +" substr(cb.kgsj,0,4) v_32,substr(cb.wgsj,0,4) v_33,(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) + nvl(cgs.zq, 0) +nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) +nvl(cgs.yhdk, 0)) v_34,"
			    +" cgs.cgs v_35,cgs.gz v_36,cgs.sz v_37,cgs.zq v_38,cgs.dk v_39,cgs.jl v_40,cgs.qt v_41,cgs.dfzc v_42,cgs.yhdk v_43,jz1.ztz v_44,"
			    +" decode((nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) + nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0)),'0','0',null,'0',round((jz1.ztz /(nvl(cgs.cgs, 0) + nvl(cgs.gz, 0) + nvl(cgs.sz, 0) +nvl(cgs.zq, 0) + nvl(cgs.dk, 0) + nvl(cgs.jl, 0) +nvl(cgs.qt, 0) + nvl(cgs.dfzc, 0) + nvl(cgs.yhdk, 0))) * 100), 2) v_45,"
			    +" jz1.wclc v_46,jz1.yiji v_47,jz1.erji v_48,jz1.sanji v_49,jz1.siji v_50,jz1.lq v_51,jz1.sn v_52,jz.ssdctc v_53,byxz.xzzj v_54,byxz1.wclc v_55,byxz1.wczj v_56,"
			    +" (nvl(cgs1.cgs, 0) + nvl(cgs1.gz, 0) + nvl(cgs1.sz, 0) + nvl(cgs1.zq, 0) +nvl(cgs1.dk, 0) + nvl(cgs1.jl, 0) + nvl(cgs1.qt, 0) + nvl(cgs1.dfzc, 0) +nvl(cgs1.yhdk, 0)) v_57,"
			    +" cgs1.cgs v_58,cgs1.gz v_59,cgs1.sz v_60,cgs1.zq v_61,cgs1.dk v_62,cgs1.jl v_63,cgs1.qt v_64,cgs1.dfzc v_65,cgs1.yhdk v_66,"
			    +" jz2.ztz v_67,jz2.wclc v_68,jz2.yiji v_69,jz2.erji v_70,jz2.sanji v_71,jz2.siji v_72,jz2.lq v_73,jz2.sn v_74,jz3.ssdctc v_75,lx.xmlc-jz2.wclc v_76,"
			    +" round(jz2.wclc / lx.xmlc * 100, 2) v_77,"
			    +" decode(xd1.qzbtz,'0','0',null,'0',round(cgs1.cgs / xd1.qzbtz * 100, 0)) v_78,"
			    +" decode(xd1.bnjh,'0','0',null,'0',round(jz2.ztz / xd1.bnjh * 100, 0)) v_79,"
			    +" cb.bz v_80, lx.xzqhdm v_83,'改建' v_84,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm, 0, 4) xmnf,lx.lxbm lxbm,"
			    +" (case when kgzt = '0' then '未开工' when jgzt = '1' then '完工' else '在建'end) jzzt,substr(cb.xzqhdm, 0, 4) || '00' xzqhdm,"
			    +" (select name from xtgl_xzqh where id = substr(cb.xzqhdm, 0, 4) || '00') xzqhmc"
			    +" from jhsh_sjgz jh,cbsj_sjgz cb,kxxyj_sjgz kx,lxsh_sjgz l,"
			         +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(GHQDZH)), ',', '、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxbm)), ',', '、') lxbm,replace(WMSYS.WM_CONCAT(distinct to_char(ghlxmc)), ',', '、') lxmc,replace(WMSYS.WM_CONCAT(to_char(ghZDZH)), ',', '、') ZDZH,sum(decode(substr(xmid, 11, 1),'1',(nvl(jhyilc, 0) + nvl(jherlc, 0) + nvl(jhsanlc, 0) +nvl(jhsilc, 0) + nvl(jhdwlc, 0) + nvl(jhwllc, 0)),(nvl(yilc, 0) + nvl(erlc, 0) + nvl(sanlc, 0) +nvl(silc, 0) + nvl(dwlc, 0) + nvl(wllc, 0)))) xmlc,replace(WMSYS.WM_CONCAT(distinct to_char(xjsdj)), ',', ',') yjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(jsjsdj)), ',', ',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(ghlxbm, 0, 1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh, '市') + 1,length(xzqh)))),',','、') szxs from lxsh_lx where jdbs = '2' group by xmid) lx,"
			         +" (select xmid,decode(instr(WMSYS.WM_CONCAT(distinct z.zxlwlxbm),','),0,fun_char(to_char(min(to_number(z.zxlwqdzh))),3),WMSYS.WM_CONCAT(distinct to_char(ghqdzh))) qdzh,decode(instr(WMSYS.WM_CONCAT(distinct z.zxlwlxbm),','),0,fun_char(to_char(max(to_number(z.zxlwzdzh))),3),WMSYS.WM_CONCAT(distinct to_char(ghzdzh))) zdzh from lxsh_lx l left join zgb_zxlwzhtx_lxsh z on l.id=z.id where jdbs=2	group by l.xmid ) lzh, "
			         +" (select min(xdnf) xdnf,xmid from plan_zjxd where jhxdwh is not null group by xmid) sc,"
			         +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf = substr('"+gcglabgc.getSbyf()+"', 0, 4)  and jhxdwh is not null group by zj.xmid) xd,"
			         +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where to_date(g.ybrq,'yyyy-mm-dd') >=to_date('"+gcglabgc.getSbyf()+"-01','yyyy-mm-dd')  and to_date(g.ybrq,'yyyy-mm-dd') <=to_date('"+gcglabgc.getYbsj()+"','yyyy-mm-dd') and zgshzt='1' group by g.xmbm) jz,"
			         +" (select g.xmbm, sum(g.bnsslc) bndsslc from GCGL_BNSS g where nf = substr('"+gcglabgc.getSbyf()+"', 0, 4) group by g.xmbm) jzs,"
			         +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs,"
			         +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
			         +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,decode(instr(min(mc),'沥青'),0,0,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0))) lq,decode(instr(min(mc),'沥青'),0,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)),0) sn,"
			         +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g left join cbgsdgz c on g.xmbm=c.xmbm where substr(g.ybyf, 0, 4) = substr('"+gcglabgc.getSbyf()+"', 0, 4) and to_date(g.ybrq,'yyyy-mm-dd') <=to_date('"+gcglabgc.getYbsj()+"','yyyy-mm-dd')  and zgshzt='1' group by g.xmbm) jz1,"
			         +" (select jhid,nvl(sum(c.cgsdwzj), 0) + nvl(sum(c.gz), 0) + nvl(sum(c.sz), 0) + nvl(sum(c.zq), 0) +nvl(sum(c.dk), 0) + nvl(sum(c.jl), 0) + nvl(sum(c.qt), 0) + nvl(sum(c.dfzc), 0) +nvl(sum(c.yhdk), 0) xzzj from gcgl_cgs c where c.tbyf='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) byxz,"
			         +" (select  xmbm,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,"
			         +" (nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) wczj from gcgl_xmjd g where to_date(g.ybrq,'yyyy-mm-dd') >=to_date('"+gcglabgc.getSbyf()+"-01','yyyy-mm-dd')  and to_date(g.ybrq,'yyyy-mm-dd') <=to_date('"+gcglabgc.getYbsj()+"','yyyy-mm-dd')   and zgshzt='1' group by g.xmbm) byxz1,"
			         +" (select jhid,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where c.tbyf<='"+gcglabgc.getSbyf()+"' and shzt='1' group by c.jhid) cgs1,"
			         +" (select g.xmbm,(nvl(sum(g.wccgs), 0) + nvl(sum(g.wcgz), 0) + nvl(sum(g.wcsz), 0) + nvl(sum(g.wczq), 0) +nvl(sum(g.wcdk), 0) + nvl(sum(g.wcjl), 0) + nvl(sum(g.wcqt), 0) + nvl(sum(g.wcdfzc), 0) +nvl(sum(g.wcyhdk), 0)) ztz,"
			         +" (nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)) wclc,decode(instr(min(mc),'沥青'),0,0,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0))) lq,decode(instr(min(mc),'沥青'),0,(nvl(sum(yilc), 0) + nvl(sum(erlc), 0) + nvl(sum(sanlc), 0) + nvl(sum(silc), 0)),0) sn,"
			         +" sum(yilc) yiji,sum(erlc) erji,sum(sanlc) sanji,sum(silc) siji from gcgl_xmjd g left join cbgsdgz c on g.xmbm=c.xmbm where to_date(g.ybrq,'yyyy-mm-dd') <=to_date('"+gcglabgc.getYbsj()+"','yyyy-mm-dd') and zgshzt='1' group by g.xmbm) jz2,"
			         +" (select g.xmbm, sum(g.bndsslc) bndsslc,sum(g.ssdctc) ssdctc,sum(g.wwcgcl) wwcgcl from gcgl_xmjd g where to_date(g.ybrq,'yyyy-mm-dd') >=to_date('"+gcglabgc.getSbyf()+"-01','yyyy-mm-dd')  and to_date(g.ybrq,'yyyy-mm-dd') <=to_date('"+gcglabgc.getYbsj()+"','yyyy-mm-dd') and zgshzt='1' group by g.xmbm) jz3,"
			         +" (select zj.xmid,(sum(nvl(zj.btzzj, 0)) + sum(nvl(zj.gz, 0)) +sum(nvl(zj.sz, 0)) + sum(nvl(zj.zq, 0)) + sum(nvl(zj.dk, 0)) +sum(nvl(zj.jl, 0)) + sum(nvl(zj.qt, 0)) +sum(nvl(zj.dfzc, 0)) + sum(nvl(zj.yhdk, 0))) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf <= substr('"+gcglabgc.getSbyf()+"', 0, 4) and jhxdwh is not null group by zj.xmid) xd1"
			         +" where jh.xmbm=cb.xmbm(+) and jh.xmbm=kx.xmbm(+) and jh.xmbm=l.xmbm(+) and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=xd1.xmid(+)"
			         +" and jh.xmbm=sc.xmid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=cgs.jhid(+) and jh.xmbm=cgs1.jhid(+) and jh.xmbm=jz1.xmbm(+)"
			         +" and jh.xmbm=lzh.xmid(+) and jh.xmbm=jz.xmbm(+) and jh.xmbm=jzs.xmbm(+) and jh.xmbm=jz1.xmbm(+) and jh.xmbm=jz2.xmbm(+) and jh.xmbm=jz3.xmbm(+) and jh.xmbm=byxz.jhid(+) and jh.xmbm=byxz1.xmbm(+)"
			         +" and jh.xmbm in(select xmid from plan_zjxd where jhxdwh is not null)";
			       
		insert("glgzxjmxb", sql);
		List<Excel_list> l1=queryList("getXgjwcmxb",gcglabgc);
		List<Excel_list> l2=queryList("getXgjwcmxb1",gcglabgc);
		List<Excel_list> l3=queryList("getXgjwcmxb2",gcglabgc);
		
		for (int i = 0; i < l2.size(); i++) {
			l3.add(l2.get(i));
			int t=1;
			for (int j = 0; j < l1.size(); j++) {
				if(l2.get(i).getV_83().equals(l1.get(j).getV_83())){
					l1.get(j).setV_0(t+"");
					l3.add(l1.get(j));
					t++;
				}
			}
		}
		
		return l3;
	}
	
	
	
	
	@Override
	public List<Excel_list> xmkaqsmfhbb1(String tiaojian1) {
		return queryList("xmkaqsmfhbb1",tiaojian1);
	}

	@Override
	public List<Excel_list> xmkaqsmfhbb2(String tiaojian1) {
		return queryList("xmkaqsmfhbb2",tiaojian1);
	}

	@Override
	public List<Excel_list> sckaqsmfhbb(String tiaojian1) {
		return queryList("sckaqsmfhbb",tiaojian1);
	}

	@Override
	public void createybView(String viewsql) {
		insert("createybView", viewsql);
	}

	@Override
	public List<Excel_list> getHzgjxj(Gcglwqgz gcglwqgz) {
		System.out.println(gcglwqgz.getXmnf());
		List<Excel_list> list = queryList("getHzgjxj",gcglwqgz);
		int k=0;//k为每一个行政区划的第一行
		int count=0;//统计个数
		String xzqh="总计";
		for (int i = 0; i < list.size(); i++) {
			if(xzqh.equals(list.get(i).getXzqh())){
				count++;
			}else{
				list.get(k).setV_0(count+"");
				k=i;
				count=1;
				xzqh=list.get(i).getXzqh();
			}
		}
		if(list.size()>0)
		list.get(k).setV_0(count+"");
		return list; 
	}
	
	@Override
	public List<Excel_list> getHzzh(Gcglwqgz gcglwqgz) {
		System.out.println(gcglwqgz.getXmnf());
		List<Excel_list> list = queryList("getHzzh",gcglwqgz);
		int k=0;//k为每一个行政区划的第一行
		int count=0;//统计个数
		String xzqh="总计";
		for (int i = 0; i < list.size(); i++) {
			if(xzqh.equals(list.get(i).getXzqh())){
				count++;
			}else{
				list.get(k).setV_0(count+"");
				k=i;
				count=1;
				xzqh=list.get(i).getXzqh();
			}
		}
		if(list.size()>0)
		list.get(k).setV_0(count+"");
		return list; 
	}
	
	@Override
	public List<Excel_list> getHzlm(Gcglwqgz gcglwqgz) {
		System.out.println(gcglwqgz.getXmnf());
		List<Excel_list> list = queryList("getHzlm",gcglwqgz);
		int k=0;//k为每一个行政区划的第一行
		int count=0;//统计个数
		String xzqh="总计";
		for (int i = 0; i < list.size(); i++) {
			if(xzqh.equals(list.get(i).getXzqh())){
				count++;
			}else{
				list.get(k).setV_0(count+"");
				k=i;
				count=1;
				xzqh=list.get(i).getXzqh();
			}
		}
		if(list.size()>0)
		list.get(k).setV_0(count+"");
		return list; 
	}
	
	@Override
	public List<Excel_list> getHzyh(Gcglwqgz gcglwqgz) {
		System.out.println(gcglwqgz.getXmnf());
		List<Excel_list> list = queryList("getHzyh",gcglwqgz);
		int k=0;//k为每一个行政区划的第一行
		int count=0;//统计个数
		String xzqh="总计";
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getXzqh()==null)
				continue;
			if(xzqh.equals(list.get(i).getXzqh())){
				count++;
			}else{
				list.get(k).setV_0(count+"");
				k=i;
				count=1;
				xzqh=list.get(i).getXzqh();
			}
		}
		if(list.size()>0)
		list.get(k).setV_0(count+"");
		
		return list; 
	}
	
	@Override
	public List<Excel_list> getHzlw(Gcglwqgz gcglwqgz) {
		System.out.println(gcglwqgz.getXmnf());
		List<Excel_list> list = queryList("getHzlw",gcglwqgz);
		int k=0;//k为每一个行政区划的第一行
		int count=0;//统计个数
		String xzqh="总计";
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getXzqh()==null)
				continue;
			if(xzqh.equals(list.get(i).getXzqh())){
				count++;
			}else{
				list.get(k).setV_0(count+"");
				k=i;
				count=1;
				xzqh=list.get(i).getXzqh();
			}
		}
		if(list.size()>0)
		list.get(k).setV_0(count+"");
		
		return list; 
	}

	@Override
	public List<Excel_list> getWqgzjsqk(Gcglwqgz gcglwqgz) {
		List<Excel_list> l1=queryList("getWqgzjsqk",gcglwqgz);
		List<Excel_list> l2=queryList("getWqgzjsqk1",gcglwqgz);
		if(l2.size()>0){
			l1.addAll(l2);
		}else{
			return null;
		}
		return l1;
	}
	
	@Override
	public List<Excel_list> getAbjsqk(Gcglwqgz gcglwqgz) {
		List<Excel_list> l1=queryList("getAbjsqk",gcglwqgz);
		List<Excel_list> l2=queryList("getAbjsqk1",gcglwqgz);
		if(l2.size()>0){
			l1.addAll(l2);
		}else{
			return null;
		}
		return l1;
	}

	@Override
	public List<Excel_list> getsjssjzhzb(String xmnf) {
		List<Map<String, Object>> l=queryList("getsjssjzhzb",xmnf);
		
		List<Excel_list> list=new ArrayList<Excel_list>();
		if(l.size()>0)
		for (int i = 0; i < 24; i++) {
			if(i==0){
				Excel_list el=new Excel_list();
				el.setV_0("总计");el.setV_1("总计");el.setV_2("完成工程量");el.setV_3("单位1");el.setV_4("1");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("ZJWCZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("ZJWCZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("ZJWCZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("ZJWCZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("ZJWCZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("ZJWCZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("ZJWCZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("ZJWCZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("ZJWCZ").toString());
					
					
				}
				list.add(el);
			}
			if(i==1){
				Excel_list el=new Excel_list();
				el.setV_0("总计");el.setV_1("总计");el.setV_2("完成工程量");el.setV_3("单位2");el.setV_4("2");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("ZJWCYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("ZJWCYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("ZJWCYM").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_12(map.get("ZJWCYM").toString());
					/*if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("ZJWCYM").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("ZJWCYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("ZJWCYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("ZJWCYM").toString());*/
					
				}
				list.add(el);
			}
			if(i==2){
				Excel_list el=new Excel_list();
				el.setV_0("总计");el.setV_1("总计");el.setV_2("完成投资（万元）");el.setV_3("总投资");el.setV_4("3");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("ZJWCZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("ZJWCZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("ZJWCZTZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("ZJWCZTZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("ZJWCZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("ZJWCZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("ZJWCZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("ZJWCZTZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("ZJWCZTZ").toString());
				}
				list.add(el);
			}
			if(i==3){
				Excel_list el=new Excel_list();
				el.setV_0("总计");el.setV_1("总计");el.setV_2("完成投资（万元）");el.setV_3("中央投资");el.setV_4("4");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("ZJWCBTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("ZJWCBTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("ZJWCBTZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("ZJWCBTZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("ZJWCBTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("ZJWCBTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("ZJWCBTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("ZJWCBTZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("ZJWCBTZ").toString());
					
				}
				list.add(el);
			}
			if(i==4){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("计划下达工程量");el.setV_3("单位1");el.setV_4("5");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPXDZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPXDZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPXDZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPXDZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPXDZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPXDZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPXDZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPXDZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPXDZ").toString());
					
				}list.add(el);
			}
			if(i==5){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("计划下达工程量");el.setV_3("单位2");el.setV_4("6");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPXDYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPXDYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPXDYM").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPXDYM").toString());
					/*if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPXDYM").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPXDYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPXDYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPXDYM").toString());*/
					//list.add(el);
				}list.add(el);
			}
			if(i==6){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("完成工程量");el.setV_3("单位1");el.setV_4("7");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPWCZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPWCZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==7){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("完成工程量");el.setV_3("单位2");el.setV_4("8");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCYM").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPWCYM").toString());
					/*if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCYM").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCYM").toString());*/
					//list.add(el);
				}list.add(el);
			}
			if(i==8){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("计划下达资金量（万元）");el.setV_3("总投资");el.setV_4("9");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPZTZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPZTZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPZTZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPZTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==9){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("计划下达资金量（万元）");el.setV_3("中央投资");el.setV_4("10");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPBTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPBTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPBTZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPBTZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPBTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPBTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPBTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPBTZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPBTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==10){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("计划下达资金量（万元）");el.setV_3("地方自筹");el.setV_4("11");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPDFZC").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPDFZC").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPDFZC").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPDFZC").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPDFZC").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPDFZC").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPDFZC").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPDFZC").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPDFZC").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==11){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("完成投资（万元）");el.setV_3("总投资");el.setV_4("12");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCZTZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCZTZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPWCZTZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPWCZTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==12){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("完成投资（万元）");el.setV_3("部投资");el.setV_4("13");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCBTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCBTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCBTZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCBTZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCBTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCBTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCBTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPWCBTZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPWCBTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==13){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("完成投资（万元）");el.setV_3("地方自筹");el.setV_4("14");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCDFZC").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCDFZC").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCDFZC").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCDFZC").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCDFZC").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCDFZC").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCDFZC").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPWCDFZC").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPWCDFZC").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==14){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1(xmnf+"年完成的跨年度计划项目");el.setV_2("完成工程量");el.setV_3("单位1");el.setV_4("15");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCKNZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCKNZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCKNZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCKNZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCKNZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCKNZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCKNZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPWCKNZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPWCKNZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==15){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1(xmnf+"年完成的跨年度计划项目");el.setV_2("完成工程量");el.setV_3("单位2");el.setV_4("16");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCKNYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCKNYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCKNYM").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPWCKNYM").toString());
					/*if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCKNYM").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCKNYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCKNYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCKNYM").toString());*/
					//list.add(el);
				}list.add(el);
			}
			if(i==16){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1(xmnf+"年完成的跨年度计划项目");el.setV_2("完成投资（万元）");el.setV_3("总投资");el.setV_4("17");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCKNZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCKNZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCKNZTZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCKNZTZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCKNZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCKNZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCKNZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPWCKNZTZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPWCKNZTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==17){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1(xmnf+"年完成的跨年度计划项目");el.setV_2("完成投资（万元）");el.setV_3("中央投资");el.setV_4("18");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCKNBTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCKNBTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCKNBTZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCKNBTZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCKNBTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCKNBTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCKNBTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("BAPWCKNBTZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("BAPWCKNBTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==18){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1("其中："+xmnf+"年投资项目");el.setV_2("完成工程量");el.setV_3("单位1");el.setV_4("19");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("SAPWCZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("SAPWCZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("SAPWCZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("SAPWCZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("SAPWCZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("SAPWCZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==19){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1("其中："+xmnf+"年投资项目");el.setV_2("完成工程量");el.setV_3("单位2");el.setV_4("20");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCYM").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_12(map.get("SAPWCYM").toString());
					/*if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("SAPWCYM").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCYM").toString());*/
					//list.add(el);
				}list.add(el);
			}
			if(i==20){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1("其中："+xmnf+"年投资项目");el.setV_2("完成投资（万元）");el.setV_3("完成投资（万元）");el.setV_4("21");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("SAPWCZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("SAPWCZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("SAPWCZTZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("SAPWCZTZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("SAPWCZTZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("SAPWCZTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==21){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1(xmnf+"年完成的跨年度项目");el.setV_2("完成工程量");el.setV_3("单位1");el.setV_4("22");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("SAPWCKNZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("SAPWCKNZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("SAPWCKNZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("SAPWCKNZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCKNZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCKNZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCKNZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("SAPWCKNZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("SAPWCKNZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==22){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1(xmnf+"年完成的跨年度项目");el.setV_2("完成工程量");el.setV_3("单位2");el.setV_4("23");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCKNYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCKNYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCKNYM").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_12(map.get("SAPWCKNYM").toString());
					
					/*if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("SAPWCKNYM").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCKNYM").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCKNYM").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCKNYM").toString());*/
					//list.add(el);
				}list.add(el);
			}
			if(i==23){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1(xmnf+"年完成的跨年度项目");el.setV_2("完成投资（万元）");el.setV_3("完成投资（万元）");el.setV_4("24");
				for (Map<String, Object> map : l) {
					if("5".equals(map.get("XH").toString()))
						el.setV_5(map.get("SAPWCKNZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_6(map.get("SAPWCKNZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_7(map.get("SAPWCKNZTZ").toString());
					if("8".equals(map.get("XH").toString()))
						el.setV_8(map.get("SAPWCKNZTZ").toString());
					if("1".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCKNZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCKNZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCKNZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_12(map.get("SAPWCKNZTZ").toString());
					if("9".equals(map.get("XH").toString()))
						el.setV_13(map.get("SAPWCKNZTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			
		}
		
		return list;
	}

	@Override
	public List<Excel_list> getGlgzxjzd(String tiaojian) {
		return queryList("getGlgzxjzd", tiaojian);
	}

	@Override
	public List<TreeNode> createBtTree(Excel_list excel_list) {
		return queryList("createBtTree", excel_list);
	}

	@Override
	public List<Excel_list> getZdyBbzd(Excel_list excel_list) {
		return queryList("getZdyBbzd", excel_list);
	}

	@Override
	public List<Excel_list> getGljsjhhzb() {
		List<Excel_list> l=new ArrayList<Excel_list>();
		//查询总的list
		List<Excel_list> l1=queryList("getGljsjhhzb1");
		//各个区划的合计
		List<Excel_list> l2=queryList("getGljsjhhzb2");
		//所以信息
		List<Excel_list> l3=queryList("getGljsjhhzb3");
		l.addAll(l1);
		for (int i = 0; i < l2.size(); i++) {
			l.add(l2.get(i));
			for (int j = 0; j < l3.size(); j++) {
				if(l2.get(i).getV_0().equals(l3.get(j).getV_0()))
					l.add(l3.get(j));
			}
		}
		return l;
	}

	@Override
	public List<TreeNode> createWhTree() {
		return queryList("createWhTree");
	}

	@Override
	public List<Excel_list> getGsgxsjgzjd(String sql2) {
		return queryList("getGsgxsjgzjd",sql2);
	}

	@Override
	public boolean insertOrUpdatesjss(List<Excel_list> list1) {
		deleteBatch("deletesjss", list1);
		insertBatch("insertOrUpdatesjss", list1);
		return true;
	}

	@Override
	public List<Excel_list> getsjssjzhzbnew(Excel_list excel_list) {
		return queryList("getsjssjzhzbnew",excel_list);
	}

	@Override
	public List<Excel_list> getinsertorupdate(Excel_list excel_list) {
		return queryList("getinsertorupdate", excel_list);
	}

	@Override
	public List<Excel_list> getLwgzAbgcybb(Gcglabgc gcglabgc) {
		return queryList("getLwgzAbgcybb", gcglabgc);
	}

	@Override
	public List<Excel_list> getLwgzWqgzybb(Gcglabgc gcglabgc) {
		return queryList("getLwgzWqgzybb", gcglabgc);
	}
	public List<Excel_list> getJhzxqkb(Gcglabgc gcglabgc) {
		return queryList("getJhzxqkb",gcglabgc);
	}

	@Override
	public List<Excel_list> getLwgzZhfzybb(Gcglabgc gcglabgc) {
		return queryList("getLwgzZhfzybb", gcglabgc);
	}

	@Override
	public List<Excel_list> getYhdzxwcb(Gcglabgc gcglabgc) {
		return queryList("getYhdzxwcb",gcglabgc);
	}

	@Override
	public List<Excel_list> getLwgzHzb(Gcglabgc gcglabgc) {
		List<Excel_list> total = queryList("getLwgzHzbTotal",gcglabgc);
        int rowNum = 0;
		List<Excel_list> result= queryList("getLwgzHzb",gcglabgc);
		for(int i = 0; i < result.size();i++) {
			rowNum ++;
			result.get(i).setV_0(rowNum+"");
		}
		total.addAll(result);
		return total;
	}

	@Override
	public List<Excel_list> getYhgc(Gcglabgc gcglabgc) {
		List<Excel_list> l1 = queryList("getYhgcHj",gcglabgc);
		List<Excel_list> l2 = queryList("getYhgcHj1",gcglabgc);
		List<Excel_list> l3 = queryList("getYhgcHj2",gcglabgc);
		List<Excel_list> l4 = queryList("getYhgcHj3",gcglabgc);
		List<Excel_list> l5 = queryList("getYhgc",gcglabgc);
		
		l1.addAll(l2);
		int l4no=0;int l5no=0;
		for (int i = 0; i < l3.size(); i++) {
			l1.add(l3.get(i));
			int flag1=l3.get(i).getXmsl();
			int flag11=0;int k=1;
			while (flag1>flag11) {
				if(l4.size()==l4no)
					break;
				
				l1.add(l4.get(l4no));
				for (int j = l5no; j < l5no+l4.get(l4no).getXmsl(); j++) {
					if(j>=l5.size()) break;
					l5.get(j).setV_0(k+"");k++;
				}
				if(l5no>=l5.size()) break;
				if(l5no+l4.get(l4no).getXmsl()>l5.size()) {
					l1.addAll(l5.subList(l5no, l5.size()-1));
				}else {
					l1.addAll(l5.subList(l5no, l5no+l4.get(l4no).getXmsl()));
				}
				
				flag11+=l4.get(l4no).getXmsl();l5no+=l4.get(l4no).getXmsl();l4no++;
				
			}
		}
		return l1;
	}

	@Override
	public List<Excel_list> getWnjhQqtjhzb(Gcglabgc gcglabgc) {
		List<Excel_list> total = queryList("getWnjhQqtjhzbTotal",gcglabgc);
		List<Excel_list> result= queryList("getWnjhQqtjhzb",gcglabgc);
		total.addAll(result);
		return total;
	}

	@Override
	public List<Excel_list> getGsdyhjdhzb(Gcglabgc gcglabgc) {
		return queryList("getGsdyhjdhzb",gcglabgc);
	}

	@Override
	public boolean updateGsdyhjdhzb(Excel_list excel_list) {
		return update("updateGsdyhjdhzb", excel_list)>0;
	}

	@Override
	public List<Excel_list> getLmgzxmb(Gcglabgc gcglabgc) {
		int rowNum = 0;
		List<Excel_list> total = queryList("getLmgzxmbTotal", gcglabgc);
		List<Excel_list> result = queryList("getLmgzxmb", gcglabgc);
		for(int i = 0; i < result.size();i++) {
			rowNum ++;
			result.get(i).setV_0(rowNum+"");
			String buf = "";
			int a = result.get(i).getV_2().indexOf("市")+1;
			if (result.get(i).getV_2().contains(",")) {
				String[] strs=result.get(i).getV_2().split(",");
				for(int j=0;j<strs.length;j++){
					buf=buf+strs[j].substring(a)+",";
					result.get(i).setV_2(buf.substring(0, buf.length()-1));
				}
				
			}else {
				String subs = result.get(i).getV_2().substring(a);
				result.get(i).setV_2(subs);
			}	
		}
		total.addAll(result);
		return total;
	}
	
	@Override
	public List<Excel_list> getShxmb(Gcglabgc gcglabgc) {
		int rowNum = 0;
		List<Excel_list> total = queryList("getShxmbTotal", gcglabgc);
		List<Excel_list> result = queryList("getShxmb", gcglabgc);
		for(int i = 0; i < result.size();i++) {
			rowNum ++;
			result.get(i).setV_0(rowNum+"");
			String buf = "";
			int a = result.get(i).getV_2().indexOf("市")+1;
			if (result.get(i).getV_2().contains(",")) {
				String[] strs=result.get(i).getV_2().split(",");
				for(int j=0;j<strs.length;j++){
					buf=buf+strs[j].substring(a)+",";
					result.get(i).setV_2(buf.substring(0, buf.length()-1));
				}
				
			}else {
				String subs = result.get(i).getV_2().substring(a);
				result.get(i).setV_2(subs);
			}	
		}
		total.addAll(result);
		return total;
	}

	@Override
	public List<Map<String, Object>> getFormData() {
		return queryList("getFormData");
	}

	@Override
	public boolean insertFormData(String json) {
		ObjectMapper mapper = new ObjectMapper();
		String name = "";
		String value = "";
		try {
			List<Excel_list> elist = mapper.readValue(json,new TypeReference<List<Excel_list>>() { });
			/*for (int i = 0; i < 24; i++) {
				name+="v_"+(i)+",";	
				value+="#{v_"+(i)+"},";
			}
			name.substring(0, name.length()-1);
			value.substring(0, name.length()-1);*/
			deleteBatch("deleteFormData", elist);
			insertBatch("insertFormData", elist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
}
