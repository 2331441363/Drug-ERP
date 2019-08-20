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
<form class="layui-form" action="" style="margin-top: 15px;">
			<div class="layui-inline" >
					<label class="layui-form-label" >付款日期:</label>
				<div class="layui-input-inline" >
					<input type="text"  class="layui-input" id="test5" 
					autocomplete="off"	placeholder="年--月--日 ">
				</div>
			</div>
	
  <div class="layui-inline">
      <label class="layui-form-label">付款人：</label>
      <div class="layui-input-inline">
        <select name="audit" lay-verify="required" lay-search="required">
          <option value="1">请选择</option>
          <option value="2">王五</option>
        </select>
      </div>
    </div>

 <div class="layui-inline">
      <label class="layui-form-label">部门：</label>
      <div class="layui-input-inline">
        <select name="audit" lay-verify="required" lay-search="required">
          <option value="1">请选择</option>
          <option value="2">财务部</option>
        </select>
      </div>
    </div>
    
    <div class="layui-inline" style="margin-top: 15px;">
      <label class="layui-form-label">供应商：</label>
      <div class="layui-input-inline">
        <select name="audit" lay-verify="required" lay-search="required">
          <option value="1">请选择</option>
          <option value="2">王五</option>
        </select>
      </div>
    </div>

			<div class="layui-inline" style="margin-top: 15px;">
				<label class="layui-form-label" >公司账户：</label>
				<div class="layui-input-inline" >
					<select name="audit" lay-verify="required" lay-search="required" id="compAccount">
						<option>请选择</option>
						<option>xx</option>
					</select>
				</div>
			</div>

			<div class="layui-inline" style="margin-top: 15px;">
				<label class="layui-form-label" >付款金额：</label>
				<div class="layui-input-inline"  >
					<input  type="text" name="username"  lay-verify="required"
						lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-inline" style="margin-top: 15px;">
				<label class="layui-form-label" >金额大写：</label>
				<div class="layui-input-inline" >
					<input  type="text" name="username"  lay-verify="required"
						lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-inline" style="margin-top: 15px;">
				<label class="layui-form-label" >付款类型：</label>
				<div class="layui-input-inline" >
					<select   id="payType">
						<option>请选择</option>
						<option>采购付款</option>
						<option>分店退货</option>
					</select>
				</div>
			</div>
</div>

			<div  class="layui-inline"  style="margin-top: 15px;">
				<label class="layui-form-label" >付款方式：</label>
				<div class="layui-input-inline"  >
					<select  id="payMethod">
						<option>请选择</option>
						<option>现金</option>
						<option>网银</option>
						<option>支付宝</option>
						<option>刷卡</option>
					</select>
				</div>
			</div>


			<div  class="layui-inline"  style="margin-top: 15px;">
			
				<label class="layui-form-label">项目：</label>
				<div class="layui-input-inline" >
					<input  type="text" name="username"   lay-verify="required"
						lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item layui-form-text" style="margin-top: 15px;">
    <label class="layui-form-label">备注：</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
			<div class="layui-form-item" style="margin-top: 40px;margin-left: 650px;">
				<button class="layui-btn" lay-submit="" lay-filter="demo2" >确定</button>
			</div>
			</div>
	</form>

	<script>
layui.use(['form'], function(){
  var form = layui.form
});
</script>
