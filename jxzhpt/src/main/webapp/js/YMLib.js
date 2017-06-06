//value表示要赋的值
function getBmbm(name,nameBm,value){
	$.ajax({
		type : "POST",
		url : "/jxzhpt/xtgl/getBmbmByName.do",
		dataType : 'json',
		 data :"name="+name,
		success : function(msg) {
			$("#"+nameBm).empty();
			var strs= nameBm.split(","); //字符分割 
			for (var j=0;j<strs.length;j++){
				for ( var i = 0; i < msg[j].length; i++) {
					if(value==msg[j][i].name)
						$("#"+strs[j]).append(
							'<option value='+msg[j][i].name+' selected>'+ msg[j][i].name+ '</option>'
							);
					else
						$("#"+strs[j]).append(
								'<option value='+msg[j][i].name+'>'+ msg[j][i].name+ '</option>'
								);
				}
			
			}
			
		},
		error : function() {
			alert("请求后台出错！2");
		}
	});
}

/**
 

* 江西省综合前端JavaScript核心脚本库
 */
var YMLib = {
	version : '1.1',
	url : document.location.protocol + "//" + document.location.host
			+ "/jxhwyh/",
	page : document.location.href.split('/')[document.location.href.split('/').length - 1]
			.replace('.jsp', ''),// 获取本页frame的文件名。

	/*
	 * 动态加载JavaScript & CSS
	 */
	using : function(js) {
		YMLib.Tools.loadCss("easyui/themes/default/easyui.css");
		YMLib.Tools.loadCss("easyui/themes/icon.css");
		YMLib.Tools.loadScript("easyui/jquery-1.9.1.min.js");
		YMLib.Tools.loadScript("easyui/jquery.easyui.min.js");
		YMLib.Tools.loadScript("easyui/easyui-lang-zh_CN.js");
		YMLib.Tools.loadScript(js);
	},
	/*
	 * 仅供测试方法。
	 */
	test : {
		/*
		 * 客户端模板插槽替换。
		 */
		sprintf : function(text) {
			var i = 1, args = arguments;
			return text.replace(/%s/g, function() {
				return (i < args.length) ? args[i++] : "";
			});
		}
	},
	Var : {

	},
	UI : {
		/*
		 * 提示模态信息。
		 */
		Show : function(_txt, _time) {
			var _id = YMLib.Tools.createRandomDiv();
			var _lineWidth = _txt.length * 17;
			var _lineHeight = 28;
			var _top = ($(document.body).height() / 2) - 60;
			var _left = ($(document.body).width() / 2 - _lineWidth / 2);
			var _html = "<div id='"
					+ _id
					+ "' style='color:red;font-size:12px;font-weight:bold;z-index:999999;display:none;text-align:center;position : absolute;top:"
					+ _top
					+ "px;left:"
					+ _left
					+ "px;width:"
					+ _lineWidth
					+ "px;height:"
					+ _lineHeight
					+ "px;line-height:"
					+ _lineHeight
					+ "px;border:1px solid #99bbe8;background:#E0ECFF;padding:0px;margin:0px;'>"
					+ _txt + "</div>";
			// 闭包操作关闭提示
			function closeShow() {
				$("#" + _id).fadeOut('slow', function() {
					$("#" + _id).html(null);
					$("#" + _id).remove();
				});
			}
			$(document.body).append(_html);
			$("#" + _id).fadeIn('slow', 'linear', function() {
				setInterval(closeShow, _time);
			});
		},
		layout : function(_id, _method, _region, _iconCls, _width, _title,
				_split, _href) {
			$('#' + _id).layout(_method, {
				region : _region,
				iconCls : _iconCls,
				width : _width,
				title : _title,
				split : _split,
				href : _href
			});
		},
		/*
		 * 添加Tab面板。
		 */
		addTab : function(_id, _title, _src, _icon, _close) {
			if ($("#" + _id).tabs('exists', _title)) {
				$("#" + _id).tabs('select', _title);
			} else {
				$("#" + _id)
						.tabs(
								'add',
								{
									title : _title,
									content : "<iframe id='tabFrame' name='tabFrame' src='"
											+ _src
											+ "' frameborder='0' height='100%' width='100%'></iframe>",
									loadingMessage : '正在加载中……',
									iconCls : _icon,
									closable : _close
								});
			}

		},
		/*
		 * 关闭指定ID的所有Tab
		 */
		closeAllTab : function(_id) {
			var tabs = $("#" + _id).tabs("tabs");
			var length = tabs.length;
			for ( var i = 1; i < length; i++) {
				var onetab = tabs[1];
				var title = onetab.panel('options').title;
				$("#" + _id).tabs("close", title);
			}
		},
		/*
		 * 加载Window窗体来自框架
		 */
		createWindow : function(_id, _title, _href, _icon, _width, _height,
				_onClose) {
			if ($("#" + _id).size() != 0) {// 是否存在
				return;
			}
			YMLib.Tools.createDivById(_id); // 创建div
			$("#" + _id)
					.window(
							{// 渲染window
								title : _title,
								iconCls : _icon,
								content : "<iframe id='"
										+ _id
										+ "_frame' name='"
										+ _id
										+ "_frame' src='"
										+ _href
										+ "' frameborder='0' height='100%' width='100%'></iframe>",
								width : _width,
								height : _height,
								// collapsible: typeof _collapsible ==
								// 'undefined',
								minimizable : false,
								maximizable : false,
								resizable : true,
								modal : false,
								onClose : function() {
									var frame = $('iframe', $("#" + _id)); // 释放frame
									if (frame.length > 0) {
										frame[0].contentWindow.document
												.write('');
										frame[0].contentWindow.close();
										frame.remove();
										if ($.browser.msie) {
											CollectGarbage();
										}
									}
									if (typeof _onClose != 'undefined') {
										_onClose();
									}
									$("#" + _id).window('destroy');
									$("#" + _id).remove();
								}
							});

		},
		/*
		 * 加载Window窗体来自框架
		 */
		createWindow1 : function(_id, _title, _href, _icon, _width, _height,
				_onDestroy) {
			if ($("#" + _id).size() != 0) {// 是否存在
				return;
			}
			YMLib.Tools.createDivById(_id); // 创建div
			$("#" + _id)
					.window(
							{// 渲染window
								title : _title,
								iconCls : _icon,
								content : "<iframe id='"
										+ _id
										+ "_frame' name='"
										+ _id
										+ "_frame' src='"
										+ _href
										+ "' frameborder='0' height='100%' width='100%'></iframe>",
								width : _width,
								height : _height,
								// collapsible: typeof _collapsible ==
								// 'undefined',
								minimizable : false,
								maximizable : false,
								resizable : true,
								modal : false,
								onClose : function() {
									var frame = $('iframe', $("#" + _id)); // 释放frame
									if (frame.length > 0) {
										frame[0].contentWindow.document
												.write('');
										frame[0].contentWindow.close();
										frame.remove();
										if ($.browser.msie) {
											CollectGarbage();
										}
									}
									if (typeof _onClose != 'undefined') {
										_onClose();
									}
									$("#" + _id).window('destroy');
									$("#" + _id).remove();
								},
								onDestroy : _onDestroy
							});

		},
		/*
		 * 构造指定参数类型。
		 */
		builderType : function(jsons, counts) {
			var arrHTML = new Array();
			for ( var i = 0; i < counts; i++) {
				switch (jsons[i].type) {
				case "1":
					var readonly = "";
					// console.log(jsons[i].readonly + " <-> "+jsons[i].title);
					if (jsons[i].readonly != "1") {
						readonly = "";
					} else {
						readonly = "disabled=disabled";
					}
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " style='border:1px solid #95b8e7;width:160px' type='text' name="
									+ jsons[i].field
									+ "  "
									+ readonly
									+ "   /></td></tr>");
					break;
				case "2":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='datebox' type='text' name="
									+ jsons[i].field + " /></td></tr>");
					break;
				case "3":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label>"
									+ jsons[i].title
									+ "：</label></td><td>　<label for=_r1 >男</label><input id=_r1 type=radio checked=checked name="
									+ jsons[i].field
									+ " value=男 /> <label for=_r2>女</label><input id=_r2 type=radio name="
									+ jsons[i].field + " value=女 /></td></tr>");
					break;
				case "4":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='numberspinner' type='text' name="
									+ jsons[i].field + "  /></td></tr>");
					break;
				case "5":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='combotree' type='text' name="
									+ jsons[i].field + "  /></td></tr>");
					break;
				case "6":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label>"
									+ jsons[i].title
									+ "：</label></td><td>　<label for=_r1 >优秀</label><input id=_r1 type=radio checked=checked name="
									+ jsons[i].field
									+ " value=优秀 /> <label for=_r2>良好</label><input id=_r2 type=radio name="
									+ jsons[i].field
									+ " value=良好 /><label for=_r1 >一般</label><input id=_r1 type=radio checked=checked name="
									+ jsons[i].field
									+ " value=一般 /> <label for=_r2>差</label><input id=_r2 type=radio name="
									+ jsons[i].field + " value=差 /></td></tr>");
					break;
				case "7":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='combotreeBH' type='text' name="
									+ jsons[i].field + "  /></td></tr>");
					break;
				case "8":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='combotreeSJ' type='text' name="
									+ jsons[i].field + "  /></td></tr>");
					break;
				case "9":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<textarea id="
									+ jsons[i].field
									+ " rid='textarea' style='margin:5px 0px;height:80px;width:80%;border:1px solid #95b8e7' name="
									+ jsons[i].field
									+ " ></textarea></td></tr>");
					break;
				case "10":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='combotreeXZ' type='text' name="
									+ jsons[i].field + " /></td></tr>");
					break;
				case "11":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<div id="
									+ jsons[i].field
									+ " rid='divFile'    ></div></td></tr>");
					break;
				case "12":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ "fileDownDiv"
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td style=padding-left:10px;padding-top:10px><span id="
									+ "fileDownDiv"
									+ "></span>&nbsp;</td></tr>");
					break;
				case "13":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label>"
									+ jsons[i].title
									+ "：</label></td><td><span id='spandownload' style='margin-left:0px;margin-bottom:4px;'></span></td></tr>");
					break;
				case "14":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='combotreeZD' type='text' name="
									+ jsons[i].field + " /></td></tr>");
					break;
				case "15":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='combotreeLB' type='text' name="
									+ jsons[i].field + " /></td></tr>");
					break;
				case "桩号位置":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　K <input type=text id="
									+ jsons[i].field
									+ " name="
									+ jsons[i].field
									+ " style=width:40px />+<input type=text id="
									+ jsons[i].field
									+ " name="
									+ jsons[i].field
									+ " style=width:40px />至 K <input type=text id="
									+ jsons[i].field
									+ " name="
									+ jsons[i].field
									+ " style=width:40px />+<input type=text id="
									+ jsons[i].field
									+ " name="
									+ jsons[i].field
									+ " style=width:40px />　</td></tr>");
					break;
				case "上行下行":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<select id="
									+ jsons[i].field
									+ " rid='easyui-combobox' name="
									+ jsons[i].field
									+ " style=width:165px ><option value=1>上行</option><option value=2>下行</option></select>　</td></tr>");
					break;
				case "天气":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<select id="
									+ jsons[i].field
									+ " name="
									+ jsons[i].field
									+ " ><option value=1>晴</option><option value=2>阴</option><option value=3>雨</option><option value=4>雪</option><option value=5>风</option><option value=6>云</option><option value=7>雾</option><option value=8>露</option><option value=9>霜</option><option value=10>冰雹</option></select>　</td></tr>");
					break;
				case "机械消耗情况":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td style=padding-top:5px>　<span id=jxspan><select id="
									+ jsons[i].field
									+ "  rid=机械消耗情况下拉树  name="
									+ jsons[i].field
									+ " ></select>　<a id=btnAddTreeJX href=javascript:void(0) rid=linkbutton iconCls=add plain=true>添　加</a></span> <table id=jx_grid class=myTabCss border=0><tr class=thead style=font-weight:bold ><td>机械名称</td><td>规格</td><td>数量</td><td id=jx_opeate>操作</td></tr></table></td></tr>");
					break;
				case "材料消耗情况":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td style=padding-top:5px>　<span id=clspan><select id="
									+ jsons[i].field
									+ "  rid=材料消耗情况下拉树  name="
									+ jsons[i].field
									+ " ></select>　<a id=btnAddTreeCL href=javascript:void(0) rid=linkbutton iconCls=add plain=true>添　加</a></span> <table id=cl_grid class=myTabCss border=0><tr class=thead style=font-weight:bold ><td>材料名称</td><td>规格</td><td>数量</td><td id=cl_opeate>操作</td></tr></table></td></tr>");
					break;
				case "路线编码":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='comboboxLX' type='text' name="
									+ jsons[i].field + "  /></td></tr>");
					break;
				case "车道":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<select id="
									+ jsons[i].field
									+ " name="
									+ jsons[i].field
									+ " ><option value=1>一车道</option><option value=2>二车道</option><option value=3>三车道</option><option value=4>四车道</option><option value=5>应急车道</option></select><td></tr>");
					break;
				case "时间":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='datebox' type='text' name="
									+ jsons[i].field + " /></td></tr>");
					break;
				case "病害类型":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='combotreeBHType' type='text' name="
									+ jsons[i].field + "  /> </td></tr>");
					break;
				case "数量":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<input id="
									+ jsons[i].field
									+ " rid='numberspinner' type='text' name="
									+ jsons[i].field + "  /></td></tr>");
					break;
				case "关联病害":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<select id="
									+ jsons[i].field
									+ " rid='combogridBH' type='text' name="
									+ jsons[i].field
									+ "  style='width:165px'></select></td></tr>");
					break;
				case "图片":
					arrHTML
							.push("<tr><td class='thead' style='text-align:right'><label for="
									+ jsons[i].field
									+ " >"
									+ jsons[i].title
									+ "：</label></td><td>　<a href=jpg.jpg rel=sexylightbox title=只是演示的图>图片1</a>   </td></tr>");
					break;
				default:
					arrHTML
							.push("<tr><td class='thead' style='text-align:center' colspan='2'>错误的自定义类型</td></tr>");
					break;
				}
			}
			return arrHTML.join(" ");
		},
		/*
		 * 解析自定义组件
		 */
		builderEasyUI : function() {
			// 此处进行EasyUI组件解析操作！！！
			$("#fileInputEle").remove();
			$("#fileDownDiv")
					.html(
							"<input id=fileInputEle type=file style=margin-left:7px;margin-bottom:4px; />");
			// ==============================新附件下载模块开始==================================
			var str = "<ul id='downloadOL'></ul>";
			$("#spandownload").html(str);
			$("#downloadOL").html(YMLib.UI.builderFileDownload(YMLib.page));
			$("#spandownload")
					.append(
							"<span id='spandownloadinput' style='display:none'><input type='file' style='margin:5px 0px 10px 10px;width:80%' /></span>");
			YMLib.UI.downloadFileOpeate();
			// ==============================新附件下载模块结束==================================
			$("#initForm #initEle tr input[rid=datebox]").datebox({
				width : 165
			});// 解析日期。
			$("#initForm #initEle tr input[rid=numberspinner]").numberspinner({
				min : 0,
				max : 120,
				width : 165,
				editable : true
			});// 解析数字。
			$("#initForm #initEle tr input[rid=combotree]").combotree({
				url : YMLib.url + 'easyui/Unit.json',
				animate : true,
				lines : true,
				width : 165
			});// 所属单位combotree
			// ================================================================
			$("#initForm #initEle tr input[rid=comboboxLX]").combobox({
				url : YMLib.url + 'easyui/comboboxLX.json',
				panelHeight : 'auto',
				width : 165
			});
			// ================================================================
			// ===================机械==========================================
			$("#initForm #initEle tr select[rid=机械消耗情况下拉树]").combotree({
				url : YMLib.url + 'easyui/jxxhqkxl.json',
				width : 165,
				animate : true,
				lines : true,
				multiple : true,
				panelHeight : 'auto'
			});
			$("#initForm #initEle tr a[rid=linkbutton]").linkbutton({

			});
			$("#jx_grid")
					.append(
							"<tr style=text-align:center><td>小型客车</td><td>辆</td><td><input type=text style=width:38px value=1 rid=numberspinner /></td><td tid=opeate><font color=blue style=cursor:pointer>删除</font></td></tr>");

			// ===================机械==================================================
			// ========================材料===================================================
			$("#initForm #initEle tr select[rid=材料消耗情况下拉树]").combotree({
				url : YMLib.url + 'easyui/clxhqkxl.json',
				width : 165,
				animate : true,
				lines : true,
				multiple : true,
				panelHeight : 'auto'
			});
			$("#cl_grid")
					.append(
							"<tr style=text-align:center><td>清洁扫把</td><td>把</td><td><input type=text style=width:38px value=1 rid=numberspinner /></td><td tid=opeate><font color=blue style=cursor:pointer>删除</font></td></tr>");
			$("#initForm #initEle tr input[rid=numberspinner]").numberspinner({
				min : 0,
				max : 9999,
				// width : 38,
				editable : true
			});
			// ===========================材料================================================

			$("#initForm #initEle tr input[rid=combotreeBH]").combobox({
				url : YMLib.url + 'easyui/BH.json',
				width : 165,
				valueField : 'id',
				textField : 'text',
				panelHeight : 'auto'

			});// 所属单位combotree
			// combotreeBHType
			$("#initForm #initEle tr input[rid=combotreeBHType]").combobox({
				url : YMLib.url + 'easyui/BHType.json',
				width : 165,
				valueField : 'id',
				textField : 'text',
				panelHeight : 'auto'

			});
			$("#initForm #initEle tr input[rid=combotreeZD]").combobox({
				url : YMLib.url + 'easyui/ZD.json',
				width : 165,
				valueField : 'id',
				textField : 'text',
				panelHeight : 'auto'

			});// 制度所属单位性质combotreeZD

			$("#initForm #initEle tr input[rid=combotreeSJ]").combobox({
				url : YMLib.url + 'easyui/SJ.json',
				width : 165,
				valueField : 'id',
				textField : 'text',
				panelHeight : 'auto'

			});// 重大危险事件类型combotreeSJ

			$("#initRckhForm #initRckhEle tr input[rid=combotreeJD]").combobox(
					{
						url : YMLib.url + 'easyui/json/JD.json',
						width : 165,
						valueField : 'id',
						textField : 'text',
						panelHeight : 'auto'

					});// 季度combotreeJD

			$("#initRckhForm #initRckhEle tr input[rid=combotreeRNR]")
					.combobox({
						url : YMLib.url + 'easyui/json/CONTEXT.json',
						width : 165,
						valueField : 'id',
						textField : 'text',
						panelHeight : 'auto'

					});// 考核内容combotreeNR
			$("#initNdkhForm #initNdkhEle tr input[rid=combotreeNNR]")
					.combobox({
						url : YMLib.url + 'easyui/json/CONTEXT.json',
						width : 165,
						valueField : 'id',
						textField : 'text',
						panelHeight : 'auto'

					});// 考核内容combotreeNR

			// 解析下拉树
			$("#initForm #initEle tr select[rid=combogridBH]").combogrid({
				url : YMLib.url + 'easyui/comgridjson.json',
				panelWidth : 500,
				idField : 'itemid',
				textField : 'productname',
				columns : [ [ {
					field : 'itemid',
					title : 'Item ID',
					width : 80
				}, {
					field : 'productname',
					title : 'Product',
					width : 120
				}, {
					field : 'listprice',
					title : 'List Price',
					width : 80,
					align : 'right'
				}, {
					field : 'unitcost',
					title : 'Unit Cost',
					width : 80,
					align : 'right'
				}, {
					field : 'attr1',
					title : 'Attribute',
					width : 200
				}, {
					field : 'status',
					title : 'Status',
					width : 60,
					align : 'center'
				} ] ],
				fitColumns : true

			});
			$("#initForm #initEle tr input[rid=combotreeLB]").combobox({
				url : YMLib.url + 'easyui/json/LB.json',
				width : 165,
				valueField : 'id',
				textField : 'text',
				panelHeight : 'auto'

			});// 类别combotreeLB
		},
		/*
		 * 对附件下载操作进行切换。
		 */
		downloadFileOpeate : function() {
			if (typeof currentState != 'undefined') {
				switch (currentState) {
				case "add":
					$("#downloadOL").hide();
					$("#spandownloadinput").show();
					break;
				case "view":
					$("#downloadOL").show();
					$("#spandownloadinput").hide();
					break;
				case "update":
					$("#downloadOL").show();
					$("#spandownloadinput").show();
					break;
				default:
					break;
				}
			}
		},
		/*
		 * 联动单位和日常考核的组件禁用
		 */
		builderSpecialDisable : function() {
			$(
					"#initRckhForm textarea,#initRckhForm input,#initLddwForm input,#initJSForm input,#initLddwForm textarea")
					.attr("readonly", "readonly");// 禁止编辑只许查看.
			$("#initRckhForm input,#initLddwForm input,#initJSForm input").css(
					{
						"border" : "0px",
						"color" : "gray"
					});
			$("#initRckhForm #initRckhEle tr input[rid=combotreeJD]")
					.combotree("disable");// combotreeJD
			$("#initRckhForm #initRckhEle tr input[rid=combotreeRNR]")
					.combotree("disable");// combotreeNR 考核内容
			$(
					"#initRckhForm #initRckhEle tr input[rid=datebox],#initJSForm > #initJSEle > #initJSTable tr input[rid=datebox]")
					.datebox("disable");// 日期。
		},

		/*
		 * 联动单位和日常考核的组件启用
		 */
		builderSpecialEnable : function() {
			$(
					"#initRckhForm textarea,#initRckhForm input,#initLddwForm input,#initJSForm input,#initLddwForm textarea")
					.removeAttr("readonly");// 禁止编辑只许查看.
			$("#initRckhForm input,#initLddwForm input,#initJSForm input").css(
					{
						"border" : "1px solid #95b8e7",
						"color" : "#000"
					});
			$("#initRckhForm #initRckhEle tr input[rid=combotreeJD]")
					.combotree("enable");// combotreeJD
			$("#initRckhForm #initRckhEle tr input[rid=combotreeRNR]")
					.combotree("enable");// combotreeNR 考核内容
			$("#initRckhForm #initRckhEle tr input[rid=datebox]").datebox(
					"enable");// 日期。
		},

		/*
		 * 禁用所有自定义组件
		 */
		builderDisable : function() {
			// ==========================下载附件模块新开始===============================
			YMLib.UI.downloadFileOpeate();
			$("#downloadOL").show();
			$("#spandownloadinput").hide();
			// ==========================下载附件模块新结束===============================
			$("#fileInputEle").remove();
			$(
					"#initForm input,#initForm select,#initForm textarea,#initNdkhForm input")
					.attr("readonly", "readonly");// 禁止编辑只许查看.
			$("#initForm select").attr("disabled", "disabled");
			$("#initForm input,#initForm select,#initNdkhForm input").css({
				"border" : "0px",
				"color" : "gray"
			});
			// =======================材料消耗情况=============================================================
			$("#btnAddTreeJX,#btnAddTreeCL").hide();
			$("#jxspan,#clspan").hide();
			$("tr [tid=opeate]").hide();
			// =======================材料消耗情况=============================================================
			$("#initForm #initEle tr input[rid=datebox]").datebox("disable");// 日期。
			$("#initForm #initEle tr input[rid=numberspinner]").numberspinner(
					"disable");// 数字。
			$("#initForm #initEle tr input[rid=combotree]")
					.combotree("disable");// 所属单位combotree
			$("#initForm #initEle tr input[rid=comboboxLX]")
					.combobox("disable");
			$("#initForm #initEle tr input[rid=combotreeBH]").combotree(
					"disable");// 所属单位combotree
			$("#initForm #initEle tr input[rid=combotreeBHType]").combotree(
					"disable");
			$("#initForm #initEle tr input[rid=combotreeZD]").combotree(
					"disable");// 制度所属单位性质combotreeZD
			$("#initForm #initEle tr input[rid=combotreeSJ]").combotree(
					"disable");// 重大危险事件类别combotreeSJ
			$("#initNdkhForm #initNdkhEle tr input[rid=combotreeNNR]")
					.combotree("disable");// combotreeNR 考核内容
			$("#initNdkhForm #initNdkhEle tr input[rid=datebox]").datebox(
					"disable");// 日期。
			$("#initForm #initEle tr select[rid=combogridBH]").combotree(
					"disable");
			$("#initForm #initEle tr input[rid=combotreeLB]").combotree(
					"disable");// 中修工程管理汇总类别combotreeLB
		},

		/*
		 * 启用所有自定义组件
		 */
		builderEnable : function() {
			// ==========================下载附件模块新开始===============================
			YMLib.UI.downloadFileOpeate();
			// ==========================下载附件模块新结束===============================
			$("#fileInputEle").remove();
			$("#fileDownDiv")
					.append(
							"<input id=fileInputEle type=file style=margin-left:7px;margin-bottom:4px; />");
			$(
					"#initForm input,#initForm select,#initForm textarea,#initNdkhForm input")
					.removeAttr("readonly");// 可以编辑
			$("#initForm select").removeAttr("disabled");
			$("#initForm input,#initForm select,#initNdkhForm input").css({
				"border" : "1px solid #95b8e7",
				"color" : "#000"
			});
			// =======================材料消耗情况=============================================================
			$("#btnAddTreeJX,#btnAddTreeCL").show();
			$("#jxspan,#clspan").show();
			$("tr [tid=opeate]").show();
			// =======================材料消耗情况=============================================================
			$("#initForm #initEle tr input[rid=datebox]").datebox("enable");// 日期。
			$("#initForm #initEle tr input[rid=numberspinner]").numberspinner(
					"enable");// 数字。
			$("#initForm #initEle tr input[rid=combotree]").combotree("enable");// 所属单位combotree
			$("#initForm #initEle tr input[rid=combotreeBH]").combotree(
					"enable");// 所属单位combotree
			$("#initForm #initEle tr input[rid=combotreeZD]").combotree(
					"enable");// 制度所属单位性质combotreeZD
			$("#initForm #initEle tr input[rid=combotreeSJ]").combotree(
					"enable");// 重大危险事件类别combotreeSJ
			$("#initForm #initEle tr input[rid=comboboxLX]").combobox("enable");
			$("#initForm #initEle tr input[rid=combotreeBHType]").combotree(
					"enable");
			$("#initNdkhForm #initNdkhEle tr input[rid=combotreeNNR]")
					.combotree("enable");// combotreeNR 考核内容
			$("#initNdkhForm #initNdkhEle tr input[rid=datebox]").datebox(
					"enable");// 日期。
			$("#initForm #initEle tr select[rid=combogridBH]").combotree(
					"enable");
			$("#initForm #initEle tr input[rid=combotreeLB]").combotree(
					"enable");// 中修工程管理汇总类别combotreeLB

		},
		/*
		 * 禁用指定表单的元素。
		 */
		DisableFormElement : function(_fid) {
			$("#" + _fid + " input,#" + _fid + " select").attr("readonly",
					"readonly");
			$("#" + _fid + " input,#" + _fid + " select").css({
				"border" : "0px",
				"color" : "#000"
			});
		},
		/*
		 * 构建附件下载组件。
		 */
		builderFileDownload : function(_page) {
			// 模拟下载文件json
			// $.ajax url & param _page return json;

			var fileJson = [ {
				"filename" : "只是标题测试下载",
				"fileurl" : "./test/test1.docx"
			}, {
				"filename" : "真正的链接在里面",
				"fileurl" : "./test/test2.docx"
			}

			];
			var arrHTMLfile = new Array();
			for ( var i = 0; i < fileJson.length; i++) {
				arrHTMLfile.push("<a href=" + fileJson[i].fileurl + ">"
						+ fileJson[i].filename + "</a><br />");
			}
			// return arrHTMLfile.join(" ");
			$("#fileDownDiv").html(arrHTMLfile.join(" "));

			var arrHTMLDownloadfile = new Array();
			for ( var i = 0; i < fileJson.length; i++) {
				arrHTMLDownloadfile.push("<li class='li_a_link'><a href="
						+ fileJson[i].fileurl + " target='_blank'>"
						+ fileJson[i].filename + "</a></li>");
			}
			return arrHTMLDownloadfile.join(" ");
		},
		/*
		 * 显示待处理事务消息提示（仿iOS）。
		 */
		setNumTips : function(_id, _count, _localtion) {
			if (_count >= 10) {
				_count = 10;
			}
			$("div[rid=" + _id + "]").remove();
			var currNum = _id.substr(9, _id.length - 9);
			var top = parseInt(currNum) * 110 - 110;
			var left = 118.5;
			if (typeof _localtion != 'undefined') {
				left = parseFloat($("#" + _id + " > dl > dt img").position().left) + 80;
				top = parseFloat($("#" + _id + " > dl > dt img").position().top) - 30;
			}
			// var top = parseFloat($("#" + _id).position().top) - 80;
			// var left = parseFloat($("#" + _id).position().left) + 80;
			$("#" + _id).before(
					"<div class='count count" + _count + "' rid='" + _id
							+ "' style='display:none'></div>");
			$("div[rid=" + _id + "]").css({
				"top" : top + "px",
				"left" : left + "px"
			});
			// if(_id == "left_menu1"){
			// $("div[rid="+_id+"]").css("top","6px");
			// }
			$("div[rid=" + _id + "]").show("slow");
		},
		/*
		 * 单击一次就清除待处理事务提示。
		 */
		clearTips : function(_id) {
			setTimeout(function() {
				$("div[rid=" + _id + "]").fadeOut("slow", function() {
					$("div[rid=" + _id + "]").remove();
				});
			}, 1500);
		}
	},
	/*
	 * 工具类代码。
	 */
	Tools : {
		/*
		 * 获取网址参数
		 */
		getQueryString : function(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
			var r = window.location.search.substr(1).match(reg);
			if (r != null)
				return unescape(r[2]);
			return null;
		},
		/*
		 * 创建随机div的名字
		 */
		createRandomDiv : function() {
			return "_K" + new Date().getHours() + new Date().getMinutes()
					+ new Date().getSeconds() + new Date().getMilliseconds();
		},
		/*
		 * 创建指定div
		 */
		createDivById : function(myDiv) {
			_t = document.createElement("div");
			_t.setAttribute("id", myDiv);
			document.body.appendChild(_t);
			return myDiv;
		},
		// 获取本地时间
		getDateTime : function() {
			var _yyyy = new Date().getFullYear();
			var _MM = new Date().getMonth() + 1;
			var _dd = new Date().getDate();
			var _hh = new Date().getHours();
			var _ff = new Date().getMinutes();
			var _mm = new Date().getSeconds();
			_MM = _MM < 10 ? '0' + _MM : _MM;
			_dd = _dd < 10 ? '0' + _dd : _dd;
			_hh = _hh < 10 ? '0' + _hh : _hh;
			_ff = _ff < 10 ? '0' + _ff : _ff;
			_mm = _mm < 10 ? '0' + _mm : _mm;
			return _yyyy + '-' + _MM + '-' + _dd + ' ' + _hh + ':' + _ff + ':'
					+ _mm;
		},
		/*
		 * 指定格式的日期 yyyy-MM-dd
		 */
		getDateFormat : function(format) {

			var dt = new Date();
			// 年份
			this.Year = dt.getFullYear();
			// 月份
			this.Month = dt.getMonth() + 1 < 10 ? '0' + (dt.getMonth() + 1)
					: dt.getMonth() + 1;
			// 日期
			this.Day = dt.getDate() < 10 ? '0' + dt.getDate() : dt.getDate();
			// 星期几,数字
			this.Week = dt.getDay();
			// 星期几，中文
			this.WeekDay = '日一二三四五六'.charAt(dt.getDay());
			// 24制小时
			this.Hours24 = dt.getHours() < 10 ? '0' + dt.getHours() : dt
					.getHours();
			// 12制小时
			this.Hours12 = this.Hours24 > 12 ? this.Hours24 - 12 : this.Hours24;
			// 分钟
			this.Minutes = dt.getMinutes() < 10 ? '0' + dt.getMinutes() : dt
					.getMinutes();
			// 秒
			this.Seconds = dt.getSeconds();
			format = format.replace("yy", this.Year);
			format = format.replace("MM", this.Month);
			format = format.replace("dd", this.Day);
			format = format.replace("HH", this.Hours24);
			format = format.replace("hh", this.Hours12);
			format = format.replace("mm", this.Minutes);
			format = format.replace("ss", this.Seconds);
			format = format.replace("ww", this.Week);
			format = format.replace("WW", this.WeekDay);
			return format;
		},
		/*
		 * 动态加载CSS
		 */
		loadCss : function(file) {
			// var cssTag = document.getElementById('loadCss');
			var head = document.getElementsByTagName('head').item(0);
			// if(cssTag) head.removeChild(cssTag);
			var css = document.createElement('link');
			css.href = YMLib.url + file;
			css.rel = 'stylesheet';
			css.type = 'text/css';
			// css.id = 'loadCss';
			head.appendChild(css);
		},
		Show : function(_tips, _interval) {
			var _t = null;
			var _tipsid = YMLib.Tools.createDivById('k_tips_div');
			var _width = _tips.length * 13;
			var _left = $(document).width() / 2 - _width / 2;
			var _top = $(document).height() / 2 - 100;
			function _closeTip() {
				$("#" + _tipsid).fadeOut('slow', function() {
					$("#" + _tipsid).remove();
				});
				clearInterval(_t);
			}
			$("#" + _tipsid).css({
				position : 'absolute',
				left : _left,
				top : _top,
				width : _width,
				height : 20,
				display : 'none',
				zIndex : 10000,
				color : 'red',
				border : '1px solid #99bbe8',
				padding : '10px 5px 0px 5px',
				background : '#E0ECFF',
				font : '12px 宋体',
				fontWeight : 'bold'
			});
			$("#" + _tipsid).html(_tips);
			$("#" + _tipsid).fadeIn('slow');
			_t = setInterval(_closeTip, _interval);
		},

		/*
		 * 动态加载JavaScript
		 */
		loadScript : function(file) {
			// var scriptTag = document.getElementById('loadScript');
			var head = document.getElementsByTagName('head').item(0);
			// if(scriptTag) head.removeChild(scriptTag);
			script = document.createElement('script');
			script.src = YMLib.url + file;
			script.type = 'text/javascript';
			// script.id = 'loadScript';
			head.appendChild(script);
		}
	}
};
/*
 * 临时创建菜单。
 */
