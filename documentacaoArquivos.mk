# Documentação Técnica do Projeto React App

Este documento fornece uma visão geral técnica do projeto React App, incluindo sua estrutura, componentes principais e instruções de uso.

## Visão Geral

O projeto React App é uma aplicação web construída utilizando a biblioteca React. Ele foi criado utilizando `create-react-app`, uma ferramenta para configurar um ambiente de desenvolvimento React moderno com apenas um comando.

## Estrutura do Projeto

A estrutura básica do projeto é organizada da seguinte forma:

*   **`public/`**: Contém arquivos estáticos como `index.html`, `favicon.ico` e outros assets que não são processados pelo Webpack.
*   **`src/`**: Contém o código-fonte da aplicação React, incluindo componentes, estilos e lógica de negócios.
*   **`package.json`**:  Arquivo que contém metadados sobre o projeto, dependências e scripts para executar tarefas como iniciar o servidor de desenvolvimento, construir a aplicação para produção e executar testes.
*   **`README.md`**: Arquivo Markdown contendo informações básicas sobre o projeto, instruções de instalação e uso.

## Arquivos Principais

### `public/index.html`

Este arquivo HTML é o ponto de entrada da aplicação. Ele contém a estrutura básica do HTML e um elemento `div` com o id `root`, onde a aplicação React será renderizada.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web site created using create-react-app"
    />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>React App</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
```

**Observações:**

*   A tag `<div id="root"></div>` é essencial.  O React injetará a aplicação neste elemento.
*   `%PUBLIC_URL%` é uma variável que é substituída durante o processo de build pelo caminho correto para a pasta `public`.

### `src/index.js` (Exemplo hipotético - assumindo que o projeto segue a estrutura padrão)

Este arquivo é o ponto de entrada da aplicação React. Ele importa o componente principal (`App`) e o renderiza no elemento `root` no `index.html`.

```javascript
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import './index.css'; // Exemplo de importação de estilos globais

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
```

**Explicação:**

*   `React.StrictMode` ativa verificações e avisos adicionais para componentes React.  É útil para identificar problemas potenciais durante o desenvolvimento.
*   `ReactDOM.createRoot` cria uma raiz React e a associa ao elemento DOM com o ID 'root'.
*   `root.render(<App />)` renderiza o componente `App` dentro da raiz.

### `src/App.js` (Exemplo hipotético - componente principal)

Este arquivo geralmente contém o componente principal da aplicação.

```javascript
import React from 'react';
import './App.css'; // Exemplo de importação de estilos do componente

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Bem-vindo ao React!</h1>
        <p>
          Edite <code>src/App.js</code> e salve para recarregar.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Aprenda React
        </a>
      </header>
    </div>
  );
}

export default App;
```

**Explicação:**

*   Este é um componente funcional React.
*   Retorna JSX (JavaScript XML) que descreve a estrutura da interface do usuário.
*   O JSX é transformado em chamadas de função JavaScript que criam elementos DOM.

## Instalação e Execução

Para executar o projeto localmente, siga os seguintes passos:

1.  **Clone o repositório:** `git clone <url_do_repositorio>`
2.  **Navegue até o diretório do projeto:** `cd <nome_do_projeto>`
3.  **Instale as dependências:** `npm install` ou `yarn install`
4.  **Inicie o servidor de desenvolvimento:** `npm start` ou `yarn start`

A aplicação estará disponível em `http://localhost:3000` (ou outra porta, conforme indicado no console).

## Scripts (package.json - Exemplo)

O arquivo `package.json` contém scripts úteis para automatizar tarefas.  Aqui estão alguns exemplos comuns:

| Script        | Descrição                                                                 |
|---------------|---------------------------------------------------------------------------|
| `start`       | Inicia o servidor de desenvolvimento.                                      |
| `build`       | Cria uma versão otimizada da aplicação para produção.                      |
| `test`        | Executa os testes unitários e de integração.                              |
| `eject`       | Expõe a configuração interna do `create-react-app` (geralmente não recomendado). |

Para executar um script, use o comando `npm run <nome_do_script>` ou `yarn <nome_do_script>`. Por exemplo: `npm run build`.

## Dependências

O projeto utiliza as seguintes dependências principais:

*   **`react`**: A biblioteca React para construir interfaces de usuário.
*   **`react-dom`**: Fornece métodos específicos do DOM para interagir com o navegador.
*   **`react-scripts`**:  Um conjunto de scripts e ferramentas fornecidos pelo `create-react-app` para simplificar o desenvolvimento React.

## Próximos Passos

Para continuar desenvolvendo a aplicação, você pode:

*   Criar novos componentes React.
*   Adicionar rotas utilizando uma biblioteca como `react-router-dom`.
*   Gerenciar o estado da aplicação utilizando `useState`, `useReducer`, ou uma biblioteca de gerenciamento de estado como Redux ou Zustand.
*   Implementar testes unitários e de integração.
*   Integrar com APIs externas para buscar e exibir dados.

Este documento fornece uma base para entender a estrutura e o funcionamento do projeto React App. Consulte a documentação oficial do React e das bibliotecas utilizadas para obter informações mais detalhadas.



# Documentação Técnica: Arquivo `robots.txt`

Este documento descreve a finalidade e o conteúdo do arquivo `robots.txt` presente no diretório `public` do projeto.  O `robots.txt` é um arquivo de texto usado para instruir os rastreadores da web (web crawlers), como os do Google, Bing e outros mecanismos de busca, sobre quais partes do site não devem ser acessadas.  Ele é uma ferramenta importante para controlar o acesso dos rastreadores ao seu site, otimizar o rastreamento e evitar sobrecarga do servidor.

## Finalidade do Arquivo `robots.txt`

O arquivo `robots.txt` serve para:

