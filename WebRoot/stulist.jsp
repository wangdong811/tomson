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
    
  
    <link href="css/bootstrap.min.css" rel="stylesheet">

  </head>
  <body >
  <!-- 条件语句的开始 -->
  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
         	条件查询
        </a>     
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
      	<form>
      	<div class="form-group">
    <label for="name" class="col-sm-2 control-label">姓名</label>
    <div class="col-sm-10">
      <input type="text" id="name" class="form-control" name="name" placeholder="请输入名字">
    </div>
    </div>
    	<div class="form-group">
    <label for="name" class="col-sm-2 control-label">学校</label>
    <div class="col-sm-10">
      <select  id="sname" class="form-control" name="sname" placeholder="请选择学校"></select>
    </div>
    </div>
  <div class="form-group">
    <div for="name" class="col-sm-offset-2 col-sm-10"></div>
    <div class="col-sm-10">
      <button type="button" class=" btn btn-primary"  onclick="queryByConditions()">查询 </button>
      <div id="pics"></div>
   	 </div>
    </div>  	
      	</form>
      </div>
    </div>
  </div>
 		<table class="table table-hover table-bodered table-striped table-condened"> 		
 			<thead>			
 				<tr>
 				<td><input type="checkbox" id="checkall"  onclick="et()"/></td>
 				<td>编号</td>
 				<td>名字</td>
 				<td>年龄</td>
 				<td>出生日期</td>
 				<td>学校</td>
 				<td>操作</td>
 				</tr>
 			</thead>
 			<tbody id="data">
 				
 			</tbody>	
 		</table>
 		<button type="button" id="first" class="btn btn-primary" >首页</button>
 		<button type="button" id="pre" class="btn btn-primary" >上一页</button>
 		<button type="button" id="next" class="btn btn-primary" >下一页</button>
 		<button type="button" id="end" class="btn btn-primary" >末页</button>  

  <script src="js/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ajaxfileupload.js"></script>
    <script type="text/javascript">
    		var  next, pre ,pageCount ;
    		var  c="";
    		var bookid="";
			var conds="";
			$(function(){
    			//整个页面加载完毕加载数据
    			queryAllSchool();
    			queryData(1,conds);
    			$("#first").click(function(){queryData(1,conds);});
    			$("#pre").click(function(){queryData(pre,conds);});
    			$("#next").click(function(){queryData(next,conds);});
    			$("#end").click(function(){queryData(pageCount,conds);});
    		});	
   		function queryByConditions(){
				conds="";
    			var name=$("#name").val();
    			var sid=$("#sname").val();
    			if(name!=""){
    				conds+="&name="+name;
    			}
    			if(sid!="-1"){
    				conds+="&sname="+sid;
    			}	
    			alert(sid);
				queryData(1,conds);          
    		}
			
    		function queryData(cp,conds){
    			c=cp;
    			$.ajax({
    				type:"POST",
    				url:"manager",
    				data:"method=querySomeStu&currentPage="+cp+conds,
    				dataType:"JSON",
    				success:function(msg){
    					console.log(msg);
    					pre=msg.pre;
    					next=msg.next;
    					pageCount=msg.pageCount;
    					var trs="";
    					$.each(msg.rows,function(i,s){ 						
    						var d=(s.birth.year+1900)+"-"+((s.birth.month+1)<10?("0"+(s.birth.month+1)):(s.birth.month+1))+"-"+(s.birth.date);
    						trs+="<tr><td></td><td>"+s.id+"</td><td>"+s.name+"</td><td>"+s.age+"</td><td>"+d+"</td><td>"+s.sc.name+"</td><td><button type='button' onclick='deletestu("+s.id+")'>删除</button></td></tr>";
    					});
    					$("#data").html(trs);
    				}	
    			});	
    		} 
				
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
    		function deletestu(id){
    			$.post("manager","method=deleteStu&id="+id,show,"json");
    		}
			function show(data){
				if(data.flag=="success"){
					queryData(c,conds); 
				}
				
			}
    		
    		 				
    </script>
  
  </body>
</html>