function createMenu(_xtype, _json) {// 左侧菜单生成
	switch (_xtype) {
	case 'LeftMenu':
		var id = typeof _json.id != 'undefined' ? _json.id : null;
		var title = typeof _json.title != 'undefined' ? _json.title : null;
		var imgSrc = typeof _json.imgSrc != 'undefined' ? _json.imgSrc : null;
		var renderTo = typeof _json.renderTo != 'undefined' ? _json.renderTo
				: null;
		var href = typeof _json.href != 'undefined' ? _json.href : null;
		// var fun = typeof _json.click != 'undefined' ? _json.click : null;
		
		var html = "<div id='"+ id+ "' style='display:none;float:left;width:180px;heigth:52px;margin:5px 0 0 15px;'>" +
				"<a  href='"
				+ href
				+ "' target='rightContent' style='text-decoration:none;'><div style='float:left; display:inline;margin-right:5px;'>"
//				+"<img style='border:none;' src='"+ imgSrc + "' alt='" + title + "' title='" + title+ "'/>"
				+"</div>" +
				"<div style=' float:left; display:inline;width:127px;padding-top:15px; line-height:10px; '><span>" + title + "</span></div></a></div>";
		
		
		$("#" + renderTo).append(html);
		// $("#"+id).click(fun);
		id = null;
		title = null;
		imgSrc = null;
		renderTo = null;
		html = null;
		// fun = null;
		delete id;
		delete title;
		delete imgSrc;
		delete renderTo;
		delete html;
		// delete fun;
		break;
	default:
		alert("错误的类型");

	}
}

