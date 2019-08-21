<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>菜单</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
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
<form class="layui-form" action="">
			<div class="layui-inline" style="margin-top: 20px;">
					<label class="layui-form-label" >付款日期:</label>
				<div class="layui-input-inline" >
					<input type="text"  class="layui-input" id="test5"
						placeholder="年--月--日 ">
				</div>
			</div>
	
  <div class="layui-inline" style="margin-top: 20px;">
      <label class="layui-form-label">供应商：</label>
      <div class="layui-input-inline">
        <select name="audit" lay-verify="required" lay-search="required">
          <option value="1">请选择</option>
          <option value="2">王五</option>
        </select>
      </div>
    </div>

 <div class="layui-inline" style="margin-top: 20px;">
      <label class="layui-form-label">项目：</label>
      <div class="layui-input-inline">
        <select name="audit" lay-verify="required" lay-search="required">
          <option value="1">请选择</option>
          <option value="2">xx</option>
        </select>
      </div>
    </div>
    
    
</form>

<table id="demo" lay-filter="test"></table>
<script>
		var table2 = null ;
		layui.use('table', function(){
			var table = layui.table, form = layui.form;
		  
		  //执行一个 table 实例
		 	table2 =  table.render({
		    elem: '#demo'
		    ,height:563
		    ,url: 'flowerServlet?action=selectAll' //数据接口
		    ,title: '付款单查询'
		    ,page: true //开启分页
		    ,toolbar: '#toolbarDemo' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
		    ,totalRow: true //开启合计行
		    ,cols: [[ //表头
		    	{type:'checkbox'}
		        ,{field: 'id', title: '编号', width:150, sort: true}
		        ,{field: 'payPerson', title: '付款人', width:120}
		        ,{field: 'project', title: '项目', width:120}
		        , {field: 'payDate', title: '付款日期', width:120}
		        , {field: 'dept', title: '部门', width:120}
		        ,{field: 'provider', title: '供应商', width:120}
		        , {field: 'companyAccount', title: '公司账户', width:120}
		        , {field: 'money', title: '付款金额', width:120}
		        , {field: 'moneyUpper', title: '金额大写', width:120}
		        , {field: 'payMethod', title: '付款方式', width:120}
		        ,{field: 'payType', title: '付款类型', width:140}
		        ,{fixed: 'payNote', title:'备注', toolbar: '#barDemo', width:180}
		    ]]
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
  <a class="layui-btn layui-btn-xs" lay-event="edit" style="width:60px;height:30px;line-height:30px">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" style="width:60px;height:30px;line-height:30px">删除</a>
</script>
