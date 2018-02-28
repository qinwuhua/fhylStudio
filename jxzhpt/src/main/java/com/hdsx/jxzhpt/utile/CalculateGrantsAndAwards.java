package com.hdsx.jxzhpt.utile;

public class CalculateGrantsAndAwards {	
	public static int calculateGrantsFromMinistry(String ghlxbm,String xzqh,String xmklx,String jsxz,String tsdq,String ztz,String jaf,
			String jhyilc,String jherlc,String jhsanlc) {
		double basicData = 0;
		double ztzVar = 0;	
		if (ztz != null && ztz.length() != 0) {
			ztzVar = Double.parseDouble(ztz);
		} 
		double jafVar = 0;
		if (jaf != null && jaf.length() != 0) {
			jafVar = Double.parseDouble(jaf);
		}

		if (tsdq == null) {tsdq = "";}
		
		if (jsxz == null) {jsxz = "";}
		
		if (xmklx== null) {xmklx = "";}
		
		if (ghlxbm == null) {ghlxbm = "";}
		
		if (xzqh == null) {xzqh = "";}
		
		if (jsxz.contains("改建") || jsxz.contains("新建")) {
			if (xmklx.contains("部库")) {
				if (xzqh.contains("赣州")) {
					if (ghlxbm.contains("G") || ghlxbm.contains("g")) {
						basicData = (Double.parseDouble(jhyilc) * 1200)
								+(Double.parseDouble(jherlc)*600);
					}
					if (ghlxbm.contains("S") || ghlxbm.contains("s")) {
						basicData = (Double.parseDouble(jhyilc)*420)
								+(Double.parseDouble(jherlc)*420)
								+(Double.parseDouble(jhsanlc)*252);
					}
				}else if (tsdq.contains("中央苏区")) {
					if (ghlxbm.contains("G") || ghlxbm.contains("g")) {
						basicData = (Double.parseDouble(jhyilc) * 1100)
								+(Double.parseDouble(jherlc)*550);
					}
					if (ghlxbm.contains("S") || ghlxbm.contains("s")) {
						basicData = (Double.parseDouble(jhyilc)*350)
								+(Double.parseDouble(jherlc)*350)
								+(Double.parseDouble(jhsanlc)*210);
					}
				}else {
					if (ghlxbm.contains("G") || ghlxbm.contains("g")) {
						basicData = (Double.parseDouble(jhyilc) * 1000)
								+(Double.parseDouble(jherlc)*500);
					}
					if (ghlxbm.contains("S") || ghlxbm.contains("s")) {
						basicData = (Double.parseDouble(jhyilc)*350)
								+(Double.parseDouble(jherlc)*350)
								+(Double.parseDouble(jhsanlc)*210);
					}
				}
		     //判断是不是部库国道升二				
			 if (jhyilc.equals("0") && !jherlc.equals("0") && jhsanlc.equals("0")) {
				double jslc = Double.parseDouble(jherlc);
				double policyData = Math.round(ztzVar/jslc);
				if (policyData >= 1200) {
					 basicData = upFloatPolicy(policyData,basicData);
				}
			}
		   }
		}
		if (jsxz.contains("路面改造")) {
			if (xmklx.contains("部库")) {
				if (xzqh.contains("赣州")) {
					if (ghlxbm.contains("G") || ghlxbm.contains("g")) {
						basicData = (Double.parseDouble(jhyilc) * 360)
								+(Double.parseDouble(jherlc)*180);
					}
				}else if (tsdq.contains("中央苏区")) {
					if (ghlxbm.contains("G") || ghlxbm.contains("g")) {
						basicData = (Double.parseDouble(jhyilc) * 330)
								+(Double.parseDouble(jherlc)*165);
					}	
				}else {
					if (ghlxbm.contains("G") || ghlxbm.contains("g")) {
						basicData = (Double.parseDouble(jhyilc) * 300)
								+(Double.parseDouble(jherlc)*150);
					}
				}
			}
		}
		return (int) Math.round(withinLimit(ztzVar,jafVar,basicData));
	}
	
