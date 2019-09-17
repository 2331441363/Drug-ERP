<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>菜单</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
  <script src="../layui/layui.js"></script>
  <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>          
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>    
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">

 
<div class="layui-input-inline">
  <div class="layui-btn-container" style="margin-top:10px;padding-left:20px;">
	<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckData"><i class="layui-icon layui-icon-friends"></i>审核日计划 </button>
    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="getCheckLength"><i class="layui-icon layui-icon-add-1"></i>制定生产订单</button>
  </div>


</div>
<div class="layui-input-inline" style="margin-top:10px;">
<label width="120px" style="margin:0 5px 0 20px;font-size:13px;">状态查询</label>
	<div class="layui-input-inline">
		<select name="auditState" lay-filter="stateSelect" lay-verify="">
  			<option value="">审核状态</option>
  			<option value="0" >等待审核</option>
  			<option value="1">审核通过</option>
 			<option value="2">审核未通过</option>
		</select>  
	</div>
</div>
	
</script>


<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
layui.use(['table','laydate','form','layer'], function(){
  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
  var table = layui.table;
  var laydate = layui.laydate;
  var form = layui.form;
  $(function(){
	  laydate.render({
			elem : '#dayDate'
		});
  });
  //常规用法
  laydate.render({
    elem: '#test1'
  });

  //年月选择器
  laydate.render({
    elem: '#test3'
    ,type: 'month'
  });

//常规用法
	laydate.render({
		elem : '#test5'
	});
  var tableIns = table.render({
    elem: '#test'
    ,url:'../../getAllDayPlan.do'
    ,toolbar: '#toolbarDemo'
    ,title: '日生产计划'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'dayPlanId', title:'日生产计划编号', unresize:true}
      ,{field:'planId', title:'月生产计划编号',unresize:true}
      ,{field:'empName', title:'负责人',unresize:true}
      ,{field:'dayPlanTime', title:'制定日期', unresize:true}
      ,{field:'dayBeginTime', title:'计划生产日期', unresize:true}
      ,{field:'dayPlannedQuantity', title:'计划生产总数', unresize:true}
      ,{field:'dayDetailNumber', title:'已生产总数', unresize:true}
      ,{field:'auditState', title:'审核状态', unresize:true}
      ,{
		fixed: 'right', width:178, align:'center', toolbar: '#barDemo',unresize:true
      }
    ]]
    ,page: {
        limit: 5,//每页显示的条数
        theme: '#1E9FFF',
        limits: [5, 10, 20]//每页条数的选择项
    }
  });
  
  form.on('select(stateSelect)', function(data){
	  tableIns.reload({
		  where: { //设定异步数据接口的额外参数，任意设
			  auditState: data.value
		  }
		  ,page: {
		    curr: 1 //重新从第 1 页开始
		  }
		});
    form.render(); 
  });      
  
  //工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    var data = checkStatus.data;
    switch(obj.event){
      case 'getCheckData':	//审核日计划
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
								  content: $('#nameAndTimeDiv2').html(), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
								  success: function(layero, index){
									  form.render();
									  
									  },
								  btn: ['确认', '取消'],
								  yes: function(layero){
									  
									  $("#hiddenPlanId").val(data[0].dayPlanId);
									  $.ajax({
										  url:'../../auditDayPlan.do',
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
					layer.msg('该日计划已审核');
				}
				
			}else if(data.length >1){
				layer.msg('最多只能审核一条日计划');
			}else {
				layer.msg('请选择一条要审核日计划');
			}
      break;
      case 'getCheckLength':	//制定生产订单
    	  if(data.length == 1){
				//判断日计划审核状态
				if(data[0].auditState == 1){
					 var index2 = layer.confirm('你确认为该计划制定生产订单？', {
						  btn: ['确认', '取消'] //可以无限个按钮
						  ,btn2: function(index, layero){
						    layer.close(index2);
						  }
						}, function(layero){
							$("#formIdOne3")[0].reset();	//清空form表单
							$("#hiddenPlanId2").val(data[0].dayPlanId);
							$("#addTable tr td").css("padding","8px 0px");
							 
							layer.close(index2);
							var index88 = layer.open({
								  type: 1,
								  shade: 0.25,
								  area: ['500px', '400px'],
								  content: $('#nameAndTimeDiv3'), //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
								  success: function(layero, index){
									  var mask = $(".layui-layer-shade");
									  mask.appendTo(layero.parent());
									   //其中：layero是弹层的DOM对象

									  form.render();
									  },
								  btn: ['确认', '取消'],
								  yes: function(layero){
									  $.ajax({
										  url:'../../insertOrderPlan.do',
										  type:'post',
										  data:$("#formIdOne3").serialize(),
										  dataType:'html',
										  success:function(back){
											  if(back != 'ture'){
												  layer.msg('生产订单制定失败');
											  }else{
												  layer.msg('生产订单制定成功');
												  tableIns.reload();
											  }
											  layer.close(index88);
										  }
									
									  });
									  layer.close(index88);
								 }
								 ,btn2: function(index, layero){
										  layer.close(index88);
								  }
							});
							
							
						});
				}else if(data[0].auditState == 0){
					layer.msg('该日计划未审核');
				}else if(data[0].auditState == 2){
					layer.msg('该日计划审核未通过');
				}
				
			}else if(data.length >1){
				layer.msg('一次最多只能制定一条日计划');
			}else {
				layer.msg('请选择要制定订单的日计划');
			}
    	 
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
  		  area : [ '700px', '460px' ],//大小
  		  content: $("#dibId"),
  		  end : function() {
					$('[lay-id="test2"]').css("display", "none");
			  }
  		});
  	  
  	  table.render({
		    elem: '#test2'
		    ,url:'../json/demo1.json'
		    ,totalRow: true
		    ,cols: [[
		      {type: 'numbers',totalRowText: '合计'}
		      ,{field:'id', title:'药品编号', unresize:true}
		      ,{field:'username', title:'药品名称',unresize:true}
		      ,{field:'experience', title:'日生产数量', totalRow: true,unresize:true}
		      
		    ]]
		});    
  	} else if(obj.event === 'del'){
      layer.confirm('确认删除该计划？', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
    	layer.open({
    		  title: '修改日计划',
    		  type:1,
    		  shadeClose : true,
    		  area : [ '700px', '460px' ],//大小
    		  content: $("#dibId"),
    		  end : function() {
  					$('[lay-id="test2"]').css("display", "none");
  			  }
    		});
    	
    	 table.render({
 		    elem: '#test2'
 		    ,url:'../json/demo1.json'
 		    ,totalRow: true
 		    ,cols: [[
 		      {type: 'numbers',totalRowText: '合计'}
 		      ,{field:'id', title:'药品编号', unresize:true}
 		      ,{field:'username', title:'药品名称',unresize:true}
 		      ,{field:'experience', title:'日生产数量', totalRow: true,unresize:true,edit:'text'}
 		      
 		    ]]
 		});   
    }
  });
});
</script>



 

 <!-- 生产订单制定信息 -->
