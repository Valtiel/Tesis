<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>

        <script type='text/javascript'
        src="http://datatables.net/media/blog/bootstrap_2/DT_bootstrap.js"></script>
        <link
            href="http://datatables.net/media/blog/bootstrap_2/DT_bootstrap.css"
            rel="stylesheet">
        <script>
            $(document)
                    .ready(
                    function() {
                        $('#tableDrugSearch')
                                .dataTable(
                                {
                                    "sAjaxSource": "/MedicApp/drug/listAll.htm",
                                    "fnServerData": function(sSource, aoData, fnCallback) {
                                        aoData.push({"name": "widget", "value": "token"});

                                        request = $.ajax({
                                            "dataType": 'json',
                                            "type": "GET",
                                            "url": sSource,
                                            "data": aoData,
                                            "success": fnCallback
                                        });
                                    },
                                    "aoColumns": [
                                        {"mDataProp": "drugName"},
                                        {"mDataProp": "idDrug"},
                                    ],
                                    "oLanguage": {
                                        "sProcessing": "Procesando...",
                                        "sLengthMenu": "Mostrar _MENU_ registros",
                                        "sZeroRecords": "No se encontraron resultados",
                                        "sEmptyTable": "Ningún dato disponible en esta tabla",
                                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                                        "sInfoPostFix": "",
                                        "sSearch": "Buscar:",
                                        "sUrl": "",
                                        "sInfoThousands": ",",
                                        "sLoadingRecords": "Cargando...",
                                        "oPaginate": {
                                            "sFirst": "Primero",
                                            "sLast": "Último",
                                            "sNext": "Siguiente",
                                            "sPrevious": "Anterior"
                                        },
                                        "oAria": {
                                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                        }

                                    }
                                });

                    });
        </script>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <center>
                        <legend> Consulta Dinámica </legend>
                    </center>
                    <table class="table table-bordered table-condensed table-hover"
                           id="tableDrugSearch">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Número CAS</th>
                            </tr>
                        </thead>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>