package com.hdsx.jxzhpt.gcxmybb.server.impl;


import java.util.ArrayList;
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
+" select "
        +" jh.xmbm v_1,xzqhmc v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,substr(cb.xmbm,0,4) v_7,"
        +" lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,sgt.lc v_15,sgt.qdzh v_16,sgt.zdzh v_17,jh.pfztz v_18,jh.bbzzj v_19,jh.gz v_20,jh.sz v_21,jh.zq v_22,jh.dk v_23,jh.jl v_24,jh.qt v_25,jh.dfzc v_26,jh.yhdk v_27,xd.bnjh v_28,xd.qzbtz v_29,jz.bndsslc v_30,"
        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_31,(case when jh.jgzt='1' then '1' else '0' end) v_32,(case when jh.kgzt='0' then '1' else '0' end) v_33,"
        +" jh.kgsj v_34,jh.wgsj v_35,cgs.ztz v_36,cgs.cgs v_37,cgs.gz v_38,cgs.sz v_39,cgs.zq v_40,cgs.dk v_41,cgs.jl v_42,cgs.qt v_43,cgs.dfzc v_44,cgs.yhdk v_45,jz1.xmwc v_46,decode(jh.pfztz,'0','0',null,'0',round((jz1.xmwc/jh.pfztz)*100),2) v_47,jz1.wcmc v_48,jz1.yiji v_49,"
        +" jz1.erji v_50,jz1.sanji v_51,jz1.siji v_52,jz1.lq v_53,jz1.sn v_54,"
        +" jz.ssdctc v_55,jz2.ztz v_56,jz2.bywcmc v_57,jz2.wctze v_58,cgs1.ztz v_59,cgs1.cgs v_60,cgs1.gz v_61,cgs1.sz v_62,cgs1.zq v_63,cgs1.dk v_64,cgs1.jl v_65,cgs1.qt v_66,cgs1.dfzc v_67,cgs1.yhdk v_68,jz4.xmwc v_69,jz4.wcmc v_70,jz4.yiji v_71,"
        +" jz4.erji v_72,jz4.sanji v_73,jz4.siji v_74,jz4.lq v_75,jz4.sn v_76,"
        +" jz3.ssdctc v_77,jz3.wkglc v_78,round(jz4.wcmc/lx.xmlc*100,0)||'%' v_79,decode(jh.bbzzj,'0','0%',null,'0%',round(jz4.zycgs/jh.bbzzj*100,0)||'%') v_80,round(jz4.ztz/jh.pfztz*100,0)||'%' v_81,l.bz v_82,lx.xzqhdm v_83,'新建' v_84,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm,(case when kgzt='0' then '未开工' when jgzt='1' then '完工' else '已开工' end) jzzt"
        +" from jhsh_xj jh,"
        +" cbsj_xj cb,"
        +" kxxyj_xj kx,"
        +" lxsh_xj l,"
        +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
        +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,sum(decode(substr(xmid,11,1),'1',(nvl(jhyilc,0)+nvl(jherlc,0)+nvl(jhsanlc,0)+nvl(jhsilc,0)+nvl(jhdwlc,0)+nvl(jhwllc,0)),(nvl(yilc,0)+nvl(erlc,0)+nvl(sanlc,0)+nvl(silc,0)+nvl(dwlc,0)+nvl(wllc,0)))) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
        +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
       +" from lxsh_lx where jdbs='2' group by xmid) lx,"
       +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_xj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
        +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
       +" ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.dwgz) gz,sum(g.dwsz) sz"
       +"  from gcgl_xj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(sbyf,instr(sbyf,'-')+1))<=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by g.jhid) jz1,"
       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) wctze,sum(g.bywcmc) bywcmc from gcgl_xj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(sbyf,instr(sbyf,'-')+1))=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by g.jhid) jz2,"
       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_xj g group by g.jhid) jz3,"
       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
      +"  ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.dwgz) gz,sum(g.dwsz) sz"
      +"   from gcgl_xj g where substr(sbyf,0,4)<=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz4,sgt_xj sgt,"
      +"(select jhid,sum(c.pfztz) ztz,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(tbyf,instr(tbyf,'-')+1))<=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by c.jhid) cgs,"
      +"(select jhid,sum(c.pfztz) ztz,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf,0,4)<=substr('"+gcglabgc.getSbyf()+"',0,4) group by c.jhid) cgs1"
      +"  where jh.xmbm=cgs.jhid(+) and jh.xmbm=cgs1.jhid(+) and jh.xmbm=cb.xmbm and jh.xmbm = sgt.xmbm(+) and jh.xmbm=kx.xmbm and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+)  and jh.xdzt='1'      "
      +" union all"
				+" select "
		        +" jh.xmbm v_1,xzqhmc v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,substr(cb.xmbm,0,4) v_7,"
		        +" lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,sgt.lc v_15,sgt.qdzh v_16,sgt.zdzh v_17,jh.pfztz v_18,jh.bbzzj v_19,jh.gz v_20,jh.sz v_21,jh.zq v_22,jh.dk v_23,jh.jl v_24,jh.qt v_25,jh.dfzc v_26,jh.yhdk v_27,xd.bnjh v_28,xd.qzbtz v_29,jz.bndsslc v_30,"
		        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_31,(case when jh.jgzt='1' then '1' else '0' end) v_32,(case when jh.kgzt='0' then '1' else '0' end) v_33,"
		        +" jh.kgsj v_34,jh.wgsj v_35,cgs.ztz v_36,cgs.cgs v_37,cgs.gz v_38,cgs.sz v_39,cgs.zq v_40,cgs.dk v_41,cgs.jl v_42,cgs.qt v_43,cgs.dfzc v_44,cgs.yhdk v_45,jz1.xmwc v_46,decode(jh.pfztz,'0','0',null,'0',round((jz1.xmwc/jh.pfztz)*100),2) v_47,jz1.wcmc v_48,jz1.yiji v_49,"
		        +" jz1.erji v_50,jz1.sanji v_51,jz1.siji v_52,jz1.lq v_53,jz1.sn v_54,"
		        +" jz.ssdctc v_55,jz2.ztz v_56,jz2.bywcmc v_57,jz2.wctze v_58,cgs1.ztz v_59,cgs1.cgs v_60,cgs1.gz v_61,cgs1.sz v_62,cgs1.zq v_63,cgs1.dk v_64,cgs1.jl v_65,cgs1.qt v_66,cgs1.dfzc v_67,cgs1.yhdk v_68,jz4.xmwc v_69,jz4.wcmc v_70,jz4.yiji v_71,"
		        +" jz4.erji v_72,jz4.sanji v_73,jz4.siji v_74,jz4.lq v_75,jz4.sn v_76,"
		        +" jz3.ssdctc v_77,jz3.wkglc v_78,round(jz4.wcmc/lx.xmlc*100,0)||'%' v_79,decode(jh.bbzzj,'0','0%',null,'0%',round(jz4.zycgs/jh.bbzzj*100,0)||'%') v_80,round(jz4.ztz/jh.pfztz*100,0)||'%' v_81,l.bz v_82,lx.xzqhdm v_83,'改建' v_84,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm,(case when kgzt='0' then '未开工' when jgzt='1' then '完工' else '已开工' end) jzzt"
		        +" from jhsh_sjgz jh,"
		        +" cbsj_sjgz cb,"
		        +" kxxyj_sjgz kx,"
		        +" lxsh_sjgz l,"
		        +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
		        +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,sum(decode(substr(xmid,11,1),'1',(nvl(jhyilc,0)+nvl(jherlc,0)+nvl(jhsanlc,0)+nvl(jhsilc,0)+nvl(jhdwlc,0)+nvl(jhwllc,0)),(nvl(yilc,0)+nvl(erlc,0)+nvl(sanlc,0)+nvl(silc,0)+nvl(dwlc,0)+nvl(wllc,0)))) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
		        +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
		       +" from lxsh_lx where jdbs='2' group by xmid) lx,"
		       +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
		       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_gcgzsj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
		        +" (select g.jhid,sum(g.bywctze) ztz,sum(g.zycgs) zycgs,"
		       +" sum(g.bywctze) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji"
		       +"  from gcgl_gcgzsj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(sbyf,instr(sbyf,'-')+1))<=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by g.jhid) jz1,"
		       +" (select g.jhid,sum(g.bywctze) ztz,sum(g.bywctze) wctze,sum(g.bywcmc) bywcmc from gcgl_gcgzsj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(sbyf,instr(sbyf,'-')+1))=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by g.jhid) jz2,"
		       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_gcgzsj g group by g.jhid) jz3,"
		       +" (select g.jhid,sum(g.bywctze) ztz,sum(g.zycgs) zycgs,"
		      +"  sum(g.bywctze) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji"
		      +"   from gcgl_gcgzsj g where substr(sbyf,0,4)<=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz4,sgt_sjgz sgt,"
		      +"(select jhid,sum(c.pfztz) ztz,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(tbyf,instr(tbyf,'-')+1))<=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by c.jhid) cgs,"
		      +"(select jhid,sum(c.pfztz) ztz,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf,0,4)<=substr('"+gcglabgc.getSbyf()+"',0,4) group by c.jhid) cgs1"
		      +"  where jh.xmbm=cgs.jhid(+) and jh.xmbm=cgs1.jhid(+) and jh.xmbm=cb.xmbm and jh.xmbm = sgt.xmbm(+) and jh.xmbm=kx.xmbm and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+)  and jh.xdzt='1'      "
		+" union all"	
				
				+" select "
		        +" jh.xmbm v_1,xzqhmc v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,substr(cb.xmbm,0,4) v_7,"
		        +" lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,sgt.lc v_15,sgt.qdzh v_16,sgt.zdzh v_17,jh.pfztz v_18,jh.bbzzj v_19,jh.gz v_20,jh.sz v_21,jh.zq v_22,jh.dk v_23,jh.jl v_24,jh.qt v_25,jh.dfzc v_26,jh.yhdk v_27,xd.bnjh v_28,xd.qzbtz v_29,jz.bndsslc v_30,"
		        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_31,(case when jh.jgzt='1' then '1' else '0' end) v_32,(case when jh.kgzt='0' then '1' else '0' end) v_33,"
		        +" jh.kgsj v_34,jh.wgsj v_35,cgs.ztz v_36,cgs.cgs v_37,cgs.gz v_38,cgs.sz v_39,cgs.zq v_40,cgs.dk v_41,cgs.jl v_42,cgs.qt v_43,cgs.dfzc v_44,cgs.yhdk v_45,jz1.xmwc v_46,decode(jh.pfztz,'0','0',null,'0',round((jz1.xmwc/jh.pfztz)*100),2) v_47,jz1.wcmc v_48,jz1.yiji v_49,"
		        +" jz1.erji v_50,jz1.sanji v_51,jz1.siji v_52,jz1.lq v_53,jz1.sn v_54,"
		        +" jz.ssdctc v_55,jz2.ztz v_56,jz2.bywcmc v_57,jz2.wctze v_58,cgs1.ztz v_59,cgs1.cgs v_60,cgs1.gz v_61,cgs1.sz v_62,cgs1.zq v_63,cgs1.dk v_64,cgs1.jl v_65,cgs1.qt v_66,cgs1.dfzc v_67,cgs1.yhdk v_68,jz4.xmwc v_69,jz4.wcmc v_70,jz4.yiji v_71,"
		        +" jz4.erji v_72,jz4.sanji v_73,jz4.siji v_74,jz4.lq v_75,jz4.sn v_76,"
		        +" jz3.ssdctc v_77,jz3.wkglc v_78,round(jz4.wcmc/lx.xmlc*100,0)||'%' v_79,decode(jh.bbzzj,'0','0%',null,'0%',round(jz4.zycgs/jh.bbzzj*100,0)||'%') v_80,round(jz4.ztz/jh.pfztz*100,0)||'%' v_81,l.bz v_82,lx.xzqhdm v_83,'路面改造' v_84,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm,(case when kgzt='0' then '未开工' when jgzt='1' then '完工' else '已开工' end) jzzt"
		        +" from jhsh_lmgz jh,"
		        +" cbsj_lmgz cb,"
		        +" kxxyj_lmgz kx,"
		        +" lxsh_lmgz l,"
		        +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
		        +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,sum(decode(substr(xmid,11,1),'1',(nvl(jhyilc,0)+nvl(jherlc,0)+nvl(jhsanlc,0)+nvl(jhsilc,0)+nvl(jhdwlc,0)+nvl(jhwllc,0)),(nvl(yilc,0)+nvl(erlc,0)+nvl(sanlc,0)+nvl(silc,0)+nvl(dwlc,0)+nvl(wllc,0)))) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
		        +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
		       +" from lxsh_lx where jdbs='2' group by xmid) lx,"
		       +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
		       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_gcgzgj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
		        +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
		       +" ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.dwgz) gz,sum(g.dwsz) sz"
		       +"  from gcgl_gcgzgj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(sbyf,instr(sbyf,'-')+1))<=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by g.jhid) jz1,"
		       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) wctze,sum(g.bywcmc) bywcmc from gcgl_gcgzgj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(sbyf,instr(sbyf,'-')+1))=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by g.jhid) jz2,"
		       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_gcgzgj g group by g.jhid) jz3,"
		       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
		      +"  ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.dwgz) gz,sum(g.dwsz) sz"
		      +"   from gcgl_gcgzgj g where substr(sbyf,0,4)<=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz4,sgt_lmgz sgt,"
		      +"(select jhid,sum(c.pfztz) ztz,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(tbyf,instr(tbyf,'-')+1))<=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by c.jhid) cgs,"
		      +"(select jhid,sum(c.pfztz) ztz,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf,0,4)<=substr('"+gcglabgc.getSbyf()+"',0,4) group by c.jhid) cgs1"
		      +"  where jh.xmbm=cgs.jhid(+) and jh.xmbm=cgs1.jhid(+) and jh.xmbm=cb.xmbm and jh.xmbm = sgt.xmbm(+) and jh.xmbm=kx.xmbm and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+)  and jh.xdzt='1'      "
		
				+" union all"
				
				+" select "
		        +" jh.xmbm v_1,xzqhmc v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,substr(cb.xmbm,0,4) v_7,"
		        +" lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,null v_15,null v_16,null v_17,jh.pfztz v_18,jh.bbzzj v_19,jh.gz v_20,jh.sz v_21,jh.zq v_22,jh.dk v_23,jh.jl v_24,jh.qt v_25,null v_26,null v_27,xd.bnjh v_28,xd.qzbtz v_29,jz.bndsslc v_30,"
		        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_31,(case when jh.jgzt='1' then '1' else '0' end) v_32,(case when jh.kgzt='0' then '1' else '0' end) v_33,"
		        +" jh.sjkgsj v_34,jh.sjwgsj v_35,cgs.ztz v_36,cgs.cgs v_37,cgs.gz v_38,cgs.sz v_39,cgs.zq v_40,cgs.dk v_41,cgs.jl v_42,cgs.qt v_43,cgs.dfzc v_44,cgs.yhdk v_45,jz1.xmwc v_46,decode(jh.pfztz,'0','0',null,'0',round((jz1.xmwc/jh.pfztz)*100),2) v_47,jz1.wcmc v_48,jz1.yiji v_49,"
		        +" jz1.erji v_50,jz1.sanji v_51,jz1.siji v_52,jz1.lq v_53,jz1.sn v_54,"
		        +" jz.ssdctc v_55,jz2.ztz v_56,jz2.bywcmc v_57,jz2.wctze v_58,cgs1.ztz v_59,cgs1.cgs v_60,cgs1.gz v_61,cgs1.sz v_62,cgs1.zq v_63,cgs1.dk v_64,cgs1.jl v_65,cgs1.qt v_66,cgs1.dfzc v_67,cgs1.yhdk v_68,jz4.xmwc v_69,jz4.wcmc v_70,jz4.yiji v_71,"
		        +" jz4.erji v_72,jz4.sanji v_73,jz4.siji v_74,jz4.lq v_75,jz4.sn v_76,"
		        +" jz3.ssdctc v_77,jz3.wkglc v_78,round(jz4.wcmc/lx.xmlc*100,0)||'%' v_79,decode(jh.bbzzj,'0','0%',null,'0%',round(jz4.zycgs/jh.bbzzj*100,0)||'%') v_80,round(jz4.ztz/jh.pfztz*100,0)||'%' v_81,l.bz v_82,lx.xzqhdm v_83,'灾毁重建' v_84,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm,(case when kgzt='0' then '未开工' when jgzt='1' then '完工' else '已开工' end) jzzt"
		        +" from jhsh_sh jh,"
		        +" cbsj_sh cb,"
		        +" kxxyj_sh kx,"
		        +" xmsq_sh l,"
		        +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
		        +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,sum(decode(substr(xmid,11,1),'1',(nvl(jhyilc,0)+nvl(jherlc,0)+nvl(jhsanlc,0)+nvl(jhsilc,0)+nvl(jhdwlc,0)+nvl(jhwllc,0)),(nvl(yilc,0)+nvl(erlc,0)+nvl(sanlc,0)+nvl(silc,0)+nvl(dwlc,0)+nvl(wllc,0)))) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
		        +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
		       +" from lxsh_lx where jdbs='2' group by xmid) lx,"
		       +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
		       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_sh g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
		        +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
		       +" ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.dwgz) gz,sum(g.dwsz) sz"
		       +"  from gcgl_sh g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(sbyf,instr(sbyf,'-')+1))<=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by g.jhid) jz1,"
		       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) wctze,sum(g.bywcmc) bywcmc from gcgl_sh g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(sbyf,instr(sbyf,'-')+1))=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by g.jhid) jz2,"
		       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_sh g group by g.jhid) jz3,"
		       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
		      +"  ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.dwgz) gz,sum(g.dwsz) sz"
		      +"   from gcgl_sh g where substr(sbyf,0,4)<=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz4,"
		      +"(select jhid,sum(c.pfztz) ztz,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) and to_number(substr(tbyf,instr(tbyf,'-')+1))<=to_number(substr('"+gcglabgc.getSbyf()+"',instr('"+gcglabgc.getSbyf()+"','-')+1)) group by c.jhid) cgs,"
		      +"(select jhid,sum(c.pfztz) ztz,sum(c.cgsdwzj) cgs,sum(c.gz) gz,sum(c.sz) sz,sum(c.zq) zq,sum(c.dk) dk,sum(c.jl) jl,sum(c.qt) qt,sum(c.dfzc) dfzc,sum(c.yhdk) yhdk from gcgl_cgs c where substr(c.tbyf,0,4)<=substr('"+gcglabgc.getSbyf()+"',0,4) group by c.jhid) cgs1"
		      +"  where jh.xmbm=cgs.jhid(+) and jh.xmbm=cgs1.jhid(+) and jh.xmbm=cb.xmbm and jh.xmbm=kx.xmbm(+) and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+)  and jh.xdzt='1'      "
		;		
	
				
   /*   
      
      +" union all"
+" select "
        +" jh.xmbm v_1,(select name from xtgl_xzqh where id=lx.xzqhdm) v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,substr(cb.xmbm,0,4) v_7,"
       +" lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,sgt.lc v_15,sgt.qdzh v_16,sgt.zdzh v_17,jh.pfztz v_18,jh.bbzzj v_19,(jh.pfztz-jh.bbzzj) v_20,xd.bnjh v_21,xd.qzbtz v_22,jz.bndsslc v_23,"
        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_24,(case when jh.jgzt='1' then '1' else '0' end) v_25,(case when jh.kgzt='0' then '1' else '0' end) v_26,"
       +" jh.kgsj v_27,jh.wgsj v_28,jz1.ztz v_29,jz1.zycgs v_30,jz1.dfbz v_31,jz1.yhdk v_32,jz1.gz v_33,jz1.sz v_34,to_char(jz1.sttx) v_35,jz1.qttz v_36,jz1.xmwc v_37,decode(jh.pfztz,'0','0',null,'0',round((jz1.xmwc/jh.pfztz)*100),2) v_38,jz1.wcmc v_39,jz1.yiji v_40,"
       +" jz1.erji v_41,jz1.sanji v_42,jz1.siji v_43,jz1.lq v_44,jz1.sn v_45,"
       +" jz.ssdctc v_46,jz2.ztz v_47,jz2.bywcmc v_48,jz2.wctze v_49,jz4.ztz v_50,jz4.zycgs v_51,jz4.dfbz v_52,jz4.yhdk v_53,jz4.gz v_54,jz4.sz v_55,to_char(jz4.sttx) v_56,jz4.qttz v_57,jz4.xmwc v_58,jz4.wcmc v_59,jz4.yiji v_60,"
       +" jz4.erji v_61,jz4.sanji v_62,jz4.siji v_63,jz4.lq v_64,jz4.sn v_65,"
       +" jz3.ssdctc v_66,jz3.wkglc v_67,round(jz4.wcmc/lx.xmlc*100,0)||'%' v_68,decode(jh.bbzzj,'0','0%',null,'0%',round(jz4.zycgs/jh.bbzzj*100,0)||'%') v_69,round(jz4.ztz/jh.pfztz*100,0)||'%' v_70,l.bz v_71,lx.xzqhdm v_72,'改建' v_73,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm,(case when kgzt='0' then '未开工' when jgzt='1' then '完工' else '已开工' end) jzzt"
        +" from jhsh_sjgz jh,"
       +" cbsj_sjgz cb,"
       +" kxxyj_sjgz kx,"
       +" lxsh_sjgz l,"
       +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
       +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,SUM(lc) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
       +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
       +" from lxsh_lx where jdbs='2' group by xmid) lx,"
       +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
        +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_gcgzsj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
       +" (select g.jhid,(sum(g.zycgs)+sum(g.yhdk)+sum(g.gz)+sum(g.sz)+sum(g.qtzj)) ztz,sum(g.zycgs) zycgs,(sum(g.yhdk)+sum(g.gz)+sum(g.sz)) dfbz,sum(g.yhdk) yhdk,"
       +" sum(g.sttxdk) sttx,sum(g.qtzj) qttz,sum(g.bywctze) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.gz) gz,sum(g.sz) sz"
       +"  from gcgl_gcgzsj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz1,"
       +" (select g.jhid,(sum(g.zycgs)+sum(g.yhdk)+sum(g.gz)+sum(g.sz)+sum(g.qtzj)) ztz,sum(g.bywctze) wctze,sum(g.bywcmc) bywcmc from gcgl_gcgzsj g where sbyf='"+gcglabgc.getSbyf()+"' group by g.jhid) jz2,"
       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_gcgzsj g group by g.jhid) jz3,"
       +" (select g.jhid,(sum(g.zycgs)+sum(g.yhdk)+sum(g.gz)+sum(g.sz)+sum(g.qtzj)) ztz,sum(g.zycgs) zycgs,(sum(g.yhdk)+sum(g.gz)+sum(g.sz)) dfbz,sum(g.yhdk) yhdk,"
       +" sum(g.sttxdk) sttx,sum(g.qtzj) qttz,sum(g.bywctze) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.gz) gz,sum(g.sz) sz"
        +" from gcgl_gcgzsj g group by g.jhid) jz4,sgt_sjgz sgt"
        +" where jh.xmbm=cb.xmbm and jh.xmbm = sgt.xmbm(+) and jh.xmbm=kx.xmbm and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+) and jh.xdzt='1' "
+" union all"
+" select "
       +" jh.xmbm v_1,(select name from xtgl_xzqh where id=lx.xzqhdm) v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,substr(cb.xmbm,0,4) v_7,"
        +" lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,sgt.lc v_15,sgt.qdzh v_16,sgt.zdzh v_17,jh.pfztz v_18,jh.bbzzj v_19,(jh.pfztz-jh.bbzzj) v_20,xd.bnjh v_21,xd.qzbtz v_22,jz.bndsslc v_23,"
        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_24,(case when jh.jgzt='1' then '1' else '0' end) v_25,(case when jh.kgzt='0' then '1' else '0' end) v_26,"
        +" jh.kgsj v_27,jh.wgsj v_28,jz1.ztz v_29,jz1.zycgs v_30,jz1.dfbz v_31,jz1.yhdk v_32,jz1.gz v_33,jz1.sz v_34,jz1.sttx v_35,jz1.qttz v_36,jz1.xmwc v_37,decode(jh.pfztz,'0','0',null,'0',round((jz1.xmwc/jh.pfztz)*100),2) v_38,jz1.wcmc v_39,jz1.yiji v_40,"
       +" jz1.erji v_41,jz1.sanji v_42,jz1.siji v_43,jz1.lq v_44,jz1.sn v_45,"
       +" jz.ssdctc v_46,jz2.ztz v_47,jz2.bywcmc v_48,jz2.wctze v_49,jz4.ztz v_50,jz4.zycgs v_51,jz4.dfbz v_52,jz4.yhdk v_53,jz4.gz v_54,jz4.sz v_55,jz4.sttx v_56,jz4.qttz v_57,jz4.xmwc v_58,jz4.wcmc v_59,jz4.yiji v_60,"
       +" jz4.erji v_61,jz4.sanji v_62,jz4.siji v_63,jz4.lq v_64,jz4.sn v_65,"
      +"  jz3.ssdctc v_66,jz3.wkglc v_67,round(jz4.wcmc/lx.xmlc*100,0)||'%' v_68,decode(jh.bbzzj,'0','0%',null,'0%',round(jz4.zycgs/jh.bbzzj*100,0)||'%') v_69,round(jz4.ztz/jh.pfztz*100,0)||'%' v_70,l.bz v_71,lx.xzqhdm v_72,'路面改造' v_73,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm,(case when kgzt='0' then '未开工' when jgzt='1' then '完工' else '已开工' end) jzzt"
       +" from jhsh_lmgz jh,"
       +" cbsj_lmgz cb,"
       +" kxxyj_lmgz kx,"
        +" lxsh_lmgz l,"
        +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
       +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,SUM(lc) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
       +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
        +" from lxsh_lx where jdbs='2' group by xmid) lx,"
        +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_gcgzgj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
       +" ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.dwgz) gz,sum(g.dwsz) sz"
       +"  from gcgl_gcgzgj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz1,"
       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) wctze,sum(g.bywcmc) bywcmc from gcgl_gcgzgj g where sbyf='"+gcglabgc.getSbyf()+"' group by g.jhid) jz2,"
       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_gcgzgj g group by g.jhid) jz3,"
      +"  (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
      +"  ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.dwgz) gz,sum(g.dwsz) sz"
      +"   from gcgl_gcgzgj g group by g.jhid) jz4,sgt_lmgz sgt"
        +" where jh.xmbm=cb.xmbm and jh.xmbm = sgt.xmbm(+) and jh.xmbm=kx.xmbm and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+) and jh.xdzt='1' "
        
+" union all"
+" select "
        +" jh.xmbm v_1,(select name from xtgl_xzqh where id=lx.xzqhdm) v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,l.tsdq v_4,lx.lxbm v_5,jh.xmmc v_6,substr(cb.xmbm,0,4) v_7,"
        +" lx.xzdj v_8,lx.qdzh v_9,lx.zdzh v_10,lx.yjsdj v_11,lx.jsjsdj v_12,cb.jsxz v_13,lx.xmlc v_14,null v_15,null v_16,null v_17,jh.pfztz v_18,jh.bbzzj v_19,(jh.pfztz-jh.bbzzj) v_20,xd.bnjh v_21,xd.qzbtz v_22,jz.bndsslc v_23,"
        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_24,(case when jh.jgzt='1' then '1' else '0' end) v_25,(case when jh.kgzt='0' then '1' else '0' end) v_26,"
        +" cb.kgsj v_27,cb.wgsj v_28,jz1.ztz v_29,jz1.zycgs v_30,jz1.dfbz v_31,jz1.yhdk v_32,jz1.gz v_33,jz1.sz v_34,jz1.sttx v_35,jz1.qttz v_36,jz1.xmwc v_37,'0' v_38,jz1.wcmc v_39,jz1.yiji v_40,"
        +" jz1.erji v_41,jz1.sanji v_42,jz1.siji v_43,jz1.lq v_44,jz1.sn v_45,"
        +" jz.ssdctc v_46,jz2.ztz v_47,jz2.bywcmc v_48,jz2.wctze v_49,jz4.ztz v_50,jz4.zycgs v_51,jz4.dfbz v_52,jz4.yhdk v_53,jz4.gz v_54,jz4.sz v_55,jz4.sttx v_56,jz4.qttz v_57,jz4.xmwc v_58,jz4.wcmc v_59,jz4.yiji v_60,"
        +" jz4.erji v_61,jz4.sanji v_62,jz4.siji v_63,jz4.lq v_64,jz4.sn v_65,"
        +" jz3.ssdctc v_66,jz3.wkglc v_67,decode(lx.xmlc,'0','0',null,'0',round(jz4.wcmc/lx.xmlc*100,0))||'%' v_68,decode(jh.bbzzj,'0','0',null,'0',round(jz4.zycgs/jh.bbzzj*100,0))||'%' v_69,decode(jh.pfztz,'0','0',null,'0',round(jz4.ztz/jh.pfztz*100,0))||'%' v_70,l.bz v_71,lx.xzqhdm v_72,'灾毁重建' v_73,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm,(case when kgzt='0' then '未开工' when jgzt='1' then '完工' else '已开工' end) jzzt"
        +" from jhsh_sh jh,"
        +" cbsj_sh cb,"
        +" xmsq_sh l,"
        +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(distinct to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
        +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,SUM(lc) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(distinct to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
        +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
        +" from lxsh_lx where jdbs='2' group by xmid) lx,"
        +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
        +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_sh g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
        +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
        +" ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.dwgz) gz,sum(g.dwsz) sz"
        +" from gcgl_sh g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz1,"
        +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) wctze,sum(g.bywcmc) bywcmc from gcgl_sh g where sbyf='"+gcglabgc.getSbyf()+"' group by g.jhid) jz2,"
        +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_sh g group by g.jhid) jz3,"
       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
       +" ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,sum(lqlmwcqk) lq,sum(snlmwcqk) sn,sum(yiji) yiji,sum(erji) erji,sum(sanji) sanji,sum(siji) siji,sum(g.dwgz) gz,sum(g.dwsz) sz"
       +"  from gcgl_sh g group by g.jhid) jz4"
        +" where jh.xmbm=cb.xmbm and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+) and jh.xdzt='1' ";
*/

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
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("ZJWCZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("ZJWCZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("ZJWCZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("ZJWCZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("ZJWCZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("ZJWCZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("ZJWCZ").toString());
					
				}
				list.add(el);
			}
			if(i==1){
				Excel_list el=new Excel_list();
				el.setV_0("总计");el.setV_1("总计");el.setV_2("完成工程量");el.setV_3("单位2");el.setV_4("2");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("ZJWCYM").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("ZJWCYM").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("ZJWCYM").toString());
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
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("ZJWCZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("ZJWCZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("ZJWCZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("ZJWCZTZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("ZJWCZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("ZJWCZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("ZJWCZTZ").toString());
					
				}
				list.add(el);
			}
			if(i==3){
				Excel_list el=new Excel_list();
				el.setV_0("总计");el.setV_1("总计");el.setV_2("完成投资（万元）");el.setV_3("中央投资");el.setV_4("4");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("ZJWCBTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("ZJWCBTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("ZJWCBTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("ZJWCBTZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("ZJWCBTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("ZJWCBTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("ZJWCBTZ").toString());
					
				}
				list.add(el);
			}
			if(i==4){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("计划下达工程量");el.setV_3("单位1");el.setV_4("5");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPXDZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPXDZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPXDZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPXDZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPXDZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPXDZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPXDZ").toString());
					
				}list.add(el);
			}
			if(i==5){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("计划下达工程量");el.setV_3("单位2");el.setV_4("6");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPXDYM").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPXDYM").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPXDYM").toString());
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
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==7){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("完成工程量");el.setV_3("单位2");el.setV_4("8");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCYM").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCYM").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCYM").toString());
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
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPZTZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPZTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==9){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("计划下达资金量（万元）");el.setV_3("中央投资");el.setV_4("10");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPBTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPBTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPBTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPBTZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPBTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPBTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPBTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==10){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("计划下达资金量（万元）");el.setV_3("地方自筹");el.setV_4("11");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPDFZC").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPDFZC").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPDFZC").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPDFZC").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPDFZC").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPDFZC").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPDFZC").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==11){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("完成投资（万元）");el.setV_3("总投资");el.setV_4("12");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCZTZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCZTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==12){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("完成投资（万元）");el.setV_3("部投资");el.setV_4("13");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCBTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCBTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCBTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCBTZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCBTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCBTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCBTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==13){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1("其中："+xmnf+"年计划安排");el.setV_2("完成投资（万元）");el.setV_3("地方自筹");el.setV_4("14");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCDFZC").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCDFZC").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCDFZC").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCDFZC").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCDFZC").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCDFZC").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCDFZC").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==14){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1(xmnf+"年完成的跨年度计划项目");el.setV_2("完成工程量");el.setV_3("单位1");el.setV_4("15");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCKNZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCKNZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCKNZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCKNZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCKNZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCKNZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCKNZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==15){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1(xmnf+"年完成的跨年度计划项目");el.setV_2("完成工程量");el.setV_3("单位2");el.setV_4("16");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCKNYM").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCKNYM").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCKNYM").toString());
					/*if("4".equals(map.get("XH").toString()))
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
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCKNZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCKNZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCKNZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCKNZTZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCKNZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCKNZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCKNZTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==17){
				Excel_list el=new Excel_list();
				el.setV_0("车购税安排项目");el.setV_1(xmnf+"年完成的跨年度计划项目");el.setV_2("完成投资（万元）");el.setV_3("中央投资");el.setV_4("18");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("BAPWCKNBTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("BAPWCKNBTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("BAPWCKNBTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("BAPWCKNBTZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("BAPWCKNBTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("BAPWCKNBTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("BAPWCKNBTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==18){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1("其中："+xmnf+"年投资项目");el.setV_2("完成工程量");el.setV_3("单位1");el.setV_4("19");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("SAPWCZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("SAPWCZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("SAPWCZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("SAPWCZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==19){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1("其中："+xmnf+"年投资项目");el.setV_2("完成工程量");el.setV_3("单位2");el.setV_4("20");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("SAPWCYM").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("SAPWCYM").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("SAPWCYM").toString());
					/*if("4".equals(map.get("XH").toString()))
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
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("SAPWCZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("SAPWCZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("SAPWCZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("SAPWCZTZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCZTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==20){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1(xmnf+"年完成的跨年度项目");el.setV_2("完成工程量");el.setV_3("单位1");el.setV_4("22");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("SAPWCKNZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("SAPWCKNZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("SAPWCKNZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("SAPWCKNZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCKNZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCKNZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCKNZ").toString());
					//list.add(el);
				}list.add(el);
			}
			if(i==21){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1(xmnf+"年完成的跨年度项目");el.setV_2("完成工程量");el.setV_3("单位2");el.setV_4("23");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("SAPWCKNYM").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("SAPWCKNYM").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("SAPWCKNYM").toString());
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
			if(i==22){
				Excel_list el=new Excel_list();
				el.setV_0("省内自行安排");el.setV_1(xmnf+"年完成的跨年度项目");el.setV_2("完成投资（万元）");el.setV_3("完成投资（万元）");el.setV_4("24");
				for (Map<String, Object> map : l) {
					if("1".equals(map.get("XH").toString()))
						el.setV_5(map.get("SAPWCKNZTZ").toString());
					if("2".equals(map.get("XH").toString()))
						el.setV_6(map.get("SAPWCKNZTZ").toString());
					if("3".equals(map.get("XH").toString()))
						el.setV_7(map.get("SAPWCKNZTZ").toString());
					if("4".equals(map.get("XH").toString()))
						el.setV_8(map.get("SAPWCKNZTZ").toString());
					if("5".equals(map.get("XH").toString()))
						el.setV_9(map.get("SAPWCKNZTZ").toString());
					if("6".equals(map.get("XH").toString()))
						el.setV_10(map.get("SAPWCKNZTZ").toString());
					if("7".equals(map.get("XH").toString()))
						el.setV_11(map.get("SAPWCKNZTZ").toString());
					//list.add(el);
				}list.add(el);
			}
			
		}
		
		return list;
	}
}
