<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript">
            function doPostDrugAdd() {
                // get the form values
                // get the form values
                var name = $('#inputDrugName').val();
                var id = $('#inputDrugId').val();
                console.log("ALERT"+name);
                $.ajax({
                    type: "POST",
                    url: "/MedicApp/drug/add.htm",
                    data: "drugName=" + name + "&idDrug=" + id,
                    success: function(response) {
                        // we have the response
                        if (response.status == "SUCCESS") {
                        	console.log("ALERT"+name);
                            $('#alertAddDrugs').removeClass("alert-error");
                            $('#alertAddDrugs').addClass("alert-success");
                            $('#alertAddDrugs').html(" Registro Exitoso :) <br>" +
                                    "");
                            $('#inputDrugName').val('');
                            $('#inputDrugId').val('');
                        } else {
                        	console.log("ALERT"+name);
                            $('#alertAddDrugs').removeClass("alert-success");
                            $('#alertAddDrugs').addClass("alert-error");
                            $('#alertAddDrugs').html("Registro fallido: Hay un error con los datos." + response.text);
                        }
                    },
                    error: function(e) {
                        alert('Error: ' + e);
                    }
                });
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
                                        <label class="control-label" for="inputDrugName">Nombre:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputDrugName" />
                                            <p class="help-block">Ej: Loratadina</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputDrugId">Número CAS (id):</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputDrugId" />
                                            <p class="help-block">Ej: 79794-75-5 </p>
                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <button type="button" class="btn btn-primary" onclick="doPostDrugAdd()"><i class="icon-save icon-large"></i> Guardar</button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div class="span4">
                            <div class="media well">
                                <a href="#" class="pull-left"><i
                                        class="icon-medkit icon-4x"></i></a>
                                <div class="media-body">
                                    <h4 class="media-heading">Nuevo Registro</h4>
                                    Llena el siguiente formulario para poder realizar el registro de
                                    un nuevo medicamento en la Base de Datos del Sistema.
                                </div>
                            </div>
                            <div class="alert" id="alertAddDrugs">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>