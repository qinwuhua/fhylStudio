package com.hdsx.jxzhpt.qqgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;

public interface CbsjServer {
	/**
	 * 分页查询初步申请
	 * @param lmsj 路面升级对象
	 * @param page 页码
	 * @param rows 行数
	 * @return 集合
	 */
	public List<Cbsj> queryCbsjLmgz(Cbsj lmsj,int page,int rows);
	
	/**
	 * 查询总个数
	 * @param lmsj 路面升级项目对象
	 * @return 个数
	 */
	public int queryCbsjLmgzCount(Cbsj lmsj);
	/**
	 * 根据项目编码查询初步审核信息
	 * @param xmbm 计划的项目编码
	 * @return 返回初步审核对象
	 */
	public Cbsj queryCbsjLmgzByXmbm(String xmbm);
	/**
	 * 修改初步设计信息
	 * @param cbsj 修改后的初步设计信息
	 * @return 是否成功
	 */
	public boolean updateCbsjLmgz(Cbsj cbsj);
	/**
	 * 修改初步设计信息
	 * @param cbsj 修改后的初步设计信息
	 * @return 是否成功
	 */
	public boolean updateCbsjLmgz(List<Cbsj> cbsj);
	/**
	 * 上传设计批复文件
	 * @param uploads
	 * @return 执行结果
	 */
	public boolean insertFile(Plan_upload uploads);
	/**
	 * 根据文号查询此文件是否已经上传过
	 * @param uploads
	 * @return
	 */
	public Plan_upload queryFileByWh(Plan_upload uploads);
	/**
	 * 查询此项目所包含的文件
	 * @param xmbm 项目编码
	 * @return 返回文件对象集合
	 */
	public List<Plan_upload> queryFileByXmbm(Plan_upload upload);
	/**
	 * 删除对应项目信息
	 * @param xmbm 项目编码
	 * @return 返回执行结果
	 */
	public boolean deleteLmgzByXmbm(String xmbm);
	/**
	 * 查询路面升级项目列表
	 * @param cbsj 初步设计数据对象
	 * @param page 页码
	 * @param rows 每页数据数量
	 * @return 返回数据集合
	 */
	public List<Cbsj> queryCbsjLmsj(Cbsj cbsj, int page, int rows);
	public List<Cbsj> queryCbsjgsd(Cbsj cbsj, int page, int rows);
	/**
	 * 查询路面升级项目总数量
	 * @param cbsj 初步设计数据对象
	 * @return 返回总数
	 */
	public int queryCbsjgsdCount(Cbsj cbsj);
	public int queryCbsjLmsjCount(Cbsj cbsj);
	/**
	 * 根据项目编码查询详细信息
	 * @param xmbm
	 * @return
	 */
	public Cbsj queryCbsjLmsjByXmbm(String xmbm);
	/**
	 * 修改升级项目
	 * @param cbsj 升级项目对象
	 * @return 执行结果
	 */
	public boolean updateCbsjLmsj(Cbsj cbsj);
	/**
	 * 修改升级项目
	 * @param cbsj 升级项目对象
	 * @return 执行结果
	 */
	public boolean updateCbsjLmsj(List<Cbsj> cbsj);
	/**
	 * 删除升级项目
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean deleteLmsjByXmbm(String xmbm);
	/**
	 * 上报、审核流程，修改流程状态
	 * @param xmbm 项目编码
	 * @return 执行结果
	 */
	public boolean shCbsjLmsjByXmbm(Cbsj cbsj,String sbzt,String shzt);
	/**
	 * 上报、审核流程，修改流程状态
	 * @param cbsj 项目编码
	 * @return 执行结果
	 */
	public boolean shCbsjLmgzByXmbm(Cbsj cbsj,String sbzt,String shzt);
	/**
	 * 查询新建项目列表信息
	 * @param cbsj 初步设计对象
	 * @param page 页码
	 * @param rows 每页条数
	 * @return
	 */
	public List<Cbsj> queryCbsjXj(Cbsj cbsj, int page, int rows);
	/**
	 * 新建项目总数
	 * @param cbsj 初步设计对象
	 * @return 总条数
	 */
	public int queryCbsjXjCount(Cbsj cbsj);
	/**
	 * 根据项目编码查询新建工程信息
	 * @param xmbm 项目编码
	 * @return 新建项目对象
	 */
	public Cbsj queryCbsjXjByXmbm(String xmbm);
	/**
	 * 修改新建项目信息
	 * @param cbsj 新建项目对象
	 * @return 执行结果
	 */
	public boolean updateCbsjXj(Cbsj cbsj);
	/**
	 * 删除新建项目信息
	 * @param xmbm 新建项目编码
	 * @return 执行结果
	 */
	public boolean deleteXjByXmbm(String xmbm);
	/**
	 * 上报、审核新建项目
	 * @param cbsj
	 * @param sbzt1
	 * @param shzt1
	 * @return
	 */
	public boolean shCbsjXjByXmbm(Cbsj cbsj, String sbzt1, String shzt1);
	/**
	 * 根据项目编码查询养护大中修信息
	 * @param xmbm
	 * @return
	 */
	public Cbsj queryCbsjYhdzxByXmbm(String xmbm);
	/**
	 * 查询养护大中修初步设计信息
	 * @param cbsj 
	 * @param page 页码
	 * @param rows 展示数量
	 * @return 列表
	 */
	public List<Cbsj> queryCbsjYhdzx(Cbsj cbsj, int page, int rows);
	/**
	 * 查询养护大中修初步设计总数
	 * @param cbsj
	 * @return 总数
	 */
	public int queryCbsjYhdzxCount(Cbsj cbsj);
	/**
	 * 修改养护大中修初步设计信息
	 * @param cbsj
	 * @return
	 */
	public boolean updateCbsjYhdzx(Cbsj cbsj);
	/**
	 * 修改养护大中修初步设计信息
	 * @param cbsj
	 * @return
	 */
	public boolean updateCbsjYhdzx(List<Cbsj> list);
	/**
	 * 审核养护大中修
	 * @param cbsj
	 * @param shzt1
	 * @return
	 */
	public boolean shCbsjYhdzxByXmbm(Cbsj cbsj, String shzt1);
	/**
	 * 查询水毁的初步设计信息
	 * @param cbsj 初步设计信息
	 * @param page 页码
	 * @param rows 展示行数
	 * @return 列表信息
	 */
	public List<Cbsj> queryCbsjSh(Cbsj cbsj, int page, int rows);
	/**
	 * 查询初步设计水毁总数
	 * @param cbsj 水毁初步设计 
	 * @return 总数
	 */
	public int queryCbsjShCount(Cbsj cbsj);
	/**
	 * 根据项目编码查询灾毁恢复重建项目信息
	 * @param xmbm 项目编码
	 * @return 灾毁恢复重建项目信息
	 */
	public Cbsj queryCbsjShByXmbm(String xmbm);
	/**
	 * 修改水毁初步设计ixnxi
	 * @param cbsj 水毁初步设计信息
	 * @return 执行结果
	 */
	public boolean updateCbsjSh(Cbsj cbsj);
	/**
	 * 修改水毁初步设计ixnxi
	 * @param cbsj 水毁初步设计信息
	 * @return 执行结果
	 */
	public boolean updateCbsjSh(List<Cbsj> cbsj);
	/**
	 * 修改初步设计审核状态
	 * @param cbsj 初步设计
	 * @param shzt1 审核状态
	 * @return 执行结果
	 */
	public boolean shCbsjShByXmbm(Cbsj cbsj, String shzt1);
	/**
	 * 导出路面改造
	 * @param cbsj 查询条件
	 * @return 返回集合
	 */
	public List<Object> queryLmgzExcel(Cbsj cbsj);
	/**
	 * 导出养护大中修
	 * @param cbsj 查询条件
	 * @return 返回集合
	 */
	public List<Object> queryYhdzxExcel(Cbsj cbsj);
	/**
	 * 导出灾毁重建
	 * @param cbsj 查询条件
	 * @return 返回集合
	 */
	public List<Object> queryShExcel(Cbsj cbsj);
	/**
	 * 导出路面升级
	 * @param cbsj 查询条件
	 * @return 返回集合
	 */
	public List<Object> queryLmsjExcel(Cbsj cbsj);
	/**
	 * 导出新建
	 * @param cbsj 查询条件
	 * @return 返回集合
	 */
	public List<Object> queryXjExcel(Cbsj cbsj);
	/**
	 * 修改新建项目初步设计
	 * @param list
	 * @return
	 */
	public boolean updateCbsjXj(List<Cbsj> list);
	/**
	 * 添加文件和项目关联
	 * @param uploads
	 * @return
	 */
	public boolean insertFileJl(Plan_upload uploads);