function createMenux(_xtype, _json) {// 左侧菜单生成
	switch (_xtype) {
	case 'LeftMenu':
		var id = typeof _json.id != 'undefined' ? _json.id : null;
		var title = typeof _json.title != 'undefined' ? _json.title : null;
		var imgSrc = typeof _json.imgSrc != 'undefined' ? _json.imgSrc : null;
		var renderTo = typeof _json.renderTo != 'undefined' ? _json.renderTo
				: null;
		var href = typeof _json.href != 'undefined' ? _json.href : null;
		// var fun = typeof _json.click != 'undefined' ? _json.click : null;
		
		var html = "<div id='"+ id+ "' style='display:none;float:left;width:180px;heigth:52px;margin:5px 0 0 15px;'>" +
				"<a  href='"
				+ href
				+ "' target='rightContent' style='text-decoration:none;'><div style='float:left; display:inline;margin-right:5px;'><img style='border:none;' src='"
		+ imgSrc + "' alt='" + title + "' title='" + title+ "'/></div>" +
				"<div style=' float:left; display:inline;width:127px;padding-top:2px; line-height:14px; '><span>" + title + "</span></div></a></div>";
		
		
		$("#" + renderTo).append(html);
		// $("#"+id).click(fun);
		id = null;
		title = null;
		imgSrc = null;
		renderTo = null;
		html = null;
		// fun = null;
		delete id;
		delete title;
		delete imgSrc;
		delete renderTo;
		delete html;
		// delete fun;
		break;
	default:
		alert("错误的类型");

	}
}


function createMenuqwh(_xtype, _json) {// 左侧菜单生成
	switch (_xtype) {
	case 'LeftMenu':
		var id = typeof _json.id != 'undefined' ? _json.id : null;
		var title = typeof _json.title != 'undefined' ? _json.title : null;
		var imgSrc = typeof _json.imgSrc != 'undefined' ? _json.imgSrc : null;
		var renderTo = typeof _json.renderTo != 'undefined' ? _json.renderTo
				: null;
		var href = typeof _json.href != 'undefined' ? _json.href : null;
		// var fun = typeof _json.click != 'undefined' ? _json.click : null;
		
		var html = "<div id='"+ id+ "' style='float:left;width:180px;heigth:52px;margin:5px 0 0 15px;'>" +
		'<ul id="sitemap"><li><a href="#">First link</a><ul><li><a href="#">First link</a><ul><li><a href="#">&#x725B;&#x56FE;&#x5E93; link</a></li></ul></li></ul></li></ul>'+"</div>";
		
		
		$("#" + renderTo).append(html);
		// $("#"+id).click(fun);
		id = null;
		title = null;
		imgSrc = null;
		renderTo = null;
		html = null;
		// fun = null;
		delete id;
		delete title;
		delete imgSrc;
		delete renderTo;
		delete html;
		// delete fun;
		break;
	default:
		alert("错误的类型");

	}
}
/*
 * 创建不带图片的菜单
 */
function createMenu2(_xtype, _json) {// 左侧菜单生成
	switch (_xtype) {
	case 'LeftMenu':
		var id = typeof _json.id != 'undefined' ? _json.id : null;
		var title = typeof _json.title != 'undefined' ? _json.title : null;
		// var imgSrc = typeof _json.imgSrc != 'undefined' ? _json.imgSrc :
		// null;
		var renderTo = typeof _json.renderTo != 'undefined' ? _json.renderTo
				: null;
		var href = typeof _json.href != 'undefined' ? _json.href : null;
		// var fun = typeof _json.click != 'undefined' ? _json.click : null;
		var html = "<div><a id='"
				+ id
				+ "' href='"
				+ href
				+ "' target='rightContent'><img src='../../images/left_kj.png'  align='absmiddle' border='0'><span>"
				+ title + "</span></a></div>";
		$("#" + renderTo).append(html);
		$("#" + id).click(function() {
			YMLib.UI.clearTips(_json.id);
		});
		id = null;
		title = null;
		renderTo = null;
		html = null;
		fun = null;
		delete id;
		delete title;
		delete renderTo;
		delete html;
		delete fun;
		break;
	default:
		alert("错误的类型");
	}
}
/*
 * 加载行政区划
 */
