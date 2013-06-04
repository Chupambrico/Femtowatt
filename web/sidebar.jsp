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
                    <a href="try.jsp?pag=scrivipagina">Scrivi nuovo articolo</a>
                </li>
                <%
            }
            %>
            <li class="nav-header">Profile settings</li>
            <%   
            if(session.getAttribute("idSession") != null){
                Integer id = (Integer)session.getAttribute("id");
                %>
                <li<%if(session.getAttribute("page").equals("profile")){
                    %> class="active"<%
                }%>>
                    <a href="try.jsp?pag=profile&cod=<%=id%>">Profile</a>
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