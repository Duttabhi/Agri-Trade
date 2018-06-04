<%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
 
<html>
<body>
<form action="process.jsp" method="post">
        <%
          //ReCaptcha c = ReCaptchaFactory.newReCaptcha("your_public_key", "your_private_key", false);
          ReCaptcha captcha = ReCaptchaFactory.newReCaptcha("6LcYiCATAAAAAMgoe3Jt6qYLA2_o1-Kp0x18QmD5", "6LcYiCATAAAAAL5PpuBpN1n4pain4ynz5H9kwrSV", false);
          out.print(captcha.createRecaptchaHtml(null, null));
        %>
        <input type="submit" value="submit" />
    </form>
</body>
</html>