function loadDist(id, dwbm) {
	$('#' + id)
			.combotree(
					{
						checkbox : true,
						url : '/jxzhpt/xtgl/selAllXzqh.do?yhdw=' + dwbm,
						onBeforeExpand : function(node, param) {
							$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh2.do?yhdw="
									+ node.id;
						},
						onSelect : function(node) {
							YMLib.Var.DistName = node.text
						}
					});
	$('#' + id).combotree('setValue', dwbm);
}
function loadDist1(id, dwbm) {
	$('#' + id).combotree(
			{
				checkbox : true,
				multiple:true,
				async:false,
				url : '/jxzhpt/gcgl/selAllXzqh1.do?yhdw=' + dwbm,
				onLoadSuccess : function (node){
					$('#' + id).combotree('setValue', dwbm);
				},
				onCheck : function (node){
					$('#' + id).tree('getChecked');
				}
		});
}
//添加的行政区划
function loadDistadd(id, dwbm) {
	$('#' + id).combotree(
			{
				checkbox : true,
				multiple:true,
				async:false,
				url : '/jxzhpt/gcgl/selAllXzqh1.do?yhdw=' + dwbm,
				onLoadSuccess : function (node){
					//$('#' + id).combotree('setValue', dwbm);
				},
				onCheck : function (node){
					$('#' + id).tree('getChecked');
				}
		});
}
//添加的行政区划
function loadDistedit(id, dwbm,dwbm2) {
	$('#' + id).combotree(
			{
				checkbox : true,
				multiple:true,
				async:false,
				url : '/jxzhpt/gcgl/selAllXzqh1.do?yhdw=' + dwbm,
				onLoadSuccess : function (node){
					$('#' + id).combotree('setValues', dwbm2.split(","));
				},
				onCheck : function (node){
					$('#' + id).tree('getChecked');
				}
		});
}


function loadUnit1(id, dwbm) {

	$('#' + id).combotree(
			{
				checkbox : true,
				multiple:true,
				async:false,
				url : '/jxzhpt/gcgl/selAllUnit1.do?yhdw=' + dwbm,
				onLoadSuccess : function (node){
					$('#' + id).combotree('setValue', dwbm);
				}
		});
}

//添加管养单位多选
function loadUnitadd(id, dwbm) {

	$('#' + id).combotree(
			{
				checkbox : true,
				multiple:true,
				async:false,
				url : '/jxzhpt/gcgl/selAllUnit11.do?yhdw=' + dwbm,
				onLoadSuccess : function (node){
					//$('#' + id).combotree('setValue', dwbm);
				}
		});
}

//bianjioe
function loadUnitedit(id, dwbm,dwbm2) {
	$('#' + id).combotree(
			{
				checkbox : true,
				multiple:true,
				async:false,
				url : '/jxzhpt/gcgl/selAllUnit11.do?yhdw=' + dwbm,
				onLoadSuccess : function (node){
					$('#' + id).combotree('setValues', dwbm2.split(","));
				},
				onCheck : function (node){
					$('#' + id).tree('getChecked');
				}
		});
}


function loadUnits(id, dwbm,gydw) {
	$('#' + id).combotree(
			{
				checkbox : false,
				multiple:false,
				async:false,
				url : '/jxzhpt/gcgl/selAllUnit1.do?yhdw=' + dwbm,
				onLoadSuccess : function (node){
					$('#' + id).combotree('setValue', gydw);
				}
		});
}
function loadUnit10(id, dwbm) {
	if(dwbm=='21101360000')
		dwbm='36';
	$('#' + id).combotree(
			{
				checkbox : true,
				multiple:true,
				async:false,
				url : '/jxzhpt/gcgl/selAllUnit1.do?yhdw=' + dwbm,
				onLoadSuccess : function (node){
					$('#' + id).combotree('setValue', dwbm);
				}
		});
}
/*
 * 加载特殊地区
 */
function loadDist2(id, dwbm) {
	$('#' + id).combotree({
		checkbox : false,
		multiple : true,
		panelHeight:200,
		url : '/jxzhpt/xtgl/selAllXzqh.do?yhdw=' + dwbm,
		onBeforeExpand : function(node, param) {
			$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllXzqh2.do?yhdw="
					+ node.id;
		},
		onSelect : function(node) {
			YMLib.Var.DistName = node.text
		}
	});
	// $('#'+id).combotree('setValue',dwbm);
}

/*
 * 加载部门树
 */
function loadUnit(id, dwbm) {
	$('#' + id).combotree({
		checkbox : false,
		url : '/jxzhpt/xtgl/selAllBm.do?yhdw=' + dwbm,
		onBeforeExpand : function(node, param) {
			$('#' + id).combotree("tree").tree('options').url = "/jxzhpt/xtgl/selAllBm2.do?yhdw="
					+ node.id;
		},
		onSelect : function(node) {
			YMLib.Var.DistName = node.text
		}
	});
	$('#' + id).combotree('setValue', dwbm);
}

/*
 * 加载行政区划
 */
function loadBmbm(id, name,str) {

	$('#' + id).combobox({
		url : '/jxzhpt/xtgl/getBmbmTreeByName.do?yhm='
				+ encodeURI(encodeURI(name)),
		valueField : 'bmid',
		textField : 'name',
		panelHeight:'auto',
		multiple:false
	});
	$('#' + id).combobox('setValue',str);
}
function loadBmbm2(id, name) {
	$.ajax({
		type:'post',
		async:false,
		url:'/jxzhpt/xtgl/getBmbmTreeByName2.do',
		data:'yhm='+ encodeURI(encodeURI(name)),
		dataType:'json',
		success:function(msg){
			$('#' + id).combobox({
				data:msg,
				valueField : 'bmid',
				textField : 'name',
				panelHeight:'auto',
				multiple:false
			});
		}
	});
}
function loadBmbm3(id, name,str) {
	var arr1=new Array();
	var arr2=new Array();
	var i=0;
	$.ajax({
		type:'post',
		async:false,
		url:'/jxzhpt/xtgl/getBmbmTreeByName2.do',
		data:'yhm='+ encodeURI(encodeURI(name)),
		dataType:'json',
		success:function(msg){
			$('#' + id).combobox({
				data:msg,
				valueField : 'bmid',
				textField : 'name',
				panelHeight:'auto',
				multiple:true,
				formatter:function(row){
					arr1[i]=row.id;
					arr2[i]=row.bmid;
					i++;
					var opts = $(this).combobox('options');
					return '<input id="'+id+row.id+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
				},
				onSelect:function(record){
					var opts = $(this).combobox('options');
					if(record[opts.valueField]==""){
						var values =new Array();
						var datas = $('#' +id).combobox("getData");
						$.each(datas,function(index,item){
							values.push(item.bmid);
							$('#'+id+item.id).attr('checked', true);
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$('#'+id+record.id).attr('checked', true);
					}
				},
				onUnselect:function(record){
					var opts = $(this).combobox('options');
					var datas = $('#' +id).combobox("getData");
					var values = $('#' +id).combobox("getValues");
					$('#' +id).combobox("clear");
					if(record[opts.valueField]!=""){
						if(jQuery.inArray("",values)>=0){
							values.splice(jQuery.inArray("",values),1);
						}
						$.each(datas,function(index,item){
							if(jQuery.inArray(item.bmid,values)<0){
								$('#'+id+item.id).attr('checked', false);
							}
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$.each(datas,function(index,item){
							$('#'+id+item.id).attr('checked', false);
						});
					}
				}
			});
		}
	});
	if(str!=null && str!=''){
		$('#' + id).combobox('setValue',str);
		$('#'+id+arr1[returnindex(arr2,str)]).attr('checked', true);
	};
	
}

function returnindex(arr,str){
	var j=0;
	for(var i=0;i<arr.length;i++){
		if(arr[i]==str){
		   j=i;
		   break;
		 }
	}
	return j;
}
// 获取url中参数
function getParam(paras) {

	var url = location.href;
	var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
	var paraObj = {};
	for ( var i = 0; j = paraString[i]; i++) {
		paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j
				.indexOf("=") + 1, j.length);
	}
	var returnValue = paraObj[paras.toLowerCase()];
	if (typeof (returnValue) == "undefined") {
		return "";
	} else {
		return returnValue;
	}
}
function locationQl(_roadbm,_roadpos){
	var data=new Array();
	
	if(_roadbm.substr(4,1)=="L"){
		_roadbm=_roadbm.substr(0,4)+_roadbm.substr(_roadbm.length-6)+_roadbm.substr(4,5);
	}
	//alert(_roadbm);
	var jsonStr={
	        ROADBM: _roadbm,
	        ROADPOS: _roadpos
	    };
	
	data.push(jsonStr);
	YMLib.Var.bm=data;
	YMLib.Var.type="2";
	YMLib.UI.createWindow('locationXm','项目定位','/jxzhpt/openlayers.html','app_add',800,500);
	
}
//项目定位
function locationXm(xmbm,jdbs){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/selectlxbyxmid.do',
		data:"lxsh.xmbm="+xmbm+"&lxsh.jdbs="+jdbs,
		dataType:'json',
		success:function(msg){
			var lxbm="";
			var qdzh="";
			var zdzh="";
			for(var i=0;i<msg.length;i++){
				if(i==msg.length-1){
					lxbm=lxbm+msg[i].lxbm;
					qdzh=qdzh+msg[i].qdzh;
					zdzh=zdzh+msg[i].zdzh;
				}else{
					lxbm=lxbm+msg[i].lxbm+"-";
					qdzh=qdzh+msg[i].qdzh+"-";
					zdzh=zdzh+msg[i].zdzh+"-";
				}
			}
			locationXm1(lxbm,qdzh,zdzh);
		},
		error : function(){
		 YMLib.Tools.Show('生成项目编码错误！error code = 404',3000);
	 }
});	
}
//项目定位
function locationXm1(_roadcode,_roadstart,_roadends){
//	_roadcode="S201361121-S225360828";
//	_roadstart="179.59-42.514";
//	_roadends="190.643-84.903";
	//locationXm("S201361121-S225360828","179.59-42.514","190.643-84.903","1");
	YMLib.Var.xmbm=_roadcode+$.cookie("dist");
	var data=new Array();
	var jsonStr="";
	var type="lxsh";
	if(_roadcode.substring(0,4)=="wnjh") {
		type="wnjh";
		_roadcode=_roadcode.substring(4);
	}
	if(_roadcode.lastIndexOf("-")>-1){
		var arr1=_roadcode.split("-");
		var arr2=_roadstart.split("-");
		var arr3=_roadends.split("-");
		for(var i=0;i<arr1.length;i++){
			jsonStr={"BM": arr1[i],"ROADSTART": arr2[i],"ROADENDS": arr3[i],"TYPE":type};
			data.push(jsonStr);
		}
	}else{
		jsonStr={"BM": _roadcode,"ROADSTART": _roadstart,"ROADENDS": _roadends,"TYPE":type};
		data.push(jsonStr);
	}
	YMLib.Var.bm=data;
	YMLib.Var.type="1";
	YMLib.UI.createWindow('locationXm','项目定位','/jxzhpt/openlayers.html','app_add',800,500);
}


//qwh查询并修改月报上报是否超过时间点
function cxsfcgsjd(id,nf,yf,jzsj,xmlx,nf1,yf1){
	//alert('wqbzbz.id='+id+"&wqbzbz.jzsj="+jzsj+"&wqbzbz.xmlx="+xmlx+"&wqbzbz.nf="+nf+"&wqbzbz.yf="+yf+"&wqbzbz.nf1="+nf1+"&wqbzbz.yf1="+yf1);
	$.ajax({
		data:'wqbzbz.id='+id+"&wqbzbz.jzsj="+jzsj+"&wqbzbz.xmlx="+xmlx+"&wqbzbz.nf="+nf+"&wqbzbz.yf="+yf+"&wqbzbz.nf1="+nf1+"&wqbzbz.yf1="+yf1,
		type:'post',
		datatype:'json',
		url:'/jxzhpt/qqgl/cxsfcgsjd.do',
		success:function(msg){
			
		}
	})
	
}




function gcglxmnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
	$('#id'+myDate.getFullYear()).attr('checked', true);
}
function gcglwgnf(id){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id2_'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#'+id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id2_'+item.value).attr('checked', true);
				});
				$('#'+id).combobox("setValues",values);
			}else{
				$('#id2_'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#'+id).combobox("getData");
			var values = $('#'+id).combobox("getValues");
			$('#'+id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id2_'+item.value).attr('checked', false);
					}
				});
				$('#'+id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id2_'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
	$('#id2_'+myDate.getFullYear()).attr('checked', true);
}
function jsdjdx(id){
	var years=[];
	years.push({text:'全部',value:''});
	/*for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}*/
	years.push({text:'一级',value:'一级'});
	years.push({text:'二级',value:'二级'});
	years.push({text:'三级',value:'三级'});
	years.push({text:'四级',value:'四级'});
	years.push({text:'等外',value:'等外'});
	years.push({text:'无路',value:'无路'});
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setText",'全部');
	//$('#id全部').attr('checked', true);
	
}
function xzdjdx(id){
	var years=[];
	years.push({text:'全部',value:''});
	/*for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}*/
	years.push({text:'国道',value:'G'});
	years.push({text:'省道',value:'S'});
	years.push({text:'县道',value:'X'});
	years.push({text:'乡道',value:'Y'});
	years.push({text:'村道',value:'C'});
	years.push({text:'专道',value:'Z'});
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	//$('#'+id).combobox("setText",'全部');
	//$('#id全部').attr('checked', true);
	
}
function getgljjtj(flag){
	if(flag=='01011304010302030101'||flag=='01011304010302030102'||flag=='01011304010302030103'||flag=='01011304010302030104'         
	   ||flag=='01011304010302030201'||flag=='01011304010302030202'||flag=='01011304010302030203'||flag=='01011304010302030204'
		   ||flag=='0101130401030203'
			   ||flag=='010113040103020301'
				   ||flag=='010113040103020302'
	   )
		return '2';
	else if(flag=='01011304010302040101'||flag=='01011304010302040102'||flag=='01011304010302040103'||flag=='01011304010302040104'
	   ||flag=='01011304010302040201'||flag=='01011304010302040202'||flag=='01011304010302040203'||flag=='01011304010302040204'
		   ||flag=='0101130401030204' 
			   ||flag=='010113040103020401'
				   ||flag=='010113040103020402'
	)
		return '1';
	else return '';
}

