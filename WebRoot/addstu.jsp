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
  <h2 align="center">添加学生信息</h2>
  <form class="form-horizontal" action="manager" role="form" method="post" >
 	<input type="hidden" name="method" value="addStu">
  <div class="form-group">
    <label for="name" class="col-sm-2 control-label">学生姓名</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="name" placeholder="请输入学生名字">
    </div>
    </div>
   
    <div class="form-group">
    <label for="name" class="col-sm-2 control-label">年龄</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="age" placeholder="请输入年龄">
    </div>
    </div>
     <div class="form-group">
    <label for="name" class="col-sm-2 control-label">学校</label>
    <div class="col-sm-10">
    <select  id="sname"  name="sname" placeholder="请选择学校"></select>
    
    </div>
    </div>
    
    
       <div class="form-group">
    <label for="name" class="col-sm-2 control-label">生日</label>
    <div class="col-sm-10">
      <input type="date" class="form-control" name="birth" placeholder="请输入生日">
    </div>
    </div>
      <div class="form-group">
    <label for="name" class="col-sm-2 control-label">学生状态</label>
    <div class="col-sm-10">
    <select  id="categoryid"  name="status" placeholder="请选择类别">
    	<option value="0">已毕业</option>
    	<option  value="1">未毕业</option>
    </select>
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
  		
				$(function(){
					queryAllSchool();
				});
				
			function queryAllSchool(){
				
				$.ajax({
					type:"post",
					url:"manager",
					dataType:"JSON",
					data:"method=queryAllSchool",
					success: function(data){
						console.log(data);
						var ops="<option value='-1'>=请选择=</option>";
							$.each(data,function(index,sch){
								ops+="<option value='"+sch.id+"'>"+sch.name+"</option>";						
							});
							$("#sname").html(ops);
					}					
				});	
			}
  </script>
    
    
  </body>
</html>