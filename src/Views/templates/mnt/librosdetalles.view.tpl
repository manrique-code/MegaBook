<style>
    td {
        text-align: center;
    }
    button {
        margin: 0.5em;
    }
</style>
<h1>Gestión de Libros</h1>
<section class="WWFilter">

</section>
<section class="WWList">
  <table>
    <thead>
      <tr>
        <th>Código</th>
        <th>Libros</th>
        <th>Stock</th>
        <th>Precio</th>
        <th>Descuento</th>
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
        <td>{{idlibros}}</td>
        <td><a href="index.php?page=mnt_librodetalle&mode=DSP&idlibros={{idlibros}}">{{nombreLibro}}</a></td>
        <td>{{stock}}</td>
        <td>{{precio}}</td>
        <td>{{desc}}</td>
        <td>
          {{if ~edit_enabled}}
          <form action="index.php" method="get">
             <input type="hidden" name="page" value="mnt_librosdetalles"/>
              <input type="hidden" name="mode" value="UPD" />
              <input type="hidden" name="idlibros" value={{idlibros}} />
              <button type="submit">Editar</button>
          </form>
          {{endif ~edit_enabled}}
          {{if ~delete_enabled}}
          <form action="index.php" method="get">
             <input type="hidden" name="page" value="mnt_librosdetalles"/>
              <input type="hidden" name="mode" value="DEL" />
              <input type="hidden" name="idlibros" value={{idlibros}} />
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
        window.location.assign("index.php?page=mnt_librodetalle&mode=INS&idlibros=0");
      });
    });
</script>
