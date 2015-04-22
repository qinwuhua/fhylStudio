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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		var lmjgjson,ymjson,sljson,glfjson;//1、存储路面结构的json字符串   2、存储延米数据的json 3、存储数量的json 4、存储管养费的json
		$(function(){
			loadBmbm2('txtJSDJ','技术等级');
			gydwComboxTree("txtGYDWMC");
			loadXzqh("txtXZQHMC",$.cookie("dist"));
			sbnf("lblYear");
			loadCslx('selsmc','上面层');
			loadCslx('selzmc','中面层');
			loadCslx('selxmc','下面层');
			loadCslx('selfc','封层');
			loadCslx('selsjc','上基层');
			loadCslx('selzjc','中基层');
			loadCslx('selxjc','下基层');
			loadCslx('seldc','垫层');
			loadCslx('selyl','原路');
			if(roleName()=="省级"){
				$.each($('td [name=sdtd]'),function(index,item){
					$(item).hide();
				});
			}
			autoCompleteLXBM();
		});
		function autoCompleteLXBM(){
			var url = "/jxzhpt/jhgl/yhdzxAutoCompleteLxbm.do";
			$("#txtLXBM").autocomplete(url, {
				multiple : false,minChars :1,multipleSeparator : ' ',
				mustMatch: true,cacheLength : 0,delay : 200,max : 50,
		  		extraParams : {
		  			'lx.lxbm':function() {
		  				var d = $("#txtLXBM").val();
		  				return d;
		  			},
		  			'lx.xzqhdm':function() {
		  				var d = $.cookie("dist");
		  				return d;
		  			}
		  		},
		  		dataType:'json',// 返回类型
		  		// 对返回的json对象进行解析函数，函数返回一个数组
		  		parse : function(data) {
		  			var aa = [];
		  			aa = $.map(eval(data), function(row) {
		  					return {
		  					data : row,
		  					value : row.lxbm.replace(/(\s*$)/g,""),
		  					result : row.lxbm.replace(/(\s*$)/g,"")
		  				};
		  			});
		  			return aa;
		  		},
		  		formatItem : function(row, i, max) {
		  			return row.lxbm.replace(/(\s*$)/g,"")+"("+row.qdzh+","+row.zdzh+")"+"<br/>"+row.lxmc.replace(/(\s*$)/g,"");
		  		}
		  	}).result(
				function(e, item) {
					$('#txtLXMC').val(item.lxmc);
					$('#txtQDZH').val(item.qdzh);
					$('#spqdzh').html(item.qdzh);
					$('#qdts').show();
					$('#txtZDZH').val(item.zdzh);
					$('#spzdzh').html(item.zdzh);
					$('#zdts').show();
					$('#txtLC').val(item.qzlc);
					$('#txtHDLC').val(item.qzlc);
					$('#txtJSDJ').combobox("setValue",item.yjsdj);
					$('#txtYLMLX').val(item.ylmlx);
					$('#txtYLMKD').val(item.ylmkd);
					$('#txtyhdzxkd').val(item.ylmkd);
			});
		}
		function loadCslx(id,cslx){
			$.ajax({
				type:'post',
				url:'../../../xtgl/queryYhdzxcsByLx.do',
				dataType:'json',
				async:'false',
				data:'yhdzxcs.cslx='+cslx,
				success:function(result){
					var n={clmc:'---请选择---',id:''};
					result.splice(0,0,n);
					$('#'+id).combobox({
					    data:result,
					    valueField:'id',
					    textField:'clmc',
					    onChange:function(newValue,oldValue){
					    	var lx=id.substring(3);
					    	if(newValue!=""){
					    		$.ajax({
						    		type:'post',
									url:'../../../xtgl/queryYhdzxcsById.do',
									dataType:'json',
									data:'yhdzxcs.id='+newValue,
									success:function(result2){
										$('#txt'+lx+'dj').val(result2.lfmdj);
										$('#txt'+lx+'sddj').val(result2.sddj);
									}
						    	});
					    	}else{
					    		$('#txt'+lx+'dj').val("0");
								$('#txt'+lx+'sddj').val("0");
					    	}
					    }
					}); 
				}
			});
		}
		function loadYhdzxcs(date,cslx,cs){
			$('#sel'+cs).combobox("setValue",date[cslx].clmc);
			$('#txt'+cs+'hd').html(date[cslx].hd);
			$('#txt'+cs+'dj').html(date[cslx].dj);
			$('#txt'+cs+'sddj').html(date[cslx].sddj);
		}
		function addym(){
			var  myDate = new Date();
			var id=myDate.getFullYear()+""+(myDate.getMonth()+1)+""+myDate.getDate()+""+
				myDate.getHours()+""+myDate.getMinutes()+""+myDate.getSeconds()+""+myDate.getMilliseconds();
			var html='<tr align="center" id="'+id+'"><td align="center" height="30" style="border: 1px solid #C0C0C0;"><input type="text" style="width: 180px;"/></td><td align="center" style="border: 1px solid #C0C0C0;"><input type="text" style="width:100px;"/></td><td align="center" width="50" style="border: 1px solid #C0C0C0;"><input type="text" style="width:50px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><input type="text" style="width:80px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><a href="javascript:removeym('+"'"+id+"'"+')" style="text-decoration: none;color: blue;">删除</a></td></tr>';
			$('#ymtr').after(html);
		}
		function addasl(){
			var  myDate = new Date();
			var id=myDate.getFullYear()+""+(myDate.getMonth()+1)+""+myDate.getDate()+""+
				(myDate.getHours()+1)+""+(myDate.getMinutes()+1)+""+(myDate.getSeconds()+1)+""+myDate.getMilliseconds();
			var html='<tr align="center" id="'+id+'"><td align="center" height="30" style="border: 1px solid #C0C0C0;"><input type="text" style="width: 180px;"/></td><td align="center" style="border: 1px solid #C0C0C0;"><input type="text" style="width:100px;"/></td><td align="center" width="50" style="border: 1px solid #C0C0C0;"><input type="text" style="width:50px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><input type="text" style="width:80px;"/></td><td align="center" width="100" style="border: 1px solid #C0C0C0;"><a href="javascript:removeasl('+"'"+id+"'"+')" style="text-decoration: none;color: blue;">删除</a></td></tr>';
			$('#asltr').after(html);
		}
		function loadXzqh(id,dwbm){
			$('#'+id).combotree({
				checkbox:false,
				url : '/jxzhpt/xtgl/selAllXzqh.do?yhdw=' + dwbm,
				onBeforeExpand:function(node, param) {
					$('#'+id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh2.do?yhdw="+ node.id;
				},
				onSelect:function(node) {
					YMLib.Var.DistName = node.text;
					$('#xzqhdm').html(node.id);
				}
			});
			$('#'+id).combotree('setValue', dwbm);
		}
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
		function removeym(id){
			$('#'+id).remove();
		}
		function removeasl(id){
			$('#'+id).remove();
		}
		function reckonsum(){
			var lmjg=0,ym=0,sl=0,glf=0,zjg=0;
			lmjgjson="{";//最后将路面结构、按延米、按数量、管理费的数据存储到json格式的字符串中
			var smc= reckon($('#txtyhdzxkd').val(),$('#txtsmchd').val(),$('#txtsmcdj').val());
			var sdsmc= reckon($('#txtyhdzxkd').val(),$('#txtsmchd').val(),$('#txtsmcsddj').val());
			var smcjson='"上面层":{"clmc":"'+$('#selsmc').combobox("getValue")+
				'","hd":"'+$('#txtsmchd').val()+'","dj":"'+$('#txtsmcdj').val()+
				'","sddj":"'+$('#txtsmcsddj').val()+'"}';
			lmjgjson+=smcjson+",";
			var zmc= reckon($('#txtyhdzxkd').val(),$('#txtzmchd').val(),$('#txtzmcdj').val());
			var sdzmc= reckon($('#txtyhdzxkd').val(),$('#txtzmchd').val(),$('#txtzmcsddj').val());
			var zmcjson='"中面层":{"clmc":"'+$('#selzmc').combobox("getValue")+
			'","hd":"'+$('#txtzmchd').val()+'","dj":"'+$('#txtzmcdj').val()+
			'","sddj":"'+$('#txtzmcsddj').val()+'"}';
			lmjgjson+=zmcjson+",";
			
			var xmc= reckon($('#txtyhdzxkd').val(),$('#txtxmchd').val(),$('#txtxmcdj').val());
			var sdxmc= reckon($('#txtyhdzxkd').val(),$('#txtxmchd').val(),$('#txtxmcsddj').val());
			var xmcjson='"下面层":{"clmc":"'+$('#selxmc').combobox("getValue")+
			'","hd":"'+$('#txtxmchd').val()+'","dj":"'+$('#txtxmcdj').val()+
			'","sddj":"'+$('#txtxmcsddj').val()+'"}';
			lmjgjson+=xmcjson+",";
			
			var fc= reckon($('#txtyhdzxkd').val(),$('#txtfchd').val(),$('#txtfcdj').val());
			var sdfc= reckon($('#txtyhdzxkd').val(),$('#txtfchd').val(),$('#txtfcsddj').val());
			var fcjson='"封层":{"clmc":"'+$('#selfc').combobox("getValue")+
			'","hd":"'+$('#txtfchd').val()+'","dj":"'+$('#txtfcdj').val()+
			'","sddj":"'+$('#txtfcsddj').val()+'"}';
			lmjgjson+=fcjson+",";
			
			var sjc= reckon($('#txtyhdzxkd').val(),$('#txtsjchd').val(),$('#txtsjcdj').val());
			var sdsjc= reckon($('#txtyhdzxkd').val(),$('#txtsjchd').val(),$('#txtsjcsddj').val());
			var sjcjson='"上基层":{"clmc":"'+$('#selsjc').combobox("getValue")+
			'","hd":"'+$('#txtsjchd').val()+'","dj":"'+$('#txtsjcdj').val()+
			'","sddj":"'+$('#txtsjcsddj').val()+'"}';
			lmjgjson+=sjcjson+",";
			
			var zjc= reckon($('#txtyhdzxkd').val(),$('#txtzjchd').val(),$('#txtzjcdj').val());
			var sdzjc= reckon($('#txtyhdzxkd').val(),$('#txtzjchd').val(),$('#txtzjcsddj').val());
			var zjcjson='"中基层":{"clmc":"'+$('#selzjc').combobox("getValue")+
			'","hd":"'+$('#txtzjchd').val()+'","dj":"'+$('#txtzjcdj').val()+
			'","sddj":"'+$('#txtzjcsddj').val()+'"}';
			lmjgjson+=zjcjson+",";
			
			var xjc= reckon($('#txtyhdzxkd').val(),$('#txtxjchd').val(),$('#txtxjcdj').val());
			var sdxjc= reckon($('#txtyhdzxkd').val(),$('#txtxjchd').val(),$('#txtxjcsddj').val());
			var xjcjson='"下基层":{"clmc":"'+$('#selxjc').combobox("getValue")+
			'","hd":"'+$('#txtxjchd').val()+'","dj":"'+$('#txtxjcdj').val()+
			'","sddj":"'+$('#txtxjcsddj').val()+'"}';
			lmjgjson+=xjcjson+",";
			
			var dc= reckon($('#txtyhdzxkd').val(),$('#txtdchd').val(),$('#txtdcdj').val());
			var sddc= reckon($('#txtyhdzxkd').val(),$('#txtdchd').val(),$('#txtdcsddj').val());
			var dcjson='"垫层":{"clmc":"'+$('#seldc').combobox("getValue")+
			'","hd":"'+$('#txtdchd').val()+'","dj":"'+$('#txtdcdj').val()+
			'","sddj":"'+$('#txtdcsddj').val()+'"}';
			lmjgjson+=dcjson+",";
			
			var yl= reckon($('#txtyhdzxkd').val(),$('#txtylhd').val(),$('#txtyldj').val());
			var sdyl= reckon($('#txtyhdzxkd').val(),$('#txtylhd').val(),$('#txtylsddj').val());
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
				ym+=($(ymMessage[2]).val()/1000)*($(ymMessage[3]).val()/10000);
				var y={id:item.id,xmmc:$(ymMessage[0]).val(),sm:$(ymMessage[1]).val(),
						cd:$(ymMessage[2]).val(),dj:$(ymMessage[3]).val()};
				ymjson.push(y);
			});
			//获取数量集合，计算价格
			sljson=new Array();
			var slArray=$("#sltab tr:gt(0)");
			$.each(slArray,function(index,item){
				var slMessage=$("#"+item.id+" input[type=text]");
				sl+=($(slMessage[2]).val()/1000)*($(slMessage[3]).val()/10000);
				var s={id:item.id,xmmc:$(slMessage[0]).val(),sm:$(slMessage[1]).val(),
						sl:$(slMessage[2]).val(),dj:$(slMessage[3]).val()};
				sljson.push(s);
			});
			//计算总单价
			zjg=lmjg+ym+sl;
			//评估价格
			var pgjg=sdsmc+sdzmc+sdxmc+sdfc+sdsjc+sdzjc+sdxjc+sddc+sdyl+ym+sl;
			if($('#seldw').val()=="百分比"){
				zjg=zjg*(1+$('#txtglfdj').val()/100);
				pgjg=pgjg*(1+$('#txtglfdj').val()/100);
			}else if($('#seldw').val()=="公里"){
				zjg=zjg+$('#txtglfdj').val()/10000;
				pgjg=pgjg+$('#txtglfdj').val()/10000;
			}
			pgjg=pgjg.toFixed(3);
			glfjson={dw:$('#seldw').val(),dj:$('#txtglfdj').val(),ysdj:zjg.toFixed(3),pgdj:pgjg};
			
			$('#lblysdj').html(zjg.toFixed(3));
			$('#lblpgdj').html(pgjg);
			$('#lxhsjf').html((zjg.toFixed(3)*($('#txtZDZH').val()-$('#txtQDZH').val())).toFixed(3));
			$('#lxspjf').html((pgjg*($('#txtZDZH').val()-$('#txtQDZH').val())).toFixed(3));
			$('#dfptztz').html(($('#ztz').val()-$('#lxspjf').html()).toFixed(3));
			$('#zbzzj').html($('#lxspjf').html());
		}
		function reckon(kd,hd,dj){
			return (kd*(hd/100)*1000)*dj/10000;
		}
		function reckonsd(kd,hd,sddj){
			return (kd*(hd/100)*1000)*sddj/10000;
		}
		function insert(){
			if(Number($('#txtQDZH').val())<Number($('#spqdzh').html())){
				alert("起点桩号要大于或等于"+$('#spqdzh').html());
				return;
			}
			if(Number($('#txtZDZH').val())>Number($('#spzdzh').html())){
				alert("起点桩号要小于或等于"+$('#spzdzh').html());
				return;
			}
			if(Number($('#txtHDLC').val())>Number($('#txtLC').val())){
				alert("核对里程不能大于起止里程！");
				return;
			}
			var myDate = new Date();
			var tbsj=myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
			var params={'lx.lxid':$('#lxid').val(),'lx.lxmc':$('#txtLXMC').val(),'lx.lxbm':$('#txtLXBM').val(),'lx.qdzh':$('#txtQDZH').val(),
					'lx.zdzh':$('#txtZDZH').val(),'lx.qzlc':$('#txtLC').val(),'lx.hdlc':$('#txtHDLC').val(),
					'lx.ylmlx':$('#txtYLMLX').val(),'lx.ylmkd':$('#txtYLMKD').val(),
					'lx.ylmhd':$('#txtYLMHD').val(),'lx.yjsdj':$('#txtYLMKD').val(),
					'lx.xzqhdm':$('#txtXZQHMC').combotree('getValue'),'lx.xzqhmc':$('#txtXZQHMC').combotree('getText'),
					'lx.gydwmc':$('#txtGYDWMC').combotree('getText'),'lx.gydwdm':$('#txtGYDWMC').combotree('getValue'),
					'lx.bhnr':$('#txtBHNR').val(),'lx.dzxkd':$('#txtyhdzxkd').val(),
					'lx.lmjg':lmjgjson,'lx.aym':JSON.stringify(ymjson),'lx.asl':JSON.stringify(sljson),
					'lx.glf':JSON.stringify(glfjson),'lx.tbbmdm':$.cookie("unit"),
					'lx.jhid':parent.YMLib.Var.ID,'jh.sbnf':parent.YMLib.Var.NF};
			$.ajax({
				type:'post',
				url:'../../../jhgl/insertYhdzxLx.do',
				dataType:'json',
				data:params,
				success:function(data){
					if(data.result){
						alert("添加成功！");
						parent.$('#grid').datagrid('reload');
						$('#add_yhdzxlx').window('destroy');
					}
				},
				error:function(e){
					alert("添加失败！");
				}
			});
		}
		function jisuanlc(t){
			if(Number($('#txtQDZH').val())<Number($('#spqdzh').html())){
				alert("起点桩号要大于或等于"+$('#spqdzh').html());
				return;
			}
			if(Number($('#txtZDZH').val())>Number($('#spzdzh').html())){
				alert("起点桩号要小于或等于"+$('#spzdzh').html());
				return;
			}
			var lc = (Number($('#txtZDZH').val()).toFixed(3)-Number($('#txtQDZH').val()).toFixed(3)).toFixed(3);
			if(lc>=0){
				$('#txtLC').val(lc);
			}else{
				alert("项目里程不能为负数！");
				$(t).focus();
			}
		}
	</script>
