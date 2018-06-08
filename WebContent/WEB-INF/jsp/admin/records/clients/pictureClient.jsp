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
        function uploadFormDataB(){ 
    
        		var clientId = $('#inClientId').val();
                var file3=document.getElementById('file3');
        		var oMyForma = new FormData();
        		oMyForma.append("archive",  file3.files[0]);
        		oMyForma.append("clientId", clientId);
        	//	alert("HOLA :D"+file3.files[0]);
        		$.ajax({
        			url : '/MedicApp/ClientImages/file.htm',
        			data : oMyForma,
        			dataType : 'text',
        			processData : false,
        			contentType : false,
        			type : 'POST',
        			success : function(data) {
        				//  $('#result').html(data+ " uploaded by FormData!");
        				alert(data);
        				$('#result').html(data);

        			},
        			error: function(e) {
                        alert('Error: ' + e);
                    }
        		});
        	}
        	
        	function uploadJqueryForm(){
        	    $('#result').html('');
        	 
        	   $("#form2").ajaxForm({
        	    success:function(data) { 
        	          $('#result').html(data);
        	     },
        	     dataType:"text"
        	   }).submit();
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
                                        <label class="control-label" for="inClientId">Cedula:</label>
                                        <div class="controls">
                                            <input type="text" class="input-xlarge" id="inClientId" />
                                        </div>
                                    </div>

								        <div class="control-group">
                                        <label class="control-label" for="file3">Imagen:</label>
                                        <div class="controls">
                                             <input name="file3" id="file3" type="file" /><br/>
                                        </div>
                                        </div>



                                    <div class="form-actions">
                                        <button type="button" class="btn btn-primary"
                                                onclick="uploadFormDataB()">
                                            <i class="icon-save icon-large"></i> Guardar
                                        </button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div class="span4">
                            <div class="media well">
                                <a href="#" class="pull-left"><i class="icon-camera icon-4x"></i></a>
                                <div class="media-body">
                                    <h4 class="media-heading">Nuevo Registro</h4>
                                    Llena el siguiente formulario para poder realizar el registro de
                                    imagenes para un cliente, esto se utilizará para el reconocimiento facial.
                                </div>
                            </div>
                            <div class="alert" id="alertB"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>