*   **Excluir áreas do site do rastreamento:** Impedir que robôs acessem páginas específicas, como painéis de administração, arquivos temporários ou páginas com conteúdo duplicado.
*   **Otimizar o rastreamento:** Direcionar os robôs para as páginas mais importantes do site, garantindo que o conteúdo relevante seja indexado primeiro.
*   **Evitar sobrecarga do servidor:** Impedir que robôs rastreiem o site em uma velocidade excessiva, o que pode causar lentidão ou indisponibilidade do servidor.
*   **Proteger informações confidenciais:** Evitar que robôs indexem informações sensíveis, como dados de usuários ou arquivos de configuração.

**Importante:** O `robots.txt` é uma *diretiva*, não uma *garantia*.  Robôs maliciosos podem ignorar o arquivo e rastrear todo o site.  Para proteger informações confidenciais, é essencial implementar outras medidas de segurança, como autenticação e autorização.

## Conteúdo do Arquivo `robots.txt`

O arquivo `robots.txt` segue uma sintaxe simples, composta por:

*   **User-agent:** Especifica o robô ao qual a regra se aplica. O valor `*` indica que a regra se aplica a todos os robôs.
*   **Disallow:** Especifica o diretório ou arquivo que não deve ser rastreado.

O arquivo `robots.txt` fornecido contém o seguinte:

```
# https://www.robotstxt.org/robotstxt.html
User-agent: *
Disallow:
```

### Análise do Conteúdo

*   **`# https://www.robotstxt.org/robotstxt.html`**:  Esta linha é um comentário que fornece um link para a documentação oficial do `robots.txt`. Comentários são ignorados pelos rastreadores.
*   **`User-agent: *`**: Esta linha especifica que as regras subsequentes se aplicam a todos os rastreadores (user agents).
*   **`Disallow:`**: Esta linha indica que nenhum diretório ou arquivo está explicitamente proibido de ser rastreado.  Em outras palavras, o rastreador está *permitido* a acessar todas as páginas do site.

## Implicações da Configuração Atual

A configuração atual do `robots.txt` permite que todos os rastreadores indexem todo o conteúdo do site.  Isso é geralmente desejável para sites novos ou que desejam maximizar a visibilidade nos mecanismos de busca.

## Considerações Adicionais

*   **Diretórios Específicos:**  Se você precisar impedir o rastreamento de um diretório específico (por exemplo, `/admin/`), você pode adicionar a seguinte linha ao `robots.txt`:

    ```
    Disallow: /admin/
    ```

    Isso impedirá que os rastreadores acessem qualquer arquivo ou subdiretório dentro de `/admin/`.

*   **Arquivos Específicos:** Para impedir o rastreamento de um arquivo específico (por exemplo, `private.pdf`), você pode adicionar:

    ```
    Disallow: /private.pdf
    ```

*   **Sitemaps:** É recomendado adicionar um link para o sitemap do seu site ao `robots.txt`.  O sitemap é um arquivo XML que lista todas as URLs do seu site, ajudando os rastreadores a indexar o conteúdo de forma mais eficiente.  A sintaxe é:

    ```
    Sitemap: https://www.example.com/sitemap.xml
    ```

    Substitua `https://www.example.com/sitemap.xml` pelo URL real do seu sitemap.

*   **Testando o `robots.txt`:**  O Google Search Console oferece uma ferramenta para testar o seu `robots.txt` e verificar se ele está configurado corretamente.  Esta ferramenta pode ajudar a identificar erros e garantir que o arquivo esteja funcionando como esperado.
*   **Cuidado com Erros:** Um `robots.txt` mal configurado pode impedir que os mecanismos de busca indexem partes importantes do seu site, prejudicando o tráfego orgânico. Revise cuidadosamente o arquivo e teste-o antes de publicá-lo.



# Documentação Técnica do Projeto

Este documento fornece informações técnicas detalhadas sobre a estrutura e o funcionamento do projeto.

## Visão Geral

O projeto visa [inserir aqui a descrição do objetivo do projeto]. A interface principal é construída utilizando React e estilizada com CSS. O foco principal desta documentação é descrever o estilo visual da aplicação, definido no arquivo `src/App.css`.

## Estrutura de Arquivos

A seguinte seção detalha o conteúdo do arquivo `src/App.css`.

### `src/App.css`

Este arquivo define os estilos globais da aplicação. Ele controla a aparência visual de elementos como o contêiner principal, formulários, campos de entrada e botões.

#### Conteúdo do Arquivo

```css
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
}

.App {
  min-height: 100vh;
  background-color: #575F7A;
  display: flex;
  justify-content: center;
  align-items: center;
  color: white;
  font-size: 1.5em;
}

.form-container {
  text-align: center;
  width: 40%;
}

.input-group {
  margin-bottom: 10px; 
}

.input-field input{
  height: 2em;
  width: 100%;
  border-radius: 5px;
  margin: auto;
  box-shadow: 3px 1px rgba(255, 255, 255, 0.151);
}

.input-field textarea {
  width: 100%;
  border-radius: 5px;
  margin: auto;
  box-shadow: 3px 1px rgba(255, 255, 255, 0.151);
}

.botao {
  height: 3em;
  width: 40%;
  border-radius: 5px;
  background-color: #243772;
  color: white;
  box-shadow: 3px 1px rgba(255, 255, 255, 0.151);
  font-size: 1em;
}
```

#### Descrição das Classes CSS

A tabela a seguir descreve as classes CSS utilizadas e seus respectivos efeitos:

