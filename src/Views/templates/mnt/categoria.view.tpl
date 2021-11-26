<style>
  label{
    padding-right: 50px;
    scroll-padding-bottom: 50px;
  }
  section{
    padding-right: 15px;
    scroll-padding-bottom: 25px;
  }
  .gird{
    display: grid;
    grid-template-columns: repeat(3,auto);
  }
  .centro{
    width: 1100px;
    display: block;
    margin: auto;
  }
  input[type="text"],
  input[type="date"],
  input[type="password"],select{
    width: 300px;
    margin-top: 10px;
  }
  button{
    margin-right: 15px;
  }
</style>
<h1>{{mode_dsc}}</h1>


<section>
  <form action="index.php?page=mnt_categoria&mode={{mode}}&idCategorias={{idCategorias}}"
    method="POST" >
    <section>
    <label for="idCategorias">Código</label>
    <input type="hidden" id="idCategorias" name="idCategorias" value="{{idCategorias}}"/>
    <input type="hidden" id="mode" name="mode" value="{{mode}}" />
    <input type="hidden" id="xsrftoken" name="xsrftoken" value="{{xsrftoken}}" />
    <input type="text" readonly name="idCategoriasdummy" value="{{idCategorias}}"/>
    </section>
    <section>
      <label for="categoriaDes">Categoría</label>
      <input type="text" {{readonly}} name="categoriaDes" value="{{categoriaDes}}" maxlength="45" placeholder="Nombre de Categoría"/>
    </section>
    {{if hasErrors}}
        <section>
          <ul>
            {{foreach Errors}}
                <li>{{this}}</li>
            {{endfor Errors}}
          </ul>
        </section>
    {{endif hasErrors}}
    <section>
      {{if showaction}}
      <button type="submit" name="btnGuardar" value="G">Guardar</button>
      {{endif showaction}}
      <button type="button" id="btnCancelar">Cancelar</button>
    </section>
  </form>
</section>

<script>
  document.addEventListener("DOMContentLoaded", function(){
      document.getElementById("btnCancelar").addEventListener("click", function(e){
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=mnt_categorias");
      });
  });
</script>
