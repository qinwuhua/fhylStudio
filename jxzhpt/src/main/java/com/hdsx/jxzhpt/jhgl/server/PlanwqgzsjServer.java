package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Planwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

/**
 * @author qwh
 *
 */
public interface PlanwqgzsjServer {

	List<Planwqgzsj> selectwqjhkgl(Planwqgzsj planwqgzsj);

	int selectwqjhkglcount(Planwqgzsj planwqgzsj);

	Planwqgzsj loadwqjhkglCount(Planwqgzsj planwqgzsj);

	Planwqgzsj loadwqgzjhkbyid(String id);

	Planwqgzsj loadwqgzsckbyid(String id);

	Planwqgzsj loadwqgzxmkbyid(String id);

	Planwqgzsj loadwqgzsbzbyid(String id);

	boolean editwqgzsj(Planwqgzsj planwqgzsj);

	List<Planwqgzsj> selectwqjhksb(Planwqgzsj planwqgzsj);

	int selectwqjhksbcount(Planwqgzsj planwqgzsj);

	Planwqgzsj loadwqjhksbCount(Planwqgzsj planwqgzsj);

	boolean sbWqgzjh(Planwqgzsj planwqgzsj);

	boolean shtyWqgzsbById(Planwqgzsj planwqgzsj);

	boolean shbtyWqgzsbById(Planwqgzsj planwqgzsj);

	boolean shtyWqgzshById(Planwqgzsj planwqgzsj);

	boolean shbtyWqgzshById(Planwqgzsj planwqgzsj);

	String lwBzsbz(Planwqgzsj planwqgzsj);

	List<Excel_list> dcwqgzsjjhExcel(Planwqgzsj planwqgzsj);
	
}
