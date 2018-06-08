<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <head>
        <script type='text/javascript'
        src='http://code.jquery.com/jquery-1.8.3.js'></script>
        <link rel="stylesheet" type="text/css"
              href="//netdna.bootstrapcdn.com/bootswatch/2.3.1/cerulean/bootstrap.min.css">
        <script type='text/javascript'
        src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js"></script>
        <script type='text/javascript'
        src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.js"></script>
        <script type='text/javascript'
        src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>

        <link
            href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css"
            rel="stylesheet">
        <link
            href="//netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css"
            rel="stylesheet">
         <style type="text/css">
      /* Override some defaults */
      html, body {
                       background-image:
                    url('http://www.lavishdesigngroup.com/Lavish_Design_Group___Chair_Covers_%26_Event_Decor/Venues/Pages/Brock_House_files/white%20damask%20pattern_2.jpg');
      }
      body {
        padding-top: 40px; 
      }
      .container {
        width: 300px;
        top: 50%;
	
		
      }

      /* The white background content wrapper */
      .container > .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; 
        -webkit-border-radius: 10px 10px 10px 10px;
           -moz-border-radius: 10px 10px 10px 10px;
                border-radius: 10px 10px 10px 10px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

	  .login-form {
		margin-left: 65px;
	  }
	
	  legend {
		margin-right: -50px;
		font-weight: bold;
	  	color: #404040;
	  }

    </style>



    </head>
    <body>
       
       
       
       <div class="container">
    <div class="content">
      <div class="row">
        <div class="login-form">
          <h2>Login</h2>
          <form accept-charset="UTF-8"
           action="<c:url value='/admin/adminPanel.do' />" method="post">
            <fieldset>
              <div class="clearfix">
              <div class="input-prepend">
                                        <span class="add-on"><i class="icon-group"></i></span>
                <input type="text" name="j_username" placeholder="Usuario">
              </div>
              <div class="clearfix">
              <div class="input-prepend">
                                        <span class="add-on"><i class="icon-lock"></i></span>
                <input type="password" name='j_password' placeholder="Contraseña">
              </div>
              <button class="btn primary" type="submit">Ingresar</button>
            </fieldset>
        </div>
      </div>
    </div>
  </div> <!-- /container -->
       
       
       
    </body>
</html>