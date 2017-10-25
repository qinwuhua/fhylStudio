package com.hdsx.jxzhpt.qqgl.server;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh2;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface JhshServer {
	
	public boolean updateSflgcXdzt(Jhsh jhsh);
	
	public List<Jhsh> querySflgcXdJhbz(Jhsh jhsh);
	/**
	 * 计划下达查询数据
	 * @param jhsh
	 * @return
	 */
	public List<Jhsh> querySflgcXdXmlb(Jhsh jhsh);
	/**
	 * 计划预安排查询数据
	 * @param jhsh
	 * @return
	 */
	public List<Jhsh> querySflgcYap(Jhsh jhsh);
	/**
	 * 根据项目编码查询示范路工程
	 * @param jhsh
	 * @return
	 */
	public Jhsh querySflgcByXmbm(Jhsh jhsh);
	/**
	 * 更新示范路工程
	 * @param jhsh
	 * @return
	 */
	public boolean updateSflgc(Jhsh jhsh);
	
	/**
	 * 退回示范路工程项目
	 * @param jhsh
	 * @return
	 */
	public boolean sflgcXmth(Jhsh jhsh );
	
	/**
	 * 根据项目编码，把需要的信息插入到计划审核表中
	 * @param xmbm 升级改造项目编码
	 * @return 执行结果
	 */
	public boolean insertJhshLmsjFromCbsj(String xmbm);
	/**
	 * 根据项目编码，把需要的信息插入到几号审核表中
	 * @param xmbm 路面改造项目编码
	 * @return 执行结果
	 */
	public boolean insertJhshLmgzFromCbsj(String xmbm);
	/**
	 * 根据项目编码，把需要的信息插入到几号审核表中
	 * @param xmbm 新建项目项目编码
	 * @return 执行结果
	 */
	public boolean insertJhshXjFromCbsj(String xmbm);
	/**
	 * 查询升级项目计划审核列表
	 * @param jhsh 计划审核对象
	 * @param page 页码
	 * @param rows 页面展示数量
	 * @return 升级项目计划审核列表信息
	 */
	public List<Jhsh> queryJhshLmsj(Jhsh jhsh,int page,int rows);
	/**
	 * 查询升级项目总数
	 * @param jhsh 计划审核对象
	 * @return 升级项目总数
	 */
	public int queryJhshCountLmsj(Jhsh jhsh);
	/**
	 * 查询计划审核路面改造列表信息
	 * @param jhsh 计划审核对象
	 * @param page 页码
	 * @param rows 页面展示数量
	 * @return
	 */
	public List<Jhsh> queryJhshLmgz(Jhsh jhsh, int page, int rows);
	/**
	 * 查询计划审核路面改造总数
	 * @param jhsh 计划审核对象
	 * @return 改造项目总数
	 */
	public int queryJhshCountLmgz(Jhsh jhsh);
	/**
	 * 查询新建项目信息列表
	 * @param jhsh 计划审核对象
	 * @param page 页码
	 * @param rows 每页展示行数
	 * @return 新建项目信息
	 */
	public List<Jhsh> queryJhshXj(Jhsh jhsh, int page, int rows);
	/**
	 * 查询新建项目总数
	 * @param jhsh 计划审核对象
	 * @return 新建项目总数
	 */
	public int queryJhshCountXj(Jhsh jhsh);
	/**
	 * 修改计划审核信息
	 * @param jhsh 计划审核信息
	 * @return 执行结果
	 */
	public boolean updateJhshxxLmsj(List<Jhsh> jhsh);
	/**
	 * 修改计划审核信息
	 * @param list 计划审核信息
	 * @return 执行结果
	 */
	public boolean updateJhshxxLmgz(List<Jhsh> list);
	/**
	 * 修改计划审核信息
	 * @param list 计划审核信息
	 * @return 执行结果
	 */
	public boolean updateJhshxxXj(List<Jhsh> list);
	/**
	 * 查询升级项目的立项审核信息
	 * @param xmbm 项目编码
	 * @return 立项审核信息
	 */
	public Lxsh queryLxshLmsjByXmbm(String xmbm);
	/**
	 * 查询改造项目的立项审核信息
	 * @param xmbm 项目编码
	 * @return 立项审核信息
	 */
	public Lxsh queryLxshLmgzByXmbm(String xmbm);
	/**
	 * 查询新建项目的立项审核信息
	 * @param xmbm 项目编码
	 * @return 立项审核信息
	 */
	public Lxsh queryLxshXjByXmbm(String xmbm);
	/**
	 * 查询路面升级计划审核信息
	 * @param xmbm 项目编码
	 * @return 计划审核信息
	 */
	public Jhsh queryJhshxxLmsjByXmbm(String xmbm);
	/**
	 * 查询路面改造计划审核信息
	 * @param xmbm 项目编码
	 * @return 计划审核信息
	 */
	public Jhsh queryJhshxxLmgzByXmbm(String xmbm);
	/**
	 * 查询新建项目计划审核信息
	 * @param xmbm 项目编码
	 * @return 计划审核信息
	 */
	public Jhsh queryJhshxxXjByXmbm(String xmbm);
	/**
	 * 计划审核信息列表查询
	 * @param jhsh2  养护大中修计划审核
	 * @return 养护大中修计划审核集合
	 */
	public List<Jhsh> queryJhshYhdzx(Jhsh jhsh);
	public List<Jhsh> queryJhshYhdzx_qx(Jhsh jhsh);
	/**
	 * 计划审核总数量
	 * @param jhsh2 养护大中修计划审核数量
	 * @return 养护大中修计划审核数量
	 */
	public int queryJhshYhdzxCount(Jhsh jhsh);
	public int queryJhshYhdzx_qxCount(Jhsh jhsh);
	/**
	 * 养护大中修计划审核信息
	 * @param jhsh2 计划审核信息
	 * @return 执行结果
	 */
	public boolean updateJhshxxYhdzx(Jhsh jhsh);
	/**
	 * 水毁计划审核信息
	 * @param jhsh2  计划审核信息
	 * @return 执行结果
	 */
	public boolean updateJhshxxSh(Jhsh jhsh);
	/**
	 * 根据项目编码查询养护大中修德计划审核信息
	 * @param jhsh 计划审核信息项目编码
	 * @return 审核信息
	 */
	public Jhsh queryJhshxxYhdzxByXmbm(Jhsh jhsh);
	/**
	 * 根据项目编码查询养护大中修计划审核信息
	 * @param jhsh 计划审核信息项目编码
	 * @return 审核信息
	 */
	public Jhsh queryJhshxxShByXmbm(Jhsh jhsh);
	/**
	 * 查询计划审核信息列表
	 * @param jhsh2 计划审核信息
	 * @param page 页码
	 * @param rows 展示数量
	 * @return
	 */
	public List<Jhsh> queryJhshSh(Jhsh jhsh);
	public List<Jhsh> queryJhshSh_qx(Jhsh jhsh);
	/**
	 * 查询水毁计划审核信息数量
	 * @param jhsh2 计划审核信息
	 * @return 总数量
	 */
	public int queryJhshShCount(Jhsh jhsh);
	public int queryJhshSh_qxCount(Jhsh jhsh);
	/**
	 * 添加养护大中修到计划审核
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean insertJhshYhdzxFromCbsj(String xmbm);
	/**
	 * 将初步设计信息插入到计划审核中
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean insertJhshShFromCbsj(String xmbm);
	/**
	 * 修改路线信息
	 * @param lx 修改路线信息
	 * @return 执行结果
	 */
	public boolean updateLx(Lx lx);
	public boolean updateLxqwh(Lx lx);
	/**
	 * 修改路线信息
	 * @param lx 修改路线信息
	 * @return 执行结果
	 */
	public boolean updateLx(List<Lx> lx);
	
	/**
	 * 添加路线
	 * @param lx 路线信息
	 * @return 执行结果
	 */
	public boolean insertLx(Lx lx);
	/**
	 * 根据ID删除路线
	 * @param lx 路线信息
	 * @return 执行结果
	 */
	public boolean deleteLx(Lx lx);
	/**
	 * 根据项目编码查询路线集合
	 * @param lx 路线编码
	 * @return 路线集合
	 */
	public List<Lx> selectlxList(Lx lx);
	public List<Lx> selectlxbgList(Lx lx);
	/**
	 * 升级路线阶段标示
	 * @param lx 路线编码  阶段标示
	 * @return 执行结果
	 */
	public boolean insertLxJdbs(Lx lx);
	/**
	 * 查询是否存在此路线
	 * @param lx 路线信息
	 * @return 所在的项目编码
	 */
	public Lx queryHaveLx(Lx lx);
	/**
	 * 查询历史信息
	 * @param xmbm 项目编码
	 * @return 历史信息结果
	 */
	public List<Lx> queryLsxx(Jhsh jhsh);
	public List<Lx> queryLsxx2(Lx lx);
	public List<Lx> queryLsxx2new(Lx lx);
	/**
	 * 根据项目编码查询升级项目的可行性研究信息
	 * @param jhsh 项目编码
	 * @return 可行性研究信息
	 */
	public Kxxyj queryLmsjKxxyjByXmbm(Jhsh jhsh);
	/**
	 * 根据项目编码查询改造路面的可行性研究信息
	 * @param jhsh 项目编码
	 * @return 可行性研究信息
	 */
	public Kxxyj queryLmgzKxxyjByXmbm(Jhsh jhsh);
	/**
	 * 根据项目编码查询新建项目的可行性研究信息
	 * @param jhsh 项目编码
	 * @return 可行性研究信息
	 */
	public Kxxyj queryXjKxxyjByXmbm(Jhsh jhsh);
	/**
	 * 修改计划审核的养护大中修
	 * @param readerExcel 养护大中修集合
	 * @return 执行结果
	 */
	public boolean updateJhshxxYhdzx(List<Jhsh> readerExcel);
	/**
	 * 修改灾毁重建的机会审核
	 * @param readerExcel 灾毁重建集合
	 * @return 执行结果
	 */
	public boolean updateJhshxxSh(List<Jhsh> readerExcel);
	/**
	 * 查询起止点之间路线等级及其里程
	 * @param lx 路线实体
	 * @return 路线等级和里程
	 */
	public Lx queryJsdjAndLcByStartAndEnd(Lx lx);
	/**
	 * 自定义查询升级项目
	 * @param filed 字段
	 * @return
	 */
	public List<Map<String, String>> zdyQueryLmsj(String filed,Jhsh jhsh,int page,int rows);
	/**
	 * 自定义查询改造项目
	 * @param filed 字段
	 * @param jhsh
	 * @return
	 */
	public List<Map<String, String>> zdyQueryLmgz(String filed, Jhsh jhsh,int page,int rows);
	/**
	 * 自定义查询新建项目
	 * @param filed 字段
	 * @param jhsh
	 * @return
	 */
	public List<Map<String, String>> zdyQueryXj(String filed, Jhsh jhsh,int page,int rows);
	/**
	 * 自定义查询养护大中修项目
	 * @param filed
	 * @param jhsh
	 * @return
	 */
	public List<Map<String, String>> zdyQueryYhdzx(String filed, Jhsh jhsh,int page,int rows);
	/**
	 * 自定义查询灾毁重建
	 * @param filed 字段
	 * @param jhsh
	 * @return
	 */
	public List<Map<String, String>> zdyQuerySh(String filed, Jhsh jhsh,int page,int rows);
	/**
	 * 自定义查询路面升级个数
	 * @param filed
	 * @param jhsh
	 * @return
	 */
	public int zdyQueryLmsjTotal(String filed, Jhsh jhsh);
	/**
	 * 自定义查询路面改造数量
	 * @param filed
	 * @param jhsh
	 * @return
	 */
	public int zdyQueryLmgzTotal(String filed, Jhsh jhsh);
	/**
	 * 自定义查询新建数量
	 * @param filed
	 * @param jhsh
	 * @return
	 */
	public int zdyQueryXjTotal(String filed, Jhsh jhsh);
	/**
	 * 自定义查询养护数量
	 * @param filed
	 * @param jhsh
	 * @return
	 */
	public int zdyQueryYhdzxTotal(String filed, Jhsh jhsh);
	/**
	 * 自定义查询水毁数量
	 * @param filed
	 * @param jhsh
	 * @return
	 */
	public int zdyQueryShTotal(String filed, Jhsh jhsh);
	/**
	 * 计划累计路面升级
	 * @param jhsh
	 * @return
	 */
	public Map<String, String> queryJhshLjLmsj(Jhsh jhsh);
	/**
	 * 计划累计路面升级
	 * @param jhsh
	 * @return
	 */
	public Map<String, String> queryJhshLjgsdgz(Jhsh jhsh);
	public Map<String, String> queryJhshLjgsdgz_qx(Jhsh jhsh);
	/**
	 * 计划累计路面改造
	 * @param jhsh
	 * @return
	 */
	public Map<String, String> queryJhshLjLmgz(Jhsh jhsh);
	/**
	 * 计划累计新建
	 * @param jhsh
	 * @return
	 */
	public Map<String, String> queryJhshLjXj(Jhsh jhsh);
	/**
	 * 计划累计养护大中修
	 * @param jhsh
	 * @return
	 */
	public Map<String, String> queryJhshLjYhdzx(Jhsh jhsh);
	public Map<String, String> queryJhshLjYhdzx_qx(Jhsh jhsh);
	/**
	 * 计划累计灾毁重建
	 * @param jhsh
	 * @return
	 */
	public Map<String, String> queryJhshLjSh(Jhsh jhsh);
	public Map<String, String> queryJhshLjSh_qx(Jhsh jhsh);
	public List<Lx> queryLsxx1(Jhsh jhsh);
	
	/**
	 * 查询示范路工程数据
	 * @param jhsh Jhsh对象
	 * @param page 显示分页
	 * @param rows 显示行数
	 * @return
	 */
	public List<Jhsh> queryJhshSflgc(Jhsh jhsh);
	
	/**
	 * 查詢 計劃數據---養護中心
	 * @param jhsh
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<Jhsh> queryJhshYhzx(Jhsh jhsh,int page,int rows);
	/**
	 * 計劃審覈數據count---養護中心
	 * @param jhsh
	 * @return
	 */
	public int queryJhshYhzxCount(Jhsh jhsh);
	/**
	 * 計劃審覈資金統計--養護中心
	 * @param jhsh
	 * @return
	 */
	public Map<String, String> queryJhshLjYhzx(Jhsh jhsh);
	/**
	 * 根據xmbm查詢計劃審覈信息---養護中心
	 * @param jhsh
	 * @return
	 */
	public Jhsh queryJhshxxYhzxByXmbm(Jhsh jhsh);
	/**
	 * 修改計劃審覈---養護中心
	 * @param jhsh
	 * @return
	 */
	public boolean updateJhshYhzx(Jhsh jhsh);
	public List<Jhsh> queryJhshLmsj1(Jhsh jhsh, int page, int rows);
	public int queryJhshCountLmsj1(Jhsh jhsh);
	public List<Jhsh> queryJhshLmgz1(Jhsh jhsh, int page, int rows);
	public int queryJhshCountLmgz1(Jhsh jhsh);
	public List<Jhsh> queryJhshXj1(Jhsh jhsh, int page, int rows);
	public int queryJhshCountXj1(Jhsh jhsh);
	public Map<String, String> queryJhshLjLmsj1(Jhsh jhsh);
	public Map<String, String> queryJhshLjLmgz1(Jhsh jhsh);
	public Map<String, String> queryJhshLjXj1(Jhsh jhsh);
	public Map<String, String> queryJhshLjYhdzx1(Jhsh jhsh);
	public Map<String, String> queryJhshLjSh1(Jhsh jhsh);
	public List<Jhsh> queryJhshYhdzx1(Jhsh jhsh, int page, int rows);
	public int queryJhshYhdzxCount1(Jhsh jhsh);
	public List<Jhsh> queryJhshSh1(Jhsh jhsh, int page, int rows);
	public int queryJhshShCount1(Jhsh jhsh);
	public List<Jhsh> queryGsdgz(Jhsh jhsh, int page, int rows);
	public int queryGsdgzCount(Jhsh jhsh);
	public List<Jhsh> queryGsdgz_qx(Jhsh jhsh, int page, int rows);
	public int queryGsdgz_qxCount(Jhsh jhsh);
	public List<Jhsh> queryGsdgzxd(Jhsh jhsh, int page, int rows);
	public int queryGsdgzxdCount(Jhsh jhsh);
	public Map<String, String> queryJhshLjgsdxd(Jhsh jhsh);
	public List<Jhsh> queryGsdgzxdbz(Jhsh jhsh);
	public List<Jhsh> queryGsdgzxd_qxbz(Jhsh jhsh);
	public boolean planxdAll(List<Jhsh> list);
	public boolean planxdAll_qx(List<Jhsh> list);
	public List<Jhsh> queryshxd(Jhsh jhsh, int page, int rows);
	public int queryshxdCount(Jhsh jhsh);
	public Map<String, String> queryJhbzshLj(Jhsh jhsh);
	public List<Jhsh> queryshxdbz(Jhsh jhsh);
	public List<Jhsh> queryshxd_qxbz(Jhsh jhsh);
	public List<Jhsh> queryjhxdyh(Jhsh jhsh, int page, int rows);
	public int queryjhxdyhCount(Jhsh jhsh);
	public Map<String, String> queryJhbzyhLj(Jhsh jhsh);
	public List<Jhsh> queryyhxdbz(Jhsh jhsh);
	public List<Jhsh> queryyhxd_qxbz(Jhsh jhsh);
	public boolean planxdhzadd(List<Jhsh> list);
	public List<Map<String, String>> getbzyhhzb();
	/**
	 * 示范路工程上报状态（sbzt）更新
	 * @param jhsh
	 * @return
	 */
	public boolean plansflgc(Jhsh jhsh);
	/**
	 * 示范路工程审核状态（shzt）
	 * @param jhsh
	 * @return
	 */
	public boolean planshSflgc(Jhsh jhsh);

	public boolean plansbgj(Jhsh jhsh);
	public boolean plansblm(Jhsh jhsh);
	public boolean plansbxj(Jhsh jhsh);
	public boolean plansbyh(Jhsh jhsh);
	public boolean plansbsh(Jhsh jhsh);
	public boolean planshgj(Jhsh jhsh);
	public boolean planshlm(Jhsh jhsh);
	public boolean planshxj(Jhsh jhsh);
	public boolean planshyh(Jhsh jhsh);
	public boolean planshsh(Jhsh jhsh);
	public Kxxyj queryShKxxyjByXmbm(Jhsh jhsh);
	public Collection<? extends Object> queryGsdgz_dc(Jhsh jhsh, int i, int j);
	public Collection<? extends Object> queryJhshSh_dc(Jhsh jhsh);
	public Collection<? extends Object> queryJhshYhdzx_dc(Jhsh jhsh);
	public List<Lx> querywnxx(Jhsh jhsh);
	public String queryylmlx(Lx lx);
	public boolean updateLx(Lx lx, Xmsq xmsq);
	public boolean updateLx(Lx lx, Cbsj cbsj);
	public List<Excel_list> queryGsdgz_dc(Jhsh jhsh);
	public List<Excel_list> queryZhhf_dc(Jhsh jhsh);
	public List<Excel_list> queryYhdzx_dc(Jhsh jhsh);
	public List<Excel_list> queryYhdzxDetail_dc(Jhsh jhsh);
	public List<Excel_list> queryYhdzx_dc1(Jhsh jhsh);
	public List<Excel_list> queryYhdzxDetail_dc1(Jhsh jhsh);
	public boolean updateLxshm(Lx lx, Xmsq xmsq);
	public boolean thwshjh(Jhsh jhsh);
	public List<Lx> querywnLsxx(Jhsh jhsh);
	public List<Lx> querylxLsxx(Jhsh jhsh);
	public List<Lx> querywnxmxx(Jhsh jhsh);
	public List<Lx> queryylxbxmbm(Jhsh jhsh);
	public Jhsh queryJhshxxLmsjqxByXmbm(Jhsh jhsh);
	public Jhsh queryJhshxxLmgzqxByXmbm(Jhsh jhsh);
	public Jhsh queryJhshxxXjqxByXmbm(Jhsh jhsh);
	public Jhsh queryJhshxxYhdzxqxByXmbm(Jhsh jhsh);
	public Jhsh queryJhshxxShqxByXmbm(Jhsh jhsh);
	public Lxsh queryLxshLmsjqxByXmbm(String xmbm);
	public Lxsh queryLxshLmgzqxByXmbm(String xmbm);
	public Lxsh queryLxshXjqxByXmbm(String xmbm);
	public Kxxyj queryLmsjKxxyjqxByXmbm(Jhsh jhsh);
	public Kxxyj queryLmgzKxxyjqxByXmbm(Jhsh jhsh);
	public Kxxyj queryXjKxxyjqxByXmbm(Jhsh jhsh);
	public List<Lx> queryLxbyGhlxbm(String string);
	public List<Jhsh> queryChildGydw(Jhsh jhsh);
	public List<Jhsh> queryZjByGydwdm(Jhsh jhsh);
	public Jhsh queryShqxByOne(Jhsh xm);
	public int insertShqx(List<Jhsh> save);
	public int updateShqx(List<Jhsh> update);
	public List<Jhsh> queryXmlistshqx(Jhsh jhsh);
	public int queryXmlistshqxCount(Jhsh jhsh);
	public List<Lx> queryLxidbyGhlxbm(String string);

	public List<Jhsh> queryYhzxshSb(Jhsh jhsh);

	public Jhsh queryYhzxshById(Jhsh jhsh);

	public boolean updateZhzxsh(Jhsh jhsh);

	public boolean yhzxshXmth(Jhsh jhsh);

	public List<Jhsh> queryYhzxshYap(Jhsh jhsh);

	public List<Jhsh> queryYhzxshJhxd(Jhsh jhsh);

	public List<Jhsh> listFwq(Jhsh jhsh);

	public List<Jhsh> listFwqSbzt(Jhsh jhsh);

	public List<Jhsh> listFwqXdzt(Jhsh jhsh);

	public boolean updateFwq(Jhsh jhsh);

	public Jhsh queryFwqById(Jhsh jhsh);

	public boolean fwqXmth(Jhsh jhsh);

	public int queryJhshSflgcCount(Jhsh jhsh);

	public Map<String, String> queryJhshLjsyf(Jhsh jhsh);

	public int listFwqCount(Jhsh jhsh);

	public int queryszxmCount(Jhsh jhsh);
	
	public int querySzxmListCount(Jhsh jhsh);

	public Map<String, String> queryJhshLjsyfs2w(Jhsh jhsh);

	public List<Map<String, String>> queryszxm(Jhsh jhsh);

	public List<Map<String, String>> querySzxmList(Jhsh jhsh);
	
	public int listFwqSbztCount(Jhsh jhsh);

	public int listFwqXdztCount(Jhsh jhsh);

	public boolean updateJhshInfo(Jhsh jhsh);

	public boolean sbshSzxm(Jhsh jhsh);

	public Map<String, String> queryJhshLjSzxm(Jhsh jhsh);

	public List<Excel_list> exportSflgcExcel(Jhsh jhsh);

	public List<Map<String, String>> querySzxmxdbz(Jhsh jhsh);

	public boolean planxdAllSzxm(List<Map<String, String>> list);

	public List<Excel_list> exportFwqjhExcel(Jhsh jhsh);

	public List<Excel_list> exportYhzxjhExcel(Jhsh jhsh);

	public List<Excel_list> exportLsjlSearchExcel(Lx lx);
}
