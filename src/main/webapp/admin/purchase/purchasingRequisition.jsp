<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>采购申请列表</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div id="form1" style="display: none;">
<form class="layui-form" action="addPurchaseEmployee.do" method="post" >
  <p>基本信息</p>
  <table class="layui-table">
  	<tr>
  		<td>
  			<div class="layui-inline">
  			<label class="layui-form-label" style="font-size:13px;">申请员：</label>
   			<div class="layui-input-inline">
      			<select name="empId" id="empId" lay-verify="required" lay-search="" >
      				<option value=""></option>
      				<option value="1">zs</option>
      			</select>
    		</div>
    		</div>
		</td>
  		<td>
  		<label class="layui-form-label" style="font-size:13px;">申请部门：</label>
   			<div class="layui-input-inline">
      	<select name="departmentId" id="departmentId" lay-search="" lay-verify="required">
          <option value=""></option>
          <option value="1">layer</option>
          <option value="2">form</option>
          <option value="3">layim</option>
          <option value="4">element</option>
        </select>
  			</div>
    	</td>
    	<td>
  			<label class="layui-form-label" style="font-size:13px;">预计金额：</label>
    			<div class="layui-input-block">
      				<input name="purchaseAmount" id="purchaseAmount" class="layui-input" type="text" autocomplete="off" lay-verify="required">
    			</div>
  		</td>
  	</tr>
  	<tr>
  		<td colspan="3">
  			<label class="layui-form-label" style="font-size:13px;">申请原因：</label>
   			<div class="layui-input-block">
      			<textarea class="layui-textarea" id="cause" name="cause" placeholder="请输入内容" lay-verify="required"></textarea>
    		</div>
  		</td>
  	</tr>
  </table>
  <div class="layui-input-block" align="center">
      <button class="layui-btn" lay-filter="demo1" id="submit" lay-submit="" lay-filter="login" >立即提交</button>
  </div>

</form>
</div>


 <div style="display: none;" id="purchaseOrderDetails">
 	<form class="layui-form" action="addPurchaseRequestDetails.do" method="post" >
 		<table class="layui-table">
 			<tr>
 				<td><label class="layui-form-label" style="font-size:13px;">材料名称：</label>
   			<div class="layui-input-inline">
      			<select name="materialId" id="materialId" lay-verify="required" lay-search="" >
      				<option value=""></option>
      				<option value="1">zs</option>
      			</select>
    		</div></td>
    		<td>
    		<label class="layui-form-label" style="font-size:13px;">采购数量：</label>
    			<div class="layui-input-block">
      				<input name="number" id="number" class="layui-input" type="text" autocomplete="off" lay-verify="required">
    			</div>
    		</td>
    		<td><input type="text" id="purchaseRequestId" name="purchaseRequestId" autocomplete="off"  style="display: none;"/>
    		<button class="layui-btn" lay-filter="submit" lay-submit="" lay-filter="login" >添加</button></td>
 			</tr>
 		</table>
 	</form>
 	<table class="layui-hide" id="demo" lay-filter="demo"></table>
 </div>
 
 
 <div>
<form class="layui-form" >
<table style="width: 100%">
 	<tr>
 		<td><label class="layui-form-label" style="margin-top: -5px;font-size:13px;">采购计划编号：</label>
   			<div class="layui-input-block">
      			<input name="a" class="layui-input" type="text" autocomplete="off" lay-verify="title" style="width: 200px;height: 30px">
    		</div></td>
    	<td><label class="layui-form-label" style="margin-top: -10px;font-size:13px;">计划员：</label>
   			<div class="layui-input-block">
      			<input name="a" class="layui-input" type="text" autocomplete="off" lay-verify="title" style="width: 200px;height: 30px">
    		</div></td>
		<td><label class="layui-form-label" style="margin-top: -10px;font-size:13px;">采购部门：</label>
   			<div class="layui-input-block">
      			<input name="a" class="layui-input" type="text" autocomplete="off" lay-verify="title" style="width: 200px;height: 30px">
    		</div></td>
 	</tr>
 	<tr>
 		<td><label class="layui-form-label" style="margin-top: -20px;font-size:13px;">采购员：</label>
   			<div class="layui-input-block">
      			<input name="a" class="layui-input" type="text" autocomplete="off" lay-verify="title" style="width: 200px;height: 30px ;margin-top: -20px">
    		</div></td>
 		<td>
			<label class="layui-form-label" style="margin-top: -20px;font-size:13px;">审核状态：</label>
      <div class="layui-input-inline" style="width: 200px;height: 30px;margin-top: -20px">
       <select name="interest" lay-filter="aihao">
        <option value="">全部状态</option>
        <option value="0">写作</option>
        <option value="1">阅读</option>
      </select>
      </div>
			
		</td>
		<td>
			<label class="layui-form-label" style="margin-top: -20px;font-size:13px;">计划制定日期：</label>
   			<div class="layui-input-block">
      			<input name="date" class="layui-input" id="date" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date" style="width: 200px;height: 30px"/>
    		</div>
    		
		</td>
 	</tr>
 </table>
