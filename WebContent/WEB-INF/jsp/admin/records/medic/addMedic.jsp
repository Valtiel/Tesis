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
        <script src="http://reactiveraven.github.com/jqBootstrapValidation/js/jqBootstrapValidation.js"></script>
        
         <script>
            $(function() {
                $("input,textarea,select").jqBootstrapValidation(
                    {
                        preventSubmit: true,
                        submitError: function($form, event, errors) {
                            // Here I do nothing, but you could do something like display 
                            // the error messages to the user, log, etc.
                        },
                        submitSuccess: function($form, event) {
                            alert("OK");
                            event.preventDefault();
                        },
                        filter: function() {
                            return $(this).is(":visible");
                        }
                    }
                );
            });
        </script>

        <script>
            function doPostMedicAddB() {
                // get the form values
               // alert("post");
                var idMedic = $('#inputMedicId').val();
                var medicFirstName = $('#inputMedicName').val();
                var medicLastName = $('#inputMedicLastName').val();
                var medicBirthDate = $('#inputMedicBirthDate').val();
                var medicPhoneNumber = $('#inputMedicPhoneNumber').val();
                var medicEmail = $('#inputMedicEmail').val();
                var medicAddress = $('#inputMedicAddress').val();
                var username = $('#inputMedicUser').val();
                var password = $('#inputMedicPassword').val();
                var password2 = $('#inputMedicPassword2').val();
               // alert('Error: ' + idMedic );
                
            	if (password == password2)
				{
						alert("Excelente");
							//return (false);
								}

                $.ajax({
                    type: "POST",
                    url: "/MedicApp/medic/add.htm",
                    data: "idMedic=" + idMedic + "&firstName=" + medicFirstName
                            + "&lastName=" + medicLastName + "&phoneNumber="  + medicPhoneNumber
                            + "&email=" + medicEmail + "&address=" + medicAddress+ "&username=" + username+ "&password=" + password,
                    success: function(response) {
                    	alert("ajax");
                        // we have the response
                        if (response.status == "SUCCESS") {
                            alert("creado");
                        } else {
                        	alert("fallo");
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
        
        
<script language="javascript">
//Solo números
	<!--
	    var nav4 = window.Event ? true : false;
	    function acceptNum(evt)
	    {
	        // NOTE: Backspace = 8, Enter = 13, '0' = 48, '9' = 57
	        var key = nav4 ? evt.which : evt.keyCode;
	        return (key <= 13 || (key >= 48 && key <= 57));
	    }
	//-->
	</script>
	
	<script>
	//Solo letras
    function soloLetras(e){
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
       especiales = [8,37,39,46];

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
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
                                    <div class="control-group" id="validators_required_preview">                
                                        <label class="control-label" for="inputMedicId">Cedula:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge" id="inputMedicId" placeholder="Ej: 20380444" onkeypress="return acceptNum(event)" maxlength="15" required="asd" />
                                        </div>
                                    </div>		

                                    <div class="control-group">
                                        <label class="control-label" for="inputMedicName">Nombre:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge" id="inputMedicName" placeholder="Ej: Jose" maxlength="30" onkeypress="return soloLetras(event)"/>
                                        </div>
                                    </div>				


                                    <div class="control-group">
                                        <label class="control-label" for="inputMedicLastName">Apellido:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge" id="inputMedicLastName" placeholder="Ej: Oberto" maxlength="30" onkeypress="return soloLetras(event)" />
                                        </div>
                                    </div>					

                                    <div class="control-group">
                                        <label class="control-label" for="inputMedicBirthDate">Nacimiento:</label>
                                        <div class="controls">
                                    	
                                    	<div id="datetimepicker5" class="input-append">
    									<input data-format="yyyy-MM-dd" type="text" id="inputMedicBirthDate" name="inputMedicBirthDate"></input>
   										 <span class="add-on">
    									 <i data-time-icon="icon-time" data-date-icon="icon-calendar">
     										 </i>
   												 </span>
  													</div>
  													
														
										<script type="text/javascript">
 										 $(function() {
   											 $('#datetimepicker5').datetimepicker({
    											  pickTime: false
   													 });
  														});
													</script>           
                                                   
                                                   
                                                   
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="inputMedicPhoneNumber">Telefono:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge" id="inputMedicPhoneNumber" placeholder="Ej: 0414123456" maxlength="12" onkeypress="return acceptNum(event)" />
                                        </div>
                                    </div>			

                                    <div class="control-group">
                                        <label class="control-label" for="inputMedicEmail">Email:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge" id="inputMedicEmail" placeholder="test@ejemplo.com" maxlength="40"/>
                                        </div>
                                    </div>		

                                    <div class="control-group">
                                        <label class="control-label" for="inputMedicAddress">Vivienda:</label>
                                        <div class="controls">
                                            <textarea class="input-xlarge" id="inputMedicAddress" rows="2" maxlength="200"/>
                                            </textarea>
                                        </div>
                                    </div>		
                                      <div class="media well">
                                      <div class="control-group">
                                        <label class="control-label" for="inputMedicUser">Usuario:</label>
                                        <div class="controls">
                                         <div class="input-prepend">
                                        <span class="add-on"><i class="icon-user"></i></span>
                                            <input type="text" class="input-xlarge" id="inputMedicUser" placeholder="Ej: Joberto" maxlength="10" onkeypress="return soloLetras(event)" />
                                        </div>
                                    </div>	</div>

									  <div class="control-group">
                                        <label class="control-label" for="inputMedicPassword">Contraseña:</label>
                                        <div class="controls">
                                        <div class="input-prepend">
                                        <span class="add-on"><i class="icon-lock"></i></span>
                                         
                                        
                                            <input type="password" class="input-xlarge" id="inputMedicPassword" placeholder="Contraseña" maxlength="15" />
                                        </div>
                                    </div>	</div>
                                    
                                    
                                     <div class="control-group">
                                        <label class="control-label" for="inputMedicPassword2"> Verificar Contraseña:</label>
                                        <div class="controls">
                                        <div class="input-prepend">
                                        <span class="add-on"><i class="icon-lock"></i></span>
                                            <input type="password" class="input-xlarge" id="inputMedicPassword2" placeholder="Repetir contraseña" maxlength="15" />
                                        </div>
                                    </div>	
 									 </div>	
                                    </div>
                                    
                                    

                                    <div class="form-actions">
                                        <button type="button" class="btn btn-primary" onclick="doPostMedicAddB()"><i class="icon-save icon-large"></i> Guardar</button>
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
                            <div class="alert" id="alertAddMedic">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>