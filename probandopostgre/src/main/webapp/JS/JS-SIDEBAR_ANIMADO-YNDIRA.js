let lateral_bar = document.querySelector(".lateralBar");
let Cerrar_btn = document.querySelector("#menu_btn");
let buscar_btn = document.querySelector(".bx-search-alt");

Cerrar_btn.addEventListener("click", ()=>{
  lateral_bar.classList.toggle("open");
  menuBtnChange();//llamando a la función (opcional)
});

buscar_btn.addEventListener("click", ()=>{ // Barra lateral abierta al hacer clic en el icono de búsqueda
lateral_bar.classList.toggle("open");
    menuBtnChange(); //llamando a la función (opcional)
});

// A continuación se muestra el código para cambiar el botón lateral_bar
function menuBtnChange() {
  if(lateral_bar.classList.contains("open")){
    Cerrar_btn.classList.replace("bx-menu", "bx-menu-alt-right");//Reemplazando la clase de iconos
  }else {
    Cerrar_btn.classList.replace("bx-menu-alt-right","bx-menu");//Reemplazando la clase de iconos
  }
}