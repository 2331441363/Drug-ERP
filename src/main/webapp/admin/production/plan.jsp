<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>月生产计划</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
  

</head>
<body>    
	<table class="layui-hide" id="test" lay-filter="test"></table>
	<div id="table2Div" style="margin-top:-9px;">
		<table class="layui-hide" style="display:none" id="test2"  lay-filter="test2"></table>
	</div>
	
	
	<script type="text/html" id="toolbarDemo">
  <div class="layui-inline" style="padding-left:20px;margin-top:10px;">
	  <label width="120px" style="margin:0 0px 0 0px;font-size:13px;">月计划编号</label>
      <div class="layui-input-inline">
        <input type="text" name="planId" id="planId" autocomplete="off" class="layui-input" style="width:200px;" placeholder="输入计划编号">
      </div>
      <label width="120px" style="margin:0 0px 0 20px;font-size:13px;">计划月份</label>
      <div class="layui-input-inline">
        <input type="text" class="layui-input" name="startTime" id="test3" placeholder="yyyy-MM">
      </div>
	  
	<label width="120px" style="margin:0 0px 0 20px;font-size:13px;">审核状态</label>
	<div class="layui-input-inline">
		<select name="auditState" id="auditState" lay-verify="">
  			<option value="">请选择状态</option>
  			<option value="0">等待审核</option>
  			<option value="1">审核通过</option>
 			<option value="2">审核未通过</option>
		</select>  
	</div>
	<button type="button" class="layui-btn layui-btn-normal" lay-event="searchPlan">查询</button>

  </div>

  <div class="layui-btn-container" style="margin-top:20px;padding-left:20px;">
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckData"><i class="layui-icon layui-icon-add-1"></i>制定月计划 </button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckLength"><i class="layui-icon layui-icon-add-1"></i>制定日计划</button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="isAll"><i class="layui-icon layui-icon-friends"></i>审核月计划</button>
  </div>
	
</script>

	<script type="text/html" id="toolbarDemo2">

<form class="layui-form" onSubmit="return false">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px;">
  <legend>添加采购商品</legend>
</fieldset>
	<div class="layui-inline" style="padding-left:0px;margin-left:50px;">
	<label width="120px" style="margin:0 5px 0 0px;font-size:13px;">药品选择</label>
      <div class="layui-input-inline">
        <select name="drugId" id="drugId" lay-verify="required" lay-filter="selectfilter" lay-search="">
          <option value="">选择药品</option>
          <option value="101">阿莫西林</option>
          <option value="102">板蓝根</option>
          <option value="103">肤痒颗粒</option>
          <option value="104">维C</option>
          <option value="105">脑白金</option>
          <option value="106">upload</option>
          <option value="107">laydate</option>
          <option value="108">laypage</option>
          <option value="109">flow</option>
          <option value="110">util</option>
          <option value="111">code</option>
          <option value="112">tree</option>
          <option value="113">layedit</option>
          <option value="114">nav</option>
          <option value="115">tab</option>
          <option value="116">table</option>
          <option value="117">select</option>
          <option value="118">checkbox</option>
          <option value="119">switch</option>
          <option value="200">radio</option>
        </select>
      </div>
	<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">输入生产数量</label>
	<div class="layui-input-inline">
		 <input type="text" name="planDetailQuantity" id="planDetailQuantity" lay-verify="number|required" placeholder="请输入" autocomplete="off" class="layui-input">
	</div>
	<button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="butfile">添加</button>
  </div>
	</form>
