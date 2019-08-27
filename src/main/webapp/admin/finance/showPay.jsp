<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>付款单查询</title>
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<script src="../layui/layui.js"></script>
<style type="text/css">
body {
	margin: 0 auto;
	width: 100%;
	height: 100%;
}

.demoTable {
	width: 100%;
	height: 50px;
	margin: 0px auto;
	line-height: 50px;
}
label{
	font-size: 13px;
}

</style>
</head>
<body>
<script src="../layui/layui.js"></script>
<script>
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
		//日期时间选择器
		  laydate.render({
		    elem: '#test5'
		    ,type: 'date'
		  });
	});
</script>
	<!-- <iframe src="Pay.html" width="890px" height= "400px" name="topFrame" scrolling="no" frameborder="0" id="topFrame" style="display: none;"></iframe> -->

	<table id="demo" lay-filter="test"></table>
	<script type="text/html" id="toolbarDemo">

	

	<div class="layui-inline" >
<form class="layui-form" action="" >
		<div class="layui-inline" style="margin-left:20px;">
			<label>付款日期：</label>
			<div class="layui-input-inline" style="margin-left:5px;">
				<input type="text" class="layui-input" id="test5"
					placeholder="年--月--日 ">
			</div>
		</div>

		<div class="layui-inline" style="margin-left:20px;">
			<label>分店：</label>
			<div class="layui-input-inline" style="margin-left:5px;">
				<select name="audit"  lay-search="required">
					<option value="1">请选择</option>
					<option value="2">王五</option>
				</select>
			</div>
		</div>

		<div class="layui-inline" style="margin-left:20px;">
			<label>付款类型：</label>
			<div class="layui-input-inline" style="margin-left:5px;">
				<select name="audit" lay-search="required">
					<option value="1">请选择</option>
					<option>采购付款</option>
					<option>分店退货</option>
				</select>
			</div>
		</div>

		<div class="layui-inline" >
			<button class="layui-btn layui-btn-normal" data-type="reload">搜索</button>		
		</div> 
</form>

	<div id="layerDemo" class="layui-btn-group demoTable">
  		<button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal"><i class="layui-icon" ></i>付款单</button>
	</div>
</div>

	
	</script>
	
	<script>
		var table2 = null ;
		layui.use(['table','form'], function(){
			var table = layui.table, form = layui.form;
		  
		  //执行一个 table 实例
 		 	table2 =  table.render({
		    elem: '#demo'
		    ,height:563
		    ,url: '../json/demo1.json' //数据接口
		    ,title: '付款单查询'
		    ,page: true //开启分页
		    ,toolbar: '#toolbarDemo' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
		    ,totalRow: true //开启合计行
		    ,cols: [[ //表头
		    	{type: 'checkbox', fixed: 'left'}
		        ,{field: 'id', title: '编号', width:150, sort: true, unresize:true}
		        ,{field: 'payPerson', title: '付款人', unresize:true}
		        , {field: 'payDate', title: '付款日期', unresize:true}
		        , {field: 'dept', title: '部门', unresize:true}
		        ,{field: 'provider', title: '分店', unresize:true}
		        , {field: 'companyAccount', title: '公司账户', unresize:true}
		        , {field: 'money', title: '付款金额', unresize:true}
		        , {field: 'payMethod', title: '付款方式', unresize:true}
		        ,{field: 'payType', title: '付款类型', unresize:true}
		        ,{field: 'payNote', title:'备注', unresize:true}
		        ,{
		    		fixed: 'right', title:'操作',width:178, align:'center', toolbar: '#barDemo',unresize:true
		          }
		        ]]
		  });
		  
		 	//头工具栏事件
		 	   table.on('toolbar(test)', function(obj){
		 	    //var checkStatus = table.checkStatus(obj.config.id);
		 	    /* switch(obj.event){
		 	      case 'getCheckData':
		 	    		layer.open({
		 	    		  title: '在线调试'
		 	    		  ,content: $("#topFrame")
		 	    		  ,area: ['80%', '90%']
		 	    		}); 
		 	      break;
		 	    }; */
		 	  }); 
		 	
		 	//触发事件
		 	 var active = {
		 	    offset: function(othis){
		 	     var type = othis.data('type')
		 	     ,text = othis.text();
		 	     
		 	     layer.open({
		 	        type: 1, 
		 	        title : '付款单' //标题
		 	       ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
		 	       ,id: 'layerDemo'+type //防止重复弹出
		 	      ,content: '<iframe src="Pay.html" width="100%" height= "98%" name="topFrame" scrolling="no" frameborder="0" id="topFrame"></iframe>'
		 	       ,area: ['75%', '95%']
		 			,success:function(){
		 				layui.use('laydate', function(){
		 					  var laydate = layui.laydate;
		 						//日期时间选择器
		 						  laydate.render({
		 						    elem: '#test1'
		 						    ,type: 'date'
		 						  });
		 					});
		 				form.render();//表单渲染
		 			}
		 	     });
		 	   }
		 	 }
		 	 
		 	 $('#layerDemo .layui-btn').on('click', function(){
		 	   var othis = $(this), method = othis.data('method');
		 	   active[method] ? active[method].call(this, othis) : '';
		 	 });
		 	  
		 	  
		 	$(function() {
			 	//查询
		 		$("#seachTable").on("click",function(){
		 			//iframe层
		 			console.info("111");
		 			table2.reload({
		 				where : {
		 					flowerName:$("#name").val(),
		 				},
		 				page : {
		 					curr : 1
		 				}
		 			});
		 		});
		 	});
		  
	 	
		//监听操作
		table.on('tool(test)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			var tr = obj.tr; //获得当前行 tr 的DOM对象
	
			if (layEvent === 'del') { //查看
				layer.confirm('真的删除行么',function(index) {
					obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
					layer.close(index);
					//向服务端发送删除指令
					var url = "flowerServlet?action=delect";
					var data$ = {flowerId : data.flowerId};
					$.post(url,data$,function(obj) {
						layer.msg(obj.msg);//提示
						table2.reload(); //也是刷新父页面的
					},"json");
				});
			} else if (layEvent === 'edit') { //编辑
				var data = obj.data;//行数据
				//iframe层
				layer.open({
					type : 2,
					title : '修改页面',//标题
					shadeClose : true,
					shade : 0.3,//背景阴影
					area : [ '50%', '60%' ],//大小
					content : 'pages/flower/flowerFrom.jsp?id='
							+ data.flowerId, //iframe的url
					end : function() {
						table2.reload();
					}
				});
			}
		});
		
	});
		//});
</script>


<!-- <button class="layui-btn layui-btn-sm" lay-event="getCheckData"><i class="layui-icon" ></i>付款单</button> -->

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


</body>
</html>