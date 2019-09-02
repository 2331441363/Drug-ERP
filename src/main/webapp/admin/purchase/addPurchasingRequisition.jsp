<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>采购申请</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<p>&nbsp;</p>
<p>&nbsp;</p>
<h2 align="center"><b>采购申请</b></h2>
<form class="layui-form" action="" onsubmit="return checkForm(this)">
  <p>基本信息</p>
  <table class="layui-table">
  	<tr>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">主题</label>
   			<div class="layui-input-block">
      			<input name="a" class="layui-input" type="text" autocomplete="off" lay-verify="title">
    		</div>
		</td>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">采购类别</label>
    			<div class="layui-input-block">
      				<select name="interest" lay-filter="aihao">
        				<option value=""></option>
        				<option value="0">写作</option>
      				</select>
    			</div>
    	</td>
    	<td>
    		<label class="layui-form-label" style="font-size:13px;">申请人</label>
   			<div class="layui-input-block">
      			<input name="title" class="layui-input" type="text" autocomplete="off" lay-verify="title">
    		</div>
    	</td>
  	</tr>
  	<tr>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">申请部门</label>
   			<div class="layui-input-block">
      			<select name="interest" lay-filter="aihao">
        			<option value=""></option>
        			<option value="0">写作</option>
      			</select>
    		</div>
  		</td>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">申请原因</label>
   			<div class="layui-input-block">
      			<input name="title" class="layui-input" type="text" autocomplete="off" lay-verify="title">
    		</div>
  		</td>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">申请日期</label>
      		<div class="layui-input-block">
      			<input name="date" class="layui-input" id="date" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date"/>
    		</div>
  		</td>
  	</tr>
  	<tr>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">仓库地址</label>
   			<div class="layui-input-block">
      			<input name="title" class="layui-input" type="text" autocomplete="off" lay-verify="title">
    		</div>
  		</td>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">备注</label>
   			<div class="layui-input-block">
      			<input name="title" class="layui-input" type="text" autocomplete="off" lay-verify="title">
    		</div>
  		</td>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">需要日期</label>
   			<div class="layui-input-block">
      			<input name="date" class="layui-input" id="date" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date"/>
    		</div>
  		</td>
  	</tr>
  </table>
  <p>采购申请明细</p>
  <table class="layui-hide" id="test" lay-filter="test"></table>
  <script id="toolbarDemo" type="text/html">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>增行</button>
  </div>
</script>
  <div class="layui-input-block" align="center">
      <button class="layui-btn" lay-filter="demo1" lay-submit="">立即提交</button>
  </div>

</form>
 
 
          
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //展示已知数据
  table.render({
    elem: '#test'
    ,cols: [[ //标题栏
      {field: 'username', title: '物品编号', width: 120,edit: 'text'}
      ,{field: 'email', title: '物品名称', minWidth: 150,edit: 'text'}
      ,{field: 'sign', title: '基本单位', minWidth: 120,edit: 'text'}
      ,{field: 'sex', title: '申请数量', width: 120,edit: 'text'}
    ]]
    ,data: [{
      "username": ""
      ,"email": ""
      ,"sex": ""
      ,"city": ""
    }]
  });
  table.on('edit(test)', function(obj){
	  console.log(obj.value); //得到修改后的值
	  console.log(obj.field); //当前编辑的字段名
	  console.log(obj.data); //所在行的所有相关数据  
	  
	});
 /*  var dataBak = []; 
  var tableBak = table.cache.test;
  for (var i = 0; i < tableBak.length; i++) {
	    dataBak.push(tableBak[i]);      //将之前的数组备份
	}
  dataBak.push({   
	    "stockInCargo": ""
	    ,"stockInNum": ""
	    ,"stockInPrice": ""
	    ,"stockCargoTime": ""
	    ,"stockInCompany": ""
	});
  table.reload("test",{
	    data:dataBak   // 将新数据重新载入表格
	}); */

  table.on('toolbar(test)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id);
	    switch(obj.event){
	      case 'add':
	        alert("zz");
	      break;

	    };
	  });

});
	

</script>

<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });

  
  
 
  
  
});
</script>
<script type="text/javascript">
	function checkForm(frm){
		alert(frm.a.value);
		return false;
	}
</script>
</body>
</html>