function setxzdj(id,flag){
	var years=[];
	var first=[];
	years.push({text:'全部',value:''});
	if(flag=='01011101030105'||flag=='01011101030106'||flag=='01011101030107'||
			flag=='010113040103020301'||flag=='010113040103020401'||	
	   flag=='01011102030105'||flag=='01011102030106'||flag=='01011102030107'||flag=='01011102030108'||
	   flag=='0101120101030105'||flag=='0101120101030106'||flag=='0101120101030107'||flag=='0101120101030108'||
	   flag=='0101120102030105'||flag=='0101120102030106'||flag=='0101120102030107'||flag=='0101120102030108'||
	   flag=='0101120401020105'||flag=='0101120401020106'||flag=='0101120401020107'||flag=='0101120401020108'||
	   flag=='0101120402020105'||flag=='0101120402020106'||flag=='0101120402020107'||flag=='0101120402020108'||
	   flag=='0101130101030101'||flag=='0101130101030102'||flag=='0101130101030103'||flag=='0101130101030104'||
	   flag=='0101130102030101'||flag=='0101130102030102'||flag=='0101130102030103'||flag=='0101130102030104'||
	   flag=='0101130201030101'||flag=='0101130201030102'||flag=='0101130201030103'||flag=='0101130201030104'||
	   flag=='0101130202030101'||flag=='0101130202030102'||flag=='0101130202030103'||flag=='0101130202030104'||
	   flag=='0101130301030101'||flag=='0101130301030102'||flag=='0101130301030103'||flag=='0101130301030104'||
	   flag=='0101130302030101'||flag=='0101130302030102'||flag=='0101130302030103'||flag=='0101130302030104'||
	   flag=='0101130401030101'||flag=='0101130401030103'||flag=='0101130401030104'||
	   flag=='0101130402030101'||flag=='0101130402030103'||flag=='0101130402030104'||
	   flag=='0101130501030102'||
	   flag=='0101140101030101'||flag=='0101140101030102'||flag=='0101140101030103'||flag=='0101140101030104'||
	   flag=='0101140102030101'||flag=='0101140102030102'||flag=='0101140102030103'||flag=='0101140102030104'||
	   flag=='0101140201030101'||flag=='0101140201030102'||flag=='0101140201030103'||flag=='0101140201030104'||
	   flag=='0101140202030101'||flag=='0101140202030102'||flag=='0101140202030103'||flag=='0101140202030104'||
	   flag=='0101140301030101'||flag=='0101140301030102'||flag=='0101140301030103'||flag=='0101140301030104'||
	   flag=='0101140302030101'||flag=='0101140302030102'||flag=='0101140302030103'||flag=='0101140302030104'||
	   flag=='0101150101030101'||flag=='0101150101030102'||flag=='0101150101030103'||flag=='0101150101030104'||
	   flag=='0101150102030101'||flag=='0101150102030102'||flag=='0101150102030103'||flag=='0101150102030104'
	   ||flag=='01011304010302030101'||flag=='01011304010302030102'||flag=='01011304010302030103'||flag=='01011304010302030104'         
	   ||flag=='01011304020302030101'||flag=='01011304020302030102'||flag=='01011304020302030103'||flag=='01011304020302030104'         
		   ||flag=='010113040203020401'||flag=='010113040203020301'||flag=='0101140204030104'      
			   ||flag=='0101120102030101' ||flag=='0101120102030102' ||flag=='0101120102030103'||
			   flag=='0101140203030103'||flag=='0101140204030103'||flag=='0101140203030104'
	   ||flag=='010113040103010101'||flag=='010113040103010102'||flag=='010113040103010103'||flag=='010113040103010104'
	   ||flag=='010113040203010101'||flag=='010113040203010102'||flag=='010113040203010103'||flag=='010113040203010104'
	   ||flag=='0101140203030101'||flag=='0101140204030101'||flag=='0101140203030102'||flag=='0101140204030102'
	){
		years.push({text:'国道',value:'G'});
		years.push({text:'省道',value:'S'});
		first.push('G');
		first.push('S');
	}
	if(flag=='01011101030205'||flag=='01011101030206'||flag=='01011101030207'||flag=='0101130401030102'||
	   flag=='01011102030205'||flag=='01011102030206'||flag=='01011102030207'||flag=='01011102030208'||
	   flag=='0101120101030205'||flag=='0101120101030206'||flag=='0101120101030207'||flag=='0101120101030208'||
	   flag=='0101120102030205'||flag=='0101120102030206'||flag=='0101120102030207'||flag=='0101120102030208'||
	   flag=='0101120401020205'||flag=='0101120401020206'||flag=='0101120401020207'||flag=='0101120401020208'||
	   flag=='0101120402020205'||flag=='0101120402020206'||flag=='0101120402020207'||flag=='0101120402020208'||
	   flag=='0101130101030201'||flag=='0101130101030202'||flag=='0101130101030203'||flag=='0101130101030204'||
	   flag=='0101130102030201'||flag=='0101130102030202'||flag=='0101130102030203'||flag=='0101130102030204'||
	   flag=='0101130201030201'||flag=='0101130201030202'||flag=='0101130201030203'||flag=='0101130201030204'||
	   flag=='0101130202030201'||flag=='0101130202030202'||flag=='0101130202030203'||flag=='0101130202030204'||
	   flag=='0101130301030201'||flag=='0101130301030202'||flag=='0101130301030203'||flag=='0101130301030204'||
	   flag=='0101130302030201'||flag=='0101130302030202'||flag=='0101130302030203'||flag=='0101130302030204'||
	   flag=='0101130401030201'||flag=='0101130401030202'||
	   flag=='0101130402030201'||flag=='0101130402030202'
		   ||flag=='0101130402030102'   
	   ||flag=='01011304010302030201'||flag=='01011304010302030202'||flag=='01011304010302030203'||flag=='01011304010302030204'
	   ||flag=='01011304020302030201'||flag=='01011304020302030202'||flag=='01011304020302030203'||flag=='01011304020302030204'
	   ||flag=='010113040103010201'||flag=='010113040103010202'||flag=='010113040103010203'||flag=='010113040103010204'
	   ||flag=='010113040203010201'||flag=='010113040203010202'||flag=='010113040203010203'||flag=='010113040203010204'
		   ||flag=='010113040103020302'||flag=='010113040103020402'  		
			   ||flag=='010113040203020302'||flag=='010113040203020402'      
	){
		years.push({text:'县道',value:'X'});
		years.push({text:'乡道',value:'Y'});
		years.push({text:'村道',value:'C'});
		years.push({text:'专道',value:'Z'});
		first.push('X');
		first.push('Y');
		first.push('C');
		first.push('Z');
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setValues",first);
	//$('#id全部').attr('checked', true);
	
}
function kjfldx(id){
	var years=[];
	years.push({text:'全部',value:''});
	/*for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}*/
	years.push({text:'特大桥',value:'特大桥'});
	years.push({text:'大桥',value:'大桥'});
	years.push({text:'中桥',value:'中桥'});
	years.push({text:'小桥',value:'小桥'});
	
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setText",'全部');
	//$('#id全部').attr('checked', true);
	
}
function tsdqdx(id){
	$.ajax({
		data:'xzqh='+$.cookie("dist"),
		type:'post',
		async:false,
		dataType:'json',
		url:'/jxzhpt/xmjzbb/settsdq.do',
		success:function(msg){
			
			//开始
			var years=[];
			years.push({text:'全部',value:''});
			/*for(var i=0;i<=10;i++){
				if(i==0)
					first=myDate.getFullYear()-i;
				years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
			}*/
			for ( var i = 0; i < msg.length; i++) {
				years.push({text:msg[i].text,value:msg[i].text});
			}
			
			$('#'+id).combobox({
			    data:years,
			    valueField:'value',
			    textField:'text',
			    multiple:true,
			    formatter:function(row){
					var opts = $(this).combobox('options');
					return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
				},
				onSelect:function(record){
					var opts = $(this).combobox('options');
					if(record[opts.valueField]==""){
						var values =new Array();
						var datas = $('#' +id).combobox("getData");
						$.each(datas,function(index,item){
							values.push(item.value);
							$('#id'+item.value).attr('checked', true);
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$('#id'+record.value).attr('checked', true);
					}
				},
				onUnselect:function(record){
					var opts = $(this).combobox('options');
					var datas = $('#' +id).combobox("getData");
					var values = $('#' +id).combobox("getValues");
					$('#' +id).combobox("clear");
					if(record[opts.valueField]!=""){
						if(jQuery.inArray("",values)>=0){
							values.splice(jQuery.inArray("",values),1);
						}
						$.each(datas,function(index,item){
							if(jQuery.inArray(""+item.value,values)<0){
								$('#id'+item.value).attr('checked', false);
							}
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$.each(datas,function(index,item){
							$('#id'+item.value).attr('checked', false);
						});
					}
				}
			});
			$('#'+id).combobox("setText",'全部');
			//$('#id全部').attr('checked', true);
		}
		
	});
}

function xmnfdx(id){
	var myDate = new Date();
	var years=[];
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(2015+5-i),value:(2015+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+id+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+id+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+id+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+id+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setValue",myDate.getFullYear()+'');
	$('#id'+id+myDate.getFullYear()).attr('checked', true);
	
}

function xmnfdx1(id){
	var myDate = new Date();
	var years=[];
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+id+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+id+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+id+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+id+item.value).attr('checked', false);
				});
			}
		}
	});
	//$('#'+id).combobox("setValue",myDate.getFullYear()+'');
	//$('#id'+id+myDate.getFullYear()).attr('checked', true);
	
}