</script>


	<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">计划详情</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">修改计划</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="barDemo2" >
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="manageMe">删除</a>
		</script>
	<script>
		layui.use([ 'table', 'laydate','util', 'element','form','layer','layedit'], function() {
			var layer = layui.layer;
			var element = layui.element;
			var util = layui.util;
			var table = layui.table;
			var laydate = layui.laydate;
			var form = layui.form;
			var layedit = layui.layedit;
			 

			
			//常规用法
			laydate.render({
				elem : '#test5'
			});
			//常规用法
			laydate.render({
				elem : '#test1'
			});
			
			
			
			//日期时间范围
			laydate.render({
			   elem: '#test10'
			   ,format: 'yyyy-MM-dd'
			   ,range: true
			});
			var tableIns = table.render({
				elem : '#test',
				url : '../../queryPlan.do',
				toolbar : '#toolbarDemo',
				title : '用户数据表',
				cols : [ [ {
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'planId',
					title : '月计划编号',
					align : 'center',
					unresize : true
				}, {
					field : 'planComment',
					title : '主题',
					align : 'center',
					width:200,
					unresize : true
				}, {
					field : 'empName',
					title : '制定人姓名',
					align : 'center',
					unresize : true
				}, {
					field : 'planTime',
					title : '制定时间',
					align : 'center',
					unresize : true,
					width:150,
					templet:function(d){
						return "<div>"+util.toDateString(d.last_login_time)+"</div>"
					}
					
				}, {
					field : 'startTime',
					title : '计划开始时间',
					width:150,
					align : 'center',
					unresize : true
				}, {
					field : 'endTime',
					title : '计划完成时间',
					width:150,
					align : 'center',
					unresize : true
				}, {
					field : 'plannedQuantity',
					title : '计划完成数量',
					align : 'center',
					unresize : true
				}, {
					field : 'actualQuantity',
					title : '实际完成数量',
					align : 'center',
					unresize : true
				}, {
					field : 'auditState',
					title : '审核状态',
					unresize : true,
					align : 'center'
				}, {
					fixed : 'right',
					width : 200,
					align : 'center',
					toolbar : '#barDemo',
					unresize : true
				} ] ],
				page: {
			        limit: 5,//每页显示的条数
			        theme: '#1E9FFF',
			        limits: [5, 10,20]//每页条数的选择项
			    }
			});
			//年月选择器
			laydate.render({
			   elem: '#test3'
			   ,type: 'month'
			});
			
			//头部工具栏事件
			table.on('toolbar(test)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id);
				switch (obj.event) {
				case 'getCheckData':
					var index = layer.open({
						title : '制定计划详情',//标题
						type : 1,//样式
						shade: 0,
						offset: ['5%', '15%'],//设置位移
						btn: ['确认', '取消'],
						yes: function(index, layero){
							var index2 = layer.confirm('你确认制定该生产计划？', {
								  btn: ['确认', '取消'] //可以无限个按钮
								  ,btn2: function(index, layero){
								    layer.close(index2);
								  }
								}, function(layero){
									
									$("#addTable tr td").css("padding","8px 0px");
									$("#formIdOne")[0].reset();	//清空form表单
									form.render("select"); 
									layer.close(index2);
									var index88 = layer.open({
										  type: 1,
										  shade: 0.25,
										  area: ['500px', '400px'],
										  content: $('#nameAndTimeDiv'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
										  success: function(layero, index){
											//加载员工
											$.ajax({
												url:'../../queryEmployee.do',
												dataType:'json',
												type:'post',
												success:function(data){
												     $.each(data,function(index,item){
												           $('#empIdSelect').append(new Option(item.empName,item.empId));//往下拉菜单里添加元素
												      })
												      form.render();//菜单渲染 把内容加载进去
												    }
												})
											  	layero.addClass('layui-form');//添加form标识
					                            layero.find('.layui-layer-btn0').attr('lay-filter', 'fromContent').attr('lay-submit', '');//将按钮弄成能提交的
					                            form.render(); 
											  },
										  btn: ['确认', '取消'],
										  yes: function(layero){
											  form.on('submit(fromContent)', function (data) {
												  //获取表格中数据
												  var oldData =  table.cache["test2"];
												  var data = {};
												  console.log(deleteEmptyProperty(oldData))
												  var value = $('#formIdOne').serializeArray();
												  $.each(value, function (index, item) {
												              data[item.name] = item.value;
												          });
												  var json = JSON.stringify(data);
												  json=JSON.parse(json);
												  var c = JSON.stringify({'data':oldData,'form':[json]})
												  $.ajax({
													  url:'../../insertPlan.do',
													  contentType: "application/json;charset=UTF-8",
													  data:c,
													  type:'post',
													  dataType:'json',
													  success:function(back){
														  if(back == '1'){
															  layer.close(index);	//关闭计划详情弹出
															  layer.close(index88);	//关闭制定信息弹窗
															  layer.msg('计划制定成功');
															  tableIns.reload();
															  
														  }
													  }
												
												  });
												  
												 
												  
					                            });
											  
											}
										  ,btn2: function(index, layero){
												  layer.close(index88);
											}
									});
									
								});
						}
						,btn2: function(index, layero){
							  layer.close(index);
						},
						area: ['880px', '550px'],
						content :$("#table2Div"),
						end : function() {
							$('[lay-id="test2"]').css("display", "none");
						}
					});
					
					var tableData=new Array(); // 用于存放表格数据
					//请求计划详情
					$.ajax({
						url:"../json/demo2.json",
						type:'get',
				        async:false,
						dataType:'json',
						success:function(back){
							tableData=back;
						}
					})
					table.render({
						elem : '#test2',
						data:tableData,
						toolbar : '#toolbarDemo2',
						cols : [ [  {
							type : 'numbers'
						}, {
							field : 'drugId',
							title : '药品编号',
							unresize : true
						}, {
							field : 'drugName',
							title : '生产药品名称',
							unresize : true
						}, {
							field : 'planDetailQuantity',
							title : '预计生产数量',
							edit: 'text',
							unresize : true
						},{
							fixed : 'right',
							width : 178,
							align : 'center',
							toolbar : '#barDemo2',
							unresize : true
						}
						]]
						,page: {
					        limit: 99999999999,//每页显示的条数
					        layout: ['prev', 'page', 'next','count'], //自定义分页布局
					        theme: '#1E9FFF'
					    }
					});
					
					var delObj;
					//监听行工具事件
					table.on('tool(test2)', function(obj){
						console.log(obj.data.test1)
					    var data = obj.data;
					    if(obj.event === 'manageMe'){
					    	obj.del();
					    	layer.msg('删除成功');
					    }
					})
					var drugId;
					var drugName;
					form.on('select(selectfilter)', function(data){
						  drugId = data.value; //得到被选中的值]
						  drugName = $('[placeholder="选择药品"]').val();
					});
					
					//监听提交
					form.on('submit(butfile)', function(data){
						if(delObj != null){
							delObj.del();
						}
						var planDetailQuantity = $("#planDetailQuantity").val();	//获取预计生产数量
						var oldData =  table.cache["test2"];
						var dataBak = [];   //定义一个空数组,用来存储之前编辑过的数据已经存放新数据
						//获取之前编辑过的全部数据，前提是编辑数据是要更新缓存
						for (var i = 0; i < oldData.length; i++) {
						    dataBak.push(oldData[i]);      //将之前的数组备份
						}
						//在尾部新增一行空数据，实现增行效果
						dataBak.push({   
						    "drugId": drugId
						    ,"drugName": drugName
						    ,"planDetailQuantity": planDetailQuantity
						});
						table.reload("test2",{
						    data:dataBak,  // 将新数据重新载入表格,
						    done: function(res, curr, count){
						    	layer.msg('添加成功');
						    	if(res.data[0].test1 !== undefined){
						    		$('[lay-id="test2"] [data-index="0"]').remove();
						    	}
						    	
						    	 }
						}) 
						
					    return false;
					  });
					
					break;
				case 'getCheckLength':
					var data = checkStatus.data;
					
					if(data.length == 1){
						//判断月计划审核状态
						if(data[0].auditState == '1'){
							var index2 = layer.confirm('你确认为该月计划制定日生产计划？', {
								  btn: ['确认', '取消'] //可以无限个按钮
								  ,btn2: function(index, layero){
								    layer.close(index2);
								  }
								}, function(layero){
									laydate.render();
									$("#formIdOne3")[0].reset();	//清空form表单
									$("#hiddenPlanId2").val(data[0].planId);
									layer.close(index2);
									laydate.render({
										elem : '#dayDate'
									});
							
									var beginDate="";
									var endDate="";
									$.ajax({
										  url:'../../getPlanById.do',
										  type:'post',
										  async : false,
										  data:"planId=" + $("#hiddenPlanId2").val(),
										  dataType:'json',
										  success:function(back){
											  beginDate = util.toDateString(back.startTime).substring(0,10);
											  endDate = util.toDateString(back.endTime).substring(0,10);
										  }
										
									
									  });
									console.log(beginDate);
									console.log(endDate);
									//计划开始日期
								  	laydate.render({
									 	elem : '#dayBeginTime'
										,min: beginDate
										,max: endDate
									   
									});
									 
									$("#addTable tr td").css("padding","8px 0px");
									
									var index88 = layer.open({
										  type: 1,
										  shade: 0.25,
										  area: ['500px', '400px'],
										  content: $('#nameAndTimeDiv3'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
										  success: function(layero, index){
											  form.render();
											  },
										  btn: ['确认', '取消'],
										  yes: function(layero){
											  $.ajax({
												  url:'../../insertDayPlan.do',
												  type:'post',
												  data:$("#formIdOne3").serialize(),
												  dataType:'html',
												  success:function(back){
													  if(back != 'ture'){
														  layer.msg('日计划制定失败');
													  }else{
														  layer.msg('日计划制定成功');
														  tableIns.reload();
													  }
													  layer.close(index);
													  layer.close(index88);
												  }
											
											  });
											  layer.close(index);
											  layer.close(index88);
											}
										  ,btn2: function(index, layero){
												  layer.close(index88);
											}
									});
									
								});
						}else if(data[0].auditState == '0'){
							layer.msg('该月计划未审核,不能制定日计划');
						}else if(data[0].auditState == '2'){
							layer.msg('该月计划审核未通过');
						}
						
					}else if(data.length >1){
						layer.msg('最多只能选择一条月计划');
					}else {
						layer.msg('请选择一条月计划');
					}
					
					break;
				case 'isAll':
					var data = checkStatus.data;
					if(data.length == 1){
						//判断月计划审核状态
						if(data[0].auditState == 0){
							var index2 = layer.confirm('你确认审核该生产计划？', {
								  btn: ['确认', '取消'] //可以无限个按钮
								  ,btn2: function(index, layero){
								    layer.close(index2);
								  }
								}, function(layero){
									layer.close(index2);
									var index88 = layer.open({
										  type: 1,
										  shade: 0.25,
										  area: ['400px', '400px'],
										  content: $('#nameAndTimeDiv2'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
										  success: function(layero, index){
											  form.render();
											  },
										  btn: ['确认', '取消'],
										  yes: function(layero){
											  $("#hiddenPlanId").val(data[0].planId);
											  $.ajax({
												  url:'../../auditPlan.do',
												  type:'post',
												  data:$("#formIdOne2").serialize(),
												  dataType:'html',
												  success:function(back){
													  if(back == 'true'){
														  layer.msg('计划审核成功');
														  tableIns.reload();
														  
													  }else{
														  layer.msg('计划审核失败');
													  }
													  layer.close(index);
													  layer.close(index88);
												  }
											
											  });
											  
											}
										  ,btn2: function(index, layero){
												  layer.close(index88);
											}
									});
									
								});
						}else{
							layer.msg('该月计划已审核');
						}
						
					}else if(data.length >1){
						layer.msg('最多只能审核一条月计划');
					}else {
						layer.msg('请选择一条要审核月计划');
					}
					
					
					break;
					
				case 'searchPlan':
					tableIns.reload({
						  where: { //设定异步数据接口的额外参数，任意设
							  planId: $("#planId").val()
							 ,startTime:$("#test3").val()
						    ,auditState: $("#auditState").val()
						  }
						  ,page: {
						    curr: 1 //重新从第 1 页开始
						  }
						});
                    form.render(); 
					break;
				};
			});
			
			
			
			
			
			//监听工具条
			table.on('tool(test)', function(obj){
			    var data = obj.data;
			    if(obj.event === 'detail'){
			    	layer.open({
						title : '计划详情',//标题
						type : 1,//样式
						shade: 0,
						offset: ['5%', '15%'],//设置位移
						area: ['880px','433px'],
						content :$("#table2Div"),
						success : function(layero) {
							var mask = $(".layui-layer-shade");
							mask.appendTo(layero.parent());
							//其中：layero是弹层的DOM对象
						},
						end : function() {
							$('[lay-id="test2"]').css("display", "none");
						}
					});
			    	table.render({
						elem : '#test2',
						url : '../json/demo1.json',
						totalRow : true,
						cols : [ [  {
							type : 'numbers'
						}, {
							field : 'id',
							title : '药品编号',
							unresize : true
						}, {
							field : 'username',
							title : '药品名称',
							unresize : true
						}, {
							field : 'experience',
							title : '生产数量',
							totalRow : true,
							unresize : true
						}
						]]
					});
					
				} else if(obj.event === 'del'){
			      layer.confirm('确认删除该计划吗？', function(index){
			        obj.del();
			        layer.close(index);
			      });
			    } else if(obj.event === 'edit'){
					if(data.auditState != 0){
						layer.alert('当前订单已审核,无法修改', {icon: 2});
					}else if(data.auditState == 0){
						var index = layer.open({
							title : '修改计划详情',//标题
							type : 1,//样式
							shade: 0,
							offset: ['5%', '15%'],//设置位移
							btn: ['确认', '取消'],
							yes: function(index, layero){
								layer.confirm('确定修改该计划？', function(index){
									layer.close(index);
									alert("好的已修改");
							    });
							}
							,btn2: function(index, layero){
								  layer.close(index);
							},
							area: ['880px', '550px'],
							content :$("#table2Div"),
							success : function(layero) {
								var mask = $(".layui-layer-shade");
								mask.appendTo(layero.parent());
								//其中：layero是弹层的DOM对象
							},
							end : function() {
								$('[lay-id="test2"]').css("display", "none");
							}
						});
						table.render({
							elem : '#test2',
							url : '../json/demo1.json',
							toolbar : '#toolbarDemo2',
							totalRow : true,
							cols : [ [  {
								type : 'numbers'
							}, {
								field : 'id',
								title : '药品编号',
								unresize : true
							}, {
								field : 'username',
								title : '药品名称',
								edit: 'text',
								unresize : true
							}, {
								field : 'experience',
								title : '生产数量',
								totalRow : true,
								edit: 'text',
								unresize : true
							}, {
								align : 'center',
								toolbar : '#barDemo2',
								unresize : true
							}
							]]
						});
						
					}
			    }
			  });
		});
		
		//日期显示
		function deleteEmptyProperty(obj){
		    var object = obj;
		    for (var i in object) {
		        var value = object[i];
		        if (typeof value === 'object') {
		            if (Array.isArray(value)) {
		                if (value.length == 0) {
		                    delete object[i];
		                    continue;
		                }
		            }
		            this.deleteEmptyProperty(value);
		        } else {
		            if (value === '' || value === null || value === undefined) {
		                delete object[i];
		            }
		        }
		    }
		    return object;
		}
	</script>
	
	<!-- 月生产计划制定信息 -->
<div style="display:none;" id="nameAndTimeDiv" >

<form class="layui-form" lay-filter="formAuthority" id="formIdOne">	  
	<table id="addTable" style="margin-left:15px;margin-top:10px;">
			<tr class="trClass">
				<td><label width="120px" style="margin:0 5px 0 20px;font-size:13px;">制定日期</label></td>
				<td>
						<div class="layui-input-inline">
							<input type="text" class="layui-input" id="test1" name="planTime" placeholder="yyyy-MM-dd">
						</div></td>
			</tr>
			
			<tr class="trClass">
				<td><label width="120px" style="margin:0 5px 0 20px;font-size:13px;">制定人员</label></td>
				<td>
						<div class="layui-input-inline">
								<select name="empId" lay-verify="" id="empIdSelect" lay-search="">
  									<option value="">制定人</option>
  									
								</select>  
						</div></td>
			</tr>
			<tr class="trClass">
				<td><label style="margin:0 10px 0 20px;font-size:13px;">计划开始-结束时间</label></td>
				<td>
						<div class="layui-input-inline">
       				 		<input type="text" class="layui-input" id="test10" name="time" placeholder="begin - end">
      					</div></td>
			</tr>
			<tr class="trClass">
				<td><label style="margin:0 10px 0 20px;font-size:13px;">计划描述</label></td>
				<td>
						<div class="layui-input-inline">
      						<textarea name="planComment" lay-verify="required" cols="35px" rows="4px" placeholder="请输入计划描述" class="layui-textarea"></textarea>
						</div></td>
			</tr>
	</table>
</form>
 </div>	
 
 <!-- 日生产计划制定信息 -->
<div style="display:none;" id="nameAndTimeDiv3" >

<form class="layui-form" lay-filter="formAuthority3" id="formIdOne3">	  
<input type="hidden" name="planId" id="hiddenPlanId2" />
	<table id="addTable" style="margin-left:15px;margin-top:10px;">
			<tr class="trClass">
				<td><label width="120px" style="margin:0 5px 0 20px;font-size:13px;">制定日期</label></td>
				<td>
						<div class="layui-input-inline">
							<input type="text" class="layui-input" id="dayDate" name="dayPlanTime" placeholder="yyyy-MM-dd">
						</div></td>
			</tr>
			
			<tr class="trClass">
				<td><label width="120px" style="margin:0 5px 0 20px;font-size:13px;">制定人员</label></td>
				<td>
						<div class="layui-input-inline">
								<select name="empId" id="empIdSelect2" lay-verify="" lay-search="">
  									<option value="">制定人</option>

								</select>  
						</div></td>
			</tr>
			<tr class="trClass">
				<td><label style="margin:0 10px 0 20px;font-size:13px;">计划生产日期</label></td>
				<td>
						<div class="layui-input-inline">
       				 		<input type="text" class="layui-input" id="dayBeginTime" name=dayBeginTime placeholder="begin2">
      					</div></td>
			</tr>
			<tr class="trClass">
				<td><label style="margin:0 10px 0 20px;font-size:13px;">计划描述</label></td>
				<td>
						<div class="layui-input-inline">
      						<textarea name="dayPlanComment" lay-verify="required" cols="35px" rows="4px" placeholder="请输入计划描述" class="layui-textarea"></textarea>
						</div></td>
			</tr>
	</table>
</form>
 </div>	
 
 	<!-- 审核人和审核时间 -->
<div style="display:none;" id="nameAndTimeDiv2" >

<form class="layui-form" lay-filter="formAuthority2" id="formIdOne2">	  
<input type="hidden" name="planId" id="hiddenPlanId" />
<div style="padding-left:0px;margin-top:20px;">
<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">审核状态</label>
	<div class="layui-input-inline">
		<select name="auditState" lay-verify="required" lay-search="">
  			<option value="">状态选择</option>
  			<option value="1">审核通过</option>
  			<option value="2">审核未通过</option>
		</select>  
	</div>
<div class="layui-inline" style="padding-left:0px;margin-top:15px;">
	<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">审核日期</label>
	<div class="layui-input-inline">
		<input type="text" lay-verify="required" name="auditTime" class="layui-input"  id="test5" placeholder="yyyy-MM-dd">
	</div>
</div>
<div style="padding-left:0px;margin-top:15px;">
<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">审核人员</label>
	<div class="layui-input-inline">
		<select name="auditId" lay-verify="required" lay-search="">
  			<option value="">审核人</option>
  			<option value="100">张三</option>
  			<option value="101">李四</option>
 			<option value="100">王五</option>
		</select>  
	</div>
<div class="layui-input-inline" style="margin-top:10px;">
				<label style="margin:0 10px 0 20px;font-size:13px;">备注信息</label>
				<div class="layui-input-inline" style="margin-left:-5px;">
      				<textarea  lay-verify="required" cols="35px" name="auditComment" rows="4px" placeholder="请输入计划描述" class="layui-textarea"></textarea>
    			</div>
			</div>	
</div>
</form>
 </div>	
	</body>
	</html>
