## Visão Geral da Documentação

Este documento fornece uma visão geral completa da estrutura e funcionalidade de um projeto web modularizado. O projeto abrange diversos aspectos, incluindo validação de formulários, estilos CSS, um player de música com visualizador e um menu de navegação responsivo. A documentação detalha cada componente, sua estrutura de arquivos, classes CSS relevantes e a lógica de JavaScript subjacente.

**Componentes Principais:**

*   **Validação de Formulários:** Garante a integridade dos dados nos formulários de login e cadastro, utilizando JavaScript.
*   **Estilos CSS:** Organizados em arquivos distintos para facilitar a manutenção e aplicação de estilos específicos a diferentes componentes da aplicação.
*   **Player de Música com Visualizador:** Um componente dinâmico que permite a reprodução de música e exibe uma visualização em tempo real através do canvas.
*   **Menu de Navegação Responsivo:** Um menu que se adapta a diferentes tamanhos de tela, proporcionando uma experiência de usuário consistente em dispositivos móveis e desktops.

## Estrutura de Pastas e Arquivos

```
├── css
│   ├── estilo1.css        # Estilos gerais da aplicação (formulários, elementos básicos).
│   ├── musica.css         # Estilos específicos do player de música.
│   └── principal.css      # Estilos da página principal (navegação, categorias).
├── img                   # Pasta de imagens
│   ├── prin.jpg          # Imagem de fundo da página principal
│   └── samambaia.jpg     # Imagem de fundo das categorias
├── js
│   ├── cadastro_js.js    # Lógica de validação dos formulários de cadastro e login.
│   ├── musica.js         # Lógica do player de música e visualizador.
│   └── principal_js.js   # Lógica do menu de navegação responsivo (MobileNavbar).
├── index.html          # Arquivo HTML principal que estrutura a página.
└── lofi songs for slow days_160k.mp3 #Música de exemplo
```

## Detalhes da Estrutura e Arquivos

### CSS

*   **`estilo1.css`:** Estilos base para elementos HTML como `body`, `input`, `div`, etc. Define tipografia, cores e layout.
*   **`musica.css`:** Estilos específicos para o player de música e o visualizador, incluindo layout, cores e ícones.
*   **`principal.css`:** Estilos da página principal, navegação (desktop e mobile), logo e categorias. Implementa responsividade com media queries.

### JavaScript

*   **`cadastro_js.js`:** Lógica de validação para os formulários de login e cadastro. Usa jQuery para exibir alertas.  A função `validar_cadastro()` está incompleta e necessita implementação.
*   **`musica.js`:** Implementação do player de música e visualizador, estruturado em módulos: `Player`, `Scene`, `Framer`, `Tracker` e `Controls`.
*   **`principal_js.js`:** Contém a classe `MobileNavbar` que gerencia o comportamento do menu de navegação em dispositivos móveis, utilizando event listeners e manipulação de classes CSS.

### Arquivos de Imagem

*   **`prin.jpg`:** Imagem de fundo para a seção principal da página (`main#principal`).
*   **`samambaia.jpg`:** Imagem de fundo para a seção de categorias (`div#fundocat`).

### Arquivo HTML

*   **`index.html`:** Estrutura a página, importa os arquivos CSS e JavaScript e define os elementos HTML que são estilizados e manipulados pelos arquivos.

## Tecnologias Utilizadas

*   **HTML:** Estrutura básica da página web.
*   **CSS:** Estilização da página, layout e responsividade.
*   **JavaScript:** Interatividade, validação de formulários e criação de componentes dinâmicos.
*   **jQuery:** Utilizado em `cadastro_js.js` para manipulação do DOM e exibição de alertas.
*   **Web Audio API:** Utilizado no player de música para a reprodução e análise do áudio.

## Conclusão

Este projeto demonstra uma abordagem modular e organizada para o desenvolvimento web, separando responsabilidades entre arquivos CSS e JavaScript. A utilização de arquivos CSS específicos para cada componente melhora a manutenibilidade, enquanto o JavaScript adiciona interatividade e dinamismo à aplicação.
 Este documento descreve a funcionalidade do arquivo `cadastro_js.js`, que contém funções para validar formulários de login e cadastro.  O foco principal é a validação de campos obrigatórios.

## 1. Visão Geral

O arquivo `cadastro_js.js` implementa duas funções principais para validação de formulários: `validar_login` e `validar_cadastro`. Ambas as funções verificam se campos obrigatórios foram preenchidos e exibem mensagens de alerta em caso de campos vazios, utilizando um modal do Bootstrap (presumivelmente `$('#alerta')`).

## 2. Código Fonte

```javascript
function validar_login() {

if (usuario.value === "" && senha.value === ""){
		mensagem.innerHTML = "Preencha os campos faltantes.";
		$('#alerta').modal('show');
}	

	if (usuario.value === ""){
		mensagem.innerHTML = "Preencha o campo usuario.";
		$('#alerta').modal('show');
}

if (senha.value === ""){
		mensagem.innerHTML = "Preencha o campo senha.";
		$('#alerta').modal('show');
}

function validar_cadastro() {
```

**Observações:**

*   O código fornecido está incompleto.  A função `validar_cadastro` está declarada, mas sem implementação.
*   A variável `mensagem` precisa ser definida no escopo global ou dentro da função onde é utilizada. Caso contrário, gerará um erro.
*   As variáveis `usuario` e `senha` precisam ser elementos HTML referenciados corretamente, normalmente através de `document.getElementById()` ou similares.

## 3. Funções

### 3.1. `validar_login()`

Essa função valida o formulário de login, verificando se os campos de usuário e senha foram preenchidos.

**Tabela de Detalhes:**

| Parâmetro | Tipo   | Descrição                               |
| :-------- | :----- | :-------------------------------------- |
| *Nenhum*  |        | A função utiliza variáveis globais/DOM. |

**Lógica:**

1.  Verifica se ambos os campos `usuario` e `senha` estão vazios. Se sim, exibe um alerta genérico "Preencha os campos faltantes.".
2.  Verifica se o campo `usuario` está vazio. Se sim, exibe um alerta específico "Preencha o campo usuario.".
3.  Verifica se o campo `senha` está vazio. Se sim, exibe um alerta específico "Preencha o campo senha.".
4. Em todos os casos, o modal `#alerta` é exibido.

### 3.2. `validar_cadastro()`

Essa função, conforme fornecido, não tem implementação.  Ela deve validar o formulário de cadastro, verificando se os campos obrigatórios foram preenchidos.  Assume-se que ela seguirá uma lógica similar a `validar_login()`, porém com campos diferentes.

**Tabela de Detalhes (Com base em uma possível implementação):**

| Parâmetro | Tipo   | Descrição                               |
| :-------- | :----- | :-------------------------------------- |
| *Nenhum*  |        | A função utiliza variáveis globais/DOM. |

**Implementação Sugerida (Exemplo):**

```javascript
function validar_cadastro() {
    if (nome.value === "") {
        mensagem.innerHTML = "Preencha o campo Nome.";
        $('#alerta').modal('show');
        return; // Impede que as próximas validações ocorram se essa falhar
    }

    if (email.value === "") {
        mensagem.innerHTML = "Preencha o campo Email.";
        $('#alerta').modal('show');
        return;
    }

    // Adicione mais validações para outros campos do formulário de cadastro
}
```

**Observação:**  O código sugerido é um exemplo e deve ser adaptado para os campos específicos do seu formulário de cadastro.

## 4. Dependências

*   **jQuery:** Utilizado para exibir o modal de alerta (`$('#alerta').modal('show')`).
*   **Bootstrap:** Framework CSS que provê o estilo e funcionalidade do modal `alerta`.
*   **HTML com elementos `usuario`, `senha`, `nome`, `email` e `mensagem`:** O código assume que existem elementos HTML com esses IDs definidos e acessíveis no DOM.

## 5. Próximos Passos

*   Implementar completamente a função `validar_cadastro()`.
*   Adicionar validações mais robustas, como verificação de formato de email, tamanho mínimo de senha, etc.
*   Considerar a utilização de uma biblioteca de validação de formulários mais completa.
*   Adicionar tratamento de erros e mensagens de erro mais informativas.
*   Evitar variáveis globais. Passar os elementos do formulário como argumentos para as funções de validação.
*   Adicionar comentários ao código para melhorar a legibilidade.
*   Validar os dados no servidor também para maior segurança.



Este documento descreve o arquivo de estilo `estilo1.css`, que define a aparência visual do projeto.

## Visão Geral

O arquivo `estilo1.css` define estilos globais para a página, incluindo fontes, cores, layouts e elementos interativos. Ele utiliza uma fonte do Google Fonts (Merriweather) e define estilos para elementos como `body`, `h1`, `input`, `select`, `div`, e links (`a`).

## Código-Fonte

