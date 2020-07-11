<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title></title>
</head>

<body>
<%
    request.setCharacterEncoding("UTF-8");
    String userNum = request.getParameter("userNumber");
    int userNumber = (Integer) Integer.parseInt(userNum);
    int randomNumber = (Integer)session.getAttribute("randomNumber");
    if (userNumber <= 99 && userNumber >= 0) {


        if (userNumber == randomNumber) {
            session.setAttribute("message", "您猜对了,系统将重新分配随机数");
            session.removeAttribute("randomNumber");
            response.sendRedirect("input.jsp");
        }
        if (userNumber > randomNumber) {
            session.setAttribute("message", "你输入的是"+userNumber+"，您猜大了，请重新输入");
            response.sendRedirect("input.jsp");
        }
        if (userNumber < randomNumber) {
            session.setAttribute("message", "你输入的是"+userNumber+"，您猜小了，请重新输入");
            response.sendRedirect("input.jsp");
        }
    } else {
        session.setAttribute("message", "输入的数不符合规格，请重新输入");
        response.sendRedirect("input.jsp");
    }
%>
</body>
</html>