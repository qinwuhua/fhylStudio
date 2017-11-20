package com.hdsx.jxzhpt.gcxmybb.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface GcybbServer {

	List<Map<String, Object>> getWqgzybb(Gcglwqgz gcglwqgz);

	List<Map<String, Object>> getWqgzxzqh(Gcglwqgz gcglwqgz);

	List<Map<String, Object>> getWqgznf(Gcglwqgz gcglwqgz);

	Excel_list getwqgzlist1(Gcglwqgz gcglwqgz);

	Excel_list getwqgzlist2(Gcglwqgz gcglwqgz);

	Excel_list getwqgzlist3(Gcglwqgz gcglwqgz);

	List<Excel_list> getwqgzlist4(Gcglwqgz gcglwqgz);

	List<Map<String, Object>> getabgcybb(Gcglabgc gcglabgc);

	Excel_list getabgclist1(Gcglabgc gcglabgc);

	List<Map<String, Object>> getAbgcxzqh(Gcglabgc gcglabgc);

	Excel_list getabgclist3(Gcglabgc gcglabgc);

	List<Map<String, Object>> getAbgcnf(Gcglabgc gcglabgc);

	Excel_list getabgclist2(Gcglabgc gcglabgc);

	List<Excel_list> getabgclist4(Gcglabgc gcglabgc);

	List<Map<String, Object>> getzhfzybb(Gcglzhfz gcglzhfz);

	Excel_list getzhfzlist1(Gcglzhfz gcglzhfz);

	List<Map<String, Object>> getZhfzxzqh(Gcglzhfz gcglzhfz);

	List<Map<String, Object>> getZhfznf(Gcglzhfz gcglzhfz);

	List<Excel_list> getzhfzlist2(Gcglzhfz gcglzhfz);

	List<Map<String, Object>> getShybb(Gcglsh gcglsh);

	List<Map<String, Object>> getwqgzbblist1(Gcglwqgz gcglwqgz);

	List<Map<String, Object>> getwqgzbblist2(Gcglwqgz gcglwqgz);

	List<Map<String, Object>> getwqgzbblist3(Gcglwqgz gcglwqgz);

	List<Map<String, Object>> getwqgzbblist4(Gcglwqgz gcglwqgz);

	List<Map<String, Object>> getabgcbblist1(Gcglabgc gcglabgc);

	List<Map<String, Object>> getabgcbblist2(Gcglabgc gcglabgc);

	List<Map<String, Object>> getabgcbblist3(Gcglabgc gcglabgc);

	List<Map<String, Object>> getabgcbblist4(Gcglabgc gcglabgc);

	List<Map<String, Object>> getzhfzbblist1(Gcglzhfz gcglzhfz);

	List<Map<String, Object>> getzhfzbblist2(Gcglzhfz gcglzhfz);

	List<Map<String, Object>> getzhfzbblist3(Gcglzhfz gcglzhfz);

	List<Map<String, Object>> getzhfzbblist4(Gcglzhfz gcglzhfz);

	List<Map<String, Object>> getGjxjmxbsj(String sql);

	List<Map<String, Object>> getWqgzJsb(Gcglwqgz gcglwqgz);

	List<Map<String, Object>> getAbgcJsb(Gcglwqgz gcglwqgz);

	List<Excel_list> getWqgzJsb1(Gcglwqgz gcglwqgz);

	List<Excel_list> getAbgcJsb1(Gcglwqgz gcglwqgz);

	List<Excel_list> getWqgzjh(Gcglwqgz gcglwqgz);

	List<Excel_list> getAbgcjh(Gcglwqgz gcglwqgz);

	List<Excel_list> getWqgzjy(Gcglwqgz gcglwqgz);

	List<Excel_list> getGlgzxj(Gcglabgc gcglabgc);

	List<Excel_list> xmkaqsmfhbb1(String tiaojian1);

	List<Excel_list> xmkaqsmfhbb2(String tiaojian1);

	List<Excel_list> sckaqsmfhbb(String tiaojian1);

	void createybView(String viewsql);

	List<Excel_list> getHzgjxj(Gcglwqgz gcglwqgz);

	List<Excel_list> getHzzh(Gcglwqgz gcglwqgz);

	List<Excel_list> getHzlm(Gcglwqgz gcglwqgz);

	List<Excel_list> getHzyh(Gcglwqgz gcglwqgz);

	List<Excel_list> getHzlw(Gcglwqgz gcglwqgz);

	List<Excel_list> getWqgzjsqk(Gcglwqgz gcglwqgz);

	List<Excel_list> getAbjsqk(Gcglwqgz gcglwqgz);

	List<Excel_list> getsjssjzhzb(String xmnf);

	List<Excel_list> getGlgzxjzd(String tiaojian);

	List<TreeNode> createBtTree(Excel_list excel_list);

	List<Excel_list> getZdyBbzd(Excel_list excel_list);

	List<Excel_list> getGljsjhhzb();

	List<TreeNode> createWhTree();

	List<Excel_list> getGsgxsjgzjd(String sql2);

	boolean insertOrUpdatesjss(List<Excel_list> list1);

	List<Excel_list> getsjssjzhzbnew(Excel_list excel_list);

	List<Excel_list> getinsertorupdate(Excel_list excel_list);

	List<Excel_list> getXgjwcmxb(Gcglabgc gcglabgc);

	List<Excel_list> getLwgzAbgcybb(Gcglabgc gcglabgc);

	List<Excel_list> getLwgzWqgzybb(Gcglabgc gcglabgc);

	
}
