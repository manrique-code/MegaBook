<style>
    :root {
  --primary-border-radius: 0.625rem;
  --primary-background-color: #ebebeb;
  --secondary-background-color: white;
  --terciary-background-color:hsl(6, 70%, 92%);
  --primary-font-color: #222;
  --secondary-font-color: white;
  --terciary-font-color: #e74c3c;
  --primary-button-color: #e74c3c;
  --primary-button-hover-color: hsl(6, 78%, 45%);
  --secondary-button-color: white;
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

*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Neue Haas";
}

body {
  height: 100%;
  width: 100%;
  display: grid;
  grid-template-columns: repeat(6, 1fr);
  grid-template-rows: [main-start] 50px [content-start] auto [content-end] 100px [main-end];
  gap: 2px;
  background-color: var(--primary-background-color);
  /* overflow: hidden; */
}

a {
    text-decoration: none;
}

.empty-state-container {
    grid-column: 1 / -1;
    grid-row: 1 / -1;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
}

.empty-state-container > img {
    width: 40%;
    height: auto;
    object-fit: cover;
}

header {
  grid-row: main-start / content-start;
  grid-column: 1 / -1;
  background-image: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0));
  display: flex;
  flex-flow: column wrap;
  justify-content: center;
  align-content: space-between;
  position: sticky;
  top: 0;
  padding: 2.5rem 2rem;
  width: 100%;
}

.header-logo-container {
  max-width: 6.25rem;
}

.logo-image {
  width: 100%;
}

nav {
  align-self: flex-end;
}

.header-item {
  text-decoration: none;
  color: var(--primary-font-color);
  border: 1px solid transparent;
  margin: 0 0.3em;
  transition: border 0.4s cubic-bezier(0.46, 0.03, 0.52, 0.96);
}

.header-item.selected {
  font-weight: bold;
  border-bottom: 1px solid var(--primary-font-color);
}

.sign-in {
  padding: 0.5em;
  background-color: var(--secondary-button-color);
  border-radius: var(--primary-border-radius);
  transition: all 0.4s cubic-bezier(0.46, 0.03, 0.52, 0.96);
  border: 1px solid transparent;
}

.sign-up {
  padding: 0.5em;
  background-color: var(--primary-button-color);
  color: var(--secondary-font-color);
  border-radius: var(--primary-border-radius);
  transition: all 0.4s cubic-bezier(0.46, 0.03, 0.52, 0.96);
  border: 1px solid transparent;
}

main {
  grid-column: 1 / -1;
  display: grid;
  grid-template-columns: 15.625rem auto;
  grid-template-rows: 4rem auto;
  grid-row: content;
  height: 100%;
  margin: 2rem 0;
  gap: 1rem;
}

.sidebar-container {
  grid-column: 1 / 2;
  grid-row: 2 / -1;
  display: flex;
  flex-flow: column nowrap;
}

.sidebar-title, .sidebar-item {
  border-radius: .5rem;
}
.sidebar-title {
  margin-top: 0 !important;
  font-size: .9em;
  margin: .2rem 1rem;
  padding: 0 .5rem;
  color: var(--font-secondary-color);
  font-weight: normal;
}

.sidebar-item {
  padding: 1rem .5rem;
  margin: .2rem 1rem;
  text-decoration: none;
  color: var(--font-primary-color);
  transition: .4s background-color ease-in-out, .4s color ease-in-out;
}

.saludo {
  margin-bottom: 1em;
  grid-column: 2 / -1;
  grid-row: 1 / 2;
  display: flex;
  flex-flow: column nowrap;
}

.books-title {
  font-family: "P22";
  font-size: 2em;
  margin-bottom: .3em;
  color: var(--primary-font-color);
}

.book-subtitle {
  color: var(--font-secondary-color);
}

.books-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, 19rem);
  grid-auto-rows: 30rem;
  grid-column: 2 / -1;
  grid-row: 2 / -1;
  justify-content: space-between;
  /* column-gap: 1em !important; */
  row-gap: 2em;
}

.book-item {
  width: 100%;
  padding: 1.5em;
  border: 1px solid transparent;
  border-radius: var(--primary-border-radius);
  background-color: var(--secondary-background-color);
  display: flex;
  flex-flow: column;
  justify-content: center;
  align-content: space-between;
  transition: all 0.4s ease;
  text-overflow: ellipsis;
  overflow: hidden;
}

