package com.hdsx.jxzhpt.gcbb.server;

import java.util.List;

import com.hdsx.jxzhpt.gcbb.bean.Gcbb5;
import com.hdsx.jxzhpt.gcbb.bean.GcgjJd;
import com.hdsx.jxzhpt.gcbb.bean.GcsjJd;
import com.hdsx.jxzhpt.gcxmybb.bean.Xmbb;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface GcbbServer {
	/**
	 * 工程改建进度报表查询
	 * @param xmbb
	 * @return
	 */
	List<Excel_list> selGcgjJdbb(Xmbb xmbb);
	/**
	 * 水毁进度报表查询
	 * @param xmbb
	 * @return
	 */
	List<Excel_list> selShuihJdbb(Xmbb xmbb);
	/**
	 * 升级进度报表
	 * @param xmbb
	 * @return
	 */
	List<Excel_list> selGcsjJdbb(Xmbb xmbb);
	/**
	 * 养护大中修报表
	 * @param xmbb
	 * @return
	 */
	List<GcgjJd> selYhdzxJdbb(Xmbb xmbb);
	/**
	 * 月报非路网项目第5个报表
	 * @param xmbb
	 * @return
	 */
	List<Gcbb5> selGcbb5(Xmbb xmbb);
}
