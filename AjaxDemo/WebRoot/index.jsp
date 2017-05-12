<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script> 
	<script type="text/javascript">
	   function loadInfo(){  
             $.ajax({  
               type:"get",//请求方式  
               url:"GetAjaxInfoServlet?action=jsonObject",//发送请求地址  
               timeout:30000,//超时时间：30秒  
               dataType:"json",//设置返回数据的格式  
               //请求成功后的回调函数 data为json格式  
               success:function(data){  
                  $("#name").attr("value",data.name);//填充内容 
                  $("#age").attr("value",data.age);//填充内容 
              },  
              //请求出错的处理  
              error:function(){  
                        alert("请求出错");  
              }  
           });  
          } 
    //json数组
	function loadInfo2() {
	$.ajax({  
        type:"get",//请求方式  
        url:"GetAjaxInfoServlet?action=jsonNested",//发送请求地址  
        dataType:"json",  
        data:{//发送给数据库的数据  
        },  
        //请求成功后的回调函数有两个参数  
        success:function(data){  
            var objs=eval(data); //解析json对象  
            var obj = objs.students;  
              
            var table = $("#studentTable");  
            table.empty();  
            table.append('<tr><th>姓名</th><th>年龄</th><th>得分</th></tr>');  
              
            for(var i=0;i< obj.length;i++){  
                var name = obj[i].name;
                var age = obj[i].age;
                var score = obj[i].score;
                var math = obj[i].score.math;
                var english = obj[i].score.english;
                var	chinese = obj[i].score.chinese;
                var str = "math:"+math+"english"+english+"chinese:"+chinese;
                table.append('<tr><th>'+name+'</th><th>'+age+'</th><th>'+str+'</th></tr>');
            }  
              
            //为鼠标移动添加样式，鼠标所在行变色，鼠标离开行恢复原状  
            $("tr:even").addClass("even");  
            $("th").first().css("text-align","left");  
            $("th").first().css("padding-left","5px");  
            $("tr").mouseenter(function(){  
                  $(this).addClass('bs');  
               });  
            $("tr").mouseleave(function(){  
                  $(this).removeClass('bs');  
            });  
        }  
       });  
	}
</script>
	</head>
	<body>
		<div style="text-align: center;">
			<div>
				
				&nbsp;&nbsp;姓名：
				<input type="text" id="name" name="name" /><br>
				&nbsp;&nbsp;年龄：
				<input type="text" id="age" name="age" /><br>
				<input type="button" onclick="loadInfo()" value="Ajax获取信息" />
			</div>
			<div style="margin-top: 20px;">
				<input type="button" onclick="loadInfo2()" value="Ajax获取信息2">
				<br />
				<table id="studentTable" align="center" border="1" cellspacing="0" cellpadding="0">
				</table>
			</div>
		</div>
	</body>
</html>