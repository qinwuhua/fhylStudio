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
        +" jh.xmbm v_1,(select name from xtgl_xzqh where id=lx.xzqhdm) v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,lx.lxbm||'  '||jh.xmmc v_4,substr(cb.xmbm,0,4) v_5,"
        +" lx.xzdj v_6,lx.qdzh v_7,lx.zdzh v_8,lx.yjsdj v_9,lx.jsjsdj v_10,cb.jsxz v_11,lx.xmlc v_12,jh.pfztz v_13,jh.bbzzj v_14,(jh.pfztz-jh.bbzzj) v_15,xd.bnjh v_16,xd.qzbtz v_17,jz.bndsslc v_18,"
        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_19,(case when jh.jgzt='1' then '1' else '0' end) v_20,(case when jh.kgzt='0' then '1' else '0' end) v_21,"
        +" jh.kgsj v_22,jh.wgsj v_23,jz1.ztz v_24,jz1.zycgs v_25,jz1.dfbz v_26,jz1.yhdk v_27,jz1.gz v_28,jz1.sz v_29,jz1.sttx v_30,jz1.qttz v_31,jz1.xmwc v_32,decode(jh.pfztz,'0','0',null,'0',round((jz1.xmwc/jh.pfztz)*100),2) v_33,jz1.wcmc v_34,decode(l.jsjsdj,'一级',jz1.wcmc,'0') v_35,"
        +" decode(l.jsjsdj,'二级',jz1.wcmc,'0') v_36,decode(l.jsjsdj,'三级',jz1.wcmc,'0') v_37,decode(l.jsjsdj,'四级',jz1.wcmc,'0') v_38,jz1.lq v_39,jz1.sn v_40,"
        +" jz.ssdctc v_41,jz2.ztz v_42,jz2.bywcmc v_43,jz2.wctze v_44,jz4.ztz v_45,jz4.zycgs v_46,jz4.dfbz v_47,jz4.yhdk v_48,jz4.gz v_49,jz4.sz v_50,jz4.sttx v_51,jz4.qttz v_52,jz4.xmwc v_53,jz4.wcmc v_54,decode(l.jsjsdj,'一级',jz4.wcmc,'0') v_55,"
        +" decode(l.jsjsdj,'二级',jz4.wcmc,'0') v_56,decode(l.jsjsdj,'三级',jz4.wcmc,'0') v_57,decode(l.jsjsdj,'四级',jz4.wcmc,'0') v_58,jz4.lq v_59,jz4.sn v_60,"
        +" jz3.ssdctc v_61,jz3.wkglc v_62,round(jz4.wcmc/lx.xmlc*100,0)||'%' v_63,round(jz4.zycgs/jh.bbzzj*100,0)||'%' v_64,round(jz4.ztz/jh.pfztz*100,0)||'%' v_65,l.bz v_66,lx.xzqhdm v_67,'新建' v_68,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm"
        +" from jhsh_xj jh,"
        +" cbsj_xj cb,"
        +" kxxyj_xj kx,"
        +" lxsh_xj l,"
        +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
        +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,SUM(lc) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
        +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
       +" from lxsh_lx where jdbs='2' group by xmid) lx,"
       +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_xj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
        +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
       +" ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,' ' lq,' ' sn,sum(g.dwgz) gz,sum(g.dwsz) sz"
       +"  from gcgl_xj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz1,"
       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) wctze,sum(g.bywcmc) bywcmc from gcgl_xj g where sbyf='"+gcglabgc.getSbyf()+"' group by g.jhid) jz2,"
       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_xj g group by g.jhid) jz3,"
       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
      +"  ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,' ' lq,' ' sn,sum(g.dwgz) gz,sum(g.dwsz) sz"
      +"   from gcgl_xj g group by g.jhid) jz4"
      +"  where jh.xmbm=cb.xmbm and jh.xmbm=kx.xmbm and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+)  and jh.xdzt='1'      "
