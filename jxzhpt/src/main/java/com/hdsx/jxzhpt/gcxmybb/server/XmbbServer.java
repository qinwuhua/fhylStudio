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

public interface XmbbServer {

	List<Map<String, Object>> getptgxXzqh1(Xmbb xmbb);

	List<Map<String, Object>> getptgxXzqh2(Xmbb xmbb);

	Excel_list selectEx1(Xmbb xmbb);

	List<Excel_list> selectelist1(Xmbb xmbb);

	Excel_list selectEx2(Xmbb xmbb);

	List<Excel_list> selectelist2(Xmbb xmbb);


}
