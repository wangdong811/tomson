<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shouweye</title>
    
    <style type="text/css">
    .page-header {
    margin: 2px 0 0; 
    padding-bottom: 2px;
	}
	.navbar {
    margin-bottom: 2px; 
	}  
    </style>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body >
  <h2 align="center">添加书籍信息</h2>
  <form class="form-horizontal" action="show" role="form" method="post" >
 	<input type="hidden" name="method" value="addBook">
  <div class="form-group">
    <label for="name" class="col-sm-2 control-label">客户</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="name" placeholder="请输入客户名字">
    </div>
    </div>
    
    <div class="form-group">
    <label for="name" class="col-sm-2 control-label">订单金额</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="money" placeholder="请输入订单金额">
    </div>
    </div>
   <div class="form-group">
   <label for="name" class="col-sm-2 control-label"></label>
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary">提交</button>
    </div>
  </div>
</form>	


    <script src="js/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript">
  		
  </script>
    
    
  </body>
</html>