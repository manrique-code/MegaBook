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

        <fieldset id="autor" class="autor">
            <legend>Autor(es) del libro</legend>
            {{if editarAutoresLibros}}
                <a href="#">Editar</a>
            {{endif editarAutoresLibros}}
            <section class="autores-libro">
                    {{if mostrarAutores}}
                        <div class="autores-container">
                            <span class="autor-item">
                                <span class="eliminar-button">
                                    <a href="#" class="eliminar-autor">X</a>
                                </span>
                                <span class="autor-nombre"
                                >{{nombreAutor}}</span>
                            </span>
                        </div>
                    {{endif mostrarAutores}}
                    {{if mostrarNoAutores}}
                        <div class="no-autores-container">
                            <section class="no-autores-input">
                                <label for="noAutoresText">Buscar autores de este libro</label>
                                <input type="text" id="noAutoresText" name="noAutoresText" list="noAutoresList">
                                <section class="no-autores-list-container">
                                    <datalist id="noAutoresList">
                                    {{foreach noAutores}}
                                        <option value="{{nombreAutor}}">{{nombreAutor}}</option>
                                    {{endfor noAutores}}
                                    </datalist>
                                </section>
                                <fieldset name="noAutoresItem" id="noAutoresItem" class="no-autores-item">
                                    <input type="text" name="" id="" readonly value="a">
                                </fieldset>
                            </section>
                        </div>
                    {{endif mostrarNoAutores}}
            </section>
        </fieldset>

        <fieldset id="categoria" class="categoria">
            <legend>Categoría(s) del libro</legend>
            {{if editarCategoriaLibros}}
                <a href="#">Editar</a>
            {{endif editarCategoriaLibros}}
            <section class="categoria-libro">
                {{if mostrarCategorias}}
                    <div class="categorias-container">
                        <span class="categoria-item">
                            <span class="eliminar-button">
                                <a href="#" class="eliminar-categoria">X</a>
                            </span>
                            <span class="categoria-nombre"
                            >{{nombreAutor}}</span>
                        </span>
                    </div>
                {{endif mostrarCategorias}}
                {{if mostrarNoCategorias}}
                    <div class="no-categorias-container">
                        <section class="no-categorias-input">
                            <label for="noCategoriasText">Buscar categorías de este libro</label>
                            <input type="text" id="noCategoriasText" name="noCategoriasText" list="noCategoriasList">
                            <section class="no-categorias-list-container">
                                <datalist id="noCategoriasList">
                                {{foreach noCategorias}}
                                    <option value="{{idCategorias}}">{{categoriasDes}}</option>
                                {{endfor noCategorias}}
                                </datalist>
                            </section>
                        </section>
                    </div>
                {{endif mostrarNoCategorias}}
            </section>
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