+" union all"
+" select "
        +" jh.xmbm v_1,(select name from xtgl_xzqh where id=lx.xzqhdm) v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,lx.lxbm||'  '||jh.xmmc v_4,substr(cb.xmbm,0,4) v_5,"
       +" lx.xzdj v_6,lx.qdzh v_7,lx.zdzh v_8,lx.yjsdj v_9,lx.jsjsdj v_10,cb.jsxz v_11,lx.xmlc v_12,jh.pfztz v_13,jh.bbzzj v_14,(jh.pfztz-jh.bbzzj) v_15,xd.bnjh v_16,xd.qzbtz v_17,jz.bndsslc v_18,"
        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_19,(case when jh.jgzt='1' then '1' else '0' end) v_20,(case when jh.kgzt='0' then '1' else '0' end) v_21,"
       +" jh.kgsj v_22,jh.wgsj v_23,jz1.ztz v_24,jz1.zycgs v_25,jz1.dfbz v_26,jz1.yhdk v_27,jz1.gz v_28,jz1.sz v_29,to_char(jz1.sttx) v_30,jz1.qttz v_31,jz1.xmwc v_32,decode(jh.pfztz,'0','0',null,'0',round((jz1.xmwc/jh.pfztz)*100),2) v_33,jz1.wcmc v_34,decode(l.jsjsdj,'一级',jz1.wcmc,'0') v_35,"
       +" decode(l.jsjsdj,'二级',jz1.wcmc,'0') v_36,decode(l.jsjsdj,'三级',jz1.wcmc,'0') v_37,decode(l.jsjsdj,'四级',jz1.wcmc,'0') v_38,jz1.lq v_39,jz1.sn v_40,"
       +" jz.ssdctc v_41,jz2.ztz v_42,jz2.bywcmc v_43,jz2.wctze v_44,jz4.ztz v_45,jz4.zycgs v_46,jz4.dfbz v_47,jz4.yhdk v_48,jz4.gz v_49,jz4.sz v_50,to_char(jz4.sttx) v_51,jz4.qttz v_52,jz4.xmwc v_53,jz4.wcmc v_54,decode(l.jsjsdj,'一级',jz4.wcmc,'0') v_55,"
       +" decode(l.jsjsdj,'二级',jz4.wcmc,'0') v_56,decode(l.jsjsdj,'三级',jz4.wcmc,'0') v_57,decode(l.jsjsdj,'四级',jz4.wcmc,'0') v_58,jz4.lq v_59,jz4.sn v_60,"
       +" jz3.ssdctc v_61,jz3.wkglc v_62,round(jz4.wcmc/lx.xmlc*100,0)||'%' v_63,round(jz4.zycgs/jh.bbzzj*100,0)||'%' v_64,round(jz4.ztz/jh.pfztz*100,0)||'%' v_65,l.bz v_66,lx.xzqhdm v_67,'改建' v_68,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm"
        +" from jhsh_sjgz jh,"
       +" cbsj_sjgz cb,"
       +" kxxyj_sjgz kx,"
       +" lxsh_sjgz l,"
       +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
       +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,SUM(lc) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
       +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
       +" from lxsh_lx where jdbs='2' group by xmid) lx,"
       +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
        +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_gcgzsj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
       +" (select g.jhid,(sum(g.zycgs)+sum(g.yhdk)+sum(g.gz)+sum(g.sz)+sum(g.qtzj)) ztz,sum(g.zycgs) zycgs,(sum(g.yhdk)+sum(g.gz)+sum(g.sz)) dfbz,sum(g.yhdk) yhdk,"
       +" sum(g.sttxdk) sttx,sum(g.qtzj) qttz,sum(g.bywctze) xmwc,sum(g.bywcmc) wcmc,' ' lq,' ' sn,sum(g.gz) gz,sum(g.sz) sz"
       +"  from gcgl_gcgzsj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz1,"
       +" (select g.jhid,(sum(g.zycgs)+sum(g.yhdk)+sum(g.gz)+sum(g.sz)+sum(g.qtzj)) ztz,sum(g.bywctze) wctze,sum(g.bywcmc) bywcmc from gcgl_gcgzsj g where sbyf='"+gcglabgc.getSbyf()+"' group by g.jhid) jz2,"
       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_gcgzsj g group by g.jhid) jz3,"
       +" (select g.jhid,(sum(g.zycgs)+sum(g.yhdk)+sum(g.gz)+sum(g.sz)+sum(g.qtzj)) ztz,sum(g.zycgs) zycgs,(sum(g.yhdk)+sum(g.gz)+sum(g.sz)) dfbz,sum(g.yhdk) yhdk,"
       +" sum(g.sttxdk) sttx,sum(g.qtzj) qttz,sum(g.bywctze) xmwc,sum(g.bywcmc) wcmc,' ' lq,' ' sn,sum(g.gz) gz,sum(g.sz) sz"
        +" from gcgl_gcgzsj g group by g.jhid) jz4"
        +" where jh.xmbm=cb.xmbm and jh.xmbm=kx.xmbm and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+) and jh.xdzt='1' "
