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
	.layui-input{
		width:220px;
	}
</style>
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>


	<table class="layui-hide" id="test" lay-filter="test"></table>
	
	<script type="text/html" id="toolbarDemo">
  
<form class="layui-form layui-form-pane" action="" id="searchForm">
  <div class="layui-form-item" style="margin-top:10px;padding-left:20px;margin-bottom:0px;">
    <div class="layui-inline">
      <label class="layui-form-label">搜索员工</label>
      <div class="layui-input-block">
        <input type="text" name="empId" id="empId" autocomplete="off" class="layui-input" style="width:140px;" placeholder="员工ID">
      </div>
    </div>
	<div class="layui-inline">-</div>
    <div class="layui-inline">
      <div class="layui-input-inline">
        <input type="text" name="empUserId" id="empUserId" autocomplete="off" class="layui-input" style="width:200px;" placeholder="员工账号">
      </div>
    </div>
	<div class="layui-inline">-</div>
    <div class="layui-inline">
      <div class="layui-input-inline" style="width:130px;">
        <input type="text" name="empName" id="empName" autocomplete="off" class="layui-input" style="width:140px;" placeholder="员工姓名">
      </div>
    </div>
	<button type="button" class="layui-btn layui-btn-normal" style="margin-top:-5px;height:35px;" lay-event="searchEmployee">搜索</button>
  </div>

</form>
<div class="layui-btn-container" style="padding-left:20px;margin-top:10px;">
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="addEmployee"><i class="layui-icon layui-icon-add-1"></i>新增员工 </button>
  </div>
</script>

<!-- 表格每行工具 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">管理信息</a>
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="del">删除员工</a>
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
			    ,auto: false
			    ,size: 1024 //限制文件大小，单位 KB
			    ,done: function(res){
			      console.log(res)
			    }
			  });
			  var tableIns = table.render({
				elem : '#test',
				url : '../queryEmploye.do',
				toolbar : '#toolbarDemo',
				title : '员工表',
				cols : [ [ {
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'empId',
					title : '员工编号',
					width: '8%',
					align:'center',
					unresize : true
				}, {
					field : 'empName',
					title : '员工姓名',
					align:'center',
					width: '8%',
					unresize : true
				}, {
					field : 'empUserId',
					align:'center',
					title : '员工账号',
					width: '12%',
					unresize : true
				}, {
					field : 'empSex',
					title : '性别',
					align:'center',
					width: '5%',
					unresize : true
				}, {
					field : 'empPhone',
					align:'center',
					title : '手机号码',
					width: '13.7%',
					unresize : true
				}, {
					field : 'empCard',
					align:'center',
					title : '身份证',
					width: '16%',
					unresize : true
				}, {
					field : 'empSalary',
					align:'center',
					title : '薪资',
					width: '10%',
					unresize : true
				}, {
					field : 'departmentName',
					align:'center',
					title : '部门',
					width: '10%',
					unresize : true
				},{
					align : 'center',
					toolbar : '#barDemo',
					title : '操作',
					width:'14%',
					unresize : true
				} ] ],
				page: {
			        limit: 1,//每页显示的条数
			        theme: '#1E9FFF',
			        limits: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50],//每页条数的选择项
			    }
				
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
					layer.confirm('确认删除该员工吗', function(index) {
						
						$.ajax({
						    url:'../deleteEmployee.do',
						    data:'empId='+data.empId,
						    dataType:'html',
						    success:function(data){
						 		if(data == "false"){
						 			layer.msg('删除失败',{icon: 5});
						 		}else{
						 			layer.msg('删除成功',{icon: 6});
		                           
						 		}
						 		
						       
						    }
						})
						
					});
				} else if (obj.event === 'edit') {

					//formTest 即 class="layui-form" 所在元素对应的 lay-filter="" 对应的值
					form.val("formEmployee", {
						"empId" : data.empId ,// "name": "value"
						"empUserId" : data.empUserId,
						"empPassword" : data.empPassword,
						"empName" : data.empName,
						"empAge" : data.empAge,
						"empSex" : data.empSex,
						"empCard" : data.empCard,
						"empPhone" : data.empPhone,
						"empAddress" : data.empAddress,
						"empSalary" : data.empSalary,
						"empPhoto" : data.empPhoto,
						"departmentId" : data.departmentId,
					})
					$("#addTable tr td").css("padding","5px 0px");
					var index = layer.open({
						title : '编辑员工信息',//标题
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
					$("#addTable tr td").css("padding","5px 0px");
					$("#formIdOne")[0].reset();	//清空form
					//加载部门
					$.ajax({
					    url:'../queryDepartment.do',
					    dataType:'json',
					    type:'post',
					    success:function(data){
					        $.each(data,function(index,item){
					            $('#selectId').append(new Option(item.departmentName,item.departmentId));//往下拉菜单里添加元素
					        })
					 
					        form.render();//菜单渲染 把内容加载进去
					    }
					})
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
				case 'searchEmployee':
					tableIns.reload({
						  where: { //设定异步数据接口的额外参数，任意设
						    empId: $("#empId").val()
						    ,empUserId: $("#empUserId").val()
						    ,empName: $("#empName").val()
						  }
						  ,page: {
						    curr: 1 //重新从第 1 页开始
						  }
						});
					break;
				}
				;
			});

		});
	</script>

	<div id="test12" class="demo-tree-more" style="display: none;"></div>

	<div class="site-text" style="margin: 5%;margin-top:10px; display: none" id="branch"
		target="test123">
		<form class="layui-form" lay-filter="formEmployee" id="formIdOne" enctype="multipart/form-data">
		<table id="addTable">
			<tr class="trClass">
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工编号</label></td>
				<td>
						<div class="layui-input-inline">
							<input type="text" name="empId" lay-verify="required" readonly
							placeholder="自动生成" autocomplete="off" class="layui-input" style="width:100px;"> 
						</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工姓名</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empName" lay-verify="required"
						placeholder="真实姓名" autocomplete="off" class="layui-input" style="width:150px;">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工账号</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empUserId" lay-verify="required"
						placeholder="后台登录账号" autocomplete="off"  class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工密码</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empPassword" lay-verify="required" 
						placeholder="员工登录密码" autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">性别</label></td>
				<td>
				<div class="layui-input-inline">
      <input type="radio" name="empSex" value="男" title="男" checked="">
      <input type="radio" name="empSex" value="女" title="女">
    </div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">手机号码</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empPhone" lay-verify="required"
						placeholder="联系号码" autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;" >员工身份证</label></td>
				<td>
				<div class="layui-input-inline">
						<input type="text" name="empCard"  lay-verify="identity" placeholder="居民身份证" 
						autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">现所在地</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empAddress" lay-verify="required"
						placeholder="详细地址" autocomplete="off" class="layui-input">
				</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工月薪</label></td>
				<td>
				<div class="layui-input-inline">
					<input type="text" name="empSalary" lay-verify="required"
						placeholder="薪资（元）" autocomplete="off" class="layui-input">
				</div></td>			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">员工照片</label></td>
				<td>
				<button type="button" class="layui-btn layui-btn-danger" name="empPhoto" id="test7"><i class="layui-icon"></i>上传图片</button>
<div class="layui-inline layui-word-aux">
  *最大只能上传 1MB文件
</div></td>
			</tr>
			<tr>
				<td><label style="margin: 0 10px 0 20px; font-size: 13px;">所属部门</label></td>
				<td>
				<div class="layui-input-inline">
					<select name="departmentId" id="selectId">
        				<option value="" selected="">请选择部门</option>
        				
      				</select>
				</div></td>
			</tr>

		</table>
		</form>
	</div>

</body>
</html>