<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修详细</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_yhdzx.js"></script>
	<script type="text/javascript">
		var lmjgjson,ymjson,sljson,glfjson;//1、存储路面结构的json字符串   2、存储延米数据的json 3、存储数量的json 4、存储管养费的json
		var xxId=parent.YMLib.Var.jhbm;
		var lxlist;
		$(function(){
			loadUnit("txtGYDWMC",$.cookie("unit")); 
			loadDist("txtXZQHMC",$.cookie("dist"));
			loadBmbm2('txtJSDJ','技术等级');
			loadBmbm2('txtGCFL','养护类别');
			loadBmbm2('txtGCFL','养护类别');
			loadCslx('selsmc','上面层');
			loadCslx('selzmc','中面层');
			loadCslx('selxmc','下面层');
			loadCslx('selfc','封层');
			loadCslx('selsjc','上基层');
			loadCslx('selzjc','中基层');
			loadCslx('selxjc','下基层');
			loadCslx('seldc','垫层');
			loadCslx('selyl','原路');
			$.ajax({
				type:'post',
				url:'../../../jhgl/queryYhdzxById.do',
				dataType:'json',
				data:'jh.id='+xxId,
				success:function(data){
					lxlist=data.plan_lx_yhdzxs;
					var sel =new Array();
					$.each(data.plan_lx_yhdzxs,function(index,item){
						var lx={"id":index,"text":(item.lxmc+"("+item.qdzh+"-"+item.zdzh+")")};
						sel.push(lx);
					});
					$('#sellx').combobox({    
					    data:sel,
					    valueField:'id',
					    textField:'text',
					    onChange:function(newValue,oldValue){
					    	sellx(newValue);
					    }
					});
					$('#sellx').combobox("setValue",sel.length-1);
					sellx(sel.length-1);
					$('#lblYear').html(data.sbnf);
					$('#txtGCFL').combobox('select',data.classify);
					$('#txtSBJF').html(data.reportingfee);
					$('#txtXMMC').html(data.xmmc);
					$('#txtBNBZZJ').html(data.nowyearsubsidyfund);
					$('#txtDC').html(data.dianceng);
					$('#txtJC').html(data.jiceng);
					$('#txtMC').html(data.surface);
					radioChecked("txtXJBS",data.mark);
					$('#txtPQI').val(data.pqi);
					$('#lblJTL').html(data.aadt);
					$('#txtSGTWH').html(data.constructnumber);
					$('#txtGKPFWH').html(data.replynumber);
					$('#txtSJPFWH').html(data.devisenumber);
					$('#txtJHXDWH').html(data.plandownnumber);
					$('#txtJSCZMS').html(data.description);
					$('#txtXCHSQK').html(data.xchsqk);
					$('#txtSTCBZ').html(data.remarks);
					$('#txtQTBZ').html(data.qtbz);
					$('#txtSJPFWHH').html(data.devisenumbder);
					$('#txtJhkgsj').html(data.jhkgsj);
					$('#txtJhwgsj').html(data.jhwgsj);
					$('#txtJhxdsj').html(data.xdsj);
					$('#ztz').html(data.totalinvest);
					$('#jhid').val(data.id);
					$('#lxhsjf').html(data.fee);
					$('#lxspjf').html(data.newfee);
					$('#dfptztz').html(data.totalplacefund);
					$('#zbzzj').html(data.totalsubsidyfund);
				}
			});
			if(roleName()=="省级"){
				$.each($('td [name=sdtd]'),function(index,item){
					$(item).hide();
				});
			}
		});
		function sbnf(id){
			var myDate = new Date();
			var years=[];
			var first;
			for(var i=0;i<=10;i++){
				if(i==0)
					first=myDate.getFullYear()-i;
				years.push({text:(myDate.getFullYear()-i)});
			}
			$('#'+id).combobox({    
			    data:years,
			    valueField:'text',    
			    textField:'text'   
			});
			$('#'+id).combobox("setValue",first);
		}
		function reckonsum(){
			var lmjg=0,ym=0,sl=0,glf=0,zjg=0;
			lmjgjson="{";//最后将路面结构、按延米、按数量、管理费的数据存储到json格式的字符串中
			var hdlczj=0,dzxkdzj=0;//核对里程总计、大中修宽度总计
			for(var i=0;i<$('#table_lx tr:gt(0)').length/6;i++){
				hdlczj=Number($('#txtHDLC').val());
				dzxkdzj=Number($('#txtyhdzxkd').val());
			}
			var smc= reckon(dzxkdzj,$('#txtsmchd').val(),$('#txtsmcdj').val());
			var sdsmc= reckon(dzxkdzj,$('#txtsmchd').val(),$('#txtsmcsddj').val());
			var smcjson='"上面层":{"clmc":"'+$('#selsmc').combobox("getValue")+
				'","hd":"'+$('#txtsmchd').val()+'","dj":"'+$('#txtsmcdj').val()+
				'","sddj":"'+$('#txtsmcsddj').val()+'"}';
			lmjgjson+=smcjson+",";
			
			var zmc= reckon(dzxkdzj,$('#txtzmchd').val(),$('#txtzmcdj').val());
			var sdzmc= reckon(dzxkdzj,$('#txtzmchd').val(),$('#txtzmcsddj').val());
			var zmcjson='"中面层":{"clmc":"'+$('#selzmc').combobox("getValue")+
			'","hd":"'+$('#txtzmchd').val()+'","dj":"'+$('#txtzmcdj').val()+
			'","sddj":"'+$('#txtzmcsddj').val()+'"}';
			lmjgjson+=zmcjson+",";
			
			var xmc= reckon(dzxkdzj,$('#txtxmchd').val(),$('#txtxmcdj').val());
			var sdxmc= reckon(dzxkdzj,$('#txtxmchd').val(),$('#txtxmcsddj').val());
			var xmcjson='"下面层":{"clmc":"'+$('#selxmc').combobox("getValue")+
			'","hd":"'+$('#txtxmchd').val()+'","dj":"'+$('#txtxmcdj').val()+
			'","sddj":"'+$('#txtxmcsddj').val()+'"}';
			lmjgjson+=xmcjson+",";
			
			var fc= reckon(dzxkdzj,$('#txtfchd').val(),$('#txtfcdj').val());
			var sdfc= reckon(dzxkdzj,$('#txtfchd').val(),$('#txtfcsddj').val());
			var fcjson='"封层":{"clmc":"'+$('#selfc').combobox("getValue")+
			'","hd":"'+$('#txtfchd').val()+'","dj":"'+$('#txtfcdj').val()+
			'","sddj":"'+$('#txtfcsddj').val()+'"}';
			lmjgjson+=fcjson+",";
			
			var sjc= reckon(dzxkdzj,$('#txtsjchd').val(),$('#txtsjcdj').val());
			var sdsjc= reckon(dzxkdzj,$('#txtsjchd').val(),$('#txtsjcsddj').val());
			var sjcjson='"上基层":{"clmc":"'+$('#selsjc').combobox("getValue")+
			'","hd":"'+$('#txtsjchd').val()+'","dj":"'+$('#txtsjcdj').val()+
			'","sddj":"'+$('#txtsjcsddj').val()+'"}';
			lmjgjson+=sjcjson+",";
			
			var zjc= reckon(dzxkdzj,$('#txtzjchd').val(),$('#txtzjcdj').val());
			var sdzjc= reckon(dzxkdzj,$('#txtzjchd').val(),$('#txtzjcsddj').val());
			var zjcjson='"中基层":{"clmc":"'+$('#selzjc').combobox("getValue")+
			'","hd":"'+$('#txtzjchd').val()+'","dj":"'+$('#txtzjcdj').val()+
			'","sddj":"'+$('#txtzjcsddj').val()+'"}';
			lmjgjson+=zjcjson+",";
			
			var xjc= reckon(dzxkdzj,$('#txtxjchd').val(),$('#txtxjcdj').val());
			var sdxjc= reckon(dzxkdzj,$('#txtxjchd').val(),$('#txtxjcsddj').val());
			var xjcjson='"下基层":{"clmc":"'+$('#selxjc').combobox("getValue")+
			'","hd":"'+$('#txtxjchd').val()+'","dj":"'+$('#txtxjcdj').val()+
			'","sddj":"'+$('#txtxjcsddj').val()+'"}';
			lmjgjson+=xjcjson+",";
			
			var dc= reckon(dzxkdzj,$('#txtdchd').val(),$('#txtdcdj').val());
			var sddc= reckon(dzxkdzj,$('#txtdchd').val(),$('#txtdcsddj').val());
			var dcjson='"垫层":{"clmc":"'+$('#seldc').combobox("getValue")+
			'","hd":"'+$('#txtdchd').val()+'","dj":"'+$('#txtdcdj').val()+
			'","sddj":"'+$('#txtdcsddj').val()+'"}';
			lmjgjson+=dcjson+",";
			
			var yl= reckon(dzxkdzj,$('#txtylhd').val(),$('#txtyldj').val());
			var sdyl= reckon(dzxkdzj,$('#txtylhd').val(),$('#txtylsddj').val());
			var yljson='"原路":{"clmc":"'+$('#selyl').combobox("getValue")+
			'","hd":"'+$('#txtylhd').val()+'","dj":"'+$('#txtyldj').val()+
			'","sddj":"'+$('#txtylsddj').val()+'"}';
			lmjgjson+=yljson+"}";
			
			lmjg=smc+zmc+xmc+fc+sjc+zjc+xjc+dc+yl;
			//获取延米集合
			ymjson=new Array();//存储延米数据的json
			var ymArray=$("#ymtab tr:gt(0)");
			$.each(ymArray,function(index,item){
				var ymMessage=$("#"+item.id+" input[type=text]");
				ym+=($(ymMessage[2]).val())*($(ymMessage[3]).val())/10000;
				var y={id:item.id,xmmc:$(ymMessage[0]).val(),sm:$(ymMessage[1]).val(),
						cd:$(ymMessage[2]).val(),dj:$(ymMessage[3]).val()};
				ymjson.push(y);
			});
			//获取数量集合，计算价格
			sljson=new Array();
			var slArray=$("#sltab tr:gt(0)");
			$.each(slArray,function(index,item){
				var slMessage=$("#"+item.id+" input[type=text]");
				sl+=($(slMessage[2]).val())*($(slMessage[3]).val())/10000;
				var s={id:item.id,xmmc:$(slMessage[0]).val(),sm:$(slMessage[1]).val(),
						sl:$(slMessage[2]).val(),dj:$(slMessage[3]).val()};
				sljson.push(s);
			});
			//计算总单价
			zjg=lmjg+ym+sl;
			//评估价格
			var pgjg=sdsmc+sdzmc+sdxmc+sdfc+sdsjc+sdzjc+sdxjc+sddc+sdyl+ym+sl;
			if($('#seldw').val()=="百分比"){
				zjg=zjg*(Number(1)+Number($('#txtglfdj').val()/100));
				pgjg=pgjg*(Number(1)+Number($('#txtglfdj').val()/100));
			}else if($('#seldw').val()=="公里"){
				zjg=Number(zjg)+Number($('#txtglfdj').val()/10000);
				pgjg=Number(pgjg)+Number($('#txtglfdj').val()/10000);
			}
			pgjg=pgjg.toFixed(3);
			glfjson={dw:$('#seldw').val(),dj:$('#txtglfdj').val(),ysdj:zjg.toFixed(3),pgdj:pgjg};
			$('#lblysdj').html(zjg.toFixed(3));
			$('#lblpgdj').html(pgjg);
			/*var hsjf=(zjg.toFixed(3)*Number(hdlczj)).toFixed(3);
			$('#lxhsjf').html(hsjf);
			$('#lxspjf').html((pgjg*(hdlczj)).toFixed(3));
			$('#dfptztz').html(($('#ztz').html()-$('#lxspjf').html()).toFixed(3));
			$('#zbzzj').html($('#lxspjf').html())*/;
		}
		function reckon(kd,hd,dj){
			return (kd*(hd/100)*1000)*dj/10000;
		}
		function reckonsd(kd,hd,sddj){
			return (kd*(hd/100)*1000)*sddj/10000;
		}
		function sellx(newValue){
			var lmdate=$.parseJSON(lxlist[newValue].lmjg);
			if(lmdate["路基宽度增加"]!=null && lmdate["路基宽度增加"].ljkd=="true"){
				$('#ljkdzj').attr("checked", true);
			}else{
				$('#ljkdzj').attr("checked", false);
			}
			$('#txtGYDWMC').combotree('setValue', lxlist[newValue].gydwdm);
			$('#txtXZQHMC').combotree('setValue', lxlist[newValue].xzqhdm);
			$('#lxid').html(lxlist[newValue].lxid);
			$('#txtLXBM').html(lxlist[newValue].lxbm);
			$('#txtLXMC').html(lxlist[newValue].lxmc);
			$('#txtQDZH').html(lxlist[newValue].qdzh);
			$('#txtZDZH').html(lxlist[newValue].zdzh);
			$('#txtLC').html(lxlist[newValue].qzlc);
			$('#txtHDLC').html(lxlist[newValue].hdlc);
			$('#txtyhdzxkd').html(lxlist[newValue].dzxkd);
			$('#txtJSDJ').combobox('setValue', lxlist[newValue].yjsdj);
			$('#txtYLMLX').html(lxlist[newValue].ylmlx);
			$('#txtYLMKD').html(lxlist[newValue].ylmkd);
			$('#txtYLMHD').html(lxlist[newValue].ylmhd);
			$('#txtBHNR').html(lxlist[newValue].bhnr);
			
			if(lxlist[newValue].lmjg!=""){
				loadYhdzxcs(lmdate,"上面层","smc");
				loadYhdzxcs(lmdate,"中面层","zmc");
				loadYhdzxcs(lmdate,"下面层","xmc");
				loadYhdzxcs(lmdate,"封层","fc");
				loadYhdzxcs(lmdate,"上基层","sjc");
				loadYhdzxcs(lmdate,"中基层","zjc");
				loadYhdzxcs(lmdate,"下基层","xjc");
				loadYhdzxcs(lmdate,"垫层","dc");
				loadYhdzxcs(lmdate,"原路","yl");
			}
			if(lxlist[newValue].aym!=""){
				$('#ymtab tr:eq(1)').remove();
				$.each(JSON.parse(lxlist[newValue].aym),function(index,item){
					var html='<tr align="center" id="'+item.id+'"><td align="center" height="30" style="border: 1px solid #C0C0C0;"><input type="text" value="'+item.xmmc+'" style="width: 180px;"/></td><td align="center" style="border: 1px solid #C0C0C0;"><input value="'+item.sm+'" type="text" style="width:100px;"/></td><td align="center" width="50" style="border: 1px solid #C0C0C0;"><input type="text" value="'+item.cd+'" style="width:50px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><input value="'+item.dj+'" type="text" style="width:80px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><a href="javascript:removeasl('+"'"+item.id+"'"+')" style="text-decoration: none;color: blue;">删除</a></td></tr>';
					$('#ymtr').after(html);
				});
			}
			if(lxlist[newValue].asl!=""){
				$('#sltab tr:eq(1)').remove();
				$.each(JSON.parse(lxlist[newValue].asl),function(index,item){
					var html='<tr align="center" id="'+item.id+'"><td align="center" height="30" style="border: 1px solid #C0C0C0;"><input type="text" value="'+item.xmmc+'" style="width: 180px;"/></td><td align="center" style="border: 1px solid #C0C0C0;"><input value="'+item.sm+'" type="text" style="width:100px;"/></td><td align="center" width="50" style="border: 1px solid #C0C0C0;"><input type="text" value="'+item.sl+'" style="width:50px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><input value="'+item.dj+'" type="text" style="width:80px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><a href="javascript:removeasl('+"'"+item.id+"'"+')" style="text-decoration: none;color: blue;">删除</a></td></tr>';
					$('#asltr').after(html);
				});
			}
			if(lxlist[newValue].glf!=""){
				$('#seldw').val(JSON.parse(lxlist[newValue].glf).dw);
				$('#txtglfdj').val(JSON.parse(lxlist[newValue].glf).dj);
				$('#lblysdj').html(JSON.parse(lxlist[newValue].glf).ysdj);
				$('#lblpgdj').html(JSON.parse(lxlist[newValue].glf).pgdj);
			}
		}
		function loadYhdzxcs(date,cslx,cs){
			$('#sel'+cs).combobox("setValue",date[cslx].clmc);
			$('#txt'+cs+'hd').val(date[cslx].hd);
			$('#txt'+cs+'dj').val(date[cslx].dj);
			$('#txt'+cs+'sddj').val(date[cslx].sddj);
		}
	</script>
