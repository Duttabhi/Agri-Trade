<%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
 
<html>
<body>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
  <form action="process.jsp" method="POST">
      <div class="g-recaptcha" data-sitekey="6Lc611sUAAAAAD02iFMAB1cIqSOLI-wSQI3cgQzf"></div>
      <br/>
      <input type="submit" value="Submit">
    </form>
</body>
</html>