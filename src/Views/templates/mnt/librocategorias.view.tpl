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
  h2 {
    margin-bottom: 0 !important;
  }
  a {
      text-decoration: none !important;
  }
  .funciones {
    display: flex;
    flex-flow: row nowrap;
  }
  .fnitems {
    display: flex;
    position: relative;
    flex-flow: row nowrap;
    background: #f0f0f0;
    border: 1px solid #333;
    margin: .3125em;
    padding: .3125em;
    cursor: pointer;
    border-radius: .3125em;
    box-shadow: 3px 10px 1rem 1px rgba(0, 0, 0, 0.1);
  }

  .delete-funcion {
      background-color: #000;
      border-radius: 50%;
      height: 1em;
      width: 1em;
      padding: .625em;
      position: absolute;
      right: -4px;
      top: -4px;
      color: white;
      display: flex;
      align-items: center;
      transform: scale(0);
      transition: all .2s cubic-bezier(0.65, 0.05, 0.36, 1);
  }

  .fnitems:hover > .delete-funcion {
      transform: scale(1);
  }

  span {
      transform: translateX(-5px);
  }

  button {
    border: none !important;
  }

  .btn-remove-funcion {
    height: 100% !important;
    border-radius: .3125em !important;
    margin-left: .3125em;
    background-color: hsla(0, 60%, 40%, 1);
  }

        .libro {
        border: none;
        display: grid;
        grid-template-columns: repeat(5,1fr);
        grid-template-rows: repeat(6, auto);
        gap: 1rem;
    }

    .section-mnt{
        display: flex;
        flex-flow: column nowrap;
        grid-column: 2 / -2;
    }

    .funciones.section-mnt {
      flex-flow: row nowrap !important;
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
        width: 100%;
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
<div class="libro">
      {{if steps}}
        <section class="steps section-mnt">
            <div class="step-item">
                <span class="step-number">1</span>
                <span class="step-name">Libro</span>
            </div>
            <div class="step-item">
                <span class="step-number">2</span>
                <span class="step-name">Autor</span>
            </div>
            <div class="step-item active">
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
  <h2 class="section-mnt">Selecciona la categoría del libro: {{nombreLibro}}</h2>
  <section class="section-mnt">
    <select name="" id="redirectSelect">
      <option value="#">Seleccionar...</option>
      {{foreach noCategoria}}
      <option 
        value="index.php?page=mnt_librocategorias&mode=INS&idlibros={{~idlibros}}&idcategoria={{idCategorias}}" 
      >{{categoriaDes}}</option>
      {{endfor noCategoria}}
    </select>
  </section>
  <section class="section-mnt">
    <p>¿No aparece la categoría de este libro?</p>
    <a
      href="index.php?page=mnt_categoria&mode=INS&idcategorias=0&idlibros={{idlibros}}"
    >Creálo aquí</a>
    <hr />
  </section>
  <h2 class="section-mnt">Categorias de: {{nombreLibro}}</h2>
  <section class="funciones section-mnt">
    {{foreach categoria}}
    <div class="fnitems">
      <a title="Eliminar la categoría {{categoriaDes}} del libro {{~nombreLibro}}"
        class="delete-funcion"
        href="index.php?page=mnt_librocategorias&mode=DEL&idlibros={{~idlibros}}&idcategoria={{idCategorias}}"
      ><span>X</span></a>
      <p>{{categoriaDes}}</p>
    </div>
    {{endfor categoria}}
  </section>
  <div class="section-mnt buttons-container">
    <button onclick="volverAtras('{{idlibros}}')" class="secondary-button">Volver atrás</button>
    <button onclick="siguiente('{{idlibros}}')" class="primary-button">Siguiente</button>
  </div>
</div>

<script>
    function redirect(goto){ 
        if (goto.trim() != '') {
            window.location = goto; 
        }
    }
    var selectEl = document.getElementById('redirectSelect'); 
    selectEl.onchange =  function(){
        var goto = this.value;
        redirect(goto);
    };

    let volverAtras = site => {
        window.location.assign(`index.php?page=mnt_libroautores&mode=DSP&idlibros=${site}`);
    };

    let siguiente = idlibros => {
        window.location.assign(`index.php?page=mnt_librodetalle&mode=INS&idlibros=${idlibros}`);
    };
</script>