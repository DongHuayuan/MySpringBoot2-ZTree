<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"+ request.getServerName() +":"+request.getServerPort()+path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ztree.all.min.js"></script>
    <script type="text/javascript">
        var zTreeObj;
        var setting = {
            data:{
                simpleData:{
                    enable: true,
                    idKey: "id",
                    pIdKey: "parentId",
                    rootPId: 0
                }
            }
        };

        $(function () {
            $.ajax({
                url:"/demp/list",
                type:"post",
                dataType:"json",
                data:{},
                success: function (data,state) {
                    console.log("data:"+data);
                    zTreeObj = $.fn.zTree.init($("#ztree"),setting,data);
                }
            })
        });

    </script>
</head>
<body>
<h1>最简单的树 -- 标准 JSON 数据</h1>

<div style="margin: 100px auto;width: 800px;height: 600px;border: 1px solid #000;background-color: #7EC4CC">
    <ul id="ztree" class="ztree"></ul>
</div>



</body>
</html>