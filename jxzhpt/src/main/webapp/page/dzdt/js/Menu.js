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
			"unit.id":$.cookie("unit")
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
					$('#dataunit_tree').treegrid('append',{
						parent: row.id,
						data: [{
							id: 'G',name: '国道',state:'closed',iconCls:'icon-none'
						  	},{
							id: 'S',name: '省道',state:'closed',iconCls:'icon-none'
							},{
							id: 'X',name: '县道',state:'closed',iconCls:'icon-none'
							},{
							id: 'Y',name: '乡道',state:'closed',iconCls:'icon-none'
							},{
							id: 'Z',name: '专道',state:'closed',iconCls:'icon-none'
							},{
							id: 'C',name: '村道',state:'closed',iconCls:'icon-none'
							}
						]
					});
				}
			}else if(row.id.length==7){
				$('#dataunit_tree').treegrid('append',{
					parent: row.id,
					url:'../../xtgl/selecLx'
				});
			}
			
			else{
				$("#dataunit_tree").treegrid("getChildren",row.id);
			}
		},onDblClickRow:function(row){
			if(row.id.length>=14){
				if(row.sjlx==1) drawLine(row.id);
				else drawPoint(row.id);
			}
		},onClickRow:function(row){
			if(row.id.length>=14){
				if(row.sjlx==1) drawLine(row.id);
				else drawPoint(row.id);
			}
		}
	});
}