```css
@import url('https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@1,300&family=Noto+Sans+JP:wght@100&display=swap');

* {
	margin: 0px; 
	padding: 0px;
}

@font-face {
  font-family: fnote;
  src: url();
}

body{
	font-family: 'Merriweather';
	background-attachment: fixed;
	background-size: cover;
	background-repeat: no-repeat;
}

input::placeholder {
  color: rgba(220,220,220,0.9);
}

h1{
	font-size: 50px;
	text-align: center;
	padding: 20px;
	display: block;
	color: white;
}

input{
	display: block;
	padding: 3px;
	margin-top: 5px;
	width: 350px;
	height: 35px;
	text-align: center;
	font-size: 20px;
	border: none;
	background-color: rgba(222,184,135,0.5);
	color: white;
	border-radius: 10px;

}

select{
	display: block;
	padding: 3px;
	margin-top: 5px;
	width: 350px;
	height: 35px;
	text-align: center;
	font-size: 20px;
	border: none;
	background-color: rgba(222,184,135,0.5);
	color: white;
	border-radius: 10px;

}

.esconder{
	background-color: rgba(220,220,220,0.01); 
	color: rgba(220,220,220,0.1);
	display: none;
	font-size: 1px;
	height: 1px;
	width: 1px;
	margin: 0px;
	padding: 1px 1px;
}

div {
	height: 335px;
	width: 500px;
	margin: 200px auto 150px auto;
	background-color: rgba(0, 0, 0,0.3); 
	border: 3px solid black; 
}

p#a{
  color: white;
  text-align: center;
  display: block;
  text-decoration: none;
  font-size: 18px;
}

.a{
  font-size: 20px;
  color: white;
  text-align: center;
  display: block;
  text-decoration: none;
  transition: 0.3s;
}

.a:hover{
   text-decoration: underline;
   transition: 0.3s;
   color: rgba(60, 179, 113,1);

}

.botao{
	background-color: rgba(222,184,135,0.3);
	cursor: pointer;
	transition: 0.5s;
	padding-left: 10px;
}

.botao:hover{
	background-color: rgba(222,184,135,0.7);
	transition: 0.5s;
}
```

## Elementos e Estilos Definidos

### Body

| Propriedade | Valor | Descrição |
|---|---|---|
| `font-family` | `'Merriweather'` | Define a fonte principal do corpo do documento. |
| `background-attachment` | `fixed` |  Fixa o background, de modo que ele não role com a página. |
| `background-size` | `cover` |  Redimensiona a imagem de fundo para cobrir todo o elemento. |
| `background-repeat` | `no-repeat` |  Impede a repetição da imagem de fundo. |

### h1 (Título Principal)

| Propriedade | Valor | Descrição |
|---|---|---|
| `font-size` | `50px` | Define o tamanho da fonte do título. |
| `text-align` | `center` | Centraliza o texto do título. |
| `padding` | `20px` | Adiciona um espaçamento interno ao redor do título. |
| `display` | `block` | Garante que o elemento seja exibido como um bloco. |
| `color` | `white` | Define a cor do texto como branco. |

### input (Campos de Entrada)

| Propriedade | Valor | Descrição |
|---|---|---|
| `display` | `block` | Garante que o elemento seja exibido como um bloco. |
| `padding` | `3px` | Adiciona um espaçamento interno ao redor do texto. |
| `margin-top` | `5px` | Adiciona uma margem superior. |
| `width` | `350px` | Define a largura do campo de entrada. |
| `height` | `35px` | Define a altura do campo de entrada. |
| `text-align` | `center` | Centraliza o texto dentro do campo. |
| `font-size` | `20px` | Define o tamanho da fonte do texto. |
| `border` | `none` | Remove a borda padrão. |
| `background-color` | `rgba(222,184,135,0.5)` | Define a cor de fundo com transparência. |
| `color` | `white` | Define a cor do texto como branco. |
| `border-radius` | `10px` | Arredonda os cantos do campo. |

### select (Caixas de Seleção)

Possui as mesmas propriedades e valores que o elemento `input`.

### .esconder (Classe para Elementos Ocultos)

| Propriedade | Valor | Descrição |
|---|---|---|
| `background-color` | `rgba(220,220,220,0.01)` | Define uma cor de fundo quase transparente. |
| `color` | `rgba(220,220,220,0.1)` | Define a cor do texto quase transparente. |
| `display` | `none` | Oculta o elemento. |
| `font-size` | `1px` | Define um tamanho de fonte mínimo. |
| `height` | `1px` | Define uma altura mínima. |
| `width` | `1px` | Define uma largura mínima. |
| `margin` | `0px` | Remove margens. |
| `padding` | `1px 1px` | Adiciona um espaçamento interno mínimo. |

### div (Contêiner Principal)

| Propriedade | Valor | Descrição |
|---|---|---|
| `height` | `335px` | Define a altura do contêiner. |
| `width` | `500px` | Define a largura do contêiner. |
| `margin` | `200px auto 150px auto` | Centraliza o contêiner horizontalmente e define margens verticais. |
| `background-color` | `rgba(0, 0, 0,0.3)` | Define a cor de fundo com transparência. |
| `border` | `3px solid black` | Define uma borda preta. |

### a (Links)

| Propriedade | Valor | Descrição |
|---|---|---|
| `font-size` | `20px` | Define o tamanho da fonte. |
| `color` | `white` | Define a cor do texto como branco. |
| `text-align` | `center` | Centraliza o texto. |
| `display` | `block` |  Exibe o link como um bloco. |
| `text-decoration` | `none` | Remove o sublinhado padrão. |
| `transition` | `0.3s` | Adiciona uma transição suave para o hover. |

### a:hover (Links no Hover)

| Propriedade | Valor | Descrição |
|---|---|---|
| `text-decoration` | `underline` | Adiciona um sublinhado quando o mouse passa por cima. |
| `transition` | `0.3s` | Mantém a transição suave. |
| `color` | `rgba(60, 179, 113,1)` |  Altera a cor do texto no hover para um tom de verde. |

### .botao (Botões)

| Propriedade | Valor | Descrição |
|---|---|---|
| `background-color` | `rgba(222,184,135,0.3)` | Define a cor de fundo com transparência. |
| `cursor` | `pointer` | Altera o cursor para uma mãozinha ao passar por cima. |
| `transition` | `0.5s` | Adiciona uma transição suave para o hover. |
| `padding-left` | `10px` |  Adiciona um preenchimento à esquerda. |

### .botao:hover (Botões no Hover)

| Propriedade | Valor | Descrição |
|---|---|---|
| `background-color` | `rgba(222,184,135,0.7)` | Altera a cor de fundo com transparência ao passar por cima. |
| `transition` | `0.5s` | Mantém a transição suave. |

## Notas

*   A declaração `@font-face` para `fnote` não possui um URL de origem válido (`src: url();`).  Isso deve ser corrigido para que a fonte personalizada funcione.
*   As cores são definidas usando `rgba`, permitindo transparência.
*   O CSS utiliza transições para criar efeitos visuais suaves em elementos interativos como links e botões.

Este documento fornece uma visão geral detalhada do arquivo `estilo1.css` e seus principais estilos.



# Documentação Técnica: Player de Música Minimalista

## Visão Geral

Este documento descreve a estrutura e o estilo CSS para um player de música minimalista. O objetivo é fornecer uma interface limpa e intuitiva para o usuário controlar a reprodução de áudio.

## Estrutura HTML (Exemplo)

Embora o HTML específico não esteja incluído, a estrutura presumida é a seguinte:

```html
<div class="player">
  <div class="song">
    <div class="artist">Nome do Artista</div>
    <div class="name">Nome da Música</div>
  </div>
  <div class="playarea">
    <div class="prevSong"></div>
    <div class="play"></div>
    <div class="pause"></div>
    <div class="nextSong"></div>
  </div>
  <div class="soundControl"></div>
  <div class="time">0:00</div>
</div>
```

## Folha de Estilos CSS (musica.css)

