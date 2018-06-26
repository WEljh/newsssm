var bver, role = "5";
var base = "./";
$(document).ready(function() {
	// 当光标在表单中的input里面时，按回车键，就执行与点击“登录”相同的操作
	$('#login_form input').keydown(function(e) {
		if (e.keyCode == 13) {
			checkUserName();
		}
	});
	$("#login_submit").click(checkUserName);
});
function checkUserName()// 登录前，校验用户信息
{
	var a = $('#uid').val();
	var b = $('#pwd').val();
	if (a == "") {
		$.messager.alert("系统提示", "请输入用户名", 'warning');
		return;
	}
	var re = /^\d{4}$|^\d{8}$/;
	if (!re.test(a)) {
		$.messager.alert("系统提示", "考号格式错误", "error");
		return;
	}
	if (b == "" || b == undefined) {
		$.messager.alert("系统提示", "请输入登陆密码", "error");
		return;
	}
	$.ajax({
		url : base+"user/doLogin",
		// 只封装和传输指定的数据
		data : {
			"uid" : a,
			"pwd" : b
		},
		type : "POST",
		success : function(res) {
			if (res.ok) {
				window.location.href = base + res.msg;
			} else {
				$.messager.alert("系统提示", "密码错误", "warning");
			}
			return false;
		},
		error : function(res) {
			$.messager.alert("系统提示", "系统错误！", "error");
		}
	});
}

var pageN = 1, pageTotal = 100;
$(function() {
	$.ajax({
		url : "./news/getCount",
		type : "post",
		success : function(res) {
			pageTotal = res.newscount;
			listNews(1, 10);
			loadPager();
		},
		error : function(res) {
			$.messager.alert("系统提示", "系统错误", "error");
		}
	});
	$("#llogin").hide();
	$("#a").click(function() {
		$("#llogin").show();
		$("#lnews").hide();
	});
	$("#b").click(function() {
		$("#llogin").hide();
		$("#lnews").show();
	});
});
function listNews(pageNumber, pageSize) {
	$
			.ajax({
				url:"./news/listNews",
				data : {
					"page" : pageNumber,
					"rows" : pageSize
				},
				type : "post",
				success : function(res) {
					$(".inews").remove();
					// res=JSON.parse(res);
					if (res.total <= 0) {
						var tr = "<tr class='inews' height=\"25\"><td >";
						tr += "<div class='t'>暂无相关新闻</div>";
						tr += "</td><td width='1%' nowrap=''><span >&nbsp;</span></td></tr>";
						$("#trpp").before(tr);
					} else {
						pageN = pageNumber;
						pageTotal = res.total;
						var rows = res.rows;
						for (var i = 0; i < rows.length;) {
							var row = rows[i];
							var tr = "<tr class='inews' height=\"25\"><td >";
							tr += "<div class='t'><a href='./news/getNews?id="
								+ row.id + "' target='_blank'>"
								+ cutstr(row.title, 29) + "</a></div>";
							tr += "</td><td width='1%' nowrap=''><span >"
									+ (new Date(row.date).Format("yyyy-MM-dd"))
									+ "&nbsp;</span></td></tr>";
							$("#trpp").before(tr);
							i++;
							if (i % 5 == 0) {
								tr = "<tr class='inews' height='1'><td colspan='2' align='center'>";
								tr += "<hr style='border-style:dashed;border-color:#999999;width:99%;height:1px;border-width:1px 0px 0px0px;visibility:inherit'></td></tr>";
								$("#trpp").before(tr);
							}
						}
					}
				},
				error : function(res) {
					parent.dlg_ok(300, 140, "系统提示", "系统错误", null, "error");
				}
			})
}
function loadPager() {
	$('#pp').pagination({
		total : pageTotal,
		pageSize : 10,
		pageNumber : pageN,
		displayMsg : '{from}/{to} 共{total}条',
		onSelectPage : function(pageNumber, pageSize) {
			listNews(pageNumber, pageSize);
		}
	});
}