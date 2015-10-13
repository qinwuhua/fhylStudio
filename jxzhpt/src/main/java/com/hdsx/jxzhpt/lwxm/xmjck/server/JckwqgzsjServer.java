package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface JckwqgzsjServer {

	boolean deleteqlzpbyxmbm(Jckwqgzsj jckwqgzsj);

	boolean insertWqgz(Jckwqgzsj jckwqgzsj);

	List<Jckwqgzsj> selectWqgzList(Jckwqgzsj jckwqgzsj);

	int selectWqgzCount(Jckwqgzsj jckwqgzsj);

	boolean deleteWqgzsjById(Jckwqgzsj jckwqgzsj);

	boolean getwqgzZP(Jckwqgzsj jckwqgzsj);

	boolean xgJckWqgzSbzt(Jckwqgzsj jckwqgzsj);

	boolean shtyWqgzsjById(Jckwqgzsj jckwqgzsj);
	
	boolean shbtyWqgzsjById(Jckwqgzsj jckwqgzsj);

	List<Jckwqgzsj> selectJckShwqgz(Jckwqgzsj jckwqgzsj);

	int selectWqgzShCount(Jckwqgzsj jckwqgzsj);

	boolean sjshtyWqgzsjById(Jckwqgzsj jckwqgzsj);

	boolean sjshbtyWqgzsjById(Jckwqgzsj jckwqgzsj);

	boolean updateWqgz(Jckwqgzsj jckwqgzsj);

	List<Jckwqgzsj> selectSckwqgz(Jckwqgzsj jckwqgzsj);

	int selectSckwqgzCount(Jckwqgzsj jckwqgzsj);

	List<Jckwqgzsj> JckWqgzRoad(Jckwqgzsj jckwqgzsj);

	boolean insertSckwqgz(Jckwqgzsj jckwqgzsj);

	boolean deleteSckWqgz(Jckwqgzsj jckwqgzsj);

	boolean xgSckWqgzSbzt(Jckwqgzsj jckwqgzsj);

	boolean shtyWqgzsckById(Jckwqgzsj jckwqgzsj);

	boolean shbtyWqgzsckById(Jckwqgzsj jckwqgzsj);

	boolean updateSckwqgz(Jckwqgzsj jckwqgzsj);

	List<Jckwqgzsj> selectSckShwqgz(Jckwqgzsj jckwqgzsj);

	int selectSckShwqgzCount(Jckwqgzsj jckwqgzsj);

	boolean sjshtyWqgzsjwqgz(Jckwqgzsj jckwqgzsj);

	boolean sjshbtyWqgzsjwqgz(Jckwqgzsj jckwqgzsj);

	List<Excel_list> dcwqgzsjjhExcel(Jckwqgzsj jckwqgzsj);

	List<Excel_list> dcwqgzsjxmkshExcel(Jckwqgzsj jckwqgzsj);

	List<Excel_list> dcwqgzsjsckExcel(Jckwqgzsj jckwqgzsj);

	List<Excel_list> dcwqgzsjsckshExcel(Jckwqgzsj jckwqgzsj);

	boolean tuihuiWqgzsjById(Jckwqgzsj jckwqgzsj);
}
