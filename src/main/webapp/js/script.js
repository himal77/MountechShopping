/*
Adding item to the local storage
 */

function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if (cart == null) {
        // No cart yet
        let products = [];
        let product = {productId: pid, productName: pname, productQunatity: 1, productPrice: price}
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Prodcut is added for first time");

    } else {
        // Cart is already present
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid);

        if (oldProduct) {
            // only we have to increase the quantity
            oldProduct.prodcutQuantity = oldProduct.productQunatity + 1;
            pcart.map((item) => {
                if (item.productId == oldProduct.productId) {
                    item.productQunatity = oldProduct.prodcutQuantity;
                }
            })

            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Prodcut is increased");

        } else {
            // add the product
            let product = {productId: pid, productName: pname, productQunatity: 1, productPrice: price}
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Prodcut is added");
        }
    }
updateCart();
}

/*
Fetching items added to cart, from the local storage
 */

function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("Cart is empty !!");
        $(".cart-item").html("(0)");
        $(".cart-body").html("<h3>Cart doest not have any items </h3>");
        $(".checkout-btn").addClass('disabled');
    } else {
        // There is something to print in cart
        console.log(cart);
        $(".cart-item").html(`(${cart.length})`);

        let table=`
        <table class='table'>
        <thead class='thread-light'>
        <tr>
            <th>Name</th>
            <th>price</th>
            <th>Quantity</th>
            <th>Total price</th>
            <th>Action</th>
        </tr>
        </thead>
        `;
        cart.map((item)=>{
            table += `
            <tr>
                   <td>${item.productName}</td>
                   <td>${item.productPrice}</td>
                   <td>${item.productQunatity}</td>
                   <td>${item.productQunatity * item.productPrice}</td>
                   <td><button class="btn-danger btn-sm">remove</button></td>
            </tr>
            `
        })

        table += '</table>';

        $(".cart-body").html(table);
    }
}

$(document).ready(function () {
    updateCart();
})