```css
canvas {
    display: block;
} 

body {
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAMAAAAp4XiDAAAAUVBMVEWFhYWDg4N3d3dtbW17e3t1dXWBgYGHh4d5eXlzc3OLi4ubm5uVlZWPj4+NjY19fX2JiYl/f39ra2uRkZGZmZlpaWmXl5dvb29xcXGTk5NnZ2c8TV1mAAAAG3RSTlNAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEAvEOwtAAAFVklEQVR4XpWWB67c2BUFb3g557T/hRo9/WUMZHlgr4Bg8Z4qQgQJlHI4A8SzFVrapvmTF9O7dmYRFZ60YiBhJRCgh1FYhiLAmdvX0CzTOpNE77ME0Zty/nWWzchDtiqrmQDeuv3powQ5ta2eN0FY0InkqDD73lT9c9lEzwUNqgFHs9VQce3TVClFCQrSTfOiYkVJQBmpbq2L6iZavPnAPcoU0dSw0SUTqz/GtrGuXfbyyBniKykOWQWGqwwMA7QiYAxi+IlPdqo+hYHnUt5ZPfnsHJyNiDtnpJyayNBkF6cWoYGAMY92U2hXHF/C1M8uP/ZtYdiuj26UdAdQQSXQErwSOMzt/XWRWAz5GuSBIkwG1H3FabJ2OsUOUhGC6tK4EMtJO0ttC6IBD3kM0ve0tJwMdSfjZo+EEISaeTr9P3wYrGjXqyC1krcKdhMpxEnt5JetoulscpyzhXN5FRpuPHvbeQaKxFAEB6EN+cYN6xD7RYGpXpNndMmZgM5Dcs3YSNFDHUo2LGfZuukSWyUYirJAdYbF3MfqEKmjM+I2EfhA94iG3L7uKrR+GdWD73ydlIB+6hgref1QTlmgmbM3/LeX5GI1Ux1RWpgxpLuZ2+I+IjzZ8wqE4nilvQdkUdfhzI5QDWy+kw5Wgg2pGpeEVeCCA7b85BO3F9DzxB3cdqvBzWcmzbyMiqhzuYqtHRVG2y4x+KOlnyqla8AoWWpuBoYRxzXrfKuILl6SfiWCbjxoZJUaCBj1CjH7GIaDbc9kqBY3W-Rgjda1iqQcOJu2WW+76pZC9QG7M00dffe9hNnseupFL53r8F7YHSwJWUKP2q+k7RdsxyOB11n0xtOvnW4irMMFNV4H0uqwS5ExsmP9AxbDTc9JwgneAT5vTiUSm1E7BSflSt3bfa1tv8Di3R8n3Af7MNWzs49hmauE2wP+ttrq+AsWpFG2awvsuOqbipWHgtuvuaAE+A1Z/7gC9hesnr+7wqCwG8c5yAg3AL1fm8T9AZtp/bbJGwl1pNrE7RuOX7PeMRUERVaPpEs+yqeoSmuOlokqw49pgomjLeh7icHNlG19yjs6XXOMedYm5xH2YxpV2tc0Ro2jJfxC50ApuxGob7lMsxfTbeUv07TyYxpeLucEH1gNd4IKH2LAg5TdVhlCafZvpskfncCfx8pOhJzd76bJWeYFnFciwcYfubRc12Ip/ppIhA1/mSZ/RxjFDrJC5xifFjJpY2Xl5zXdguFqYyTR1zSp1Y9p+tktDYYSNflcxI0iyO4TPBdlRcpeqjK/piF5bklq77VSEaA+z8qmJTFzIWiitbnzR794USKBUaT0NTEsVjZqLaFVqJoPN9ODG70IPbfBHKK+/q/AWR0tJzYHRULOa4MP+W/HfGadZUbfw177G7j/OGbIs8TahLyynl4X4RinF793Oz+BU0saXtUHrVBFT/DnA3ctNPoGbs4hRIjTok8i+algT1lTHi4SxFvONKNrgQFAq2/gFnWMXgwffgYMJpiKYkmW3tTg3ZQ9Jq+f8XN+A5eeUKHWvJWJ2sgJ1Sop+wwhqFVijqWaJhwtD8MNlSBeWNNWTa5Z5kPZw5+LbVT99wqTdx29lMUH4OIG/D86ruKEauBjvH5xy6um/Sfj7ei6UUVk4AIl3MyD4MSSTOFgSwsH/QJWaQ5as7ZcmgBZkzjjU1UrQ74ci1gWBCSGHtuV1H2mhSnO3Wp/3fEV5a+4wz//6qy8JxjZsmxxy5+4w9CDNJY09T072iKG0EnOS0arEYgXqYnXcYHwjTtUNAcMelOd4xpkoqiTYICWFq0JSiPfPDQdnt+4/wuqcXY47QILbgAAAABJRU5ErkJggg==);
}

.player {
    width: 740px;
    height: 740px;
    margin-left: -370px;
    margin-top: -370px;
    display: block;
    position: absolute;
    left: 50%;
    top: 50%;
}

.player .playarea {
    position: absolute;
    top: 50%;
    left: 50%;
    height: 126px;
    width: 320px;
    margin-top: -63px;
    margin-left: -160px;
}

.player .playarea div {
    display: inline-block;
}

.player .playarea .play {
    cursor: pointer;
    opacity: 0.85;
    vertical-align: middle;
    margin: 0 26px;
    border: 3px solid #FE4365;
    border-radius: 120px;
    width: 120px;
    height: 120px;
    background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+PHN2ZyB3aWR0aD0iNDVweCIgaGVpZ2h0PSI1NXB4IiB2aWV3Qm94PSIwIDAgNDUgNTUiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM6c2tldGNoPSJodHRwOi8vd3d3LmJvaGVtaWFuY29kaW5nLmNvbS9za2V0Y2gvbnMiPiAgICAgICAgPHRpdGxlPnBsYXktPC90aXRsZT4gICAgPGRlc2M+Q3JlYXRlZCB3aXRoIFNrZXRjaC48L2Rlc2M+ICAgIDxkZWZzPiAgICAgICAgPGZpbHRlciB4PSItNTAlIiB5PSItNTAlIiB3aWR0aD0iMjAwJSIgaGVpZ2h0PSIyMDAlIiBmaWx0ZXJVbml0cz0ib2JqZWN0Qm91bmRpbmdCb3giIGlkPSJmaWx0ZXItMSI+ICAgICAgICAgICAgPGZlT2Zmc2V0IGR4PSIwIiBkeT0iMCIgaW49IlNvdXJjZUFscGhhIiByZXN1bHQ9InNoYWRvd09mZnNldE91dGVyMSI+PC9mZU9mZnNldD4gICAgICAgICAgICA8ZmVHYXVzc2lhbkJsdXIgc3RkRGV2aWF0aW9uPSIxLjUiIGluPSJzaGFkb3dPZmZzZXRPdXRlcjEiIHJlc3VsdD0ic2hhZG93Qmx1ck91dGVyMSI+PC9mZUdhdXNzaWFuQmx1cj4gICAgICAgICAgICA8ZmVDb2xvck1hdHJpeCB2YWx1ZXM9IjAgMCAwIDAgMC45NDI0NzI1NjIgICAwIDAgMCAwIDAuOTYxNzk0NTYyICAgMCAwIDAgMCAwLjk4MjE5NjAwMyAgMCAwIDAgMC4zNSAwIiBpbj0ic2hhZG93Qmx1ck91dGVyMSIgdHlwZT0ibWF0cml4IiByZXN1bHQ9InNoYWRvd01hdHJpeE91dGVyMSI+PC9mZUNvbG9yTWF0cml4PiAgICAgICAgICAgIDxmZU1lcmdlPiAgICAgICAgICAgICAgICA8ZmVNZXJnZU5vZGUgaW49InNoYWRvd01hdHJpeE91dGVyMSI+PC9mZU1lcmdlTm9kZT4gICAgICAgICAgICAgICAgPGZlTWVyZ2VOb2RlIGluPSJTb3VyY2VHcmFwaGljIj48L2ZlTWVyZ2VOb2RlPiAgICAgICAgICAgIDwvZmVNZXJnZT4gICAgICAgIDwvZmlsdGVyPiAgICA8L2RlZnM+ICAgIDxnIGlkPSJQYWdlLTEiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIHNrZXRjaDp0eXBlPSJNU1BhZ2UiPiAgICAgICAgPGcgaWQ9IlBsYXllci12ZXJzaW9uLTEiIHNrZXRjaDp0eXBlPSJNU0FydGJvYXJkR3JvdXAiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC00ODIuMDAwMDAwLCAtMjk2LjAwMDAwMCkiIGZpbHRlcj0idXJsKCNmaWx0ZXItMSkiIGZpbGw9IiNGRTQzNjUiPiAgICAgICAgICAgIDxwYXRoIGQ9Ik00ODUsMzE0LjM1MDE1NCBMNDg1LDM0OCBMNTI1LDMyNC4wMzI2MDkgTDQ4NSwyOTkgTDQ4NSwzMTQuMzUwMTU0IFoiIGlkPSJwbGF5LSIgc2tldGNoOnR5cGU9Ik1TU2hhcGVHcm91cCI+PC9wYXRoPiAgICAgICAgPC9nPiAgICA8L2c+PC9zdmc+) 42px 34px no-repeat;
    background-size: 45px 55px;
}

.player .playarea .pause {
    display: none;
    cursor: pointer;
    opacity: 0.85;
    vertical-align: middle;
    margin: 0 26px;
    border: 3px solid #FE4365;
    border-radius: 120px;
    width: 120px;
    height: 120px;
    background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+PHN2ZyB3aWR0aD0iMzRweCIgaGVpZ2h0PSI1MXB4IiB2aWV3Qm94PSIwIDAgMzQgNTEiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM6c2tldGNoPSJodHRwOi8vd3d3LmJvaGVtaWFuY29kaW5nLmNvbS9za2V0Y2gvbnMiPiAgICAgICAgPHRpdGxlPkxpbmU8L3RpdGxlPiAgICA8ZGVzYz5DcmVhdGVkIHdpdGggU2tldGNoLjwvZGVzYz4gICAgPGRlZnM+PC9kZWZzPiAgICA8ZyBpZD0iUGFnZS0xIiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBza2V0Y2g6dHlwZT0iTVNQYWdlIj4gICAgICAgIDxnIGlkPSJQbGF5ZXItdmVyc2lvbi0xIiBza2V0Y2g6dHlwZT0iTVNBcnRib2FyZEdyb3VwIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNDgyLjAwMDAwMCwgLTI5OC4wMDAwMDApIiBzdHJva2U9IiNGRTQzNjUiIHN0cm9rZS1vcGFjaXR5PSIwLjg1IiBmaWxsPSIjRkU0MzY1IiBzdHJva2UtbGluZWNhcD0ic3F1YXJlIiBmaWxsLW9wYWNpdHk9IjAuODUiPiAgICAgICAgICAgIDxwYXRoIGQ9Ik00ODMsMzAxLjI2ODUxOSBMNDgzLDM0NS43MzE0ODEgTDQ4MywzNDggTDQ4OC4wNzI0NjQsMzQ4IEw0ODguMDcyNDY0LDM0NS43MzE0ODEgTDQ4OC4wNzI0NjQsMzAxLjI2ODUxOSBMNDg4LjA3MjQ2NCwyOTkgTDQ4MywyOTkgTDQ4MywzMDEuMjY4NTE5IFogTTUwOS45Mjc1MzYsMzAxLjI2ODUxOSBMNTA5LjkyNzUzNiwzNDUuNzMxNDgxIEw1MDkuOTI3NTM2LDM0OCBMNTE1LDM0OCBMNTE1LDM0NS43MzE0ODEgTDUxNSwzMDEuMjY4NTE5IEw1MTUsMjk5IEw1MDkuOTI3NTM2LDI5OSBMNTA5LjkyNzUzNiwzMDEuMjY4NTE5IFoiIGlkPSJMaW5lIiBza2V0Y2g6dHlwZT0iTVNTaGFwZUdyb3VwIj48L3BhdGg+ICAgICAgICA8L2c+ICAgIDwvZz48L3N2Zz4=) 43px 35px no-repeat;
    background-size: 35px 51px;
}

.player .playarea .prevSong,
.player .playarea .nextSong {
    vertical-align: middle;
    background-size: 66px 43px;
    width: 66px;
    height: 43px;
}

.player .playarea .prevSong:hover,
.player .playarea .nextSong:hover,
.player .playarea .pause:hover,
.player .playarea .play:hover,
.player .soundControl:hover {
    opacity: 0.7;
}

.player .song {
    font-family: Roboto, sans-serif;
    color: #FE4365;
    position: absolute;
    top: 225px;
    left: 0;
    width: 100%;
    text-align: center;
}

.player .song .artist {
    font-size: 22px;
    margin-bottom: 5px;
}

.player .song .name {
    font-size: 18px;
}

.player .soundControl {
    cursor: pointer;
    width: 31px;
    height: 27px;
    position: absolute;
    bottom: 240px;
    left: 50%;
    margin-left: -16px;
    background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+PHN2ZyB3aWR0aD0iMzFweCIgaGVpZ2h0PSIyN3B4IiB2aWV3Qm94PSIwIDAgMzEgMjciIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeG1sbnM6c2tldGNoPSJodHRwOi8vd3d3LmJvaGVtaWFuY29kaW5nLmNvbS9za2V0Y2gvbnMiPiAgICAgICAgPHRpdGxlPmhpZ2gtdm9sdW1lPC90aXRsZT4gICAgPGRlc2M+Q3JlYXRlZCB3aXRoIFNrZXRjaC48L2Rlc2M+ICAgIDxkZWZzPiAgICAgICAgPGZpbHRlciB4PSItNTAlIiB5PSItNTAlIiB3aWR0aD0iMjAwJSIgaGVpZ2h0PSIyMDAlIiBmaWx0ZXJVbml0cz0ib2JqZWN0Qm91bmRpbmdCb3giIGlkPSJmaWx0ZXItMSI+ICAgICAgICAgICAgPGZlT2Zmc2V0IGR4PSIwIiBkeT0iMCIgaW49IlNvdXJjZUFscGhhIiByZXN1bHQ9InNoYWRvd09mZnNldE91dGVyMSI+PC9mZU9mZnNldD4gICAgICAgICAgICA8ZmVHYXVzc2lhbkJsdXIgc3RkRGV2aWF0aW9uPSIxIiBpbj0ic2hhZG93T2Zmc2V0T3V0ZXIxIiByZXN1bHQ9InNoYWRvd0JsdXJPdXRlcjEiPjwvZmVHYXVzc2lhbkJsdXI+ICAgICAgICAgICAgPGZlQ29sb3JNYXRyaXggdmFsdWVzPSIwIDAgMCAwIDAuOTQxMTc2NDcxICAgMCAwIDAgMCAwLjk2MDc4NDMxNCAgIDAgMCAwIDAgMC45ODAzOTIxNTcgIDAgMCAwIDAuMzUgMCIgaW49InNoYWRvd0JsdXJPdXRlcjEiIHR5cGU9Im1hdHJpeCIgcmVzdWx0PSJzaGFkb3dNYXRyaXhPdXRlcjEiPjwvZmVDb2xvck1hdHJpeD4gICAgICAgICAgICA8ZmVNZXJnZT4gICAgICAgICAgICAgICAgPGZlTWVyZ2VOb2RlIGluPSJzaGFkb3dNYXRyaXhPdXRlcjEiPjwvZmVNZXJnZU5vZGUuICAgICAgICAgICAgICAgIDxmZU1lcmdlTm9kZSBpbj0iU291cmNlR3JhcGhpYyI+PC9mZU1lcmdlTm9kZT4gICAgICAgICAgICA8L2ZlTWVyZ2U+ICAgICAgICA8L2ZpbHRlcj4gICAgPC9kZWZzPiAgICA8ZyBpZD0iUGFnZS0xIiBzdHJva2U9Im5vbmUiIHN0cm9rZS13aWR0aD0iMSIgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBza2V0Y2g6dHlwZT0iTVNQYWdlIj4gICAgICAgIDxnIGlkPSJQbGF5ZXItdmVyc2lvbi0xIiBza2V0Y2g6dHlwZT0iTVNBcnRib2FyZEdyb3VwIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNDgzLjAwMDAwMCwgLTQyNS4wMDAwMDApIiBmaWxsLW9wYWNpdHk9IjAuOCIgZmlsdGVyPSJ1cmwoI2ZpbHRlci0xKSIgZmlsbD0iI0ZFNDM2NSI+ICAgICAgICAgICAgPHBhdGggZD0iTTUwOC4wMDY2MzQsNDI3IEM1MTAuNTE0ODQ4LDQzMC4xNzU0ODQgNTEyLDQzNC4xODQ0NjMgNTEyLDQzOC41NDI0NyBDNTEyLDQ0Mi44NjE3MSA1MTAuNTQxMTUzLDQ0Ni44MzgxMDQgNTA4LjA3MzMyNiw0NTAgTDUwNi45NDMyNjksNDQ5LjE1MzQwNSBDNTA5LjI1OTIwNiw0NDYuMTgwMjQ0IDUxMC42NDk5OTksNDQyLjUxMTY5MSA1MTAuNjQ5OTk5LDQzOC41NDI0NyBDNTEwLjY0OTk5OSw0MzQuNTI5NDcyIDUwOS4yMjgzNTgsNDMwLjgyMzgwOSA1MDYuODY2MzAyLDQyNy44MzM0MTQgTDUwOC4wMDY2MzQsNDI3IEw1MDguMDA2NjM0LDQyNyBaIE01MDMuNjcwMjEyLDQ0Ni43MDEzNTggQzUwNS40OTczMjgsNDQ0LjQzNjg2IDUwNi41OTk5OTksNDQxLjYwOTMzMSA1MDYuNTk5OTk5LDQzOC41NDI0NjkgQzUwNi41OTk5OTksNDM1LjQxNDc0IDUwNS40NTMxMjQsNDMyLjUzNTkzNyA1MDMuNTYwNTcsNDMwLjI0OTQxOSBMNTAyLjU4MjY1OCw0MzAuOTY0MTI5IEM1MDQuMjQ4MDEsNDMzLjA4NDYzOCA1MDUuMjUwMDAxLDQzNS43MDU2MyA1MDUuMjUwMDAxLDQzOC41NDI0NjkgQzUwNS4yNTAwMDEsNDQxLjMxMzU1NCA1MDQuMjkzOTIyLDQ0My44Nzg2ODEgNTAyLjY5NzM4Nyw0NDUuOTcyNTU1IEw1MDMuNjcwMjEyLDQ0Ni43MDEzNTggTDUwMy42NzAyMTIsNDQ2LjcwMTM1OCBaIE00OTkuNjk0ODIsNDQzLjcyMzE0OSBDNTAxLjEwNTE0MSw0NDIuMjkzMTQ3IDUwMS45NzMwNzcsNDQwLjM0NDU3NSA1MDEuOTczMDc3LDQzOC4xOTcwMDcgQzUwMS45NzMwNzcsNDM2LjE2NjYzMiA1MDEuMTk3MjgyLDQzNC4zMTQxMjYgNDk5LjkyMDgwNSw0MzIuOTA5NTUxIEw0OTguOTQyMDkxLDQzMy42MjQ4NDcgQzQ5OS45NzUwOTUsNDM0Ljg3MjYxNSA1MDAuNTk0MjMxLDQzNi40NjM4MzUgNTAwLjU5NDIzMSw0MzguMTk3MDA3IEM1MDAuNTk0MjMxLDQ0MC4wNDE3OTQgNDk5Ljg5Mjc4NCw0NDEuNzI1NzU2IDQ5OC43Mzc0MjUsNDQzLjAwNTkwNSBMNDk5LjY5NDgyLDQ0My43MjMxNDkgTDQ5OS42OTQ4Miw0NDMuNzIzMTQ5IFogTTQ4NSw0MzUuMjExMjI1IEw0ODUsNDQxLjg3MzcxNSBMNDg5LjcyNSw0NDIuNDk3NDk0IEw0ODkuNzI1LDQzNC41MDI1MDYgTDQ4NSw0MzUuMjExMjI1IEw0ODUsNDM1LjIxMTIyNSBaIE00ODkuNzI1LDQ0Mi41Mzk5NjQgTDQ5Ni40NzUsNDQ3LjIwMzcwOCBMNDk2LjQ3NSw0MjkuODgxMjMyIEw0ODkuNzI1LDQzNC41NDQ5NzYgTDQ4OS43MjUsNDQyLjUzOTk2NCBaIiBpZD0iaGlnaC12b2x1bWUiIHNrZXRjaDp0eXBlPSJNU1NoYXBlR3JvdXAiPjwvcGF0aD4gICAgICAgIDwvZz4gICAgPC9nPjwvc3ZnPg==);
    background-size: 31px 27px;
    text-align: center;
}

.player .soundControl.disable {
    opacity: 0.4;
}

.player .time {
    text-align: center;
    font-family: Roboto, sans-serif;
    color: #FE4365;
    position: absolute;
    left: 50%;
    margin-left: -22px;
    font-size: 20px;
    bottom: 190px;
}
```