| Classe CSS       | Descrição                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `html, body`      | Define a altura do `html` e `body` para 100% da tela, removendo margens e preenchimentos padrão. Isso garante que o conteúdo ocupe toda a altura da janela do navegador.                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `.App`            | Estiliza o componente principal da aplicação. Define a altura mínima para 100vh (viewport height), define a cor de fundo para `#575F7A`, centraliza o conteúdo horizontal e verticalmente, define a cor do texto para branco e o tamanho da fonte para 1.5em.                                                                                                                                                                                                                                                                                                                              |
| `.form-container` | Estiliza o container do formulário. Centraliza o texto e define a largura para 40% da tela.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `.input-group`    | Aplica uma margem inferior de 10px aos grupos de campos de entrada.  Isso cria um espaço entre os diferentes campos do formulário, melhorando a legibilidade e a organização visual.                                                                                                                                                                                                                                                                                                                                                                                                       |
| `.input-field input` | Estiliza os campos de entrada de texto. Define a altura para 2em, a largura para 100%, adiciona bordas arredondadas, centraliza o elemento e adiciona uma sombra suave.                                                                                                                                                                                                                                                                                                                                                                                                                         |
| `.input-field textarea` | Estiliza os campos de entrada de texto do tipo textarea. Define a largura para 100%, adiciona bordas arredondadas, centraliza o elemento e adiciona uma sombra suave.                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `.botao`          | Estiliza os botões. Define a altura para 3em, a largura para 40%, adiciona bordas arredondadas, define a cor de fundo para `#243772`, define a cor do texto para branco, adiciona uma sombra suave e define o tamanho da fonte para 1em.                                                                                                                                                                                                                                                                                                                                                          |

#### Observações

*   As cores utilizadas são definidas em formato hexadecimal.
*   As dimensões são definidas em `em` e porcentagem para garantir responsividade.
*   A propriedade `box-shadow` adiciona uma sombra sutil aos elementos, melhorando a percepção de profundidade e destacando-os na interface.

## Próximos Passos

*   [Adicionar informações sobre outros arquivos relevantes, como componentes React.]
*   [Documentar a lógica de negócio da aplicação.]
*   [Incluir diagramas de arquitetura, se aplicável.]

`



# Documentação Técnica: Derivação de Sentenças em Linguagens Formais

Este documento descreve o funcionamento do projeto de derivação de sentenças em linguagens formais, implementado em React. O objetivo principal é, dada uma gramática livre de contexto, gerar uma sentença válida a partir do símbolo inicial.

## 1. Visão Geral

O projeto consiste em uma interface de usuário que permite ao usuário inserir os componentes de uma gramática livre de contexto (GLC), incluindo:

*   Símbolos terminais
*   Símbolos não terminais
*   Símbolo inicial
*   Regras de produção

Com base nessas informações, o sistema tenta derivar uma sentença válida, exibindo o resultado na tela.

## 2. Componentes Principais

### 2.1. `App.js`

Este é o componente principal da aplicação React. Ele contém a lógica para:

*   Renderizar o formulário de entrada.
*   Capturar os dados inseridos pelo usuário.
*   Validar os dados de entrada.
*   Chamar a função de derivação de sentenças.
*   Exibir o resultado (sentença derivada ou mensagem de erro).

#### 2.1.1. Código-fonte Relevante

```javascript
import './App.css';
import { useState } from 'react'
import derivaSentenca from './middleware/derivaSentenca'

