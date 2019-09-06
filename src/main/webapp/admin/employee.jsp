<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>员工管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<style>

</style>
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>


	<table class="layui-hide" id="test" lay-filter="test"></table>
	
	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container" style="padding-left:20px;">
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="addEmployee"><i class="layui-icon layui-icon-add-1"></i>新增员工 </button>
  </div>
</script>

<!-- 表格每行工具 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">管理信息</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除员工</a>
</script>

	<script>
		layui.use([ 'table', 'laydate', 'form','upload'], function() {
			var $ = layui.jquery
			,upload = layui.upload;
			var table = layui.table;
			var laydate = layui.laydate;
			var form = layui.form;
			
			  //设定文件大小限制
			  upload.render({
			    elem: '#test7'
			    ,url: '/upload/'
			    ,size: 1024 //限制文件大小，单位 KB
			    ,done: function(res){
			      console.log(res)
			    }
			  });
			table.render({
				elem : '#test',
				url : 'json/demo1.json',
				toolbar : '#toolbarDemo',
				title : '领料单',
				cols : [ [ {
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'id',
					title : '部门编号',
					unresize : true
				}, {
					field : 'username',
					title : '部门名称',
					unresize : true
				}, {
					field : 'sex',
					title : '描述',
					unresize : true
				}, {
					fixed : 'right',
					align : 'center',
					toolbar : '#barDemo',
					unresize : true
				} ] ],
				page : true
			});

			//监听表格每行工具条
			table.on('tool(test)', function(obj) {
				var data = obj.data;
				if (obj.event === 'detail') {
					layer.open({
						title : '权限管理',//标题
						type : 1,//样式
						shade : 0,
						area : [ '350px', '500px' ],
						content : $("#test12"),

						success : function(layero) {
							var mask = $(".layui-layer-shade");
							mask.appendTo(layero.parent());
							//其中：layero是弹层的DOM对象
						},
						end : function() {

						}
					});
				} else if (obj.event === 'del') {
					layer.confirm('确认删除该部门吗', function(index) {
						obj.del();
						layer.close(index);
					});
				} else if (obj.event === 'edit') {

					//formTest 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
					form.val("formAuthority", {
						"id" : "21321321" // "name": "value"
						,
						"name" : "销售部门",
						"des" : "我爱layui"
					})

					var index = layer.open({
						title : '编辑部门',//标题
						type : 1,//样式
						shade : 0,
						offset : [ '2%', '30%' ],//设置位移
						 area: ['450px', '550px'],
						btn : [ '确认', '取消' ],
						yes : function(index, layero) {
							layer.close(index);
							layer.msg('编辑成功');
						},
						btn2 : function(index, layero) {
							layer.close(index);
						},
						content : $("#branch"),
					});
				}
			});

			//表格头部工具栏事件
			table.on('toolbar(test)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id);
				switch (obj.event) {
				case 'addEmployee':	//新增员工
					$("#addTable tr td").css("padding","8px 0px");
					$("#formIdOne")[0].reset();
					var index = layer.open({
						title : '新增部门',//标题
						type : 1,//样式
						shade : 0,
						offset : [ '2%', '30%' ],//设置位移
						 area: ['450px', '550px'],
						btn : [ '确认', '取消' ],
						yes : function(index, layero) {
							layer.close(index);
							layer.msg('新增成功');
						},
						btn2 : function(index, layero) {
							layer.close(index);
						},

						content : $("#branch"),
					});
					break;
				}
				;
			});

		});
	</script>

	<div id="test12" class="demo-tree-more" style="display: none;"></div>

	<div class="site-text" style="margin: 5%; display: none" id="branch"
		target="test123">
		<form class="layui-form" lay-filter="formAuthority" id="formIdOne">
		<table id="addTable">
			<tr class="trClass">
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工编号</label></td>
				<td>
						<div class="layui-input-inline">
							<input type="text" name="empId" lay-verify="required" disabled
							placeholder="自动生成" autocomplete="off" class="layui-input">
						</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工登录账号</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empUserId" lay-verify="required"
						placeholder="请输入员工后台用户名" autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工账号密码</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empPassword" lay-verify="required"
						placeholder="请输入员工后台密码" autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工姓名</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empPassword" lay-verify="required"
						placeholder="请输入员工姓名" autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">性别</label></td>
				<td>
				<div class="layui-input-inline">
      <input type="radio" name="sex" value="男" title="男" checked="">
      <input type="radio" name="sex" value="女" title="女">
    </div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">手机号码</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empPassword" lay-verify="required"
						placeholder="请输入员工姓名" autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工身份证</label></td>
				<td>
				<div class="layui-input-inline">
						<input type="text" name="identity"  lay-verify="identity" placeholder="" autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">现所在地</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empPassword" lay-verify="required"
						placeholder="请输入员工姓名" autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工月薪</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empPassword" lay-verify="required"
						placeholder="请输入员工姓名" autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工照片</label></td>
				<td>
				<button type="button" class="layui-btn layui-btn-danger" id="test7"><i class="layui-icon"></i>上传图片</button>
<div class="layui-inline layui-word-aux">
  *最大照片显示 1MB
</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">选择所在部门</label></td>
				<td>
				<div class="layui-input-inline">
					<select name="departmentId">
        <option value="">请选择部门</option>
        <option value="浙江" selected="">浙江省</option>
        <option value="你的工号">江西省</option>
        <option value="你最喜欢的老师">福建省</option>
      </select>
				</div></td>
			</tr>

		</table>
		</form>
	</div>

</body>
</html>