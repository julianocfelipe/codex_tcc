# Documentação Técnica do Projeto

## Sumário

- [store.js](#storejs)
- [index.html](#indexhtml)
- [app.js](#appjs)
- [teste.js](#testejs)
    - [Funções](#funções-testejs)
        - [addToCart](#addtocart)
        - [removeFromCart](#removefromcart)
        - [getCartTotal](#getcarttotal)
- [ui.js](#uijs)
    - [Funções](#funções-uijs)
        - [renderProducts](#renderproducts)
        - [renderCart](#rendercart)
        - [setupEventListeners](#setupeventlisteners)

---

## store.js

Este arquivo provavelmente contém a lógica para gerenciar o estado da aplicação, como dados de produtos ou informações do usuário. No entanto, com base no JSON fornecido, este arquivo não contém classes ou funções.

---

## index.html

Este arquivo representa a estrutura HTML da aplicação.  Com base no JSON fornecido, este arquivo não contém classes ou funções.

---

## app.js

Este arquivo é o ponto de entrada da aplicação e contém a lógica principal para inicializar e coordenar diferentes partes do sistema.

**Dependências:**

*   `./store.js`
*   `./ui.js`

Com base no JSON fornecido, este arquivo não contém classes ou funções.

---

## teste.js

Este arquivo contém funções relacionadas ao carrinho de compras.

### Funções

#### addToCart

```javascript
const found = cart.find(item => item.id === product.id);
if (found) {
  found.quantity++;
} else {
  cart.push({ ...product, quantity: 1 });
}
```

Adiciona um produto ao carrinho. Se o produto já existe no carrinho, incrementa sua quantidade. Caso contrário, adiciona o produto ao carrinho com quantidade 1.

#### removeFromCart

```javascript
cart = cart.filter(item => item.id !== productId);
```

Remove um produto do carrinho com base no seu `productId`.

#### getCartTotal

```javascript
return cart.reduce((total, item) => total + item.price * item.quantity, 0).toFixed(2);
```

Calcula o valor total dos itens no carrinho.  Utiliza `reduce` para somar o preço de cada item multiplicado pela sua quantidade e formata o resultado para duas casas decimais.

---

## ui.js

Este arquivo contém funções relacionadas à manipulação da interface do usuário.

### Funções

#### renderProducts

```javascript
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
```

Renderiza a lista de produtos na página.  Itera sobre a lista de produtos e cria um elemento `div` para cada um, contendo o nome, preço e um botão "Adicionar".

#### renderCart

```javascript
const cartList = document.getElementById("cart");
cartList.innerHTML = "";

cart.forEach(item => {
  const li = document.createElement("li");
  li.innerHTML = `${item.name} x${item.quantity} - R$ ${(item.price * item.quantity).toFixed(2)} 
  <button data-remove="${item.id}">Remover</button>`;
  cartList.appendChild(li);
});

document.getElementById("total").innerText = `Total: R$ ${getCartTotal()}`;
```

Renderiza os itens do carrinho na página. Itera sobre os itens do carrinho e cria um elemento `li` para cada um, contendo o nome, quantidade, preço total e um botão "Remover". Atualiza também o total do carrinho exibido na página.

#### setupEventListeners

```javascript
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
```

Configura os event listeners para os botões "Adicionar" dos produtos e "Remover" dos itens do carrinho.  Quando um botão "Adicionar" é clicado, adiciona o produto correspondente ao carrinho e renderiza o carrinho novamente. Quando um botão "Remover" é clicado, remove o item correspondente do carrinho e renderiza o carrinho novamente.