<div style="display:none;" id="nameAndTimeDiv3" >

<form class="layui-form" lay-filter="formAuthority3" id="formIdOne3">	  
<input type="hidden" name="dayPlanId" id="hiddenPlanId2" />
	<table id="addTable" style="margin-left:15px;margin-top:10px;">
			<tr class="trClass">
				<td><label width="120px" style="margin:0 5px 0 20px;font-size:13px;">制定日期</label></td>
				<td>
						<div class="layui-input-inline">
							<input type="text" class="layui-input" id="dayDate" name="orderPlanTime" placeholder="yyyy-MM-dd">
						</div></td>
			</tr>
			
			<tr class="trClass">
				<td><label width="120px" style="margin:0 5px 0 20px;font-size:13px;">制定人员</label></td>
				<td>
						<div class="layui-input-inline">
								<select name="empId" lay-verify="" lay-search="">
  									<option value="">制定人</option>
  									<option value="100">张三</option>
  									<option value="101">李四</option>
 									<option value="100">王五</option>
								</select>  
						</div></td>
			</tr>
			<tr class="trClass">
				<td><label style="margin:0 10px 0 20px;font-size:13px;">订单备注</label></td>
				<td>
						<div class="layui-input-inline">
      						<textarea name="orderComment" lay-verify="required" cols="35px" rows="4px" placeholder="请输入订单描述" class="layui-textarea"></textarea>
						</div></td>
			</tr>
	</table>
</form>
 </div>	

<!-- 审核人和审核时间 -->
<div style="display:none;" id="nameAndTimeDiv2" >

<form class="layui-form" lay-filter="formAuthority2" id="formIdOne2">	  
<input type="hidden" name="dayPlanId" id="hiddenPlanId" />
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