+" union all"
+" select "
       +" jh.xmbm v_1,(select name from xtgl_xzqh where id=lx.xzqhdm) v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,lx.lxbm||'  '||jh.xmmc v_4,substr(cb.xmbm,0,4) v_5,"
        +" lx.xzdj v_6,lx.qdzh v_7,lx.zdzh v_8,lx.yjsdj v_9,lx.jsjsdj v_10,cb.jsxz v_11,lx.xmlc v_12,jh.pfztz v_13,jh.bbzzj v_14,(jh.pfztz-jh.bbzzj) v_15,xd.bnjh v_16,xd.qzbtz v_17,jz.bndsslc v_18,"
        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_19,(case when jh.jgzt='1' then '1' else '0' end) v_20,(case when jh.kgzt='0' then '1' else '0' end) v_21,"
        +" jh.kgsj v_22,jh.wgsj v_23,jz1.ztz v_24,jz1.zycgs v_25,jz1.dfbz v_26,jz1.yhdk v_27,jz1.gz v_28,jz1.sz v_29,jz1.sttx v_30,jz1.qttz v_31,jz1.xmwc v_32,decode(jh.pfztz,'0','0',null,'0',round((jz1.xmwc/jh.pfztz)*100),2) v_33,jz1.wcmc v_34,decode(l.jsjsdj,'一级',jz1.wcmc,'0') v_35,"
       +" decode(l.jsjsdj,'二级',jz1.wcmc,'0') v_36,decode(l.jsjsdj,'三级',jz1.wcmc,'0') v_37,decode(l.jsjsdj,'四级',jz1.wcmc,'0') v_38,jz1.lq v_39,jz1.sn v_40,"
       +" jz.ssdctc v_41,jz2.ztz v_42,jz2.bywcmc v_43,jz2.wctze v_44,jz4.ztz v_45,jz4.zycgs v_46,jz4.dfbz v_47,jz4.yhdk v_48,jz4.gz v_49,jz4.sz v_50,jz4.sttx v_51,jz4.qttz v_52,jz4.xmwc v_53,jz4.wcmc v_54,decode(l.jsjsdj,'一级',jz4.wcmc,'0') v_55,"
       +" decode(l.jsjsdj,'二级',jz4.wcmc,'0') v_56,decode(l.jsjsdj,'三级',jz4.wcmc,'0') v_57,decode(l.jsjsdj,'四级',jz4.wcmc,'0') v_58,jz4.lq v_59,jz4.sn v_60,"
      +"  jz3.ssdctc v_61,jz3.wkglc v_62,round(jz4.wcmc/lx.xmlc*100,0)||'%' v_63,round(jz4.zycgs/jh.bbzzj*100,0)||'%' v_64,round(jz4.ztz/jh.pfztz*100,0)||'%' v_65,l.bz v_66,lx.xzqhdm v_67,'路面改造' v_68,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm"
       +" from jhsh_lmgz jh,"
       +" cbsj_lmgz cb,"
       +" kxxyj_lmgz kx,"
        +" lxsh_lmgz l,"
        +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
       +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,SUM(lc) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
       +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
        +" from lxsh_lx where jdbs='2' group by xmid) lx,"
        +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_gcgzgj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
       +" ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,' ' lq,' ' sn,sum(g.dwgz) gz,sum(g.dwsz) sz"
       +"  from gcgl_gcgzgj g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz1,"
       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) wctze,sum(g.bywcmc) bywcmc from gcgl_gcgzgj g where sbyf='"+gcglabgc.getSbyf()+"' group by g.jhid) jz2,"
       +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_gcgzgj g group by g.jhid) jz3,"
      +"  (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
      +"  ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,' ' lq,' ' sn,sum(g.dwgz) gz,sum(g.dwsz) sz"
      +"   from gcgl_gcgzgj g group by g.jhid) jz4"
        +" where jh.xmbm=cb.xmbm and jh.xmbm=kx.xmbm and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+) and jh.xdzt='1' "
        
