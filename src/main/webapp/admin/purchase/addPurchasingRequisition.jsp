<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>采购申请</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
  <script src="<%=request.getContextPath()%>/layui/layui.js" charset="utf-8"></script>
</head>
<body>

<p>&nbsp;</p>
<p>&nbsp;</p>
<h2 align="center"><b>采购申请</b></h2>
<form class="layui-form" action="../../addPurchaseEmployee.do" method="post" id="demo1">
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
  			<label class="layui-form-label" style="font-size:13px;">预计金额：</label>
    			<div class="layui-input-block">
      				<input name="purchaseAmount" id="purchaseAmount" class="layui-input" type="text" autocomplete="off" lay-verify="required">
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
  laydate.render({
    elem: '#date1'
  });
  
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
 
  
});
</script>

</body>
</html>