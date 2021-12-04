<style>

body {
    font-family: "P22";
    background-color: #fff;
}
    /* Cart Items */
h1{
    font-family: "P22";
    text-align: center;
}
img {
    max-width: 100%;
}

table{
    font-family: "Neue Haas";
}

.container {
    max-width: 120rem;
    margin: 0 auto;
}

.container-md {
    max-width: 75rem;
    margin: 0 auto;
}

@media only screen and (max-width: 1200px) {
    .container {
        padding: 0 3rem;
    }
    .container-md {
        padding: 0 3rem;
    }
}

.btn {
    display: inline-block;
    background-color: #fe0000;
    padding: 1.2rem 4rem;
    color: #fff;
    font-weight: 600;
    text-transform: uppercase;
    margin-top: 3rem;
    border: none;
}


.cart {
    margin: 10rem auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

.cart-info {
    display: flex;
    flex-wrap: wrap;
}

th {
    text-align: left;
    padding: 0.5rem;
    color: #fff;
    background-color: #030303;
    font-weight: normal;
}

td {
    padding: 1rem 0.5rem;
}

td input {
    width: 5rem;
    height: 3rem;
    padding: 0.5rem;
}

td a,
td button {
    color: #fe0000;
}

td img {
    width: 8rem;
    height: 10rem;
    margin-right: 1rem;
}

.total-price {
    display: flex;
    justify-content: flex-end;
    align-items: end;
    flex-direction: column;
    margin-top: 2rem;
}

.total-price table {
    border-top: 3px solid #030303;
    width: 100%;
    max-width: 35rem;
}

td:last-child {
    text-align: right;
}

th:last-child {
    text-align: right;
}

@media only screen and (max-width: 567px) {
    .cart-info p {
        display: none;
    }
}
</style>

<form action="get">
<div class="container-md cart">
    <h1>Carrito de Compra</h1>
        <table>
            <tr>
                <th>Libros</th>
                <th>Cantidad</th>
                <th>ISV</th>
                <th>Subtotal</th>
            </tr>
            
            <tr>
                <td>
                    <div class="cart-info">
                        <img src="public/imgs/megabook/megabookLogo.jpeg" alt="">
                        <div>
                            <p>El Resplandor</p>
                            <span>Price: $50.00</span>
                            <br />
                            <a href="#">remove</a>
                        </div>
                    </div>
                </td>
                <td><input type="number" value="1" min="1"></td>
                <td>
                    <span>150</span>
                </td>
                <td>$50.00</td>
            </tr>

            
            
        </table>

        <div class="total-price">
            <table>
                <tr>
                    <td>Subtotal</td>
                    <td>$200</td>
                </tr>
                <tr>
                    <td>Impuesto</td>
                    <td>$50</td>
                </tr>
                <tr>
                    <td>Total</td>
                    <td>$250</td>
                </tr>
            </table>
            <button type="submit" class="checkout btn">Proceder a Pagar</button>
        </div>
    </div>
</form>