<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <head>
    <link rel="favicon" href="images/favicon.ico">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <title>Aplicación Web</title>
        <link
            href="//netdna.bootstrapcdn.com/bootswatch/2.3.1/spacelab/bootstrap.min.css"
            rel="stylesheet">
        <link
            href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css"
            rel="stylesheet">

        <script type='text/javascript'
        src='http://code.jquery.com/jquery-1.8.3.js'></script>
        <script
        src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>


 <script>
$(function(){
  $('#myCarousel').carousel();
  
});
</script>


        <style type='text/css'>
            body {
                padding-top: 60px;
                padding-bottom: 40px;
                background-color: #269;
                background-image:
                    url('http://www.lavishdesigngroup.com/Lavish_Design_Group___Chair_Covers_%26_Event_Decor/Venues/Pages/Brock_House_files/white%20damask%20pattern_2.jpg');
            }

            .nav li {
                padding-top: 5px;
            }

            .leaderboard {
                padding: 60px;
                margin-bottom: 30px;
                background-image:
                    url('http://twistfly.com/wp-content/blogs.dir/176/files/et_temp/womens-health-pediatrician-family-doctor-albertville-AL-133609_943x345.jpg');
                background-repeat: repeat;
                -webkit-border-radius: 6px;
                -moz-border-radius: 6px;
                border-radius: 6px;
            }

            .leaderboard h1 {
                font-size: 40px;
                margin-bottom: 5px;
                line-height: 1;
                letter-spacing: -1px;
                color: #001540;
            }

            hr {
                color: #CCC;
                background-color: #CCC;
                height: 1px;
            }

            .leaderboard p {
                font-size: 18px;
                font-weight: 200;
                line-height: 27px;
            }
            
    .login {
    float:right;
}
            
            
        </style>

        <script type="text/javascript">

        </script>

    </head>

    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse"
                   data-target=".nav-collapse"> <span class="icon-bar"></span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span>
                </a>  </a> <a class="brand" href="#"> <img src="http://www.pcsupply.com.ve/tesis/Logo.png" width="250" height="205" border="0" /></a>
                <div class="nav-collapse">
                    <ul class="nav">
                        <li class="active"><a href="#">Home</a></li>
                        
                        <li><a data-toggle="modal" href="#contact">Contacto</a></li>
                        </ul>
                        <ul class="nav pull-right">
                        <li><a data-toggle="modal" href="#login">Iniciar Sesión</a></li>
                    	</ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>

    <div class="container">
    
  
        <!-- Aqui va todo sdas -->
        
        <div id="myCarousel" class="carousel slide">
        <div class="carousel-inner">
          <div class="item active">
            <a href="#">  <img src="http://www.pcsupply.com.ve/tesis/09.png" alt=""/>
            </a>
          </div>
          <div class="item">
            <a href="#">
              <img src="http://www.pcsupply.com.ve/tesis/00.png" alt="" />
            </a>
          </div>
          <div class="item">
            <a href="#">
              <img src="http://www.pcsupply.com.ve/tesis/01.png"  />
            </a>
          </div>
          <div class="item">
            <a href="#">
              <img src="http://www.pcsupply.com.ve/tesis/02.png"  />
            </a>
          </div>
        </div><!-- .carousel-inner -->
        <!--  next and previous controls here
              href values must reference the id for this carousel -->
          <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
          <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
      </div>
       

        <!-- Example row of columns -->
        <div class="row">
            <div class="span4">
                <h2>Reconocimiento Facial</h2>
                <p>Empleando algoritmos de reconocimiento facial, nuestra aplicación agiliza la identificaión de cada paciente únicamente 
                con la búsqueda de  los patrones faciales de su rostro. </p>
                <p>
                    <a class="btn btn-info btn-large" href="#">Detalles</a>
                </p>
            </div>
            <div class="span4">
                <h2>XML/PDF/DOC</h2>
                
                <p>Para facilitar la gestión de historiales entre cada paciente, 
                se implementaron estándares, cada usuario fácilmente podrá almacenar 
                o descargar de nuestra base de datos.</p>
                <p>
                    <a class="btn btn-info btn-large" href="#">Detalles</a>
                </p>
            </div>
            <div class="span4">
                <h2>Comodidad y Eficacia</h2>
                <p>La aplicación ha sido diseñada meticulosamente para facilitar y 
                centralizar cada proceso involucrado en la gestión de historias medicas, 
                de esta forma el usuario únicamente debe preocuparse por su paciente.</p>
                <p>
                    <a class="btn btn-info btn-large" href="#">Detalles</a>
                </p>
            </div>
        </div>
        <hr>
        <footer>
            <p>© Trabajo Especial de Grado de Ingeniería Informática. 2013</p>
        </footer>
    </div>


    <!-- LOGIN -->

    <div id="login" class="modal hide fade in" style="display: none;">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>
            <h3>Login</h3>
        </div>
        <div class="modal-body">
            <form style="margin: 0px" accept-charset="UTF-8"
                  action="<c:url value='j_spring_security_check' />" method="post">
                <div style="margin: 0; padding: 0; display: inline">
                    <input name="utf8" type="hidden" value="&#x2713;" /><input
                        name="authenticity_token" type="hidden"
                        value="4L/A2ZMYkhTD3IiNDMTuB/fhPRvyCNGEsaZocUUpw40=" />
                </div>
                <fieldset class='textbox' style="padding: 10px">
                    <input style="margin-top: 8px" type="text" name='j_username'
                           value='' placeholder="Username" /> </b> </br> <input
                           style="margin-top: 8px" type="password" name='j_password'
                           placeholder="Passsword" />
                </fieldset>

                <div class="modal-footer">
                    <input class="btn" name="submit" type="submit" value="Log In" /> <a
                        href="#" class="btn" data-dismiss="modal">Close</a>
            </form>
        </div>
    </div>
</div>

<!-- /LOGIN -->
 
 
     <!-- CONTACT -->

    <div id="contact" class="modal hide fade in" style="display: none;">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>
            <h3>Contacto</h3>
        </div>
        <div class="modal-body">
        <center>
        <img src="http://www.pcsupply.com.ve/tesis/Logo.png" width="250" height="205" border="0" />
        <br>
        <br>
           Arias Rafael: rmaa.business@icloud.com <br>
           Oberto José: joseoberto2@gmail.com <br>
           Rosales César: augusto.valtiel@gmail.com <br>
           <br>
           <br>
           </center>
           

                <div class="modal-footer">
                   <center>© Trabajo Especial de Grado de Ingeniería Informática. 2013</center>
           
        </div>
    </div>
</div>

<!-- /CONTACT -->
 
 
 
 
 
 

</body>
</html>