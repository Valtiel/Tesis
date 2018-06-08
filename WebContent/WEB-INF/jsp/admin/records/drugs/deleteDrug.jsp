<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
        </script>
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
        </script>

        <script type="text/javascript">
            function doPostDrugAdd() {
                // get the form values
                // get the form values
                var id = $('#inputDrugId').val();
                $.ajax({
                    type: "POST",
                    url: "/MedicApp/drug/add.htm",
                    data: "&idDrug=" + id,
                    success: function(response) {
                        // we have the response
                        if (response.status == "SUCCESS") {
                            $('#alertAddDrugs').removeClass("alert-error");
                            $('#alertAddDrugs').addClass("alert-success");
                            $('#alertAddDrugs').html(" Registro Exitoso :) <br>" +
                                    "The User Details are as follws : <br> Name : "
                                    + response.result.name + " <br> Education : " + response.result.address);
                            $('#inputDrugName').val('');
                            $('#inputDrugId').val('');
                        } else {
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
                                        <label class="control-label" for="inputDrugId">Número CAS (id):</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputDrugId" />
                                            <p class="help-block">Ej: 79794-75-5 </p>
                                        </div>
                                    </div>            
                                    <div class="form-actions">
                                        <button type="button" class="btn btn-primary" onclick="doPostdrug()"><i class="icon-save icon-large"></i> Borrar</button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div class="span4">
                            <div class="media well">
                                <a href="#" class="pull-left"><i
                                        class="icon-hospital icon-4x"></i></a>
                                <div class="media-body">
                                    <h4 class="media-heading">Borrar Registro</h4>
                                    Debe ingresar el Número CAS para un borrado exitoso
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