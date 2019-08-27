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
  <title>采购退货</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <link rel="stylesheet" href="layui/css/main.css" >
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
 <div style="display: none;" id="purchaseOrderDetails">
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


<iframe id="updatepurchaseReturn" src="admin/purchase/updatepurchaseReturn.jsp" style="display: none;" frameborder="0" width="1000px;" height="500px"></iframe>
 
 
 
<script id="toolbarDemo" type="text/html">
  <div class="layui-btn-container">
	<button class="layui-btn layui-btn-sm" lay-event="select"><i class="layui-icon layui-icon-search"></i>搜索</button>
  </div>
</script>
 
<script id="barDemo" type="text/html">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit">编辑</a>
  
</script>
              
          
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
 
<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
    ,url:'admin/json/demo1.json'
    ,toolbar: '#toolbarDemo'
    ,title: '用户数据表'
    /* ,parseData:function(res){
    	console.log(res);
    	return{
    		code: 0, //解析接口状态
    		msg:"", //解析提示文本
    		count: 1000, //解析数据长度
    		data: res //解析数据列表
    	}
    } */
    ,cols: [[
      {field:'stuid', title:'采购订单号', width:120, fixed: 'left', unresize: true}
      ,{field:'stuName', title:'下单时间', width:120}
      ,{field:'stuAge', title:'预计到货时间', width:150}
      ,{field:'stuSex', title:'采购人', width:120}
      ,{field:'claId', title:'供货商', width:120}
      ,{field:'sign', title:'采购金额'}
      ,{field:'experience', title:'采购状态', width:120}
      ,{field:'ip', title:'付款状态', width:120}
      ,{field:'logins', title:'入库状态', width:120}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:80}
    ]]
    ,page: true
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'select':
    	  break;
    };
  });
  table.on('edit(test)', function(obj){
	  console.log(obj.value); 
	  alert(obj.value);
  });
  table.on('rowDouble(test)', function(obj){
	    var layer = layui.layer;
	    layer.open({
	    	type: 1, 
	    	area: ['1000px', '500px'],
	    	offset: ['0px', '50px'],
	    	content: $('#purchaseOrderDetails') //这里content是一个普通的String
	    });

	});

  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //console.log(obj)
	if(obj.event==='edit'){
		
		var layer = layui.layer;
	    layer.open({
	    	type: 1, 
	    	area: ['auto', 'auto'],
	    	offset: ['00px', '50px'],
	    	content: $('#updatepurchaseReturn') //这里content是一个普通的String
	    });
    }
  });
  
  layui.use('table', function(){
	  var table = layui.table;
	  table.render({
	    elem: '#demo'
	    ,url:'admin/json/demo1.json'
	    ,title: '用户数据表'
	    /* ,parseData:function(res){
	    	console.log(res);
	    	return{
	    		code: 0, //解析接口状态
	    		msg:"", //解析提示文本
	    		count: 1000, //解析数据长度
	    		data: res //解析数据列表
	    	}
	    } */
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'stuid', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
	      ,{field:'stuName', title:'用户名', width:120, edit: 'text'}
	      ,{field:'stuAge', title:'邮箱', width:150, edit: 'text'}
	      ,{field:'stuSex', title:'性别', width:80, edit: 'text', sort: true}
	      ,{field:'claId', title:'城市', width:100}
	      ,{field:'sign', title:'签名'}
	      ,{field:'experience', title:'积分', width:80, sort: true}
	      ,{field:'ip', title:'IP', width:120}
	      ,{field:'logins', title:'登入次数', width:100, sort: true}
	      ,{field:'joinTime', title:'加入时间', width:120}
	    ]]
	    ,page: true
	  });
	  
	});

});



