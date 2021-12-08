<style>
    :root {
        --font-primary-color: #333;
        --font-secondary-color: #6e6d81;
        --font-terciary-color: #2980b9;
        --font-inactive-color: #778;
        --font-error-color: #e74c3c;
        --input-primary-color: #f6fafd;
        --input-seconday-color: #fff;
        --input-inactive-color: #f0f0f0;
        --input-border-color: #999;
        --input-border-focus-color: #0065DE;
        --primary-button-bg-color: hsl(204, 80%, 80%);
        --primar-button-accent-color: #2980b9;
        --primary-button-font-color: white;
        --secondary-button-bg-color: rgba(41, 128, 185,0.1);
        --secondary-button-accent-color: #2980b9;
        --secondary-button-font-color: #2980b9;

    }

    *,*::before,*::after {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: "Neue Haas";
    }

    .title-mnt {
        font-family: "P22";
        margin-top: .5em;
        font-weight: bold;
        color: var(--font-primary-color);
    }

    .libro {
        border: none;
        display: grid;
        grid-template-columns: repeat(5,1fr);
        grid-template-rows: repeat(4, auto);
        gap: 1rem;
    }

    .section-mnt{
        display: flex;
        flex-flow: column nowrap;
        grid-column: 2 / -2;
    }

    .section-coverart {
        border: var(--input-border-color) 1px solid;
        display: flex;
        align-items: center;
        border-radius: .5em;
        padding: 1em;
    }

    .section-coverart > input {
        border: none;
    }

    .coverart-libro > img {
        width: 200px;
        font-weight: 600;
        letter-spacing: .04em;
        color: var(--font-error-color);
    }

    .label-mnt {
        letter-spacing: .08em;
        color: var(--font-secondary-color);
        font-weight: normal;
        font-style: normal;
        margin: .7em 0;
    }

    .input-mnt {
        border-radius: .5em;
        color: var(--font-primary-color);
        font-weight: 600;
        font-style: normal;
        background-color: var(--input-secondary-color);
        border: var(--input-border-color) 1px solid;
    }

    .input-inactive {
        color: var(--font-inactive-color);
        background-color:var(--input-inactive-color);
    }

    .input-inactive:focus {
        color: var(--font-inactive-color) !important;
        background-color:var(--input-inactive-color) !important;
        border: var(--input-border-color) 1px solid !important;
    }

    textarea.input-mnt {
        font-family: "Neue Haas";
        font-weight: 600;
        line-height: 1.5;
        letter-spacing: .04em;
    }

    .input-mnt:focus {
        background-color: var(--input-primary-color);
        border: var(--font-terciary-color) 1px solid;
    }

    .section-error {
        color: var(--font-error-color);
    }

    .steps {
        margin-top: 1em;
        grid-column: 2 / 4;
        display: flex;
        flex-flow: row nowrap;
    }

    .step-item {
        margin: 0 1.5em;
    }

    .step-item.active {
        font-weight: bold;
    }

    .step-item.active > .step-number {
        background-color: var(--font-terciary-color);
        color: var(--input-primary-color);
    }
    .step-item:first-of-type {
        margin-left: 0;
    }

    .step-number {
        margin: 0 .5em;
        background-color: var(--input-inactive-color);
    }
    .step-number:first-of-type {
        margin-left: 0;
        padding: 1em 1.2em;
        border-radius: .5em;
    }

    .separator {
        margin-top: 1em;
        border: 0;
        height: 1px;
        background-color: var(--input-border-color);
    }

    .buttons-container {
        display: flex;
        flex-flow: row nowrap;
    }

    .primary-button {
        color: var(--primary-button-font-color);
        border: var(--primar-button-accent-color) 1px solid;
        background-color:var(--primar-button-accent-color);
        border-radius: .5em;
        margin-right: 1em;
    }

    .secondary-button {
        color: var(--secondary-button-font-color);
        border: var(--secondary-button-accent-color) 1px solid;
        background-color:var(--secondary-button-bg-color);
        border-radius: .5em;
        margin-right: 1em;
    }
</style>
<h1>{{mode_dsc}}</h1>


<section>
  <form action="index.php?page=mnt_librocategoria&mode={{mode}}&idCategoria={{idCategoria}}"
    method="POST" >
    <section>
    <label for="idCategoria">Código de Categoría</label>
    <input type="hidden" id="idCategoria" name="idCategoria" value="{{idCategoria}}"/>
    <input type="hidden" id="mode" name="mode" value="{{mode}}" />
    <input type="hidden" id="xsrftoken" name="xsrftoken" value="{{xsrftoken}}" />
    <input type="text" readonly name="idCategoriadummy" value="{{idCategoria}}"/>
    </section>
   <section>

    <section>
    <label for="idLibros">Código de Libros</label>
    <input type="hidden" id="idLibros" name="idLibros" value="{{idLibros}}"/>
    <input type="hidden" id="mode" name="mode" value="{{mode}}" />
    <input type="hidden" id="xsrftoken" name="xsrftoken" value="{{xsrftoken}}" />
    <input type="text" readonly name="idLibrosdummy" value="{{idLibros}}"/>
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
        window.location.assign("index.php?page=mnt_librocategoria");
      });
  });
</script>
