
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/appstyle.css" />
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/font.css" />
  {{foreach SiteLinks}}
    <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
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
  *,*::before,*::after{
    font-family: "Neue Haas";
  }
  header {
     height: 50px;
     background-image: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0)) !important;
     background-color: transparent !important;
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
  color: #222;
  font-family: "P22";
  font-size: 2rem;
  text-decoration: none;
}

  .header-logo-container > *{
  font-family: "P22";
}

.header-logo-container > .red {
  color: var(--terciary-font-color);
}

.logo-image {
  width: 100%;
}

nav {
  align-self: flex-end !important;
  transform: translate(0);
}

.header-item {
  text-decoration: none !important;
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

.user-menu {
  transform: scale(0);
}

.user-menu.active {
  display: flex;
  flex-flow: column nowrap;
  position: absolute;
  right: 0;
  top: 2rem;
  background-color: var(--secondary-background-color);
  padding: 1rem;
  box-shadow: 0 1em 2em 0.1em rgba(0, 0, 0, 0.15);
  border-radius: .5rem;
}

.user-menu.active::after {
  content: " ";
  border: 10px solid transparent;
  border-bottom-color: var(--secondary-background-color);
  position: absolute;
  right: 3rem;
  top: -20px;
}

.user-menu.active > *:not(hr){
  margin: .2rem 0;
  padding: .5rem;
  text-decoration: none;
  color: var(--font-primary-color);
  border-radius: .5em;
}

.menu-actions {
  color: var(--font-secondary-color) !important;
  margin-bottom: .2em !important;
  padding: 0 .5rem !important;
  font-weight: normal;
  font-size: .7rem;
}

.menu-separator {
  width: 100%;
  color: var(--font-secondary-color);
}

.menu-options:hover {
  background-color: var(--primary-button-bg-color);
  color: var(--secondary-button-font-color) !important;
}

.menu-logout:hover {
  background-color: var(--terciary-background-color);
  color: var(--terciary-font-color) !important;
}
main {
  margin-top: 0;
}
  </style>
</head>
<body>
  
  <header>
      <a href="index.php?page=home" class="header-logo-container">
        Mega<span class="red">Book</span>
      </a >
      <nav class="header-items-container">
        <a href="index.php?page=sec_sigin" class="header-item">Libros</a>
        <a href="#" class="header-item">Escritor</a>
        <a href="#" class="header-item">Genero</a>
        {{with login}}
          <span class="username header-item" id="user-menu">{{userName}} <a href="index.php?page=sec_logout"><i class="fas fa-sign-out-alt"></i></a></span>
          <div class="user-menu active" >
            <a href="http://localhost/MegaBook/index.php?page=sec.login&redirto=%2FMegaBook%2Findex.php%3Fpage%3Dhome" class="profile menu-options">Tu perfil</a>
            <hr class="menu-separator">
            <h4 class="menu-actions active">Acciones</h4>
            <a href="index.php?page=mnt_libros" class="menu-options">Administrar libros</a>
            <a href="index.php?page=mnt_categorias" class="menu-options">Administrar categorías</a>
            <a href="index.php?page=mnt_autores" class="menu-options">Administrar autores</a>
            <a href="index.php?page=mnt_usuarios" class="menu-options">Administrar usuarios</a>
            <hr class="menu-separator">
            <a href="index.php?page=sec_logout" class="menu-logout">Cerrar sesión</a>
          </div>
        {{endwith login}}
      </nav>
    </header>
  
  <main>
  {{{page_content}}}
  </main>
  <footer>
    <div>Todo los Derechos Reservados 2021 &copy;</div>
  </footer>
  {{foreach EndScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
    <script>
      document.addEventListener("DOMContentLoaded", e => {
        document.getElementById("")
      });
    </script>
  {{endfor EndScripts}}
</body>
</html>