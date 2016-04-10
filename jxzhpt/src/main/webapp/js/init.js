window.moveTo(0,0);
window.resizeTo(window.screen.width,window.screen.height);
var c1 = true;
var c2 = true;
var c8 = true;
var c3 = true;
var c4 = true;
var c5 = true;
var c6 = true;
var c7 = true;
var c8 = true;
var c9 = true;
var c10 = true;
var c11 = true;
var c12 = true;
var c13 = true;
function edit(){
	YMLib.UI.createWindow('updatePassword', '*  修改密码', 'page/xtgl/updatePassword.jsp','updatePassword', 460,320);
}
$(function(){
	selSes();
	$("#index_user").html(getQxfromSession('truename'));
	menuQx();
	
	$("#Menu_1,#Menu_2,#Menu_9,#Menu_8,#Menu_3,#Menu_4,#Menu_5,#Menu_6,#Menu_7,#Menu_10,#Menu_11,#Menu_12,#Menu_13,#Menu_14").click(function(e){
		$("#Menu_1,#Menu_2,#Menu_9,#Menu_8,#Menu_3,#Menu_4,#Menu_5,#Menu_6,#Menu_7,#Menu_10,#Menu_11,#Menu_12,#Menu_13,#Menu_14").removeClass('now');
		$("#" + this.id).addClass('now');
	});
    
    $("#Menu_1").click(function () {
        $("#c2,#c9,#c8,#c3,#c4,#c5,#c6,#c7,#c11,#c12,#c13,#c14").hide();
        $("#c1").show();
        if (c1){
            $("#c1f").attr("src", "page/dzdt/dzdt.jsp");
        }
    });

    $("#Menu_2").click(function () {
        $("#c1,#c9,#c8,#c3,#c4,#c5,#c6,#c7,#c11,#c12,#c13,#c14").hide();
        $("#c2").show();
        if (c2) {
            $("#c2f").attr("src", "page/lwxm/Menu.jsp");
        }

    });
    $("#Menu_9").click(function () {
        $("#c1,#c8,#c2,#c3,#c4,#c5,#c6,#c7,#c11,#c12,#c13,#c14").hide();
        $("#c9").show();
        if (c2) {
            $("#c9f").attr("src", "page/wngh/Menu.jsp");
        }

    });
    
    $("#Menu_8").click(function () {
        $("#c1,#c2,#c9,#c3,#c4,#c5,#c6,#c7,#c11,#c12,#c13,#c14").hide();
        $("#c8").show();
        if (c2) {
            $("#c8f").attr("src", "page/qqgl/Menu.jsp");
        }

    });
    
    //计划管理
    $("#Menu_3").click(function () {
        $("#c1,#c2,#c9,#c8,#c4,#c5,#c6,#c7,#c10,#c11,#c12,#c13,#c14").hide();
        $("#c3").show();
        if (c3) {
            $("#c3f").attr("src", "page/jhgl/Menu.jsp");
        }
    });

    $("#Menu_4").click(function () {
        $("#c1,#c2,#c9,#c8,#c3,#c5,#c6,#c7,#c10,#c11,#c12,#c13,#c14").hide();
        $("#c4").show();
        if (c4) {
            $("#c4f").attr("src", "page/gcgl/Menu.jsp");
        }
    });

    $("#Menu_5").click(function () {
        $("#c1,#c2,#c9,#c8,#c3,#c4,#c6,#c7,#c10,#c11,#c12,#c13,#c14").hide();
        $("#c5").show();
        if (c5) {
            $("#c5f").attr("src", "page/gcbb/Menu.jsp");

        }
    });

   
    $("#Menu_6").click(function () {
        $("#c1,#c2,#c9,#c8,#c3,#c4,#c5,#c7,#c10,#c11,#c12,#c13,#c14").hide();
        $("#c6").show();
        if (c6) {
            $("#c6f").attr("src", "page/sjcx/Menu.jsp");
        }
    });
    

    $("#Menu_7").click(function () {
        $("#c1,#c2,#c9,#c8,#c3,#c4,#c5,#c6,#c10,#c11,#c12,#c13,#c14").hide();
        $("#c7").show();
        if (c7) {
            $("#c7f").attr("src", "page/tjfx/Menu.jsp");
        }
    });
    
    $("#Menu_10").click(function () {
        $("#c1,#c2,#c9,#c8,#c3,#c4,#c5,#c6,#c7,#c11,#c12,#c13,#c14").hide();
        $("#c10").show();
        if (c7) {
            $("#c10f").attr("src", "page/wnjhk/Menu.jsp");
        }
    });
    
    $("#Menu_11").click(function () {
        $("#c1,#c2,#c9,#c8,#c3,#c4,#c5,#c6,#c7,#c10,#c12,#c13,#c14").hide();
        $("#c11").show();
        if (c7) {
            $("#c11f").attr("src", "page/wnxmk/Menu.jsp");
        }
    });
    $("#Menu_12").click(function () {
        $("#c1,#c2,#c9,#c8,#c3,#c4,#c5,#c6,#c7,#c10,#c11,#c13,#c14").hide();
        $("#c12").show();
        if (c7) {
            $("#c12f").attr("src", "page/newqqgl/Menu.jsp");
        }
    });
    $("#Menu_13").click(function () {
        $("#c1,#c2,#c9,#c8,#c3,#c4,#c5,#c6,#c7,#c10,#c11,#c12,#c14").hide();
        $("#c13").show();
        if (c7) {
            $("#c13f").attr("src", "page/newjhgl/Menu.jsp");
        }
    });
    $("#Menu_14").click(function () {
        $("#c1,#c2,#c9,#c8,#c3,#c4,#c5,#c6,#c7,#c10,#c11,#c12,#c13").hide();
        $("#c14").show();
        if (c7) {
            $("#c14f").attr("src", "page/newgcgl/Menu.jsp");
        }
    });
    
    
});

function menuQx(){
	
	//alert(getQxfromSession('qx2'));
	//var qx=$.cookie("qx2").split(",");
	var qx=getQxfromSession('qx2').split(",");
	//alert(qx.length);
	var flag=false;
	for(var i=0;i<qx.length;i++){
		$("#menu_"+qx[i]).css("display","none");
		if($("#menu_"+qx[i]).html()!=undefined){
			$("#menu_"+qx[i]).show();
			if(flag==false){
				var url="";
				switch(qx[i].substr(qx[i].length-1)){
				case "1": url="page/dzdt/dzdt.jsp";break;
				case "2": url="page/lwxm/Menu.jsp";break;
				case "9": url="page/wngh/Menu.jsp";break;
				case "8": url="page/qqgl/Menu.jsp";break;
				case "3": url="page/jhgl/Menu.jsp";break;
				case "4": url="page/gcgl/Menu.jsp";break;
				case "5": url="page/gcbb/Menu.jsp";break;
				case "6": url="page/sjcx/Menu.jsp";break;
				case "7": url="page/tjfx/Menu.jsp";break;
				case "10": url="page/wnjhk/Menu.jsp";break;
				case "11": url="page/wnxmk/Menu.jsp";break;
				case "12": url="page/newqqgl/Menu.jsp";break;
				case "13": url="page/newjhgl/Menu.jsp";break;
				case "14": url="page/newgcgl/Menu.jsp";break;
				}
				$("#Menu_"+qx[i].substr(qx[i].length-1)).addClass('now');
				$("#c1f").attr("src", url);
				flag=true;
			}
		}
	}
}
