package com.hdsx.jxzhpt.wjxt.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;

public interface DbyhServer {

	List<Map<String, Object>> selectList1();

	List<Map<String, Object>> selectList2(Zdxx zdxx);

	List<Zdxx> selectList3(Zdxx zdxx);

	List<Map<String, Object>> selectList4(Zdxx zdxx);

	List<Map<String, Object>> selectList5(Zdxx zdxx);

	List<Map<String, Object>> selectxhbList1(Zdxx zdxx);

	List<Map<String, Object>> selectxhbList4(Zdxx zdxx);

	List<Map<String, Object>> selectxhbList5(Zdxx zdxx);

	List<Map<String, Object>> selectfxbList1(Zdxx zdxx);

	List<Map<String, Object>> selectPdbList(Zdxx zdxx);

	List<Map<String, Object>> selectYlbList(Zdxx zdxx);

	boolean insertYBBData(List<Map> data);

	List<Map<String,Object>> selectybbbyYf(String substring);

	boolean delete_ybb(String string);

	List<Map<String, Object>> selectxhbbyYf(String substring);

	boolean insertXHBData(List<Map> data);

	boolean delete_xhb(String string);

	List<Map<String, Object>> selectfxbbyYf(String substring);

	boolean insertFXBData(List<Map> data);

	boolean delete_fxb(String string);

	List<Map<String, Object>> selectpdbbyYf(String substring);

	boolean insertPDBData(List<Map> data);

	boolean delete_pdb(String string);

	List<Map<String, Object>> selectylbbyYf(String substring);

	boolean insertYLBData(List<Map> data);

	boolean delete_ylb(String string);

}
