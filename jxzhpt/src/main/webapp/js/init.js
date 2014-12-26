
window.moveTo(0,0);
window.resizeTo(window.screen.width,window.screen.height);

var c1 = true;
var c2 = true;
var c3 = true;
var c4 = true;
var c5 = true;
var c6 = true;
var c7 = true;

var objHomeOpen={};


/*
 * 改变菜单.
 */
//Initialize Index Page.
$(function(){
	//默认加载的页面Index.html
	$("#Menu_1").addClass('now');
	$("#c1f").attr("src", "./page/dzdt/Menu.jsp");
	
	$("#Menu_1,#Menu_2,#Menu_3,#Menu_4,#Menu_5,#Menu_6,#Menu_7").click(function(e){
		$("#Menu_1,#Menu_2,#Menu_3,#Menu_4,#Menu_5,#Menu_6,#Menu_7").removeClass('now');
		$("#" + this.id).addClass('now');
	});
    
    $("#Menu_1").click(function () {
        $("#c2,#c3,#c4,#c5,#c6,#c7").hide();
        $("#c1").show();
        if (c1){
            $("#c1f").attr("src", "page/dzdt/Menu.jsp");
        }
    });

    $("#Menu_2").click(function () {
        $("#c1,#c3,#c4,#c5,#c6,#c7").hide();
        $("#c2").show();
        if (c2) {
            $("#c2f").attr("src", "page/lwxm/Menu.jsp");
        }

    });
    //计划管理
    $("#Menu_3").click(function () {
        $("#c1,#c2,#c4,#c5,#c6,#c7").hide();
        $("#c3").show();
        if (c3) {
            $("#c3f").attr("src", "page/jhgl/Menu.jsp");
        }
    });

    $("#Menu_4").click(function () {
        $("#c1,#c2,#c3,#c5,#c6,#c7").hide();
        $("#c4").show();
        if (c4) {
            $("#c4f").attr("src", "page/gcgl/Menu.jsp");
        }
    });

    $("#Menu_5").click(function () {
        $("#c1,#c2,#c3,#c4,#c6,#c7").hide();
        $("#c5").show();
        if (c5) {
            $("#c5f").attr("src", "page/gcbb/Menu.jsp");

        }
    });

   
    $("#Menu_6").click(function () {
        $("#c1,#c2,#c3,#c4,#c5,#c7").hide();
        $("#c6").show();
        if (c6) {
            $("#c6f").attr("src", "page/sjcx/Menu.jsp");
        }
    });
    

    $("#Menu_7").click(function () {
        $("#c1,#c2,#c3,#c4,#c5,#c6").hide();
        $("#c7").show();
        if (c7) {
            $("#c7f").attr("src", "page/tjfx/Menu.jsp");
        }
    });

    
});

function edit(){
	YMLib.UI.createWindow('updatePassword', '*  修改密码', 'page/xtgl/updatePassword.jsp','updatePassword', 460,320);
}