</head>
<body>
	<div id="yhdzx_xx" style="text-align: left;font-size: 12px;width:100%;">
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
			<tr style="height: 25px;">
            	<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
                	养护大中修项目路线信息
                	<input id="jhid" type="hidden"/>
                </td>
            </tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					管养单位</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="txtGYDWMC" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					路线编码</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtLXBM" type="text"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路线名称<input id="lxid" type="hidden"/>
				</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtLXMC" type="text"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					行政区划名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<select id="txtXZQHMC" style="width:130px;"></select>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					起点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtQDZH" onblur="jisuanlc(this)" type="text"/>
					<div id="qdts" style="color:red;font-size:xx-small; ;display: none;">起点桩号要>=<span id="spqdzh">0</span></div>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					止点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
					<input id="txtZDZH" onblur="jisuanlc(this)" type="text"/>
					<div id="zdts" style="color:red;font-size:xx-small;display: none;">止点桩号要<=<span id="spzdzh">0</span></div>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					起止里程</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtLC" type="text" style="width:80px;"/>&nbsp;公里
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					核对里程</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtHDLC" type="text" style="width:80px;"/>&nbsp;公里
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					大中修宽度</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtyhdzxkd" style="width: 80px;" type="text"/>&nbsp;米
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
					<input id="txtYLMLX" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面宽度</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtYLMKD" type="text"/>
				</td>
			</tr>
			<tr style="height: 30px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面厚度</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="txtYLMHD" type="text"/>
				</td>
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					特殊地区</td>
				<td colspan="3" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<span id="lblTSDQ">罗霄山山脉</span>
				</td>
			</tr>
			<tr style="height: 50px;">
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					病害内容</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
					<textarea id="txtBHNR" style="width: 700px;height: 40px;"></textarea>
				</td>
			</tr>
		</table>
		<table width="97%" border="0" style="border-style: solid;border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0;margin-left: 13px; height: 45px;"cellspacing="0" cellpadding="0">
			<tr style="height: 30px;">
            	<td align="center" colspan="6">
                	<img onclick="insert()" alt="确定" src="${pageContext.request.contextPath}/images/Button/qd1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/qd2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/qd1.gif' " />
                </td>
            </tr>
		</table>
	</div>
</body>
</html>