</form>
 </div>
<table class="layui-hida" id="test" lay-filter="test"></table>


 
 
<script id="toolbarDemo" type="text/html">
  <div class="layui-btn-container">
	<button class="layui-btn layui-btn-sm" lay-event="select"><i class="layui-icon layui-icon-search"></i>搜索</button>
	<button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>新增</button>
  </div>
</script>
 
<script id="barDemo" type="text/html">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">退货</a>
  
</script>
              
          
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 
<script type="text/javascript">
layui.use([ 'table', 'laydate', 'element','form','layer', 'layedit', 'laydate'], function(){
	var layer = layui.layer;
	var element = layui.element;
	var table = layui.table;
	var laydate = layui.laydate;
	var form = layui.form;

  table.render({
    elem: '#test'
    ,url:'showPurchaseEmployee.do'
    ,toolbar: '#toolbarDemo'
    ,title: '用户数据表'
    ,contentType: 'jsonp'
    ,request: {
        pageName: 'page' //页码的参数名称，默认：page
        ,limitName: 'limit'
    }
    ,even : true
    ,method : 'post'
    ,page: true
    
    ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
    	limits:[10,20,30]//每页条数的选择项
   	    ,limit:10 //一页显示多少条
	}
    ,cols: [[
    	,{field:'purchaseRequestId', title:'采购申请编号', width:80,  sort: true}
        ,{field:'emp_name', title:'员工姓名', width:120}
        ,{field:'departmentName', title:'所属部门', width:150}
        ,{field:'auditStatus', title:'审核状态', width:120}
        ,{field:'timeOfApplication', title:'申请时间', width:100}
        ,{field:'purchaseAmount', title:'预计金额',width:100}
        ,{field:'cause', title:'申请原因'}
        ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
    ]]
    
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    
    switch(obj.event){
      case 'select':
    	  break;
      case 'add':
    	var layer = layui.layer;
  	    layer.open({
  	    	type: 1, 
  	    	title:'采购申请',
  	    	area: ['1000px', '350px'],
  	    	offset: ['0px', '50px'],
  	    	content: $('#form1') //这里content是一个普通的String
  	    });
  	    
    	  break;
    };
  });
  table.on('edit(test)', function(obj){
	  
	  alert(obj.value);
  });
  table.on('rowDouble(test)', function(obj){
	    var layer = layui.layer;
	    $('#purchaseRequestId').prop('value',obj.data.purchaseRequestId);
	    layer.open({
	    	type: 1, 
	    	title:'详细信息',
	    	area: ['1000px', '500px'],
	    	offset: ['0px', '50px'],
	    	content: $('#purchaseOrderDetails') //这里content是一个普通的String
	    });
	    layui.use('table', function(){
	  	  var table = layui.table;
	  	  var tableIns =table.render({
	  	    elem: '#demo'
	  	    ,url:'selectByIdPurchaseRequest.do?id='+obj.data.purchaseRequestId
	  	    ,title: '用户数据表'
	  	    ,cols: [[
	  	      {field:'purchaseRdId', title:'采集申请详情ID', fixed: 'left', unresize: true, sort: true}
	  	      ,{field:'materialId', title:'材料id',edit: 'text'}
	  	      ,{field:'number', title:'采购数量',  edit: 'text'}
	  	      ,{field:'subtotal', title:'小计',  edit: 'text'}
	  	    ]]
	  	    ,page: true
	  	  });
	  	  
	  	});
	});

  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //console.log(obj)
    if(obj.event === 'del'){
      layer.confirm('确认退货吗', function(index){
        obj.del();
        layer.close(index);
      });
    }else if(obj.event==='edit'){
    	
    	
    }
  });
  
  layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [
      /^[\S]{6,12}$/
      ,'密码必须6到12位，且不能出现空格'
    ]
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
	
  });
  
  form.on('submit(submit)', function(data){
	  $.ajax({
		  url:'addPurchaseRequestDetails.do',
		  type:'post',
		  dataType:'json',
		  data:data.field,
		  success:function(back){
			  if(back>0){
				  window.location.reload();
			  }else{
				  alert('添加失败');
			  }
		  }
	  });
	  return false;
  });
  

});


</script>
</body>
</html>