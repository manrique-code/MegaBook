<style>
    :root {
  --primary-border-radius: 0.625rem;
  --primary-background-color: #ebebeb;
  --secondary-background-color: white;
  --primary-font-color: #222;
  --secondary-font-color: white;
  --primary-button-color: #e74c3c;
  --secondary-button-color: white;
}

*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Courier New", Courier, monospace;
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
  grid-column: 2 / -2;
  grid-row: content;
  height: 100%;
  margin: 2rem 0;
}

.books-title {
  margin-bottom: 1em;
}

.books-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, 18.75rem);
  grid-auto-rows: 25rem;
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
}

.book-image {
  width: auto;
  height: 150px;
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
  justify-content: flex-start;
  padding: 0.5em 0;
  align-items: center;
}

footer {
  grid-row: content-end / main-end;
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
    transform: scale(1.2);
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
}
</style>
<title>MegaBook: Home</title>

<h1 class="books-title">Libros</h1>

<section class="books-container">
    {{if hasLibros}}
        {{foreach libros}}
            <div class="book-item" id="{{idlibros}}">
                <div class="book-image-container">
                    <img src="{{coverart}}" alt="{{nombreLibro}}" class="book-image" />
                </div>
                <div class="book-description-container">
                    <p class="book-description" id="bookDescription-1984">{{nombreLibro}}</p>
                    <p class="book-autor" data-autor="{{idAutor}}">{{nombreAutor}}</p>
                </div>
                <span class="view-book-button"><a href="#">Ver libro</a></span>
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