<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目字段选择列表</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/YMLib.js"></script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
</style>
</head>
<body>
<script type="text/javascript">
	$(function(){
		var nameValue;
		var colValue;
		var gydw=parent.$("#gydw").combotree("getValues");
		if(gydw.length==0){
			if($.cookie("unit2")=='_____36')
				gydwstr=36;
			else gydwstr= $.cookie("unit2");
		}else if(gydw.length==1){
			if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
			gydwstr=gydw[0] ;
		}else{
			gydwstr= gydw.join(',');
		}
	var xzqhdm=parent.$("#xzqh").combotree("getValues");
		if(xzqhdm.length==0){
			xzqhstr= $.cookie("dist2");
			
		}else if(xzqhdm.length==1){
			if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
 		xzqhstr=xzqhdm[0] ;
		}else{
			xzqhstr= xzqhdm.join(',');
		}
		var xzdj=parent.$('#xzdj').combobox("getValues").join(",");
		if(xzdj.substr(0,1)==',')
			xzdj=xzdj.substr(1,xzdj.length);
		var ddlYear1=parent.$('#ddlYear1').combobox("getValues").join(",");
		if(ddlYear1.substr(0,1)==',')
			ddlYear1=ddlYear1.substr(1,ddlYear1.length);
		var flag=parent.YMLib.Var.flag;
		var ybny=parent.$('#ddlYear').val()+"-"+parent.$('#ddlMonth').val();
		var sbnf=ddlYear1;
		var tiaojian=xzdj;
		var xzqh=xzqhstr;
		var gydw=gydwstr;
		var xmmc=parent.$('#xmmc').val();
		var lxmc=parent.$('#lxmc').val();
		
		$("#save_button").click(function(){
			nameValue=new Array();
			colValue= new Array();
			tableValue=new Array();
			tableCol=new Array();
			parent.YMLib.Var.sqlcol="";
			parent.YMLib.Var.tablecol="";
			var jhgc=false;var jhgczb=0;
			var bywcgcl=false;var bywcgclzb=0;
			var kglj=false;var kgljzb=0;
			var yykglj=false;var yykgljzb=0;
			var bz=false;var bzzb=0;
			$("input[name=checkbox]:checked").each(function(i,e){
				//alert(this.value+"    "+this.nextSibling.nodeValue+"");
				if(this.value=='jhgc'){jhgc=true;jhgczb=i;}
				if(this.value=='bywcgcl'){bywcgcl=true;bywcgclzb=i;}
				if(this.value=='kglj'){kglj=true;kgljzb=i;}
				if(this.value=='yykglj'){yykglj=true;yykgljzb=i;}
				if(this.value=='bz'){bz=true;bzzb=i;}
				colValue.push(this.value);
		    	nameValue.push(this.nextSibling.nodeValue);
		    	
			});
			var k=0;var sql='';
			var biaotstr='<tr>';
			if(jhgc){
				for(var i=0;i<jhgczb;i++){
					biaotstr+='<td rowspan="3" width="125px;">'+nameValue[i]+'</td>';
					sql+=colValue[i]+' v_'+k+',';
					k++;
				}
			}
			if(!jhgc&&bywcgcl){
				for(var i=0;i<bywcgclzb;i++){
					biaotstr+='<td rowspan="3" width="125px;">'+nameValue[i]+'</td>';
					sql+=colValue[i]+' v_'+k+',';
					k++;
				}
			}
			if(!jhgc&&!bywcgcl&&kglj){
				for(var i=0;i<kgljzb;i++){
					biaotstr+='<td rowspan="3" width="125px;">'+nameValue[i]+'</td>';
					sql+=colValue[i]+' v_'+k+',';
					k++;
				}
			}
			if(!jhgc&&!bywcgcl&&!kglj&&yykglj){
				for(var i=0;i<yykgljzb;i++){
					biaotstr+='<td rowspan="3" width="125px;">'+nameValue[i]+'</td>';
					sql+=colValue[i]+' v_'+k+',';
					k++;
				}
			}
			if(!jhgc&&!bywcgcl&&!kglj&&!yykglj){
				for(var i=0;i<nameValue.length;i++){
					biaotstr+='<td rowspan="3" width="125px;">'+nameValue[i]+'</td>';
					sql+=colValue[i]+' v_'+k+',';
					k++;
				}
			}
			if(jhgc){
				biaotstr+='<td colspan="11">计划工程</td>';
				sql+='pftz v_'+k+',ljtsf v_'+(k+1)+',ql_m v_'+(k+2)+',ql v_'+(k+3)+',hd v_'+(k+4)+',sd_m v_'+(k+5)+',sd v_'+(k+6)+',dc v_'+(k+7)+',jc v_'+(k+8)+',lqlm v_'+(k+9)+',snlm v_'+(k+10)+',';
				k=k+11;
			}
			if(bywcgcl){
				biaotstr+='<td colspan="12">本月完成工程量</td>';
				sql+='bywcje v_'+k+',decode(pftz,0,0,round((bywcje/pftz)*100,2))||'%' v_'+(k+1)+',bywcljtsf v_'+(k+2)+',byqlwcqk_ym v_'+(k+3)+',byqlwcqk_z v_'+(k+4)+',byhdwcqk_m v_'+(k+5)+',bysdwcqk_ym v_'+(k+6)+',bysdwcqk_z v_'+(k+7)+',bydcwcqk v_'+(k+8)+',byjcwcqk v_'+(k+9)+',bylqlmwcqk v_'+(k+10)+',bysnlmwcqk v_'+(k+11)+',';
				k=k+12;
			}
			if(kglj){
				biaotstr+='<td colspan="12">自开工累计完成工程量</td>';
				sql+='zjwcje v_'+k+',decode(pftz,0,0,round((zjwcje/pftz)*100,2))||'%' v_'+(k+1)+',zjwcljtsf v_'+(k+2)+',zjqlwcqk_ym v_'+(k+3)+',zjqlwcqk_z v_'+(k+4)+',zjhdwcqk_m v_'+(k+5)+',zjsdwcqk_ym v_'+(k+6)+',zjsdwcqk_z v_'+(k+7)+',zjdcwcqk v_'+(k+8)+',zjjcwcqk v_'+(k+9)+',zjlqlmwcqk v_'+(k+10)+',zjsnlmwcqk v_'+(k+11)+',';
				k=k+12;
			}
			if(yykglj){
				biaotstr+='<td colspan="4">本年元月至本月累计完成工程量</td>';
				sql+='bnwcje v_'+k+',decode(pftz,0,0,round((bnwcje/pftz)*100,2))||'%' v_'+(k+1)+',bnlqlmwcqk v_'+(k+2)+',bnsnlmwcqk v_'+(k+3)+',';
				k=k+4;
			}
			if(bz&&(jhgc||bywcgcl||kglj||yykglj)){
				biaotstr+='<td rowspan="3">备注</td>';
				sql+='bz v_'+k+',';
				k=k+1;
			}
			biaotstr+='</tr><tr>';
			if(jhgc){
				biaotstr+='<td rowspan="2" width="125px;">投资额<br>（万元）</td><td rowspan="2" width="125px;">路基土石方（m³）</td><td colspan="2">桥梁</td><td rowspan="2" width="125px;">涵洞（米）</td><td colspan="2">隧道</td><td colspan="4">路面工程（公里）</td>';
			}
			if(bywcgcl){
				biaotstr+='<td rowspan="2" width="125px;">投资额<br>（万元）</td><td rowspan="2" width="125px;">占投资比例（%）</td><td rowspan="2" width="125px;">路基土石方（m³）</td><td colspan="2">桥梁</td><td rowspan="2" width="125px;">涵洞（米）</td><td colspan="2">隧道</td><td colspan="4">路面工程（公里）</td>';
			}
			if(kglj){
				biaotstr+='<td rowspan="2" width="125px;">投资额<br>（万元）</td><td rowspan="2" width="125px;">占投资比例（%）</td><td rowspan="2" width="125px;">路基土石方（m³）</td><td colspan="2">桥梁</td><td rowspan="2" width="125px;">涵洞（米）</td><td colspan="2">隧道</td><td colspan="4">路面工程（公里）</td>';
			}
			if(yykglj){
				biaotstr+='<td rowspan="2" width="125px;">投资额<br>（万元）</td><td rowspan="2" width="125px;">占投资比例（%）</td><td colspan="2">路面工程<br>（公里）</td>';
			}
			biaotstr+='</tr><tr>';
			if(jhgc){
				biaotstr+='<td width="125px;">米</td><td width="125px;">座</td><td width="125px;">米</td><td width="125px;">座</td><td width="125px;">垫层</td><td width="125px;">基层</td><td width="125px;">沥青路面</td><td width="125px;">水泥路面</td>';
			}
			if(bywcgcl){
				biaotstr+='<td width="125px;">米</td><td width="125px;">座</td><td width="125px;">米</td><td width="125px;">座</td><td width="125px;">垫层</td><td width="125px;">基层</td><td width="125px;">沥青路面</td><td width="125px;">水泥路面</td>';
			}
			if(kglj){
				biaotstr+='<td width="125px;">米</td><td width="125px;">座</td><td width="125px;">米</td><td width="125px;">座</td><td width="125px;">垫层</td><td width="125px;">基层</td><td width="125px;">沥青路面</td><td width="125px;">水泥路面</td>';
			}
			if(yykglj){
				biaotstr+='<td width="125px;">沥青路面</td><td width="125px;">水泥路面</td>';
			}
			biaotstr+='</tr><tr>';
			
			var len=(k+1)*120+"px";
			parent.$("#bbtable").attr('width',len);
			
			if(flag=='flag'){
				var data = 'flag=flag&xmbb.ybny='+ybny+'&xmbb.sbnf='+sbnf
				+'&xmbb.jhgc='+jhgc+'&xmbb.jhgczb='+jhgczb
				+'&xmbb.bywcgcl='+bywcgcl+'&xmbb.bywcgclzb='+bywcgclzb
				+'&xmbb.kglj='+kglj+'&xmbb.kgljzb='+kgljzb
				+'&xmbb.yykglj='+yykglj+'&xmbb.yykgljzb='+yykgljzb+'&xmbb.bz='+bz
				+'&xmbb.tiaojian='+tiaojian+"&xmbb.xmmc="+xmmc+"&xmbb.lxmc="+lxmc;
				
				var da='gydw='+gydw+'&xzqh='+xzqh+'&sql='+sql+'&nameValue='+nameValue.join(',')+'&colValue='+colValue.join(',');
				$.ajax({
					type:'post',
					url:'/jxzhpt/gcbb/exportbbsj_set.do',
					dataType:'JSON',
					async: false,
					data:da,
					success:function(msg){
						window.open('/jxzhpt/gcbb/selGcsjJdbb.do?'+data);
					}
					});
				
				
			}else{
				var biaotou = parent.$("#biaotou");
				biaotou.empty();
				biaotou.append(biaotstr);
				
				var tbody = parent.$("#tbody_gcgj");
				tbody.empty();
				var xmbb = 'flag=""&xmbb.ybny='+ybny+'&xmbb.sbnf='+sbnf
				+'&xmbb.jhgc='+jhgc+'&xmbb.jhgczb='+jhgczb
				+'&xmbb.bywcgcl='+bywcgcl+'&xmbb.bywcgclzb='+bywcgclzb
				+'&xmbb.kglj='+kglj+'&xmbb.kgljzb='+kgljzb
				+'&xmbb.yykglj='+yykglj+'&xmbb.yykgljzb='+yykgljzb+
				'&xmbb.nameValue='+nameValue.join(',')+'&xmbb.colValue='+colValue.join(',')+
				'&xmbb.tiaojian='+tiaojian+"&xmbb.xzqh="+xzqh+"&xmbb.gydw="+gydw+"&xmbb.xmmc="+xmmc+"&xmbb.lxmc="+lxmc+"&xmbb.sql="+sql;
			
				$.ajax({
					type:'post',
					url:'/jxzhpt/gcbb/selGcsjJdbb.do',
					dataType:'JSON',
					async: false,
					data:xmbb,
					success:function(data){
						$.each(data,function(index,item){
							var tr="<tr>";
							for(var i=0;i<k;i++){
								var t='v_'+i;
								tr+="<td>"+item[t]+"</td>";
							}
							tr+="</tr>";
							tbody.append(tr);
						});
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
                        //alert(XMLHttpRequest.status);
                        //alert(XMLHttpRequest.readyState);
                        alert("后台错误");
                    },
				});
			}
			
			
			
			parent.$('#zdybb').window('destroy');
		});
		
		$("#qx_window").click(function(){
			parent.$('#zdybb').window('destroy');
		});	
	
		// 全选
		$("#qx").bind("click", function () {
            $("[name = checkbox]:checkbox").attr("checked", true);
          
        }); 

        // 全不选
        $("#bx").bind("click", function () {
            $("[name = checkbox]:checkbox").attr("checked", false);
           
        });

        // 反选
        $("#fx").bind("click", function () {
            $("[name = checkbox]:checkbox").each(function () {
                $(this).attr("checked", !$(this).attr("checked"));
            });
           
        });
        
       
        
	});
