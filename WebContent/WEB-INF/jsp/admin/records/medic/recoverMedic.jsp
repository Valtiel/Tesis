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
            function doPostMedicAdd() {
                // get the form values
                var idMedic = $('#inputClientId').val();
                var firstName = $('#inputClientName').val();
                var lastName = $('#inputClientlastName').val();
                var birthDate = $('#inputClientBirthDate').val();
                var phoneNumber = $('#inputClientPhoneNumber').val();
                var email = $('#inputClientEmail').val();
                var address = $('#inputClientAddress').val();

                $.ajax({
                    type: "POST",
                    url: "/MedicApp/medic/add.htm",
                    data: "idClient=" + idMedic + "&firstName=" + firstName
                            + "&lastName=" + lastName + "&birthDate=" + birthDate + "&phoneNumber=" + phoneNumber
                            + "&email=" + email + "address=" + address,
                    success: function(response) {
                        // we have the response
                        if (response.status == "SUCCESS") {
                            $('#alertAddClient').removeClass("alert-error");
                            $('#alertAddClient').addClass("alert-success");
                            $('#alertAddClient').html(" Registro Exitoso :)");
                            $('#inputClientName').val('');
                            $('#inputClientLastName').val('');
                            $('#inputClientBirthDate').val('');
                            $('#inputClientPhoneNumber').val('');
                            $('#inputClientEmail').val('');
                            $('#inputClientAddress').val('');
                            $('#inputClientBloodType').val('');
                            $('#inputClientSex').val('');
                            $('#inputClientId').val('');
                            $('#inputClientOccupation').val('');
                            $('#inputClientHeight').val('');

                        } else {
                            $('#alertAddClient').removeClass("alert-success");
                            $('#alertAddClient').addClass("alert-error");
                            $('#alertAddClient').html("Registro fallido: Hay un error con los datos.<ul><li>" + response.text) + "</li></ul>";


                        }
                    },
                    error: function(e) {
                        alert('Error: ' + e);
                    }
                });
            }
            /*
             function Clean() {
             $('#inputClientName').val('');
             $('#inputClientLastName').val('');
             $('#inputClientBirthDate').val('');
             $('#inputClientPhoneNumber').val('');
             $('#inputClientEmail').val('');
             $('#inputClientAddress').val('');
             $('#inputClientBloodType').val('');
             $('#inputClientSex').val('');
             $('#inputClientId').val('');
             $('#inputClientOccupation').val('');
             $('#inputClientHeight').val('');
             }
             */

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
                                        <label class="control-label" for="inputClientId">Cedula:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge" id="inputClientId" />
                                        </div>
                                    </div>		




                                    <div class="form-actions">
                                        <button type="button" class="btn btn-primary" onclick="doPostMedicAdd()"><i class="icon-save icon-large"></i> Guardar</button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div class="span4">
                            <div class="media well">
                                <a href="#" class="pull-left"><i
                                        class="icon-group icon-4x"></i></a>
                                <div class="media-body">
                                    <h4 class="media-heading">Nuevo Registro</h4>
                                    Llena el siguiente formulario para poder realizar el registro de
                                    un nuevo usuario en el sistema.
                                </div>
                            </div>
                            <div class="alert" id="alertAddClient">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>