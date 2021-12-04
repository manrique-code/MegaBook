<style>
  :root {
    --login-bg: #f8f3ff;
    --title-bg: #fe0000;
    --button-bg: #030303;
    --light-pink: #fe0000;
    --image-bg: #eadbff;
  }

  body {
    font-family: "P22";
    background-color: #fff;
  }

  header {
    display: none;
  }

  main {
    padding: 0;
  }

  footer {
    display: none;
  }



  a {
    text-decoration: none;
    color: #fe0000;
  }

  .login-container {

    height: 42rem;
    width: 77em;
    margin: 6em auto;
    border-radius: 10px;
    display: flex;
    justify-content: space-between;
    overflow: hidden;
  }

  .login-info-container {
    width: 70%;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    padding-top: 0.5rem;
    background-color: #FFF;
  }

  .image-container {
    padding: 2rem;
    width: 60%;
    height: 500px;
    background-color: #FFF;
    box-sizing: border-box;
  }

  p {
    color: #030303;
  }

  .title {
    font-size: 2.25rem;
    font-weight: 600;
    letter-spacing: 1px;
    color: var(--title-bg);
  }

  .login-info-container>p {
    font-size: 1.25em;
    margin-top: 1.5em;
  }

  .inputs-container {
    font-family: "Neue Haas";
    height: 100%;
    width: 100%;

  }

  .input,
  .btn {
    width: 300px;
    height: 3.125rem;
    font-size: 1em;
  }

  input[type="date"] {
    font-size: 1rem;
  }

  .input {
    padding-left: 20px;
    border: none;
    border-radius: 5px;
    margin-right: 25px;
    letter-spacing: 1px;
    box-sizing: border-box;
  }

  .input:hover {
    border: 2px solid var(--button-bg);
  }

  .btn {
    width: 60%;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: white;
    border: none;
    border-radius: 5px;
    background-color: var(--button-bg);
    cursor: pointer;
    margin-bottom: 20px;
  }

  .button {
    height: 4.125rem;
  }

  .inputs-container p {
    margin: 0;
  }

  .span {
    color: var(--light-pink);
    font-weight: 600;
    cursor: pointer;
  }

  .error,
  .row {
    height: 15px;
    text-align: left;
  }

  .flex {
    flex-flow: row wrap;
  }

  section {
    width: 300px;
    text-align: left;
    margin-bottom: 25px;
  }

  .derecha {
    margin-right: 25px;
  }

  label {
    color: #000000;

  }

  input[type="date"] {
    font-family: "Neue Haas";
  }

  .bottom {
    margin-bottom: 50px;
  }

  @media screen and (max-width: 1000px) {
    .login-container {
      width: 70%;
      margin-top: 3rem;
    }

    .login-info-container {
      width: 100%;
      border-radius: 5px;
    }

    .image-container {
      display: none;
    }
  }

  @media screen and (max-width: 650px) {
    .login-container {
      width: 90%;
    }
  }

  @media screen and (max-width: 500px) {
    .login-container {
      height: 90%;
    }

    .social-login {
      flex-direction: column;
      align-items: center;
      height: 30%;
    }

    .login-info-container>p {
      margin: 0;
    }
  }
</style>

<div class="login-container">
  <div class="login-info-container">
    <h1 class="title">Registrarse</h1>

    <form class="inputs-container" method="post" action="index.php?page=sec_register">
      <div class="flex">

        <section class="derecha">
          <label for=""> Correo Electronico: </label>
          <input class="input" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}"
            placeholder="Correro Electronico">

          {{if errorEmail}}
          <div class="error">
            <p>{{errorEmail}}</p>
          </div>
          {{endif errorEmail}}

        </section>

        <section class=>
          <label for="">Nombre Completo: </label>
          <input class="input" type="text" id="txtNombre" name="txtNombre" value="{{txtNombre}}"
            placeholder="Nombre Completo">

          {{if errorNombre}}
          <div class="error">
            <p>{{errorNombre}}</p>
          </div>
          {{endif errorNombre}}

        </section>

        <section class="derecha">
          <label for="">Contraseña: </label>
          <input class="input" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" placeholder="Contraseña">

          {{if errorPswd}}
          <div class="error bottom">
            <p>{{errorPswd}}</p>
          </div>
          {{endif errorPswd}}

          {{if errorConfirmacion}}
          <div class="error">
            <p>{{errorConfirmacion}}</p>
          </div>
          {{endif errorConfirmacion}}

        </section>

        <section>
          <label for="">Confirmar Contraseña: </label>
          <input class="input" type="password" id="txtPswd2" name="txtPswd2" value="{{txtPswd2}}"
            placeholder="Confirme Contraseña">
        </section>

        <section class="derecha">
          <label for="">Fecha Nacimieto: </label>
          <input class="input" type="date" id="txtFecha" name="txtFecha" value="{{txtFecha}}">

          {{if errorFecha}}
        <div class="row">
          {{errorFecha}}
        </div>
        {{endif errorFecha}}

        </section> 

        {{if generalError}}
        <div class="row">
          {{generalError}}
        </div>
        {{endif generalError}}

      </div>

      <div class="button">
        <button class="btn" type="submit" id="btnLogin">Crear Cuenta</button>
        <p>¿Ya tienes cuenta? <span class="span"><a href="index.php?page=sec_login">Iniciar Sesion</a></span></p>
      </div>

    </form>
  </div>
  <img class="image-container" src="public/imgs/megabook/megabooklogo2.jpeg" alt="">
</div>
