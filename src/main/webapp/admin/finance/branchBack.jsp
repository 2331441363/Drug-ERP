<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分店退货单(总店付款)</title>
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
<table class="layui-table" lay-data="{url:'../../listPay.do', id:'testReload',page: true}" lay-filter="testReload">
		    	  <thead>
		    	    <tr>
		    	    <th lay-data="{type: 'checkbox', fixed: 'left'}">ID</th>
		    	    <th lay-data="{field: 'returnId', width:150, sort: true}">订单编号</th>
		    	    <th lay-data="{field: 'branchName'}">分店名称</th>
		    	    <th lay-data="{field: 'drugName'}">商品名称</th>
		    	    <th lay-data="{field: 'returnQuantity'}">商品数量</th>
		    	    <th lay-data=" {field: 'returnTotal'}">合计</th>
		    	    <th lay-data="{field: 'returnTime'}">退货时间</th>
		    	    <th lay-data="{field: 'checkStatus',edit: 'text'  }">审核状态</th>
		    	    <th lay-data="{field: 'receiptStatus',edit: 'text'  }">收款状态</th>
		        </tr>
		        </thead>
		      </table>
		  


<script>
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
		//日期时间选择器
		  laydate.render({
		    elem: '#test5'
		    ,type: 'datetime'
		  });
	});
</script>


<table id="demo" lay-filter="test"></table>
<script>
		layui.use(['table'], function(){
			var table = layui.table, form = layui.form;
		  
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
		  
		 	
		 	 //单元格编辑事件
		 	  table.on('edit(testReload)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
		 	      //console.log(obj.value); //得到修改后的值
		 	      //console.log(obj.field); //当前编辑的字段名
		 	      var data = obj.data; //所在行的所有相关数据  
		 	      /* $.ajax({
		 				url:'../../updBranchReturnStatus.do',
		 				method:'post',
		 				data:'returnId='+data.returnId+'&receiptStatus='+data.receiptStatus,
		 				dataType:'json',
		 				success:function(back){
		 					if(back='ok'){
		 					//修改分店收款状态、日期
		 					 $.ajax({
		 		 				url:'../../updBranchReceStatus.do',
		 		 				method:'post',
		 		 				data:'returnId='+data.returnId,
		 		 				dataType:'json',
		 		 				success:function(back){
		 		 					if(back='ok'){
		 		 						alert("分店已收款");
		 		 					}
		 		 				}
		 		 			});
		 					}
		 				}
		 			});
		 	       */
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

 <script type="text/html" id="toolbarDemo">
<form class="layui-form" action="" >
			<div class="layui-inline" style="margin-left:20px;">
					<label  >退货时间：</label>
				<div class="layui-input-inline"  style="margin-left:5px;">
					<input type="text"  class="layui-input" id="test5"
						placeholder="年--月--日 ">
				</div>
			</div>
	
  <div class="layui-inline" style="margin-left:20px;">
      <label>订单号：</label>
      <div class="layui-input-inline"  style="margin-left:5px;">
       <input  type="text" name="username" 
					placeholder="请输入" autocomplete="off" class="layui-input">
      </div>
    </div>

<div class="layui-inline" >
			<button class="layui-btn layui-btn-sm  layui-btn-normal" data-type="reload">搜索</button>		
		</div>     
    
</form>

	 <div class="layui-inline" style="margin-top:20px;">
      <label class="layui-form-label">审核</label>
      <div class="layui-input-inline">
        <select name="audit" lay-verify="required" lay-search="required">
          <option value="1">审核通过</option>
          <option value="2">审核不通过</option>
        </select>
      </div>
    </div>
</script>
</body>
</html>