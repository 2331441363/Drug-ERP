<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录-医药ERP</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="../css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="">
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
  </head>
  <body>
    <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>医药ERP后台登录系统</h1>
                  </div>
                  <p>Medical ERP background login system.</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                  <form method="post" class="form-validate" id="formId">
                    <div class="form-group">
                      <input id="login-username" type="text" name="empUserId" required data-msg="Please enter your username" class="input-material">
                      <label for="login-username" class="label-material">User Name</label>
                    </div>
                    <div class="form-group">
                      <input id="login-password" type="password" name="empPassword" required data-msg="Please enter your password" class="input-material">
                      <label for="login-password" class="label-material">Password</label>
                    </div><a id="login" style="color:white;" class="btn btn-primary">Login</a>
                    <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                  </form><a href="" class="forgot-pass">Forgot Password?</a><br><small>Do not have an account? </small><a href="" class="signup">Signup</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="copyrights text-center">
        <p>XX小组 by <a href="#" class="external">医药erp系统</a>
          <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
        </p>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/popper.min.js"> </script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.cookie.js"> </script>
    <script src="../js/Chart.min.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
    <!-- Main File-->
    <script src="../js/front.js"></script>
    <script type="text/javascript">
    if(window != top) {				    
        top.location.href = window.location.href;
    }
    layui.use('layer', function(){
    	  var layer = layui.layer;
    	  
    	  $("#login").click(function(){
  			var id = $('[name="empUserId"]').val();
  			var password = $('[name="empPassword"]').val();
  			if(id == null || id == "" || password == null || password == ""){
  				layer.msg('用户账号或密码不能为空');
  			}else{
  				$.ajax({
          			type:'post',
          			url:"../login.do",
          			data:$("#formId").serialize(),
          			dataType:'html',
          			success:function(back){
          				if(back == 'true'){
          					layer.msg("登录成功");
          					location.href="adminindex.jsp";
          				}else{
          					layer.msg("用户名或密码不正确");
          				}
          				
          			}
          		});
  			}
  			
  		});
   });              
    	
    </script>
  </body>
</html>