


<style>

    h1{
        text-align: center;
        padding-bottom: 15px;
    }

    .contenedor{
        display: grid;
        grid-template-columns: repeat(4,auto);
        padding-bottom: 15px;
    }

    label{
        margin-right:20px ;
    }

    select{
        width: 213px;
    }

    .button{
        width: 230px;
        display: block;
        margin: auto;
    }

    button{
        margin-right: 15px;
    }

</style>

<h1>{{mode_dsc}}</h1>
<section>
  <form action="index.php?page=mnt_autor&mode={{mode}}&idAutor={{idAutor}}"
    method="POST" >

    <div class="contenedor">
        <section>
            <label for="catid">Código</label>
            <input type="hidden" id="idAutor" name="idAutor" value="{{idAutor}}"/>
    <input type="hidden" id="mode" name="mode" value="{{mode}}" />
    <input type="hidden" id="xsrftoken" name="xsrftoken" value="{{xsrftoken}}" />
    <input type="text" readonly name="idAutordummy" value="{{idAutor}}"/>
    </section>

    <section>
      <label for="nombreAutor">Nombre del Autor</label>
      <input type="text" {{readonly}} name="nombreAutor" value="{{nombreAutor}}" maxlength="45" placeholder="Nombre del Autor"/>
    </section>

    <section>
      <label for="nombreAutor">Apellido del Autor</label>
      <input type="text" {{readonly}} name="apellidoAutor" value="{{apellidoAutor}}" maxlength="45" placeholder="Apellido del Autor"/>
    </section>


    <section>
      <label for="genero">Genero del Autor</label>
      {{if readonly}}
       <input type="hidden" id="generodummy" name="genero" value="" />
      {{endif readonly}}
      <select id="genero" name="genero" {{if readonly}}disabled{{endif readonly}}>
        <option value="MAS" {{genero_MAS}}>Masculino</option>
        <option value="FEM" {{genero_FEM}}>Femenino</option>
        <option value="OTR" {{genero_OTR}}>Otros</option>
      </select>
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
    
    </div>

    <section class="button">
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
        window.location.assign("index.php?page=mnt_autores");
      });
  });
</script>