	public List<Plan_upload> queryFj();

	public Plan_upload queryFjByName(Plan_upload file);
	/**
	 * 根据工可批复文号查询到用到此文号的项目
	 * @param substring
	 */
	public List<Plan_upload> queryGkXm(String substring);
	/**
	 * 根据计划下达问好查询用到此文号的项目
	 * @param substring
	 * @return
	 */
	public List<Plan_upload> queryJhXm(String substring);
	/**
	 * 初步设计养护累计查询
	 * @param cbsj
	 * @return
	 */
	public Map<String, String> queryCbsjLjYhdzx(Cbsj cbsj);
	/**
	 * 初步设计灾毁累计查询
	 * @param cbsj
	 * @return
	 */
	public Map<String, String> queryCbsjLjSh(Cbsj cbsj);

	public Lxsh loadsjcbsjTjxx(Cbsj cbsj);

	public Lxsh loadlmcbsjTjxx(Cbsj cbsj);

	public Lxsh loadxjcbsjTjxx(Cbsj cbsj);

	public List<Cbsj> queryCbsjLmsjbg(Cbsj cbsj, int page, int rows);

	public int queryCbsjLmsjbgCount(Cbsj cbsj);

	public List<Cbsj> queryCbsjLmgzbg(Cbsj cbsj, int page, int rows);

