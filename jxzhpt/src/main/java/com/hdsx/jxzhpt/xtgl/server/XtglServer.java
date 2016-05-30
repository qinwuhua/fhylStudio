package com.hdsx.jxzhpt.xtgl.server;

import java.util.HashMap;
import java.util.List;

import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.jxzhpt.xtgl.bean.Param;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.jxzhpt.xtgl.bean.Unit;
import com.hdsx.jxzhpt.xtgl.bean.Yhdzxcs;

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

	String createGsAnyChartXml(List<Param> l);

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

	boolean updateTsdq(Param param);

	Master selectYhById(Master master);

	List<TreeNode> selAllQx(String yhdw);

	List<TreeNode> selAllQx2(String yhdw);

	Param selectJsById(Param param);

	boolean updateJs(Param param);

	List<Param> selQxByUser(Param param);

	List<TreeNode> selQxByRoleid(Param param);

	List<Param> selQxListByRoleid(Param param);

	List<Bzbz> selBzbz(Bzbz bzbz);

	boolean updateBzbz(List<Bzbz> l);

	List<Plan_flwbzbz> queryFlwbzbz();

	boolean addFlwbzbz(Plan_flwbzbz flwbzbz);

	Plan_flwbzbz queryFlwbzbzById(String id);

	boolean updateFlwbzbz(Plan_flwbzbz flwbzbz);

	boolean dropFlwbzbzById(String id);
	
	List<Yhdzxcs> queryYhdzxcs(Yhdzxcs yhdzxcs);
	
	List<Unit> selectLxQlDataList(String id);

	List<TreeNode> loadBmbmList(Unit unit);

	List<Param> selSqlStrByLxid(Param param);
	
	boolean addYhdzxcs(Yhdzxcs yhdzxcs);

	Yhdzxcs queryYhdzxcsById(String id);
	
	boolean updateYhdzxcs(Yhdzxcs yhdzxcs);

	List<Yhdzxcs> queryYhdzxcsByLx(Yhdzxcs yhdzxcs);
	
	List<Plan_flwbzbz> queryFlwxmFdfw();
	
	boolean updateFdbzByXmlx(Plan_flwbzbz flwbzbz);

	List<Param> checkJsCfByName(Param param);

	List<Param> selJsUsedById(Param param);

	boolean dropYhdzxcsById(String id);

	HashMap<String, String> loginCheck(HashMap hm);

	List<Master> userlogin(String master);

	List<TreeNode> createMenu(Unit unit);

	List<Param> selQxByUser1(Param param);

	Master selectPwd(String temp);

	boolean insertxmsx(Param param);

	Param selectXmsx();
}
