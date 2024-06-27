<%-- 
    Document   : Test
    Created on : Jun 19, 2024, 6:39:20 PM
    Author     : 84777
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript">
            function AutoRefresh(t) {
                setTimeout(function() {
                    location.reload(true);
                }, t);
            }

            function clearMessage() {
                // Call the servlet to clear the message
                fetch('Test', {
                    method: 'delete'
                })
                .then(response => {
                    if (response.ok) {
                        console.log('Message cleared');
                    } else {
                        console.log('Failed to clear message');
                    }
                    AutoRefresh(5000);  // Refresh page after attempting to clear message
                })
                .catch(error => {
                    console.error('Error clearing message:', error);
                });
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="AutoRefresh(5000);">
        <%
            String msg = (String) application.getAttribute("msg");
            if (msg != null && !msg.isEmpty()) {
        %>
        <script>
            window.alert("Hello!");
            window.alert("<%= msg %>");
            clearMessage();
        </script>
        <%
            } else {
                out.print("No message.");
            }
        %>
    </body>
</html>
