<div id="sidebar" style="padding-top:50px;">
    <div class="well" style="padding: 8px 0;">
        <ul class="nav nav-list">
            <li class="nav-header">List header</li>
            <%  
            if(session.getAttribute("idSession") != null){
                %>
                <li<%if(session.getAttribute("page").equals("scrivipagina")){
                    %> class="active"<%
                }%>>
                    <a href="index.jsp?pag=scrivipagina">Scrivi nuovo articolo</a>
                </li>
                <%
            }
            %>
            <li<%if(session.getAttribute("page").equals("ricercaAvanzataPrincipale")){
                %> class="active"<%
            }%>>
                <a href="index.jsp?pag=ricercaAvanzataPrincipale">Ricerca Avanzata</a>
            </li>
            <li class="nav-header">Profile settings</li>
            <%   
            if(session.getAttribute("idSession") != null){
                Integer id = (Integer)session.getAttribute("id");
                %>
                <li<%Boolean a = false;
                        try{a = Integer.parseInt(request.getParameter("cod")) == id;}catch(Exception e){}
                        if((session.getAttribute("page").equals("profile"))&&(a)){
                        %> class="active"<%
                    }%>>
                    <a href="index.jsp?pag=profile&cod=<%=id%>">Profile</a>
                </li>
                <li<%Boolean b = false;
                    try{b = Integer.parseInt(request.getParameter("n")) == id;}catch(Exception e){}
                    if((session.getAttribute("page").equals("listaarticoliutente"))&&(b)){
                    %> class="active"<%
                }%>>
                    <a href="index.jsp?pag=listaarticoliutente&n=<%=id%>">Miei Articoli</a>
                </li>
                <%
            }
            %>
            <li>
                <a href="#">Settings</a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">Help</a>
            </li>
        </ul>
    </div>
</div>