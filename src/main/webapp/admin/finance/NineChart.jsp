<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>总店财务报表</title>
    <!--引入echarts.js-->
    <script src="<%=request.getContextPath()%>/js/echarts.js"></script>
</head>
<body>
    <!--为ECharts准备一个具备大小（宽高）的Dom-->
    <div id = "main" style = "width:600px;height:400px;margin-left: 150px;margin-top: 70px;"></div>
    <script type = "text/javascript">
        //基于准备好的dom，初始化echarts实例
        var myChar =
            echarts.init(document.getElementById('main'));
 
        //指定图表的配置项和数据
        var option ={
            title:{
                text:'总店财务报表',
            },
            tooltip:{},
            legend:{
                data:['收入']
            },
            xAxis:{
            	name:'时间',
                data:["第1周","第2周","第3周","第4周","第5周"]
            },
            yAxis:{
            	name:'收入'
            	
            },
            series:[{
                name:'收入',
                type:'line',
                data:[1080,1802,2543,3076,4086]
            }]
        };
        //是有刚指定的配置项和数据显示图表。
        myChar.setOption(option);
    </script>
 
</body>
</html>