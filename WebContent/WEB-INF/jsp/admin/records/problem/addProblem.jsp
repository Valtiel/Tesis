<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        
        <script type="text/javascript">
           
        function doPostProblemAdd() {
                // get the form values
                var idProblem = $('#inputProblemId').val();
                var problemName = $('#inputProblemName').val();
                var description = $('#inputProblemDescription').val();
				console.log("Verificando doPostProblemAdd");

                $.ajax({
                    type: "POST",
                    url: "/MedicApp/problem/add",
                    data: "idProblem=" + idProblem + "&problemName=" + problemName
                            + "&description=" + description, 
                    success: function(response) {
                        // we have the response
                        				console.log("Verificando doPostProblemAdd response");

                        if (response.status == "SUCCESS") {
            				console.log("Verificando doPostProblemAdd if");

                            $('#alertProblem').removeClass("alert-error");
                            $('#alertProblem').addClass("alert-success");
                            $('#alertProblem').html(" Registro Exitoso :)");
                            $('#inputProblemName').val('');
                            $('#inputProblemId').val('');
                            $('#inputProblemDescription').val('');
                        } else {
            				console.log("Verificando doPostProblemAdd else");

                            $('#alertProblem').removeClass("alert-success");
                            $('#alertProblem').addClass("alert-error");
                            $('#alertProblem').html("Registro fallido: Hay un error con los datos.<ul><li>" + response.text) + "</li></ul>";
                        }
                    },
                    error: function(e) {
                        alert('Error: ' + e);
                    }
                });
            }

            function Clean() {
                $('#inputProblemName').val('');
                $('#inputProblemId').val('');
                $('#inputProblemDescription').val('');
            }
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="row-fluid">
                        <div class="span8">
                            <form class="form-horizontal">
                                <fieldset>
                                    <legend>Formulario</legend>
                                    
                                    <div class="control-group">
                            		 <label class="control-label" for="inputProblemName">Nombre:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputProblemName" />
                                            <p class="help-block">Ej: Cólera</p>
                                        </div>
                                    </div>

                                    <div class="control-group">
                            		 <label class="control-label" for="inputProblemId">ID:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputProblemId" />
                                            <p class="help-block">Ej: A00</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputProblemDescription">Descripción:</label>
                                        <div class="controls">
                                            <textarea class="input-xlarge" id="inputProblemDescription"
                                                      rows="3"></textarea>
                                            <p class="help-block">Ej: El cólera es una enfermedad aguda, diarreica, provocada por la Bacteria Vibrio cholerae, 
                                            la cual se manifiesta como una infección intestinal.</p>
                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <button type="button" class="btn btn-primary" onclick="doPostProblemAdd()"><i class="icon-save icon-large"></i> Guardar</button>
                                        <button type="button" class="btn btn-primary" onclick="Clean()"><i class="icon-delete icon-large"></i>Limpiar</button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        
                      		  <div class="span4">
                            <div class="media well">
                                <a href="#" class="pull-left"><i
                                        class="icon-heart icon-4x"></i></a>
                                <div class="media-body">
                                    <h4 class="media-heading">Nuevo Registro</h4>
                                    Llena el siguiente formulario para poder realizar el registro de
                                    un nuevo problema.
                                </div>
                            </div>
                            <div class="alert" id="alertProblem">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>