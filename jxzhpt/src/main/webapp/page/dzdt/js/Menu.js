function loadDataunit(){
	$("#dataunit_tree").treegrid({
		border : false,
		rownumbers: false,
		animate:true,
		collapsible:true,
		fit:true,
		fitColumns : true,
		pagination : false,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectXzqhList.do',
		queryParams : {
			"unit.id":$.cookie("dist2")
		},
		idField:'id',
		treeField:'name',
		showFooter:false,
		columns:[[
            {field:'name',width:200}
		]],
		onBeforeExpand:function(row){
			if(row.id.length==6){
				var child=$("#dataunit_tree").treegrid("getChildren",row.id);
				if(child == ""){
					var node = $('#dataunit_tree').treegrid('getSelected');
					$('#dataunit_tree').treegrid('append',{
						parent: row.id,
						data: [{
							id: 'G'+row.id,name: '国道',state:'closed',iconCls:'icon-none',parent: row.id
						  	},{
							id: 'S'+row.id,name: '省道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'X'+row.id,name: '县道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'Y'+row.id,name: '乡道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'Z'+row.id,name: '专道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'C'+row.id,name: '村道',state:'closed',iconCls:'icon-none',parent: row.id
							}
						]
					});
				}
			}else{
				$("#dataunit_tree").treegrid("getChildren",row.id);
			}
		},onDblClickRow:function(row){
			if(row.bmid=="ql"){
				addPoint();
			}
			if(row.bmid=="lx"){
				addLine();
			}
		},onClickRow:function(row){
			if(row.bmid=="ql"){
				addPoint();
			}
			if(row.bmid=="lx"){
				addLine();
			}
		}
	});
}
function addPoint(){
	require(["esri/geometry/Point", "esri/graphic",
             "esri/symbols/PictureMarkerSymbol", "dojo/on" ], function(
             Point, Graphic, PictureMarkerSymbol, on) {
         var extent = map.extent;
         map.graphics.clear();
         if (showGraphic) {
             showGraphic.remove();
         }
         var point=new Point(115.83608878089566,28.69078512327126,map.spatialReference);  
         //创建样式
         var symbol = new PictureMarkerSymbol("../../images/remark_ql.png",
                 24, 24);
         //创建Graphic
         var graphic = new Graphic(point, symbol);
         var showGraphic = on(map.graphics, 'click', function(evt) {
             var graphic = evt.graphic;
             //alert("graphic被点击");
             YMLib.UI.createWindow('dzdt_add_ql','桥梁项目列表','./dzdt_ql.jsp','app_add',470,250);
         });
         //将Graphic叠加到地图
         map.graphics.add(graphic);
     });
}
function addLine(){
    require(["esri/geometry/Polyline","esri/graphic","esri/Color","esri/symbols/SimpleLineSymbol","dojo/on"], function(Polyline,Graphic,Color, SimpleLineSymbol,on) {
        //创建线对象
		var singlePathPolyline = new Polyline([[115.832921098804,28.6911399127145],[115.827459996781,28.6802177086683], [115.795785605047,28.6692955046221], [115.793601164238,28.668203284217], [115.777217858169,28.633252231269],
		                                       [115.763018992908,28.592840076298],[115.761926772504,28.5436901580908],[115.773941196955,28.4355603380335]]);

        //创建样式
        var symbol=new SimpleLineSymbol(SimpleLineSymbol.STYLE_SOLID, new Color([0, 0, 255]), 5);
        //创建Graphic
        var graphic = new Graphic(singlePathPolyline, symbol);
        
        var showGraphic = on(map.graphics, 'click', function(evt) {
            var graphic = evt.graphic;
            //alert("graphic被点击");
            YMLib.UI.createWindow('dzdt_add_lx','路线项目列表','./dzdt_lx.jsp','app_add',470,250);
        });
        //将Graphic叠加到地图
        map.graphics.add(graphic);
    }); 
}
function init() {
    //创建地图对象
    require(["esri/map","esri/layers/ArcGISDynamicMapServiceLayer", "dojo/domReady!"], function(Map,ArcGISDynamicMapServiceLayer) {
        map = new Map("map");
        //叠加图层
        var layer = new ArcGISDynamicMapServiceLayer("http://211.101.37.251:6080/arcgis/rest/services/SXGXPTMAP/MapServer");
        map.addLayer(layer);
    });
}
function selAnyChartXml(){
	$.ajax({
		type:"post",
		url:"../../xtgl/selAnyChartXml.do",
		dataType:'json',
		data:"param.sourceid="+$.cookie("unit2")+"&param.xzqh="+$.cookie("dist"),
		success:function(msg){
			createAnyChartXml(msg.hm2.xml);
			var list1=msg.hm1.list;
			for(var i=0;i<list1.length;i++){
				$("#ip_"+list1[i].name).html(list1[i].id);
			}
			var list2=msg.hm1.list2;
			for(var i=0;i<list2.length;i++){
				$("#ip_"+list2[i].parent).html(list2[i].id);
			}
		}
	});
}
function createAnyChartXml(_xml){
    barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
    barChart_1.width =350;
    barChart_1.height =300;
    barChart_1.padding =0;
    barChart_1.wMode="transparent";
    barChart_1.write("anychart_div");
    barChart_1.setData(_xml);
}
function xmlxTj(){
	$.ajax({
		type:"post",
		url:"../../xtgl/xmlxCountTj.do",
		dataType:'json',
		data:'param.id='+$.cookie("qx4"),
		success:function(msg){
			if(msg!=null){
				var htmlStr="";
				for(var i=0;i<msg.length;i++){
					if(msg[i].desr!=""){
						htmlStr+="<tr><td height='25' width='140px' bgcolor='#FfFfFf' align='center' rowspan="+msg[i].desr+"><span>"+msg[i].parent+"（<span style='font-weight:700; color:#b80f0f;' id='ip_"+msg[i].id.substr(0,8)+"'></span>）</span></td>"+
					    "<td width='210px' bgcolor='#FFFFFF' style='font-size: 12px' align='center'>"+msg[i].name+"</td>"+
					    "<td bgcolor='#FFFFFF' align='center'><a href='#' onclick=turnTo('"+msg[i].id+"','"+msg[i].parent+"','"+msg[i].name+"') style='font-size: 12px;font-weight:700; color:#b80f0f;' ><span id='ip_"+msg[i].id+"'></span></a></td></tr>";
					}else{
						htmlStr+="<tr><td bgcolor='#FFFFFF' style='font-size: 12px' align='center'>"+msg[i].name+"</td>"+
					    "<td bgcolor='#FFFFFF' align='center'><a href='#' onclick=turnTo('"+msg[i].id+"','"+msg[i].parent+"','"+msg[i].name+"') style='font-size: 12px;font-weight:700; color:#b80f0f;'><span id='ip_"+msg[i].id+"'></span></a></td></tr>";
					}
				}
				$("#xmlxTj_table").html(htmlStr);
			}
		}
	});
	selAnyChartXml();
}