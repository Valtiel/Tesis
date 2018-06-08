<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript">
           
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
                                        <button type="button" class="btn btn-primary" onclick="doPostDrugAdd()"><i class="icon-save icon-large"></i> Editar</button>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div class="span4">
                            <div class="media well">
                                <a href="#" class="pull-left"><i
                                        class="icon-medkit icon-4x"></i></a>
                                <div class="media-body">
                                    <h4 class="media-heading">Editar Registro</h4>
                                    Llena el siguiente formulario para poder edirtar un registro,
                                    Recuerde que el id debe coincidir para una edicion exitosa. 
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