</head>
<body>
	<div id="yhdzx_xx" style="text-align: left;font-size: 12px;width:100%;">
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
			<tr style="height: 25px;">
            	<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
                	养护大中修项目计划信息
                </td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					上报年份</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblYear"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					工程分类</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtGCFL" type="text"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划开工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtJhkgsj"></span>
				</td>
            </tr>
            <tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划完工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtJhwgsj"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划下达时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtJhxdsj"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					项目名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtXMMC"></span>
				</td>
            </tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					垫层</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtDC"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					基层</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtJC"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					面层</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtMC"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
				续建表示</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtXJBS0" name="txtXJBS" value="是" type="radio"/>是
					<input id="txtXJBS1" name="txtXJBS" value="否" type="radio"/>否
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"></td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"></td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					上报经费</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtSBJF">0</span>万元
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					核算经费</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lxhsjf">0</span>万元
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					审批经费</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lxspjf">0</span>万元
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					总投资</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="ztz">0</span>万元
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					地方配套总投资</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="dfptztz">0</span>万元
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					总补助资金</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="zbzzj">0</span>万元
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划下达文号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtJHXDWH"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					施工图文号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="txtSGTWH"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					工可批复文号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtGKPFWH"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					设计批复文号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtSJPFWHH"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					交通量</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblJTL"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					PQI指标</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<select id="txtPQI" style="width: 50px;">
						<option value="优">优</option>
						<option value="良">良</option>
						<option value="中">中</option>
						<option value="次">次</option>
						<option value="差">差</option>
					</select>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术处置描述</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="txtJSCZMS"></span>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					现场核实情况</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="txtXCHSQK"></span>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
					省统筹备注</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="txtSTCBZ"></span>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right; border-bottom: 1px solid #C0C0C0; background-color: #F1F8FF; padding-right: 5px;">
					其它备注
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="txtQTBZ"></span>
				</td>
			</tr>
			<!-- 
			<tr style="height: 30px;">
            	<td align="center" colspan="6">
                	<img onclick="updateYhdzx()" alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' " />
                </td>
            </tr>
             -->
		</table>
		<table id="table_lx" width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
			<tr style="height: 25px;">
            	<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
                	养护大中修项目路线信息
                	<input id="jhid" type="hidden"/>
                	<select id="sellx" class="easyui-combobox"  style="width: 200px;" data-options="valueField:'id',textField:'text'"></select>
                </td>
            </tr>
            <tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					管养单位</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="txtGYDWMC"></input>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路线编码</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="txtLXBM"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路线名称<input id="lxid" type="hidden"/>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtLXMC"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					行政区划名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<select id="txtXZQHMC" style="width:130px;"></select>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					起点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtQDZH"></span>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					止点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="txtZDZH"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					起止里程</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtLC"></span>&nbsp;公里
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					核对里程</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtHDLC"></span>&nbsp;公里
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					大中修宽度</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtyhdzxkd"></span>&nbsp;米
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="txtJSDJ" type="text"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路面类型</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="txtYLMLX"></span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面宽度</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="txtYLMKD"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0;border-right: 1px none #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面厚度</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<span id="txtYLMHD"></span>
				</td>
				<td style="border-style:1px solid #C0C0C0; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					特殊地区</td>
				<td colspan="3" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblTSDQ"></span>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					病害内容</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<span id="txtBHNR"></span>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路面结构
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table style="margin-top: 5px;margin-bottom: 5px;">
						<tr align="center">
							<td width="80" style="border: 1px solid #C0C0C0;">
								<input id="ljkdzj" type="checkbox"/> 路基宽度增加0.5m
							</td>
							<td width="100" style="border: 1px solid #C0C0C0;">材料</td>
							<td width="60" style="border: 1px solid #C0C0C0;">厚度(cm)</td>
							<td style="border: 1px solid #C0C0C0;">单价(元/m³)</td>
							<td name="sdtd" style="border: 1px solid #C0C0C0;">审定单价(元/m³)</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">上面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selsmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtsmchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtsmcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtsmcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">中面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selzmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtzmchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtzmcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtzmcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">下面层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selxmc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtxmchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtxmcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtxmcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">封层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selfc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtfchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtfcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtfcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">上基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selsjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtsjchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtsjcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtsjcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">中基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selzjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtzjchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtzjcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtzjcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">下基层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selxjc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtxjchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtxjcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtxjcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">垫层</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="seldc" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtdchd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtdcdj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtdcsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">原路</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="selyl" class="easyui-combobox" style="width:125px;"></select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtylhd" value="0" type="text" style="width: 50px"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtyldj" type="text" style="width: 50px"/>
							</td>
							<td align="center" name="sdtd" style="border: 1px solid #C0C0C0;">
								<input id="txtylsddj" type="text" style="width: 80px"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					按延米</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table id="ymtab" style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr align="center" id="ymtr">
							<td width="200" height="30" style="border: 1px solid #C0C0C0;">项目：如路肩、标线等</td>
							<td width="120" height="30" style="border: 1px solid #C0C0C0;">说明</td>
							<td width="60" height="30" style="border: 1px solid #C0C0C0;">长度(m)</td>
							<td width="100" height="30" style="border: 1px solid #C0C0C0;">单价(元/m)</td>
							<td width="100" height="30" style="border: 1px solid #C0C0C0;">
								操作  <input onclick="addym()" type="button" value="添加"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					按数量</td>
				<td colspan="5" id="sltab" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr align="center" id="asltr">
							<td width="200" height="30" style="border: 1px solid #C0C0C0;">项目：如边坡、挡土墙等</td>
							<td width="120" height="30" style="border: 1px solid #C0C0C0;">说明</td>
							<td width="60" height="30" style="border: 1px solid #C0C0C0;">数量(m、m²、m³)</td>
							<td width="100" height="30" style="border: 1px solid #C0C0C0;">单价(元/m、m²、m³)</td>
							<td width="100" height="30" style="border: 1px solid #C0C0C0;">
								操作  <input onclick="addasl()" type="button" value="添加"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					管理费</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr align="center">
							<td width="198" align="center" style="border: 1px solid #C0C0C0;">项目</td>
							<td width="120" align="center" style="border: 1px solid #C0C0C0;">单位</td>
							<td width="58" style="border: 1px solid #C0C0C0;"></td>
							<td width="99" align="center" style="border: 1px solid #C0C0C0;">单价(元)</td>
							<td width="100" style="border: 1px solid #C0C0C0;"></td>
						</tr>
						<tr>
							<td align="center" style="border: 1px solid #C0C0C0;">
								按每%或元/每公里计算
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<select id="seldw" style="width:100px;">
									<option value="百分比">按%计算</option>
									<option value="公里">按元/每公里</option>
								</select>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;"></td>
							<td align="center" style="border: 1px solid #C0C0C0;">
								<input id="txtglfdj" value="0" type="text" style="width: 80px;"/>
							</td>
							<td align="center" style="border: 1px solid #C0C0C0;">此项目只能选择一种 </td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					合计</td>
				<td colspan="3" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<table  style="border: 1px solid #C0C0C0;margin-top: 5px;margin-bottom: 5px;">
						<tr height="25">
							<td width="130" style="border: 1px solid #C0C0C0;">预算单价(万元/公里)：</td>
							<td width="80" style="border: 1px solid #C0C0C0;"><span id="lblysdj" style="margin-left: 5px;">0</span>万元</td>
							<td width="130" style="border: 1px solid #C0C0C0;">评估单价(万元/公里)：</td>
							<td width="80" style="border: 1px solid #C0C0C0;"><span id="lblpgdj" style="margin-left: 5px;">0</span>万元</td>
						</tr>
					</table>
				</td>
				<!-- <td colspan="2"  style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input type="button" onclick="reckonsum()" value=" 计 算 价 格 "/>
				</td> -->
			</tr>
			<!-- <tr style="height: 30px;">
            	<td align="center" colspan="6">
                	<img onclick="updateYhdzxLx()" alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' " />
                </td>
            </tr> -->
		</table>
	</div>
</body>
</html>