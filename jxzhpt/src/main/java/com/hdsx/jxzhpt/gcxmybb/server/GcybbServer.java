package com.hdsx.jxzhpt.gcxmybb.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface GcybbServer {

	List<Map<String, Object>> getWqgzybb(Gcglwqgz gcglwqgz);

	List<Map<String, Object>> getWqgzxzqh(Gcglwqgz gcglwqgz);

	List<Map<String, Object>> getWqgznf(Gcglwqgz gcglwqgz);

	Excel_list getwqgzlist1(Gcglwqgz gcglwqgz);

	Excel_list getwqgzlist2(Gcglwqgz gcglwqgz);

	Excel_list getwqgzlist3(Gcglwqgz gcglwqgz);

	List<Excel_list> getwqgzlist4(Gcglwqgz gcglwqgz);

}
