<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <head>
        <script type='text/javascript'
        src='http://code.jquery.com/jquery-1.8.3.js'></script>
        <link rel="stylesheet" type="text/css"
              href="//netdna.bootstrapcdn.com/bootswatch/2.3.1/cerulean/bootstrap.min.css">
        <script type='text/javascript'
        src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js"></script>
        <script type='text/javascript'
        src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.js"></script>
        <script type='text/javascript'
        src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>

        <link
            href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css"
            rel="stylesheet">
        <link
            href="//netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css"
            rel="stylesheet">
        <style type='text/css'>
            body {
                padding-top: 80px;
                background-attachment: fixed;
            }

            #content {
                margin-left: 0;
            }

            }
            .sidebar-nav {
                padding: 9px 0px;
            }

            .sidebar-nav-fixed {
                position: fixed;
                left: 0px;
                top: 35px;
                bottom: -20px;
                width: 14.2%;
            }

            @media ( max-width : 767px) {
                .sidebar-nav-fixed {
                    width: auto;
                    left: 2px;
                }
            }

            @media ( max-width : 979px) {
                .sidebar-nav-fixed {
                    position: static;
                    width: auto;
                    top: 70px;
                }
            }

            /* for demo purposes (fixed top navbar placement in the fiddle. Ok to remove */
            @media ( max-width : 767px) {
                body {
                    padding-top: 0;
                }
            }

            @media ( max-width : 979px) {
                body {
                    padding-top: 0;
                }
            }

            body,input,button,select,textarea,.navbar-search .search-query {
                font-family: "HelveticaNeue-Light", "Helvetica Neue Light",
                    "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
            }
        </style>

        <script>
            jQuery(function($) {
                $("a").tooltip()

            });

            $('#myTab a').click(function(e) {
                e.preventDefault();
                $(this).tab('show');
            });
        </script>

        <script>
            $('#mainMenu a').click(function(e) {
                e.preventDefault();
                $(this).tab('show');
            });
        </script>

    </head>
    <body>
        <!--  NAVBAR CODE  -->
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse"
                       data-target=".nav-collapse"> <span class="icon-bar"></span> <span
                            class="icon-bar"></span> <span class="icon-bar"></span>
                    </a> <a class="brand" href="#">Administración</a>
                    <div class="nav-collapse">
                        <ul class="nav">

                        </ul>
                        <!--  Profile Menu-->
                        <ul class="nav pull-right">
                            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                    data-toggle="dropdown"> <i class="icon-user"></i> ${username}
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    
                                    <li><a href="<c:url value="/j_spring_security_logout" />"><i
                                                class="icon-off"></i> Cerrar Sesión</a></li>
                                </ul></li>
                        </ul>
                        <!-- / Profile Menu-->
                        <!--  Search Input  -->
                       
                        <!-- / Search Input  -->
                    </div>
                </div>
            </div>
        </div>
        <!-- / NAVBAR CODE  -->
        <div class="container-fluid tabbable">
            <div class="row-fluid">
                <div class="span2">
                    <div class="well sidebar-nav sidebar-nav-fixed ">
                        <ul class="tabs nav nav-list nav-stacked " id="mainMenu">
                        <br>
                        <li class="nav-header"><i class="icon-user-md icon-large"></i>Cuentas
                                de Usuario</li>

                            <li><a href="#optionMedic" data-toggle="tab">Crear</a></li>
                            <li class="nav-header"><i
                                    class="icon-folder-open-alt icon-large"></i>Reportes e Historiales</li>
                            <li><a href="#optionClient" data-toggle="tab"><i
                                        class="icon-group"></i>Clientes</a></li>
                            <li><a href="#optionInstitution" data-toggle="tab"><i
                                        class="icon-hospital"></i>Instituciones</a></li>                     

                        </ul>
                    </div>
                    <!--/.well -->
                </div>
                <!--/span-->
                <div class="span10">
                    <div class=" tab-content">
                        <div id="optionHome" class="tab-pane fade in active">
                        
                        
                        
                        
                        </div>
                        <div id="optionClient" class="tab-pane fade in">
                            <%@include file="records/clients/clientWindow.jsp"%>
                        </div>
                        <div id="optionDrugs" class="tab-pane fade in">
                            <%@include file="records/drugs/drugsPanel.jsp"%>
                        </div>
                        <div id="optionInstitution" class="tab-pane fade in">
                            <%@include file="records/institutions/institutionPanel.jsp"%>
                        </div>
                        <div id="optionMedic" class="tab-pane fade in">
                            <%@include file="records/medic/addMedic.jsp"%>
                        </div>
                        <div id="adminOptions" class="tab-pane fade in">
                            <%@include file="adminOptions.jsp"%>
                        </div>

                        <div id="profilePanel" class="tab-pane fade in">
                            <%@include file="profilePanel.jsp"%>
                        </div>
                        <div id="adminData" class="tab-pane fade in">
                            <%@include file="adminData.jsp"%>
                        </div>
                        <div id="adminSecurity" class="tab-pane fade in">
                            <%@include file="adminSecurity.jsp"%>
                        </div>
                        <div id="modifyMedic" class="tab-pane fade in">
                            <%@include file="records/medic/modifyMedic.jsp"%>
                        </div>
                        <div id="recoverMedic" class="tab-pane fade in">
                            <%@include file="records/medic/recoverMedic.jsp"%>
                        </div>
                        <div id="optionRecords" class="tab-pane fade in">
                            <%@include file="records/records/searchRecord.jsp"%>
                        </div>
                         <div id="optionProblems" class="tab-pane fade in">
                            <%@include file="records/problem/problemPanel.jsp"%>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>