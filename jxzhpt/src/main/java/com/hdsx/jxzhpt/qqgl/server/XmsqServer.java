package com.hdsx.jxzhpt.qqgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface XmsqServer {
	/**
	 * 添加养护大中修
	 * @param list 项目申请信息集合
	 * @return 执行结果
	 */
	public boolean insertXmsqYhdzx(List<Xmsq> list);
	/**
	 * 添加灾毁恢复重建项目
	 * @param list 项目申请信息集合
	 * @return 执行结果
	 */
	public boolean insertXmsqSh(List<Xmsq> list);
	/**
	 * 获取下一个项目编码
	 * @return 项目编码
	 */
	public String queryYhdzxNextXmbm(Xmsq xmsq);
	/**
	 * 获取下一个项目编码
	 * @return 项目编码
	 */
	public String queryShNextXmbm(Xmsq xmsq);
	/**
	 * 根据路线名称和行政区划查询列表
	 * @param xmsq 
	 * @return 反映列表
	 */
	public List<Lx> queryAutoList(Xmsq xmsq);
	public Lx queryAutoList1(Xmsq xmsq);
	/**
	 * 查询是否有历史记录
	 * @param ylxbh 路线编号
	 * @param qdzh 起点桩号
	 * @param zdzh 止点桩号
	 * @return 历史记录个数
	 */
	public int queryLsjl(String ylxbh, String qdzh, String zdzh,String xmbm);
	/**
	 * 添加路线信息到路线表
	 * @param lx 路线对象
	 * @return 执行结果
	 */
	public boolean insertLx(Lx lx);
	public boolean insertLx(Lx lx,Xmsq xmsq);
	/**
	 * 根据路线编号和起止点桩号查询特殊地区
	 * @param xmsq 项目申请信息
	 * @return 特殊地区集合
	 */
	public List<String> queryTsdq(Xmsq xmsq);
	/**
	 * 查询养护大中修列表信息
	 * @param xmsq 项目申请信息条件
	 * @return 列表集合
	 */
	public List<Xmsq> queryYhdzxXmsq(Xmsq xmsq,int page,int rows);
	public List<Xmsq> queryYhdzxXmsqbyyhc(Xmsq xmsq,int page,int rows);
	/**
	 * 查询水毁列表信息
	 * @param xmsq 查询条件
	 * @return 列表集合
	 */
	public List<Xmsq> queryShXmsq(Xmsq xmsq,int page,int rows);
	public List<Xmsq> queryShXmsqbyyhc(Xmsq xmsq,int page,int rows);

	/**
	 * 查询养护大中修数量
	 * @param xmsq 查询条件
	 * @return 数量
	 */
	public int queryYhdzxCount(Xmsq xmsq);
	public int queryYhdzxCountbyyhc(Xmsq xmsq);
	/**
	 * 查询水毁数量
	 * @param xmsq 查询条件
	 * @return 数量
	 */
	public int queryShCount(Xmsq xmsq);
	public int queryShCountbyyhc(Xmsq xmsq);
	/**
	 * 删除项目
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean deleteYhdzxByXmbm(String xmbm);
	/**
	 * 删除项目
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean deleteShByXmbm(String xmbm);
	/**
	 * 修改养护大中修德上报状态
	 * @param xmsq 项目信息
	 * @return 执行结果
	 */
	public boolean updateYhdzxSqzt(Xmsq xmsq);
	/**
	 * 修改水毁上报状态
	 * @param xmsq 项目信息
	 * @return 执行结果
	 */
	public boolean updateShSqzt(Xmsq xmsq);
	/**
	 * 通过申请后，向计划审核中加入信息
	 * @param xmsq 项目申请信息
	 * @return 执行结果
	 */
	public boolean insertJhshYhdzx(Xmsq xmsq);
	/**
	 * 通过申请后，想计划审核中加入信息
	 * @param xmsq 灾毁恢复重建项目信息
	 * @return 执行结果
	 */
	public boolean insertJhshSh(Xmsq xmsq);
	/**
	 * 根据项目编码查询项目信息
	 * @param xmsq 项目申请信息
	 * @return 项目申请信息
	 */
	public Xmsq queryYhdzxByXmbm(Xmsq xmsq);
	/**
	 * 根据项目编码查询项目信息
	 * @param xmsq 项目申请信息
	 * @return 项目申请信息
	 */
	public Xmsq queryShByXmbm(Xmsq xmsq);
	/**
	 * 修改养护大中修信息
	 * @param xmsq 项目申请信息
	 * @return 执行结果
	 */
	public boolean updateYhdzx(Xmsq xmsq);
	/**
	 * 修改养护大中修信息
	 * @param xmsq 项目申请信息
	 * @return 执行结果
	 */
	public boolean updateYhdzx(List<Xmsq> xmsq);
	/**
	 * 修改灾毁恢复重建项目信息
	 * @param xmsq 项目申请信息
	 * @return 执行结果
	 */
	public boolean updateSh(Xmsq xmsq);
	/**
	 * 添加养护大中修到初步设计
	 * @param xmsq 项目申请信息
	 * @return 执行结果
	 */
	public boolean insertCbsjYhdzx(Xmsq xmsq);
	/**
	 * 添加灾毁恢复重建项目到初步设计
	 * @param xmsq
	 * @return
	 */
	public boolean insertCbsjSh(Xmsq xmsq);
	public boolean insertCbsjShls(Xmsq xmsq);
	/**
	 * 导出养护大中修项目
	 * @param xmsq 搜索条件
	 * @return 返回集合
	 */
	public List<Object> queryYhdzxExport(Xmsq xmsq);
	/**
	 * 导出灾毁恢复重建项目
	 * @param xmsq 搜索条件
	 * @return 返回集合
	 */
	public List<Object> queryShExport(Xmsq xmsq);
	/**
	 * 批量添加路线
	 * @param lxlist 路线集合
	 * @return 返回结果
	 */
	public boolean insertLx(List<Lx> lxlist);
	/**
	 * 查询所有的行政区划
	 * @param xzqhdm
	 * @return
	 */
	public List<TreeNode> queryAllXzqh(String xzqhdm);
	public List<TreeNode> queryAllGydw(String gydwdm);
	/**
	 * 养护大中修查询累计信息
	 * @param xmsq 查询条件
	 * @return
	 */
	public Map<String, String> queryLjYhdzx(Xmsq xmsq);
	/**
	 * 水毁查询累计信息
	 * @param xmsq
	 * @return
	 */
	public Map<String, String> queryLjSh(Xmsq xmsq);
	/**
	 * 根据行政等级查询对应的路线
	 * @param level 公路行政登记
	 * @param xzqhdm 行政区划
	 * @return
	 */
	public List<Map<String, String>> queryLxFromGpsroadByLevel(String level,String xzqhdm);

	/**
	 * 查询养护中心项目立项list
	 * @param xmsq
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<Xmsq> queryYhzxXmsq(Xmsq xmsq,int page,int rows);
	/**
	 * 查询养护中心项目立项个数
	 * @param xmsq
	 * @return
	 */
	public int queryYhzxCount(Xmsq xmsq); 
	/**
	 * 查询养护中心下一个num
	 * @param xmsq
	 * @return
	 */
	public String queryYhzxNextXmbm(Xmsq xmsq);
	/**
	 * 添加养护中心立项数据
	 * @param list
	 * @return
	 */
	public boolean insertXmsqYhzx(List<Xmsq> list);
	/**
	 * 删除养护中心数据
	 * @param xmbm
	 * @return
	 */
	public boolean deleteYhzxByXmbm(String xmbm);
	/**
	 * 查询单条养护中心立项项目
	 * @param xmsq
	 * @return
	 */
	public Xmsq queryYhzxByXmbm(Xmsq xmsq);
	/**
	 * 修改立项信息--养护中心
	 * @param xmsq
	 * @return
	 */
	public boolean updateYhzx(Xmsq xmsq);
	/**
	 * 修改项目申请状态---养护中心
	 * @param xmsq
	 * @return
	 */
	public boolean updateYhzxSqzt(Xmsq xmsq);
	/**
	 * 查询总数
	 * @param xmsq
	 * @return
	 */
	public Map<String, String> queryLjYhzx(Xmsq xmsq);
	/**
	 * 添加計劃信息
	 * @param list
	 * @return
	 */
	public boolean insertJhshYhzx(Xmsq xmsq);
	/**
	 * 导出养护中心立项数据
	 * @param xmsq
	 * @return
	 */
	public List<Object> queryYhzxExport(Xmsq xmsq);
	public List<Lx> queryLslist(Xmsq xmsq);
	public List<Lx> queryLslistwnxmk(Xmsq xmsq);
	public List<Lx> queryLslistserw(Xmsq xmsq);
	public List<Xmsq> queryyhdzxcb(Xmsq xmsq);
	public Xmsq queryyhdzxsfdj();
	public List<Excel_list> queryYhdzxExport1(Xmsq xmsq);
	public Xmsq getghxx(Xmsq xmsq);
	public Xmsq getghxxbyone(Xmsq xmsq);
	public List<Xmsq> getghlxinfo(Xmsq xmsq);
	public List<Lx> queryAutoghList(Xmsq xmsq);
	public Xmsq getylxinfo(Xmsq xmsq);
	public Lx getylxlminfo(Xmsq xmsq);
	public List<Xmsq> getgxlxinfo(Xmsq xmsq);
	public String querySjgzNextXmbm(Xmsq xmsq);
	public String queryLmgzNextXmbm(Xmsq xmsq);
	public String queryXjNextXmbm(Xmsq xmsq);
	public Map<String, String> queryLjYhdzxbyyhc(Xmsq xmsq);
	public Map<String, String> queryLjShbyyhc(Xmsq xmsq);
	public boolean updateYhdzxSqztyhc(Xmsq xmsq);
	public boolean updateShSqztyhc(Xmsq xmsq);
	
	public List<Lx> queryLsjlxx(Xmsq xmsq);
	public Lx querysfwnxmk(Xmsq xmsq);
	public Lx querysfwnxmkdg(Xmsq xmsq);
	public Lx querysflsjl(Xmsq xmsq);
	public Lx querysflsjldg(Xmsq xmsq);
	public Lx querysfwnlsjl(Xmsq xmsq);
	public Lx querysfwnlsjldg(Xmsq xmsq);
	
}
