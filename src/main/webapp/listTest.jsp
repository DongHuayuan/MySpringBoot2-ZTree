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
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/demo.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ztree.all.min.js"></script>

</head>
<body>
<h1>最简单的树 -- 标准 JSON 数据</h1>

<div style="margin: 100px auto;width: 800px;height: 600px;border: 1px solid #000;background-color: #7EC4CC">
    <ul id="treeDemo" class="ztree"></ul>
</div>



<script type="text/javascript">
    var treeDemo;
    var setting = {
        view: {
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            // selectedMulti: false
        },
        edit: {
            drag: {
                isCopy: false,
                isMove: true
            },

            enable: true,
            // editNameSelectAll: true,
            showRemoveBtn: showRemoveBtn,
            showRenameBtn: showRenameBtn
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "parentId",
                rootPId: 0
            }
        },
        callback: {
            onDrop:  onDrop,
            beforeEditName: beforeEditName,
            beforeRemove: beforeRemove,
            beforeRename: beforeRename
        }
    };


    $(function () {
        $.ajax({
            url:"/demp/list",
            type:"post",
            dataType:"json",
            data:{},
            success: function (data,state) {
                console.log("list中data:"+data);
                treeDemo = $.fn.zTree.init($("#treeDemo"),setting,data);
            }
        });
    });


    //拖拽功能
    function onDrop(event,treeId,treeNodes,targetNode,moveType) {
        var id = treeNodes[0].id;
        console.log("移动的id:"+id);

        console.log("moveType:"+moveType);          //移动的类型

        if (targetNode){
            var parentId = targetNode.id;
            console.log("parentId:"+parentId);
            $.ajax({
                url:"/demp/move",
                type:"post",
                data:{
                    "id":id,
                    "moveType":moveType,
                    "parentId":parentId
                },
                dataType:"json",
                success:function (data,state) {
                    console.log("move中的data:"+data);
                    if ("ok"==data){
                        alert("移动成功");
                    } else{
                    }
                },
                error:function () {
                    alert("系统异常，移动失败");
                }
            });

        } else{
            alert("根节点不能移动");
        }
        return true;
    }

    //进入编辑状态
    function beforeEditName(treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        zTree.editName(treeNode);
    }
    //是否进行删除节点
    function beforeRemove(treeId, treeNode) {
        console.log("删除节点:treeNode.id:"+treeNode.id);
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
        $.ajax({
            url:"/demp/delete",
            type:"post",
            data:{
                "id":treeNode.id
            },
            dataType:"json",
            success:function(data,state) {
                console.log("data=",data);
                if ("ok"==data){
                    alert("删除成功");
                } else{
                    alert("删除失败");
                }
            },
            error:function () {
                alert("系统异常，删除失败。");
            }
        });
    }

    //判断修改后的节点是否为空，为空取消，否则提交
    function beforeRename(treeId, treeNode, newName, isCancel) {
        console.log("newName:"+newName);            //获取修改后的名称
        console.log("treeId:"+treeNode.id);         //获取id
        if (newName.length == 0) {
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                zTree.cancelEditName();
                alert("节点名称不能为空.");
            return false;
        }

        $.ajax({
            url:"/demp/updateName",
            type:"post",
            data:{
                "id":treeNode.id,
                "name":newName
            },
            dataType:"json",
            success:function(data) {
                console.log("updateName  data=",data);
                if ("ok" == data){
                    alert("修改成功");
                } else{
                    alert("修改失败");
                }
            },
            error: function () {
                alert("系统异常，修改失败");
            }
        });
    }

    function showRemoveBtn(treeId, treeNode) {
        return treeNode;
    }
    function showRenameBtn(treeId, treeNode) {
        return treeNode;
    }

    //增加节点
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='add node' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_"+treeNode.tId);
        if (btn) btn.bind("click", function(){
            console.log("被点击了。。");
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
             // zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
            $.ajax({
                url:"/demp/add",
                type:"post",
                dataType:"json",
                data:{
                    "pId":(treeNode.id)
                },
                "success": function (data,state) {
                    console.log("add成功  :"+data.id+","+data.name);
                    zTree.addNodes(treeNode, {id:data.id, pId:treeNode.id, name:data.name});
                },
                "error":function () {
                    console.log("错误");
                }
            });

        });
    };
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };

</script>

</body>
</html>