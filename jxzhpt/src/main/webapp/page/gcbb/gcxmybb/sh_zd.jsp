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
			var yhlb=false;var zb=0;
			var kjgr=false;
			var ylmlx=false;
			var sjlmlx=false;
			var zygc=false;
			var tze=false;
			var xxjd=false;
			var bz=false;
			
			$("input[name=checkbox]:checked").each(function(i,e){
				//alert(this.value+"    "+this.nextSibling.nodeValue+"");
				if(this.value=='yhlb'){yhlb=true;if(zb==0)zb=i;}
				if(this.value=='kjgr'){kjgr=true;if(zb==0)zb=i;}
				if(this.value=='ylmlx'){ylmlx=true;if(zb==0)zb=i;}
				if(this.value=='sjlmlx'){sjlmlx=true;if(zb==0)zb=i;}
				if(this.value=='zygc'){zygc=true;if(zb==0)zb=i;}
				if(this.value=='tze'){tze=true;if(zb==0)zb=i;}
				if(this.value=='xxjd'){xxjd=true;if(zb==0)zb=i;}
				if(this.value=='bz'){bz=true;if(zb==0)zb=i;}
				colValue.push(this.value);
		    	nameValue.push(this.nextSibling.nodeValue);
		    	
			});
			var k=0;var sql='';
			var biaotstr='<tr>';
			if(zb!=0)
			for(var i=0;i<zb;i++){
				biaotstr+='<td rowspan="4" width="125px;">'+nameValue[i]+'</td>';
				sql+=colValue[i]+' v_'+k+',';
				k++;
			}
			else
				for(var i=0;i<nameValue.length;i++){
					biaotstr+='<td rowspan="4" width="125px;">'+nameValue[i]+'</td>';
					sql+=colValue[i]+' v_'+k+',';
					k++;
				}
			if(yhlb){
				biaotstr+='<td colspan="3">养护类别（KM）</td>';
				sql+="decode(yhlb,'大修',yhlb,'')"+' v_'+k+','+"decode(yhlb,'中修',yhlb,'')"+' v_'+(k+1)+','+"decode(yhlb,'防御性养护',yhlb,'')"+' v_'+(k+2)+',';
				k=k+3;
			}
			if(kjgr){
				biaotstr+='<td rowspan="4" width="155px;">开工日--竣工日</td>';
				sql+="decode(sjkgsj,null,'',sjkgsj||'__'||sjwgsj) v_"+k+',';
				k++;
			}
			if(ylmlx){
				biaotstr+='<td rowspan="4">原路面类型</td>';
				sql+='ylmlx v_'+k+',';
				k++;
			}
			if(sjlmlx){
				biaotstr+='<td rowspan="4">设计路面类型</td>';
				sql+='sjlmlx v_'+k+',';
				k++;
			}
			if(zygc){
				biaotstr+='<td colspan="15">主 要 工 程 数 量 完 成 情 况</td>';
				sql+='dc v_'+k+',bywcdc v_'+(k+1)+',bnwcdc v_'+(k+2)+',zjwcdc v_'+(k+3)+",decode(dc,0,0,round((zjwcdc%2fdc)*100,2))||'%25' v_"+(k+4)+',jc v_'+(k+5)+',bywcjc v_'+(k+6)+',bnwcjc v_'+(k+7)+',zjwcjc v_'+(k+8)+",decode(jc,0,0,round((zjwcjc%2fjc)*100,2))||'%25' v_"+(k+9)+',mc v_'+(k+10)+',bywcmc v_'+(k+11)+',bnwcmc v_'+(k+12)+',zjwcmc v_'+(k+13)+",decode(mc,0,0,round((zjwcmc%2fmc)*100,2))||'%25' v_"+(k+14)+',';
				k=k+15;
			}
			if(tze){
				biaotstr+='<td colspan="6">投 资 额 完 成 情 况</td>';
				sql+='pfztz v_'+k+',gys v_'+(k+1)+',bywcje v_'+(k+2)+',bnwcje v_'+(k+3)+',zjwcje v_'+(k+4)+",decode(dc,0,0,round((zjwcje%2fpfztz)*100,2))||'%25' v_"+(k+5)+',';
				k=k+6;
			}
			if(xxjd){
				biaotstr+='<td rowspan="4">形象进度（未开工\在建\完工）</td>';
				sql+="(case when kgzt='0' then '未开工' when jgzt='0' then '在建' else '竣工' end) v_"+k+',';
				k++;
			}
			if(bz){
				biaotstr+='<td rowspan="4">备注</td>';
				sql+='bz v_'+k+',';
				k++;
				
			}
			biaotstr+='</tr><tr>';
			
			//12月9号，明天从这开始
			
			if(yhlb){
				biaotstr+='<td rowspan="3" width="125px;">大修（KM）</td><td rowspan="3" width="125px;">中修（KM）</td><td rowspan="3" width="125px;">预防性养护</td>';
			}
			if(zygc){
				biaotstr+='<td colspan="5">垫层</td><td colspan="5">基层</td><td colspan="5">面层</td>';
			}
			if(tze){
				biaotstr+='<td rowspan="3" width="125px;">计划（万元）</td><td rowspan="3" width="125px;">批准预算（万元）</td><td rowspan="3" width="125px;">本月完成（万元）</td><td colspan="3">累计</td>';
				biaotstr+='</tr><tr>';
			}
			
			if(zygc){
				biaotstr+='<td rowspan="2" width="125px;">计划数量（M³）</td>	<td rowspan="2" width="125px;">本月完成数量（M³）</td><td colspan="3" >累计</td><td rowspan="2" width="125px;">计划数量（M³）</td><td rowspan="2" width="125px;">本月完成数量（M³）</td><td colspan="3">累计</td><td rowspan="2" width="125px;">计划数量（M³）</td><td rowspan="2" width="125px;">本月完成数量（M³）</td><td colspan="3">累计</td>';
			}
			if(tze){
				biaotstr+='<td rowspan="2" width="125px;">年初至本月完成（万元）</td><td rowspan="2" width="125px;">自开工累计完成（万元）</td><td rowspan="2" width="125px;">完成比例(%)</td>';
				biaotstr+='</tr><tr>';
			}
			if(zygc){
				biaotstr+='<td width="125px;">年初至本月完成数量（M³）</td><td width="125px;">自开工累计完成数量（M³）</td><td width="125px;">完成比例(%)</td><td width="125px;">年初至本月完成数量（M³）</td><td width="125px;">自开工累计完成数量（M³）</td><td width="125px;">完成比例(%)</td><td width="125px;">年初至本月完成数量（M³）</td><td width="125px;">自开工累计完成数量（M³）</td><td width="125px;">完成比例(%)</td>';
				biaotstr+='</tr><tr>';
			}
			biaotstr=biaotstr.substr(0,biaotstr.length-4);
			//alert(biaotstr);
			var len=(k+1)*120+"px";
			parent.$("#bbtable").attr('width',len);

			if(flag=='flag'){
				
				var data = 'flag=flag&xmbb.ybny='+ybny+'&xmbb.sbnf='+sbnf
				+'&xmbb.yhlb='+yhlb+'&xmbb.zb='+zb
				+'&xmbb.kjgr='+kjgr+'&xmbb.ylmlx='+ylmlx
				+'&xmbb.sjlmlx='+sjlmlx+'&xmbb.zygc='+zygc
				+'&xmbb.tze='+tze+'&xmbb.xxjd='+xxjd+'&xmbb.bz='+bz
				+'&xmbb.tiaojian='+tiaojian+"&xmbb.xmmc="+xmmc+"&xmbb.lxmc="+lxmc;
				
				var da='gydw='+gydw+'&xzqh='+xzqh+'&sql='+sql+'&nameValue='+nameValue.join(',')+'&colValue='+colValue.join(',');
				$.ajax({
					type:'post',
					url:'/jxzhpt/gcbb/exportbbsj_set.do',
					dataType:'JSON',
					async: false,
					data:da,
					success:function(msg){
						window.open('/jxzhpt/gcbb/selShuihJdbb.do?'+data);
					}
					});
				
				
			}else{
				var biaotou = parent.$("#biaotou");
				biaotou.empty();
				biaotou.append(biaotstr);
				
				var tbody = parent.$("#tbody_gcgj");
				tbody.empty();
				var xmbb = 'flag=""&xmbb.ybny='+ybny+'&xmbb.sbnf='+sbnf
				+'&xmbb.yhlb='+yhlb+'&xmbb.zb='+zb
				+'&xmbb.kjgr='+kjgr+'&xmbb.ylmlx='+ylmlx
				+'&xmbb.sjlmlx='+sjlmlx+'&xmbb.zygc='+zygc
				+'&xmbb.tze='+tze+'&xmbb.xxjd='+xxjd+'&xmbb.bz='+bz+
				'&xmbb.nameValue='+nameValue.join(',')+'&xmbb.colValue='+colValue.join(',')+
				'&xmbb.tiaojian='+tiaojian+"&xmbb.xzqh="+xzqh+"&xmbb.gydw="+gydw+"&xmbb.xmmc="+xmmc+"&xmbb.lxmc="+lxmc+"&xmbb.sql="+sql;
			
				$.ajax({
					type:'post',
					url:'/jxzhpt/gcbb/selShuihJdbb.do',
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
								<input  type="checkbox" value="xmmc" name="checkbox" class="part1"/>项目名称</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="sfgyhbm" name="checkbox" class="part1"/>是否归口市局养护部门</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="jsdd" name="checkbox" class="part1"/>建设地点</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="lxbm" name="checkbox" class="part1"/>路线编码</td>
						
						</tr>
						
						<tr>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="qdzh" name="checkbox" class="part1"/>起讫点桩号</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="yhlc" name="checkbox" class="part1"/>里程长度（km）</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="yhlb" name="checkbox" class="part1"/>养护类别（KM）</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="kjgr" name="checkbox" class="part1"/>开工日--竣工日</td>
						
						</tr>
						
						<tr>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="ylmlx" name="checkbox" class="part1"/>原路面类型</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="sjlmlx" name="checkbox" class="part1"/>设计路面类型</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="zygc" name="checkbox" class="part1"/>主 要 工 程 数 量 完 成 情 况</td>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="tze" name="checkbox" class="part1"/>投 资 额 完 成 情 况</td>
						</tr>
						<tr>
							<td width="25%" style="background-color: #ffffff;" align="left">
								<input  type="checkbox" value="xxjd" name="checkbox" class="part1"/>形象进度（未开工\在建\完工）</td>
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