### Detalhes de Estilo

*   **`body`**: Define a imagem de fundo.
*   **`.player`**: Centraliza o player na tela.
*   **`.playarea`**: Posiciona os controles de reprodução.
*   **`.play`, `.pause`, `.prevSong`, `.nextSong`**: Estilos para os botões de controle.  Note que `.pause` tem `display: none;` por padrão, sendo exibido via Javascript.
*   **`.song`**: Estilos para as informações da música (artista e nome).
*   **`.soundControl`**: Estilos para o controle de volume.
*   **`.time`**: Estilos para o display de tempo da música.

## Tabelas de Métodos (JavaScript - Exemplo)

Como o código JavaScript não foi fornecido, esta seção apresenta uma tabela hipotética de métodos que poderiam ser usados para controlar o player.

| Método         | Descrição                                                      | Parâmetros                        | Retorno |
|----------------|----------------------------------------------------------------|-----------------------------------|---------|
| `playPause()`  | Alterna entre os estados de reprodução e pausa.               | Nenhum                              | `void`  |
| `nextSong()`   | Avança para a próxima música na playlist.                     | Nenhum                              | `void`  |
| `prevSong()`   | Retorna para a música anterior na playlist.                    | Nenhum                              | `void`  |
| `setVolume(volume)` | Define o volume do áudio.                               | `volume` (Número entre 0 e 1)   | `void`  |
| `updateTime()` | Atualiza o display de tempo da música.                       | Nenhum                              | `void`  |