</script>


<center>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="2" cellspacing="1">
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;"align="center" >
					<input  type="radio" value="qx" name="radio" id="qx"/>全选
					<input  type="radio" value="fx" name="radio" id="fx"/>反选
					<input  type="radio" value="bx" name="radio" id="bx"/>不选
				</td>
			</tr>
			
			<tr  style="height: 200px;">
				<td style="background-color: #ffffff;width:34%" align="center" valign="top">
					<table border="0" style="margin-top: 0">
						<tr>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="xh" name="checkbox" class="part1"/>序号</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxbm" name="checkbox" class="part1"/>路线编码</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="xmmc" name="checkbox" class="part1"/>项目名称</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="jhnf" name="checkbox" class="part1"/>计划年度</td>
						
						</tr>
						
						<tr>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="xmlc" name="checkbox" class="part1"/>改造公里（公里）</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="yjsdj" name="checkbox" class="part1"/>原技术等级</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="jsjsbz" name="checkbox" class="part1"/>建设技术标准</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="sjkgsj" name="checkbox" class="part1"/>开工时间</td>
						
						</tr>
						
						<tr>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="jhgc" name="checkbox" class="part1"/>计划工程</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="bywcgcl" name="checkbox" class="part1"/>本月完成工程量</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="kglj" name="checkbox" class="part1"/>自开工累计完成工程量</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="yykglj" name="checkbox" class="part1"/>本年元月至本月累计完成工程量</td>
						
						</tr>
						<tr>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="bz" name="checkbox" class="part1"/>备注</td>
							
						</tr>
					</table>
				</td>
				
				
			</tr>
			
			<tr>
				<td colspan="6" style="background-color: #ffffff; height: 35px;"
					align="center"><a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确认</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></td>
			</tr>
			</table>
			</center>
</body>
</html>