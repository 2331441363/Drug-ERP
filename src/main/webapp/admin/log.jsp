<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日志管理</title>
<link rel="stylesheet" href="layui/css/layui.css">
<script src="layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>     
</head>
<body>

	
	<table class="layui-hide" id="test" lay-filter="test"></table>
	<table class="layui-hide" id="test2" lay-filter="test2"></table>
	<table class="layui-hide" id="test3" lay-filter="test3"></table>

	<script type="text/html" id="toolbarDemo">
  	<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">请选择日志类型</label>
	<div class="layui-input-inline">
		<select name="city" lay-verify="">
  			<option value="">日志类型</option>
  			<option value="001" selected>系统日志</option>
  			<option value="002">操作日志</option>
 			<option value="003">错误日志</option>
		</select>  
	</div>
	<button type="button" class="layui-btn layui-btn-normal">查询</button>
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

	<script>
layui.use(['table','laydate','form'], function(){
  var table = layui.table;
  var laydate = layui.laydate;
  var form = layui.form;
  
  
  table.render({
    elem: '#test'
    ,url:'json/demo1.json'
    ,toolbar: '#toolbarDemo'
    ,title: '领料单'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'id', title:'日志编号', unresize:true}
      ,{field:'username', title:'部门名称',unresize:true}
      ,{field:'sex', title:'描述', unresize:true}
      ,{
		fixed: 'right', align:'center', toolbar: '#barDemo',unresize:true
      }
    ]]
    ,page: true
  });
  
  
//监听工具条
  table.on('tool(test)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
    	layer.open({
			title : '权限管理',//标题
			type : 1,//样式
			shade: 0,
			area: ['350px', '500px'],
			content :$("#test12"),
			
			success : function(layero) {
				var mask = $(".layui-layer-shade");
				mask.appendTo(layero.parent());
				//其中：layero是弹层的DOM对象
			},
			end : function() {
				
			}
		});
		
		
	} else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ JSON.stringify(data))
    }
  });
  
  
//工具栏事件
	table.on('toolbar(test)', function(obj) {
		var checkStatus = table.checkStatus(obj.config.id);
		switch (obj.event) {
		case 'getCheckData':
			var index = layer.open({
				title : '新增部门',//标题
				type : 1,//样式
				shade: 0,
				offset: ['15%', '35%'],//设置位移
				btn: ['确认', '取消'],
				yes: function(index, layero){
					var index2 = layer.confirm('你确认制定该生产计划？', {
						  btn: ['确认', '取消'] //可以无限个按钮
						  ,btn2: function(index, layero){
						    layer.close(index2);
						  }
						}, function(index, layero){
							layer.msg('新增成功');
						});
				}
				,btn2: function(index, layero){
					//按钮【按钮二】的回调
					  layer.close(index);
					 //return false 开启该代码可禁止点击该按钮关闭
				},
				
				content :$("#branch"),
				success : function(layero) {
					var mask = $(".layui-layer-shade");
					mask.appendTo(layero.parent());
					//其中：layero是弹层的DOM对象
				}
			});
			break;
		};
	});
	
	$(function(){
		form.render();
	});
  
});
</script>


</body>
</html>