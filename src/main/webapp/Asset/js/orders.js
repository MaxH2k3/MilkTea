/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
checkMaxDigit();
checkQuantity();

function updateOrderInformation() {
    let products = document.getElementsByClassName('product');
    Array.from(products).forEach(product => {
        sumQuantity();
        sumPrice(product);
        sumTotalPrice();
        checkOut();
    });
}

function checkQuantity() {
    let products = document.getElementsByClassName('product');
    Array.from(products).forEach(product => {
        var quantityElements = product.querySelector('.quantity');
        quantityElements.addEventListener('input', () => {
            sumQuantity();
            sumPrice(product);
            sumTotalPrice();
            checkOut()
        });
    });
}

function sumQuantity() {
    var quantityElements = document.getElementsByClassName('quantity');
    var result = 0;
    Array.from(quantityElements).forEach(element => {
        result += parseInt(element.value);
    });

    // calculate all product
    var totalAllProduct = document.getElementById("totalAllProduct");
    totalAllProduct.innerHTML = result + " product";
}

function sumPrice(product) {
    var priceElements = product.querySelector('[name="price"]');
    var quantity = product.querySelector('.quantity');
    //calculate sum price of each product
    var totalPriceProduct = product.querySelector('.price');
    totalPriceProduct.innerHTML = parseInt(quantity.value * priceElements.value);
}

function sumTotalPrice() {
    var listPrice = document.getElementsByClassName("price");
    var result = 0;
    Array.from(listPrice).forEach(price => {
        result += parseInt(price.innerHTML);
    });
    document.querySelector(".total-price").innerHTML = result;
}

function checkOut() {
    var totalPrice = document.querySelector(".total-price");
    var discount = document.getElementById("discount");
    document.querySelector(".checkout").innerHTML =
            (parseInt(totalPrice.innerHTML) - (parseInt(totalPrice.innerHTML) * parseInt(discount.innerHTML) / 100));
}

function checkMaxDigit() {
    let inputNums = document.getElementsByClassName("quantity");
    for (const element of inputNums) {
        element.addEventListener("input", () => {
            if (element.value.length >= 3) {
                element.value = element.value.slice(0, 3);
            }

            if (element.value <= -1) {
                element.value = 0;
            }

            if (element.value >= 100) {
                element.value = 100;
            }
        });

    }
}

