<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-	Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
        </script>
        <script type="text/javascript"
                src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">

        </script>

        <script type="text/javascript">
            function doPostClientAdd() {
                // get the form values
                var idClient = $('#inputClientId').val();
                var firstName = $('#inputClientName').val();
                var lastName = $('#inputClientLastName').val();
                var picker = $('#datetimepicker4').data('datetimepicker');
                var birthDate=picker.getDate();
                var phoneNumber = $('#inputClientPhoneNumber').val();
                var email = $('#inputClientEmail').val();
                var address = $('#inputClientAddress').val();
                var bloodType = encodeURIComponent($('#inputClientBloodType').val());
                var occupation = $('#inputClientOccupation').val();
                var height = $('#inputClientHeight').val();
                var sex = $('#inputClientSex').val();
                var nation = $('#inputClientNation').val();
             //   alert('Error: ' + nation );

               
               sAlert1 = "Debe Ingresar el ID del usuario";
				sAlert2 = "Debe Ingresar un nombre de usuario";
				sAlert3 = "Direccion de Correo invalido";
				sAlert4 = "Debe Ingresar el apellido";
				sAlert5 = "Debe Ingresar la fecha de nacimiento";
				sAlert6 = "Debe Ingresar el numero telefonico";
				sAlert7 = "Debe Ingresar ingresar la direccion";
				sAlert8 = "Debe Ingresar el tipo de sangre";
				sAlert9 = "Debe Ingresar la profesion";
				sAlert10 = "Debe Ingresar la altura";
				sAlert11= "Debe Ingresar el sexo";
          
					if (idClient == "")
					{
  						alert(sAlert1);
  							return (false);
									}
							if (firstName == "")
							{
  								alert(sAlert2);
  									return (false);
							}
						
						
							if (lastName == "")
							{
  								alert(sAlert4);
  									return (false);
							}
							
							if (birthDate == "")
							{
  								alert(sAlert5);
  									return (false);
							}
							
							if (phoneNumber == "")
							{
  								alert(sAlert6);
  									return (false);
							}
							
							if (email == "" || email.indexOf ('@', 0) < 1 || email.indexOf ('.', 0) < 1)
							{
									alert(sAlert3);
										return (false);
							}
							
							if (address == "")
							{
  								alert(sAlert7);
  									return (false);
							}
							
							if (bloodType == "")
							{
  								alert(sAlert8);
  									return (false);
							}
							
							if (occupation == "")
							{
  								alert(sAlert9);
  									return (false);
							}
							if (height == "")
							{
  								alert(sAlert10);
  									return (false);
							}
							if (sex == "")
							{
  								alert(sAlert11);
  									return (false);
							}
               

               
                $.ajax({
                    type: "POST",
                    url: "/MedicApp/client/add.htm",
                    data: "idClient=" + idClient + "&firstName=" + firstName
                            + "&lastName=" + lastName + "&birthDate=" + birthDate
                            + "&phoneNumber=" + phoneNumber + "&email=" + email
                            + "&address=" + address + "&bloodType=" + bloodType
                            + "&occupation=" + occupation + "&height=" + height
                            + "&sex=" + sex + "&citizenship=" + nation,
                    success: function(response) {
                        // we have the response
                        //alert(response);
                       // alert("Dentro del Ajax");
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
                            //$('#inputClientSex').val('');
                            $('#inputClientId').val('');
                            $('#inputClientOccupation').val('');
                            $('#inputClientHeight').val('');

                        } else {
                        	//alert("Error con Ajax");
                            $('#alertAddClient').removeClass("alert-success");
                            $('#alertAddClient').addClass("alert-error");
                            $('#alertAddClient').html(
                                    "Registro fallido: Hay un error con los datos.<ul><li>"
                                    + response.text)
                                    + "</li></ul>";

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
//Solo nÃƒÂºmeros
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
       letras = " ÃƒÂ¡ÃƒÂ©ÃƒÂ­ÃƒÂ³ÃƒÂºabcdefghijklmnÃƒÂ±opqrstuvwxyz";
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
                                    <div class="control-group">
                                        <label class="control-label" for="inputClientId">Cedula:</label>
                                        <div class="controls">
                                        	<select class="span3" id="inputClientNation" name="inputClientNation">
											
											<option>V</option>
											<option>E</option>
											</select>
                                            <input type="text" class="span8" id="inputClientId" placeholder="Ej: 20380444" onkeypress="return acceptNum(event)" />
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="inputClientName">Nombre:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge" id="inputClientName" placeholder="Ej: Jose" maxlength="30" onkeypress="return soloLetras(event)"/>
                                        </div>
                                    </div>


                                    <div class="control-group">
                                        <label class="control-label" for="inputClientLastName">Apellido:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputClientLastName" placeholder="Apellido" maxlength="30" onkeypress="return soloLetras(event)"/>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="inputClientBirthDate">Nacimiento:</label>
                                        <div class="controls">
                                            
                                        
  										<div id="datetimepicker4" class="input-append">
    									<input data-format="yyyy-MM-dd" type="text" id="inputClientBirthDate" name="inputClientBirthDate"></input>
   										 <span class="add-on">
    									 <i data-time-icon="icon-time" data-date-icon="icon-calendar">
     										 </i>
   												 </span>
  													</div>
  													
														
										<script type="text/javascript">
 										 $(function() {
   											 $('#datetimepicker4').datetimepicker({
    											  pickTime: false
   													 });
  														});
													</script>           
                                                   
                                                   
                                                   
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="inputClientPhoneNumber">Telefono:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputClientPhoneNumber" placeholder="Ej: 0414123456" maxlength="12" onkeypress="return acceptNum(event)"/>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="inputClientEmail" >Email:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge" id="inputClientEmail" placeholder="test@ejemplo.com" maxlength="25" />
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="inputClientAddress">Vivienda:</label>
                                        <div class="controls">
                                            <textarea class="input-xlarge" id="inputClientAddress" rows="2" maxlength="200"/>
                                            </textarea>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="inputClientBloodType">Tipo
                                            de Sangre:</label>
                                        <div class="controls">
                                        
                                        
                                        <select id="inputClientBloodType" name="inputClientBloodType">
										
										<option></option>
										<option>O-</option>
										<option>O+</option>
										<option>A-</option>
										<option>A+</option>
										<option>B-</option>
										<option>B+</option>
										<option>AB-</option>
										<option>AB+</option>
										</select>
         
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="inputClientHeight">Altura:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge" id="inputClientHeight" maxlength="4" />
                                        </div>
                                    </div>


                                    <div class="control-group">
                                        <label class="control-label" for="inputClientSex">Sexo:</label>
                                        <div class="controls">
                                            
                                            
                                           <label class="radio">
											<input type="radio" name="inputClientSex" id="inputClientSex" value="M">
											Masculino
											</label>
											
											<label class="radio">
											<input type="radio" name="inputClientSex" id="inputClientSex" value="F">
											Femenino
											</label> 
                                            
                                        </div>
                                    </div>



                                    <div class="control-group">
                                        <label class="control-label" for="inputClientOccupation">Ocupacion:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge"
                                                   id="inputClientOccupation" onkeypress="return soloLetras(event)" />
                                        </div>
                                    </div>

                                    <div class="form-actions">
                                        <button type="button" class="btn btn-primary"
                                                onclick="doPostClientAdd()">
                                            <i class="icon-save icon-large"></i> Guardar
                                        </button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div class="span4">
                            <div class="media well">
                                <a href="#" class="pull-left"><i class="icon-group icon-4x"></i></a>
                                <div class="media-body">
                                    <h4 class="media-heading">Nuevo Registro</h4>
                                    Llena el siguiente formulario para poder realizar el registro de
                                    un nuevo cliente.
                                </div>
                            </div>
                            <div class="alert" id="alertAddClient"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>