## Considerações

*   As imagens (ícones de play, pause, volume, etc.) são codificadas como Data URIs para simplificar a distribuição e evitar dependências externas.
*   A lógica de controle do player (JavaScript) não está incluída neste documento.



# Documentação Técnica: Visualizador de Música

Este documento fornece uma visão geral técnica do projeto do visualizador de música. O projeto utiliza JavaScript e a API Web Audio para criar um visualizador interativo que reage à música que está sendo reproduzida.

## Arquitetura

O projeto é estruturado em vários módulos, cada um responsável por uma parte específica da funcionalidade:

*   **`musica.js`**: Contém todo o código-fonte do projeto, incluindo os módulos Framer, Tracker, Scene, Controls e Player.

## Módulos

### 1. Framer

O módulo `Framer` é responsável por desenhar os ticks (linhas) que representam a visualização da música, bem como as bordas.

**Código-fonte:**

```javascript
var Framer = { 
    countTicks: 360,
    frequencyData: [],
    tickSize: 10,
    PI: 360,
    index: 0,
    loadingAngle: 0,
    init: function (scene) {
        this.canvas = document.querySelector('canvas');
        this.scene = scene;
        this.context = scene.context;
        this.configure();
    },
    configure: function () {
        this.maxTickSize = this.tickSize * 9 * this.scene.scaleCoef;
        this.countTicks = 360 * Scene.scaleCoef;
    },
    draw: function () {
        this.drawTicks();
        this.drawEdging();
    },
    drawTicks: function () {
        this.context.save();
        this.context.beginPath();
        this.context.lineWidth = 1;
        this.ticks = this.getTicks(this.countTicks, this.tickSize, [0, 90]);
        for (var i = 0, len = this.ticks.length; i < len; ++i) {
            var tick = this.ticks[i];
            this.drawTick(tick.x1, tick.y1, tick.x2, tick.y2);
        }
        this.context.restore();
    },
    drawTick: function (x1, y1, x2, y2) {
        var dx1 = parseInt(this.scene.cx + x1);
        var dy1 = parseInt(this.scene.cy + y1);

        var dx2 = parseInt(this.scene.cx + x2);
        var dy2 = parseInt(this.scene.cy + y2);

        var gradient = this.context.createLinearGradient(dx1, dy1, dx2, dy2);
        gradient.addColorStop(0, '#FE4365');
        gradient.addColorStop(0.6, '#FE4365');
        gradient.addColorStop(1, '#FF1493');
        this.context.beginPath();
        this.context.strokeStyle = gradient;
        this.context.lineWidth = 2;
        this.context.moveTo(this.scene.cx + x1, this.scene.cx + y1);
        this.context.lineTo(this.scene.cx + x2, this.scene.cx + y2);
        this.context.stroke();
    },
    setLoadingPercent: function (percent) {
        this.loadingAngle = percent * 2 * Math.PI;
    },
    drawEdging: function () {
        this.context.save();
        this.context.beginPath();
        this.context.strokeStyle = 'rgba(254, 67, 101, 0.5)';
        this.context.lineWidth = 1;

        var offset = Tracker.lineWidth / 2;
        this.context.moveTo(this.scene.padding + 2 * this.scene.radius - Tracker.innerDelta - offset, this.scene.padding + this.scene.radius);
        this.context.arc(this.scene.cx, this.scene.cy, this.scene.radius - Tracker.innerDelta - offset, 0, this.loadingAngle, false);

        this.context.stroke();
        this.context.restore();
    },
    getTicks: function (count, size, animationParams) {
        size = 15;
        var ticks = this.getTickPoitns(count);
        var x1, y1, x2, y2, m = [], tick, k;
        var lesser = 160;
        var allScales = [];
        for (var i = 0, len = ticks.length; i < len; ++i) {
            var coef = 1 - i / (len * 2.5);
            var delta = ((this.frequencyData[i] || 0) - lesser * coef) * this.scene.scaleCoef;
            if (delta < 0) {
                delta = 0;
            }
            tick = ticks[i];
            if (animationParams[0] <= tick.angle && tick.angle <=  animationParams[1]) {
                k = this.scene.radius / (this.scene.radius - this.getSize(tick.angle, animationParams[0], animationParams[1]) - delta);
            } else {
                k = this.scene.radius / (this.scene.radius - (size + delta));
            }
            x1 = tick.x * (this.scene.radius - size);
            y1 = tick.y * (this.scene.radius - size);
            x2 = x1 * k;
            y2 = y1 * k;
            m.push({ x1: x1, y1: y1, x2: x2, y2: y2 });
            if (i < 20) {
                var scale = delta / 45;
                scale = scale < 1 ? 1 : scale;
                allScales.push(scale);
            }
        }
        var sum = allScales.reduce(function(pv, cv) { return pv + cv; }, 0) / allScales.length;
        this.canvas.style.transform = 'scale('+sum+')';
        return m;
    },
    getSize: function (angle, l, r) {
        var m = (r - l) / 2;
        var x = (angle - l);
        var h;

        if (x == m) {
            return this.maxTickSize;
        }
        var d = Math.abs(m - x);
        var v = 70 * Math.sqrt(1 / d);
        if (v > this.maxTickSize) {
            h = this.maxTickSize - d;
        } else {
            h = Math.max(this.tickSize, v);
        }

        if (this.index > this.count) {
            this.index = 0;
        }

        return h;
    },
    getTickPoitns: function (count) {
        var coords = [], step = this.PI / count;
        for (var deg = 0; deg < this.PI; deg += step) {
            var rad = deg * Math.PI / (this.PI / 2);
            coords.push({ x: Math.cos(rad), y: -Math.sin(rad), angle: deg });
        }
        return coords;
    }
};
```

**Métodos:**

| Método             | Descrição                                                                                                                                                                                              |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `init(scene)`      | Inicializa o módulo `Framer` com a cena fornecida.  Obtém a referência para o canvas e contexto 2D.                                                                                                    |
| `configure()`      | Configura o tamanho máximo dos ticks e a quantidade de ticks com base no coeficiente de escala da cena.                                                                                                   |
| `draw()`           | Desenha os ticks e as bordas.                                                                                                                                                                           |
| `drawTicks()`      | Desenha os ticks.                                                                                                                                                                                       |
| `drawTick(x1, y1, x2, y2)` | Desenha um único tick.                                                                                                                                                                             |
| `setLoadingPercent(percent)` | Define o ângulo de carregamento, usado para desenhar a borda de carregamento.                                                                                                                              |
| `drawEdging()`     | Desenha a borda do visualizador.                                                                                                                                                                          |
| `getTicks(count, size, animationParams)` | Calcula as coordenadas de cada tick com base nos dados de frequência, tamanho e parâmetros de animação.  Retorna um array de objetos contendo as coordenadas x e y para cada extremidade do tick. |
| `getSize(angle, l, r)` | Calcula o tamanho de um tick com base em seu ângulo e em parâmetros de animação.                                                                                                                      |
| `getTickPoitns(count)` | Calcula os pontos das extremidades dos ticks com base na contagem especificada.                                                                                                                       |

### 2. Tracker

O módulo `Tracker` gerencia o rastreador circular interativo, permitindo que os usuários interajam com a linha do tempo da música.

**Código-fonte:**

