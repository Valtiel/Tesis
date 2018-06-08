<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MedicApp</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<style type='text/css'>
</style>
<script>
	var gStream;

	$(document).ready(function() {
		$('#modal-container-25123-recorder').on('hide', function() {
			closeCam(); // stops modal from being shown
			console.log("ready!");
		});
	});

	function uploadAndSearchImage() {
		var fileToUp = document.getElementById('fileToUpload');
		var oMyForm = new FormData();
		oMyForm.append("archive", fileToUp.files[0]);
		$("#modalSearchImageMessage")
				.html(
						'<center><i class="icon-spinner icon-spin icon-4x"></i></center>');
		$.ajax({
			url : '/MedicApp/ClientImages/get.htm',
			data : oMyForm,
			dataType : 'json',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				handleData(data);
			},
			error : function(e) {
				alert('La imagen es irreconocible: ' + e);
			}
		});
	}

	function uploadRecordArchive() {
		//	//alert('ghjgjh');
		//$('#alert').html('hola fjytfyjtfjytf');
		clientId = $('#clientIdLabel').text();
		//medicId = 7781866;
		institutionId = $('#inputInstitutionId').val();
		var file2 = document.getElementById('file2');
		var oMyForm = new FormData();
		oMyForm.append("archive", file2.files[0]);
		oMyForm.append("institutionId", institutionId);
		oMyForm.append("clientId", clientId);
		//oMyForm.append("medicId", medicId);
		$("#modalUploadRecordMessage")
				.html(
						'<center><i class="icon-spinner icon-spin icon-4x"></i></center>');
		//console.log(recordData);
		//console.log(oMyForm);
		$.ajax({
			url : '/MedicApp/records/file.htm',
			data : oMyForm,
			dataType : 'json',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(response) {

				if (response.status == "SUCCESS") {
					getClientRecords(clientId)
					$("#modalUploadRecordMessage")
				.html('{exito}');
					$("#modal-container-71258-uploadRecord").modal('hide');
				} else {
					$("#modalUploadRecordMessage").html(response.text);
					//cleanLabels();
				}
				//  $('#result').html(data+ " uploaded by FormData!");

			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}

	function handleData(data) {
		if (data.status == "SUCCESS") {
			var idClient = data.text;
			$
					.ajax({
						type : "GET",
						url : "/MedicApp/client/user=" + idClient,
						success : function(response) {
							if (response.status == "SUCCESS") {
								fillLabels(response);
								$("#modalSearchImageMessage").html('');
								$("#modal-container-71348-buscarImagen").modal(
										'hide');
							} else {
								document
										.getElementById('modalSearchImageMessage').innerHTML = response.text;
								cleanLabels();
							}
						},
						error : function(e) {
							alert('Error: ' + e);
							cleanLabels();
						}
					});
		} else {

		}
	}

	function getClientById() {
		// get the form values
		var idClient = $('#cedula').val();
		$("#modalSearchIdMessage")
				.html(
						'<center><i class="icon-spinner icon-spin icon-4x"></i></center>');
		$
				.ajax({
					type : "GET",
					url : "/MedicApp/client/user=" + idClient,
					success : function(response) {
						if (response.status == "SUCCESS") {
							fillLabels(response);
							$("#modalSearchIdMessage").html('');
							$("#modal-container-61345-buscarId").modal('hide');
						} else {
							document.getElementById('modalSearchIdMessage').innerHTML = response.text;
							cleanLabels();
						}
					},
					error : function(e) {
						alert('Error: ' + e);
						cleanLabels();
					}
				});
	}

	function getClientNotes(id) {
		// get the form values
		//var idClient = $('#cedula').val();
		$.ajax({
			type : "GET",
			url : "/MedicApp/note/getNotes/client=" + id,
			success : function(response) {
				if (response.status == "SUCCESS") {
					doNotes(response.result);
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}

	function getClientRecords(id) {
		// get the form values
		//var idClient = $('#cedula').val();
		$.ajax({
			type : "GET",
			url : "/MedicApp/records/getListRecord=" + id,
			success : function(response) {
				if (response.status == "SUCCESS") {
					doRecords(response.result);
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}

	function getClientProblems(id) {
		// get the form values
		//var idClient = $('#cedula').val();
		$.ajax({
			type : "GET",
			url : "/MedicApp/problem/getProblems/client=" + id,
			success : function(response) {
				if (response.status == "SUCCESS") {
					doProblems(response.result);
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}

	function deleteNoteFromClient(id) {
		var idClient = $('#clientIdLabel').text();
		$.ajax({
			type : "POST",
			url : "/MedicApp/note/deleteNote=" + id,
			success : function(response) {
				if (response.status == "SUCCESS") {
					getClientNotes(idClient);
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}

	function deleteProblemFromClient(id) {
		var idClient = $('#clientIdLabel').text();
		console.log(id);
		$.ajax({
			type : "POST",
			url : "/MedicApp/relationClient/deleteProblem=" + id
					+ "/fromClient=" + idClient,
			success : function(response) {
				if (response.status == "SUCCESS") {
					getClientProblems(idClient);
				}else{
					console.log(response.text);	
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
	function doNotes(result) {
		var d = document.getElementById("noteListPanel");
		var htmlToPut = "";
		for (x in result) {
			htmlToPut += "<button type=\"button\" class=\"close\" onclick=deleteNoteFromClient(\""
					+ result[x].noteId
					+ "\")>×</button> <h4>"
					+ result[x].noteTitle
					+ "</h4>"
					+ "<hr><p>"
					+ result[x].noteContext
					+ "</p>"
					+ "<span class=\"label label-info\"> Id: #"
					+ result[x].noteId
					+ "</span><hr>";
		}
		d.innerHTML = htmlToPut;
	}

	function doProblems(result) {
		var d = document.getElementById("problemListPanel");
		var htmlToPut = "";
		for (x in result) {
			htmlToPut += "<button type=\"button\" class=\"close\" onclick=deleteProblemFromClient(\""
					+ result[x].idProblem
					+ "\")>×</button> <h4>"
					+ result[x].idProblem
					+ "</h4>"
					+ "<hr><p>"
					+ result[x].description
					+ "</p>"
					+ "<span class=\"label label-info\"> CIE: #"
					+ result[x].idProblem
					+ "</span><hr>";
		}
		d.innerHTML = htmlToPut;
	}
	
	function doRecords(result) {
		var d = document.getElementById("recordListPanel");
		var htmlToPut = "";
		for (x in result) {
			htmlToPut += "<hr><h4><a href=\"/MedicApp/records/get/"+result[x].idRecord+"\" target=\"_blank\"><img src='http://s13.postimg.org/h9e1nfzz7/icon.png'>"

			+ result[x].fileName + "</a></h4>"
					+ "<span class=\"label label-info\"> Cliente #: "
					+ result[x].idClient + "</span> "
					+ "<span class=\"label label-info\"> Institución #: "
					+ result[x].idInstitution + "</span> "
					+ "<span class=\"label label-info\"> Tamaño #: "
					+ result[x].sizeInKb + " Kb</span> "
					+ "<span class=\"label label-info\"> ID #:" + result[x].idRecord
					+ "</span><hr>";

		}
		d.innerHTML = htmlToPut;
	}

	function convertCanvasToImage(canvas) {
		var image = new Image();
		image.src = canvas.toDataURL("image/png");
		return image;
	}

	function fillLabels(res) {
		document.getElementById('clientFirstNameLabel').innerHTML = res.result.firstName;
		document.getElementById('clientLastNameLabel').innerHTML = res.result.lastName;
		document.getElementById('clientIdLabel').innerHTML = res.result.idClient;
		document.getElementById('clientSexLabel').innerHTML = res.result.sex;
		document.getElementById('clientMailLabel').innerHTML = res.result.email;
		document.getElementById('clientAddressLabel').innerHTML = res.result.address;
		document.getElementById('clientBirthLabel').innerHTML = res.result.birthDate;
		document.getElementById('clientBloodLabel').innerHTML = res.result.bloodType;
		document.getElementById('clientHeightLabel').innerHTML = res.result.height;
		document.getElementById('clientProfessionLabel').innerHTML = res.result.occupation;
		document.getElementById('clientPhoneLabel').innerHTML = res.result.phoneNumber;
		document.getElementById('idMainLabel').innerHTML = res.result.idClient;
		getClientNotes(res.result.idClient);
		getClientProblems(res.result.idClient);
		getClientRecords(res.result.idClient);
	}

	function cleanLabels() {
		document.getElementById('clientFirstNameLabel').innerHTML = "";
		document.getElementById('clientLastNameLabel').innerHTML = "";
		document.getElementById('clientIdLabel').innerHTML = "";
		document.getElementById('clientSexLabel').innerHTML = "";
		document.getElementById('clientMailLabel').innerHTML = "";
		document.getElementById('clientAddressLabel').innerHTML = "";
		document.getElementById('clientBirthLabel').innerHTML = "";
		document.getElementById('clientBloodLabel').innerHTML = "";
		document.getElementById('clientHeightLabel').innerHTML = "";
		document.getElementById('clientProfessionLabel').innerHTML = "";
		document.getElementById('clientPhoneLabel').innerHTML = "";
		document.getElementById('idMainLabel').innerHTML = "";
	}

	function closeCam() {
		if (gStream != null)
			gStream.stop();
	}

	function initCam() {
		// Grab elements, create settings, etc.
		$("#modal-container-25123-recorder").modal('show');
		var canvas = document.getElementById("offScreenCanvas"), context = canvas
				.getContext("2d"), video = document.getElementById("video"), videoObj = {
			"video" : true
		}, errBack = function(error) {
			console.log("Video capture error: ", error.code);
		};

		// Put video listeners into place
		if (navigator.getUserMedia) { // Standard
			navigator.getUserMedia(videoObj, function(stream) {
				video.src = stream;
				video.play();
				gStream = stream;
			}, errBack);
		} else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
			navigator.webkitGetUserMedia(videoObj, function(stream) {
				video.src = window.webkitURL.createObjectURL(stream);
				video.play();
				gStream = stream;
			}, errBack);
		}

		// Trigger photo take
		document.getElementById("snapButton").addEventListener("click",
				function() {
					context.drawImage(video, 0, 0, 440, 340);
					var dataImage = offScreenCanvas.toDataURL("image/png");
					var file = dataURLtoBlob(dataImage);
					// And send it
					takePicture(file);
				});

		function takePicture(image) {
			var oMyForm = new FormData();
			oMyForm.append("archive", image);
			$.ajax({
				url : '/MedicApp/ClientImages/get.htm',
				data : oMyForm,
				dataType : 'json',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					//alert(data.status);
					if(data.status == "SUCCESS"){
						
						handleData(data);
						$("#modal-container-25123-recorder").modal('hide');
					}else{
						alert("No se pudo reconocer el rostro");
					}
					
				},
				error : function(e) {
					alert("No se pudo reconocer el rostro");
				}
			});

		}
	}

	function addNoteToClient() {
		var idClient = $('#clientIdLabel').text();
		var noteTitle = $('#noteTitleInput').val();
		var noteContext = $('#noteContextInput').val();
		$('#modalAddProblemMessage').removeClass("alert-error");
		$.ajax({
			type : "POST",
			url : "/MedicApp/note/add",
			data : "noteTitle=" + noteTitle + "&noteContext=" + noteContext
					+ "&clientId=" + idClient,
			success : function(response) {
				// we have the response
				if (response.status == "SUCCESS") {
					$('#modalAddNoteMessage').removeClass("alert-error");
					$('#noteTitleInput').val('');
					$('#noteContextInput').val('');
					getClientNotes(idClient);
					$("#modal-container-21733-agregarNota").modal('hide');
				} else {
					$('#modalAddNoteMessage').removeClass("alert-success");
					$('#modalAddNoteMessage').addClass("alert-error");
					$('#modalAddNoteMessage').html(
							"Registro fallido: Hay un error con los datos. "
									+ response.text);
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}

	function addProblemClientRelation() {
		// get the form values
		var idClient = $('#clientIdLabel').text();
		var idProblem = $('#problemIdLabel').val();
		console.log("idClient" + idClient);
		console.log("idProblem" + idProblem);
		$('#modalAddProblemMessage').removeClass("alert-error");
		$.ajax({
			type : "POST",
			url : "/MedicApp/relationClient/addProblemClientRelation",
			data : "idClient=" + idClient + "&idProblem=" + idProblem,
			success : function(response) {
				// we have the response
				if (response.status == "SUCCESS") {
					$('#modalAddProblemMessage').removeClass("alert-error");
					$('#problemIdLabel').val('');
					getClientProblems(idClient);
					$("#modal-container-34733-agregarProblema").modal('hide');
				} else {
					$('#modalAddProblemMessage').removeClass("alert-success");
					$('#modalAddProblemMessage').addClass("alert-error");
					$('#modalAddProblemMessage').html(
							"Registro fallido: Hay un error con los datos. "
									+ response.text);
				}
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}

	function dataURLtoBlob(dataURL) {
		// Decode the dataURL    
		var binary = atob(dataURL.split(',')[1]);
		// Create 8-bit unsigned array
		var array = [];
		for ( var i = 0; i < binary.length; i++) {
			array.push(binary.charCodeAt(i));
		}
		// Return our Blob object
		return new Blob([ new Uint8Array(array) ], {
			type : 'image/png'
		});
	}
</script>

</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<%@include file="topBar.jsp"%>
				<div class="row-fluid">
					<div class="span3 well">
						<center>
							<p id="clientImage" class="text-center">
								
							</p>
							<strong>Cliente:
								<p class="text-center" id="idMainLabel">no seleccionado</p>
							</strong>
							<p class="text-center">
							<p class="text-center" id="mainDescription"></p>


							<ul class="nav nav-tabs nav-stacked">
								<li class="nav-header">Opciones</li>
								
								<li><a id="modal-61345"
									href="#modal-container-61345-buscarId" role="button"
									data-toggle="modal">Buscar por CI</a></li>
								<li class="nav-header">Reconocimiento Facial</li>

								<li><a id="modal-71348"
									href="#modal-container-71348-buscarImagen" role="button"
									data-toggle="modal">Subir Imagen</a></li>
								<li><a id="modal-25123" role="button" href="#"
									onclick="initCam()">Tomar Foto</a></li>

							</ul>
						</center>
					</div>
					<div class="span9 well well-small">
						<div class="tabbable tabs-left" id="tabs-180939">
							<ul class="nav nav-tabs">

								<li class="active"><a href="#panel-496851"
									data-toggle="tab"><center>
											<i class="icon-user icon-4x" style="color: black"
												data-toggle="tooltip" title="Personal" rel="tooltip"
												data-placement="right"></i>
										</center> </a></li>
								<li><a href="#panel-783516" data-toggle="tab"><center>
											<i class="icon-warning-sign icon-4x" style="color: black"
												data-toggle="tooltip" title="Problemas" rel="tooltip"
												data-placement="right"></i>
										</center></a></li>
								<li><a href="#panel-465501" data-toggle="tab"><center>
											<i class="icon-paper-clip icon-4x" style="color: black"
												data-toggle="tooltip" title="Notas" rel="tooltip"
												data-placement="right"></i>
										</center></a></li>
								<li><a href="#panel-1654977" data-toggle="tab"><center>
											<i class="icon-file-text icon-4x" style="color: black"
												data-toggle="tooltip" title="Historiales" rel="tooltip"
												data-placement="right"></i>
										</center></a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane" id="panel-465501">
									<legend>
										<h3>Notas</h3>
									</legend>


									<!-- PANEL NOTAS -->
									<div class="alert alert-info">
										<strong>
											<center>
												<a id="modal-21733"
													href="#modal-container-21733-agregarNota" role="button"
													data-toggle="modal">Nuevo Registro</a>
											</center>

										</strong>
									</div>
									<div id="noteListPanel"></div>

									<!--FIN DE PANEL NOTAS-->

								</div>

								<!-- PANEL HISTORIALES -->
								<div class="tab-pane" id="panel-1654977">
									<legend>
										<h3>Historiales</h3>
									</legend>

									<div class="alert alert-info">
										<strong>
											<center>
												<a id="modal-21733"
													href="#modal-container-71258-uploadRecord" role="button"
													data-toggle="modal">Nuevo Registro</a>
											</center>
										</strong>
									</div>
									<div id="recordListPanel"></div>

								</div>
								<!--FIN DE PANEL HISTORIALES-->

								<!-- PANEL PROBLEMAS -->
								<div class="tab-pane" id="panel-783516">
									<legend>
										<h3>Problemas</h3>
									</legend>

									<div class="alert alert-info">
										<strong>
											<center>
												<a id="modal-21733"
													href="#modal-container-34733-agregarProblema" role="button"
													data-toggle="modal">Nuevo Registro</a>
											</center>
										</strong>
									</div>
									<div id="problemListPanel"></div>

								</div>

								<!--FIN DE PANEL PROBLEMAS-->

								<div class="tab-pane active" id="panel-496851">
									<legend>
										<h3>Información Personal</h3>
									</legend>
									<p>
										<strong>Nombres: </strong> <label id="clientFirstNameLabel">
										</label>
									</p>
									<p>
										<strong>Apellidos: </strong> <label id="clientLastNameLabel">
										</label>
									</p>
									<p>
										<strong>Cédula de Identidad: </strong> <label
											id="clientIdLabel"></label>
									</p>
									<p>
										<strong>Sexo: </strong> <label id="clientSexLabel"></label>
									</p>
									<p>
										<strong>Fecha de Nacimiento: </strong> <label
											id="clientBirthLabel"></label>
									</p>
									<p>
										<strong>Teléfono: </strong> <label id="clientPhoneLabel"></label>
									</p>
									<p>
										<strong>e-mail: </strong><label id="clientMailLabel"></label>
									</p>
									<p>
										<strong>Dirección: </strong> <label id="clientAddressLabel"></label>
									</p>
									<p>
										<strong>Tipo de Sangre: </strong> <label id="clientBloodLabel"></label>
									</p>
									<p>
										<strong>Altura: </strong> <label id="clientHeightLabel"></label>
									</p>
									<p>
										<strong>Ocupación: </strong> <label id="clientProfessionLabel"></label>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- MODAL AGREGAR NOTA -->
	<div id="modal-container-21733-agregarNota" class="modal hide fade"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Agregar Nota</h3>
		</div>
		<div class="modal-body">
			<form>
				<fieldset>
					<input type="text" id="noteTitleInput" name="name"
						class="input-block-level" placeholder="Asunto">
					<textarea rows="6" id="noteContextInput" name="description"
						class="input-block-level" placeholder="Description"></textarea>
				</fieldset>
			</form>
			<div id="modalAddNoteMessage"></div>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
			<button class="btn btn-primary" onclick="addNoteToClient()">Enviar</button>
		</div>
	</div>
	<!-- FIN MODAL AGREGAR NOTA -->

	<!-- MODAL AGREGAR PROBLEMA -->
	<div id="modal-container-34733-agregarProblema" class="modal hide fade"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Agregar Problema</h3>
		</div>
		<div class="modal-body">
			<form>
				<fieldset>
					<input type="text" id="problemIdLabel" name="problemIdLabel"
						class="input-block-level" placeholder="Código CIE">
				</fieldset>
			</form>
			<div id="modalAddProblemMessage"></div>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
			<button class="btn btn-primary" onclick="addProblemClientRelation()">Enviar</button>
		</div>
	</div>
	<!-- FIN MODAL PROBLEMA -->

	<!-- MODAL BUSCARCLIENTEID -->
	<div id="modal-container-61345-buscarId" class="modal hide fade"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Buscar Cliente</h3>
		</div>
		<div class="modal-body">
			<strong>Información:</strong></br> A continuación deberá ingresar la
			cédula de identidad del cliente, para así poder acceder a sus datos.</br>
			</br>
			<form class="form-horizontal">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="cedula">Cédula:</label>
						<div class="controls">
							<input type="text" id="cedula" name="cedula" class=""
								placeholder="Cédula de Identidad">
						</div>
					</div>

				</fieldset>
			</form>
			<center>
				<i id="searchIdIcon" class=""></i>
			</center>

			<div id="modalSearchIdMessage"></div>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
			<button class="btn btn-primary" onclick="getClientById()">Buscar</button>
		</div>
	</div>

	<!-- FIN MODAL BUSCARCLIENTEID -->

	<!-- MODAL FaceRec SUBIRIMAGEN -->
	<div id="modal-container-71348-buscarImagen" class="modal hide fade"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Buscar Cliente</h3>
		</div>
		<div class="modal-body">
			<strong>Información:</strong></br> A continuación deberá seleccionar la
			imagen que desea subir al servidor para que esta sea procesada y
			analizada.</br> </br>
			<form class="form-horizontal">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="fileToUpload">Imagen:</label>
						<div class="controls">
							<input name="fileToUpload" id="fileToUpload" type="file" /><br />
						</div>
					</div>

				</fieldset>
			</form>
			<center>
				<i id="searchImageIcon" class=""></i>
			</center>

			<div id="modalSearchImageMessage"></div>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
			<button class="btn btn-primary" onclick="uploadAndSearchImage()">Buscar</button>
		</div>
	</div>
	<!-- FIN FaceRec SUBIRIMAGEN -->

	<!-- MODAL SUBIRHISTORIAL -->
	<div id="modal-container-71258-uploadRecord" class="modal hide fade"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Subir Historial</h3>
		</div>
		<div class="modal-body">

			<form class="form-horizontal">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="inputRecordInstitutionId">ID
							de institucion:</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="inputInstitutionId" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="file2">Archivo XML:</label>
						<div class="controls">
							<input name="file2" id="file2" type="file" /><br />
						</div>
					</div>
				</fieldset>
			</form>


			<div id="modalUploadRecordMessage"></div>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
			<button class="btn btn-primary" onclick="uploadRecordArchive()">Subir</button>
		</div>
	</div>
	<!-- FIN MODAL SUBIRHISTORIAL -->

	<!-- MODAL MISPACIENTES -->
	<div id="modal-container-215234-mispacientes" class="modal hide fade"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Mis Pacientes</h3>
		</div>
		<div class="modal-body">
			<center>
				<i class="icon-warning-sign icon-4x" style="color: black"></i></br>¿Está
				seguro de que desea cerrar la sesión y salir del sistema?
			</center>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
			<button class="btn btn-primary" onclick="uploadAndSearchImage()">Seleccionar</button>
		</div>
	</div>
	<!-- FIN MODAL MISPACIENTES -->

	<!-- MODAL CAMRECORDER -->
	<div id="modal-container-25123-recorder" class="modal hide fade"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Reconocimiento Facial</h3>
		</div>
		<div class="modal-body">
			<center>
				<video id="video" width="440" height="340" autoplay></video>
			</center>
			<div id="modalImageRecorderMessage"></div>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
			<button id="snapButton" class="btn btn-primary">Seleccionar</button>
		</div>
	</div>
	<!-- FIN MODAL CAMRECORDER -->

	<!-- OFFSCEEN -->
	<div id="offscreen" class="modal hide" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-body">
			<center>
				<canvas id="offScreenCanvas" width="440" height="340"></canvas>
			</center>
		</div>
	</div>
	<!-- OFFSCEEN -->

</body>
</html>