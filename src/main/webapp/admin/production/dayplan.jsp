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

<script type="text/html" id="toolbarDemo">

 
<div class="layui-input-inline">
  <div class="layui-btn-container" style="margin-top:10px;padding-left:20px;">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">审核日计划 </button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">制定生产订单</button>
  </div>


</div>
	<label width="120px" style="margin:0 5px 0 20px;">状态查询</label>
	<div class="layui-input-inline">
		<select name="city" lay-verify="">
  			<option value="">审核状态</option>
  			<option value="010" selected>未审核</option>
  			<option value="021">审核未通过</option>
 			<option value="0571">审核通过</option>
		</select>  
	</div>
</script>

<script type="text/html" id="toolbarDemo2">
  <div class="layui-inline" style="padding-left:20px;">
      <label width="120px" style="margin:0 5px 0 0px;">药品选择</label>
      <div class="layui-input-inline">
        <select name="modules" lay-verify="required" lay-search="">
          <option value="">请选择</option>
          <option value="1">阿莫西林</option>
          <option value="2">板蓝根</option>
          <option value="3">肤痒颗粒</option>
          <option value="4">维C</option>
          <option value="5">脑白金</option>
          <option value="6">upload</opt
          <option value="7">laydate</option>
          <option value="8">laypage</option>
          <option value="9">flow</option>
          <option value="10">util</option>
          <option value="11">code</option>
          <option value="12">tree</option>
          <option value="13">layedit</option>
          <option value="14">nav</option>
          <option value="15">tab</option>
          <option value="16">table</option>
          <option value="17">select</option>
          <option value="18">checkbox</option>
          <option value="19">switch</option>
          <option value="20">radio</option>
        </select>
      </div>
	
	<label width="120px" style="margin:0 5px 0 20px;">输入生产数量</label>
	<div class="layui-input-inline">
		 <input type="text" name="username" lay-verify="number" placeholder="请输入" autocomplete="off" class="layui-input">
	</div>
	<button type="button" class="layui-btn layui-btn-normal">添加</button>


	<label width="120px" style="margin:0 5px 0 60px;">请选择制定日期</label>
	<div class="layui-input-inline">
		<input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
	</div>
	<label width="120px" style="margin:0 5px 0 20px;">制定人</label>
	<div class="layui-input-inline">
		<select name="modules" lay-verify="required" lay-search="">
          <option value="">请选择</option>
          <option value="1">张三</option>
          <option value="2">王五</option>
        </select>
	</div>
  </div>
	
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
layui.use(['table','laydate','form','layer'], function(){
  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
  var table = layui.table;
  var laydate = layui.laydate;
  var form = layui.form;
  //常规用法
  laydate.render({
    elem: '#test1'
  });
  //年月选择器
  laydate.render({
    elem: '#test3'
    ,type: 'month'
  });
  
  table.render({
    elem: '#test'
    ,url:'demo1.json'
    ,toolbar: '#toolbarDemo'
    ,title: '日生产计划'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'id', title:'日生产计划编号', unresize:true}
      ,{field:'username', title:'月生产计划编号',unresize:true}
      ,{field:'email', title:'制定日期',unresize:true}
      ,{field:'experience', title:'负责人', unresize:true}
      ,{field:'experience', title:'生产日计划总数', unresize:true}
      ,{field:'sex', title:'审核状态', unresize:true}
      ,{
		fixed: 'right', width:178, align:'center', toolbar: '#barDemo',unresize:true
      }
    ]]
    ,page: true
  });
  
  
  
  //工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
    	  
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选')
      break;
    };
  });
  
//监听工具条
  table.on('tool(test)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
    	layer.open({
  		  title: '计划详情',
  		  type:1,
  		  shadeClose : true,
  		  area : [ '600px', '400px' ],//大小
  		  content: $("#test2"),
  		  end : function() {
					$('[lay-id="test2"]').css("display", "none");
			  }
  		});
  	  
  	  table.render({
		    elem: '#test2'
		    ,url:'demo1.json'
		    ,totalRow: true
		    ,cols: [[
		      {type: 'checkbox', fixed: 'left', totalRowText: '合计'}
		      ,{type: 'numbers'}
		      ,{field:'id', title:'药品编号', unresize:true}
		      ,{field:'username', title:'药品名称',unresize:true}
		      ,{field:'experience', title:'日生产数量', totalRow: true,unresize:true}
		      
		    ]]
		});    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ JSON.stringify(data))
    }
  });
});
</script>



 
<table class="layui-hide" id="test" lay-filter="test"></table>
<table class="layui-hide" id="test2"  lay-filter="test2" style="display:none;"></table>
</body>
</html>
