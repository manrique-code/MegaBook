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
  .contenedor {
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

<section>
  <form action="index.php?page=mnt_autor&mode={{mode}}&idAutor={{idAutor}}"
    method="POST" >

    <fieldset class="contenedor">

        {{if steps}}
        <section class="steps section-mnt">
            <div class="step-item">
                <span class="step-number">1</span>
                <span class="step-name">Libro</span>
            </div>
            <div class="step-item active">
                <span class="step-number">2</span>
                <span class="step-name">Autor</span>
            </div>
            <div class="step-item">
                <span class="step-number">3</span>
                <span class="step-name">Categoría</span>
            </div>
            <div class="step-item">
                <span class="step-number">4</span>
                <span class="step-name">Precio</span>
            </div>
        </section>
        <hr class="section-mnt separator">
        {{endif steps}}

        <h1 class="title-mnt section-mnt">{{mode_dsc}}</h1>

        <section class="section-mnt">
            <label for="catid" class="label-mnt">Código</label>
            <input type="hidden" id="idAutor" name="idAutor" value="{{idAutor}}"/>
            <input type="hidden" id="mode" name="mode" value="{{mode}}" />
            <input type="hidden" id="xsrftoken" name="xsrftoken" value="{{xsrftoken}}" />
            <input type="hidden" name="idlibros" id="idlibros" value="{{idlibros}}">
            <input type="text" class="input-mnt input-inactive" readonly name="idAutordummy" value="{{idAutor}}"/>
        </section>

        <section class="section-mnt">
            <label for="nombreAutor" class="label-mnt">Nombre del Autor</label>
            <input type="text" class="input-mnt" {{readonly}} name="nombreAutor" value="{{nombreAutor}}" maxlength="45" placeholder="Nombre del Autor"/>
        </section>

        <section class="section-mnt">
            <label for="nombreAutor" class="label-mnt">Apellido del Autor</label>
            <input type="text" class="input-mnt" {{readonly}} name="apellidoAutor" value="{{apellidoAutor}}" maxlength="45" placeholder="Apellido del Autor"/>
        </section>


        <section class="section-mnt">
            <label class="label-mnt" for="genero">Genero del Autor</label>
            {{if readonly}}
            <input type="hidden" class="input-mnt input-inactive" id="generodummy" name="genero" value="" />
            {{endif readonly}}
            <select id="genero" class="input-mnt" name="genero" {{if readonly}}disabled{{endif readonly}}>
                <option value="MAS" {{genero_MAS}}>Masculino</option>
                <option value="FEM" {{genero_FEM}}>Femenino</option>
                <option value="OTR" {{genero_OTR}}>Otros</option>
            </select>
        </section>

        {{if hasErrors}}
            <section class="section-mnt section-error">
                <ul>
                {{foreach Errors}}
                    <li>{{this}}</li>
                {{endfor Errors}}
                </ul>
            </section>
        {{endif hasErrors}}

        <section class="section-mnt buttons-container">
            {{if showaction}}
            <button type="submit" class="primary-button" name="btnGuardar" value="G">Guardar</button>
            {{endif showaction}}
            <button type="button" class="secondary-button" id="btnCancelar">Cancelar</button>
        </section>

    </fieldset>

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
