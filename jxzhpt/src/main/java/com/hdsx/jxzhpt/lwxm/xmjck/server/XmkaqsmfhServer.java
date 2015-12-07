package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Xmkaqsmfh;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface XmkaqsmfhServer {

	List<Xmkaqsmfh> selectXmkaqsmfhXMK(Xmkaqsmfh xmkaqsmfh);

	int selectXmkaqsmfhXMKCount(Xmkaqsmfh xmkaqsmfh);

	Xmkaqsmfh loadXmkaqsmfhXMKCount(Xmkaqsmfh xmkaqsmfh);

	List<Xmkaqsmfh> smfhGpsroad(Xmkaqsmfh roadcode);

	boolean insertAqsmfhxmk(Xmkaqsmfh xmkaqsmfh);

	boolean xgXmkAFSbzt(Xmkaqsmfh xmkaqsmfh);

	boolean updateAqsmfhxmk(Xmkaqsmfh xmkaqsmfh);

	boolean deleteAfxmkById(Xmkaqsmfh xmkaqsmfh);

	List<Xmkaqsmfh> selectSckaqsmfh(Xmkaqsmfh xmkaqsmfh);

	int selectSckaqsmfhCount(Xmkaqsmfh xmkaqsmfh);

	Xmkaqsmfh loadSckaqsmfhCount(Xmkaqsmfh xmkaqsmfh);

	List<Xmkaqsmfh> aqsmfhJckGpsRoad(Xmkaqsmfh xmkaqsmfh);

	boolean insertAqsmfhsck(Xmkaqsmfh xmkaqsmfh);

	List<Xmkaqsmfh> selectafldList(Xmkaqsmfh xmkaqsmfh);

	Xmkaqsmfh selectAqsmfhsckbyid(Xmkaqsmfh xmkaqsmfh);

	Xmkaqsmfh selectAqsmfhxmkbyid(Xmkaqsmfh xmkaqsmfh);

	boolean updateAqsmfhsck(Xmkaqsmfh xmkaqsmfh);

	List<Xmkaqsmfh> selectSckaqsmfhld(Xmkaqsmfh xmkaqsmfh);

	boolean insertAqsmfhsckld(Xmkaqsmfh xmkaqsmfh);

	Xmkaqsmfh loadscktjld(Xmkaqsmfh xmkaqsmfh);

	boolean delafldsck(Xmkaqsmfh xmkaqsmfh);

	boolean deleteSckAf(Xmkaqsmfh xmkaqsmfh);

	boolean sckAfSb(Xmkaqsmfh xmkaqsmfh);

	boolean afSckCs(Xmkaqsmfh xmkaqsmfh);

	List<Xmkaqsmfh> selectSckaqsmfhsh(Xmkaqsmfh xmkaqsmfh);

	int selectSckaqsmfhshCount(Xmkaqsmfh xmkaqsmfh);

	boolean afSckZs(Xmkaqsmfh xmkaqsmfh);

	Xmkaqsmfh loadSckaqsmfhshCount(Xmkaqsmfh xmkaqsmfh);

	List<Xmkaqsmfh> selectXmkaqsmfhsh(Xmkaqsmfh xmkaqsmfh);

	int selectXmkaqsmfhshCount(Xmkaqsmfh xmkaqsmfh);

	Xmkaqsmfh loadXmkaqsmfhshCount(Xmkaqsmfh xmkaqsmfh);

	boolean afXmkCs(Xmkaqsmfh xmkaqsmfh);

	boolean afXmkZs(Xmkaqsmfh xmkaqsmfh);

	List<Excel_list> dcaqsmfhsckExcel(Xmkaqsmfh xmkaqsmfh);

	List<Excel_list> dcaqsmfhsckshExcel(Xmkaqsmfh xmkaqsmfh);


}