	public static int calculateGrantsFromProvince(String ghlxbm,String xmklx,String jsxz,String ztz,String jaf,String jhyilc,String jherlc,String jhsanlc) {
		double basicData = 0;
		double ztzVar = 0;
		double jafVar = 0;
		
		if (jsxz == null) {jsxz = "";}

		if (xmklx == null) {xmklx = "";}
		
		if (ghlxbm == null) {ghlxbm = "";}
		
		if (ztz != null && ztz.length() != 0) {
			ztzVar = Double.parseDouble(ztz);
		}
		
		if (jaf != null && jaf.length() != 0) {
			jafVar = Double.parseDouble(jaf);
		}
			
		if (jsxz.contains("改建") || jsxz.contains("新建")) {
			if (xmklx.contains("省库")) {
				if (ghlxbm.contains("G") || ghlxbm.contains("g")) {
					basicData = (Double.parseDouble(jhyilc)*1000);
				}
				if (ghlxbm.contains("S") || ghlxbm.contains("s")) {
					basicData = (Double.parseDouble(jhyilc)*350)
							+(Double.parseDouble(jherlc)*350)
							+(Double.parseDouble(jhsanlc)*150);
				}
			}
		}
		return (int)Math.round(withinLimit(ztzVar,jafVar,basicData));
	}
	
	public static int calculateAwardsFromProvince(String ghlxbm,String xmklx,String jsxz,String jhyilc,String jherlc,String jhsanlc) {
		double basicData=0;
		if (jsxz == null) {jsxz = "";}
		
		if (xmklx == null) {xmklx = "";}
		
		if (ghlxbm == null) { ghlxbm = "";}
		
		if (jsxz.contains("改建") || jsxz.contains("新建")) {
			if (xmklx.contains("部库")) {
				if (ghlxbm.contains("G") || ghlxbm.contains("g")) {
					basicData = (Double.parseDouble(jherlc)*50);
				}
				if (ghlxbm.contains("S") || ghlxbm.contains("s")) {
					basicData = (Double.parseDouble(jherlc)*50)
							+(Double.parseDouble(jhsanlc)*50);
				}
			}
			if (xmklx.contains("省库")) {
				if (ghlxbm.contains("S") || ghlxbm.contains("s")) {
					basicData = (Double.parseDouble(jherlc)*50)
							+(Double.parseDouble(jhsanlc)*50);
				}
			}
		}
		return (int) Math.round(basicData);		
	} 
	
	public static double upFloatPolicy(double policyData, double basicData) {
		double data = 0;
		if (policyData >= 1200 && policyData <1400) {
			data = basicData * 1.1;			
		}else if (policyData >= 1400 && policyData <1600) {
			data = basicData * 1.2;	
		}else if (policyData >= 1600 && policyData <1800) {
			data = basicData * 1.3;	
		}else if (policyData >= 1800 && policyData <2000) {
			data = basicData * 1.4;	
		}else if (policyData >= 2000 && policyData <2200) {
			data = basicData * 1.5;	
		}else if (policyData >= 2200 && policyData <2400) {
			data = basicData * 1.6;	
		}else if (policyData >= 2400 && policyData <2600) {
			data = basicData * 1.7;	
		}else if (policyData >= 2600 && policyData <2800) {
			data = basicData * 1.8;	
		}else if (policyData >= 2800 && policyData <3000) {
			data = basicData * 1.9;	
		}else {
			data = basicData * 2.0;	
		}
		return data;
	}
	
	public static double withinLimit(double ztz,double jaf,double basicData) {
		double criterion = ztz * 0.7;	
		double minV1 = 0;
		double minV2 = 0;	
		if (ztz == 0) {
			minV1 = basicData;
		}else {
			minV1 = Math.min(basicData, criterion);
		}
		if (jaf == 0) {
			minV2 = minV1;
		}else {
			minV2 = Math.min(minV1, jaf);
		}
		return minV2;
	}
}
