import { products } from "./store.js";
import { renderProducts, renderCart, setupEventListeners } from "./ui.js";

document.addEventListener("DOMContentLoaded", () => {
  renderProducts(products);
  renderCart();
  setupEventListeners(products);
});