function App() {
  const [formData, setFormData] = useState({
    simbterminais: '',
    simbNaoTerminais: '',
    simbInicial: '',
    regras: ''
  })
  const [sentencaDerivada, setSentencaDerivada] = useState('');

  const handleChange = (e) => {
    const {name, value} = e.target
    setFormData({
      ...formData,
      [name]: value
    })
  }
  const handleSubmit = (e) => {
    e.preventDefault()
    let simbInicial      = formData.simbInicial
    let simbTerminais    = formData.simbTerminais.split(',')
    let simbNaoTerminais = formData.simbNaoTerminais.split(',')
    let regras           = formData.regras.split('\n')
    const regexSimbolos  = /(?=.*[}{.^?~=+\\-_\\/*\\-+.\\|])/mg
    console.log(regras)
    try {
      if (simbInicial.length > 1) {
        throw 'Selecione apenas um simbolo inicial'
      }
      if (!simbNaoTerminais.find(e => e == simbInicial)) {
        throw 'O simbolo inicial precisa ser um dos simbolos não terminais'
      }
      if (regexSimbolos.exec(simbTerminais) || regexSimbolos.exec(simbNaoTerminais)) {
        throw 'Utilize apenas letras ou números separados por vírgulas'
      }
      if (simbNaoTerminais.some(e => simbTerminais.includes(e))) {
        throw 'Existem símbolos terminais e não terminais repetidos, favor ajustar'
      }
      if (!regras.some(e => e.includes(' ::= '))) {
        throw 'As regras foram informadas incorretamente, utilize o símbolo "::=" para definir uma atribuição'
      }

      const resultado = derivaSentenca(simbInicial, simbTerminais, simbNaoTerminais, regras);
      setSentencaDerivada(resultado);
    } catch (err) {
      alert(err)
    }  
  }
  return (
    <div className="App">
      <div class="form-container">
        <form id="RegrasForm" onSubmit={handleSubmit}>
            <h2>Linguagens Formais</h2>
            <div class="input-group">
                <label for="simbTerminais">Simbolos terminais</label>
                <div class="input-field">
                    <input type="text" value={formData.simbTerminais} name="simbTerminais" placeholder="Ex: A,B,S" onChange={handleChange} required/>
                </div>
            </div>
            <div class="input-group">
                <label for="simbNaoTerminais">Simbolos não terminais</label>
                <div class="input-field">
                    <input type="text" value={formData.simbNaoTerminais} name="simbNaoTerminais" placeholder="Ex: a,b,0,1" onChange={handleChange} required/>
                </div>
            </div>
            <div class="input-group">
                <label for="simbInicial">Simbolo inicial</label>
                <div class="input-field">
                    <input type="text" value={formData.simbInicial} name="simbInicial" placeholder="Ex: S" onChange={handleChange} required/>
                </div>
            </div>
            <div class="input-group">
                <label for="regras">Regras (uma por linha)</label>
                <div class="input-field">
                    <textarea name="regras" value={formData.regras} placeholder="Ex:&#10;S ::= aSb&#10;S ::= ab &#10;use {} para vazio" rows="5" onChange={handleChange} required/>
                </div>
            </div>
            <button class="botao" type="submit" value="Submit">Gerar sentenças</button>
        </form>
      </div>  
      <div class="sentenca-derivada">
      {sentencaDerivada ? `Sentença derivada: ${sentencaDerivada}` : ''}
      </div>
    </div>
  );
}

export default App;
```

#### 2.1.2. Detalhes da Função `handleSubmit`

A função `handleSubmit` é responsável por:

1.  Prevenir o comportamento padrão do formulário.
2.  Extrair os dados do formulário do estado `formData`.
3.  Dividir as strings de símbolos terminais, não terminais e regras em arrays.
4.  Realizar validações nos dados de entrada.
5.  Chamar a função `derivaSentenca` (definida em outro módulo) para realizar a derivação.
6.  Atualizar o estado `sentencaDerivada` com o resultado da derivação.
7.  Em caso de erro, exibir uma mensagem de alerta ao usuário.

#### 2.1.3. Validação de Dados

A função `handleSubmit` inclui as seguintes validações:

*   O símbolo inicial deve ter apenas um caractere.
*   O símbolo inicial deve estar presente nos símbolos não terminais.
*   Os símbolos terminais e não terminais devem conter apenas letras ou números separados por vírgulas.
*   Não pode haver símbolos repetidos entre os símbolos terminais e não terminais.
*   As regras devem estar no formato correto (`simbolo ::= produção`).

### 2.2. `middleware/derivaSentenca.js`

Este módulo contém a lógica principal para derivar uma sentença a partir de uma gramática livre de contexto.  A implementação detalhada desse módulo não foi fornecida, mas pode-se inferir que ele recebe os símbolos terminais, não terminais, o símbolo inicial e as regras como entrada e retorna uma string representando a sentença derivada.

## 3. Fluxo de Execução

1.  O usuário preenche o formulário com os símbolos terminais, não terminais, o símbolo inicial e as regras de produção.
2.  Ao submeter o formulário, a função `handleSubmit` é chamada.
3.  A função `handleSubmit` valida os dados de entrada.
4.  A função `handleSubmit` chama a função `derivaSentenca` com os dados validados.
5.  A função `derivaSentenca` realiza a derivação da sentença.
6.  A função `handleSubmit` atualiza o estado `sentencaDerivada` com o resultado da derivação.
7.  A interface do usuário é atualizada para exibir a sentença derivada.

## 4. Estrutura de Dados

### 4.1. `formData` (Estado no `App.js`)

Este estado armazena os dados do formulário inseridos pelo usuário.

| Propriedade        | Tipo   | Descrição                                        | Exemplo      |
| ------------------ | ------ | ------------------------------------------------ | ------------ |
| `simbterminais`    | string | Símbolos terminais, separados por vírgulas.      | `"a,b"`      |
| `simbNaoTerminais` | string | Símbolos não terminais, separados por vírgulas. | `"S,A"`      |
| `simbInicial`      | string | Símbolo inicial da gramática.                    | `"S"`        |
| `regras`           | string | Regras de produção, uma por linha.               | `"S ::= aSb\nS ::= ab"` |

### 4.2. Dados de Entrada para `derivaSentenca`

A função `derivaSentenca` recebe os seguintes argumentos:

| Argumento        | Tipo     | Descrição                                        | Exemplo       |
| ---------------- | -------- | ------------------------------------------------ | ------------- |
| `simbInicial`    | string   | Símbolo inicial da gramática.                    | `"S"`         |
| `simbTerminais`  | string[] | Array de símbolos terminais.                     | `["a", "b"]`  |
| `simbNaoTerminais`| string[] | Array de símbolos não terminais.                 | `["S", "A"]`  |
| `regras`         | string[] | Array de regras de produção.                      | `["S ::= aSb", "S ::= ab"]` |

## 5. Considerações Adicionais

*   O tratamento de erros é realizado através de `try...catch` e exibição de `alert`.
*   A função `derivaSentenca` não foi detalhada, mas é crucial para o funcionamento do projeto. Uma implementação robusta dessa função é essencial para garantir a correta derivação das sentenças.
*   A interface do usuário é simples e direta, facilitando a interação do usuário com o sistema.
*   Para a entrada de regras, o sistema espera que o usuário utilize `{}`, caso queira representar vazio.



# Documentação Técnica do Projeto

Esta documentação descreve a estrutura e o funcionamento do projeto, com foco nos componentes e testes relevantes.

## Estrutura do Projeto

O projeto consiste em um aplicativo React simples. A estrutura básica é:

*   **src/App.js:** Componente principal da aplicação.
*   **src/App.test.js:** Testes unitários para o componente `App`.

## Componente `App`

O componente `App` é o ponto de entrada da aplicação. Ele renderiza a interface principal e contém a lógica da aplicação. (O código fonte do App.js não foi fornecido, mas a documentação abaixo assume uma funcionalidade padrão de um app React criado com `create-react-app`).

### Funcionalidade

O componente `App` exibe um link que direciona para a documentação do React.

## Testes Unitários (`src/App.test.js`)

O arquivo `src/App.test.js` contém testes unitários para o componente `App`. Esses testes garantem que o componente esteja funcionando corretamente.

### Código-Fonte

```javascript
import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});
```

### Explicação do Código

1.  **`import { render, screen } from '@testing-library/react';`**: Importa as funções `render` e `screen` da biblioteca `@testing-library/react`. `render` é usado para renderizar o componente e `screen` fornece métodos para interagir com o DOM renderizado.

2.  **`import App from './App';`**: Importa o componente `App` que será testado.

3.  **`test('renders learn react link', () => { ... });`**: Define um caso de teste com a descrição 'renders learn react link'.

4.  **`render(<App />);`**: Renderiza o componente `App` dentro do ambiente de teste.

5.  **`const linkElement = screen.getByText(/learn react/i);`**:  Usa `screen.getByText` para procurar um elemento no DOM que contenha o texto "learn react" (insensível a maiúsculas e minúsculas devido ao `i` na expressão regular). O elemento encontrado é armazenado na variável `linkElement`.

6.  **`expect(linkElement).toBeInTheDocument();`**: Usa a função `expect` do Jest para verificar se o `linkElement` foi encontrado no documento. `toBeInTheDocument()` é um matcher do Jest que verifica se o elemento está presente no DOM.

### Metodologia de Teste

O teste segue a metodologia Arrange-Act-Assert:

*   **Arrange:** Importa as dependências e renderiza o componente `App`.
*   **Act:** Procura o elemento com o texto "learn react".
*   **Assert:** Verifica se o elemento foi encontrado no documento.

## Dependências

As seguintes dependências são utilizadas no projeto:

*   **react:** Biblioteca JavaScript para construir interfaces de usuário.
*   **@testing-library/react:** Biblioteca para testar componentes React.
*   **jest:** Framework de testes JavaScript.

## Próximos Passos

*   Implementar mais testes unitários para cobrir diferentes cenários e funcionalidades do componente `App`.
*   Adicionar testes de integração para verificar a interação entre os componentes.
*   Documentar outras partes do projeto conforme necessário.



# Documentação Técnica do Projeto

## Introdução

Este documento fornece uma visão geral técnica do projeto, incluindo sua estrutura, funcionalidades principais e código-fonte relevante. O objetivo é auxiliar desenvolvedores e outros interessados a entender o funcionamento interno do projeto e a como interagir com ele.

## Estrutura do Projeto

A estrutura do projeto é organizada da seguinte forma:

*   **src/:** Contém o código-fonte principal do projeto.

    *   **index.css:** Define os estilos globais da aplicação.

## Detalhes do Código-Fonte

### `src/index.css`

Este arquivo CSS define os estilos globais para toda a aplicação. Ele inclui definições para a fonte padrão, margens e suavização de fontes.

```css
body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

code {
  font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier New',
    monospace;
}
```

#### Explicação

*   **`body`:** Define a margem do corpo como zero e especifica uma lista de fontes padrão a serem usadas, priorizando fontes do sistema para melhor compatibilidade.  `font-smoothing` melhora a renderização das fontes em diferentes sistemas operacionais.

*   **`code`:** Define uma fonte monospace específica para elementos `<code>`, garantindo que o código seja exibido de forma clara e consistente. Isso é importante para a legibilidade do código dentro da interface do usuário.

## Considerações Finais

Esta documentação fornece uma visão geral básica do projeto.  À medida que o projeto evolui, esta documentação será atualizada para refletir as mudanças.



# Documentação Técnica do Projeto React

Este documento fornece uma visão geral da estrutura e do código-fonte principal do projeto React. Ele destina-se a desenvolvedores que desejam entender o funcionamento interno do projeto, contribuir com ele ou utilizá-lo como referência.

## 1. Estrutura do Projeto

O projeto React segue uma estrutura padrão, com os seguintes diretórios e arquivos principais:

*   `src/`: Contém o código-fonte da aplicação.
*   `src/index.js`: Ponto de entrada da aplicação.
*   `src/App.js`: Componente principal da aplicação.
*   `src/index.css`: Estilos globais da aplicação.
*   `public/`: Contém arquivos estáticos, como `index.html`.

## 2. Ponto de Entrada: `src/index.js`

O arquivo `src/index.js` é o ponto de entrada da aplicação React. Ele é responsável por renderizar o componente principal (`App`) no DOM (Document Object Model).

```javascript
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

reportWebVitals();
```

### 2.1. Explicação do Código

*   **`import React from 'react';`**: Importa a biblioteca React, essencial para criar componentes.
*   **`import ReactDOM from 'react-dom/client';`**: Importa a biblioteca `ReactDOM`, que permite renderizar componentes React no DOM.
*   **`import './index.css';`**: Importa os estilos globais definidos em `src/index.css`.
*   **`import App from './App';`**: Importa o componente `App`, que representa a estrutura principal da aplicação.
*   **`import reportWebVitals from './reportWebVitals';`**: Importa uma função para medir o desempenho da aplicação.  Esta função pode ser removida se você não estiver interessado em monitorar o desempenho.
*   **`const root = ReactDOM.createRoot(document.getElementById('root'));`**: Cria uma raiz React no elemento HTML com o ID `root`.  Este elemento normalmente está definido no arquivo `public/index.html`.
*   **`root.render(...)`**: Renderiza o componente `App` dentro da raiz React.  O `<React.StrictMode>` é um componente que habilita verificações e avisos adicionais durante o desenvolvimento.
*   **`reportWebVitals();`**: Chama a função para reportar as métricas de desempenho.

### 2.2. Funções Importadas

A tabela a seguir descreve as funções importadas e seus propósitos:

| Função            | Descrição                                                                                                                                                                |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `React.createElement` | A base da criação de elementos React.  Normalmente, você não usa isso diretamente, mas sim a sintaxe JSX.                                                               |
| `ReactDOM.createRoot` | Cria uma raiz React que pode ser usada para renderizar componentes.                                                                                                      |
| `root.render`       | Renderiza um componente React dentro da raiz especificada.                                                                                                              |
| `reportWebVitals`   | Mede o desempenho da aplicação e reporta as métricas.  Requer configuração adicional para funcionar corretamente (normalmente enviando os dados para um serviço de análise). |

## 3. Componente Principal: `src/App.js`

Embora o conteúdo desse arquivo não esteja disponível, ele é fundamental.  Geralmente, o `App.js` contém a estrutura principal da sua aplicação React.  Ele pode conter:

*   Outros componentes React (filhos do componente `App`).
*   Lógica para lidar com dados e estados da aplicação.
*   Rotas para diferentes páginas (se a aplicação for uma Single Page Application com roteamento).
*   Estilos específicos do componente `App`.

Para entender completamente o projeto, é essencial examinar o conteúdo do arquivo `src/App.js`.

## 4. Estilos Globais: `src/index.css`

O arquivo `src/index.css` contém os estilos globais da aplicação. Esses estilos são aplicados a todos os componentes.

## 5. Próximos Passos

Para continuar explorando o projeto, considere os seguintes passos:

*   **Examinar o conteúdo de `src/App.js`:** Este arquivo contém a lógica principal da aplicação.
*   **Analisar outros componentes:** Identifique e analise os outros componentes React que compõem a aplicação.
*   **Entender o fluxo de dados:** Acompanhe como os dados são passados entre os componentes.
*   **Investigar as dependências:** Analise o arquivo `package.json` para entender as dependências do projeto.



# Documentação Técnica: Derivação de Sentenças

Este documento descreve o funcionamento do módulo `derivaSentenca.js`, responsável por derivar sentenças a partir de uma gramática livre de contexto. Ele explica a lógica por trás do algoritmo, os parâmetros de entrada, o processo de derivação e o valor de retorno.

## Visão Geral

O módulo `derivaSentenca.js` implementa um algoritmo para derivar uma sentença a partir de uma gramática livre de contexto (GLC).  Ele recebe como entrada os símbolos iniciais, terminais e não-terminais da gramática, juntamente com as regras de produção, e tenta gerar uma sentença seguindo essas regras. O algoritmo utiliza uma abordagem baseada em pilha para rastrear as possíveis derivações. Para evitar loops infinitos, um limite máximo de iterações é imposto.

## Arquivo: `src/middleware/derivaSentenca.js`

### Código-fonte

```javascript
function derivaSentenca(simbInicial, simbTerminais, simbNaoTerminais, regras) {
    const derivacoes = {};
    const maxIteracoes = 10;

    regras.forEach(regra => {
        const [left, right] = regra.trim().split(' ::= ');
        if (derivacoes[left]) {
            derivacoes[left].push(right);
        } else {
            derivacoes[left] = [right];
        }
    });

    const gerarSentenca = (simbInicial) => {
        const pilha = [{ sentenca: simbInicial, iteracao: 0 }];

        while (pilha.length > 0) {
            const { sentenca, iteracao } = pilha.pop();

            if (iteracao >= maxIteracoes) {
                console.warn(`Limite de ${maxIteracoes} iterações atingido.`);
                return sentenca;
            }

            let novaSentenca = '';
            let expandido = false;

            for (const char of sentenca) {
                if (simbNaoTerminais.includes(char)) {
                    const opcaoDerivacao = derivacoes[char] ? derivacoes[char][0] : '';
                    novaSentenca += opcaoDerivacao;
                    expandido = true;
                } else {
                    novaSentenca += char;
                }
            }

            if (!expandido) {
                return novaSentenca;
            }

            pilha.push({ sentenca: novaSentenca, iteracao: iteracao + 1 });
        }

        return null;
    }

    try {
        const sentenca = gerarSentenca(simbInicial);
        console.log(`Sentença derivada: ${sentenca}`);
        return sentenca;
    } catch (err) {
        console.error(err);
    }
}

export default derivaSentenca;
```

### Funcionalidade

A função `derivaSentenca` recebe uma gramática e tenta derivar uma sentença a partir dela. A gramática é definida por seus símbolos (inicial, terminais e não-terminais) e suas regras de produção. A função retorna a sentença derivada ou `null` se a derivação falhar.

### Parâmetros

A função `derivaSentenca` aceita os seguintes parâmetros:

| Parâmetro        | Tipo     | Descrição                                                                                                                                                                                                                                                           |
|------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `simbInicial`    | `string` | O símbolo inicial da gramática. A derivação começa a partir deste símbolo.                                                                                                                                                                                          |
| `simbTerminais`  | `string[]` | Um array contendo os símbolos terminais da gramática. Símbolos terminais não podem ser expandidos.                                                                                                                                                                |
| `simbNaoTerminais`| `string[]` | Um array contendo os símbolos não-terminais da gramática. Símbolos não-terminais podem ser expandidos de acordo com as regras de produção.                                                                                                                        |
| `regras`         | `string[]` | Um array de strings representando as regras de produção da gramática. Cada string deve estar no formato `"LadoEsquerdo ::= LadoDireito"`, onde `LadoEsquerdo` é um símbolo não-terminal e `LadoDireito` é uma sequência de símbolos terminais e não-terminais. |

### Processo de Derivação

1. **Inicialização:** A função começa construindo uma tabela de derivações a partir das regras de produção fornecidas.  Esta tabela mapeia cada símbolo não-terminal para as possíveis expansões (lados direitos das regras de produção).

2. **Geração da Sentença (`gerarSentenca`):**
   - Uma pilha é inicializada com o símbolo inicial e um contador de iterações.
   - Enquanto a pilha não estiver vazia:
     - O elemento superior da pilha (um objeto contendo a sentença parcial e o número de iterações) é removido.
     - Se o número de iterações exceder o limite máximo (`maxIteracoes`), a função retorna a sentença parcial atual e emite um aviso no console.
     - A sentença parcial é iterada caractere por caractere.
     - Se um caractere é um símbolo não-terminal, ele é substituído pela primeira opção de derivação disponível na tabela de derivações.  Se não houver derivação disponível, o caractere é mantido.
     - Se um caractere é um símbolo terminal, ele é simplesmente adicionado à nova sentença.
     - Se a sentença foi expandida (isto é, pelo menos um símbolo não-terminal foi substituído), a nova sentença é adicionada à pilha, juntamente com o número de iterações incrementado.
     - Se a sentença não foi expandida (isto é, não contém mais símbolos não-terminais), ela é retornada como a sentença derivada.

3. **Retorno:**  A função `derivaSentenca` retorna a sentença derivada obtida pelo processo de geração. Se a pilha ficar vazia antes de uma sentença terminal ser encontrada, a função retorna `null`.

### Exemplo de Uso

```javascript
import derivaSentenca from './src/middleware/derivaSentenca.js';

const simbInicial = 'S';
const simbTerminais = ['a', 'b'];
const simbNaoTerminais = ['S'];
const regras = ['S ::= aSb', 'S ::= ab'];

const sentencaDerivada = derivaSentenca(simbInicial, simbTerminais, simbNaoTerminais, regras);

if (sentencaDerivada) {
  console.log('Sentença derivada:', sentencaDerivada);
} else {
  console.log('Falha ao derivar a sentença.');
}
```

Neste exemplo, a gramática define a linguagem {a^n b^n | n >= 1}.  A função `derivaSentenca` tentará derivar uma sentença pertencente a esta linguagem.

### Tratamento de Erros

A função `derivaSentenca` inclui um bloco `try...catch` para capturar quaisquer erros que possam ocorrer durante o processo de derivação. Se um erro for capturado, ele é registrado no console.

### Limitações

* **Derivação à Esquerda:** O algoritmo implementa uma derivação à esquerda, expandindo o símbolo não-terminal mais à esquerda na sentença.
* **Primeira Derivação:** Para cada símbolo não-terminal, apenas a primeira regra de produção encontrada é aplicada. Isso pode limitar as sentenças que podem ser geradas.
* **Limite de Iterações:** O limite máximo de iterações (`maxIteracoes`) impede loops infinitos, mas também pode impedir a geração de sentenças mais longas.



# Documentação Técnica: `reportWebVitals.js`

Este documento descreve a função `reportWebVitals` definida no arquivo `src/reportWebVitals.js`.  Esta função é utilizada para monitorar e reportar métricas de performance web vitais, permitindo que os desenvolvedores rastreiem o desempenho da aplicação e identifiquem áreas para otimização.

## Visão Geral

A função `reportWebVitals` recebe uma função de callback (`onPerfEntry`) como argumento. Se essa função for fornecida e for uma função válida, ela importa dinamicamente a biblioteca `web-vitals` e usa suas funções para obter métricas de desempenho como CLS, FID, FCP, LCP e TTFB. Em seguida, cada métrica é passada para a função `onPerfEntry` para que ela possa ser processada (por exemplo, enviada para um serviço de análise).

## Código-fonte

```javascript
const reportWebVitals = onPerfEntry => {
  if (onPerfEntry && onPerfEntry instanceof Function) {
    import('web-vitals').then(({ getCLS, getFID, getFCP, getLCP, getTTFB }) => {
      getCLS(onPerfEntry);
      getFID(onPerfEntry);
      getFCP(onPerfEntry);
      getLCP(onPerfEntry);
      getTTFB(onPerfEntry);
    });
  }
};

export default reportWebVitals;
```

## Detalhes da Função `reportWebVitals`

### Assinatura

```javascript
reportWebVitals(onPerfEntry: Function): void
```

### Parâmetros

| Nome          | Tipo     | Descrição                                                                                                                                                     |
|---------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `onPerfEntry` | `Function` | Uma função de callback que será chamada para cada métrica de desempenho.  Esta função recebe um objeto contendo informações detalhadas sobre a métrica.  Se `null` ou não for uma função, a função `reportWebVitals` não fará nada. |

### Retorno

A função `reportWebVitals` não retorna nenhum valor (void).

### Funcionalidade

1.  **Verificação do Argumento:** A função primeiro verifica se o argumento `onPerfEntry` foi fornecido e se é uma função válida. Isso previne erros caso a função seja chamada sem um callback adequado.

2.  **Importação Dinâmica:** Se `onPerfEntry` for uma função válida, a função importa dinamicamente a biblioteca `web-vitals` usando `import('web-vitals')`. Isso permite que a biblioteca seja carregada apenas quando necessário, melhorando o desempenho inicial da aplicação.

3.  **Extração das Métricas:** Após a importação bem-sucedida, a função extrai as seguintes métricas da biblioteca `web-vitals`:
    *   `getCLS`: Cumulative Layout Shift
    *   `getFID`: First Input Delay
    *   `getFCP`: First Contentful Paint
    *   `getLCP`: Largest Contentful Paint
    *   `getTTFB`: Time to First Byte

4.  **Chamada do Callback:** Para cada métrica extraída, a função chama a função `onPerfEntry` passando a métrica como argumento.  A biblioteca `web-vitals` se encarrega de medir a métrica e chamar o callback quando o valor estiver disponível.

## Métricas de Desempenho Web Vitals

A função `reportWebVitals` reporta as seguintes métricas de desempenho:

| Métrica                     | Descrição                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `CLS`                         | Cumulative Layout Shift: Mede a mudança cumulativa de layout inesperada que ocorre durante o tempo de vida de uma página.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |

## Uso

Para usar a função `reportWebVitals`, você deve primeiro instalá-啦 a biblioteca `web-vitals` como uma dependência do seu projeto:

```bash
npm install web-vitals
```

ou

```bash
yarn add web-vitals
```

Em seguida, você pode importar e chamar a função `reportWebVitals` em sua aplicação, passando uma função de callback que irá processar as métricas de desempenho.

```javascript
import reportWebVitals from './reportWebVitals';

const handleReport = (metric) => {
  console.log('Métrica:', metric);
};

reportWebVitals(handleReport);
```

Neste exemplo, a função `handleReport` é uma função de callback que simplesmente registra a métrica no console. Em um cenário real, você pode querer enviar as métricas para um serviço de análise ou armazená-las localmente para análise posterior.

## Exemplo Avançado: Enviando métricas para Google Analytics

```javascript
import reportWebVitals from './reportWebVitals';

const handleReport = ({ id, name, value, label, attribution }) => {
  // Assumindo que você já configurou o Google Analytics (gtag)
  gtag('event', name, {
    event_category: 'Web Vitals',
    event_label: label,
    value: Math.round(name === 'CLS' ? value * 1000 : value), // CLS deve ser multiplicado por 1000 para obter um valor em milissegundos
    non_interaction: true, // Não afeta a taxa de rejeição
    // Opções para atribuir ao usuário, sessão ou página
    // attribution: attribution,
  });
};

reportWebVitals(handleReport);
```

Este exemplo mostra como enviar as métricas reportadas para o Google Analytics. Ele utiliza o `gtag` (Google Tag Manager) para enviar eventos com as métricas de desempenho. Observe que o valor de CLS é multiplicado por 1000 para convertê-lo para milissegundos, conforme recomendado pela Google.

## Notas Adicionais

*   A biblioteca `web-vitals` usa a API Performance do navegador para medir as métricas de desempenho.  Certifique-se de que seu navegador suporta essa API para que a função `reportWebVitals` funcione corretamente.
*   As métricas de desempenho podem variar dependendo do ambiente de execução (por exemplo, navegador, dispositivo, rede).  É importante coletar dados de vários ambientes para obter uma visão precisa do desempenho da sua aplicação.
*   A otimização do desempenho é um processo contínuo.  Use as métricas reportadas pela função `reportWebVitals` para identificar áreas para melhoria e monitorar o impacto das suas otimizações.



# Documentação Técnica: Configuração de Testes (setupTests.js)

Este documento descreve o propósito e a função do arquivo `src/setupTests.js` no contexto do projeto. Este arquivo é crucial para a configuração do ambiente de testes unitários, particularmente quando se utiliza a biblioteca `jest` e a extensão `jest-dom`.

## Propósito

O arquivo `setupTests.js` é executado **antes** de cada teste unitário no projeto. Ele serve como um ponto centralizado para configurar e preparar o ambiente de testes, garantindo consistência e evitando repetição de código.

## Funcionalidades Principais

A principal funcionalidade deste arquivo é a importação da biblioteca `@testing-library/jest-dom`.

### `@testing-library/jest-dom`

Esta biblioteca adiciona *matchers* (afirmações) personalizados ao `jest` que facilitam a escrita de testes mais legíveis e expressivos para componentes React que interagem com o DOM (Document Object Model).

**Exemplo:**

Em vez de escrever:

```javascript
expect(document.querySelector('.meu-elemento').textContent).toContain('Texto esperado');
```

Com `@testing-library/jest-dom`, você pode escrever:

```javascript
expect(document.querySelector('.meu-elemento')).toHaveTextContent('Texto esperado');
```

A segunda opção é mais clara e focada na intenção do teste.

## Código-Fonte

O conteúdo do arquivo `src/setupTests.js` é bastante simples:

```javascript
import '@testing-library/jest-dom';
```

Esta única linha importa e inicializa a biblioteca `@testing-library/jest-dom`, tornando seus *matchers* personalizados disponíveis para todos os testes no projeto.

## Benefícios

*   **Melhora a legibilidade dos testes:** Os *matchers* personalizados fornecidos por `@testing-library/jest-dom` tornam os testes mais fáceis de entender.
*   **Reduz a duplicação de código:**  A configuração centralizada evita a necessidade de importar a biblioteca em cada arquivo de teste individualmente.
*   **Padronização:** Garante que todos os testes utilizem a mesma configuração do ambiente de testes.
*   **Facilita a manutenção:** Qualquer alteração na configuração do ambiente de testes pode ser feita em um único local.

## Como Utilizar

1.  **Instalação:** Certifique-se de que `@testing-library/jest-dom` esteja instalado como uma dependência de desenvolvimento no seu projeto. Você pode instalá-la usando npm ou yarn:

    ```bash
    npm install --save-dev @testing-library/jest-dom
    # ou
    yarn add --dev @testing-library/jest-dom
    ```

2.  **Importação (Já Feita):** O arquivo `src/setupTests.js` já contém a importação necessária:

    ```javascript
    import '@testing-library/jest-dom';
    ```

3.  **Utilização nos Testes:** Agora você pode usar os *matchers* personalizados da `@testing-library/jest-dom` em seus arquivos de teste.

    **Exemplo:**

    ```javascript
    import React from 'react';
    import { render, screen } from '@testing-library/react';
    import MeuComponente from './MeuComponente';

    test('renderiza o texto corretamente', () => {
      render(<MeuComponente texto="Olá, mundo!" />);
      expect(screen.getByText('Olá, mundo!')).toBeInTheDocument();
      expect(screen.getByText('Olá, mundo!')).toHaveTextContent('Olá, mundo!');
    });
    ```

## Configuração Adicional (Opcional)

O arquivo `setupTests.js` também pode ser utilizado para outras configurações, como:

*   **Mocks Globais:**  Definir mocks para módulos externos ou APIs.
*   **Configuração do Enzyme (se utilizado):** Configurar o adapter do Enzyme para a versão do React.
*   **Limpeza do Ambiente de Testes:**  Realizar limpeza após cada teste (embora o `afterEach` seja mais comum para isso).

## Conclusão

O arquivo `src/setupTests.js` é uma parte fundamental da configuração de testes do projeto. Ele garante que o ambiente de testes esteja corretamente configurado e facilita a escrita de testes mais legíveis e expressivos, especialmente quando se utiliza `@testing-library/jest-dom`. Ao centralizar a configuração, ele contribui para a consistência e a manutenção do código de teste.