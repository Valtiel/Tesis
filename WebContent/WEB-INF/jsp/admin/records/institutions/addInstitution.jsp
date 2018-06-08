<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript">
            function doPostInstitutionAdd() {
                // get the form values
                var name = $('#inputInstitutionName').val();
                var address = $('#inputInstitutionAddress').val();
                var number = $('#inputInstitutionNumber').val();
                var url = $('#inputInstitutionURL').val();
                var rif = $('#inputInstitutionRIF').val();

                $.ajax({
                    type: "POST",
                    url: "/MedicApp/institution/add.htm",
                    data: "name=" + name + "&idInstitution=" + rif
                            + "&address=" + address + "&webPage=" + url + "&phoneNumber=" + number,
                    success: function(response) {
                        // we have the response
                        if (response.status == "SUCCESS") {
                            $('#alert').removeClass("alert-error");
                            $('#alert').addClass("alert-success");
                            $('#alert').html(" Registro Exitoso :)");
                            $('#inputInstitutionName').val('');
                            $('#inputInstitutionAddress').val('');
                            $('#inputInstitutionNumber').val('');
                            $('#inputInstitutionURL').val('');
                            $('#inputInstitutionRIF').val('');

                        } else {
                            $('#alert').removeClass("alert-success");
                            $('#alert').addClass("alert-error");
                            $('#alert').html("Registro fallido: Hay un error con los datos.<ul><li>" + response.text) + "</li></ul>";

                        }
                    },
                    error: function(e) {
                        alert('Error: ' + e);
                    }
                });
            }



            function Clean() {
                $('#inputInstitutionName').val('');
                $('#inputInstitutionAddress').val('');
                $('#inputInstitutionNumber').val('');
                $('#inputInstitutionURL').val('');
                $('#inputInstitutionRIF').val('');
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
                                        <label class="control-label" for="inputInstitutionName">Nombre:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputInstitutionName" />
                                            <p class="help-block">Ej: Hospital Universitario del Zulia</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputInstitutionAddress">Dirección:</label>
                                        <div class="controls">
                                            <textarea class="input-xlarge" id="inputInstitutionAddress"
                                                      rows="3"></textarea>
                                            <p class="help-block">Ej: Avenida 16 Guajira, via a
                                                Ziruma, frente a antiguo Rectorado LUZ Avenida 16, 
                                                Maracaibo</p>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputInstitutionNumber">Contacto:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputInstitutionNumber" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputInstitutionURL">URL:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputInstitutionURL" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="inputInstitutionRIF">RIF (id):</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputInstitutionRIF" />
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <button type="button" class="btn btn-primary" onclick="doPostInstitutionAdd()"><i class="icon-save icon-large"></i> Guardar</button>
                                        <button type="button" class="btn btn-primary" onclick="Clean()"><i class="icon-delete icon-large"></i>Limpiar</button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div class="span4">
                            <div class="media well">
                                <a href="#" class="pull-left"><i
                                        class="icon-hospital icon-4x"></i></a>
                                <div class="media-body">
                                    <h4 class="media-heading">Nuevo Registro</h4>
                                    Llena el siguiente formulario para poder realizar el registro de
                                    una nueva Institución Médica en la Base de Datos del Sistema.
                                </div>
                            </div>
                            <div class="alert" id="alert">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>