	public int queryCbsjLmgzbgCount(Cbsj cbsj);

	public List<Cbsj> queryCbsjXjbg(Cbsj cbsj, int page, int rows);

	public int queryCbsjXjbgCount(Cbsj cbsj);

	public List<Cbsj> queryCbsjYhdzxbg(Cbsj cbsj, int page, int rows);

	public int queryCbsjYhdzxbgCount(Cbsj cbsj);

	public List<Cbsj> queryCbsjShbg(Cbsj cbsj, int page, int rows);

	public int queryCbsjShbgCount(Cbsj cbsj);

	public Lxsh loadsjcbsjbgTjxx(Cbsj cbsj);

	public Lxsh loadlmcbsjbgTjxx(Cbsj cbsj);

	public Lxsh loadxjcbsjbgTjxx(Cbsj cbsj);

	public Map<String, String> queryCbsjbgLjYhdzx(Cbsj cbsj);

	public Map<String, String> queryCbsjbgLjSh(Cbsj cbsj);

	public Cbsj queryCbsjLmsjbgByXmbm(String xmbm);

	public Cbsj queryCbsjLmgzbgByXmbm(String xmbm);

	public Cbsj queryCbsjXjbgByXmbm(String xmbm);

	public Cbsj queryCbsjYhdzxbgByXmbm(String xmbm);

	public Cbsj queryCbsjShbgByXmbm(String xmbm);

	public Cbsj selectSjsgt(Cbsj cbsj);

	public boolean updatesjsgt(Cbsj cbsj);

	public boolean updatexjsgt(Cbsj cbsj);

	public boolean updatelmsgt(Cbsj cbsj);

	public Lxsh loadgsdcbsjTjxx(Cbsj cbsj);

	public List<Object> querygsdExcel(Cbsj cbsj);

	public List<Plan_upload> queryxdFileByWh(Plan_upload file);

	public List<Plan_upload> getWjbyxmbm(Plan_upload file);

	public boolean shangbaoCbsj(Cbsj cbsj);

	public boolean thCbsjByXmbm(Cbsj cbsj);

	public boolean thwshcbsj(Cbsj cbsj);
	
}
