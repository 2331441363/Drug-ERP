<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 整个页面全部指定为这个地址 -->
<meta charset="UTF-8">
<title>收款单查询</title>
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
	

	<script type="text/html" id="toolbarDemo">
	<form class="layui-form" action="">
		<div class="layui-inline"  style="margin-left:20px;">
			<label >收款日期：</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" id="test5"
					placeholder="年--月--日 ">
			</div>
		</div>

		<div class="layui-inline"  style="margin-left:20px;">
			<label>分店：</label>
			<div class="layui-input-inline">
				<select name="audit" lay-search="required">
					<option value="1">请选择</option>
					<option value="2">王五</option>
				</select>
			</div>
		</div>

		<div class="layui-inline"  style="margin-left:20px;">
			<label >收款类型：</label>
			<div class="layui-input-inline">
				<select name="audit"  lay-search="required">
					<option value="1">请选择</option>
					<option>总店销售单</option>
					<option>采购退货单</option>
				</select>
			</div>
		</div>
		<div class="layui-inline" >
			<button class="layui-btn layui-btn-normal" data-type="reload">搜索</button>		
		</div> 
	</form>

	<div id="layerDemo" class="layui-btn-group demoTable">
  		<button data-method="offset"  class="layui-btn layui-btn-normal"  data-type="auto"><i class="layui-icon"></i>收款单</button>
	</div>	
	</script>

	<table id="demo" lay-filter="test"></table>
	<script>
		var table2 = null ;
		layui.use('table', function(){
			var table = layui.table, form = layui.form;
		  
		  //执行一个 table 实例
		 	table2 =  table.render({
		    elem: '#demo'
		    ,height:563
		    ,url: '../json/demo1.json' //数据接口
		    ,title: '收款单查询'
		    ,page: true //开启分页
		    ,toolbar: '#toolbarDemo' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
		    ,totalRow: true //开启合计行
		    ,cols: [[ //表头
		    	{type: 'checkbox', fixed: 'left'}
		        ,{field: 'receiptId', title: '编号', width:150, sort: true,unresize:true}
		        ,{field: 'receiptPayee', title: '收款人', unresize:true}
		        , {field: 'receiptTime', title: '收款日期', unresize:true}
		        , {field: 'receiptBranch', title: '部门', unresize:true}
		        ,{field: 'receiptClient', title: '分店', unresize:true}
		        , {field: 'receiptAccount', title: '公司账户',unresize:true}
		        , {field: 'receiptMoney', title: '收款金额', unresize:true}
		        , {field: 'receiptTerm', title: '收款方式', unresize:true}
		        ,{field: 'receiptType', title: '收款类型', unresize:true}
		        ,{field: 'receiptForm', title:'备注', unresize:true}
		        ,{
		    		fixed: 'right', title:'操作',width:178, align:'center', toolbar: '#barDemo',unresize:true
		          }
		    ]]
		  });
		  	  
		 	  //触发事件
		 	  var active = {
		 	     offset: function(othis){
		 	      var type = othis.data('type')
		 	      ,text = othis.text();
		 	      
		 	      layer.open({
		 	         type: 1, 
		 	         title : '收款单' //标题
		 	        ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
		 	        ,id: 'layerDemo'+type //防止重复弹出
		 	       ,content: '<iframe src="receipt.html" width="100%" height= "98%" name="topFrame" scrolling="no" frameborder="0" id="topFrame"></iframe>'
		 	        ,area: ['60%', '90%']
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
		  
	 	//监听头工具栏事件
	 	  table.on('select', function(data){
	 		  console.log(data.elem);
	 		 console.log(data.value); 
	 		 $('#audit').val(data.value);
	 		  console.log(data.othis); 
	 		 var audit=$('#audit').val();
	 		 alert(audit);
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
		
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
</html>