```javascript
var Tracker = {
    innerDelta: 20,
    lineWidth: 7,
    prevAngle: 0.5,
    angle: 0,
    animationCount: 10,
    pressButton: false,
    init: function (scene) {
        this.scene = scene;
        this.context = scene.context;
        this.initHandlers();
    },
    initHandlers: function () {
        var that = this;

        this.scene.canvas.addEventListener('mousedown', function (e) {
            if (that.isInsideOfSmallCircle(e) || that.isOusideOfBigCircle(e)) {
                return;
            }
            that.prevAngle = that.angle;
            that.pressButton = true;
            that.stopAnimation();
            that.calculateAngle(e, true);
        });

        window.addEventListener('mouseup', function () {
            if (!that.pressButton) {
                return;
            }
            var id = setInterval(function () {
                if (!that.animatedInProgress) {
                    that.pressButton = false;
                    Player.context.currentTime = that.angle / (2 * Math.PI) * Player.source.buffer.duration;
                    clearInterval(id);
                }
            }, 100);
        });

        window.addEventListener('mousemove', function (e) {
            if (that.animatedInProgress) {
                return;
            }
            if (that.pressButton && that.scene.inProcess()) {
                that.calculateAngle(e);
            }
        });
    },
    isInsideOfSmallCircle: function (e) {
        var x = Math.abs(e.pageX - this.scene.cx - this.scene.coord.left);
        var y = Math.abs(e.pageY - this.scene.cy - this.scene.coord.top);
        return Math.sqrt(x * x + y * y) < this.scene.radius - 3 * this.innerDelta;
    },
    isOusideOfBigCircle: function (e) {
        return Math.abs(e.pageX - this.scene.cx - this.scene.coord.left) > this.scene.radius ||
                Math.abs(e.pageY - this.scene.cy - this.scene.coord.top) > this.scene.radius;
    },
    draw: function () {
        if (!Player.source.buffer) {
            return;
        }
        if (!this.pressButton) {
            this.angle = Player.context.currentTime / Player.source.buffer.duration * 2 * Math.PI || 0;
        }
        this.drawArc();
    },
    drawArc: function () {
        this.context.save();
        this.context.strokeStyle = 'rgba(254, 67, 101, 0.8)';
        this.context.beginPath();
        this.context.lineWidth = this.lineWidth;

        this.r = this.scene.radius - (this.innerDelta + this.lineWidth / 2);
        this.context.arc(
                this.scene.radius + this.scene.padding,
                this.scene.radius + this.scene.padding,
                this.r, 0, this.angle, false
        );
        this.context.stroke();
        this.context.restore();
    },
    calculateAngle: function (e, animatedInProgress) {
        this.animatedInProgress = animatedInProgress;
        this.mx = e.pageX;
        this.my = e.pageY;
        this.angle = Math.atan((this.my - this.scene.cy - this.scene.coord.top) / (this.mx - this.scene.cx - this.scene.coord.left));
        if (this.mx < this.scene.cx + this.scene.coord.left) {
            this.angle = Math.PI + this.angle;
        }
        if (this.angle < 0) {
            this.angle += 2 * Math.PI;
        }
        if (animatedInProgress) {
            this.startAnimation();
        } else {
            this.prevAngle = this.angle;
        }
    },
    startAnimation: function () {
        var that = this;
        var angle = this.angle;
        var l = Math.abs(this.angle) - Math.abs(this.prevAngle);
        var step = l / this.animationCount, i = 0;
        var f = function () {
            that.angle += step;
            if (++i == that.animationCount) {
                that.angle = angle;
                that.prevAngle = angle;
                that.animatedInProgress = false;
            } else {
                that.animateId = setTimeout(f, 20);
            }
        };

        this.angle = this.prevAngle;
        this.animateId = setTimeout(f, 20);
    },
    stopAnimation: function () {
        clearTimeout(this.animateId);
        this.animatedInProgress = false;
    }
};
```

**Métodos:**

| Método                      | Descrição                                                                                                                                |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `init(scene)`               | Inicializa o módulo `Tracker` com a cena fornecida e inicializa os manipuladores de eventos.                                                  |
| `initHandlers()`            | Inicializa os manipuladores de eventos para mouse down, mouse up e mouse move para permitir a interação do usuário com o rastreador.       |
| `isInsideOfSmallCircle(e)`  | Verifica se o evento do mouse está dentro do círculo interno do rastreador.                                                              |
| `isOusideOfBigCircle(e)`    | Verifica se o evento do mouse está fora do círculo externo do rastreador.                                                              |
| `draw()`                    | Desenha o arco do rastreador para indicar o progresso da música.                                                                         |
| `drawArc()`                 | Desenha o arco que representa a posição atual da música.                                                                                 |
| `calculateAngle(e, animatedInProgress)` | Calcula o ângulo com base na posição do mouse.                                                                                                  |
| `startAnimation()`          | Inicia a animação do rastreador quando o usuário interage com ele.                                                                        |
| `stopAnimation()`           | Para a animação do rastreador.                                                                                                              |

### 3. Scene

O módulo `Scene` configura e gerencia o canvas, incluindo o tamanho, a renderização e os manipuladores de eventos.

**Código-fonte:**

```javascript
var Scene = {
    padding: 120,
    minSize: 740,
    optimiseHeight: 982,
    _inProcess: false,
    init: function () {
        this.canvasConfigure();
        this.initHandlers();

        Framer.init(this);
        Tracker.init(this);
        Controls.init(this);

        this.startRender();
    },
    canvasConfigure: function () {
        this.canvas = document.querySelector('canvas');
        this.context = this.canvas.getContext('2d');
        this.context.strokeStyle = '#FE4365';
        this.calculateSize();
    },
    calculateSize: function () {
        this.scaleCoef = Math.max(0.5, 740 / this.optimiseHeight);

        var size = Math.max(this.minSize, 1/*document.body.clientHeight */);
        this.canvas.setAttribute('width', size);
        this.canvas.setAttribute('height', size);
        //this.canvas.style.marginTop = -size / 2 + 'px';
        //this.canvas.style.marginLeft = -size / 2 + 'px';

        this.width = size;
        this.height = size;

        this.radius = (size - this.padding * 2) / 2;
        this.cx = this.radius + this.padding;
        this.cy = this.radius + this.padding;
        this.coord = this.canvas.getBoundingClientRect();
    },
    initHandlers: function () {
        var that = this;
        window.onresize = function () {
            that.canvasConfigure();
            Framer.configure();
            that.render();
        };
    },
    render: function () {
        var that = this;
        requestAnimationFrame(function () {
            that.clear();
            that.draw();
            if (that._inProcess) {
                that.render();
            }
        });
    },
    clear: function () {
        this.context.clearRect(0, 0, this.width, this.height);
    },
    draw: function () {
        Framer.draw();
        Tracker.draw();
        Controls.draw();
    },
    startRender: function () {
        this._inProcess = true;
        this.render();
    },
    stopRender: function () {
        this._inProcess = false;
    },
    inProcess: function () {
        return this._inProcess;
    }
};
```

**Métodos:**

| Método            | Descrição                                                                                                                             |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `init()`          | Inicializa o módulo `Scene`, configurando o canvas, inicializando manipuladores e iniciando a renderização.                         |
| `canvasConfigure()` | Configura o canvas, obtendo o contexto 2D e definindo o tamanho.                                                                   |
| `calculateSize()` | Calcula o tamanho do canvas e outros valores dependentes, como raio, centro x e centro y.                                            |
| `initHandlers()`  | Inicializa os manipuladores de eventos, como o manipulador de redimensionamento da janela.                                            |
| `render()`        | Renderiza a cena, limpando o canvas, desenhando os módulos `Framer`, `Tracker` e `Controls` e solicitando o próximo quadro de animação. |
| `clear()`         | Limpa o canvas.                                                                                                                      |
| `draw()`          | Desenha os elementos da cena chamando os métodos `draw()` dos módulos `Framer`, `Tracker` e `Controls`.                               |
| `startRender()`   | Inicia o loop de renderização.                                                                                                       |
| `stopRender()`    | Interrompe o loop de renderização.                                                                                                    |
| `inProcess()`     | Retorna um valor booleano indicando se o loop de renderização está em andamento.                                                    |

### 4. Controls

O módulo `Controls` gerencia os controles de reprodução, como play, pause e volume.

**Código-fonte:**

