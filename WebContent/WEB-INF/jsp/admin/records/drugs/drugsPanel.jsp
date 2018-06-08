<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="tabbable" id="tabs-2825">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#panel-2648" data-toggle="tab"><i
                                        class="icon-plus icon-large"></i>Nuevo Medicamento</a></li>
                            <li><a href="#panel-21641" data-toggle="tab"><i
                                        class="icon-search icon-large"></i>Buscar Medicamento</a></li>
                            <li><a href="#panel-26421" data-toggle="tab"><i
                                        class="icon-pencil icon-large"></i>Editar Medicamento</a></li>

                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active fade in" id="panel-2648">
                                <%@include file="addDrug.jsp"%>
                            </div>
                            <div class="tab-pane fade in" id="panel-21641">
                                <%@include file="searchDrug.jsp"%>
                            </div>
                            <div class="tab-pane fade in" id="panel-26421">
                                <%@include file="editDrug.jsp"%>
                            </div>


                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>