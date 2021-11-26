<<<<<<< HEAD:src/Views/templates/mnt/categorias.view.tpl
<h1>Gestión de Categorías</h1>

=======
<style>
    td {
        text-align: center;
    }
    button {
        margin: 0.5em;
    }
</style>
<h1>Gestión de Libros</h1>
>>>>>>> 8338135db34ae1983a5eeec8993aaa0b63df255e:src/Views/templates/mnt/libros.view.tpl
<section class="WWFilter">

</section>
<section class="WWList">
  <table>
    <thead>
      <tr>
<<<<<<< HEAD:src/Views/templates/mnt/categorias.view.tpl
        <th>Código</th>
        <th>Categoría</th>
=======
        <th>Identificador</th>
        <th>Nombre</th>
        <th>Nombre del Autor</th>
        <th>Categorias</th>
>>>>>>> 8338135db34ae1983a5eeec8993aaa0b63df255e:src/Views/templates/mnt/libros.view.tpl
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
<<<<<<< HEAD:src/Views/templates/mnt/categorias.view.tpl
        <td>{{idCategorias}}</td>
        <td><a href="index.php?page=mnt_categoria&mode=DSP&idCategorias={{idCategorias}}">{{categoriaDes}}</a></td>
=======
        <td>{{idlibros}}</td>
        <td><a href="index.php?page=mnt_libro&mode=DSP&idlibros={{idlibros}}">{{nombreLibro}}</a></td>
        <td>{{nombreAutor}}</td>
        <td>{{categorias}}</td>
>>>>>>> 8338135db34ae1983a5eeec8993aaa0b63df255e:src/Views/templates/mnt/libros.view.tpl
        <td>
          {{if ~edit_enabled}}
          <form action="index.php" method="get">
             <input type="hidden" name="page" value="mnt_libro"/>
              <input type="hidden" name="mode" value="UPD" />
<<<<<<< HEAD:src/Views/templates/mnt/categorias.view.tpl
              <input type="hidden" name="idCategorias" value={{idCategorias}} />
=======
              <input type="hidden" name="idlibros" value={{idlibros}} />
>>>>>>> 8338135db34ae1983a5eeec8993aaa0b63df255e:src/Views/templates/mnt/libros.view.tpl
              <button type="submit">Editar</button>
          </form>
          {{endif ~edit_enabled}}
          {{if ~delete_enabled}}
          <form action="index.php" method="get">
             <input type="hidden" name="page" value="mnt_libro"/>
              <input type="hidden" name="mode" value="DEL" />
<<<<<<< HEAD:src/Views/templates/mnt/categorias.view.tpl
              <input type="hidden" name="idCategorias" value={{idCategorias}} />
=======
              <input type="hidden" name="idlibros" value={{idlibros}} />
>>>>>>> 8338135db34ae1983a5eeec8993aaa0b63df255e:src/Views/templates/mnt/libros.view.tpl
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
<<<<<<< HEAD:src/Views/templates/mnt/categorias.view.tpl
        window.location.assign("index.php?page=mnt_categoria&mode=INS&idCategorias=0");
=======
        window.location.assign("index.php?page=mnt_libro&mode=INS&idlibros=0");
>>>>>>> 8338135db34ae1983a5eeec8993aaa0b63df255e:src/Views/templates/mnt/libros.view.tpl
      });
    });
</script>
