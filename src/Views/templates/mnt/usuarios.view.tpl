<h1>Gestión de Usuarios</h1>
<section class="WWFilter">

</section>
<section class="WWList">
  <table>
    <thead>
      <tr>
        <th>usercod</th>
        <th>useremail</th>
        <th>username</th>
        <th>userpswd</th>
        <th>userfching</th>
        <th>userpswdest</th>
        <th>userpswdexp</th>
        <th>userest</th>
        <th>useractcod</th>
        <th>userpswdchg</th>
        <th>usertipo</th>
        <th>
          {{if new_enabled}}
          <button id="btnAdd">Nuevo</button>
          {{endif new_enabled}}
        </th>
      </tr>
    </thead>
    <tbody>
      {{foreach items}}
      <tr>
        <td>{{usercod}}</td>
        <td><a href="index.php?page=mnt_usuario&mode=DSP&usercod={{usercod}}">{{useremail}}</a></td>
        <td>{{username}}</td>
        <td>{{userpswd}}</td>
        <td>{{userfching}}</td>
        <td>{{userpswdest}}</td>
        <td>{{userpswdexp}}</td>
        <td>{{userest}}</td>
        <td>{{useractcod}}</td>
        <td>{{userpswdchg}}</td>
        <td>{{usertipo}}</td>
        <td>
          {{if ~edit_enabled}}
          <form action="index.php" method="get">
             <input type="hidden" name="page" value="mnt_usuario"/>
              <input type="hidden" name="mode" value="UPD" />
              
              <input type="hidden" name="usercod" value={{usercod}} />
              <button type="submit">Editar</button>
          </form>
          {{endif ~edit_enabled}}
          {{if ~delete_enabled}}
          <form action="index.php" method="get">
             <input type="hidden" name="page" value="mnt_usuario"/>
              <input type="hidden" name="mode" value="DEL" />
              <input type="hidden" name="usercod" value={{usercod}} />
              <button type="submit">Eliminar</button>
          </form>
          {{endif ~delete_enabled}}
        </td>
      </tr>
      {{endfor items}}
    </tbody>
  </table>
</section>
<script>
   document.addEventListener("DOMContentLoaded", function () {
      document.getElementById("btnAdd").addEventListener("click", function (e) {
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=mnt_usuario&mode=INS&usercod=0");
      });
    });
</script>
