package com.hdsx.jxzhpt.gcbb.server.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcbb.server.SjbbServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class SjbbServerImpl extends BaseOperate implements SjbbServer{
	public SjbbServerImpl() {
		super("gcbb", "jdbc");
	}

	@Override
	public List<SjbbMessage> getLwjgjsgzb(SjbbMessage sjbb) throws Exception{
		List<SjbbMessage> l=queryList("getLwjgjsgzb", sjbb);
		List<SjbbMessage> l_n=new ArrayList<SjbbMessage>();
		SjbbMessage temp=new SjbbMessage();
		DecimalFormat fnum = new DecimalFormat("##0.000");
		temp.setV_0("安保工程");
		temp.setV_1("合计");
		for(int j=2;j<=7;j++){
			String methodGetName = "getV_"+j;
			Float v_j = Float.parseFloat((String) temp.getClass().getMethod(methodGetName,  new Class[]{}).invoke(l.get(0),new Object[]{}))+
					Float.parseFloat((String) temp.getClass().getMethod(methodGetName,  new Class[]{}).invoke(l.get(1),new Object[]{}));
			temp.getClass().getMethod("setV_"+j,  String.class).invoke(temp,"0.0".equals(Double.parseDouble(fnum.format(v_j))+"")?"0":Double.parseDouble(fnum.format(v_j))+"");
		}
		l_n.add(temp);
		l_n.add(l.get(0));
		l_n.add(l.get(1));
		temp=new SjbbMessage();
		temp.setV_0("危桥改造");
		temp.setV_1("合计");
		for(int j=2;j<=7;j++){
			String methodGetName = "getV_"+j;
			Float v_j = Float.parseFloat((String) temp.getClass().getMethod(methodGetName,  new Class[]{}).invoke(l.get(2),new Object[]{}))+
					Float.parseFloat((String) temp.getClass().getMethod(methodGetName,  new Class[]{}).invoke(l.get(3),new Object[]{}));
			temp.getClass().getMethod("setV_"+j,  String.class).invoke(temp,"0.0".equals(Double.parseDouble(fnum.format(v_j))+"")?"0":Double.parseDouble(fnum.format(v_j))+"");
		}
		l_n.add(temp);
		l_n.add(l.get(2));
		l_n.add(l.get(3));
		l_n.add(l.get(4));
		return l_n;
	}

	@Override
	public List<SjbbMessage> getGzgcjz(SjbbMessage sjbb) throws Exception {
		List<SjbbMessage> l=queryList("getGzgcjz",sjbb);
		List<SjbbMessage> l_n=new ArrayList<SjbbMessage>();
		SjbbMessage temp=new SjbbMessage();
		DecimalFormat fnum = new DecimalFormat("##0.000");
		temp.setV_0("安保");
		temp.setV_1("合计");
		for(int j=2;j<=12;j++){
			String methodGetName = "getV_"+j;
			Float v_j = Float.parseFloat((String) temp.getClass().getMethod(methodGetName,  new Class[]{}).invoke(l.get(0),new Object[]{}))+
					Float.parseFloat((String) temp.getClass().getMethod(methodGetName,  new Class[]{}).invoke(l.get(1),new Object[]{}));
			temp.getClass().getMethod("setV_"+j,  String.class).invoke(temp,"0.0".equals(Double.parseDouble(fnum.format(v_j))+"")?"0":Double.parseDouble(fnum.format(v_j))+"");
		}
		
		if(!"0".equals(temp.getV_5())){
			temp.setV_13( fnum.format(Double.parseDouble(temp.getV_12())/Double.parseDouble(temp.getV_5())*100)+"" );
		}else{
			temp.setV_13("0");
		}
		if(!"0".equals(temp.getV_2())){
			temp.setV_14( fnum.format(Double.parseDouble(temp.getV_7())/Double.parseDouble(temp.getV_2())*100)+"" );
		}else{
			temp.setV_14("0");
		}
		if(!"0".equals(temp.getV_4())){
			temp.setV_15( fnum.format(Double.parseDouble(temp.getV_9())/Double.parseDouble(temp.getV_4())*100)+"" );
		}else{
			temp.setV_15("0");
		}
		if(!"0".equals(temp.getV_5())){
			temp.setV_16( fnum.format(Double.parseDouble(temp.getV_10())/Double.parseDouble(temp.getV_5())*100)+"" );
		}else{
			temp.setV_16("0");
		}
		if(!"0".equals(temp.getV_6())){
			temp.setV_17( fnum.format(Double.parseDouble(temp.getV_11())/Double.parseDouble(temp.getV_6())*100)+"" );
		}else{
			temp.setV_17("0");
		}
		
		l_n.add(temp);
		l_n.add(l.get(0));
		l_n.add(l.get(1));
		temp=new SjbbMessage();
		temp.setV_0("危桥");
		temp.setV_1("合计");
		for(int j=2;j<=12;j++){
			String methodGetName = "getV_"+j;
			Float v_j = Float.parseFloat((String) temp.getClass().getMethod(methodGetName,  new Class[]{}).invoke(l.get(2),new Object[]{}))+
					Float.parseFloat((String) temp.getClass().getMethod(methodGetName,  new Class[]{}).invoke(l.get(3),new Object[]{}));
			temp.getClass().getMethod("setV_"+j,  String.class).invoke(temp,"0.0".equals(Double.parseDouble(fnum.format(v_j))+"")?"0":Double.parseDouble(fnum.format(v_j))+"");
		}
		
		if(!"0".equals(temp.getV_5())){
			temp.setV_13( fnum.format(Double.parseDouble(temp.getV_12())/Double.parseDouble(temp.getV_5())*100)+"" );
		}else{
			temp.setV_13("0");
		}
		if(!"0".equals(temp.getV_2())){
			temp.setV_14( fnum.format(Double.parseDouble(temp.getV_7())/Double.parseDouble(temp.getV_2())*100)+"" );
		}else{
			temp.setV_14("0");
		}
		if(!"0".equals(temp.getV_4())){
			temp.setV_15( fnum.format(Double.parseDouble(temp.getV_9())/Double.parseDouble(temp.getV_4())*100)+"" );
		}else{
			temp.setV_15("0");
		}
		if(!"0".equals(temp.getV_5())){
			temp.setV_16( fnum.format(Double.parseDouble(temp.getV_10())/Double.parseDouble(temp.getV_5())*100)+"" );
		}else{
			temp.setV_16("0");
		}
		if(!"0".equals(temp.getV_6())){
			temp.setV_17( fnum.format(Double.parseDouble(temp.getV_11())/Double.parseDouble(temp.getV_6())*100)+"" );
		}else{
			temp.setV_17("0");
		}
		l_n.add(temp);
		l_n.add(l.get(2));
		l_n.add(l.get(3));
		l_n.add(l.get(4));
		return l_n;
		
	}

	@Override
	public List<SjbbMessage> getGdzctzjs(SjbbMessage sjbb) throws Exception {
		return queryList("getGdzctzjs",sjbb);
	}
	
}
