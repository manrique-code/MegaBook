<section>
    <form action="index.php?page=mnt_librodetalle&mode={{mode}}&idlibros={{idlibros}}" method="post" enctype="multipart/form-data">
        <fieldset class="libro" id="libro">
            
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
                    
                    <div class="step-item">
                        <span class="step-number">3</span>
                        <span class="step-name">Categoria</span>
                    </div>

                    <div class="step-item">
                        <span class="step-number">4</span>
                        <span class="step-name">Precio</span>
                    </div>
            
            {{endif steps}}

            <h1 class="title-mnt section-mnt">{{mode_dsc}}</h1>
            
            <section class="section-mnt">
                <label for="idlibros">Identificador del libro</label>
                <input type="hidden" name="idlibros" id="idlibros" value="{{idlibros}}">
                <input type="hidden" name="mode" id="mode" value="{{mode}}">
                <input type="hidden" name="xsrftoken" id="xsrftoken" value="{{xsrftoken}}">
                <input type="text" name="idlibrosdummy" id="idlibros" value="{{idlibros}}">
            </section>
        
            <section class="section-mnt section-detail-libro">
                <label for="coverart" class="label-mnt">{{nombreLibro}}</label>
                <div class="coverart-libro" id="covertArtLibro">
                    <img 
                    src="http://localhost/MegaBook/{{coverart}}" 
                    alt="Buscá la portada del libro entre tus archivos" 
                    class="coverart-img" 
                    id="coverArtImg" 
                    name="coverartImg">
                </div>
                <span class="descuento-libro-detalle">{{descuento}}</span>
                <span class="precio-libro-detalle">{{precio}}</span>
                <span class="stock-libro-detalle">{{stock}}</span>
            </section>

            <section class="section-mnt stock-libro-mnt">
                <label for="stock" class="label-mnt">Stock en inventario</label>
                <div class="input-custom">
                    <input 
                    type="number" 
                    class="input-mnt stock" 
                    id="stock" 
                    value="{{stock}}" 
                    name="stock" 
                    min="0" />
                    <span class="input-tag">Unidades</span>
                </div>

            </section>

            <section class="section-mnt precio-libro-mnt">
                <label for="precio" class="label-mnt">Precio del libro</label>
                <div class="input-precio-libro input-custom" id="inputPrecioLibro">
                    <input 
                    type="number" 
                    name="precio" 
                    id="precio" 
                    class="precio" 
                    min="0" 
                    value="{{precio}}" />
                    <span class="input-tag">L.</span>
                </div>
            </section>

            <section class="section-mnt desc-libro-mnt">
                <label for="desc">Descuento (%)</label>
                <div class="input-custom">
                    <input 
                    type="number" 
                    name="desc" 
                    id="desc" 
                    class="desc" 
                    min="0" 
                    value="{{desc}}" />
                    <span class="input-tag">%</span>
                </div>
            </section>

            <section class="section-mnt descexp-libro-mnt">
                <label for="descexp">¿Cuántos días de descuento?</label>
                <div class="input-custom">
                    <input 
                    type="number" 
                    name="descexp" 
                    id="descexp" 
                    class="input-mnt" 
                    value="{{descexp}}" 
                    min="0" />
                    <span class="input-tag">Días</span>
                </div>
            </section>

            {{if hasErrors}}
                <section class="section-mnt section-error">
                    <ul>
                        {{foreach Errors}}
                            <li>{{this}}</li>
                        {{endfor Errors}}
                    </ul>
                </section>
            {{endif hasErrors}}

            <section class="section-mnt buttons-container">
                {{if showAction}}
                    <button 
                    type="submit" 
                    name="btnGuardar" 
                    class="primary-button" 
                    id="btnGuardar" 
                    value="G">Guardar detalles</button>
                {{endif showAction}}
                <button type="submit" id="btnCancelar" class="secondary-button">Cancelar</button>
            </section>

        </fieldset>
    </form>
</section>