.book-image-container {
  background-color: var(--primary-background-color);
  display: grid;
  align-items: center;
  justify-items: center;
  width: 100%;
  flex: 70%;
  border-radius: .5rem;
}
.book-image {
  width: auto;
  height: 180px;
  object-fit: cover;
  transition:all 0.4s cubic-bezier(.25,.1,.28,2.36);
  transition-delay: 0.3s;
}

.book-description-container {
  flex: 30%;
  width: 100%;
  text-overflow: ellipsis;
  overflow: hidden;
  display: flex;
  flex-flow: column nowrap;
  justify-content: space-around;
  padding: 0.5em 0;
  align-items: center;
  align-content: space-between;
  margin: .5rem 0;
  position: relative;
}

.book-name {
  font-weight: bold;
  font-size: 1.3rem;
}

.book-autor {
    color: var(--font-secondary-color);
}

.book-precio {
    font-size: 1rem;
    color: var(--font-primary-color);
    font-weight: 600;
}

.book-button-container {
    display: flex;
    flex-flow: column nowrap;
}

.view-book-button, .add-to-cart-button {
    width: 100%;
    display: block;
    text-align: center;
    padding: .7em .5em;
    border-radius: .5em;
}

.view-book-button {
    color: var(--primary-button-color);
    margin-bottom: .5em;
    transition: .4s all ease-in-out;
}

.add-to-cart-button {
    background-color: var(--primary-button-color);
    color: var(--secondary-font-color);
    transition: .4s all ease-in-out;
}

footer {
  grid-row: content-end / main-end;
}

i.fa {
    font-family: "Font Awesome 5 Free" !important;
}

@media (hover: hover) {
  .header-item:hover {
    border-bottom: 1px solid var(--primary-button-color);
  }

  .header-item:nth-last-child(2),
  .header-item:last-child {
    border: 1px solid transparent;
  }

  .book-item:hover {
    box-shadow: 0 1em 2em 0.1em rgba(0, 0, 0, 0.1);
    transform: translateY(-1px);
  }

  .book-item:hover > .book-image-container > .book-image {
    transform: scale(1.15);
  }

  .sign-in:hover {
    background-color: var(--primary-button-color);
    color: var(--secondary-font-color);
    /* border-bottom: 1px solid transparent !important; */
    cursor: pointer;
  }

  .sign-up:hover {
    background-color: var(--secondary-button-color);
    color: var(--primary-font-color);
    /* border-bottom: 1px solid transparent !important; */
    cursor: pointer;
  }

  .sidebar-item:hover {
    background-color: var(--terciary-background-color);
    color: var(--terciary-font-color);
  }

  .view-book-button:hover {
    background-color: var(--terciary-background-color);
}

.add-to-cart-button:hover {
    background-color: var(--primary-button-hover-color);
}
}
</style>
<title>MegaBook: Home</title>

<section class="saludo">
  <h1 class="books-title">Hola, {{userName}}.</h1>
  <span class="book-subtitle">¡Llevemonos un libro, hoy!</span>
</section>

<section class="books-container">
    {{if hasLibros}}
        {{foreach libros}}
            <div class="book-item" id="{{idlibros}}">
                <div class="book-image-container">
                    <img src="{{coverart}}" alt="{{nombreLibro}}" class="book-image" />
                </div>
                <div class="book-description-container">
                    <span class="book-name">{{nombreLibro}}</span>
                    <span class="book-autor" data-autor="{{idAutor}}">{{nombreAutor}}</span>
                    <span class="book-precio">L.{{precio}}</span>
                </div>
                <div class="book-button-container">
                    <a href="#"><span class="view-book-button">Ver libro <i class="fas fa-cart-arrow-down"></i></span></a>
                    <a href="index.php?page=carrito&mode=INS&idlibros={{idlibros}}&cantidad=1"><span class="add-to-cart-button">Añadir al carrito <i class="fas fa-cart-arrow-down"></i></span></a>
                </div>
            </div>
        {{endfor libros}}
    {{endif hasLibros}}
    {{ifnot hasLibros}}
        <div class="empty-state-container">
            <img 
            src="http://localhost/MegaBook/public/imgs/emptystate.png" 
            alt="Vacio" 
            class="empty-state">
        </div>
    {{endifnot hasLibros}}
</section>

<aside class="sidebar-container">
    <h4 class="sidebar-title">Categorías</h4>
    {{foreach categorias}}
        <a 
        href="index.php?page=home&q=busqueda&t=categorias&v={{idCategorias}}" 
        class="sidebar-item" 
        ><span class="sidebar-item-content">{{categoriaDes}}</span>
        </a>
    {{endfor categorias}}
</aside>