function setxmnf(id,flag){
	var myDate = new Date();
	var years=[];
	var first;
	if(flag!='01011101030108'&flag!='01011101030208'
	   &flag!='01011102030108'&flag!='01011102030208'
	   &flag!='0101120101030108'&flag!='0101120101030208'
	   &flag!='0101120102030108'&flag!='0101120102030208'
	   &flag!='0101130101030104'&flag!='0101130101030204'
	   &flag!='0101130102030104'&flag!='0101130102030204'
	   &flag!='0101130201030104'&flag!='0101130201030204'
	){
		years.push({text:'全部',value:''});
	}
	if(flag=='0101120101030105'||flag=='0101120101030106'||flag=='0101120101030107'||flag=='0101120101030108'||
	   flag=='0101120101030205'||flag=='0101120101030206'||flag=='0101120101030207'||flag=='0101120101030208'||
	   flag=='0101120401020105'||flag=='0101120401020106'||flag=='0101120401020107'||flag=='0101120401020108'||
	   flag=='0101120401020205'||flag=='0101120401020206'||flag=='0101120401020207'||flag=='0101120401020208'||
	   flag=='0101130101030101'||flag=='0101130101030102'||flag=='0101130101030103'||flag=='0101130101030104'||
	   flag=='0101130101030201'||flag=='0101130101030202'||flag=='0101130101030203'||flag=='0101130101030204'||
	   flag=='0101130201030101'||flag=='0101130201030102'||flag=='0101130201030103'||flag=='0101130201030104'||
	   flag=='0101130201030201'||flag=='0101130201030202'||flag=='0101130201030203'||flag=='0101130201030204'||
	   flag=='0101130301030101'||flag=='0101130301030102'||flag=='0101130301030103'||flag=='0101130301030104'||
	   flag=='0101130301030201'||flag=='0101130301030202'||flag=='0101130301030203'||flag=='0101130301030204'||
	   flag=='0101130401030101'||flag=='0101130401030102'||flag=='0101130401030103'||flag=='0101130401030104'||
	   flag=='0101130401030201'||flag=='0101130401030202'||flag=='0101130401030203'||flag=='0101130401030204'||
	   flag=='0101130501030102'||
	   flag=='0101140101030101'||flag=='0101140101030102'||flag=='0101140101030103'||flag=='0101140101030104'||
	   flag=='0101140201030101'||flag=='0101140201030102'||flag=='0101140201030103'||flag=='0101140201030104'||
	   flag=='0101140301030101'||flag=='0101140301030102'||flag=='0101140301030103'||flag=='0101140301030104'||
	   flag=='0101150101030101'||flag=='0101150101030102'||flag=='0101150101030103'||flag=='0101150101030104'||
	   flag=='0101130501030104'||flag=='0101140203030101'
	   ||flag=='010113040103010101'||flag=='010113040103010102'||flag=='010113040103010103'||flag=='010113040103010104'         
	   ||flag=='010113040103010201'||flag=='010113040103010202'||flag=='010113040103010203'||flag=='010113040103010204'
	   ||flag=='01011304010302030101'||flag=='01011304010302030102'||flag=='01011304010302030103'||flag=='01011304010302030104'         
	   ||flag=='01011304010302030201'||flag=='01011304010302030202'||flag=='01011304010302030203'||flag=='01011304010302030204'         
	   ||flag=='01011304010302040101'||flag=='01011304010302040102'||flag=='01011304010302040103'||flag=='01011304010302040104'         
	   ||flag=='01011304010302040201'||flag=='01011304010302040202'||flag=='01011304010302040203'||flag=='01011304010302040204'         
		
	   ||flag=='01011304010301'||flag=='0101130401030101'||flag=='0101130401030102'
	   ||flag=='01011304010302'||flag=='0101130401030203'||flag=='010113040103020301'
	   ||flag=='010113040103020302'||flag=='0101130401030204'||flag=='010113040103020401'  
	   ||flag=='010113040103020402'||flag=='0101120101030101'||flag=='0101120101030102' 
		   ||flag=='0101120101030103'||flag=='0101140203030102'||flag=='0101140203030103'
			   ||flag=='0101140203030104'||flag=='0101120401020101'||flag=='0101120401020102'
				   ||flag=='0101120401020103'||flag=='0101120401020104'
					   ||flag=='0101120401020201'||flag=='0101120401020202'
						   ||flag=='0101120401020203'||flag=='0101120401020204'
	){
		if(flag=='0101120401020105'||flag=='0101120401020106'||flag=='0101120401020107'||flag=='0101120401020108'||
		   flag=='0101120401020205'||flag=='0101120401020206'||flag=='0101120401020207'||flag=='0101120401020208'){
			$("#astext").html('施工图设计');
		}
		$("#bstext").html('十二五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2015)
					first=2015;
				if(first<2010)
					first=2010;
			}
			years.push({text:(2010+5-i),value:(2010+5-i)});
		}
	}
	if(flag=='01011101030105'||flag=='01011101030106'||flag=='01011101030107'||flag=='01011101030108'||
	   flag=='01011101030205'||flag=='01011101030206'||flag=='01011101030207'||flag=='01011101030208'||
	   flag=='0101120102030105'||flag=='0101120102030106'||flag=='0101120102030107'||flag=='0101120102030108'||
	   flag=='0101120102030205'||flag=='0101120102030206'||flag=='0101120102030207'||flag=='0101120102030208'||
	   flag=='0101120402020105'||flag=='0101120402020106'||flag=='0101120402020107'||flag=='0101120402020108'||
	   flag=='0101120402020205'||flag=='0101120402020206'||flag=='0101120402020207'||flag=='0101120402020208'||
	   flag=='0101130102030101'||flag=='0101130102030102'||flag=='0101130102030103'||flag=='0101130102030104'||
	   flag=='0101130102030201'||flag=='0101130102030202'||flag=='0101130102030203'||flag=='0101130102030204'||
	   flag=='0101130202030101'||flag=='0101130202030102'||flag=='0101130202030103'||flag=='0101130202030104'||
	   flag=='0101130202030201'||flag=='0101130202030202'||flag=='0101130202030203'||flag=='0101130202030204'||
	   flag=='0101130302030101'||flag=='0101130302030102'||flag=='0101130302030103'||flag=='0101130302030104'||
	   flag=='0101130302030201'||flag=='0101130302030202'||flag=='0101130302030203'||flag=='0101130302030204'||
	   flag=='0101130402030101'||flag=='0101130402030102'||flag=='0101130402030103'||flag=='0101130402030104'||
	   flag=='0101130402030201'||flag=='0101130402030202'||flag=='0101130402030203'||flag=='0101130402030204'||
	   flag=='0101140102030101'||flag=='0101140102030102'||flag=='0101140102030103'||flag=='0101140102030104'||
	   flag=='0101140202030101'||flag=='0101140202030102'||flag=='0101140202030103'||flag=='0101140202030104'||
	   flag=='0101140302030101'||flag=='0101140302030102'||flag=='0101140302030103'||flag=='0101140302030104'||
	   flag=='0101150102030101'||flag=='0101150102030102'||flag=='0101150102030103'||flag=='0101150102030104'
	   ||flag=='010113040203010101'||flag=='010113040203010102'||flag=='010113040203010103'||flag=='010113040203010104'         
	   ||flag=='010113040203010201'||flag=='010113040203010202'||flag=='010113040203010203'||flag=='010113040203010204'
	   ||flag=='01011304020302030101'||flag=='01011304020302030102'||flag=='01011304020302030103'||flag=='01011304020302030104'         
	   ||flag=='01011304020302030201'||flag=='01011304020302030202'||flag=='01011304020302030203'||flag=='01011304020302030204'         
	   ||flag=='01011304020302040101'||flag=='01011304020302040102'||flag=='01011304020302040103'||flag=='01011304020302040104'         
	   ||flag=='01011304020302040201'||flag=='01011304020302040202'||flag=='01011304020302040203'||flag=='01011304020302040204'         
		   ||flag=='01011304020301'||flag=='0101130402030101'||flag=='0101130402030102'
		   ||flag=='01011304020302'||flag=='0101130402030203'||flag=='010113040203020301'
		   ||flag=='010113040203020302'||flag=='0101130402030204'||flag=='010113040203020401'  
		   ||flag=='010113040203020402'||flag=='0101120102030101'||flag=='0101120102030102'
	   ||flag=='0101120102030103'||flag=='0101140204030101'||flag=='0101140204030102'
	||flag=='0101140204030103'||flag=='0101140204030104'
		||flag=='0101120402020101'||flag=='0101120402020102'
			   ||flag=='0101120402020103'||flag=='0101120402020104'
				   ||flag=='0101120402020201'||flag=='0101120402020202'
					   ||flag=='0101120402020203'||flag=='0101120402020204'
	){
		if(flag=='0101120402020105'||flag=='0101120402020106'||flag=='0101120402020107'||flag=='0101120402020108'||
		   flag=='0101120402020205'||flag=='0101120402020206'||flag=='0101120402020207'||flag=='0101120402020208'){
					$("#astext").html('施工图设计');
				}
		$("#bstext").html('十三五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2020)
					first=2020;
				if(first<2016)
					first=2016;
			}
			years.push({text:(2015+5-i),value:(2015+5-i)});
		}
	}
	if(flag=='01011102030105'||flag=='01011102030106'||flag=='01011102030107'||flag=='01011102030108'||
	   flag=='01011102030205'||flag=='01011102030206'||flag=='01011102030207'||flag=='01011102030208'){
		$("#bstext").html('十四五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2025)
					first=2025;
				if(first<2021)
					first=2021;
			}
			years.push({text:(2020+5-i),value:(2020+5-i)});
		}
	}
	//为单选
	if(flag=='01011101030108'||flag=='01011101030208'||
	   flag=='01011102030108'||flag=='01011102030208'||
	   flag=='0101120101030108'||flag=='0101120101030208'||
	   flag=='0101120102030108'||flag=='0101120102030208'||
	   flag=='0101130101030104'||flag=='0101130101030204'||
	   flag=='0101130102030104'||flag=='0101130102030204'||
	   flag=='0101130201030104'||flag=='0101130201030204'||
	   flag=='0101130202030104'||flag=='0101130202030204'||
	   flag=='0101130301030104'||flag=='0101130301030204'||
	   flag=='0101130302030104'||flag=='0101130302030204'||
	   flag=='0101130401030104'||flag=='0101130401030204'||
	   flag=='0101130402030104'||flag=='0101130402030204'||
	   flag=='0101140101030104'||flag=='0101140102030104'||
	   flag=='0101140201030104'||flag=='0101140202030104'||
	   flag=='0101140301030104'||flag=='0101140302030104'||
	   flag=='0101150101030104'||flag=='0101150102030104'||
	   flag=='0101130501030104'||flag=='0101140203030104'||
	   flag=='0101140204030104'
	){
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text'
		});
		
	}else{
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text',
		    multiple:true,
		    formatter:function(row){
				var opts = $(this).combobox('options');
				return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
			},
			onSelect:function(record){
				var opts = $(this).combobox('options');
				if(record[opts.valueField]==""){
					var values =new Array();
					var datas = $('#' +id).combobox("getData");
					$.each(datas,function(index,item){
						values.push(item.value);
						$('#id'+item.value).attr('checked', true);
					});
					$('#' +id).combobox("setValues",values);
				}else{
					$('#id'+record.value).attr('checked', true);
				}
			},
			onUnselect:function(record){
				var opts = $(this).combobox('options');
				var datas = $('#' +id).combobox("getData");
				var values = $('#' +id).combobox("getValues");
				$('#' +id).combobox("clear");
				if(record[opts.valueField]!=""){
					if(jQuery.inArray("",values)>=0){
						values.splice(jQuery.inArray("",values),1);
					}
					$.each(datas,function(index,item){
						if(jQuery.inArray(""+item.value,values)<0){
							$('#id'+item.value).attr('checked', false);
						}
					});
					$('#' +id).combobox("setValues",values);
				}else{
					$.each(datas,function(index,item){
						$('#id'+item.value).attr('checked', false);
					});
				}
			}
		});
		
	}
	$('#'+id).combobox("setValue",first+'');
	$('#id'+first).attr('checked', true);
}

function xmnfdx1(id){
	var myDate = new Date();
	var years=[];
	years.push({text:'全部',value:''});
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+id+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+id+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+id+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+id+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setText","全部"+'');
	//$('#id'+id+myDate.getFullYear()).attr('checked', true);
	
}
//qwh创建新目录方法
function createMenunew(id){
	$("#tree"+id).tree({
        //data : treeData,
		url:'/jxzhpt/xtgl/createMenu.do?parent='+id,
        lines : true,
        onClick : function (node) {
        	//$.messager.alert('id',node.attributes+"?&id="+node.id);
            if (node.attributes.length!=0) {
                //alert(node.attributes);
            	
                javascript:window.open(node.attributes+"?&id="+node.id,"rightContent");
            }
        }
    });
}

//报表项目类型
function bbxmlx(id){
	var years=[];
	years.push({text:'全部',value:''});
	/*for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}*/
	years.push({text:'改建',value:'改建'});
	years.push({text:'路面改造',value:'路面改造'});
	years.push({text:'新建',value:'新建'});
	years.push({text:'灾毁重建',value:'灾毁重建'});
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	//$('#'+id).combobox("setText",'全部');
	//$('#id全部').attr('checked', true);
	
}

//报表项目类型
function bbxmlx1(id){
	var years=[];
	years.push({text:'全部',value:''});
	/*for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}*/
	years.push({text:'改建',value:'改建'});
	years.push({text:'路面改造',value:'路面改造'});
	years.push({text:'新建',value:'新建'});
	years.push({text:'养护大中修',value:'养护大中修'});
	years.push({text:'灾毁重建',value:'灾毁重建'});
	years.push({text:'路网结构工程',value:'路网结构工程'});
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	//$('#'+id).combobox("setText",'全部');
	//$('#id全部').attr('checked', true);
	
}
//报表项目类型
function xmjzzt(id){
	var years=[];
	years.push({text:'全部',value:''});
	/*for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}*/
	years.push({text:'未开工',value:'未开工'});
	years.push({text:'已开工',value:'已开工'});
	years.push({text:'完工',value:'完工'});
	//years.push({text:'灾毁重建',value:'灾毁重建'});
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	//$('#'+id).combobox("setText",'全部');
	//$('#id全部').attr('checked', true);
	
}


//国省道改造项目类型
function gsdxmlx(id){
	var years=[];
	years.push({text:'全部',value:''});
	/*for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}*/
	years.push({text:'改建工程',value:'改建工程'});
	years.push({text:'路面改造工程',value:'路面改造工程'});
	years.push({text:'新建工程',value:'新建工程'});
	
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setText",'全部');
	//$('#id全部').attr('checked', true);
	
}



//养护大中修项目类型
function yhxmlx(id){
	var years=[];
	years.push({text:'全部',value:''});
	/*for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}*/
	years.push({text:'大修',value:'大修'});
	years.push({text:'中修',value:'中修'});
	years.push({text:'预防性',value:'预防性'});
	
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setText",'全部');
	//$('#id全部').attr('checked', true);
	
}




//xdzt
function xdzt(id){
	var years=[];
	years.push({text:'全部',value:''});
	/*for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}*/
	years.push({text:'未下达',value:'未下达'});
	years.push({text:'未完成',value:'未完成'});
	years.push({text:'已完成',value:'已完成'});
	
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setText",'全部');
	//$('#id全部').attr('checked', true);
	
}
//资金来源，根据类型lx区分
function zjly(id,lx){
	var years=[];
	years.push({text:'全部',value:''});
	/*for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}*/
	if(lx=='gsd'){
		years.push({text:'车购税',value:'bbzzj'});
		years.push({text:'国债',value:'gz'});
		years.push({text:'省债',value:'sz'});
		years.push({text:'债券',value:'zq'});
		years.push({text:'厅贷款',value:'dk'});
		years.push({text:'奖励',value:'jl'});
		years.push({text:'其他',value:'qt'});
	}
	if(lx=='yh'){
		years.push({text:'燃油税',value:'rys'});
		years.push({text:'厅贷款',value:'dk'});
		years.push({text:'其他',value:'qt'});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#id'+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#id'+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setText",'全部');
	//$('#id全部').attr('checked', true);
	
}



//获取权限
function getQxfromSession(qx){
	var qxstrng='';
	$.ajax({
		data:'qx='+qx,
		type:'post',
		dateType:'json',
		async:false,
		url:'/jxzhpt/xtgl/getQxfromSession.do',
		success:function(msg){
			qxstrng=msg;
		}
	});
	return qxstrng;
}
function getUrlParame(strParame) {
   	var args = new Object( );
   	var query = location.search.substring(1);

   	var pairs = query.split("&"); // Break at ampersand
   	for(var i = 0; i < pairs.length; i++) {
   	var pos = pairs[i].indexOf('=');
   	if (pos == -1) continue;
   	var argname = pairs[i].substring(0,pos);
   	var value = pairs[i].substring(pos+1);
   	value = decodeURIComponent(value);
   	args[argname] = value;
   	}
   	return args[strParame];
   	} 
//
function xmnfnull(id){
	var myDate = new Date();
	var years=[];
	years.push({text:""});
	for(var i=0;i<=10;i++){
		if(i==0) first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text',
	    multiple:true
	});
	//$('#'+id).combobox("setValue",'');
}

