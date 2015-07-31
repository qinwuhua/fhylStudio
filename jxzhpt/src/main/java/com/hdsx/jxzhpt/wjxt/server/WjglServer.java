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
import com.hdsx.jxzhpt.wjxt.bean.Wjgl;

public interface WjglServer {

	boolean uploadWjFile(Wjgl wjgl);

	boolean deleteWjfile(Wjgl wjgl);

	boolean deleteWjfile1(String id);

	boolean insertZcwj(Wjgl wjgl);

	List<Wjgl> selectzcwjlist(Wjgl wjgl);

	int selectzcwjlistCount(Wjgl wjgl);

	List<Wjgl> selectWjfile(Wjgl wjgl);

	Wjgl selectWjById(Wjgl wjgl);

	boolean updateZcwj(Wjgl wjgl);

	boolean deleteZcwj(Wjgl wjgl);

	boolean insertQtwj(Wjgl wjgl);

	List<Wjgl> selectqtwjlist(Wjgl wjgl);

	int selectqtwjlistCount(Wjgl wjgl);

	boolean deleteQtWjfile1(String id);

	boolean updateQtwj(Wjgl wjgl);

	boolean deleteQtwj(Wjgl wjgl);

}
