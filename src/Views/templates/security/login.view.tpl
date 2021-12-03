<style>

    body {
    font-family: "P22";
    background-color: #fff;
    color: #243a6f;
  }

  :root {
    --login-bg: #f8f3ff;
    --title-bg: #fe0000;
    --button-bg: #030303;
    --light-pink: #fe0000;
    --image-bg: #eadbff;
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


p{
  color: #030303;
}
  a {
    text-decoration: none;
    color: #fe0000;
  }

  .login-container {
    height: 40.75em;
    width: 70em;
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

  .title {
    font-size: 2.25rem;
    font-weight: 600;
    letter-spacing: 1px;
    color: var(--title-bg);
    font-family: "P22";
  }

  .login-info-container>p {
    font-size: 1.25em;
    margin-top: 1.5em;
  }

  .inputs-container {
    font-family: "Neue Haas";
    height: 55%;
    width: 85%;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
  }

  .input,
  .btn {
    width: 90%;
    height: 3.125rem;
    font-size: 1em;
  }

  .input {
    padding-left: 20px;
    border: none;
    border-radius: 5px;

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

  input[type="text"],input[type="password"]{
      font-family: "Neue Haas";
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
    <h1 class="title">Iniciar Sesión</h1>

    <form class="inputs-container" method="post"
      action="index.php?page=sec_login{{if redirto}}&redirto={{redirto}}{{endif redirto}}">

      <input class="input" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}"
        placeholder="Correro Electronico">
      {{if errorEmail}}
      <div class="error">
        <p>{{errorEmail}}</p>
      </div>
      {{endif errorEmail}}
      <input class="input" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" placeholder="Contraseña">
      {{if errorPswd}}
      <div class="error">
        <p>{{errorPswd}}</p>
      </div>
      {{endif errorPswd}}


      {{if generalError}}
      <div class="row">
        {{generalError}}
      </div>
      {{endif generalError}}


      <button class="btn" type="submit" id="btnLogin">Acceder</button>
      <p>¿No tienes cuenta? <span class="span"><a href="index.php?page=sec_register">Registrate</a></span></p>
    </form>
  </div>
  <img class="image-container" src="public/imgs/megabook/megabooklogo2.jpeg" alt="">
</div>