```javascript
var Controls = {
    playing: false,
    init: function (scene) {
        this.scene = scene;
        this.context = scene.context;
        this.initHandlers();
        this.timeControl = document.querySelector('.time');
    },
    initHandlers: function () {
        this.initPlayButton();
        this.initPauseButton();
        this.initSoundButton();
        this.initPrevSongButton();
        this.initNextSongButton();
        this.initTimeHandler();
    },
    initPlayButton: function () {
        var that = this;
        this.playButton = document.querySelector('.play');
        this.playButton.addEventListener('mouseup', function () {
            that.playButton.style.display = 'none';
            that.pauseButton.style.display = 'inline-block';
            Player.play();
            that.playing = true;
        });
    },
    initPauseButton: function () {
        var that = this;
        this.pauseButton = document.querySelector('.pause');
        this.pauseButton.addEventListener('mouseup', function () {
            that.playButton.style.display = 'inline-block';
            that.pauseButton.style.display = 'none';
            Player.pause();
            that.playing = false;
        });
    },
    initSoundButton: function () {
        var that = this;
        this.soundButton = document.querySelector('.soundControl');
        this.soundButton.addEventListener('mouseup', function () {
            if (that.soundButton.classList.contains('disable')) {
                that.soundButton.classList.remove('disable');
                Player.unmute();
            } else {
                that.soundButton.classList.add('disable');
                Player.mute();
            }
        });
    },
    initPrevSongButton: function () {
        var that = this;
        this.prevSongButton = document.querySelector('.prevSong');
        this.prevSongButton.addEventListener('mouseup', function () {
            Player.prevTrack();
            that.playing && Player.play();
        });
    },
    initNextSongButton: function () {
        var that = this;
        this.nextSongButton = document.querySelector('.nextSong');
        this.nextSongButton.addEventListener('mouseup', function () {
            Player.nextTrack();
            that.playing && Player.play();
        });
    },
    initTimeHandler: function () {
        var that = this;
        setTimeout(function () {
            var rawTime = parseInt(Player.context.currentTime || 0);
            var secondsInMin = 60;
            var min = parseInt(rawTime / secondsInMin);
            var seconds = rawTime - min * secondsInMin;
            if (min < 10) {
                min = '0' + min;
            }
            if (seconds < 10) {
                seconds = '0' + seconds;
            }
            var time = min + ':' + seconds;
            that.timeControl.textContent = time;
            that.initTimeHandler();
        }, 300);
    },
    draw: function () {
        this.drawPic();
    },
    drawPic: function () {
        this.context.save();
        this.context.beginPath();
        this.context.fillStyle = 'rgba(254, 67, 101, 0.85)';
        this.context.lineWidth = 1;
        var x = Tracker.r / Math.sqrt(Math.pow(Math.tan(Tracker.angle), 2) + 1);
        var y = Math.sqrt(Tracker.r * Tracker.r - x * x);
        if (this.getQuadrant() == 2) {
            x = -x;
        }
        if (this.getQuadrant() == 3) {
            x = -x;
            y = -y;
        }
        if (this.getQuadrant() == 4) {
            y = -y;
        }
        this.context.arc(this.scene.radius + this.scene.padding + x, this.scene.radius + this.scene.padding + y, 10, 0, Math.PI * 2, false);
        this.context.fill();
        this.context.restore();
    },
    getQuadrant: function () {
        if (0 <= Tracker.angle && Tracker.angle < Math.PI / 2) {
            return 1;
        }
        if (Math.PI / 2 <= Tracker.angle && Tracker.angle < Math.PI) {
            return 2;
        }
        if (Math.PI < Tracker.angle && Tracker.angle < Math.PI * 3 / 2) {
            return 3;
        }
        if (Math.PI * 3 / 2 <= Tracker.angle && Tracker.angle <= Math.PI * 2) {
            return 4;
        }
    }
};
```

**Métodos:**

| Método                  | Descrição                                                                                                                |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| `init(scene)`           | Inicializa o módulo `Controls`, obtendo a referência para a cena, contexto e inicializando os manipuladores de eventos. |
| `initHandlers()`        | Inicializa os manipuladores de eventos para os botões de play, pause, som, música anterior e música seguinte.             |
| `initPlayButton()`      | Inicializa o manipulador de eventos para o botão de play.                                                               |
| `initPauseButton()`     | Inicializa o manipulador de eventos para o botão de pause.                                                              |
| `initSoundButton()`     | Inicializa o manipulador de eventos para o botão de som (mute/unmute).                                                   |
| `initPrevSongButton()`  | Inicializa o manipulador de eventos para o botão de música anterior.                                                    |
| `initNextSongButton()`  | Inicializa o manipulador de eventos para o botão de música seguinte.                                                     |
| `initTimeHandler()`     | Inicializa o manipulador de tempo para atualizar o tempo decorrido da música.                                          |
| `draw()`                | Desenha o indicador de posição atual da música.                                                                         |
| `drawPic()`             | Desenha um círculo na posição atual da música no círculo do rastreador.                                                    |
| `getQuadrant()`         | Determina em qual quadrante do círculo o indicador de posição atual da música deve ser desenhado.                         |

### 5. Player

O módulo `Player` gerencia a reprodução da música, o carregamento de faixas e a análise de áudio.

**Código-fonte:**

```javascript
var Player = {
    buffer: null,
    duration: 0,
    tracks: [
        {
            artist: "Lo-fi",
            song: "NOGYMX - bikes at the pier",
            url: "lofi songs for slow days_160k.mp3"
        }
    ],
    init: function () {
        window.AudioContext = window.AudioContext || window.webkitAudioContext;
        this.context = new AudioContext();
        this.context.suspend && this.context.suspend();
        this.firstLaunch = true;
        try {
            this.javascriptNode = this.context.createScriptProcessor(2048, 1, 1);
            this.javascriptNode.connect(this.context.destination);
            this.analyser = this.context.createAnalyser();
            this.analyser.connect(this.javascriptNode);
            this.analyser.smoothingTimeConstant = 0.6;
            this.analyser.fftSize = 2048;
            this.source = this.context.createBufferSource();
            this.destination = this.context.destination;
            this.loadTrack(0);

            this.gainNode = this.context.createGain();
            this.source.connect(this.gainNode);
            this.gainNode.connect(this.analyser);
            this.gainNode.connect(this.destination);

            this.initHandlers();
        } catch (e) {
            Framer.setLoadingPercent(1);
        }
        Framer.setLoadingPercent(1);
        Scene.init();
    },
    loadTrack: function (index) {
        var that = this;
        var request = new XMLHttpRequest();
        var track = this.tracks[index];
        document.querySelector('.song .artist').textContent = track.artist;
        document.querySelector('.song .name').textContent = track.song;
        this.currentSongIndex = index;

        request.open('GET', track.url, true);
        request.responseType = 'arraybuffer';

        request.onload = function() {
            that.context.decodeAudioData(request.response, function(buffer) {
                that.source.buffer = buffer;
            });
        };

        request.send();
    },
    nextTrack: function () {
        return;
        ++this.currentSongIndex;
        if (this.currentSongIndex == this.tracks.length) {
            this.currentSongIndex = 0;
        }

        this.loadTrack(this.currentSongIndex);
    },
    prevTrack: function () {
        return;
        --this.currentSongIndex;
        if (this.currentSongIndex == -1) {
            this.currentSongIndex = this.tracks.length - 1;
        }

        this.loadTrack(this.currentSongIndex);
    },
    play: function () {
        this.context.resume && this.context.resume();
        if (this.firstLaunch) {
            this.source.start();
            this.firstLaunch = false;
        }
    },
    stop: function () {
        this.context.currentTime = 0;
        this.context.suspend();
    },
    pause: function () {
        this.context.suspend();
    },
    mute: function () {
        this.gainNode.gain.value = 0;
    },
    unmute: function () {
        this.gainNode.gain.value = 1;
    },
    initHandlers: function () {
        var that = this;

        this.javascriptNode.onaudioprocess = function() {
            Framer.frequencyData = new Uint8Array(that.analyser.frequencyBinCount);
            that.analyser.getByteFrequencyData(Framer.frequencyData);
        };
    }
};
Player.init();
```

**Métodos:**

| Método           | Descrição                                                                                                                                                    |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `init()`         | Inicializa o módulo `Player`, configurando o contexto de áudio, analisador, ganho e carregando a primeira faixa. Também inicializa a cena.                |
| `loadTrack(index)` | Carrega uma faixa de áudio com base no índice fornecido.                                                                                                         |
| `nextTrack()`    | Carrega a próxima faixa de áudio na lista.                                                                                                                     |
| `prevTrack()`    | Carrega a faixa de áudio anterior na lista.                                                                                                                  |
| `play()`         | Inicia a reprodução da faixa de áudio.                                                                                                                         |
| `stop()`         | Interrompe a reprodução da faixa de áudio.                                                                                                                      |
| `pause()`        | Pausa a reprodução da faixa de áudio.                                                                                                                         |
| `mute()`         | Silencia o áudio.                                                                                                                                            |
| `unmute()`       | Desativa o silêncio do áudio.                                                                                                                                   |
| `initHandlers()` | Inicializa o manipulador de áudio para obter os dados de frequência da música e atualizar os dados de frequência do módulo `Framer`.                          |

## Fluxo de Dados

1.  O `Player` carrega a música usando a API Web Audio.
2.  O `Player` usa o `AnalyserNode` para obter dados de frequência da música.
3.  Os dados de frequência são passados para o `Framer`.
4.  O `Framer` usa os dados de frequência para desenhar os ticks.
5.  O `Tracker` permite que o usuário interaja com a linha do tempo da música.
6.  O `Scene` gerencia o canvas e renderiza todos os elementos.
7.  O `Controls` gerencia os controles de reprodução e a interface do usuário.

## Considerações

*   O projeto pode ser otimizado para melhor desempenho, especialmente em dispositivos móveis.
*   Mais faixas de áudio podem ser adicionadas à lista de reprodução.
*   Recursos adicionais de visualização podem ser adicionados.
*   O design da interface do usuário pode ser aprimorad



# Documentação Técnica do Projeto

Este documento fornece uma visão geral técnica do projeto, incluindo detalhes sobre o código-fonte e sua estrutura.

## Folha de Estilo Principal (principal.css)

A folha de estilo `principal.css` define a aparência e o layout do projeto. Ela inclui definições de fontes, estilos de navegação, estilos para dispositivos móveis e estilos para a página de categorias.

### Código-fonte

