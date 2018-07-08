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
  <form class="form-horizontal" action="show" role="form" method="post" enctype="multipart/form-data">
 	<input type="hidden" name="method" value="addBook">
     <div class="form-group">
    <label for="name" class="col-sm-2 control-label">添加订单</label>
    <div class="col-sm-10">
    <select  id="customer"  name="customer" placeholder="请选择客户" onchange="showmenu(this.value)"></select>
    </div>
    </div>
    
    
   	 	<table class="table table-hover table-bodered table-striped table-condened"> 		
 			<thead>			
 				<tr>
 				<td>编号</td>
 				<td>订单金额</td>
 				<td>操作</td>
 				</tr>
 			</thead>
 			<tbody id="data" >
 				
 			</tbody>	
 		</table>
 	<div class="form-group">
    <label for="name" class="col-sm-2 control-label"><a  href="add.jsp">添加订单</a></label>
    <div class="col-sm-10">
    
    </div></div>
    
    <script src="js/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript">
  			var  m="";
  			var  ids;
  			$(function(){
  				queryAllCus();
  			});
  			
  			function queryAllCus(){
  				$.ajax({
  					type:"post",
  					url:"manager",
  					dataType:"JSON",
  					success:function(msg){
  						m=msg;
  					console.log(msg);
  					
  					var ops="<option value='-1'>=请选择=</option>";
  					
  					$.each(msg,function(index,ca){
  						ops+="<option value='"+ca.id+"'>"+ca.name+"</option>";	
  					});
				$("#customer").html(ops);
  					}
  				});
  			}
  			function  showmenu(id){
  	  					var table="";	
  	  					var  i=0;
  	  					ids=id;
  	  					$.each(m,function(index,o){
  	  						if(id==o.id){
  	  							$.each(o.orders,function(index,or){	
  	  							table+="<tr><td>"+(i++)+"</td><td>"+or.money+"</td><td> <button type='button'  onclick='deleteorder("+or.id+")' value='delete'>删除</button></td></tr>";	
  	  							});		
  	  						}
  	  					$("#data").html(table);
  	  					});
  	  				}
  					
				function deleteorder(id){
						$.ajax({
							type:"post",
							url:"delete",
							dataType:"JSON",
							data:"id="+id,
							success:function(data){
								console.log(data);
								if(data.flag=="success"){
									showmenu(id);					
								}
								
							}
						});					
				}
  			
  			
  </script>  
  </body>
</html>