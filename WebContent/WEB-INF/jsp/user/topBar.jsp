<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MedicApp</title>
<link
	href="//netdna.bootstrapcdn.com/bootswatch/2.3.2/cerulean/bootstrap.min.css"
	rel="stylesheet">
	 <link
            href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css"
            rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<style type='text/css'>
body {
	padding-top: 40px;
	background-image: url('http://img703.imageshack.us/img703/5924/2qp1.png');
	background-attachment: fixed;
}
/* for demo purposes (fixed top navbar placement in the fiddle. Ok to remove */
@media ( max-width : 767px) {
	body {
		padding-top: 0;
	}
}

@media ( max-width : 979px) {
	body {
		padding-top: 0;
	}
}
</style>
<script type="text/javascript">
    $(function () {
        $("[rel='tooltip']").tooltip();
    });
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="navbar navbar-inverse navbar-fixed-top">
					<div class="navbar-inner">
						<div class="container-fluid">
							<a data-target=".navbar-responsive-collapse"
								data-toggle="collapse" class="btn btn-navbar "><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span></a> <a href="#" class="brand">Panel de
								Usuario</a>
							<div class="nav-collapse collapse navbar-responsive-collapse">
								<ul class="nav">
									<li><a href="#"><i class="icon-home"></i> Inicio</a></li>
									<li class="divider-vertical">
									<li><a href="#"><i class="icon-group"></i> Clientes</a></li>
									<li class="divider-vertical">
								</ul>
								<ul class="nav pull-right">
									<li class="divider-vertical"></li>
									<li class="dropdown"><a data-toggle="dropdown"
										class="dropdown-toggle" href="#"><i class="icon-user"></i>
											Usuario <strong class="caret"></strong></a>
										<ul class="dropdown-menu">
											
											<li class="divider"></li>
											<li><a id="modal-21623"
												href="#modal-container-21623-seguridad" role="button"
												data-toggle="modal"><i class="icon-off"></i> Cerrar
													Sesión</a></li>
										</ul></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- MODAL SERVICIO TECNICO -->
	<div id="modal-container-172149" class="modal hide fade" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Servicio T&eacute;nico</h3>
		</div>
		<div class="modal-body">
			<form>
				<fieldset>
					<input type="text" id="name" name="name" class="input-block-level"
						placeholder="Asunto">
					<textarea rows="6" id="description" name="description"
						class="input-block-level" placeholder="Description"></textarea>
				</fieldset>
			</form>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
			<button class="btn btn-primary">Enviar</button>
		</div>
	</div>
	<!-- FIN MODAL SERVICIO TECNICO -->

	<!-- MODAL SEGURIDAD -->
	<div id="modal-container-21623-seguridad" class="modal hide fade"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Mensaje del Sistema</h3>
		</div>
		<div class="modal-body">
			<center>
				<i class="icon-warning-sign icon-4x" style="color: black"></i></br>¿Está
				seguro de que desea cerrar la sesión y salir del sistema?
			</center>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
			<button class="btn btn-primary" onclick="location.href='<c:url value="/j_spring_security_logout" />'">Cerrar Sesión</button>
		</div>
	</div>
	<!-- FIN MODAL SEGURIDAD -->

</body>
</html>