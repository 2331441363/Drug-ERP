<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>采购计划基本信息</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
          
<p>&nbsp;</p>
<p>&nbsp;</p>
<h2 align="center"><b>采购计划</b></h2>
<form class="layui-form" action="" onsubmit="return checkForm(this)">
  <p>基本信息</p>
  <table class="layui-table">
  	<tr>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">采购员</label>
   			<div class="layui-input-block">
      			<input name="a" class="layui-input" type="text" autocomplete="off" lay-verify="title">
    		</div>
		</td>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">预计金额</label>
    			<div class="layui-input-block">
      				<input name="a" class="layui-input" type="text" autocomplete="off" lay-verify="title">
    			</div>
    	</td>
    	<td>
    		<label class="layui-form-label" style="font-size:13px;">采购类型</label>
   			<div class="layui-input-block">
      			<select name="interest" lay-filter="aihao">
        			<option value=""></option>
        			<option value="0">写作</option>
      			</select>
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
  			<label class="layui-form-label" style="font-size:13px;">计划制定时间</label>
   			<div class="layui-input-block">
      			<input name="date" class="layui-input" id="date1" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date"/>
    		</div>
  		</td>
  		<td>
  			<label class="layui-form-label" style="font-size:13px;">预计到货时间</label>
      		<div class="layui-input-inline">
       	 	<input name="date" class="layui-input" id="date2" type="text" placeholder="yyyy-MM-dd" autocomplete="off" lay-verify="date"/>
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
  		<td colspan="2">
  			<label class="layui-form-label" style="font-size:13px;">备注</label>
   			<div class="layui-input-block">
      			<input name="title" class="layui-input" type="text" autocomplete="off" lay-verify="title">
    		</div>
  		</td>
  	</tr>
  </table>
  
  <table class="layui-hida" id="test" lay-filter="test"></table>
  <script id="toolbarDemo" type="text/html">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>增行</button>
  </div>
</script>
<script id="barDemo" type="text/html">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
  <div class="layui-input-block" align="center">
      <button class="layui-btn" lay-filter="demo1" lay-submit="">立即提交</button>
  </div>

</form>
 
 
          
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //展示已知数据
  table.render({
    elem: '#test'
    	,toolbar: '#toolbarDemo'
    ,cols: [[ //标题栏
      {field: 'username', title: '材料名称', width: 120,edit: 'text'}
      ,{field: 'email', title: '单位', minWidth: 150,edit: 'text'}
      ,{field: 'sign', title: '规格', minWidth: 160,edit: 'text'}
      ,{field: 'sex', title: '性别', width: 80,edit: 'text'}
      ,{field: 'city', title: '城市', width: 100,edit: 'text'}
      ,{field: 'experience', title: '积分', width: 80,edit: 'text', sort: true}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:80}
    ]]
    ,data: [{
      "username": ""
      ,"email": ""
      ,"sex": ""
      ,"city": ""
      ,"sign": ""
    }]
  });
  table.on('edit(test)', function(obj){
	  console.log(obj.value); //得到修改后的值
	  console.log(obj.field); //当前编辑的字段名
	  console.log(obj.data); //所在行的所有相关数据  
	  
	});
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'add':
        var dataBak = [];   
        var tableBak = table.cache.test; 
        for (var i = 0; i < tableBak.length; i++) {
            dataBak.push(tableBak[i]);      //将之前的数组备份
        }
        dataBak.push({   
            "username": ""
            ,"email": ""
            ,"sex": ""
            ,"city": ""
            ,"sign": ""
        });
        table.reload("test",{
            data:dataBak   // 将新数据重新载入表格
        });
      break;
    };
  });

//监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    //console.log(obj)
    if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    }
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
    elem: '#date1'
  });
  laydate.render({
	    elem: '#date2'
	  });
  
  
 
  
  
});
</script>
<script type="text/javascript">
	function checkForm(frm){
		/* alert(frm.a.value); */
		return false;
	}
</script>
</body>
</html>