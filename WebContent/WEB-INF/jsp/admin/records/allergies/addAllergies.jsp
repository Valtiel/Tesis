<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript">

            function doPostAllergieAdd() {
                // get the form values
                // get the form values
                var allergieId = $('#inputAllergieId').val();
                var allergieDescription = $('#inputAllergieDescription').val();
                $.ajax({
                    type: "POST",
                    url: "/MedicApp/allergy/add.htm",
                    data: "ID=" + allergieId + "&description=" + allergieDescription,
                    success: function(response) {
                        // we have the response
                        if (response.status == "SUCCESS") {
                            $('#alertAddAllergies').removeClass("alert-error");
                            $('#alertAddAllergies').addClass("alert-success");
                            $('#alertAddAllergies').html("Registro Exitoso");
                            $('#inputAllergieId').val('');
                            $('#inputAllergieDescription').val('');
                        } else {
                            $('#alertAddAllergies').removeClass("alert-success");
                            $('#alertAddAllergies').addClass("alert-error");
                            $('#alertAddAllergies').html("Registro fallido: Hay un error con los datos." + response.text);
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
                                        <label class="control-label" for="inputAllergieId">ID:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputAllergieId" />
                                            <p class="help-block">Ej: 444555</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputAllergieDescription">Descripcion:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputAllergieDescription" />
                                            <p class="help-block">Ej: Alergia al Maní</p>
                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <button type="button" class="btn btn-primary" onclick="doPostAllergieAdd()"><i class="icon-save icon-large"></i> Guardar</button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div class="span4">
                            <div class="media well">
                                <a href="#" class="pull-left"><i
                                        class="icon-exclamation-sign icon-4x"></i></a>
                                <div class="media-body">
                                    <h4 class="media-heading">Nuevo Registro</h4>
                                    Llena el siguiente formulario para poder realizar el registro de
                                    una nueva alergia en la base de datos.
                                </div>
                            </div>

                            <div class="alert" id="alertAddAllergies">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>