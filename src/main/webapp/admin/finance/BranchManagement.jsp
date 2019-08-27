<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>分店信息管理</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
 <link rel="stylesheet" href="../layui/css/layui.css" media="all">
  <script src="../layui/layui.js"></script>
   <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" >
var cityList = new Array();
cityList['北京市'] = ['朝阳区', '东城区', '西城区', '海淀区', '宣武区', '丰台区', '怀柔', '延庆', '房山'];
cityList['上海市'] = ['宝山区', '长宁区', '丰贤区', '虹口区', '黄浦区', '青浦区', '南汇区', '徐汇区', '卢湾区'];
cityList['广州省'] = ['广州市', '惠州市', '汕头市', '珠海市', '佛山市', '中山市', '东莞市'];
cityList['深圳市'] = ['福田区', '罗湖区', '盐田区', '宝安区', '龙岗区', '南山区', '深圳周边'];
cityList['重庆市'] = ['俞中区', '南岸区', '江北区', '沙坪坝区', '九龙坡区', '渝北区', '大渡口区', '北碚区'];
cityList['天津市'] = ['和平区', '河西区', '南开区', '河北区', '河东区', '红桥区', '塘古区', '开发区'];
cityList['江苏省'] = ['南京市', '苏州市', '无锡市'];
cityList['浙江省'] = ['杭州市', '宁波市', '温州市'];
cityList['四川省'] = [ '成都市','广元市'];
cityList['海南省'] = ['海口市','文昌市'];
cityList['福建省'] = ['福州市', '厦门市', '泉州市', '漳州市'];
cityList['山东省'] = ['济南市', '青岛市', '烟台市'];
cityList['江西省'] = [ '南昌市','九江市','乐平市'];
cityList['广西省'] = ['柳州市', '南宁市'];
cityList['安徽省'] = [ '合肥市','淮北市','安庆市'];
cityList['河北省'] = ['邯郸市', '石家庄市','唐山市'];
cityList['河南省'] = ['郑州市', '洛阳市','开封市'];
cityList['湖北省'] = ['武汉市', '宜昌市','当阳市'];
cityList['湖南省'] = [ '长沙市','娄底市','株洲市','常德市','张家界','怀化市','涟源市'];
cityList['陕西省'] = [ '西安市','延安市','兴平市'];
cityList['山西省'] = [ '太原市','大同市','阳泉市','晋中市'];
cityList['黑龙江省'] = [ '哈尔滨市','齐齐哈尔市','大庆市'];

function allProvince(){

	var pro = document.getElementById("province123");
	for (var i in cityList){
		pro.add(new Option(i,i,null));
	}
	
}

window.onload = allProvince;
//注册table，form
layui.use(['table','form','laydate'], function(){
  var table = layui.table;
  var form = layui.form;
 var laydate = layui.laydate;
  
  //常规用法
  laydate.render({
    elem: '#test2'
  });
  table.render({
    elem: '#test',//table Id
    url:'add1.do',//路劲
    toolbar: '#toolbarDemo',
    title: '采购订单',//标题
    limits: [5, 10, 15], //设置每页显示数
    cols: [[
    	{type: 'checkbox', fixed: 'left'},
        {field:'stuId', title:'分店编号', fixed: 'left', unresize: true},
        {field:'thId', title:'分店名称', },
        {field:'stuName', title:'分店地址',edit: 'text', },
        {field:'stuName', title:'签订时间'},
        {field:'stuName', title:'合同状态'},
    ]]
    ,page: true //启动分页
  });
  
   //单元格编辑事件
  table.on('edit(test)', function(obj){ //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"
      //console.log(obj.value); //得到修改后的值
      //console.log(obj.field); //当前编辑的字段名
      var date = obj.data; //所在行的所有相关数据  
      
    });
          
  
	//下拉框改变事件
  form.on('select(cs)', function(data){
			// 获得省份框中的值 
			var pros = document.getElementById("province123").value;
			var city = document.getElementById("city123");	
			// 将city 列表中的值清空,放置再选择省份后,出现城市乱增加的情况
			city.options.length=0;
			// 遍历
			for (var i in cityList){
				if (i==pros){
					for (var j in cityList[i]){								
						// 将 Option标签添加到Select中
						city.add(new Option(cityList[i][j],cityList[i][j]),null);									
					}
				}
			}	
			form.render();
  });      
        
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
    case 'getSearch':
    	var time1= $("#test2").val();
    		 table.reload('test', {
      			  where: {time:time1} 
      			});
    		 laydate.render({
    			    elem: '#test2'
    			  });
      break;
      case 'getCheckData':
        var data = checkStatus.data;
        if(JSON.stringify(data)=="[]"){
        	layer.msg("请选择审核的行");
        }else if(data.length>1){
        	layer.msg("一次只能审核一条");
        } else{
        	 $("#hid").val(data[0].stuId);
             layer.open({
                 title:'审核',//标题
                 type:1,//样式
                 area:['400px','240px'],//大小
                 content:$("#form2"),
             });
        }
      break;
      case 'audit':
    	 
               layer.open({
                   title:'新增分店',//标题
                   type:1,//样式
                   area:['auto','480px'],//大小
                   content:$("#form2"),
               });
               form.render();
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选');
      break;
    };
  });
  
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
	  //得到选择的行的信息
    var data = obj.data;
	  //判断是否选中删除
    if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
    	  $.ajax({
				url:'deleteStu.do',
				data:'id='+data.stuId,
				success:function(back){
					//关闭弹出框
					layer.close(index);
					//刷新表格数据
					$(".layui-laypage-btn")[0].click()
				}
			})    
      });
      //入库
    } else if(obj.event === 'putin'){
    	
    }
  });
  
  
  
});

</script>
</head>
      <table class="layui-hide" id="test1" lay-filter="test"></table>
<table class="layui-hide" id="test" lay-filter="test"></table>



<script type="text/html" id="toolbarDemo">
<div class="layui-input-inline">
 <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="audit">新增</button>
      </div>
</script>	
 
<script type="text/html" id="barDemo"> 
</script>
     
<form class="layui-form" lay-filter="example" id="form2" style="display:none;align-content:center;" >
          
           
          <div class="layui-form-item">
    <label class="layui-form-label">分店名称</label>
    <div class="layui-input-inline">
      <input type="text" name="username" lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">请选择地区</label>
    <div class="layui-input-inline">
     <select  id="province123"  onchange="changeCity()" lay-filter="cs">
        <option>请选择省/城市</option>
      </select> 
    </div>
    <div class="layui-input-inline">
      <select  id="city123">
        <option>请选择城市/地区</option>
      </select>
    </div>
  </div>
   <div class="layui-form-item">
   <label class="layui-form-label">详细地址</label>
    <div class="layui-input-inline">
      <input type="text" name="username" style="width:300px;" lay-verify="required" placeholder="地址" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">签订合同</label>
    <div class="layui-input-inline">
      <select name="quiz1">
        <option value="">是否签订</option>
        <option value="签订">签订</option>
        <option value="不签订">不签订</option>
      </select>
    </div>
    </div>
   <div class="layui-form-item">
    <br>
    <div class="layui-input-block">
     <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" style="position:absolute;left:110px;" onclick="gitAudit();" >提交</button>
    </div>
  </div>
   
</form>  
 
</body>
</html>