+" union all"
+" select "
        +" jh.xmbm v_1,(select name from xtgl_xzqh where id=lx.xzqhdm) v_2,substr(instr(xzqhmc, '市'),length(xzqhmc)) v_3,lx.lxbm||'  '||jh.xmmc v_4,substr(cb.xmbm,0,4) v_5,"
        +" lx.xzdj v_6,lx.qdzh v_7,lx.zdzh v_8,lx.yjsdj v_9,lx.jsjsdj v_10,cb.jsxz v_11,lx.xmlc v_12,jh.pfztz v_13,jh.bbzzj v_14,(jh.pfztz-jh.bbzzj) v_15,xd.bnjh v_16,xd.qzbtz v_17,jz.bndsslc v_18,"
        +" (case when jh.kgzt='1' and jh.jgzt='0' then '1' else '0' end) v_19,(case when jh.jgzt='1' then '1' else '0' end) v_20,(case when jh.kgzt='0' then '1' else '0' end) v_21,"
        +" cb.kgsj v_22,cb.wgsj v_23,jz1.ztz v_24,jz1.zycgs v_25,jz1.dfbz v_26,jz1.yhdk v_27,jz1.gz v_28,jz1.sz v_29,jz1.sttx v_30,jz1.qttz v_31,jz1.xmwc v_32,'0' v_33,jz1.wcmc v_34,decode(l.jsdj,'一级',jz1.wcmc,'0') v_35,"
        +" decode(l.jsdj,'二级',jz1.wcmc,'0') v_36,decode(l.jsdj,'三级',jz1.wcmc,'0') v_37,decode(l.jsdj,'四级',jz1.wcmc,'0') v_38,jz1.lq v_39,jz1.sn v_40,"
        +" jz.ssdctc v_41,jz2.ztz v_42,jz2.bywcmc v_43,jz2.wctze v_44,jz4.ztz v_45,jz4.zycgs v_46,jz4.dfbz v_47,jz4.yhdk v_48,jz4.gz v_49,jz4.sz v_50,jz4.sttx v_51,jz4.qttz v_52,jz4.xmwc v_53,jz4.wcmc v_54,decode(l.jsdj,'一级',jz4.wcmc,'0') v_55,"
        +" decode(l.jsdj,'二级',jz4.wcmc,'0') v_56,decode(l.jsdj,'三级',jz4.wcmc,'0') v_57,decode(l.jsdj,'四级',jz4.wcmc,'0') v_58,jz4.lq v_59,jz4.sn v_60,"
        +" jz3.ssdctc v_61,jz3.wkglc v_62,decode(lx.xmlc,'0','0',null,'0',round(jz4.wcmc/lx.xmlc*100,0))||'%' v_63,decode(jh.bbzzj,'0','0',null,'0',round(jz4.zycgs/jh.bbzzj*100,0))||'%' v_64,decode(jh.pfztz,'0','0',null,'0',round(jz4.ztz/jh.pfztz*100,0))||'%' v_65,l.bz v_66,lx.xzqhdm v_67,'灾毁重建' v_68,lx.gydw gydw,lx.xzqhdm xzqh,lx.lxbm lxmc,substr(jh.xmbm,0,4) xmnf,lx.lxbm lxbm"
        +" from jhsh_sh jh,"
        +" cbsj_sh cb,"
        +" xmsq_sh l,"
        +" (select xmid jhid,min(xzqh) xzqhmc,min(gydwdm) gydw,min(xzqhdm) xzqhdm,replace(WMSYS.WM_CONCAT(to_char(QDZH)),',','、') QDZH,replace(WMSYS.WM_CONCAT(to_char(lxbm)),',','、') lxbm,replace(WMSYS.WM_CONCAT(to_char(lxmc)),',','、') lxmc,"
        +" replace(WMSYS.WM_CONCAT(to_char(ZDZH)),',','、') ZDZH,SUM(lc) xmlc,replace(WMSYS.WM_CONCAT(to_char(xjsdj)),',',',') yjsdj,replace(WMSYS.WM_CONCAT(to_char(jsjsdj)),',',',') jsjsdj,replace(WMSYS.WM_CONCAT(to_char(decode(substr(lxbm,0,1),'G','国道','S','省道','X','县道','Y','乡道','C','村道','Z','专道'))),',',',') xzdj,"
        +" replace(WMSYS.WM_CONCAT(to_char(substr(xzqh,instr(xzqh,'市')+1,length(xzqh)))),',','、') szxs"
        +" from lxsh_lx where jdbs='2' group by xmid) lx,"
        +" (select zj.xmid,sum(zj.xdzj) bnjh,sum(zj.btzzj) qzbtz from plan_zjxd zj where zj.xdnf=substr('"+gcglabgc.getSbyf()+"',0,4) group by zj.xmid) xd,"
        +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc from gcgl_sh g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz,"
        +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
        +" ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,' ' lq,' ' sn,sum(g.dwgz) gz,sum(g.dwsz) sz"
        +" from gcgl_sh g where substr(sbyf,0,4)=substr('"+gcglabgc.getSbyf()+"',0,4) group by g.jhid) jz1,"
        +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) wctze,sum(g.bywcmc) bywcmc from gcgl_sh g where sbyf='"+gcglabgc.getSbyf()+"' group by g.jhid) jz2,"
        +" (select g.jhid,max(g.bndsslc) bndsslc,max(g.ssdctc) ssdctc,min(g.wkglc) wkglc from gcgl_sh g group by g.jhid) jz3,"
       +" (select g.jhid,(sum(g.zjdw_btz)+sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)+sum(g.zjdw_qttz)) ztz,sum(g.zjdw_btz) zycgs,(sum(g.dwyhdk)+sum(g.dwgz)+sum(g.dwsz)) dfbz,sum(g.dwyhdk) yhdk,"
       +" ' 0' sttx,sum(g.zjdw_qttz) qttz,sum(g.wc_btz+g.yhdk+g.gz+g.sz+g.wc_qttz) xmwc,sum(g.bywcmc) wcmc,' ' lq,' ' sn,sum(g.dwgz) gz,sum(g.dwsz) sz"
       +"  from gcgl_sh g group by g.jhid) jz4"
        +" where jh.xmbm=cb.xmbm and jh.xmbm=l.xmbm and jh.xmbm=lx.jhid(+) and jh.xmbm=xd.xmid(+) and jh.xmbm=jz.jhid(+) and jh.xmbm=jz1.jhid(+) and jh.xmbm=jz2.jhid(+) and jh.xmbm=jz3.jhid(+) and jh.xmbm=jz4.jhid(+) and jh.xdzt='1' ";


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
				if(l2.get(i).getV_67().equals(l3.get(j).getV_67())){
					l4.add(l3.get(j));
				}
			}
			int t=1;
			for (int j = 0; j < l1.size(); j++) {
				if(l2.get(i).getV_67().equals(l1.get(j).getV_67())){
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
}
