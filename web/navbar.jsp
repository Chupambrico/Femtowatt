<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<div id="nav" class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" href="#">Femtowatt</a>
            <ul class="nav">
                <li<%if(session.getAttribute("page").equals("home")){
                    %> class="active"<%
                }%>><a href="index.jsp?pag=home">Home</a></li>
                <li<%if(session.getAttribute("page").equals("showPages")){
                    %> class="active"<%
                }%>><a href="index.jsp?pag=showPages">Articoli</a></li>
                <%
                try{
                    if(session.getAttribute("livello").equals(10)){
                        %>
                        <li<%if(session.getAttribute("page").equals("administrator")){
                            %> class="active"<%
                        }%>><a href="index.jsp?pag=administrator">Amministrazione</a></li>
                        <%
                    }
                }catch(Exception e){}
                %>
            </ul>
            <ul class="nav pull-right">
                <%if(session.getAttribute("idSession") == null){
                    %>
                    <li id="register"<%if(session.getAttribute("page").equals("register")){
                        %> class="active"<%
                    }%>><a href="index.jsp?pag=register">Registrazione</a></li>
                    <li id="login"><a href="#myModal" role="button" data-toggle="modal">Login</a></li>
                    <li id="user" style="display:none;"><a href="index.jsp?pag=profile" id="userN"></a></li>
                    <li id="logout" style="display:none;" onclick="logout();"><a href="#">Logout</a></li>
                    <%
                }else{
                    String indirizzo = request.getRequestURI() + "?" + request.getQueryString();
                    String nome = (String)session.getAttribute("nome");
                    Integer id = (Integer)session.getAttribute("id");
                    %>
                    <li id="register" style="display:none;"<%if(session.getAttribute("page").equals("register")){
                        %> class="active"<%
                    }%>><a href="index.jsp?pag=register">Registrazione</a></li>
                    <li id="login" style="display:none;"><a href="#myModal" role="button" data-toggle="modal">Login</a></li>
                    <li id="user"<%Boolean a = false;
                        try{a = Integer.parseInt(request.getParameter("cod")) == id;}catch(Exception e){}
                        if((session.getAttribute("page").equals("profile"))&&(a)){
                        %> class="active"<%
                    }%>><a href="index.jsp?pag=profile&cod=<%=id%>" id="userN"><%=nome%></a></li>
                    <li id="logout" onclick="logout();"><a href="#">Logout</a></li>
                    <%
                }
                %>
                <form class="navbar-form form-search pull-right" name="cerca" accept-charset="UTF-8">
                    <div class="input-append">
                        <input class="span3 search-query " type="text" onchange="search1();" id="search" data-provide="typeahead" data-items="4" autocomplete="off" name="cerc"/>
                        <button class="btn btn-success" type="button" name="bottone" onclick="avvio(10);"><i class="icon-search"></i></button>
                    </div>
                </form>
            </ul>
        </div>
    </div>
</div>