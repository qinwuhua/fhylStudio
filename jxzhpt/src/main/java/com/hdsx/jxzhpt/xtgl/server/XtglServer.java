package com.hdsx.jxzhpt.xtgl.server;

import java.util.HashMap;
import java.util.List;

import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.jxzhpt.xtgl.bean.Param;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.jxzhpt.xtgl.bean.Unit;

public interface XtglServer {

	boolean czPassword(Master master);

	List<TreeNode> selchildedw(String string);

	List<TreeNode> seldw(String yhdw);

	boolean updatePassword(HashMap hm);

	HashMap<String, String> login(HashMap hm);

	List<TreeNode> selAllXzqh2(String yhdw);

	List<TreeNode> selAllXzqh(String yhdw);

	int selectYhListCount(HashMap hm);

	List<Master> selectYhList(HashMap hm);

	List<HashMap> selQxList(HashMap hm);

	boolean insertYh(Master master);

	boolean updatezt(HashMap hm);

	boolean mimareset(HashMap hm);

	boolean deleteYh(String yhm);

	boolean updateYh(Master master);

	List<Param> selectJsList(Param param);

	boolean insertJs(Param param);

	boolean deleteJsById(Param param);

	int selectDwListCount(Unit unit);

	List<Unit> selectDwList(Unit unit);

	List<TreeNode> getBmbmTreeByName(HashMap<String, String> hm);

	boolean insertDw(Unit unit);

	boolean deleteDwById(Unit unit);

	List<Unit> selectDwById(Unit unit);

	boolean updateDw(Unit unit);

	int selectBmbmListCount(Unit unit);

	List<Unit> selectBmbmList(Unit unit);

	boolean insertBmbm(Unit unit);

	boolean updateBmbm(Unit unit);

	boolean deleteBmbmById(Unit unit);

	List<Master> checkname(HashMap hm);

	List<Param> selectTsdqList(Param param);

	int selectXzqhListCount(Unit unit);

	List<Unit> selectXzqhList(Unit unit);

	String createGsAnyChartXml(Param param);

	List<Unit> checkXzqhCfById(Unit unit);

	boolean insertXzqh(Unit unit);

	boolean updateXzqh(Unit unit);

	boolean deleteXzqhById(Unit unit);

	boolean updateTsdqZt(Param param);

	List<TreeNode> selAllTsdq2(String yhdw);

	List<TreeNode> selAllTsdq(String yhdw);

	boolean insertTsdq(Param param);

	boolean deleteTsdqById(Param param);

	Param selectTsdqById(Param param);

	List<TreeNode> selAllBm(String yhdw);

	List<TreeNode> selAllBm2(String yhdw);

}
