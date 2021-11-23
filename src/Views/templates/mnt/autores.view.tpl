
<style>
  td{
    text-align: center;
  }

  .crud{
    display: flex;
    width: 150px;
  }

  .editar{
    margin-right: 10px;
  }
</style>


<h1>Gestión de Autores</h1>
<section class="WWFilter">

</section>
<section class="WWList">
  <table>
    <thead>
      <tr>
        <th>Código Autor</th>
        <th>Nombre del Autor</th>
        <th>Apellido Autor</th>
        <th>Genero del Autor</th>
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
        <td>{{idAutor}}</td>
        <td><a href="index.php?page=mnt_autor&mode=DSP&idAutor={{idAutor}}">{{nombreAutor}}</a></td>
        <td>{{apellidoAutor}}</td>
        <td>{{genero}}</td>
        <td class="crud">
          {{if ~edit_enabled}}
          <form action="index.php" method="get" class="editar">
             <input type="hidden" name="page" value="mnt_autor"/>
              <input type="hidden" name="mode" value="UPD" />
              <input type="hidden" name="idAutor" value={{idAutor}} />
              <button type="submit">Editar</button>
          </form>
          {{endif ~edit_enabled}}
          {{if ~delete_enabled}}
          <form action="index.php" method="get" class="eliminar">
             <input type="hidden" name="page" value="mnt_autor"/>
              <input type="hidden" name="mode" value="DEL" />
              <input type="hidden" name="idAutor" value={{idAutor}} />
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
        window.location.assign("index.php?page=mnt_autor&mode=INS&idAutor=0");
      });
    });
</script>
