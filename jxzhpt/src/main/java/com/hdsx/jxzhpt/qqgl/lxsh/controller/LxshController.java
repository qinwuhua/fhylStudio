package com.hdsx.jxzhpt.qqgl.lxsh.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.bcel.generic.NEW;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Wqbzbz;
import com.hdsx.jxzhpt.qqgl.lxsh.server.LxshServer;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.XmsqServer;
import com.hdsx.jxzhpt.qqgl.server.impl.JhshServerImpl;
import com.hdsx.jxzhpt.qqgl.server.impl.XmsqServerImpl;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader1;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class LxshController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	private String xmtype;
	private String xzqh;
	private String nf;
	private Lxsh lxsh=new Lxsh();
	private String gydw;
	private String xmmc;
	private String xmnf;
	private String sbzt;
	private int shzt;
	private String tsdq;
	private String jsdj;
	private String gldj;
	private int sbthcd;
	private String xmbm;
	private String ghlxbh;
	private String jdbs;
	private String lsjl;
	private String fileuploadFileName;
	private File fileupload;
	private String lxbm;
	private String jsxz;
	private String shzt1;
	private String wgny;
	private String xmlx;
	private Lx lx;
	private String lxmc;
	private String jsjsdj;
	private String ghlxmc;
	private String ghlxbm;
	
	
	public String xzqhBm(String bh,String name){
		String result="";
		if(bh!=null){
			if(bh.indexOf(",")==-1){
				int i=0;
				if(bh.matches("^[0-9]*[1-9]00$")){
					i=2;
				}else if(bh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				bh=bh.substring(0,bh.length()-i);
			}
			String[] s = bh.split(",");
			for (int i = 0; i < s.length; i++) {
				if(i==0)
					result+=" and ("+name+" like '%"+s[i]+"%'";
				else
					result+=" or "+name+" like '%"+s[i]+"%'";
			}
			result+=")";
			//System.out.println(result);
			//result= bh.indexOf(",")==-1 ? " x."+name+" like '%"+bh+"%'": "x."+name+" in ("+bh+")";
		}
		return result;
	}
	public String getJsjsdj() {
		return jsjsdj;
	}
	public void setJsjsdj(String jsjsdj) {
		this.jsjsdj = jsjsdj;
	}
	public String getGhlxmc() {
		return ghlxmc;
	}
	public void setGhlxmc(String ghlxmc) {
		this.ghlxmc = ghlxmc;
	}
	public String getGhlxbm() {
		return ghlxbm;
	}
	public void setGhlxbm(String ghlxbm) {
		this.ghlxbm = ghlxbm;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	public LxshServer getLxshServer() {
		return lxshServer;
	}
	public void setLxshServer(LxshServer lxshServer) {
		this.lxshServer = lxshServer;
	}
	private Wqbzbz wqbzbz=new Wqbzbz();
	@Resource(name="jhshServerImpl")
	private JhshServer jhshServer;
	
	public String getXmlx() {
		return xmlx;
	}
	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}
	public String getWgny() {
		return wgny;
	}
	public void setWgny(String wgny) {
		this.wgny = wgny;
	}
	public String getShzt1() {
		return shzt1;
	}
	public void setShzt1(String shzt1) {
		this.shzt1 = shzt1;
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm;
	}
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	public Wqbzbz getWqbzbz() {
		return wqbzbz;
	}
	public void setWqbzbz(Wqbzbz wqbzbz) {
		this.wqbzbz = wqbzbz;
	}
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl;
	}
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
	public String getGhlxbh() {
		return ghlxbh;
	}
	public void setGhlxbh(String ghlxbh) {
		this.ghlxbh = ghlxbh;
	}
	public String getXmbm() {
		return xmbm;
	}
	public void setXmbm(String xmbm) {
		this.xmbm = xmbm;
	}
	public String getSbzt() {
		return sbzt;
	}
	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}
	public int getShzt() {
		return shzt;
	}
	public void setShzt(int shzt) {
		this.shzt = shzt;
	}
	public int getSbthcd() {
		return sbthcd;
	}
	public void setSbthcd(int sbthcd) {
		this.sbthcd = sbthcd;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}

	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		
		this.jsdj = jsdj;
	}
	public String getGldj() {
		return gldj;
	}
	public void setGldj(String gldj) {
		if(gldj!=null && !gldj.equals("")){
			String[] split1 = gldj.split(",");
			gldj="";
			for (int i = 0; i < split1.length; i++) {
				gldj+=i==split1.length-1 ? "lxbm like '"+split1[i]+"%'" : "lxbm like '"+split1[i]+"%' or ";
			}
			gldj = "("+gldj+")";
		}
		this.gldj = gldj;
	}

	public Lxsh getLxsh() {
		return lxsh;
	}
	public void setLxsh(Lxsh lxsh) {
		this.lxsh = lxsh;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getXmtype() {
		return xmtype;
	}
	public void setXmtype(String xmtype) {
		this.xmtype = xmtype;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	public String getNf() {
		return nf;
	}
	public void setNf(String nf) {
		this.nf = nf;
	}
	@Resource(name = "lxshServerImpl")
	private LxshServer lxshServer;
	public void selectxmbm(){
		String str="";
		String xmbm = "";
		if("sjgz".equals(xmtype)){
			str=nf+xzqh+"1";
			String xmbm1 = lxshServer.selectXmbm(str);
			if(xmbm1==null){
				xmbm="";
			}else{
				xmbm=xmbm1;
			}
		}
		
		if("lmgz".equals(xmtype)){
			str=nf+xzqh+"2";
			String xmbm1 = lxshServer.selectlmgzXmbm(str);
			if(xmbm1==null){
				xmbm="";
			}else{
				xmbm=xmbm1;
			}
		}
		
		if("xj".equals(xmtype)){
			str=nf+xzqh+"3";
			String xmbm1 = lxshServer.selectxjXmbm(str);
			if(xmbm1==null){
				xmbm="";
			}else{
				xmbm=xmbm1;
			}
		}
		//生成项目编码
		if("".equals(xmbm)){
			xmbm = str+"001";
		}else{
			xmbm=Integer.parseInt(xmbm)+1+"";
			if(xmbm.length()==1)
				xmbm=str+"00"+xmbm;
			if(xmbm.length()==2)
				xmbm=str+"0"+xmbm;
			if(xmbm.length()==3)
				xmbm=str+xmbm;
		}
		System.out.println(xmbm);
		Lxsh l = new Lxsh();
		l.setXmbm(xmbm);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectbzcs(){
		try {
			Lxsh l = lxshServer.selectbzcs(lxsh);
			BigDecimal b1=new BigDecimal(l==null ? "0" : l.getBzys());
			BigDecimal b2=new BigDecimal(lxsh.getLc());
			String bzys=b1.multiply(b2)+"";
			lxsh.setBzys(bzys);
			JsonUtils.write(lxsh, getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectSFCF(){
		boolean bl=false;
		if("sjgz".equals(lxsh.getXmlx())){
			bl=lxshServer.selectSFCF(lxsh);
		}
		if("lmgz".equals(lxsh.getXmlx())){
				bl=lxshServer.selectSFCF(lxsh);
		}
		if("xj".equals(lxsh.getXmlx())){
			bl=lxshServer.selectSFCF2(lxsh);
		}
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void insertSjgz(){
		try {
			if(lxsh.getWnid()!=null&&!lxsh.getWnid().equals("")){
				String xmbmVal="";
				String[] val = lxsh.getWnid().split(",");
				for (int i = 0; i < val.length; i++) {
					if(i==val.length-1){
						xmbmVal+="'"+val[i]+"'";}
					else{
						xmbmVal+="'"+val[i]+"',";
						}
					
				}
				lxsh.setWnid(xmbmVal);
			}
			Map<String, Object> result =new HashMap<String, Object>();
			Lx lx=new Lx();
			lx.setXmid(lxsh.getXmbm());
			lx.setGhlxbm(lxsh.getGhlxbh());
			lx.setGhqdzh(lxsh.getGhqdzh());
			lx.setGhzdzh(lxsh.getGhzdzh());
			JhshServer jhshServer=new JhshServerImpl();
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
			if(queryHaveLx==null){
				boolean bl=lxshServer.insertSjgz(lxsh);
				if(bl){
					result.put("result", "true");
				}else{
					result.put("result", "false");
				}
			}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertLmgz(){
		try {
			Map<String, Object> result =new HashMap<String, Object>();
			Lx lx=new Lx();
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			JhshServer jhshServer=new JhshServerImpl();
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
			if(queryHaveLx==null){
				boolean bl=lxshServer.insertLmgz(lxsh);
				if(bl){
					result.put("result", "true");
				}else{
					result.put("result", "false");
				}
			}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertXj(){
		try {
			Map<String, Object> result =new HashMap<String, Object>();
			Lx lx=new Lx();
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			
			JhshServer jhshServer=new JhshServerImpl();
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
			if(queryHaveLx==null){
				boolean bl=lxshServer.insertXj(lxsh);
				if(bl){
					result.put("result", "true");
				}else{
					result.put("result", "false");
				}
			}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectSjgzList(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")==-1){
				xmnf=" xmnf = '"+xmnf+"'";
			}else{
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
				xmnf=" xmnf in ("+xmnf+")";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			lxsh.setJsdj(jsdj);
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(tsdq);
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setLsjl(lsjl);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			//lxsh.setGhlxbh(ghlxbh);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
			lxsh.setLxmc(lxmc);
			if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}
			List<Lxsh> list=lxshServer.selectSjgzList(lxsh);
			int count=lxshServer.selectSjgzListCount(lxsh);
			EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectgsdgzList(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			/*if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}*/
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			//lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")==-1){
				xmnf=" xmnf = '"+xmnf+"'";
			}else{
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
				xmnf=" xmnf in ("+xmnf+")";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			
			if(jsdj.indexOf(",")>-1){
				String[] split = jsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsdj = "(lx.xjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsdj += " or lx.xjsdj like '%"+split[i]+"%')";
					}else{
						jsdj += " or lx.xjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsdj)||jsdj==null)
				jsdj = "lx.xjsdj like '%"+jsdj+"%'";
				else{
					jsdj = "";
				}
			}
			if(jsjsdj.indexOf(",")>-1){
				String[] split = jsjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsjsdj = "(lx.jsjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%')";
					}else{
						jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsjsdj)||jsjsdj==null)
					jsjsdj = "lx.jsjsdj like '%"+jsjsdj+"%'";
				else{
					jsjsdj = "";
				}
			}
			lxsh.setLsxmlx(MyUtil.getQueryTJ2(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			lxsh.setJsdj(jsdj);
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(MyUtil.getQueryTJ(tsdq,"tsdq"));
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setLsjl(lsjl);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			lxsh.setGhlxbh(ghlxbh);
			lxsh.setLxmc(lxmc);
			lxsh.setJsjsdj(jsjsdj);
			lxsh.setGhlxbm(ghlxbm);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
			lxsh.setGhlxmc(ghlxmc);
			if(lxsh.getXmlx1()!=null)
				if(lxsh.getXmlx1().length()>0){
					String[] tsdqs=lxsh.getXmlx1().split(",");
					String tsdq="";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="and(xmlx1 like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or xmlx1 like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					lxsh.setXmlx1(tsdq);
				}
			
			/*if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}*/
			List<Lxsh> list=lxshServer.selectgsdgzList(lxsh);
			int count=lxshServer.selectgsdgzListCount(lxsh);
			EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	/**
	 * 累计立项申请升级
	 */
	public void queryLxshLjLmsj(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")==-1){
				xmnf=" xmnf = '"+xmnf+"'";
			}else{
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
				xmnf=" xmnf in ("+xmnf+")";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			lxsh.setJsdj(jsdj);
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(tsdq);
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setLsjl(lsjl);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
			lxsh.setLxmc(lxmc);
			if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}
			Map<String, String> result = lxshServer.queryLxshLjLmsj(lxsh);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryLxshLjgsd(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			/*if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}*/
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			//lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")==-1){
				xmnf=" xmnf = '"+xmnf+"'";
			}else{
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
				xmnf=" xmnf in ("+xmnf+")";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			
			if(jsdj.indexOf(",")>-1){
				String[] split = jsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsdj = "(xjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsdj += " or xjsdj like '%"+split[i]+"%')";
					}else{
						jsdj += " or xjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsdj)||jsdj==null)
				jsdj = "xjsdj like '%"+jsdj+"%'";
				else{
					jsdj = "";
				}
			}
			if(jsjsdj.indexOf(",")>-1){
				String[] split = jsjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsjsdj = "(lx.jsjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%')";
					}else{
						jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsjsdj)||jsjsdj==null)
					jsjsdj = "lx.jsjsdj like '%"+jsjsdj+"%'";
				else{
					jsjsdj = "";
				}
			}
			//System.out.println(lxsh.getLsxmlx());
			lxsh.setLsxmlx(MyUtil.getQueryTJ2(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			//System.out.println(lxsh.getLsxmlx());
			lxsh.setJsdj(jsdj);
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(MyUtil.getQueryTJ(tsdq,"tsdq"));
			//System.out.println(lxsh.getTsdq());
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setLsjl(lsjl);
			//lxsh.setGhlxbh(ghlxbh);
			lxsh.setLxmc(lxmc);
			lxsh.setJsjsdj(jsjsdj);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
			lxsh.setGhlxmc(ghlxmc);
			
			if(lxsh.getXmlx1()!=null)
				if(lxsh.getXmlx1().length()>0){
					String[] tsdqs=lxsh.getXmlx1().split(",");
					String tsdq="";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="and(xmlx1 like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or xmlx1 like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					lxsh.setXmlx1(tsdq);
				}
			
			Map<String, String> result = lxshServer.queryLxshLjgsd(lxsh);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryLxshShLjLmsj(){
		try {
			//String tiaojian1="";
			String tiaojian2="";
			/*if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}*/
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			//lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")==-1){
				xmnf=" xmnf = '"+xmnf+"'";
			}else{
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
				xmnf=" xmnf in ("+xmnf+")";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			
			if(jsdj.indexOf(",")>-1){
				String[] split = jsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsdj = "(lx.xjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsdj += " or lx.xjsdj like '%"+split[i]+"%')";
					}else{
						jsdj += " or lx.xjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsdj)||jsdj==null)
				jsdj = "lx.xjsdj like '%"+jsdj+"%'";
				else{
					jsdj = "";
				}
			}
			int ssss = jsjsdj.indexOf(",");
			if(jsjsdj.indexOf(",")>-1){
				String[] split = jsjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsjsdj = "(lx.jsjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%')";
					}else{
						jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsjsdj)||jsjsdj==null)
					jsjsdj = "lx.jsjsdj like '%"+jsjsdj+"%'";
				else{
					jsjsdj = "";
				}
			}
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(MyUtil.getQueryTJ(tsdq,"tsdq"));
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setLsjl(lsjl);
			//lxsh.setGhlxbh(ghlxbh);
			lxsh.setLxmc(lxmc);
			lxsh.setJsjsdj(jsjsdj);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
			lxsh.setGhlxmc(ghlxmc);
			/*if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}*/
			lxsh.setLsxmlx(MyUtil.getQueryTJ2(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			Map<String, String> result = lxshServer.queryLxshShLjLmsj(lxsh);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectXjList(){
		String tiaojian1="";
		String tiaojian2="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		if(xmnf.indexOf(",")>-1){
			xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
			xmnf= "xmnf in ("+xmnf+")";
		}else{
			xmnf= "xmnf ='"+xmnf+"'";
		}
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setSbthcd(sbthcd);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
		lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
		lxsh.setLxmc(lxmc);
		if(lxsh.getTsdq().length()>0){
			String[] tsdqs=lxsh.getTsdq().split(",");
			String tsdq="and(";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="tsdq like '%"+tsdqs[i]+"%'";
				else
					tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			lxsh.setTsdq(tsdq);
		}
		List<Lxsh> list=lxshServer.selectXjList(lxsh);
		int count=lxshServer.selectXjListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void queryLxshLjXj(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")>-1){
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
				xmnf= "xmnf in ("+xmnf+")";
			}else{
				xmnf= "xmnf ='"+xmnf+"'";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(tsdq);
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
			lxsh.setLxmc(lxmc);
			if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}
			Map<String, String> result = lxshServer.queryLxshLjXj(lxsh);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryLxshShLjXj(){
		try {
			
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")>-1){
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
				xmnf= "xmnf in ("+xmnf+")";
			}else{
				xmnf= "xmnf ='"+xmnf+"'";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			
			if(jsdj.indexOf(",")>-1){
				String[] split = jsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsdj = "(lx.xjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsdj += " or lx.xjsdj like '%"+split[i]+"%')";
					}else{
						jsdj += " or lx.xjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsdj)||jsdj==null)
				jsdj = "lx.xjsdj like '%"+jsdj+"%'";
				else{
					jsdj = "";
				}
			}
			//int ssss = jsjsdj.indexOf(",");
			if(jsjsdj.indexOf(",")>-1){
				String[] split = jsjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsjsdj = "(lx.jsjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%')";
					}else{
						jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsjsdj)||jsjsdj==null)
					jsjsdj = "lx.jsjsdj like '%"+jsjsdj+"%'";
				else{
					jsjsdj = "";
				}
			}
			lxsh.setLsxmlx(MyUtil.getQueryTJ2(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(MyUtil.getQueryTJ(tsdq,"tsdq"));
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			//lxsh.setGhlxbh(ghlxbh);
			lxsh.setLxmc(lxmc);
			lxsh.setJsjsdj(jsjsdj);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "xjlxbm"));
			lxsh.setGhlxmc(ghlxmc);
			
			Map<String, String> result = lxshServer.queryLxshShLjXj(lxsh);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectSjgzlxList(){
		lxsh.setXmbm(xmbm);
		lxsh.setJdbs(jdbs);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		List<Lxsh> list=lxshServer.selectSjgzlxList(lxsh);
		int count=lxshServer.selectSjgzlxListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void sbsjgzSbzt(){
		boolean bl=lxshServer.sbsjgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void sblmgzSbzt(){
		boolean bl=lxshServer.sblmgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void sbxjSbzt(){
		boolean bl=lxshServer.sbxjSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thSjgzSbzt(){
		boolean bl=lxshServer.thSjgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thSjgzSbzt1(){
		boolean bl=lxshServer.thSjgzSbzt1(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thLmgzSbzt(){
		boolean bl=lxshServer.thLmgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thLmgzSbzt1(){
		boolean bl=lxshServer.thLmgzSbzt1(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thXjSbzt(){
		boolean bl=lxshServer.thXjSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void thXjSbzt1(){
		boolean bl=lxshServer.thXjSbzt1(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void Lmgzsfkxx(){
		boolean bl=lxshServer.Lmgzsfkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void sjgzsfkxx(){
		boolean bl=lxshServer.sjgzsfkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void Xjsfkxx(){
		boolean bl=lxshServer.Xjsfkxx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateSjgz(){
		Xmsq xmsq=new Xmsq();
		XmsqServer xmsqServer=new XmsqServerImpl();
		xmsq.setBz("lxsh_lx where 1=1 and sffirst!='1' and jdbs='"+0+"'");
		xmsq.setYlxbh(lxsh.getGhlxbm());
		xmsq.setXmbm(lxsh.getXmbm());
		xmsq.setQdzh(lxsh.getGhqdzh());
		xmsq.setZdzh(lxsh.getGhzdzh());
		Lx x2 = xmsqServer.querysflsjldg(xmsq);
		lxsh.setLsjl(x2.getLsjl());
		if("是".equals(x2.getLsjl())){
		lxsh.setLsxmbm(x2.getLsxmbm());
		lxsh.setLsxmid(x2.getLsxmid());
		}
		boolean bl=lxshServer.updateSjgz(lxsh);
		//准备路线桩号信息
		lx.setXmid(lxsh.getXmbm());
		lx.setLxbm(lxsh.getGhlxbh());
		lx.setQdzh(lxsh.getQdzh());
		lx.setZdzh(lxsh.getZdzh());
		lx.setQdmc(lxsh.getQdmc());
		lx.setZdmc(lxsh.getZdmc());
		lx.setXjsdj(lxsh.getXjsdj());
		lx.setJsjsdj(lxsh.getJsjsdj());
		lx.setLc(lxsh.getLc());
		lx.setSffirst("1");
		lx.setJdbs("0");
		lx.setGhlxbm(lxsh.getGhlxbm());
		lx.setGhqdzh(lxsh.getGhqdzh());
		lx.setGhzdzh(lxsh.getGhzdzh());
		lx.setGxlxbm(lxsh.getGxlxbm());
		lx.setGxqdzh(lxsh.getGxqdzh());
		lx.setGxzdzh(lxsh.getGxzdzh());
		lx.setGhlxmc(lxsh.getGhlxmc());
		lx.setXmbm1(lxsh.getXmbm1());
		lx.setGpsqdzh(lxsh.getGpsqdzh());
		lx.setGpszdzh(lxsh.getGpszdzh());
		if(bl){
			//jhshServer.updateLx(lx);
			jhshServer.updateLxqwh(lx);
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateLmgz(){
		Xmsq xmsq=new Xmsq();
		xmsq.setYlxbh(lxsh.getGhlxbm());
		xmsq.setXmbm(lxsh.getXmbm());
		xmsq.setQdzh(lxsh.getGhqdzh());
		xmsq.setZdzh(lxsh.getGhzdzh());
		XmsqServer xmsqServer=new XmsqServerImpl();
		xmsq.setBz("lxsh_lx where 1=1 and sffirst!='1' and jdbs='"+0+"'");
		Lx x2 = xmsqServer.querysflsjldg(xmsq);
		lxsh.setLsjl(x2.getLsjl());
		if("是".equals(x2.getLsjl())){
		lxsh.setLsxmbm(x2.getLsxmbm());
		lxsh.setLsxmid(x2.getLsxmid());
		}
		boolean bl=lxshServer.updateLmgz(lxsh);
		if(bl){
			//准备路线桩号信息
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			lx.setQdmc(lxsh.getQdmc());
			lx.setZdmc(lxsh.getZdmc());
			lx.setXjsdj(lxsh.getXjsdj());
			lx.setJsjsdj(lxsh.getJsjsdj());
			lx.setSffirst("1");
			lx.setJdbs("0");
			lx.setGhlxbm(lxsh.getGhlxbm());
			lx.setGhqdzh(lxsh.getGhqdzh());
			lx.setGhzdzh(lxsh.getGhzdzh());
			lx.setGxlxbm(lxsh.getGxlxbm());
			lx.setGxqdzh(lxsh.getGxqdzh());
			lx.setGxzdzh(lxsh.getGxzdzh());
			lx.setGhlxmc(lxsh.getGhlxmc());
			lx.setXmbm1(lxsh.getXmbm1());
			lx.setGpsqdzh(lxsh.getGpsqdzh());
			lx.setGpszdzh(lxsh.getGpszdzh());
			jhshServer.updateLxqwh(lx);
			
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateXj(){
		try{
			Xmsq xmsq=new Xmsq();
			xmsq.setYlxbh(lxsh.getXjlxbm());
			xmsq.setXmbm(lxsh.getXmbm());
			xmsq.setQdzh(lxsh.getXjqdzh());
			xmsq.setZdzh(lxsh.getXjzdzh());
			
			XmsqServer xmsqServer=new XmsqServerImpl();
			xmsq.setBz("lxsh_lx where 1=1 and sffirst!='1' and jdbs='"+0+"'");
			Lx x2 = xmsqServer.querysflsjldg(xmsq);
			lxsh.setLsjl(x2.getLsjl());
			if("是".equals(x2.getLsjl())){
			lxsh.setLsxmbm(x2.getLsxmbm());
			lxsh.setLsxmid(x2.getLsxmid());
			}
			boolean bl=lxshServer.updateXj(lxsh);
			//准备路线桩号信息
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			lx.setQdmc(lxsh.getQdmc());
			lx.setZdmc(lxsh.getZdmc());
			lx.setSffirst("1");
			lx.setJdbs("0");
			lx.setXmbm1(lxsh.getXmbm1());
			jhshServer.updateLxqwh(lx);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void selectSjgzshList(){
		//String tiaojian1="";
		String tiaojian2="";
		/*if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}*/
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		//lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		if(xmnf.indexOf(",")>-1){
			xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
			xmnf = "xmnf in ("+xmnf+")";
		}else{
			xmnf = "xmnf ='"+xmnf+"'";
		}
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		
		if(jsdj.indexOf(",")>-1){
			String[] split = jsdj.split(",");
			for (int i = 0; i < split.length; i++) {
				if(i==0){
					jsdj = "(lx.xjsdj like '%"+split[i]+"%'";
				}else if(i==split.length-1){
					jsdj += " or lx.xjsdj like '%"+split[i]+"%')";
				}else{
					jsdj += " or lx.xjsdj like '%"+split[i]+"%'";
				}
			}
		}else{
			if(!"".equals(jsdj)||jsdj==null)
			jsdj = "lx.xjsdj like '%"+jsdj+"%'";
			else{
				jsdj = "";
			}
		}
		
		if(jsjsdj.indexOf(",")>-1){
			String[] split = jsjsdj.split(",");
			for (int i = 0; i < split.length; i++) {
				if(i==0){
					jsjsdj = "(lx.jsjsdj like '%"+split[i]+"%'";
				}else if(i==split.length-1){
					jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%')";
				}else{
					jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%'";
				}
			}
		}else{
			if(!"".equals(jsjsdj)||jsjsdj==null)
				jsjsdj = "lx.jsjsdj like '%"+jsjsdj+"%'";
			else{
				jsjsdj = "";
			}
		}
		
		//System.out.println(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"lsxmbm"));
		//System.out.println(MyUtil.getQueryTJ(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		lxsh.setLsxmlx(MyUtil.getQueryTJ2(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
		lxsh.setTsdq(MyUtil.getQueryTJ(tsdq,"tsdq"));
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setLsjl(lsjl);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		//lxsh.setGhlxbh(ghlxbh);
		lxsh.setLxmc(lxmc);
		lxsh.setJsjsdj(jsjsdj);
		lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
		lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
		lxsh.setGhlxmc(ghlxmc);
		/*if(lxsh.getTsdq().length()>0){
			String[] tsdqs=lxsh.getTsdq().split(",");
			String tsdq="and(";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="tsdq like '%"+tsdqs[i]+"%'";
				else
					tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			lxsh.setTsdq(tsdq);
		}*/
		
		List<Lxsh> list=lxshServer.selectSjgzshList(lxsh);
		int count=lxshServer.selectSjgzshListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectLmgzshList(){
		//String tiaojian1="";
		String tiaojian2="";
		/*if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}*/
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		//lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		if(xmnf.indexOf(",")>-1){
			xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
			xmnf ="xmnf in ("+xmnf+")";
		}else{
			xmnf = "xmnf ='"+xmnf+"'";
		}
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		if(jsdj.indexOf(",")>-1){
			String[] split = jsdj.split(",");
			for (int i = 0; i < split.length; i++) {
				if(i==0){
					jsdj = "(lx.xjsdj like '%"+split[i]+"%'";
				}else if(i==split.length-1){
					jsdj += " or lx.xjsdj like '%"+split[i]+"%')";
				}else{
					jsdj += " or lx.xjsdj like '%"+split[i]+"%'";
				}
			}
		}else{
			if(!"".equals(jsdj)||jsdj==null)
			jsdj = "lx.xjsdj like '%"+jsdj+"%'";
			else{
				jsdj = "";
			}
		}
		if(jsjsdj.indexOf(",")>-1){
			String[] split = jsjsdj.split(",");
			for (int i = 0; i < split.length; i++) {
				if(i==0){
					jsjsdj = "(lx.jsjsdj like '%"+split[i]+"%'";
				}else if(i==split.length-1){
					jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%')";
				}else{
					jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%'";
				}
			}
		}else{
			if(!"".equals(jsjsdj)||jsjsdj==null)
				jsjsdj = "lx.jsjsdj like '%"+jsjsdj+"%'";
			else{
				jsjsdj = "";
			}
		}
		
		lxsh.setLsxmlx(MyUtil.getQueryTJ2(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));

		lxsh.setTsdq(MyUtil.getQueryTJ(tsdq,"tsdq"));
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setLsjl(lsjl);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		//lxsh.setGhlxbh(ghlxbh);
		lxsh.setLxmc(lxmc);
		lxsh.setJsjsdj(jsjsdj);
		lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
		lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
		lxsh.setGhlxmc(ghlxmc);
		/*if(lxsh.getTsdq().length()>0){
			String[] tsdqs=lxsh.getTsdq().split(",");
			String tsdq="and(";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="tsdq like '%"+tsdqs[i]+"%'";
				else
					tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			lxsh.setTsdq(tsdq);
		}*/
		List<Lxsh> list=lxshServer.selectLmgzshList(lxsh);
		int count=lxshServer.selectLmgzshListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectXjshList(){
		
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		lxsh.setXmmc(xmmc);
		if(xmnf.indexOf(",")>-1){
			xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
			xmnf = "xmnf in ("+xmnf+")";
		}else{
			xmnf = "xmnf = '"+xmnf+"'";
		}
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		
		if(jsdj.indexOf(",")>-1){
			String[] split = jsdj.split(",");
			for (int i = 0; i < split.length; i++) {
				if(i==0){
					jsdj = "(lx.xjsdj like '%"+split[i]+"%'";
				}else if(i==split.length-1){
					jsdj += " or lx.xjsdj like '%"+split[i]+"%')";
				}else{
					jsdj += " or lx.xjsdj like '%"+split[i]+"%'";
				}
			}
		}else{
			if(!"".equals(jsdj)||jsdj==null)
			jsdj = "lx.xjsdj like '%"+jsdj+"%'";
			else{
				jsdj = "";
			}
		}
		//int ssss = jsjsdj.indexOf(",");
		if(jsjsdj.indexOf(",")>-1){
			String[] split = jsjsdj.split(",");
			for (int i = 0; i < split.length; i++) {
				if(i==0){
					jsjsdj = "(lx.jsjsdj like '%"+split[i]+"%'";
				}else if(i==split.length-1){
					jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%')";
				}else{
					jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%'";
				}
			}
		}else{
			if(!"".equals(jsjsdj)||jsjsdj==null)
				jsjsdj = "lx.jsjsdj like '%"+jsjsdj+"%'";
			else{
				jsjsdj = "";
			}
		}
		lxsh.setLsxmlx(MyUtil.getQueryTJ2(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));

		lxsh.setTsdq(MyUtil.getQueryTJ(tsdq,"tsdq"));
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		//lxsh.setGhlxbh(ghlxbh);
		lxsh.setLxmc(lxmc);
		lxsh.setJsjsdj(jsjsdj);
		lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
		lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "xjlxbm"));
		lxsh.setGhlxmc(ghlxmc);
		List<Lxsh> list=lxshServer.selectXjshList(lxsh);
		int count=lxshServer.selectXjshListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void delSjgz(){
		boolean bl=lxshServer.delSjgz(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void delLmgz(){
		boolean bl=lxshServer.delLmgz(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void delXj(){
		boolean bl=lxshServer.delXj(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void shsjgzSbzt(){
		try{
			boolean bl=lxshServer.shsjgzSbzt(lxsh);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void shlmgzSbzt(){
		boolean bl=lxshServer.shlmgzSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void shxjSbzt(){
		boolean bl=lxshServer.shxjSbzt(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectLmgzList(){
		String tiaojian1="";
		String tiaojian2="";
		if(gydw.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydw+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydw+")";
		}
		if(xzqh.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqh+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqh+")";
		}
		lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
		lxsh.setGydw(tiaojian1);
		lxsh.setXmmc(xmmc);
		if(xmnf.indexOf(",")>-1){
			xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
			xmnf = "xmnf in ("+xmnf+")";
		}else{
			xmnf = "xmnf = '"+xmnf+"'";
		}
		lxsh.setXmnf(xmnf);
		if(!"".equals(sbzt)){
			lxsh.setSbzt1(sbzt);
		}
		lxsh.setSbthcd(sbthcd);
		lxsh.setTsdq(tsdq);
		lxsh.setGldj(gldj);
		lxsh.setJsdj(jsdj);
		lxsh.setLsjl(lsjl);
		lxsh.setPage(page);
		lxsh.setRows(rows);
		lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
		lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
		lxsh.setLxmc(lxmc);
		if(lxsh.getTsdq().length()>0){
			String[] tsdqs=lxsh.getTsdq().split(",");
			String tsdq="and(";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="tsdq like '%"+tsdqs[i]+"%'";
				else
					tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			lxsh.setTsdq(tsdq);
		}
		List<Lxsh> list=lxshServer.selectLmgzList(lxsh);
		int count=lxshServer.selectLmgzListCount(lxsh);
		EasyUIPage<Lxsh> e=new EasyUIPage<Lxsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void queryLxshLjLmgz(){
		try {
			String tiaojian1="";
			String tiaojian2="";
			if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")>-1){
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
				xmnf = "xmnf in ("+xmnf+")";
			}else{
				xmnf = "xmnf = '"+xmnf+"'";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(tsdq);
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setLsjl(lsjl);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
			lxsh.setLxmc(lxmc);
			if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}
			Map<String, String> result = lxshServer.queryLxshLjLmgz(lxsh);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryLxshShLjLmgz(){
		try {
			//String tiaojian1="";
			String tiaojian2="";
			/*if(gydw.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%"+gydw+"%'";
			}else{
				tiaojian1="and gydwdm in ("+gydw+")";
			}*/
			/*
			
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqh+")";
			}*/
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			//lxsh.setGydw(tiaojian1);
			lxsh.setXmmc(xmmc);
			if(xmnf.indexOf(",")>-1){
				xmnf = xmnf.substring(0,1).equals(",") ? xmnf.substring(1) : xmnf;
				xmnf = "xmnf in ("+xmnf+")";
			}else{
				xmnf = "xmnf = '"+xmnf+"'";
			}
			lxsh.setXmnf(xmnf);
			if(!"".equals(sbzt)){
				lxsh.setSbzt1(sbzt);
			}
			if(jsdj.indexOf(",")>-1){
				String[] split = jsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsdj = "(lx.xjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsdj += " or lx.xjsdj like '%"+split[i]+"%')";
					}else{
						jsdj += " or lx.xjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsdj)||jsdj==null)
				jsdj = "lx.xjsdj like '%"+jsdj+"%'";
				else{
					jsdj = "";
				}
			}
			//int ssss = jsjsdj.indexOf(",");
			if(jsjsdj.indexOf(",")>-1){
				String[] split = jsjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsjsdj = "(lx.jsjsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%')";
					}else{
						jsjsdj += " or lx.jsjsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				if(!"".equals(jsjsdj)||jsjsdj==null)
					jsjsdj = "lx.jsjsdj like '%"+jsjsdj+"%'";
				else{
					jsjsdj = "";
				}
			}
			lxsh.setLsxmlx(MyUtil.getQueryTJ2(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			lxsh.setSbthcd(sbthcd);
			lxsh.setTsdq(MyUtil.getQueryTJ(tsdq,"tsdq"));
			lxsh.setGldj(gldj);
			lxsh.setJsdj(jsdj);
			lxsh.setLsjl(lsjl);
			lxsh.setPage(page);
			lxsh.setRows(rows);
			//lxsh.setGhlxbh(ghlxbh);
			lxsh.setLxmc(lxmc);
			lxsh.setJsjsdj(jsjsdj);
			lxsh.setGhlxbh(MyUtil.getQueryTJ(ghlxbh, "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(ghlxbm, "ghlxbm"));
			lxsh.setGhlxmc(ghlxmc);
			/*if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}*/
			Map<String, String> result = lxshServer.queryLxshShLjLmgz(lxsh);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void qqglGpsroad(){
		if(xmmc!=null)
		lxsh.setXmmc(xmmc);
		if(xzqh!=null)
		lxsh.setXzqh(xzqh);
		if(xmlx!=null)
		lxsh.setXmlx(xmlx);
		if(xmbm!=null&&!xmbm.equals("")){
			String xmbmVal="";
			String[] val = xmbm.split(",");
			for (int i = 0; i < val.length; i++) {
				if(i==val.length-1){
					xmbmVal+="'"+val[i]+"'";}
				else{
					xmbmVal+="'"+val[i]+"',";
					}
				
			}
			lxsh.setXmbm(xmbmVal);
		}
		List<Lxsh> list=lxshServer.qqglGpsroad(lxsh);
		try {
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void hbxmSjgzlx(){
		if(xmlx!=null)
		lxsh.setXmlx(xmlx);
		if(xmbm!=null&&!xmbm.equals("")){
			String xmbmVal="";
			String[] val = xmbm.split(",");
			for (int i = 0; i < val.length; i++) {
				if(i==val.length-1){
					xmbmVal+="'"+val[i]+"'";}
				else{
					xmbmVal+="'"+val[i]+"',";
					}
				
			}
			lxsh.setXmbm(xmbmVal);
		}
		Lxsh l=lxshServer.hbxmSjgzlx(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void loadjsdj(){
		if(xmbm!=null&&!xmbm.equals("")){
			String xmbmVal="";
			String[] val = xmbm.split(",");
			for (int i = 0; i < val.length; i++) {
				if(i==val.length-1){
					xmbmVal+="'"+val[i]+"'";}
				else{
					xmbmVal+="'"+val[i]+"',";
					}
				
			}
			lxsh.setXmbm(xmbmVal);
		}
		try {
			JsonUtils.write(lxshServer.loadjsdj(lxsh), getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void selectSFCFLX(){
		boolean bl=lxshServer.selectSFCFLX(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void insertLx1(){
		try {
			Map<String, Object> result =new HashMap<String, Object>();
			Lx lx=new Lx();
			lx.setXmid(lxsh.getXmbm());
			lx.setLxbm(lxsh.getGhlxbh());
			lx.setQdzh(lxsh.getQdzh());
			lx.setZdzh(lxsh.getZdzh());
			JhshServer jhshServer=new JhshServerImpl();
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
			if(queryHaveLx==null){
				boolean bl=lxshServer.insertLx(lxsh);
				if(bl){
					result.put("result", "true");
				}else{
					result.put("result", "false");
				}
			}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteLxss(){
		boolean bl=lxshServer.deleteLx(lxsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void cxqdmc(){
		Lxsh l=lxshServer.cxqdmc(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void cxzdmc(){
		Lxsh l=lxshServer.cxzdmc(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void sfylx(){
		Lxsh l=lxshServer.sfylx(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void qqglGpszh(){
		Lxsh l=lxshServer.qqglGpszh(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void selectlxbyxmid(){
		List<Lxsh> l=lxshServer.selectlxbyxmid1(lxsh);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void dcModule(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydw=(String) session.getAttribute("gydwbb");	
			xzqh=(String) session.getAttribute("xzqhbb");
			tsdq=(String) session.getAttribute("tsdq");
			String tiaojian1="";
			String tiaojian2="";
			if(!gydw.equals("")&&gydw!=null){
				if(gydw.indexOf(",")==-1){
					tiaojian1="and t.gydwdm like '%"+gydw+"%'";
				}else{
					tiaojian1=" and t.gydwdm in ("+gydw+")";
				}
			}
			
			if(xzqh.indexOf(",")==-1){
				tiaojian2=" and t.xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2=" and t.xzqhdm in ("+xzqh+")";
			}
			if(lxsh.getXmnf().indexOf(",")>-1){
				lxsh.setXmnf("xmnf in ("+lxsh.getXmnf()+")");
			}else{
				lxsh.setXmnf("xmnf = '"+lxsh.getXmnf()+"'");
			}
			if(!lxsh.getJsdj().equals("") && lxsh.getJsdj()!=null){
				String xjsdj ="";
				if(lxsh.getJsdj().indexOf(",")>-1){
					String[] split = lxsh.getJsdj().split(",");
					for (int i = 0; i < split.length; i++) {
						if(i==0){
							xjsdj = "(lx.xjsdj like '%"+split[i]+"%'";
						}else if(i==split.length-1){
							xjsdj += " or lx.xjsdj like '%"+split[i]+"%')";
						}else{
							xjsdj += " or lx.xjsdj like '%"+split[i]+"%'";
						}
					}
				}else{
					xjsdj = "lx.xjsdj like '%"+lxsh.getJsdj()+"%'";
				}
				lxsh.setJsdj(xjsdj);
			}
			if(!lxsh.getJsjsdj().equals("")&&lxsh.getJsjsdj()!=null){
				String jsjsdj="";
				if(lxsh.getJsjsdj().indexOf(",")>-1){
					String [] spilt=lxsh.getJsjsdj().split(",");
					for(int i=0;i<spilt.length;i++){
						if(i==0){
							jsjsdj+="(lx.jsjsdj like '"+lxsh.getJsjsdj()+"'";
						}else if(i==spilt.length-1){
							jsjsdj+=" or lx.jsjsdj like '"+lxsh.getJsjsdj()+"')";
						}else{
							jsjsdj+=" or lx.jsjsdj like '"+lxsh.getJsjsdj()+"'";
						}
					}
				}else{
					jsjsdj="lx.jsjsdj like '%"+lxsh.getJsjsdj()+"%'";
				}
				lxsh.setJsjsdj(jsjsdj);
			}
			if(lxsh.getGldj()!=null){
				if(lxsh.getGldj().indexOf("G,")>-1){
					lxsh.setGldj("lxbm like 'G%'");
				}else if(lxsh.getGldj().indexOf("S,")>-1){
					lxsh.setGldj("lxbm like 'S%'");
				}else if(lxsh.getGldj().indexOf(",")>-1){
					String[] split = lxsh.getGldj().split(",");
					String g="";
					for (int i = 0; i < split.length; i++) {
						g+=i==split.length-1 ? "'"+split[i]+"'" : "'"+split[i]+"',";
					}
					g = "lxbm in ("+g+")";
					lxsh.setGldj(g);
				}else if(lxsh.getGldj().equals("")){
					lxsh.setGldj(null);
				}else{
					lxsh.setGldj("lxbm = '" + lxsh.getGldj() + "'");
				}
			}
			/*if(!lxsh.getTsdq().equals("")&&lxsh.getTsdq()!=null){
				if(lxsh.getTsdq().length()>0){
					String[] tsdqs=lxsh.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					lxsh.setTsdq(tsdq);
				}
			}*/
			
			lxsh.setXzqh(xzqhBm(xzqh, "t.xzqhdm2"));
			lxsh.setGydw(tiaojian1);
			lxsh.setTsdq(MyUtil.getQueryTJ(tsdq,"tsdq"));
			lxsh.setGhlxbh(MyUtil.getQueryTJ(lxsh.getGhlxbh(), "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(lxsh.getGhlxbm(), "ghlxbm"));
			lxsh.setLsxmlx(MyUtil.getQueryTJ2(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			String xmbt="";
			List<Excel_list> elist=new ArrayList<Excel_list>();
			if("gsdgz".equals(lxsh.getXmlx())){
				if(lxsh.getXmlx1()!=null)
					if(lxsh.getXmlx1().length()>0){
						String[] tsdqs=lxsh.getXmlx1().split(",");
						String tsdq="";
						for (int i = 0; i < tsdqs.length; i++) {
							if("全部".equals(tsdqs[i])){
								tsdq="";
								break;
							}
							if(i==0)
								tsdq+="and(xmlx1 like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or xmlx1 like '%"+tsdqs[i]+"%'";
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						lxsh.setXmlx1(tsdq);
					}
				xmbt="国省道改造";
				elist=lxshServer.querylxshgsd(lxsh);
			}
			if("sjgz".equals(lxsh.getXmlx())){
				xmbt="改建";
				elist=lxshServer.querylxshSjgz(lxsh);
			}
			if("lmgz".equals(lxsh.getXmlx())){
				xmbt="路面改造";
				elist=lxshServer.querylxshLmgz(lxsh);
			}
			if("xj".equals(lxsh.getXmlx())){
				xmbt="新建";
				elist=lxshServer.querylxshXj(lxsh);
			}
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName(xmbt+"工程项目立项审核信息表");//设置第一行 
			eldata.setSheetName("立项审核信息");//设置sheeet名
			eldata.setFileName(xmbt+"工程项目立项审核信息表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("项目编码",1,1,0,0));
			et.add(new Excel_tilte("项目名称",1,1,1,1));
			et.add(new Excel_tilte("原路线编码",1,1,2,2));
			et.add(new Excel_tilte("原路线名称",1,1,3,3));
			et.add(new Excel_tilte("原起点桩号",1,1,4,4));
			et.add(new Excel_tilte("原止点桩号",1,1,5,5));
			et.add(new Excel_tilte("规划路线编码",1,1,6,6));
			et.add(new Excel_tilte("规划路线名称",1,1,7,7));
			et.add(new Excel_tilte("规划起点桩号",1,1,8,8));
			et.add(new Excel_tilte("规划止点桩号",1,1,9,9));
			et.add(new Excel_tilte("共线路线编码",1,1,10,10));
			et.add(new Excel_tilte("共线起点桩号",1,1,11,11));
			et.add(new Excel_tilte("共线止点桩号",1,1,12,12));
			et.add(new Excel_tilte("起点名称",1,1,13,13));
			et.add(new Excel_tilte("止点名称",1,1,14,14));
			et.add(new Excel_tilte("建设性质",1,1,15,15));
			et.add(new Excel_tilte("管养单位",1,1,16,16));		
			et.add(new Excel_tilte("行政区划",1,1,17,17));
			et.add(new Excel_tilte("特殊地区",1,1,18,18));
			et.add(new Excel_tilte("建设技术等级",1,1,19,19));
			et.add(new Excel_tilte("现技术等级",1,1,20,20));
			et.add(new Excel_tilte("项目年份",1,1,21,21));
			et.add(new Excel_tilte("计划开工年",1,1,22,22));
			et.add(new Excel_tilte("计划完工年",1,1,23,23));
			et.add(new Excel_tilte("投资(万元)",1,1,24,24));
			et.add(new Excel_tilte("补助测算(万元)",1,1,25,25));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void dckxxModule(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydw=(String) session.getAttribute("gydwbb");	
			xzqh=(String) session.getAttribute("xzqhbb");
			tsdq=(String)session.getAttribute("tsdq");
			lxsh.setTsdq(tsdq);
			
			String tiaojian1="";
			String tiaojian2="";
			if(!gydw.equals("")&&gydw!=null){
				if(gydw.indexOf(",")==-1){
					tiaojian1="and lx.gydwdm like '%"+gydw+"%'";
				}else{
					tiaojian1="and lx.gydwdm in ("+gydw+")";
				}
			}
			
			if(xzqh.indexOf(",")==-1){
				tiaojian2="and lx.xzqhdm like '%"+xzqh+"%'";
			}else{
				tiaojian2="and lx.xzqhdm in ("+xzqh+")";
			}
			lxsh.setXzqh(xzqhBm(xzqh, "xzqhdm2"));
			lxsh.setGydw(tiaojian1);
			if(!lxsh.getJsdj().equals("") && lxsh.getJsdj()!=null){
				String jsdj1 ="";
				if(lxsh.getJsdj().indexOf(",")>-1){
					String[] jsdj2 = lxsh.getJsdj().split(",");
					for (int i = 0; i < jsdj2.length; i++) {
						if(i==0){
							jsdj1 = "(xjsdj like '%"+jsdj2[i]+"%'";
						}else if(i==jsdj2.length-1){
							jsdj1 += " or xjsdj like '%"+jsdj2[i]+"%')";
						}else{
							jsdj1 = " or xjsdj like '%"+jsdj2[i]+"%'";
						}
					}
				}else{
					jsdj1 = "xjsdj like '%"+lxsh.getJsdj()+"%'";
				}
				lxsh.setJsdj(jsdj1);
			}
			if(!lxsh.getXmnf().equals("") && lxsh.getXmnf()!=null){
				String xmnf1 ="";
				if(lxsh.getXmnf().indexOf(",")>-1){
					String[] split = lxsh.getXmnf().split(",");
					for (int i = 0; i < split.length; i++) {
						if(i==0){
							xmnf1 = "(xmbm like '"+split[i]+"%'";
						}else if(i==split.length-1){
							xmnf1 += " or xmbm like '"+split[i]+"%')";
						}else{
							xmnf1 += " or xmbm like '"+split[i]+"%'";
						}
					}
				}else{
					xmnf1 = "xmbm like '"+lxsh.getXmnf()+"%'";
				}
				lxsh.setXmnf(xmnf1);
			}
			if(lxsh.getGldj()!=null && !lxsh.getGldj().equals("")){
				String[] split1 = lxsh.getGldj().split(",");
				String g="";
				for (int i = 0; i < split1.length; i++) {
					g+=i==split1.length-1 ? "lxbm like '"+split1[i]+"%'" : "lxbm like '"+split1[i]+"%' or ";
				}
				g = "("+g+")";
				lxsh.setGldj(g);
			}
			String xmbt="";
			if(lxsh.getTsdq().length()>0){
				String[] tsdqs=lxsh.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lxsh.setTsdq(tsdq);
			}
			lxsh.setGhlxbh(MyUtil.getQueryTJ(lxsh.getGhlxbh(), "lxbm"));
			lxsh.setGhlxbm(MyUtil.getQueryTJ(lxsh.getGhlxbm(), "ghlxbm"));
			lxsh.setLsxmlx(MyUtil.getQueryTJ2(lxsh.getLsxmnf(),lxsh.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			lxsh.setLsxmnf(MyUtil.getQueryTJ(lxsh.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			List<Excel_list> elist=new ArrayList<Excel_list>();
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			
			if("gsdgz".equals(lxsh.getXmlx())){
				if(lxsh.getXmlx1()!=null)
					if(lxsh.getXmlx1().length()>0){
						String[] tsdqs=lxsh.getXmlx1().split(",");
						String tsdq="";
						for (int i = 0; i < tsdqs.length; i++) {
							if("全部".equals(tsdqs[i])){
								tsdq="";
								break;
							}
							if(i==0)
								tsdq+="and(t.xmlx1 like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or t.xmlx1 like '%"+tsdqs[i]+"%'";
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						lxsh.setXmlx1(tsdq);
					}
				if(!lxsh.getJsjsdj().equals("") && lxsh.getJsjsdj()!=null){
					String jsdj1 ="";
					if(lxsh.getJsjsdj().indexOf(",")>-1){
						String[] jsdj2 = lxsh.getJsjsdj().split(",");
						for (int i = 0; i < jsdj2.length; i++) {
							if(i==0){
								jsdj1 = "(jsjsdj like '%"+jsdj2[i]+"%'";
							}else if(i==jsdj2.length-1){
								jsdj1 += " or jsjsdj like '%"+jsdj2[i]+"%')";
							}else{
								jsdj1 = " or jsjsdj like '%"+jsdj2[i]+"%'";
							}
						}
					}else{
						jsdj1 = "jsjsdj like '%"+lxsh.getJsjsdj()+"%'";
					}
					lxsh.setJsjsdj(jsdj1);
				}
				xmbt="国省道";
				elist=lxshServer.querykxxgsd(lxsh);
				et.clear();
				et.add(new Excel_tilte("项目编码",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("行政区划",1,1,2,2));
				et.add(new Excel_tilte("原路线编码",1,1,3,3));
				et.add(new Excel_tilte("原路线名称",1,1,4,4));
				et.add(new Excel_tilte("原起点桩号",1,1,5,5));
				et.add(new Excel_tilte("原止点桩号",1,1,6,6));
				et.add(new Excel_tilte("规划路线编码",1,1,7,7));
				et.add(new Excel_tilte("规划路线名称",1,1,8,8));
				et.add(new Excel_tilte("规划起点桩号",1,1,9,9));
				et.add(new Excel_tilte("规划止点桩号",1,1,10,10));
				et.add(new Excel_tilte("共线路线编码",1,1,11,11));
				et.add(new Excel_tilte("共线起点桩号",1,1,12,12));
				et.add(new Excel_tilte("共线止点桩号",1,1,13,13));
				et.add(new Excel_tilte("里程",1,1,14,14));
				et.add(new Excel_tilte("一级公路",1,1,15,15));
				et.add(new Excel_tilte("二级公路",1,1,16,16));
				et.add(new Excel_tilte("三级公路",1,1,17,17));
				et.add(new Excel_tilte("四级公路",1,1,18,18));
				et.add(new Excel_tilte("等外公路",1,1,19,19));
				et.add(new Excel_tilte("无路",1,1,20,20));
				et.add(new Excel_tilte("建设后一级公路",1,1,21,21));
				et.add(new Excel_tilte("建设后二级公路",1,1,22,22));
				et.add(new Excel_tilte("建设后三级公路",1,1,23,23));
				et.add(new Excel_tilte("建设后四级公路",1,1,24,24));
				et.add(new Excel_tilte("建设后等外公路",1,1,25,25));
				et.add(new Excel_tilte("建设后无路",1,1,26,26));
				et.add(new Excel_tilte("建设性质",1,1,27,27));
				et.add(new Excel_tilte("特大桥(米)",1,1,28,28));
				et.add(new Excel_tilte("特大桥(座)",1,1,29,29));
				et.add(new Excel_tilte("建设技术等级",1,1,30,30));
				et.add(new Excel_tilte("隧道(米)",1,1,31,31));		
				et.add(new Excel_tilte("隧道(座)",1,1,32,32));
				et.add(new Excel_tilte("开工年月",1,1,33,33));
				et.add(new Excel_tilte("完工年月",1,1,34,34));
				et.add(new Excel_tilte("编制单位",1,1,35,35));
				et.add(new Excel_tilte("投资估算",1,1,36,36));
				et.add(new Excel_tilte("地方自筹",1,1,37,37));
				et.add(new Excel_tilte("银行贷款",1,1,38,38));
				et.add(new Excel_tilte("工可批复文号",1,1,39,39));
				et.add(new Excel_tilte("批复时间",1,1,40,40));
			}
			if("sjgz".equals(lxsh.getXmlx())){
				if(!lxsh.getJsjsdj().equals("") && lxsh.getJsjsdj()!=null){
					String jsdj1 ="";
					if(lxsh.getJsjsdj().indexOf(",")>-1){
						String[] jsdj2 = lxsh.getJsjsdj().split(",");
						for (int i = 0; i < jsdj2.length; i++) {
							if(i==0){
								jsdj1 = "(t.jsjsdj like '%"+jsdj2[i]+"%'";
							}else if(i==jsdj2.length-1){
								jsdj1 += " or t.jsjsdj like '%"+jsdj2[i]+"%')";
							}else{
								jsdj1 = " or t.jsjsdj like '%"+jsdj2[i]+"%'";
							}
						}
					}else{
						jsdj1 = "t.jsjsdj like '%"+lxsh.getJsjsdj()+"%'";
					}
					lxsh.setJsjsdj(jsdj1);
				}
				xmbt="改建";
				elist=lxshServer.querykxxSjgz(lxsh);
				et.clear();
				et.add(new Excel_tilte("项目编码",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("行政区划",1,1,2,2));
				et.add(new Excel_tilte("原路线编码",1,1,3,3));
				et.add(new Excel_tilte("原路线名称",1,1,4,4));
				et.add(new Excel_tilte("原起点桩号",1,1,5,5));
				et.add(new Excel_tilte("原止点桩号",1,1,6,6));
				et.add(new Excel_tilte("规划路线编码",1,1,7,7));
				et.add(new Excel_tilte("规划路线名称",1,1,8,8));
				et.add(new Excel_tilte("规划起点桩号",1,1,9,9));
				et.add(new Excel_tilte("规划止点桩号",1,1,10,10));
				et.add(new Excel_tilte("共线路线编码",1,1,11,11));
				et.add(new Excel_tilte("共线起点桩号",1,1,12,12));
				et.add(new Excel_tilte("共线止点桩号",1,1,13,13));
				et.add(new Excel_tilte("里程",1,1,14,14));
				et.add(new Excel_tilte("一级公路",1,1,15,15));
				et.add(new Excel_tilte("二级公路",1,1,16,16));
				et.add(new Excel_tilte("三级公路",1,1,17,17));
				et.add(new Excel_tilte("四级公路",1,1,18,18));
				et.add(new Excel_tilte("等外公路",1,1,19,19));
				et.add(new Excel_tilte("无路",1,1,20,20));
				et.add(new Excel_tilte("建设后一级公路",1,1,21,21));
				et.add(new Excel_tilte("建设后二级公路",1,1,22,22));
				et.add(new Excel_tilte("建设后三级公路",1,1,23,23));
				et.add(new Excel_tilte("建设后四级公路",1,1,24,24));
				et.add(new Excel_tilte("建设后等外公路",1,1,25,25));
				et.add(new Excel_tilte("建设后无路",1,1,26,26));
				et.add(new Excel_tilte("建设性质",1,1,27,27));
				et.add(new Excel_tilte("特大桥(米)",1,1,28,28));
				et.add(new Excel_tilte("特大桥(座)",1,1,29,29));
				et.add(new Excel_tilte("建设技术等级",1,1,30,30));
				et.add(new Excel_tilte("隧道(米)",1,1,31,31));		
				et.add(new Excel_tilte("隧道(座)",1,1,32,32));
				et.add(new Excel_tilte("开工年月",1,1,33,33));
				et.add(new Excel_tilte("完工年月",1,1,34,34));
				et.add(new Excel_tilte("编制单位",1,1,35,35));
				et.add(new Excel_tilte("投资估算",1,1,36,36));
				et.add(new Excel_tilte("地方自筹",1,1,37,37));
				et.add(new Excel_tilte("银行贷款",1,1,38,38));
				et.add(new Excel_tilte("工可批复文号",1,1,39,39));
				et.add(new Excel_tilte("批复时间",1,1,40,40));
			}
			if("lmgz".equals(lxsh.getXmlx())){
				et.add(new Excel_tilte("项目编码",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("行政区划",1,1,2,2));
				et.add(new Excel_tilte("原路线编码",1,1,3,3));
				et.add(new Excel_tilte("原路线名称",1,1,4,4));
				et.add(new Excel_tilte("原起点桩号",1,1,5,5));
				et.add(new Excel_tilte("原止点桩号",1,1,6,6));
				et.add(new Excel_tilte("规划路线编码",1,1,7,7));
				et.add(new Excel_tilte("规划路线名称",1,1,8,8));
				et.add(new Excel_tilte("规划起点桩号",1,1,9,9));
				et.add(new Excel_tilte("规划止点桩号",1,1,10,10));
				et.add(new Excel_tilte("共线路线编码",1,1,11,11));
				et.add(new Excel_tilte("共线起点桩号",1,1,12,12));
				et.add(new Excel_tilte("共线止点桩号",1,1,13,13));
				et.add(new Excel_tilte("里程",1,1,14,14));
				et.add(new Excel_tilte("一级公路",1,1,15,15));
				et.add(new Excel_tilte("二级公路",1,1,16,16));
				et.add(new Excel_tilte("三级公路",1,1,17,17));
				et.add(new Excel_tilte("四级公路",1,1,18,18));
				et.add(new Excel_tilte("等外公路",1,1,19,19));
				et.add(new Excel_tilte("无路",1,1,20,20));
				et.add(new Excel_tilte("建设后一级公路",1,1,21,21));
				et.add(new Excel_tilte("建设后二级公路",1,1,22,22));
				et.add(new Excel_tilte("建设后三级公路",1,1,23,23));
				et.add(new Excel_tilte("建设后四级公路",1,1,24,24));
				et.add(new Excel_tilte("建设后等外公路",1,1,25,25));
				et.add(new Excel_tilte("建设后无路",1,1,26,26));
				et.add(new Excel_tilte("建设性质",1,1,27,27));
				et.add(new Excel_tilte("特大桥(米)",1,1,28,28));
				et.add(new Excel_tilte("特大桥(座)",1,1,29,29));
				et.add(new Excel_tilte("建设技术等级",1,1,30,30));
				et.add(new Excel_tilte("隧道(米)",1,1,31,31));		
				et.add(new Excel_tilte("隧道(座)",1,1,32,32));
				et.add(new Excel_tilte("开工年月",1,1,33,33));
				et.add(new Excel_tilte("完工年月",1,1,34,34));
				et.add(new Excel_tilte("编制单位",1,1,35,35));
				et.add(new Excel_tilte("投资估算",1,1,36,36));
				et.add(new Excel_tilte("地方自筹",1,1,37,37));
				et.add(new Excel_tilte("银行贷款",1,1,38,38));
				et.add(new Excel_tilte("工可批复文号",1,1,39,39));
				et.add(new Excel_tilte("批复时间",1,1,40,40));
				xmbt="路面改造";
				if(!lxsh.getJsjsdj().equals("") && lxsh.getJsjsdj()!=null){
					String jsdj1 ="";
					if(lxsh.getJsjsdj().indexOf(",")>-1){
						String[] jsdj2 = lxsh.getJsjsdj().split(",");
						for (int i = 0; i < jsdj2.length; i++) {
							if(i==0){
								jsdj1 = "(jsjsdj like '%"+jsdj2[i]+"%'";
							}else if(i==jsdj2.length-1){
								jsdj1 += " or jsjsdj like '%"+jsdj2[i]+"%')";
							}else{
								jsdj1 = " or jsjsdj like '%"+jsdj2[i]+"%'";
							}
						}
					}else{
						jsdj1 = "jsjsdj like '%"+lxsh.getJsjsdj()+"%'";
					}
					lxsh.setJsjsdj(jsdj1);
				}
				elist=lxshServer.querykxxLmgz(lxsh);
			}
			if("xj".equals(lxsh.getXmlx())){
				et.add(new Excel_tilte("项目编码",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("行政区划",1,1,2,2));
				et.add(new Excel_tilte("路线编码",1,1,3,3));
				et.add(new Excel_tilte("起点桩号",1,1,4,4));
				et.add(new Excel_tilte("止点桩号",1,1,5,5));
				et.add(new Excel_tilte("里程",1,1,6,6));
				et.add(new Excel_tilte("新建路线编码",1,1,7,7));
				et.add(new Excel_tilte("新建起点桩号",1,1,8,8));
				et.add(new Excel_tilte("新建止点桩号",1,1,9,9));
				et.add(new Excel_tilte("新建里程",1,1,10,10));
				et.add(new Excel_tilte("一级公路",1,1,11,11));
				et.add(new Excel_tilte("二级公路",1,1,12,12));
				et.add(new Excel_tilte("三级公路",1,1,13,13));
				et.add(new Excel_tilte("四级公路",1,1,14,14));
				et.add(new Excel_tilte("等外公路",1,1,15,15));
				et.add(new Excel_tilte("无路",1,1,16,16));
				et.add(new Excel_tilte("建设性质",1,1,17,17));
				et.add(new Excel_tilte("特大桥(米)",1,1,18,18));
				et.add(new Excel_tilte("特大桥(座)",1,1,19,19));
				et.add(new Excel_tilte("建设技术等级",1,1,20,20));
				et.add(new Excel_tilte("隧道(米)",1,1,21,21));		
				et.add(new Excel_tilte("隧道(座)",1,1,22,22));
				et.add(new Excel_tilte("开工年月",1,1,23,23));
				et.add(new Excel_tilte("完工年月",1,1,24,24));
				et.add(new Excel_tilte("编制单位",1,1,25,25));
				et.add(new Excel_tilte("投资估算",1,1,26,26));
				et.add(new Excel_tilte("地方自筹",1,1,27,27));
				et.add(new Excel_tilte("银行贷款",1,1,28,28));
				et.add(new Excel_tilte("工可批复文号",1,1,29,29));
				et.add(new Excel_tilte("批复时间",1,1,30,30));
				xmbt="新建";
				if(!lxsh.getJsjsdj().equals("") && lxsh.getJsjsdj()!=null){
					String jsdj1 ="";
					if(lxsh.getJsjsdj().indexOf(",")>-1){
						String[] jsdj2 = lxsh.getJsjsdj().split(",");
						for (int i = 0; i < jsdj2.length; i++) {
							if(i==0){
								jsdj1 = "(jsjsdj like '%"+jsdj2[i]+"%'";
							}else if(i==jsdj2.length-1){
								jsdj1 += " or jsjsdj like '%"+jsdj2[i]+"%')";
							}else{
								jsdj1 = " or jsjsdj like '%"+jsdj2[i]+"%'";
							}
						}
					}else{
						jsdj1 = "jsjsdj like '%"+lxsh.getJsjsdj()+"%'";
					}
					lxsh.setJsjsdj(jsdj1);
				}
				elist=lxshServer.querykxxXj(lxsh);
			}
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName(xmbt+"工程项目工可信息表");//设置第一行 
			eldata.setSheetName("工可信息");//设置sheeet名
			eldata.setFileName(xmbt+"工程项目工可信息表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void importsjgzlxsh(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader1.readExcelContent(2,30,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			//获取项目编码
			for (Map map : data) {
				String xzqhdm="select id from XTGL_XZQH where trim(name)='"+map.get("22").toString()+"'";
				String xzqh=lxshServer.selectimportXmbm(xzqhdm);
				if(xzqh==null||xzqh==""||"".equals(xzqh)){
					response.getWriter().print(fileuploadFileName+"中  "+map.get("2").toString()+"  项目行政区划有误");
					return;
				}
				String tiaojian="select max(substr(xmbm,-3)) from lxsh_sjgz where xmbm like "+map.get("0").toString()+"||"+"(select id from XTGL_XZQH where trim(name)='"+map.get("22").toString()+"')"+"||'%' ";
				String xmbm=lxshServer.selectimportXmbm(tiaojian);
				if(xmbm==null||xmbm==""||"".equals(xmbm)){
					map.put("xmbm", map.get("0").toString()+xzqh+"1001");
				}else{
					xmbm=Integer.parseInt(xmbm)+1+"";
					if(xmbm.length()==1)
						xmbm=map.get("0").toString()+xzqh+"100"+xmbm;
					if(xmbm.length()==2)
						xmbm=map.get("0").toString()+xzqh+"10"+xmbm;
					if(xmbm.length()==3)
						xmbm=map.get("0").toString()+xzqh+"1"+xmbm;
					map.put("xmbm", xmbm);
				}
				//计算补助测算
				double bzcs=0;
				Lxsh ll=new Lxsh();
				ll.setXmlx("升级改造工程项目");
				ll.setGldj(map.get("1").toString().substring(0, 1));
				if(map.get("14").toString()!=null && !map.get("14").toString().equals("")){
					ll.setJsdj("一级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs= new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("15").toString()!=null && !map.get("15").toString().equals("")){
					ll.setJsdj("二级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("16").toString()!=null && !map.get("16").toString().equals("")){
					ll.setJsdj("三级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("17").toString()!=null && !map.get("17").toString().equals("")){
					ll.setJsdj("四级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("18").toString()!=null && !map.get("18").toString().equals("")){
					ll.setJsdj("等外");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("19").toString()!=null && !map.get("19").toString().equals("")){
					ll.setJsdj("无路");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				Lxsh l = lxshServer.selectbzcs(ll);
				
				if(l==null){
					response.getWriter().print(map.get("2").toString()+"  项目路线编码、建设技术等级有误");
					return;
				}
				BigDecimal b1=new BigDecimal(bzcs);
				BigDecimal b2=new BigDecimal(map.get("5").toString()).subtract(new BigDecimal(map.get("4").toString()));
				String bzys=b1.multiply(b2)+"";
				map.put("bzys", bzys);
			}
			boolean sfcg=true;
			sfcg=lxshServer.importsjgzlxsh(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void importlmgzlxsh(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader1.readExcelContent(2,23,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			//获取项目编码
			for (Map map : data) {
				String xzqhdm="select id from XTGL_XZQH where trim(name)='"+map.get("16").toString()+"'";
				String xzqh=lxshServer.selectimportXmbm(xzqhdm);
				if(xzqh==null||xzqh==""||"".equals(xzqh)){
					response.getWriter().print(fileuploadFileName+"中  "+map.get("2").toString()+"  项目行政区划有误");
					return;
				}
				String tiaojian="select max(substr(xmbm,-3)) from lxsh_lmgz where xmbm like "+map.get("0").toString()+"||"+"(select id from XTGL_XZQH where trim(name)='"+map.get("16").toString()+"')"+"||'%' ";
				String xmbm=lxshServer.selectimportXmbm(tiaojian);
				if(xmbm==null||xmbm==""||"".equals(xmbm)){
					map.put("xmbm", map.get("0").toString()+xzqh+"2001");
				}else{
					xmbm=Integer.parseInt(xmbm)+1+"";
					if(xmbm.length()==1)
						xmbm=map.get("0").toString()+xzqh+"200"+xmbm;
					if(xmbm.length()==2)
						xmbm=map.get("0").toString()+xzqh+"20"+xmbm;
					if(xmbm.length()==3)
						xmbm=map.get("0").toString()+xzqh+"2"+xmbm;
					map.put("xmbm", xmbm);
				}
				//计算补助测算
				double bzcs=0;
				Lxsh ll=new Lxsh();
				ll.setXmlx("路面改造工程项目");
				ll.setGldj(map.get("1").toString().substring(0, 1));
				if(map.get("8").toString()!=null && !map.get("8").toString().equals("")){
					ll.setJsdj("一级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs= new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("9").toString()!=null && !map.get("9").toString().equals("")){
					ll.setJsdj("二级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("10").toString()!=null && !map.get("10").toString().equals("")){
					ll.setJsdj("三级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("11").toString()!=null && !map.get("11").toString().equals("")){
					ll.setJsdj("四级");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("12").toString()!=null && !map.get("12").toString().equals("")){
					ll.setJsdj("等外");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				if(map.get("13").toString()!=null && !map.get("13").toString().equals("")){
					ll.setJsdj("无路");
					Lxsh selectbzcs = lxshServer.selectbzcs(ll);
					bzcs=bzcs+ new Double(selectbzcs.getBzys()).doubleValue();
				}
				Lxsh l = lxshServer.selectbzcs(ll);
				if(l==null){
					response.getWriter().print(map.get("2").toString()+"  项目路线编码、建设技术等级有误");
					return;
				}
				BigDecimal b1=new BigDecimal(bzcs);
				BigDecimal b2=new BigDecimal(map.get("5").toString()).subtract(new BigDecimal(map.get("4").toString()));
				String bzys=b1.multiply(b2)+"";
				map.put("bzys", bzys);
			}
			boolean sfcg=true;
			sfcg=lxshServer.importlmgzlxsh(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void importxjlxsh(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader1.readExcelContent(2,29,fs,Plan_gcgj.class);

			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader1.removeBlankRow(dataMapArray[0]);
			//获取项目编码
			for (Map map : data) {
				String xzqhdm="select id from XTGL_XZQH where trim(name)='"+map.get("20").toString()+"'";
				String xzqh=lxshServer.selectimportXmbm(xzqhdm);
				if(xzqh==null||xzqh==""||"".equals(xzqh)){
					response.getWriter().print(fileuploadFileName+"中  "+map.get("2").toString()+"  项目行政区划有误");
					return;
				}
				String tiaojian="select max(substr(xmbm,-3)) from lxsh_xj where xmbm like "+map.get("0").toString()+"||"+"(select id from XTGL_XZQH where trim(name)='"+map.get("20").toString()+"')"+"||'%' ";
				String xmbm=lxshServer.selectimportXmbm(tiaojian);
				if(xmbm==null||xmbm==""||"".equals(xmbm)){
					map.put("xmbm", map.get("0").toString()+xzqh+"3001");
				}else{
					xmbm=Integer.parseInt(xmbm)+1+"";
					if(xmbm.length()==1)
						xmbm=map.get("0").toString()+xzqh+"300"+xmbm;
					if(xmbm.length()==2)
						xmbm=map.get("0").toString()+xzqh+"30"+xmbm;
					if(xmbm.length()==3)
						xmbm=map.get("0").toString()+xzqh+"3"+xmbm;
					map.put("xmbm", xmbm);
				}
				map.put("bzys", map.get("27").toString());
			}
			boolean sfcg=true;
			sfcg=lxshServer.importxjlxsh(data);
			if(sfcg)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void cxsfcgsjd(){
		ResponseUtils.write(getresponse(), ""+lxshServer.cxsfcgsjd(wqbzbz));
	}
	public void delybsjd(){
		ResponseUtils.write(getresponse(), ""+lxshServer.delybsjd(wqbzbz));
	}
	public void xgybsjd(){
		ResponseUtils.write(getresponse(), ""+lxshServer.xgybsjd(wqbzbz));
	}
	public void tjybsjd(){
		ResponseUtils.write(getresponse(), ""+lxshServer.tjybsjd(wqbzbz));
	}
	public void xgybmrsjd(){
		ResponseUtils.write(getresponse(), ""+lxshServer.xgybmrsjd(wqbzbz));
	}
	public void selectYbsjd(){
		try {
			List<Wqbzbz> list=lxshServer.selectYbsjd(wqbzbz);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public void selectYbmrsjd(){
		try {
			List<Wqbzbz> list=lxshServer.selectYbmrsjd(wqbzbz);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public void selectWqbzbz(){
		try {
		List<Wqbzbz> list=lxshServer.selectWqbzbz();
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectWqjlbz(){
		try {
		List<Wqbzbz> list=lxshServer.selectWqjlbz();
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void tjwqbzbz(){
		boolean bl=lxshServer.tjwqbzbz(wqbzbz);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void xgwqbzbz(){
		String jsdj1=wqbzbz.getJsdj1().replaceAll(",,,",",");
		if(",".equals(jsdj1.substring(0, 1))){
			jsdj1=jsdj1.substring(1);
		}
		String jsdj2=wqbzbz.getJsdj().replaceAll(",,,",",");
		if(",".equals(jsdj2.substring(0, 1))){
			jsdj2=jsdj2.substring(1);
		}
		wqbzbz.setJsdj1(jsdj1);
		wqbzbz.setJsdj(jsdj2);
		boolean bl=lxshServer.xgwqbzbz(wqbzbz);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void delwqbzbz(){
		boolean bl=lxshServer.delwqbzbz(wqbzbz);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void queryXmqq(){
		try{
			Map<String, Object> result = new HashMap<String, Object>();
			//处理行政区划查询参数
			if(xzqh.equals("360000")){
				xzqh = xzqh.substring(0,2)+"%";
			}else if(xzqh.matches("^36[0-9][1-9]00$") || xzqh.matches("^36[1-9][0-9]00$")){
				xzqh = xzqh.substring(0,4)+"%";
			}
			Map<String, String> params = new HashMap<String, String>();
			if(xzqh.indexOf(",")==-1){
				int i=0;
				if(xzqh.matches("^[0-9]*[1-9]00$")){
					i=2;
				}else if(xzqh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				xzqh=xzqh.substring(0,xzqh.length()-i);
			}
			xzqh= xzqh.indexOf(",")==-1 ? " substr(xmbm,5,6)"+" like '%"+xzqh+"%'": " substr(xmbm,5,6)"+" in ("+xzqh+")";
			params.put("xzqhdm", xzqh);
			params.put("shzt", shzt1);
			params.put("jsxz", jsxz);
			params.put("lxbm", lxbm);
			params.put("wgny", wgny);
			//查询新增项目信息
			List<Kxxyj> list = lxshServer.queryXmQqfx(params);
			JsonUtils.write(list, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void queryXmQqfx(){
		try{
			Map<String, Object> result = new HashMap<String, Object>();
			//处理行政区划查询参数
			if(xzqh.equals("360000")){
				xzqh = xzqh.substring(0,2)+"%";
			}else if(xzqh.matches("^36[0-9][1-9]00$") || xzqh.matches("^36[1-9][0-9]00$")){
				xzqh = xzqh.substring(0,4)+"%";
			}
			Map<String, String> params = new HashMap<String, String>();
			if(xzqh.indexOf(",")==-1){
				int i=0;
				if(xzqh.matches("^[0-9]*[1-9]00$")){
					i=2;
				}else if(xzqh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				xzqh=xzqh.substring(0,xzqh.length()-i);
			}
			xzqh= xzqh.indexOf(",")==-1 ? " substr(xmbm,5,6)"+" like '%"+xzqh+"%'": " substr(xmbm,5,6)"+" in ("+xzqh+")";
			params.put("xzqhdm", xzqh);
			params.put("shzt", shzt1);
			params.put("jsxz", jsxz);
			params.put("lxbm", lxbm);
			params.put("wgny", wgny);
			params.put("xmbm", xmbm);
			//查询新增项目信息
			List<Kxxyj> list = lxshServer.queryXmQqfx(params);
			result.put("xjxm", list);
			List<String> lxArray = new ArrayList<String>();
			Map<String,String> xmbmArray = new HashMap<String, String>();
			Map<String, String> xzqhMap = new HashMap<String, String>();
			//获取新增项目的路线和行政区划，为下面的查询做准备
			for (Kxxyj kxxyj : list) {
				lxArray.add(kxxyj.getLxbm());
				xzqhMap.put(kxxyj.getXmbm().substring(4,10), kxxyj.getXzqh());
				xmbmArray.put(kxxyj.getXmbm(),kxxyj.getJdbs());
			}
			//处理获取到的路线编码
			HashSet<String> hsl = new HashSet<String>(lxArray);
			StringBuffer sb = new StringBuffer();
			int i=0;
			for (String lx : hsl) {
				sb.append(i==hsl.size()-1 ? "'"+lx+"'" : "'"+lx+"',");
				i++;
			}
			//查询原路线和完工后路线的信息
			//1、截止2014年底路线信息
			List<Map<String, String>> beform=null;
			if(!sb.toString().equals("")){
				beform = lxshServer.queryBeformXm(sb.toString());
				result.put("befrom", beform);
			}
			//2、完工后此路线的信息
			//2.1设置查询条件，查询最终阶段的项目信息
			StringBuffer sbXmbm = new StringBuffer();
			int m =0;
			for (Entry<String, String> xmbm : xmbmArray.entrySet()) {
				sbXmbm.append(m==xmbmArray.size()-1 ? "(xmid ='"+ xmbm.getKey()+"' and jdbs='"+xmbm.getValue()+"')" :
					"(xmid ='"+ xmbm.getKey()+"' and jdbs='"+xmbm.getValue()+"') or ");	
				m++;
			}
			List<Map<String, String>> ndwglx = new ArrayList<Map<String,String>>(beform);
			//2.2、查询到对应的项目信息
			List<Map<String, String>> list2 = lxshServer.queryNdwg(sbXmbm.toString());
			//2.3、计算完工后的里程
			for (Map<String, String> item : ndwglx) {
				for (Map<String, String> item2 : list2) {
					if(item2.get("LXBM")!=null){
						if(item.get("ROADCODE").toString().equals(item2.get("LXBM").toString())){
							double yi = Double.valueOf(String.valueOf(item.get("YJ"))).doubleValue() + Double.valueOf(String.valueOf(item2.get("JHYILC"))).doubleValue() - Double.valueOf(String.valueOf(item2.get("YILC"))).doubleValue();
							double er = Double.valueOf(String.valueOf(item.get("EJ"))).doubleValue() + Double.valueOf(String.valueOf(item2.get("JHERLC"))).doubleValue() - Double.valueOf(String.valueOf(item2.get("ERLC"))).doubleValue();
							double san = Double.valueOf(String.valueOf(item.get("SJ"))).doubleValue() + Double.valueOf(String.valueOf(item2.get("JHSANLC"))).doubleValue() - Double.valueOf(String.valueOf(item2.get("SANLC"))).doubleValue();
							double si = Double.valueOf(String.valueOf(item.get("SIJ"))).doubleValue() + Double.valueOf(String.valueOf(item2.get("JHSILC"))).doubleValue() - Double.valueOf(String.valueOf(item2.get("SILC"))).doubleValue();
							double wl = Double.valueOf(String.valueOf(item.get("WL"))).doubleValue() + Double.valueOf(String.valueOf(item2.get("JHWLLC"))).doubleValue() - Double.valueOf(String.valueOf(item2.get("WLLC"))).doubleValue();
							item.put("YJ", String.format("%.3f", yi));
							item.put("ER", String.format("%.3f", er));
							item.put("SJ", String.format("%.3f", san));
							item.put("SIJ", String.format("%.3f", si));
							item.put("WL", String.format("%.3f", wl));
							break;
						}
					}
				}
			}
			result.put("ndwglx", ndwglx);
			//3、查询市级的国省道统计
			//3.1、首先查询到所有相关市级年底完工的统计
			List<Map<String,String>> ndwgXzqh = lxshServer.queryNdwgXzqh(sbXmbm.toString(),false);
			List<Map<String, String>> beformXzqh = new ArrayList<Map<String,String>>();
			for (Entry<String, String> map : xzqhMap.entrySet()) {
				if(map.getKey().matches("^[0-9]*[1-9]00$")){
					i=2;
				}else if(map.getKey().matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				String xz =map.getKey().substring(0,map.getKey().length()-i);
				//3.2、查询到对应市级的截止2014年底的G、S道的总计，并加入到集合中
				List<Map<String,String>> queryBeformXmByXzqh = lxshServer.queryBeformXmByXzqh(xz,map.getValue());
				beformXzqh.addAll(queryBeformXmByXzqh);
				//3.3、此处是为了计算对应市级的年底完工后的国省道里程
				for (Map<String, String> item : ndwgXzqh) {
					if(map.getKey().equals(item.get("XZQHDM").toString())){
						for (Map<String, String> item2 : queryBeformXmByXzqh) {
							if(item.get("LXBM").equals(item2.get("ROADCODE"))){
								double yi = Double.valueOf(String.valueOf(item2.get("YJ"))).doubleValue() + Double.valueOf(String.valueOf(item.get("JHYILC"))) - Double.valueOf(String.valueOf(item.get("YILC")));
								double er = Double.valueOf(String.valueOf(item2.get("EJ"))).doubleValue() + Double.valueOf(String.valueOf(item.get("JHERLC"))) - Double.valueOf(String.valueOf(item.get("ERLC")));
								double san = Double.valueOf(String.valueOf(item2.get("SJ"))).doubleValue() + Double.valueOf(String.valueOf(item.get("JHSANLC"))) - Double.valueOf(String.valueOf(item.get("SANLC")));
								double si = Double.valueOf(String.valueOf(item2.get("SIJ"))).doubleValue() + Double.valueOf(String.valueOf(item.get("JHSILC"))) - Double.valueOf(String.valueOf(item.get("SILC")));
								double wl = Double.valueOf(String.valueOf(item2.get("WL"))).doubleValue() + Double.valueOf(String.valueOf(item.get("JHWLLC"))) - Double.valueOf(String.valueOf(item.get("WLLC")));
								item.put("JHYILC", String.valueOf(String.format("%.3f", yi)));
								item.put("JHERLC", String.valueOf(String.format("%.3f", er)));
								item.put("JHSANLC", String.valueOf(String.format("%.3f", san)));
								item.put("JHSILC", String.valueOf(String.format("%.3f", si)));
								item.put("JHWLLC", String.valueOf(String.format("%.3f", wl)));
								item.put("XZQHMC", item2.get("XZQHMC"));
								break;
							}
						}
					}
				}
			}
			//4、查询江西省的总的国省道的统计
			//4。1、查询原数据的省的统计
			beformXzqh.addAll(lxshServer.queryBeformXmByXzqh("36","江西省"));
			result.put("befrom2", beformXzqh);
			//4.2、查询此路线完工后的国省道统计
			ndwgXzqh.addAll(lxshServer.queryNdwgXzqh(sbXmbm.toString(),true));
			result.put("ndwgxzqh", ndwgXzqh);
			
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public Lx getLx() {
		return lx;
	}
	public void setLx(Lx lx) {
		this.lx = lx;
	}
	
	public void loadjsdjcd(){
		try {
			JsonUtils.write(lxshServer.loadjsdjcd(lxsh), getresponse().getWriter());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void thxmsqsh(){
		try {
			ResponseUtils.write(getresponse(), lxshServer.thxmsqsh(lxsh)+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void qxxm(){
		boolean bl=false;
		if(lxsh.getXmbm().substring(10,11).equals("1")){
			lxsh.setTj1("insert into jhsh_sjgz_qx select * from jhsh_sjgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj2("insert into lxsh_sjgz_qx select * from lxsh_sjgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj3("insert into kxxyj_sjgz_qx select * from kxxyj_sjgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj4("insert into cbsj_sjgz_qx select * from cbsj_sjgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj5("delete from jhsh_sjgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj6("delete from lxsh_sjgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj7("delete from kxxyj_sjgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj8("delete from cbsj_sjgz where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("2")){
			//lxsh.setBz("insert into jhsh_lmgz_qx select * from jhsh_lmgz where xmbm="+lxsh.getXmbm());
			//lxsh.setBzcs("delete from jhsh_lmgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj1("insert into jhsh_lmgz_qx select * from jhsh_lmgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj2("insert into lxsh_lmgz_qx select * from lxsh_lmgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj3("insert into kxxyj_lmgz_qx select * from kxxyj_lmgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj4("insert into cbsj_lmgz_qx select * from cbsj_lmgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj5("delete from jhsh_lmgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj6("delete from lxsh_lmgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj7("delete from kxxyj_lmgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj8("delete from cbsj_lmgz where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("3")){
			//lxsh.setBz("insert into jhsh_xj_qx select * from jhsh_xj where xmbm="+lxsh.getXmbm());
			//lxsh.setBzcs("delete from jhsh_xj where xmbm="+lxsh.getXmbm());
			lxsh.setTj1("insert into jhsh_xj_qx select * from jhsh_xj where xmbm="+lxsh.getXmbm());
			lxsh.setTj2("insert into lxsh_xj_qx select * from lxsh_xj where xmbm="+lxsh.getXmbm());
			lxsh.setTj3("insert into kxxyj_xj_qx select * from kxxyj_xj where xmbm="+lxsh.getXmbm());
			lxsh.setTj4("insert into cbsj_xj_qx select * from cbsj_xj where xmbm="+lxsh.getXmbm());
			lxsh.setTj5("delete from jhsh_xj where xmbm="+lxsh.getXmbm());
			lxsh.setTj6("delete from lxsh_xj where xmbm="+lxsh.getXmbm());
			lxsh.setTj7("delete from kxxyj_xj where xmbm="+lxsh.getXmbm());
			lxsh.setTj8("delete from cbsj_xj where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("4")){
			//lxsh.setBz("insert into jhsh_yhdzx_qx select * from jhsh_yhdzx where xmbm="+lxsh.getXmbm());
			//lxsh.setBzcs("delete from jhsh_yhdzx where xmbm="+lxsh.getXmbm());
			lxsh.setTj1("insert into jhsh_yhdzx_qx select * from jhsh_yhdzx where xmbm="+lxsh.getXmbm());
			lxsh.setTj2("insert into xmsq_yhdzx_qx select * from xmsq_yhdzx where xmbm="+lxsh.getXmbm());
			lxsh.setTj4("insert into cbsj_yhdzx_qx select * from cbsj_yhdzx where xmbm="+lxsh.getXmbm());
			lxsh.setTj5("delete from jhsh_yhdzx where xmbm="+lxsh.getXmbm());
			lxsh.setTj6("delete from xmsq_yhdzx where xmbm="+lxsh.getXmbm());
			lxsh.setTj8("delete from cbsj_yhdzx where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("5")){
			//lxsh.setBz("insert into jhsh_sh_qx select * from jhsh_sh where xmbm="+lxsh.getXmbm());
			//lxsh.setBzcs("delete from jhsh_sh where xmbm="+lxsh.getXmbm());
			lxsh.setTj1("insert into jhsh_sh_qx select * from jhsh_sh where xmbm="+lxsh.getXmbm());
			lxsh.setTj2("insert into xmsq_sh_qx select * from xmsq_sh where xmbm="+lxsh.getXmbm());
			//lxsh.setTj3("insert into kxxyj_sh_qx select * from kxxyj_sh where xmbm="+lxsh.getXmbm());
			lxsh.setTj4("insert into cbsj_sh_qx select * from cbsj_sh where xmbm="+lxsh.getXmbm());
			lxsh.setTj5("delete from jhsh_sh where xmbm="+lxsh.getXmbm());
			lxsh.setTj6("delete from xmsq_sh where xmbm="+lxsh.getXmbm());
			//lxsh.setTj7("delete from kxxyj_sh where xmbm="+lxsh.getXmbm());
			lxsh.setTj8("delete from cbsj_sh where xmbm="+lxsh.getXmbm());
		}
			bl=lxshServer.qxxm(lxsh);
		
		ResponseUtils.write(getresponse(), bl+"");
	}
	
	public void hfxm(){
		boolean bl=false;
		/*if(lxsh.getXmbm().substring(10,11).equals("1")){
			lxsh.setBz("insert into jhsh_sjgz select * from jhsh_sjgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setBzcs("delete from jhsh_sjgz_qx where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("2")){
			lxsh.setBz("insert into jhsh_lmgz select * from jhsh_lmgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setBzcs("delete from jhsh_lmgz_qx where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("3")){
			lxsh.setBz("insert into jhsh_xj select * from jhsh_xj_qx where xmbm="+lxsh.getXmbm());
			lxsh.setBzcs("delete from jhsh_xj_qx where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("4")){
			lxsh.setBz("insert into jhsh_yhdzx select * from jhsh_yhdzx_qx where xmbm="+lxsh.getXmbm());
			lxsh.setBzcs("delete from jhsh_yhdzx_qx where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("5")){
			lxsh.setBz("insert into jhsh_sh select * from jhsh_sh_qx where xmbm="+lxsh.getXmbm());
			lxsh.setBzcs("delete from jhsh_sh_qx where xmbm="+lxsh.getXmbm());
		}*/
		
		if(lxsh.getXmbm().substring(10,11).equals("1")){
			lxsh.setTj1("insert into jhsh_sjgz select * from jhsh_sjgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj2("insert into lxsh_sjgz select * from lxsh_sjgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj3("insert into kxxyj_sjgz select * from kxxyj_sjgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj4("insert into cbsj_sjgz select * from cbsj_sjgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj5("delete from jhsh_sjgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj6("delete from lxsh_sjgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj7("delete from kxxyj_sjgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj8("delete from cbsj_sjgz_qx where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("2")){
			//lxsh.setBz("insert into jhsh_lmgz_qx select * from jhsh_lmgz where xmbm="+lxsh.getXmbm());
			//lxsh.setBzcs("delete from jhsh_lmgz where xmbm="+lxsh.getXmbm());
			lxsh.setTj1("insert into jhsh_lmgz select * from jhsh_lmgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj2("insert into lxsh_lmgz select * from lxsh_lmgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj3("insert into kxxyj_lmgz select * from kxxyj_lmgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj4("insert into cbsj_lmgz select * from cbsj_lmgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj5("delete from jhsh_lmgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj6("delete from lxsh_lmgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj7("delete from kxxyj_lmgz_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj8("delete from cbsj_lmgz_qx where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("3")){
			//lxsh.setBz("insert into jhsh_xj_qx select * from jhsh_xj where xmbm="+lxsh.getXmbm());
			//lxsh.setBzcs("delete from jhsh_xj where xmbm="+lxsh.getXmbm());
			lxsh.setTj1("insert into jhsh_xj select * from jhsh_xj_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj2("insert into lxsh_xj select * from lxsh_xj_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj3("insert into kxxyj_xj select * from kxxyj_xj_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj4("insert into cbsj_xj select * from cbsj_xj_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj5("delete from jhsh_xj_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj6("delete from lxsh_xj_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj7("delete from kxxyj_xj_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj8("delete from cbsj_xj_qx where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("4")){
			//lxsh.setBz("insert into jhsh_yhdzx_qx select * from jhsh_yhdzx where xmbm="+lxsh.getXmbm());
			//lxsh.setBzcs("delete from jhsh_yhdzx where xmbm="+lxsh.getXmbm());
			lxsh.setTj1("insert into jhsh_yhdzx select * from jhsh_yhdzx_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj2("insert into xmsq_yhdzx select * from xmsq_yhdzx_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj4("insert into cbsj_yhdzx select * from cbsj_yhdzx_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj5("delete from jhsh_yhdzx_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj6("delete from xmsq_yhdzx_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj8("delete from cbsj_yhdzx_qx where xmbm="+lxsh.getXmbm());
		}
		if(lxsh.getXmbm().substring(10,11).equals("5")){
			//lxsh.setBz("insert into jhsh_sh_qx select * from jhsh_sh where xmbm="+lxsh.getXmbm());
			//lxsh.setBzcs("delete from jhsh_sh where xmbm="+lxsh.getXmbm());
			lxsh.setTj1("insert into jhsh_sh select * from jhsh_sh_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj2("insert into xmsq_sh select * from xmsq_sh_qx where xmbm="+lxsh.getXmbm());
			//lxsh.setTj3("insert into kxxyj_sh_qx select * from kxxyj_sh_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj4("insert into cbsj_sh select * from cbsj_sh_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj5("delete from jhsh_sh_qx where xmbm="+lxsh.getXmbm());
			lxsh.setTj6("delete from xmsq_sh_qx where xmbm="+lxsh.getXmbm());
			//lxsh.setTj7("delete from kxxyj_sh where xmbm="+lxsh.getXmbm());
			lxsh.setTj8("delete from cbsj_sh_qx where xmbm="+lxsh.getXmbm());
		}
		bl=lxshServer.qxxm(lxsh);
		
		ResponseUtils.write(getresponse(), bl+"");
	}
	
	public void qxxmth(){
		boolean bl=false;
		if(lxsh.getXmbm().substring(10,11).equals("1"))
			bl=lxshServer.qxxmgj1(lxsh);
		if(lxsh.getXmbm().substring(10,11).equals("2"))
			bl=lxshServer.qxxmlm1(lxsh);
		if(lxsh.getXmbm().substring(10,11).equals("3"))
			bl=lxshServer.qxxmxj1(lxsh);
		if(lxsh.getXmbm().substring(10,11).equals("4"))
			bl=lxshServer.qxxmyh1(lxsh);
		if(lxsh.getXmbm().substring(10,11).equals("5"))
			bl=lxshServer.qxxmzh1(lxsh);
		ResponseUtils.write(getresponse(), bl+"");
	}
	
	public void thwshlxsh(){
		boolean bl=lxshServer.thwshlxsh(lxsh);
		ResponseUtils.write(getresponse(), bl+"");
		
	}
	
	//退回立项审核到地市
	public void thlxshsb(){
		boolean bl=lxshServer.thlxshsb(lxsh);
		ResponseUtils.write(getresponse(), bl+"");
		
	}
	//退回立项审核到地市
		public void thlxshsbyhc(){
			boolean bl=lxshServer.thlxshsbyhc(lxsh);
			ResponseUtils.write(getresponse(), bl+"");
			
		}
}

