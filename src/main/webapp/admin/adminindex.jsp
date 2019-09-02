<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>layout 后台大布局 - Layui</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
  <script>
			var delay=400;             //文字出现的时间间隔
			var text="医药ERP";  //预定文字
			var i=0;                //初始化变量 i
			$(function(){
				scrollit(); //调用scrollit()函数
			});
			function scrollit(){
				//设置 id 为 demo 的对象内的文字为从变量 text 的 0 开始到 i 间的文字加"_"
				font.innerText=text.slice(0,i++)+"﹑";
				if(i>text.length){       //当 i 大于 text 的文本长度时
					i=0              //重设 i 为 0，使文字重新从第一个文字出现
					//延时执行scrollit()函数,delay*10是为了让显示完整文字的时间长一点
					font.innerText=text
					
				}else{
					setTimeout("scrollit()",delay)       //否则在delay毫秒后再次执行scrollit()函数
					
				} 
			}
		</script>
  <style type="text/css">
	body{
		margin:0px;
		padding:0px;
	}
        
  	/*顶部*/
  	.layui-header {
    	z-index: 1000;
   	 	height: 75px;
   	 	padding:auto 30px;
   	 	background: -moz-linear-gradient(right,#9A2EFE,#5d20db,#1e9cf0);
   	 	box-shadow: 3px 3px 5px #BDBDBD; 
	}
	
	
	/*左边导航*/
	.layui-layout-admin .layui-side {
    	top: 75px;
    	width: 250px;
    	overflow-x: hidden;
		box-shadow:1px 1px 6px #BDBDBD;
		/*第一个参数是x轴阴影段长度
			第二个参数是y轴阴影段长度
			第三个参数是往四周阴影段长度
			第四个参数是阴影段颜色*/
	}
	/*一级菜单高度*/
	.layui-nav-tree .layui-nav-item a {
    	height: 55px;
    	line-height: 55px;
	}
	
	
	.layui-nav.layui-nav-tree .layui-nav-child dd a{
    	height: 45px;
    	line-height: 45px;
    	
    	
	}
	
	/*配合设置左边导航宽度*/
	.layui-side-scroll {
    	width: 270px;
	}
	/*中间内容*/
	.layui-layout-admin .layui-body {
    	position: fixed;
    	top: 75px;
    	bottom:0px;
    	background:#FAFAFA;
	}
	
	/*中间内容位置*/
	.layui-body {
    	left: 250px;
    	
	}
	
	/*左下导航颜色*/
	.layui-nav-tree {
    	background: white;
    	width:250px;
	}
	/*左上导航颜色*/
	.layui-side-scroll {
    	background: white;
	}
	
	/*导航字体及图标*/
	.layui-nav * {
    	font-size: 14px;
    	color: #595b5c;
	}
	/*一级菜单悬浮*/
	.layui-nav-tree .layui-nav-item a:hover {
    	background: -moz-linear-gradient(right,#AB82FF,#7D7DFF,#1e9cf0);
	}
	/*一级菜单悬浮字体*/
	.layui-nav-tree .layui-nav-item a:hover span{
    	color:white;
	}
	
	/*二级菜单背景颜色*/
	.layui-nav.layui-nav-tree .layui-nav-child dd {
    	background: #FFF7FF;
    	/*修改二级菜单左边距*/
    	padding-left:0px;
	}
	
	/*顶部中间内容*/
	.layui-layout-admin .layui-header .layui-nav {
    	background: 0 0;
    	margin-top: 15px;
    	margin-left:50px;
	}
	
	/*左边悬浮白边*/
	.layui-nav-tree .layui-nav-bar {
    	background-color: #bb07ef;
	}
	
	/*logodiv*/
	.layui-layout-admin .layui-logo {
    	position: absolute;
    	left: 0;
    	top: 0;
    	width: 250px;
    	height: 100%;
    	line-height: 60px;
    	text-align: center;
    	color: white;
    	font-size: 20px;
    	font-weight: 700;
    	padding-top:5px;
	}
	
	/*选择二级菜单*/
	.layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a, .layui-nav-tree .layui-this, .layui-nav-tree .layui-this > a, .layui-nav-tree .layui-this > a:hover {
   		    	background: -moz-linear-gradient(right,#AB82FF,#7D7DFF,#1e9cf0);
   		    	border-right:3px solid #bb07ef;
    	
	}
	/*选择二级菜单*/
	.layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a, .layui-nav-tree .layui-this, .layui-nav-tree .layui-this > a, .layui-nav-tree .layui-this > a:hover span{
		color:white;    	
		
	}
	/*二级菜单悬浮字体*/
	.layui-nav .layui-nav-child a:hover span {
		color: white;
		
	}
	
	
	/*打开菜单，右边箭头*/
	.layui-nav .layui-nav-mored, .layui-nav-itemed > a .layui-nav-more {
    	border-color: transparent transparent #595b5c;
	}
	/*菜单未展开图标颜色*/
	.layui-nav .layui-nav-more {
    	border-top-color: #E6E6E6;
	}
	

	/*二级菜单文字位置*/
	.layui-nav-child span{
		padding-left:35px;
	}
	
	/*一级菜单文字位置*/
	.layui-nav-item.layui-nav-itemed a span{
		margin-left:10px;
	}
	
	/*tab选项卡*/
	.layui-tab {
    	margin:0 0;
	}
	
	/*选项卡顶部*/
	.layui-tab-title{
		background:white;
	}
	
	.layui-tab-item.layui-show{
		width:100%;
		height:100%;
	}

	/*导航栏下划线颜色*/
	.layui-nav .layui-this::after, .layui-nav-bar, .layui-nav-tree .layui-nav-itemed::after {
  		background-color: #FF359A; 
	}


	.layui-layout-admin .layui-header .layui-nav {
    	margin-left: 35px;
	}
  </style>

</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
  <div class="layui-header" >
    <div class="layui-logo" id="font"></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item layadmin-flexible" lay-unselect="" id="22ej">
            <a href="javascript:;" layadmin-event="flexible" class="kit-side-fold"  title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" style="color:white;font-size:15px;" id="LAY_app_flexible"></i>
            </a>
      </li>
      
      
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item" ><a href=""><i class="layui-icon layui-icon-screen-restore" id="btn" style="color:white;font-size:18px;"></i></a></li>
      <li class="layui-nav-item" ><a href=""><i class="layui-icon layui-icon-notice" style="color:white;font-size:18px;"></i></a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="../images/QQ.jpg" class="layui-nav-img">
          ${name}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href=""><i class="layui-icon layui-icon-close" style="font-size:20px;color:white;"></i></a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <div class="layui-inline" style="margin:20px;">
  			<img src="../images/QQ.jpg" width="70px" class="layui-circle">
  			<font color="#595b5c" size="3px">Li.</font>
		</div>
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  style="border-top:1px solid #E6E6E6;" id="tree" lay-filter="test">
            
        </ul>
        
    </div>
</div>

  
  <div class="layui-body" id="content">
    <!-- 内容主体区域 -->
    <div class="layui-tab layui-tab-brief" lay-allowClose="true" lay-filter="docDemoTabBrief">
  			<ul class="layui-tab-title">
  				<li class="layui-this" lay-id="index.jsp"><i class="layui-icon layui-icon-home " ></i></li>
  			</ul>
  			<div class="layui-tab-content" id="main" style="height:590px;">
  			        <div class="layui-tab-item layui-show" id = "boxscroll4" style="height:100%;width:100%;">
  						<iframe src="login.jsp" style="height:100%;width:100%;"  scrolling="auto" id="iframe" class="layadmin-iframe"  frameborder="0"></iframe>
  					</div>
  			</div>
	</div>
  </div>
  
  
</div>
<script src="../layui/layui.js"></script>

<script>
//JavaScript代码区域
//注册组件
layui.use('element', function(){
  //获取组件对象
  var element = layui.element;
  //监听菜单点击
  element.on('nav(test)', function(elem){
	  var url =  elem.attr("name");
	  var name =  elem.attr("class");
	  //判断点击的菜单 路径不为空
	  if(url != undefined ){
		  var ifs =0;
		  //循环所有tab标签
		  $(".layui-tab-title li").each(function(){
			  //判断点击菜单是否已经在tab中存在
			  if(elem.attr("name") == $(this).attr("lay-id")){
				  ifs = 1;
			  }
		  });
		  if(ifs == 0){
			  element.tabAdd('docDemoTabBrief', {
				  title: name
				  ,content:'<iframe id="iframe" src="'+url+'" scrolling="auto" style="height:100%;width:100%;" class="layadmin-iframe" frameborder="0"></iframe>'
				  ,id: url
				});
		  }
		  
		  //切换tab选中
		  element.tabChange('docDemoTabBrief', url);
	  }
	});
  	
  
    
    $.ajax({
		url:'../queryMenu.do',
		type:'get',
		dataType:'json',
		success:function(back){
			var str = "";
			var jack = back.data;
			for(var i = 0;i < jack.length;i++){
				if(jack[i].menuParent == 0){
					str += '<li class="layui-nav-item"><a  href="javascript:;" ><i class="layui-icon '+jack[i].menuIcon+'" style="font-size:16px;"></i> <span style="margin-left:10px;font-weight:bold;">'+jack[i].menuName+'</span></a><dl class="layui-nav-child">';
					for(var j = 0;j < jack.length;j++){
						if(jack[i].menuId == jack[j].menuParent){
							str +='<dd><a href="javascript:;"  name="'+jack[j].menuURL+'" class="'+jack[j].menuName+'"> <span >'+jack[j].menuName+'</span></a></dd>';
						}
					}
				}
	            str +='</dl></li>';        
			}
			$("#tree").html(str);
			element.render();
			$(".layui-nav-child dd a").click(function(){
				var te = $(this).children("span").html();
				$(".layui-nav-child dd a span").each(function(){
					if($(this).html() == te){
						$(this).css("color","white");
					}else{
						$(this).css("color","#595b5c");
					}
				});
			});
		}
	});
    
   
});


$(function(){
	$(".layui-tab ul").children('li').first().children('.layui-tab-close').css("display",'none');
	$("#22ej").click(function(){
		var classVal= $("#LAY_app_flexible").attr("class");
		if(classVal == 'layui-icon layui-icon-shrink-right'){
			$("#LAY_app_flexible").attr("class","layui-icon layui-icon-spread-left");
			hide();
		}else{
			$("#LAY_app_flexible").attr("class","layui-icon layui-icon-shrink-right");
			show();
		}
		
	});
});

function hide(){
    $('.layui-side span').hide();  
    $('.layui-side').animate({width:'55px'});
    $('.layui-body').animate({left:'125px'});
}
function show(){
    $('.layui-side span').show();  
    $('.layui-side').animate({width:'250px'});
    $('.layui-body').animate({left:'250px'});
}




</script>
</body>
</html>