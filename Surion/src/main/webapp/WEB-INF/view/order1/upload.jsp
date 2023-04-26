<%--
  Created by IntelliJ IDEA.
  User: deukkwonpark
  Date: 2023/04/11
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>
</head>
<body>



<input type="file" name="file">
<input type="hidden" name="id">
<input type="button" onclick="goImg()" value="전송">


<script>
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/document/upload",
        data: {

        },
        processData: false,
        contentType: false,
        success: result,
        error: function(){ alert('error')}
    });

    function goImg(){
        alert('ss')
    }

</script>

</body>
</html>