</script>
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  //常规用法
  laydate.render({
    elem: '#test1'
  });
  
  //国际版
  laydate.render({
    elem: '#test1-1'
    ,lang: 'en'
  });
  
  //年选择器
  laydate.render({
    elem: '#test2'
    ,type: 'year'
  });
  
  //年月选择器
  laydate.render({
    elem: '#test3'
    ,type: 'month'
  });
  
  //时间选择器
  laydate.render({
    elem: '#test4'
    ,type: 'time'
  });
  
  //日期时间选择器
  laydate.render({
    elem: '#test5'
    ,type: 'datetime'
  });
  
  //日期范围
  laydate.render({
    elem: '#test6'
    ,range: true
  });
  
  //年范围
  laydate.render({
    elem: '#test7'
    ,type: 'year'
    ,range: true
  });
  
  //年月范围
  laydate.render({
    elem: '#test8'
    ,type: 'month'
    ,range: true
  });
  
  //时间范围
  laydate.render({
    elem: '#test9'
    ,type: 'time'
    ,range: true
  });
  
  //日期时间范围
  laydate.render({
    elem: '#test10'
    ,type: 'datetime'
    ,range: true
  });
  
  //自定义格式
  laydate.render({
    elem: '#test11'
    ,format: 'yyyy年MM月dd日'
  });
  laydate.render({
    elem: '#test12'
    ,format: 'dd/MM/yyyy'
  });
  laydate.render({
    elem: '#test13'
    ,format: 'yyyyMMdd'
  });
  laydate.render({
    elem: '#test14'
    ,type: 'time'
    ,format: 'H点m分'
  });
  laydate.render({
    elem: '#test15'
    ,type: 'month'
    ,range: '~'
    ,format: 'yyyy-MM'
  });
  laydate.render({
    elem: '#test16'
    ,type: 'datetime'
    ,range: '到'
    ,format: 'yyyy年M月d日H时m分s秒'
  });
  
  //开启公历节日
  laydate.render({
    elem: '#test17'
    ,calendar: true
  });
  
  //自定义重要日
  laydate.render({
    elem: '#test18'
    ,mark: {
      '0-10-14': '生日'
      ,'0-12-31': '跨年' //每年的日期
      ,'0-0-10': '工资' //每月某天
      ,'0-0-15': '月中'
      ,'2017-8-15': '' //如果为空字符，则默认显示数字+徽章
      ,'2099-10-14': '呵呵'
    }
    ,done: function(value, date){
      if(date.year === 2017 && date.month === 8 && date.date === 15){ //点击2017年8月15日，弹出提示语
        layer.msg('这一天是：中国人民抗日战争胜利72周年');
      }
    }
  });
  
  //限定可选日期
  var ins22 = laydate.render({
    elem: '#test-limit1'
    ,min: '2016-10-14'
    ,max: '2080-10-14'
    ,ready: function(){
      ins22.hint('日期可选值设定在 <br> 2016-10-14 到 2080-10-14');
    }
  });
  
  //前后若干天可选，这里以7天为例
  laydate.render({
    elem: '#test-limit2'
    ,min: -7
    ,max: 7
  });
  
  //限定可选时间
  laydate.render({
    elem: '#test-limit3'
    ,type: 'time'
    ,min: '09:30:00'
    ,max: '17:30:00'
    ,btns: ['clear', 'confirm']
  });
  
  //同时绑定多个
  lay('.test-item').each(function(){
    laydate.render({
      elem: this
      ,trigger: 'click'
    });
  });
  
  //初始赋值
  laydate.render({
    elem: '#test19'
    ,value: '1989-10-14'
    ,isInitValue: true
  });
  
  //选中后的回调
  laydate.render({
    elem: '#test20'
    ,done: function(value, date){
      layer.alert('你选择的日期是：' + value + '<br>获得的对象是' + JSON.stringify(date));
    }
  });
  
  //日期切换的回调
  laydate.render({
    elem: '#test21'
    ,change: function(value, date){
      layer.msg('你选择的日期是：' + value + '<br><br>获得的对象是' + JSON.stringify(date));
    }
  });
  //不出现底部栏
  laydate.render({
    elem: '#test22'
    ,showBottom: false
  });
  
  //只出现确定按钮
  laydate.render({
    elem: '#test23'
    ,btns: ['confirm']
  });
  
  //自定义事件
  laydate.render({
    elem: '#test24'
    ,trigger: 'mousedown'
  });
  
  //点我触发
  laydate.render({
    elem: '#test25'
    ,eventElem: '#test25-1'
    ,trigger: 'click'
  });
  
  //双击我触发
  lay('#test26-1').on('dblclick', function(){
    laydate.render({
      elem: '#test26'
      ,show: true
      ,closeStop: '#test26-1'
    });
  });
  
  //日期只读
  laydate.render({
    elem: '#test27'
    ,trigger: 'click'
  });
  
  //非input元素
  laydate.render({
    elem: '#test28'
  });
  
  //墨绿主题
  laydate.render({
    elem: '#test29'
    ,theme: 'molv'
  });
  
  //自定义颜色
  laydate.render({
    elem: '#test30'
    ,theme: '#393D49'
  });
  
  //格子主题
  laydate.render({
    elem: '#test31'
    ,theme: 'grid'
  });
  
  
  //直接嵌套显示
  laydate.render({
    elem: '#test-n1'
    ,position: 'static'
  });
  laydate.render({
    elem: '#test-n2'
    ,position: 'static'
    ,lang: 'en'
  });
  laydate.render({
    elem: '#test-n3'
    ,type: 'month'
    ,position: 'static'
  });
  laydate.render({
    elem: '#test-n4'
    ,type: 'time'
    ,position: 'static'
  });
});
</script>

</body>
</html>