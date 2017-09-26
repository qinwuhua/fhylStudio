package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import java.util.Map;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface JckzhfzServer {
	boolean insertZhfz(Jckzhfz zhfz);
	List<Jckzhfz> selectZhfzList(Jckzhfz zhfz);
	int selectZhfzCount(Jckzhfz zhfz);
	Jckzhfz selectZhfzById(Jckzhfz zhfz);
	boolean updateZhfzById(Jckzhfz zhfz);
	List<Jckzhfz> selectGpsroad(Jckzhfz zhfz);
	List<Jckzhfz> JckzhfzRoad(Jckzhfz zhfz);
	boolean deleteZhfzById(String delstr);
	boolean xgJckZhfzShzt(String delstr,Jckzhfz zhfz);
	boolean xgJckZhfzSbzt(String delstr,Jckzhfz zhfz);
	List<Jckzhfz> selectJckShzhfz(Jckzhfz zhfz);
	int selectZhfzShCount(Jckzhfz zhfz);
	boolean xgJckZhfzTH(String delstr);
	boolean importZhfz(List<Map<String,String>> list,String tbbmbm,String sbthcd);
	List <Excel_list> exportExcel_zhfz(Jckzhfz jckzhfz);
	List<Excel_list> exportExcel_zhfz_sh(Jckzhfz jckzhfz);
	boolean onceZhfz(Jckzhfz zhfz);
	String yanZhen(List<Map<String,String>> data,String tbbmbm);
	Jckzhfz selZhfzCount(Jckzhfz zhfz);
	Jckzhfz selZhfzShCount(Jckzhfz zhfz);
}
