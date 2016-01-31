<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  地点：
    <select name="placeSelect" id="placeSelect">
    	<option value='0' selected>请选择所在地点：</option>
    	<!-- 生成假数据 -->
    	<%  List<String> placeArray = new ArrayList<String>();
    		placeArray.add(0,"北京");
    		placeArray.add(1,"上海");
    		placeArray.add(2,"杭州");
    		List<String> stores = new ArrayList<String>();
    		stores.add(0,"北京市海淀区中关村大厦 ");
    		stores.add(1,"上海市虹桥机场");
    		stores.add(2,"杭州市Alibaba总部");
    		request.setAttribute("placeArray", placeArray);
    		request.setAttribute("stores", stores);
    	%>
    	<!-- 循环数组，展示假数据 -->
    	<%
    		for(int i=0;i<placeArray.size();i++){
    	 %>
    	 <option value="<%=i+1%>">
    	 	<%=placeArray.get(i) %>
    	 </option>
    	 <%} %>
    </select>
    门市：
    <input type='text' readonly value="" id="store"/>
    
    <script>
    (function(){
    	    //获取相应的select和input元素
    	var placeSelect = document.getElementById('placeSelect');
    	var store = document.getElementById('store');
    	//从后台获取门店数据
    	var stores = "<%=stores %>";
    	//对数据进行处理，方便其被JavaScript处理
    	stores = stores.split('[');
    	stores = stores[1].split(']');
    	stores = stores[0].split(',');
    	var index;//索引关系
    	//根据onchange事件获取索引变化，更改input中的值
    	placeSelect.onchange = function(){
    		index = placeSelect.value;
    		store.value = stores[index-1];
    	};
    }());
    </script>
  </body>
</html>