```css
@import url('https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@1,300&family=Noto+Sans+JP:wght@100&display=swap');

@font-face {
  font-family: fnote;
  src: url();
}

* {
	margin: 0px;
	padding: 0px; 
}

.icone {
	width: 40px ;
	height: 33px;
	float: right;
}

.barra {
	width: 400px;
	height: 30px;
	border:solid 1px;
    border-radius:15px;
    padding: 5px;
}

input#bb::placeholder {
  padding-left: 3px;
  padding-bottom: 1.5px;
}

.barra:active {
	outline-style: none;
}

a#principal {
	color: #fff;
	text-decoration: none;
	transition: 0.3s;
}

a#principal:hover {
	opacity: 0.7;
	transition: 0.3s;
}

.logo {
	font-size: 30px;
	text-transform: uppercase;
	letter-spacing: 3px;
}

nav#principal {
	display: flex;
	justify-content: space-around;
	align-items: center;
	font-family: system-ui, -apple-system, Helvetica, Arial, Sans-serif;
	background: #23232e;
	height: 8vh;
}

nav#principal_baixo {
	display: flex;
	justify-content: space-around;
	align-items: center;
	font-family: system-ui, -apple-system, Helvetica, Arial, Sans-serif;
	background: #23232e;
	
}

main#principal {
	background: url("img/prin.jpg") no-repeat center center;
	background-size: cover; 
	height: 92vh;	
	
}

.nav-list {
	list-style: none;
	display: flex;
}

.nav-list li {
	margin-top: 20px;
	letter-spacing: 3px;
	margin-left: 32px;
}

.mobile-menu {
	display: none;
	cursor: pointer;
}

.mobile-menu div {
	width: 32px;
	height: 2px;
	background: #fff;
	margin: 8px; 
}

@media (max-width: 700px) {
.barra {
	width: 300px;
	height: 30px;
	border:solid 1px;
    border-radius:15px;
    padding: 5px;
}
}

@media (max-width: 500px) {
.barra {
	width: 200px;
	height: 30px;
	border:solid 1px;
    border-radius:15px;
    padding: 5px;
}
}

@media (max-width: 400px) {
.barra {
	width: 100px;
	height: 30px;
	border:solid 1px;
    border-radius:15px;
    padding: 5px;
}
}

@media (max-width: 999px) {

	body#principal {
		overflow-x: hidden; 
	}

	.responsivel{
		width: 75vw;
	}

	.nav-list {
		z-index: 1;
		position: absolute;
		top: 8vh;
		right: 0px;
		width: 25vw;
		height: 92vh;
		background: #23232e;
		flex-direction: column;
		align-items: center;
		justify-content: space-around; 
		transform: translateX(100%);
		transition: transform 0.3s ease-in;
	}

	.nav-list li{
		margin-top: 0px;
		margin-left: 0px;
		opacity: 0;
	}

	.mobile-menu {
		display: block;
	}
}

.nav-list.active {
	transform: translateX(0);
}

@keyframes navLinkFade {
   
   from {
   		opacity: 0;
   }
   to {
   		opacity: 1;
   		transform: translateX(0);
   }
}

.mobile-menu.active .line1 {
  transform: rotate(-45deg) translate(-8px, 8px);
}

.mobile-menu.active .line2 {
  opacity: 0;
}

.mobile-menu.active .line3 {
  transform: rotate(45deg) translate(-5px, -7px);
}

.categorias{
	background-color: rgba(255, 255, 255, 0.6);
	width: 100%;
	height: 60px;
	font-size: 50px;
	font-family: Impact, fantasy;
	color: black;
	border-radius: 15px;
}

.catimg{
	height: 200px; 
	width: 200px;
	padding: 15px;
	transition: 0.3s;
	background-color: rgba(255, 255, 255,0.8);
	border-radius: 100%;
}

.catimg:hover{
	 padding: 0px;
	 transition: 0.3s;
	 height: 250px; 
	 width: 250px; 
	 filter: drop-shadow(8px 8px 10px gray);
	 background-color: rgba(119, 136, 153,0.9);
}

.nome_cat{
	font-size: 20px;
	text-decoration: none;
	color: white;
	transition: 0.3s;
}

.nome_cat:hover{
	color: rgba(255, 215, 0, 1);
	font-size: 20px;
	text-decoration: none;
	transition: 0.3s;
}

div#fundocat{
	z-index: -1;
	background: url("img/samambaia.jpg") repeat center center;
	 background-attachment: fixed;
	
}
```

### Seções Principais

*   **Fontes:** Define as fontes utilizadas no projeto, incluindo importação do Google Fonts e definição de uma fonte local.
*   **Reset CSS:** Define margens e paddings globais para zero, garantindo um layout consistente.
*   **Navegação:** Estilos para a barra de navegação principal, incluindo layout flexível, cores e transições.
*   **Responsividade:** Media queries para ajustar o layout em diferentes tamanhos de tela, incluindo estilos para menu mobile.
*   **Categorias:** Estilos para a seção de categorias, incluindo cores, fontes, imagens e efeitos hover.
*   **Background:** Estilos para o background da página de categorias.

### Classes e IDs Importantes

| Seletor         | Descrição                                                       |
| ---------------- | ----------------------------------------------------------------- |
| `.icone`        | Estilo para ícones na página.                                   |
| `.barra`        | Estilo para a barra de pesquisa.                                  |
| `nav#principal`  | Estilo para a barra de navegação principal.                     |
| `.nav-list`     | Estilo para a lista de itens de navegação.                        |
| `.mobile-menu`  | Estilo para o menu mobile (visível em telas menores).              |
| `.categorias`   | Estilo para a seção de categorias.                              |
| `.catimg`       | Estilo para as imagens das categorias.                             |
| `.nome_cat`     | Estilo para os nomes das categorias (links).                      |
| `div#fundocat`  | Estilo para o fundo da página de categorias.                      |

### Media Queries

O CSS utiliza media queries para adaptar o layout a diferentes tamanhos de tela. As principais media queries são:

*   `@media (max-width: 700px)`
*   `@media (max-width: 500px)`
*   `@media (max-width: 400px)`
*   `@media (max-width: 999px)`

Essas media queries ajustam o tamanho da barra de pesquisa e o comportamento do menu de navegação em telas menores, garantindo uma experiência de usuário otimizada em dispositivos móveis.



# Documentação Técnica: Mobile Navbar

Este documento descreve a classe `MobileNavbar` em JavaScript, responsável por criar e controlar um menu de navegação responsivo para dispositivos móveis.

## Visão Geral

A classe `MobileNavbar` gerencia a exibição e animação de um menu de navegação em telas menores, geralmente ativado por um botão "hambúrguer".  Ela lida com a troca de classes para exibir/ocultar o menu e anima as opções de navegação.

## Código-fonte

```javascript
class MobileNavbar {
  constructor(mobileMenu, navList, navLinks) {
    this.mobileMenu = document.querySelector(mobileMenu);
    this.navList = document.querySelector(navList);
    this.navLinks = document.querySelectorAll(navLinks);
    this.activeClass = "active";

    this.handleClick = this.handleClick.bind(this);
  }

  animateLinks() {
    this.navLinks.forEach((link, index) => {
      link.style.animation
        ? (link.style.animation = "")
        : (link.style.animation = `navLinkFade 0.5s ease forwards ${
            index / 7 + 0.3 }s`);
    });
  }

  handleClick() {
    this.navList.classList.toggle(this.activeClass);
    this.mobileMenu.classList.toggle(this.activeClass);
    this.animateLinks();
  }

  addClickEvent() {
    this.mobileMenu.addEventListener("click", this.handleClick);
  }

  init() {
    if (this.mobileMenu) {
      this.addClickEvent();
    }
    return this;
  }
}

const mobileNavbar = new MobileNavbar(
  ".mobile-menu",
  ".nav-list",
  ".nav-list li",
);
mobileNavbar.init();
```

## Métodos

A classe `MobileNavbar` possui os seguintes métodos:

| Método        | Descrição                                                                                                                                                                                                               |
|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `constructor` | Inicializa a classe com os seletores dos elementos HTML necessários (botão do menu mobile, lista de navegação e links de navegação).  Também define a classe que será usada para ativar/desativar o menu e vincula `this` ao método `handleClick`. |
| `animateLinks`| Aplica ou remove animações de fade-in nos links de navegação quando o menu mobile é aberto ou fechado. O tempo de delay para cada link é calculado com base no seu índice, criando um efeito escalonado.         |
| `handleClick` | Alterna a classe `active` nos elementos do menu mobile e da lista de navegação, exibindo ou ocultando o menu. Também chama o método `animateLinks` para animar os links.                                                   |
| `addClickEvent`| Adiciona um listener de evento de clique ao botão do menu mobile, que chama o método `handleClick` quando clicado.                                                                                                |
| `init`        | Inicializa a funcionalidade da classe, adicionando o listener de evento se o elemento do menu mobile existir.                                                                                                           |

## Uso

Para utilizar a classe `MobileNavbar`, siga os passos abaixo:

1. **Inclua o código JavaScript no seu projeto.**
2. **Certifique-se de ter os elementos HTML com os seletores corretos:**
    *  Um elemento com a classe `.mobile-menu` (o botão "hambúrguer").
    *  Um elemento com a classe `.nav-list` (a lista de navegação).
    *  Elementos `li` dentro do elemento `.nav-list` com `<a>` tags (os links de navegação).

3. **Instancie a classe `MobileNavbar`:**

```javascript
const mobileNavbar = new MobileNavbar(
  ".mobile-menu",
  ".nav-list",
  ".nav-list li",
);
mobileNavbar.init();
```

## Considerações

* Certifique-se de que as classes CSS (`active` e `navLinkFade`) estejam definidas no seu arquivo CSS para controlar a exibição e animação do menu.
* Ajuste os seletores e os valores de animação de acordo com a sua estrutura HTML e preferências de design.
`