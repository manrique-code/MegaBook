<h1>{{mode_dsc}}</h1>
<section>

    <form action="index.php?page=mnt_libro&mode={{mode}}&idlibros={{idlibros}}" method="POST">

        <fieldset id="libro" class="libro">
        
            <section>
                <label for="idlibros">Identificador del libro</label>
                <input type="hidden" id="idlibros" name="idlibros" value="{{idlibros}}">
                <input type="hidden" id="mode" name="mode" value="{{mode}}">
                <input type="hidden" id="xsrftoken" name="xsrftoken" value="{{xsrftoken}}">
                <input type="text" readonly name="idlibrosdummy" value="{{idlibros}}">
            </section>

            <legend>Información del libro</legend>
            <section>
                <label for="coverart">Portada del libro</label>
                <button id="coverart" name="coverart">Seleccionar Imagen</button>
                <div class="coverart-libro" id="covertArtLibro">
                    <img src="" alt="Imagen del libro" class="coverart-img" id="coverArtImg" name="coverartImg">
                </div>
            </section>
            <section>
                <label for="nombreLibro">Nombre</label>
                <input type="text" id="nombreLibro" name="nombreLibro" maxlength="45" {{readonly}} value="{{nombreLibro}}">
            </section>
            <section>
                <label for="descripcion">Sinópsis</label>
                <textarea name="descripcion" id="descripcion" cols="30" rows="10">{{descripcion}}</textarea>
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
        </fieldset>

        <section>
            {{if showAction}}
                <button 
                type="submit" 
                name="btnGuardar" 
                id="btnGuardar" 
                value="G">Guardar</button>
            {{endif showAction}}
            <button type="submit" id="btnCancelar">Cancelar</button>
        </section>

    </form>

</section>

<script>
      document.addEventListener("DOMContentLoaded", function(){
      document.getElementById("btnCancelar").addEventListener("click", function(e){
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=mnt_libros");
      });
  });
</script>