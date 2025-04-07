import { addToCart, removeFromCart, getCartTotal, cart } from "./cart.js";

export function renderProducts(products) {
  const productList = document.getElementById("products");
  productList.innerHTML = "";
  products.forEach(product => {
    const div = document.createElement("div");
    div.className = "product";
    div.innerHTML = `
      <p>${product.name} - R$ ${product.price.toFixed(2)}</p>
      <button data-id="${product.id}">Adicionar</button>
    `;
    productList.appendChild(div);
  });
}

export function renderCart() {
  const cartList = document.getElementById("cart");
  cartList.innerHTML = "";

  cart.forEach(item => {
    const li = document.createElement("li");
    li.innerHTML = `${item.name} x${item.quantity} - R$ ${(item.price * item.quantity).toFixed(2)} 
    <button data-remove="${item.id}">Remover</button>`;
    cartList.appendChild(li);
  });

  document.getElementById("total").innerText = `Total: R$ ${getCartTotal()}`;
}

export function setupEventListeners(products) {
  document.getElementById("products").addEventListener("click", e => {
    if (e.target.tagName === "BUTTON") {
      const id = parseInt(e.target.dataset.id);
      const product = products.find(p => p.id === id);
      addToCart(product);
      renderCart();
    }
  });

  document.getElementById("cart").addEventListener("click", e => {
    if (e.target.tagName === "BUTTON") {
      const id = parseInt(e.target.dataset.remove);
      removeFromCart(id);
      renderCart();
    }
  });
}