<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Clientes</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="tabbable" id="tabs-825696">
                        <ul class="nav nav-tabs">
                        
                            <li class="active"><a href="#panel-648417" data-toggle="tab"><i
                                        class="icon-plus icon-large"></i>Nuevo Cliente</a></li>
                            <li><a href="#panel-164864" data-toggle="tab"><i
                                        class="icon-search icon-large"></i>Buscar Cliente</a></li>
                                         <li><a href="#panel-164869" data-toggle="tab"><i
                                        class="icon-camera icon-large"></i>Fotos Cliente</a></li>

                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active fade in" id="panel-648417">

                                <%@include file="addClient.jsp"%>

                            </div>
                            <div class="tab-pane fade in" id="panel-164864">
                                <%@include file="searchClient.jsp"%>
                            </div>
                            <div class="tab-pane fade in" id="panel-164865">
                                <%@include file="editClient.jsp"%>
                            </div>
                             <div class="tab-pane fade in" id="panel-164869">
                                <%@include file="pictureClient.jsp"%>
                            </div>


                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>