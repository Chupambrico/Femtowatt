<div id="sidebar" style="padding-top:50px;">
    <div class="well" style="padding: 8px 0;">
        <ul class="nav nav-list">
            <li class="nav-header">List header</li>
            <li class="active">
                <a href="#">Home</a>
            </li>
            <%  
            if(session.getAttribute("idSession") != null){
                %>
                <li>
                    <a href="try.jsp?pag=scrivipagina">Scrivi nuovo articolo</a>
                </li>
                <%
            }
            %>
            <li class="nav-header">Profile settings</li>
            <li>
                <a href="#">Profile</a>
            </li>
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