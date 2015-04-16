package com.hdsx.jxzhpt.gcxmybb.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcxmybb.bean.Xmbb;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface XmbbServer {

	List<Map<String, Object>> getptgxXzqh1(Xmbb xmbb);

	List<Map<String, Object>> getptgxXzqh2(Xmbb xmbb);

	Excel_list selectEx1(Xmbb xmbb);

	List<Excel_list> selectelist1(Xmbb xmbb);

	Excel_list selectEx2(Xmbb xmbb);

	List<Excel_list> selectelist2(Xmbb xmbb);

	List<Map<String, Object>> getYhxzqh(Xmbb xmbb);

	Excel_list getYhHj(Xmbb xmbb);

	List<Excel_list> getyhlist(Xmbb xmbb);

	Excel_list getYhHj1(Xmbb xmbb);

	List<Excel_list> getyhlist1(Xmbb xmbb);

	Excel_list getlwwq(Xmbb xmbb);

	List<Excel_list> getlwwqlist(Xmbb xmbb);

	Excel_list getlwab(Xmbb xmbb);

	List<Excel_list> getlwablist(Xmbb xmbb);

	Excel_list getlwzh(Xmbb xmbb);

	List<Excel_list> getlwzhlist(Xmbb xmbb);

	List<TreeNode> gettsdq(String xzqh);

	List<Map<String, Object>> getptgxlist1(Xmbb xmbb);

	List<Map<String, Object>> getptgxlist2(Xmbb xmbb);

	List<Map<String, Object>> getptgxlist3(Xmbb xmbb);

	List<Map<String, Object>> getptgxlist4(Xmbb xmbb);


}
