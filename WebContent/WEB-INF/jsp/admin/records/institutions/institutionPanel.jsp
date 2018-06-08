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
                    <div class="tabbable" id="tabs-2825696">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#panel-2648417" data-toggle="tab"><i
                                        class="icon-plus icon-large"></i>Nueva Institución</a></li>
                            <li><a href="#panel-2164864" data-toggle="tab"><i
                                        class="icon-search icon-large"></i>Buscar Institución</a></li>
                            
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active fade in" id="panel-2648417">
                                <%@include file="addInstitution.jsp"%>
                            </div>
                            <div class="tab-pane fade in" id="panel-2164864">
                                <%@include file="searchInstitution.jsp"%>
                            </div>
                            <div class="tab-pane fade in" id="panel-2164865">
                                <%@include file="editInstitution.jsp"%>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>