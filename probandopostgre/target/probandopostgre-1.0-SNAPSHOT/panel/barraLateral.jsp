<div class="lateralBar">
    <div class="restauranteLogo">
        <div class="nombreLogo">LAVANDERIA</div>
        <i class='bx bx-menu' id="menu_btn" ></i>
    </div>
    <ul class="listaBar">
        <li>
            <i class='bx bx-search-alt'></i>
            <input type="text" placeholder="Buscar...">
            <span class="flotanteText">Buscar</span>
        </li>
        <li>
            <a href="../">
                <i class='bx bx-grid-alt'></i>
                <span class="nombreLinks">Menu Principal</span>
            </a>
            <span class="flotanteText">Menu Principal</span>
        </li>
        <li>
            <a href="generarReportes.jsp">
                <i class='bx bxs-report'></i>
                <span class="nombreLinks">Generar reportes</span>
            </a>
            <span class="flotanteText">Generar reportes</span>
        </li>
        <li>
            <a href="mantenimientoClientes.jsp">
                <i class='bx bxs-spreadsheet'></i>
                <span class="nombreLinks">Lista clientes</span>
            </a>
            <span class="flotanteText">Lista cliente</span>
        </li>
        <li>
            <a href="mantenimientoUsuarios.jsp">
                <i class='bx bxl-flickr-square'></i>
                <span class="nombreLinks">Lista usuarios</span>
            </a>
            <span class="flotanteText">Lista usuarios</span>
        </li>
        <li>
            <a href="mantenimientoChoferes.jsp">
                <i class='bx bx-id-card'></i>
                <span class="nombreLinks">Lista choferes</span>
            </a>
            <span class="flotanteText">Lista choferes</span>
        </li>
        <li>
            <a href="mantenimientoMovilidades.jsp">
                <i class='bx bxs-car'></i>
                <span class="nombreLinks">Lista movilidades</span>
            </a>
            <span class="flotanteText">Lista movilidades</span>
        </li>
        <li>
            <a href="mantenimientoCategorias.jsp">
                <i class='bx bxs-cabinet'></i>
                <span class="nombreLinks">Categorias</span>
            </a>
            <span class="flotanteText">Categorias</span>
        </li>
        <li>
            <a href="mantenimientoServicios.jsp">
                <i class='bx bxs-coin-stack' ></i>
                <span class="nombreLinks">Servicios</span>
            </a>
            <span class="flotanteText">Servicios</span>
        </li>
        <li>
            <a href="mantenimientoPrendas.jsp">
                <i class='bx bx-body'></i>
                <span class="nombreLinks">Prendas</span>
            </a>
            <span class="flotanteText">Prendas</span>
        </li>
        <li>
            <a href="pedidos.jsp">
                <i class='bx bx-line-chart'></i>
                <span class="nombreLinks">Pedidos</span>
            </a>
            <span class="flotanteText">Pedidos</span>
        </li>
        <!--<li>
            <a href="detalles.jsp">
                <i class='bx bxs-user-pin' ></i>
                <span class="nombreLinks">Detalles</span>
            </a>
            <span class="flotanteText">Detalles</span>
        </li>-->
        <li class="perfil">
            <div class="detallesPerfil">
                <img src="../IMG/IMG_YNDIRA/1425553.png" alt="ImgPerfil">
                <div class="nombrePerfil">
                    <%
                        if (session.getAttribute("nombres") == null) {%>
                    <div class="nombreUser">NOMBRE USER</div>
                    <%} else {%>
                    <div class="nombreUser"><%=session.getAttribute("nombres").toString()%></div>
                    <%}%>
                    <div class="rolUser">Bienvenido</div>
                </div>
            </div>
            <a href="../logout.jsp">
                <i class='bx bx-log-out' id="logOut" ></i>
                <span class="flotanteText">Log Out</span>
            </a>
        </li>
    </ul>
</div>
<br/>
<br/>