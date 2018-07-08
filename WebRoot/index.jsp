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
    <title>首页</title>
    
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
  	 <link href="css/bootstrap-treeview.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <!-- 页头 -->
   <div class="page-header">
  	<img src="image/3.jpg" width="100%" height="90px">
  	
	</div>
	<!-- 导航条 -->
	<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!---->
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
  
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">学生管理系统</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">首页</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">新闻 <span class="caret"></span></a>
        </li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">登录</a></li>
            <li><a href="#">注册</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- 导航结束 -->
<!-- 正文部分 -->
<div id="container-fluid">
	<div class="row"></div><!-- 行 -->
	<div class="col-md-4">
 <div class="list-group">
		  <a href="#" class="list-group-item active">
		 学生管理系统
		  </a>
		  <a href="addstu.jsp"  target="et" class="list-group-item">添加学生</a>
		   <a href="stulist.jsp"  target="et" class="list-group-item">学生列表</a>
		   <a href="addsch.jsp"  target="et" class="list-group-item">添加学校</a>
		
	</div> 
	<div id="tree"></div>
		
	</div>
	<div class="col-md-8">
	<iframe src="welcome.jsp"  name="et" frameborder="0" width="100%" height="1000px"></iframe>
	</div>
</div>	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
     <script src="js/bootstrap-treeview.min.js"></script>
     <script type="text/javascript">
     	/* $(function(){
     		var defaultData=[{
     			text:'学生管理',
     			href:'#parent1',
     			tags:['4'],
     			nods:[
     			      {
     			      text:'添加学生',
     			      href:'#child1',
     			      tags:['2'],
     			      nods:[]
     			      },
     			      {
     			    	 text:'学生列表',
        			      href:'#child2',
        			      tags:['0'], 
        			      nods:[]
     			      }
     			      ]
     		} ];
     		$("#tree").treeview({
     			data: defaultData,
     			enablelinks:true
     		}); 		
     	});
      */
     
     </script>
  </body>
</html>