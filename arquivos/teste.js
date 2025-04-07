export let cart = [];

export function addToCart(product) {
  const found = cart.find(item => item.id === product.id);
  if (found) {
    found.quantity++;
  } else {
    cart.push({ ...product, quantity: 1 });
  }
}

export function removeFromCart(productId) {
  cart = cart.filter(item => item.id !== productId);
}

export function getCartTotal() {
  return cart.reduce((total, item) => total + item.price * item.quantity, 0).toFixed(2);
}