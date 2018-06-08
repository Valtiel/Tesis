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
                    <div class="tabbable" id="tabs-2829">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#panel-264885" data-toggle="tab"><i
                                        class="icon-plus icon-large"></i>Nueva Alergia</a></li>

                            <li><a href="#panel-264886" data-toggle="tab"><i
                                        class="icon-search icon-large"></i>Buscar Alergia</a></li>

                            <li><a href="#panel-264887" data-toggle="tab"><i
                                        class="icon-pencil icon-large"></i>Editar Alergia</a></li>


                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active fade in" id="panel-264885">
                                <%@include file="addAllergies.jsp"%>
                            </div>
                            <div class="tab-pane fade in" id="panel-264886">
                                <%@include file="searchAllergies.jsp"%>
                            </div>
                            <div class="tab-pane fade in" id="panel-264887">
                                <%@include file="editAllergies.jsp"%>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
</html>