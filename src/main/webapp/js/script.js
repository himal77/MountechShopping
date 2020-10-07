
/*
Adding item to the local storage
 */

function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if(cart == null) {
        // No cart yet
        let products = [];
        let product={productId:pid, productName:pname, productQunatity:1, productPrice:price}
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Prodcut is added for first time");

    } else {
        // Cart is already present
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item)=>item.productId == pid);

        if(oldProduct) {
            // only we have to increase the quantity
            oldProduct.prodcutQuantity = oldProduct.productQunatity + 1;
            pcart.map((item)=>{
                if(item.productId == oldProduct.productId) {
                    item.productQunatity = oldProduct.prodcutQuantity;
                }
            })

            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Prodcut is increased");

        } else {
            // add the product
            let product={productId:pid, productName:pname, productQunatity:1, productPrice:price}
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Prodcut is added");
        }
    }
}

/*
Fetching items added to cart, from the local storage
 */

function updateCart() {

}