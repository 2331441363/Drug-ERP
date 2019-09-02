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
		<select name="city" lay-verify="" lay-filter="selectFilter">
  			<option value="" selected>日志类型</option>
  			<option value="001" >系统日志</option>
  			<option value="002">操作日志</option>
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
      ,{field:'username', title:'日志内容',unresize:true}
      ,{field:'username', title:'操作人',unresize:true}
      ,{field:'sex', title:'操作时间', unresize:true}
      ,{
		fixed: 'right', align:'center', toolbar: '#barDemo',unresize:true
      }
    ]]
    ,page: true
  });
  
  
  //监听工具条
  table.on('tool(test)', function(obj){
    var data = obj.data;
    if(obj.event === 'del'){
      layer.confirm('确认删除该日志', function(index){
        obj.del();
        layer.close(index);
      });
    }
  });
  
  //下拉框选中
  form.on('select(selectFilter)', function(data){
	  if(data.value == '001'){
		  
	  }else if(data.value == '002'){
		  
	  }//得到被选中的值
	});      
  
});
</script>


</body>
</html>