//下达文号多选
function jhpcdx(id,xmlx){
	$.ajax({
		data:'xzqh='+xmlx,
		type:'post',
		async:false,
		dataType:'json',
		url:'/jxzhpt/xmjzbb/setjhpcdx.do',
		success:function(msg){
			
			//开始
			var years=[];
			years.push({text:'全部',value:''});
			/*for(var i=0;i<=10;i++){
				if(i==0)
					first=myDate.getFullYear()-i;
				years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
			}*/
			for ( var i = 0; i < msg.length; i++) {
				years.push({text:msg[i].text,value:i+1});
			}
			
			$('#'+id).combobox({
			    data:years,
			    valueField:'value',
			    textField:'text',
			    multiple:true,
			    formatter:function(row){
					var opts = $(this).combobox('options');
					return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
				},
				onSelect:function(record){
					var opts = $(this).combobox('options');
					if(record[opts.valueField]==""){
						var values =new Array();
						var datas = $('#' +id).combobox("getData");
						$.each(datas,function(index,item){
							values.push(item.value);
							$('#id'+item.value).attr('checked', true);
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$('#id'+record.value).attr('checked', true);
					}
				},
				onUnselect:function(record){
					var opts = $(this).combobox('options');
					var datas = $('#' +id).combobox("getData");
					var values = $('#' +id).combobox("getValues");
					$('#' +id).combobox("clear");
					if(record[opts.valueField]!=""){
						if(jQuery.inArray("",values)>=0){
							values.splice(jQuery.inArray("",values),1);
						}
						$.each(datas,function(index,item){
							if(jQuery.inArray(""+item.value,values)<0){
								$('#id'+item.value).attr('checked', false);
							}
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$.each(datas,function(index,item){
							$('#id'+item.value).attr('checked', false);
						});
					}
				}
			});
			//$('#'+id).combobox("setText",'全部');
			//$('#id全部').attr('checked', true);
		}
		
	});
}




//下达文号多选
function jhxdwhdx(id,xmlx){
	$.ajax({
		data:'xzqh='+xmlx,
		type:'post',
		async:false,
		dataType:'json',
		url:'/jxzhpt/xmjzbb/setjhxdwh.do',
		success:function(msg){
			
			//开始
			var years=[];
			years.push({text:'全部',value:''});
			/*for(var i=0;i<=10;i++){
				if(i==0)
					first=myDate.getFullYear()-i;
				years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
			}*/
			for ( var i = 0; i < msg.length; i++) {
				years.push({text:msg[i].text,value:i+1});
			}
			
			$('#'+id).combobox({
			    data:years,
			    valueField:'value',
			    textField:'text',
			    multiple:true,
			    formatter:function(row){
					var opts = $(this).combobox('options');
					return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
				},
				onSelect:function(record){
					var opts = $(this).combobox('options');
					if(record[opts.valueField]==""){
						var values =new Array();
						var datas = $('#' +id).combobox("getData");
						$.each(datas,function(index,item){
							values.push(item.value);
							$('#id'+item.value).attr('checked', true);
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$('#id'+record.value).attr('checked', true);
					}
				},
				onUnselect:function(record){
					var opts = $(this).combobox('options');
					var datas = $('#' +id).combobox("getData");
					var values = $('#' +id).combobox("getValues");
					$('#' +id).combobox("clear");
					if(record[opts.valueField]!=""){
						if(jQuery.inArray("",values)>=0){
							values.splice(jQuery.inArray("",values),1);
						}
						$.each(datas,function(index,item){
							if(jQuery.inArray(""+item.value,values)<0){
								$('#id'+item.value).attr('checked', false);
							}
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$.each(datas,function(index,item){
							$('#id'+item.value).attr('checked', false);
						});
					}
				}
			});
			//$('#'+id).combobox("setText",'全部');
			//$('#id全部').attr('checked', true);
		}
		
	});
}


function queryGcgltjInYb(jhid){
	$.post('/jxzhpt/gcgl/queryGcglwqtjInYb.do',{jhid:jhid},
		function(msg){
			if(msg!=null){
				$("#qc").html(msg.qc);
				$("#ztz").html(msg.ztz);
				$("#btz").html(msg.btz);
				$("#stz").html(msg.stz);
				$("#wcztz").html(msg.wcztz);
				$("#wcbtz").html(msg.wcbtz);
				$("#wcstz").html(msg.wcstz);
				$("#bnztz").html(msg.bnztz);
				$("#xbgz").html(msg.xbgz);
				$("#sbgz").html(msg.sbgz);
			}else{
				$("#qc").html('0');
				$("#ztz").html('0');
				$("#btz").html('0');
				$("#stz").html('0');
				$("#wcztz").html('0');
				$("#wcbtz").html('0');
				$("#wcstz").html('0');
				$("#bnztz").html('0');
				$("#xbgz").html('0');
				$("#sbgz").html('0');
			}
		
		},'json');
	
}
//查询工程管理安保项目月报页面内的那行统计 start
function queryAbxmYb(jhid){
	$.post('/jxzhpt/gcgl/queryAbxmYb.do',{jhid:jhid},
		function(msg){
			if(msg!=null){
				$("#jhlc").html(msg.jhlc);
				$("#ztz").html(msg.ztz);
				$("#btz").html(msg.btz);
				$("#stz").html(msg.stz);
				$("#wcztz").html(msg.wcztz);
				$("#wcbtz").html(msg.wcbtz);
				$("#wcstz").html(msg.wcstz);
				$("#bnztz").html(msg.bnztz);
				$("#wcyhlc").html(msg.wcyhlc);
				$("#bnwc").html(msg.bnwc);
			}else{
				$("#jhlc").html('0');
				$("#ztz").html('0');
				$("#btz").html('0');
				$("#stz").html('0');
				$("#wcztz").html('0');
				$("#wcbtz").html('0');
				$("#wcstz").html('0');
				$("#bnztz").html('0');
				$("#wcyhlc").html('0');
				$("#bnwc").html('0');
			}
		
		},'json');
	
}//查询工程管理安保项目月报页面内的那行统计 end

///加法
function accAdd(arg1,arg2){  
    var r1,r2,m;  
    try{r1=arg1.toString().split(".")[1].length;}catch(e){r1=0;}  
    try{r2=arg2.toString().split(".")[1].length;}catch(e){r2=0;}  
    m=Math.pow(10,Math.max(r1,r2));
    return (arg1*m+arg2*m)/m;  
}
function accSub(arg1,arg2){
	 var r1,r2,m,n;
	 try{r1=arg1.toString().split(".")[1].length;}catch(e){r1=0;}
	try{r2=arg2.toString().split(".")[1].length;}catch(e){r2=0;}
	m=Math.pow(10,Math.max(r1,r2));
	//last modify by deeka
	//动态控制精度长度
	n=(r1>=r2)?r1:r2;
	return ((arg1*m-arg2*m)/m).toFixed(n);
	}
function getghlxinfo(lxbm,qdzh,zdzh){
	
	$.ajax({
		data:'xmsq.ylxbm='+lxbm+"&xmsq.qdzh="+qdzh+"&xmsq.zdzh="+zdzh+"&xmsq.xzqh="+$.cookie("dist2"),
		type:'post',
		dataType:'json',
		url:'/jxzhpt/qqgl/getghlxinfo.do',
		success:function(msg){
			var ghlxbm='';var ghqdzh='';var ghzdzh='';var xlxmc='';
			var qd='';var zd='';var qcqd='';var qczd=''; var cfld='';
			if(msg.length!=0){
				ghlxbm=msg[0].xlxbm;ghqdzh=msg[0].qd;ghzdzh=msg[0].zd;xlxmc=msg[0].xlxmc;
				if(msg.length>1){
						for(var i=1;i<msg.length;i++){
							if(msg[i].xlxbm!=msg[0].xlxbm){
								xlxmc=msg[0].xlxmc;
								cfld=msg[i].xlxbm;
								qcqd=msg[i].qd;
								qczd=msg[i].zd;
							}
						}
						
						
				}
			}
			//alert(ghlxbm.substr(0,4));
			$('#ghlxmc').val(xlxmc);
			$("#ghlxbm").val(ghlxbm.substr(0,4));$("#ghqdzh").val(ghqdzh);$("#ghzdzh").val(ghzdzh);
			if(qcqd!='NaN'){
				$("#gxlxbm").val(cfld.substr(0,4));$("#gxqdzh").val(qcqd);$("#gxzdzh").val(qczd);
			}
			queryJsdjAndLc1(ghlxbm.substr(0,4),ghqdzh,ghzdzh);
			
			
		}
	});
	
	
	
}

//获取规划信息
function autoCompleteGHLXBM(){
	var url = "/jxzhpt/qqgl/queryAutoghList.do";
	$("#ghlxbm").autocomplete(url, {
		multiple : false,minChars :4,multipleSeparator : ' ',
		mustMatch: true,cacheLength : 0,delay : 200,max : 150,
  		extraParams : {
  			'ylxbh':function() {
  				var d = $("#ghlxbm").val();
  				return d;
  			},
  			'xzqhdm':function() {
  				var d = $.cookie("dist2");
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
  					value : row.xlxbm.replace(/(\s*$)/g,""),
  					result : row.xlxbm.replace(/(\s*$)/g,"")
  				};
  			});
  			return aa;
  		},
  		formatItem : function(row, i, max) {
  			return row.xlxbm.replace(/(\s*$)/g,"")+"("+row.xqdzh+","+row.xzdzh+")"+"<br/>"+row.xlxmc.replace(/(\s*$)/g,"");
  		}
  	}).result(
		function(e, item) {
			
			$('#ghqdzh').val(item.xqdzh);
			$('#ghzdzh').val(item.xzdzh);
			$('#ghlxmc').val(item.xlxmc);
			$('#lxmc').val(item.lxmc);
			$('#ylxbh').val(item.ylxbm);
			$('#qdzh').val(item.yqdzh);
			$('#zdzh').val(item.yzdzh);
			//$('#gxlxbm').val(item.cfld);
			//$('#gxqdzh').val(item.cfqd);
			//$('#gxzdzh').val(item.cfzd);
			$("#lmkd").val(item.lmkd);	
			$("#ylmlx").val(item.lmlx);	
			getgxlxinfo(item.xlxbm,item.xqdzh,item.xzdzh);
			queryJsdjAndLc1(item.xlxbm,item.xqdzh,item.xzdzh);
			cxqdmc1(item.xlxbm,item.xqdzh);
			cxzdmc1(item.xlxbm,item.xzdzh);
			selectTSDQ1(item.xlxbm,item.xqdzh,item.xzdzh);
			$('#lc').val(accSub(parseFloat(item.xzdzh),parseFloat(item.xqdzh)));
			$('#lc').html(accSub(parseFloat(item.xzdzh),parseFloat(item.xqdzh)));
	});
}

function selectTSDQ1(lxbm,qdzh,zdzh){
	$("#tsdq").text("");$("#tsdq1").text("");
	var data="lxbm="+lxbm+"&qdzh="+qdzh+"&zdzh="+zdzh;
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmjck/selectTSDQ.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg.length>0){
				var tsdqstr="";
				for(var i=0;i<msg.length;i++){
					tsdqstr=tsdqstr+msg[i]+"、";
				}
				tsdqstr=tsdqstr.substr(0,tsdqstr.length-1);
				$("#tsdq").text(tsdqstr);$("#tsdq1").text(tsdqstr);
			}
		}
	});	
}

function querymcbygh(){
	getylxinfo($('#ghlxbm').val(),$('#ghqdzh').val(),$('#ghzdzh').val());
	
}

function getylxinfo(lxbm,qdzh,zdzh){
	$("#gxlxbm").val('');$("#gxqdzh").val('');$("#gxzdzh").val('');
	queryJsdjAndLc1(lxbm,qdzh,zdzh);
	selectTSDQ1(lxbm,qdzh,zdzh);
	cxqdmc1(lxbm,qdzh);
	cxzdmc1(lxbm,zdzh);
	$('#lc').val(accSub(parseFloat(zdzh),parseFloat(qdzh)));
	$('#lc').html(accSub(parseFloat(zdzh),parseFloat(qdzh)));
	getgxlxinfo(lxbm,qdzh,zdzh);
	$.ajax({
		data:'xmsq.ylxbm='+lxbm+"&xmsq.qdzh="+qdzh+"&xmsq.zdzh="+zdzh+"&xmsq.xzqh="+$.cookie("dist2"),
		type:'post',
		dataType:'json',
		url:'/jxzhpt/qqgl/getylxinfo.do',
		success:function(msg){
			
			var qd='';var zd='';var cfqd='';var cfzd='';
			if(parseFloat(msg.yqdzh)<parseFloat(msg.yzdzh)){
				qd=accAdd(accSub(parseFloat(qdzh),parseFloat(msg.xqdzh)),parseFloat(msg.yqdzh));
				zd=accSub(accAdd(parseFloat(qd),parseFloat(zdzh)),parseFloat(qdzh));
				//getylxlminfo(lxbm,qdzh,zdzh);
			}else{
				qd=accSub(parseFloat(msg.yqdzh),accSub(parseFloat(qdzh),parseFloat(msg.xqdzh))); 
				zd=accAdd(accSub(parseFloat(msg.xzdzh),parseFloat(zdzh)),parseFloat(msg.yzdzh));
				//getylxlminfo(lxbm,qdzh,zdzh);
			}
			
			if(parseFloat(msg.cfqd)<parseFloat(msg.cfzd)){
				cfqd=accAdd(accSub(parseFloat(qdzh),parseFloat(msg.xqdzh)),parseFloat(msg.cfqd));
				cfzd=accSub(accAdd(parseFloat(cfqd),parseFloat(zdzh)),parseFloat(qdzh));
				//getylxlminfo(lxbm,qdzh,zdzh);
			}else{
				cfqd=accSub(parseFloat(msg.cfqd),accSub(parseFloat(qdzh),parseFloat(msg.xqdzh))); 
				cfzd=accAdd(accSub(parseFloat(msg.xzdzh),parseFloat(zdzh)),parseFloat(msg.cfzd));
				//getylxlminfo(lxbm,qdzh,zdzh);
			}
			
			$("#lmkd").val(msg.lmkd);	
			$("#ylmlx").val(msg.lmlx);
			$("#ylxbh").val(msg.ylxbm.substr(0,4));
			//$("#gxlxbm").val(msg.cfld);$("#gxqdzh").val(cfqd);$("#gxzdzh").val(cfzd);
			if(qd!='NaN'){
				$("#ylxbh").val(msg.ylxbm.substr(0,4));$("#qdzh").val(qd);$("#zdzh").val(zd);
				$("#ylxbh").val(msg.ylxbm.substr(0,4));$("#gpsqdzh").val(qd);$("#gpszdzh").val(zd);
				
				$('#lc').val(accSub(parseFloat(zdzh),parseFloat(qdzh)));
				$('#lc').html(accSub(parseFloat(zdzh),parseFloat(qdzh)));
				
				
				if(parseFloat(qd) > parseFloat(zd)){
					$("#span_qdzh").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+msg.yqdzh);
					$("#span_zdzh").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+msg.yzdzh);
				}else{
					$("#span_qdzh").html("<font color='red' size='2'>*&nbsp;不能<</font>"+"<font color='red' size='2'>"+msg.yqdzh);
					$("#span_zdzh").html("<font color='red' size='2'>*&nbsp;不能></font>"+"<font color='red' size='2'>"+msg.yzdzh);
				}
				
				//
			}
			
		}
	});
}

function getgxlxinfo(lxbm,qdzh,zdzh){
	$("#gxlxbm").val('');$("#gxqdzh").val('');$("#gxzdzh").val('');
	$.ajax({
		data:'xmsq.ylxbm='+lxbm+"&xmsq.qdzh="+qdzh+"&xmsq.zdzh="+zdzh+"&xmsq.xzqh="+$.cookie("dist2"),
		type:'post',
		dataType:'json',
		url:'/jxzhpt/qqgl/getgxlxinfo.do',
		success:function(msg){
				var gxbm='';var gxqd='';var gxzd='';
				for(var i=0;i<msg.length;i++){
					//alert(msg[i].qdzh+","+msg[i].zdzh);
					gxbm+=msg[i].lxbm+",";
					gxqd+=msg[i].qdzh+",";
					gxzd+=msg[i].zdzh+",";
				}
				//alert(gxqd+"-,-"+gxzd);
				if(gxbm!=''){
					//alert(gxqd.substring(0,gxqd.length-1)+"----"+gxzd.substring(0,gxzd.length-1));
					$("#gxlxbm").val(gxbm.substring(0,gxbm.length-1));
					$("#gxqdzh").val(gxqd.substring(0,gxqd.length-1));
					$("#gxzdzh").val(gxzd.substring(0,gxzd.length-1));
					//$("#gxlxbm").val('');$("#gxqdzh").val('');$("#gxzdzh").val('');
				}
			}
		});
}

function getylxlminfo(lxbm,qdzh,zdzh){
	//alert();
	$.ajax({
		data:'xmsq.lxbm='+lxbm+"&xmsq.qdzh="+qdzh+"&xmsq.zdzh="+zdzh+"&xmsq.xzqh="+$.cookie("dist2"),
		type:'post',
		dataType:'json',
		url:'/jxzhpt/qqgl/getylxlminfo.do',
		success:function(msg){
			$("#lmkd").val(msg.lmkd);	
			$("#ylmlx").val(msg.ylmlx);	
			//alert(msg.lmkd);
			//$("#lxmc").val(msg.lxmc);	
			queryJsdjAndLc1(lxbm.substr(0,4),qdzh,zdzh);
			//queryylmlx1(lxbm.substr(0,4),qdzh,zdzh);
			
		}
	});
}



/**
 * 根据路线编码和起点桩号查询起点名称
 * @param lxbm 路线编码
 * @param qdzh  起点桩号
 */
function cxqdmc1(lxbm,qdzh){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxqdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+qdzh,
		dataType:'json',
		success:function(msg){
			$('#qdmc').val(msg.qdmc);
		}
	});
}
/**
 * 根据路线编码和止点桩号查询止点名称
 * @param lxbm 路线编码
 * @param zdzh 止点桩号
 */
function cxzdmc1(lxbm,zdzh){
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxzdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+zdzh,
		dataType:'json',
		success:function(msg){
			$('#zdmc').val(msg.zdmc);
		}
	});
}
/**
 * 查询起止点桩号间的技术等级和里程
 * @param lxbm
 * @param qdzh
 * @param zdzh
 * @returns
 */
function queryJsdjAndLc1(lxbm,qdzh,zdzh){
	var xzqh="";
	if($("#xzqh1").val()==null){
		xzqh=$("#xzqh").combobox('getValues').join(',').substr(0,4);
	}else{
		xzqh=$("#xzqh1").combobox('getValues').join(',').substr(0,4);
	}
	//alert(xzqh);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/queryJsdjAndLcByStartAndEnd.do',
        data:'lx.lxbm='+lxbm+xzqh+'&lx.qdzh='+qdzh+'&lx.zdzh='+zdzh,
		dataType:'json',
		success:function(msg){
			$('#yilc').val(msg.yilc);
			$('#erlc').val(msg.erlc);
			$('#sanlc').val(msg.sanlc);
			$('#silc').val(msg.silc);
			$('#dwlc').val(msg.dwlc);
			$('#wllc').val(msg.wllc);
			if($('#jsdj')){
				$('#jsdj').val(msg.xjsdj);
			}
		}
	});
}

function queryylmlx1(lxbm,qdzh,zdzh){
	if(lxbm.substr(0,1)=='Y' || lxbm.substr(0,1)=='C')
		lxbm=lxbm+xzqh;
	$.ajax({
		type:'post',
		async:false,
		url:'/jxzhpt/qqgl/queryylmlx.do',
        data:'lx.lxbm='+lxbm+'&lx.qdzh='+qdzh+'&lx.zdzh='+zdzh,
		dataType:'json',
		success:function(msg){
			$("#ylmlx").val(msg.ylmlx);
			//alert(msg.ylmlx);
		}
	});
}

//退回立项审核下级用户
function tuihxjlxsh(id){
	var rows=$('#'+id).datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	var xmbm=rows[0].xmbm;
	var xmlx=xmbm.substr(10,1);
	
	
	for(var i=0;i<rows.length;i++){
		if(xmlx=='4'||xmlx=='5'){
			if(rows[i].sqzt=='7'){
				alert('请您勿勾选已审核的项目');
				return;
			}
		}else{
			if(rows[i].shzt=='1'){
				alert('请您勿勾选已审核的项目');
				return;
			}
		}
		
		
	}
	YMLib.UI.createWindow('lxxx','退回项目','/jxzhpt/page/qqgl/lxsh/lxsh_th.jsp?id='+id,'lxxx',400,200);	
}
//退回立项审核下级用户
function tuihxjlxshyhc(id){
	var rows=$('#'+id).datagrid('getSelections');
	if(rows.length==0) {
		alert("请选择要退回的项目！");
		return;
	}
	var xmbm=rows[0].xmbm;
	var xmlx=xmbm.substr(10,1);
	
	
	for(var i=0;i<rows.length;i++){
		if(xmlx=='4'||xmlx=='5'){
			if(rows[i].yhcsh=='1'){
				alert('请您勿勾选已审核的项目');
				return;
			}
		}else{
			if(rows[i].shzt=='1'){
				alert('请您勿勾选已审核的项目');
				return;
			}
		}
		
		
	}
	YMLib.UI.createWindow('lxxx','退回项目','/jxzhpt/page/qqgl/lxsh/lxsh_thyhc.jsp?id='+id,'lxxx',400,200);	
}


//历史项目类型
function lsxmlx(id){
	var years=[];
	years.push({text:'全部',value:''});
	
	years.push({text:'大修',value:'大修'});
	years.push({text:'中修',value:'中修'});
	years.push({text:'预防性养护',value:'预防性'});
	years.push({text:'新建',value:'新建'});
	years.push({text:'改建',value:'改建'});
	years.push({text:'路面改造',value:'路面改造'});
	years.push({text:'灾毁恢复重建',value:'灾毁恢复重建'});
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+id+row.text+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+id+item.text).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#'+id+record.text).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+id+item.text).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#'+id+item.text).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setText",'全部');
	
}

//历史计划年份
function lsxmnf(id){
	var years=[];
	years.push({text:'全部',value:''});
	years.push({text:'2011',value:'2011'});
	years.push({text:'2012',value:'2012'});
	years.push({text:'2013',value:'2013'});
	years.push({text:'2014',value:'2014'});
	years.push({text:'2015',value:'2015'});
	years.push({text:'2016',value:'2016'});
	years.push({text:'2017',value:'2017'});
	years.push({text:'2018',value:'2018'});
	years.push({text:'2019',value:'2019'});
	years.push({text:'2020',value:'2020'});
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    multiple:true,
	    formatter:function(row){
			var opts = $(this).combobox('options');
			return '<input id="id'+id+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
		},
		onSelect:function(record){
			var opts = $(this).combobox('options');
			if(record[opts.valueField]==""){
				var values =new Array();
				var datas = $('#' +id).combobox("getData");
				$.each(datas,function(index,item){
					values.push(item.value);
					$('#id'+id+item.value).attr('checked', true);
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$('#'+id+record.value).attr('checked', true);
			}
		},
		onUnselect:function(record){
			var opts = $(this).combobox('options');
			var datas = $('#' +id).combobox("getData");
			var values = $('#' +id).combobox("getValues");
			$('#' +id).combobox("clear");
			if(record[opts.valueField]!=""){
				if(jQuery.inArray("",values)>=0){
					values.splice(jQuery.inArray("",values),1);
				}
				$.each(datas,function(index,item){
					if(jQuery.inArray(""+item.value,values)<0){
						$('#id'+id+item.value).attr('checked', false);
					}
				});
				$('#' +id).combobox("setValues",values);
			}else{
				$.each(datas,function(index,item){
					$('#'+id+item.value).attr('checked', false);
				});
			}
		}
	});
	$('#'+id).combobox("setText",'全部');
	
}

function loadGhlx(id) {
	$("#"+id).combotree({
		url: '/jxzhpt/qqgl/loadGhlx.do?xzqhdm='+$.cookie("dist2"),
		panelHeight:'250',editable: true,multiple:true
		
	});
	
} 

function loadylx(id) {
	$("#"+id).combotree({
		url: '/jxzhpt/qqgl/loadYlx.do?xzqhdm='+$.cookie("dist2"),
		panelHeight:'250',editable: true,multiple:true
		
	});
} 


//弹出加载层 str为要显示的内容，默认“正在加载中，请稍候。。。”
function loadjzt(str) {  
	var name="正在加载，请稍候。。。";
	if(str!=null&&str!='')
		name=str;
    $("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: $(window).height() }).appendTo("body");  
    $("<div class=\"datagrid-mask-msg\"></div>").html(name).appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(window).height() - 45) / 2 });  
}  
  
//取消加载层  
function disLoadjzt() {  
    $(".datagrid-mask").remove();  
    $(".datagrid-mask-msg").remove();  
}
//设置光圈
function szgq(str,id){
	$('#'+id).attr('class',str);
}
//审核资金拨付
var _zjbfjhid="";var _zjbfid="";
function zjbf_sh(jhid,id){
	//alert(jhid+"     "+id);
	_zjbfjhid=jhid;_zjbfid=id;
	YMLib.UI.createWindow('lxxx','资金拨付审核','/jxzhpt/page/gcgl/cgszjdw/zjbf_sh.jsp','lxxx',400,200);	
}

//退回下级资金拨付

function zjbf_th(jhid,id){
	//alert(jhid+"     "+id);
	_zjbfjhid=jhid;_zjbfid=id;
	YMLib.UI.createWindow('lxxx','资金拨付审核','/jxzhpt/page/gcgl/cgszjdw/zjbf_th.jsp','lxxx',400,200);	
}

//退回未审核资金拨付

function zjbf_thwsh(jhid,id){
	if(confirm('您确认退回吗？'))
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/gcgl/zjbf_sbshth.do",
		 dataType : 'json',
		 data : 'gcglabgc.jhid=' +jhid+"&gcglabgc.cscyj="+"&gcglabgc.thyy="+"&gcglabgc.id="+id+"&gcglabgc.sbzt="+1+"&gcglabgc.shzt=0",
		 success : function(msg){
			 if(msg){
				 alert('退回成功！');
				 $("#zjgrid").datagrid('reload');
			 }else{
				 YMLib.Tools.Show('退回失败！',3000);
			 }
		 },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
}
//上报下级资金拨付
function zjbf_sb(jhid,id){
	if(confirm('您确认上报吗？'))
	$.ajax({
		 type : "POST",
		 url : "/jxzhpt/gcgl/zjbf_sbshth.do",
		 dataType : 'json',
		 data : 'gcglabgc.jhid=' +jhid+"&gcglabgc.cscyj="+"&gcglabgc.thyy="+"&gcglabgc.id="+id+"&gcglabgc.sbzt="+1+"&gcglabgc.shzt=0",
		 success : function(msg){
			 if(msg){
				 alert('上报成功！');
				 $("#zjgrid").datagrid('reload');
			 }else{
				 YMLib.Tools.Show('上报失败！',3000);
			 }
		 },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
}

//显示字符串

function showStr(str){
	alert(str);
}

//创建自定义表头树
function createBtTree(id,treeno,ssbb){
	$('#'+id).tree({    
	    url: '/jxzhpt/gcybb/createBtTree.do?tiaojian='+treeno+'&flag='+ssbb, 
	    checkbox: true, 
	    loadFilter: function(data){    
	        if (data.d){    
	            return data.d;    
	        } else {    
	            return data;    
	        }    
	    }    
	});  

}


