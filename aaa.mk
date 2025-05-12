
# Documentação Técnica do Projeto DevConnector 2.0

Este documento fornece uma visão geral da arquitetura, componentes e funcionalidades do projeto DevConnector 2.0, uma rede social para desenvolvedores construída com a MERN stack (MongoDB, Express.js, React.js, Node.js).

## Sumário

*   [Introdução](#introdução)
*   [Arquitetura](#arquitetura)
*   [Detalhes dos Componentes (Client)](#detalhes-dos-componentes-client)
    *   [package.json (Client)](#packagejson-client)
    *   [public/index.html (Client)](#publicindexhtml-client)
    *   [public/manifest.json (Client)](#publicmanifestjson-client)
    *   [src/actions](#srcactions)
    *   [src/App.js](#srcappjs)
    *   [src/components](#srccomponents)
    *   [src/reducers](#srcreducers)
    *   [src/store.js](#srcstorejs)
    *   [src/utils](#srcutils)
    *   [src/App.css](#srcappcss)
*   [Detalhes dos Componentes (Servidor)](#detalhes-dos-componentes-servidor)
    *   [config/db.js (Servidor)](#configdbjs-servidor)
    *   [middleware](#middleware)
    *   [models](#models)
    *   [routes/api](#routesapi)
    *   [server.js (Servidor)](#serverjs-servidor)
    *   [package.json (Servidor)](#packagejson-servidor)
*   [Outros Arquivos](#outros-arquivos)
    *   [jsconfig.json](#jsconfigjson)
    *   [README.md](#readmemd)
    *   [_resources/html_css_theme](#resourceshtml_css_theme)

## Introdução

O DevConnector 2.0 é uma aplicação web que permite aos desenvolvedores criar perfis, conectar-se com outros desenvolvedores, compartilhar posts e obter ajuda. O projeto utiliza uma arquitetura full-stack, com o frontend construído em React.js e o backend em Node.js e Express.js, com o banco de dados MongoDB.

## Arquitetura

A aplicação segue uma arquitetura MERN (MongoDB, Express, React, Node).

*   **Frontend (Client):** Construído com React.js e Redux para gerenciamento de estado.
*   **Backend (Servidor):** Construído com Node.js, Express.js e MongoDB para a API e banco de dados.
*   **Banco de Dados:** MongoDB para armazenar dados de usuários, perfis e posts.

## Detalhes dos Componentes (Client)

O diretório `client` contém o código do frontend da aplicação.

### `client\package.json`

Este arquivo define as dependências e scripts do projeto React.

```json
{
  "name": "client",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "react": "^17.0.2",
    "react-dom": "^17.0.2",
    "react-redux": "^7.2.6",
    "react-router-dom": "^6.0.2",
    "react-scripts": "4.0.3",
    "redux": "^4.1.2",
    "redux-devtools-extension": "^2.13.9",
    "redux-thunk": "^2.4.0",
    "uuid": "^8.3.2"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": "react-app"
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  },
  "proxy": "http://localhost:5000"
}
```

**Principais Dependências:**

*   `react`: Biblioteca principal do React.
*   `react-dom`: Fornece métodos específicos do DOM que podem ser usados no topo do modelo DOM padrão.
*   `react-redux`: Integração do Redux com o React.
*   `react-router-dom`: Roteamento no frontend.
*   `redux`: Gerenciamento de estado da aplicação.
*   `redux-thunk`: Middleware Redux para lidar com actions assíncronas.
*   `uuid`: Geração de identificadores únicos.

**Scripts:**

*   `start`: Inicia o servidor de desenvolvimento.
*   `build`: Cria a versão de produção da aplicação.
*   `test`: Executa os testes da aplicação.

### `client\public\index.html`

Este arquivo é o ponto de entrada do frontend.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="shortcut icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
      integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
      crossorigin="anonymous"
    />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>Welcome To DevConnector</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
```

**Conteúdo:**

*   Define o título da página, links para CSS (Font Awesome) e o elemento raiz (`<div id="root"></div>`) onde a aplicação React será renderizada.

### `client\public\manifest.json`

Este arquivo define metadados sobre a aplicação web para que possa ser instalada como uma Progressive Web App (PWA).

```json
{
  "short_name": "React App",
  "name": "Create React App Sample",
  "icons": [
    {
      "src": "favicon.ico",
      "sizes": "64x64 32x32 24x24 16x16",
      "type": "image/x-icon"
    }
  ],
  "start_url": ".",
  "display": "standalone",
  "theme_color": "#000000",
  "background_color": "#ffffff"
}
```

### `src/actions`

Este diretório contém as actions Redux, que são objetos que descrevem eventos que ocorrem na aplicação.

*   **`alert.js`**: Lida com a exibição de alertas na interface do usuário.

```javascript
import { v4 as uuidv4 } from 'uuid';
import { SET_ALERT, REMOVE_ALERT } from './types';

export const setAlert = (msg, alertType, timeout = 5000) => dispatch => {
  const id = uuidv4();
  dispatch({
    type: SET_ALERT,
    payload: { msg, alertType, id }
  });

  setTimeout(() => dispatch({ type: REMOVE_ALERT, payload: id }), timeout);
};
```

**Explicação:**

*   `setAlert`: Cria e despacha um alerta para ser exibido.  Utiliza a lib `uuid` para geração de id único do alert.
*   A função cria um id único, envia um dispatch do tipo `SET_ALERT` e depois de um timeout, remove o alert da tela com o dispatch do tipo `REMOVE_ALERT`.

*   **`auth.js`**: Lida com a autenticação de usuários.

```javascript
import api from '../utils/api';
import { setAlert } from './alert';
import {
  REGISTER_SUCCESS,
  REGISTER_FAIL,
  USER_LOADED,
  AUTH_ERROR,
  LOGIN_SUCCESS,
  LOGIN_FAIL,
  LOGOUT
} from './types';

// Load User
export const loadUser = () => async (dispatch) => {
  try {
    const res = await api.get('/auth');

    dispatch({
      type: USER_LOADED,
      payload: res.data
    });
  } catch (err) {
    dispatch({
      type: AUTH_ERROR
    });
  }
};

// Register User
export const register = (formData) => async (dispatch) => {
  try {
    const res = await api.post('/users', formData);

    dispatch({
      type: REGISTER_SUCCESS,
      payload: res.data
    });
    dispatch(loadUser());
  } catch (err) {
    const errors = err.response.data.errors;

    if (errors) {
      errors.forEach((error) => dispatch(setAlert(error.msg, 'danger')));
    }

    dispatch({
      type: REGISTER_FAIL
    });
  }
};

// Login User
export const login = (email, password) => async (dispatch) => {
  const body = { email, password };

  try {
    const res = await api.post('/auth', body);

    dispatch({
      type: LOGIN_SUCCESS,
      payload: res.data
    });

    dispatch(loadUser());
  } catch (err) {
    const errors = err.response.data.errors;

    if (errors) {
      errors.forEach((error) => dispatch(setAlert(error.msg, 'danger')));
    }

    dispatch({
      type: LOGIN_FAIL
    });
  }
};

// Logout
export const logout = () => ({ type: LOGOUT });
```

**Explicação:**

*   `loadUser`: Carrega os dados do usuário autenticado.
*   `register`: Registra um novo usuário.
*   `login`: Autentica um usuário existente.
*   `logout`: Desloga o usuário.
*   A função utiliza a lib `api` para fazer requisições assíncronas ao backend, e usa o `dispatch` para executar as actions.

*   **`post.js`**: Lida com as ações relacionadas a posts.
*   **`profile.js`**: Lida com as ações relacionadas a perfis.
*   **`types.js`**: Define os tipos de actions Redux.

### `src/App.js`

Este arquivo é o componente raiz da aplicação React.

```javascript
import React, { useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './components/layout/Navbar';
import Landing from './components/layout/Landing';
import Register from './components/auth/Register';
import Login from './components/auth/Login';
import Alert from './components/layout/Alert';
import Dashboard from './components/dashboard/Dashboard';
import ProfileForm from './components/profile-forms/ProfileForm';
import AddExperience from './components/profile-forms/AddExperience';
import AddEducation from './components/profile-forms/AddEducation';
import Profiles from './components/profiles/Profiles';
import Profile from './components/profile/Profile';
import Posts from './components/posts/Posts';
import Post from './components/post/Post';
import NotFound from './components/layout/NotFound';
import PrivateRoute from './components/routing/PrivateRoute';
import { LOGOUT } from './actions/types';

// Redux
import { Provider } from 'react-redux';
import store from './store';
import { loadUser } from './actions/auth';
import setAuthToken from './utils/setAuthToken';

import './App.css';

const App = () => {
  useEffect(() => {
    // check for token in LS when app first runs
    if (localStorage.token) {
      // if there is a token set axios headers for all requests
      setAuthToken(localStorage.token);
    }
    // try to fetch a user, if no token or invalid token we
    // will get a 401 response from our API
    store.dispatch(loadUser());

    // log user out from all tabs if they log out in one tab
    window.addEventListener('storage', () => {
      if (!localStorage.token) store.dispatch({ type: LOGOUT });
    });
  }, []);

  return (
    <Provider store={store}>
      <Router>
        <Navbar />
        <Alert />
        <Routes>
          <Route path="/" element={<Landing />} />
          <Route path="register" element={<Register />} />
          <Route path="login" element={<Login />} />
          <Route path="profiles" element={<Profiles />} />
          <Route path="profile/:id" element={<Profile />} />
          <Route
            path="dashboard"
            element={<PrivateRoute component={Dashboard} />}
          />
          <Route
            path="create-profile"
            element={<PrivateRoute component={ProfileForm} />}
          />
          <Route
            path="edit-profile"
            element={<PrivateRoute component={ProfileForm} />}
          />
          <Route
            path="add-experience"
            element={<PrivateRoute component={AddExperience} />}
          />
          <Route
            path="add-education"
            element={<PrivateRoute component={AddEducation} />}
          />
          <Route path="posts" element={<PrivateRoute component={Posts} />} />
          <Route path="posts/:id" element={<PrivateRoute component={Post} />} />
          <Route path="/*" element={<NotFound />} />
        </Routes>
      </Router>
    </Provider>
  );
};

export default App;
```

**Explicação:**

*   Configura o roteamento da aplicação usando `react-router-dom`.
*   Importa e renderiza os componentes principais da aplicação (Navbar, Landing, Register, Login, etc.).
*   Utiliza o `useEffect` hook para carregar o usuário autenticado quando a aplicação é iniciada.
*   Envolve a aplicação com o `Provider` do Redux para disponibilizar o store para todos os componentes.

### `src/components`

Este diretório contém os componentes React da aplicação.

*   **`auth`**: Componentes para autenticação (Login, Register).
*   **`dashboard`**: Componentes para o painel do usuário (Dashboard, DashboardActions, Experience, Education).
*   **`layout`**: Componentes de layout (Navbar, Landing, Alert, Spinner, NotFound).
*   **`post`**: Componentes relacionados a um único post (CommentForm, CommentItem, Post).
*   **`posts`**: Componentes para exibir múltiplos posts (PostForm, PostItem, Posts).
*   **`profile`**: Componentes para exibir um perfil de usuário (Profile, ProfileAbout, ProfileEducation, ProfileExperience, ProfileGithub, ProfileTop).
*   **`profile-forms`**: Componentes para criar e editar perfis (AddEducation, AddExperience, ProfileForm).
*   **`profiles`**: Componentes para exibir uma lista de perfis (ProfileItem, Profiles).
*   **`routing`**: Componente `PrivateRoute` para proteger rotas que exigem autenticação.

Cada componente é responsável por renderizar uma parte específica da interface do usuário e interagir com as actions Redux para atualizar o estado da aplicação.

### `src/reducers`

Este diretório contém os reducers Redux, que são funções que especificam como o estado da aplicação muda em resposta às actions.

*   **`alert.js`**: Lida com o estado dos alertas.
*   **`auth.js`**: Lida com o estado de autenticação do usuário.
*   **`post.js`**: Lida com o estado dos posts.
*   **`profile.js`**: Lida com o estado dos perfis.
*   **`index.js`**: Combina todos os reducers em um único reducer raiz.

### `src/store.js`

Este arquivo configura o store Redux, que é o contêiner de estado da aplicação.

```javascript
import { createStore, applyMiddleware } from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import thunk from 'redux-thunk';
import rootReducer from './reducers';
import setAuthToken from './utils/setAuthToken';

const initialState = {};

const middleware = [thunk];

const store = createStore(
  rootReducer,
  initialState,
  composeWithDevTools(applyMiddleware(...middleware))
);

/*
  NOTE: set up a store subscription listener
  to store the users token in localStorage
 */

/*
  initialize current state from redux store for subscription comparison
  preventing undefined error
 */
let currentState = store.getState();

store.subscribe(() => {
  // keep track of the previous and current state to compare changes
  let previousState = currentState;
  currentState = store.getState();
  // if the token changes set the value in localStorage and axios headers
  if (previousState.auth.token !== currentState.auth.token) {
    const token = currentState.auth.token;
    setAuthToken(token);
  }
});

export default store;
```

**Explicação:**

*   Cria o store Redux com o reducer raiz, estado inicial e middleware (redux-thunk para ações assíncronas).
*   Utiliza o `composeWithDevTools` para habilitar as Redux DevTools.

### `src/utils`

Este diretório contém utilitários para a aplicação.

*   **`api.js`**: Cria uma instância do Axios para fazer requisições à API backend.  Responsável por adicionar o token JWT no header da requisição.
*   **`formatDate.js`**: Formata datas para exibição.  Utiliza a lib `Intl` para formatar a data.
*   **`setAuthToken.js`**: Define o token de autenticação nos headers do Axios e no localStorage.  Remove o token quando o usuário desloga.

### `src/App.css`

Este arquivo contém os estilos CSS globais para a aplicação.

```css
/* Global Styles */
:root {
  --primary-color: #17a2b8;
  --dark-color: #343a40;
  --light-color: #f4f4f4;
  --danger-color: #dc3545;
  --success-color: #28a745;
}

* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: 'Raleway', sans-serif;
  font-size: 1rem;
  line-height: 1.6;
  background-color: #fff;
  color: #333;
}

a {
  color: var(--primary-color);
  text-decoration: none;
}

ul {
  list-style: none;
}

img {
  width: 100%;
}

/* Utilities */
.container {
  max-width: 1100px;
  margin: auto;
  overflow: hidden;
  padding: 0 2rem;
  margin-top: 6rem;
  margin-bottom: 3rem;
}

/* Text Styles*/
.x-large {
  font-size: 4rem;
  line-height: 1.2;
  margin-bottom: 1rem;
}

.large {
  font-size: 3rem;
  line-height: 1.2;
  margin-bottom: 1rem;
}

.lead {
  font-size: 1.5rem;
  margin-bottom: 1rem;
}

.text-center {
  text-align: center;
}

.text-primary {
  color: var(--primary-color);
}

.text-dark {
  color: var(--dark-color);
}

/* Padding */
.p {
  padding: 0.5rem;
}
.p-1 {
  padding: 1rem;
}
.p-2 {
  padding: 2rem;
}
.p-3 {
  padding: 3rem;
}
.py {
  padding: 0.5rem 0;
}
.py-1 {
  padding: 1rem 0;
}
.py-2 {
  padding: 2rem 0;
}
.py-3 {
  padding: 3rem 0;
}

/* Margin */
.m {
  margin: 0.5rem;
}
.m-1 {
  margin: 1rem;
}
.m-2 {
  margin: 2rem;
}
.m-3 {
  margin: 3rem;
}
.my {
  margin: 0.5rem 0;
}
.my-1 {
  margin: 1rem 0;
}
.my-2 {
  margin: 2rem 0;
}
.my-3 {
  margin: 3rem 0;
}

.btn {
  display: inline-block;
  background: var(--light-color);
  color: #333;
  padding: 0.4rem 1.3rem;
  font-size: 1rem;
  border: none;
  cursor: pointer;
  margin-right: 0.5rem;
  transition: opacity 0.2s ease-in;
  outline: none;
}

.badge {
  font-size: 0.8rem;
  padding: 0.1rem;
  text-align: center;
  margin: 0.3rem;
  background: var(--light-color);
  color: #333;
}

.alert {
  padding: 0.8rem;
  margin: 1rem 0;
  opacity: 0.9;
  background: var(--light-color);
  color: #333;
}

.btn-primary,
.bg-primary,
.badge-primary,
.alert-primary {
  background: var(--primary-color);
  color: #fff;
}

.btn-light,
.bg-light,
.badge-light,
.alert-light {
  background: var(--light-color);
  color: #333;
}

.btn-dark,
.bg-dark,
.badge-dark,
.alert-dark {
  background: var(--dark-color);
  color: #fff;
}

.btn-danger,
.bg-danger,
.badge-danger,
.alert-danger {
  background: var(--danger-color);
  color: #fff;
}

.btn-success,
.bg-success,
.badge-success,
.alert-success {
  background: var(--success-color);
  color: #fff;
}

.btn-white,
.bg-white,
.badge-white,
.alert-white {
  background: #fff;
  color: #333;
  border: #ccc solid 1px;
}

.btn:hover {
  opacity: 0.8;
}

.bg-light,
.badge-light {
  border: #ccc solid 1px;
}

.round-img {
  border-radius: 50%;
}

.line {
  height: 1px;
  background: #ccc;
  margin: 1.5rem 0;
}

/* Overlay */
.dark-overlay {
  background-color: rgba(0, 0, 0, 0.7);
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

/* Forms */
.form .form-group {
  margin: 1.2rem 0;
}

.form .form-text {
  display: block;
  margin-top: 0.3rem;
  color: #888;
}

.form input[type='text'],
.form input[type='email'],
.form input[type='password'],
.form input[type='date'],
.form select,
.form textarea {
  display: block;
  width: 100%;
  padding: 0.4rem;
  font-size: 1.2rem;
  border: 1px solid #ccc;
}

.form input[type='submit'],
button {
  font: inherit;
}

.form .social-input {
  display: flex;
}

.form .social-input i {
  padding: 0.5rem;
  width: 4rem;
}

.form .social-input i.fa-twitter {
  color: #38a1f3;
}
.form .social-input i.fa-facebook {
  color: #3b5998;
}
.form .social-input i.fa-instagram {
  color: #3f729b;
}
.form .social-input i.fa-youtube {
  color: #c4302b;
}
.form .social-input i.fa-linkedin {
  color: #0077b5;
}

.table th,
.table td {
  padding: 1rem;
  text-align: left;
}

.table th {
  background: var(--light-color);
}

/* Navbar */
.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.7rem 2rem;
  position: fixed;
  z-index: 1;
  width: 100%;
  top: 0;
  border-bottom: solid 1px var(--primary-color);
  opacity: 0.9;
}

.navbar ul {
  display: flex;
}

.navbar a {
  color: #fff;
  padding: 0.45rem;
  margin: 0 0.25rem;
}

.navbar a:hover {
  color: var(--primary-color);
}

.navbar .welcome span {
  margin-right: 0.6rem;
}

/* Landing Page */
.landing {
  position: relative;
  background: url('./img/showcase.jpg') no-repeat center center/cover;
  height: 100vh;
}

.landing-inner {
  color: #fff;
  height: 100%;
  width: 80%;
  margin: auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
}

/* Profiles Page */
.profile {
  display: grid;
  grid-template-columns: 2fr 4fr 2fr;
  align-items: center;
  grid-gap: 2rem;
  padding: 1rem;
  line-height: 1.8;
  margin-bottom: 1rem;
}

/* Profile Page */
.profile-grid {
  display: grid;
  grid-template-areas:
    'top top'
    'about about'
    'exp edu'
    'github github';
  grid-gap: 1rem;
}

.profile-top {
  grid-area: top;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
}

.profile-top img {
  width: 250px;
}

.profile-top .icons a {
  color: #fff;
  margin: 0 0.3rem;
}

.profile-top .icons a:hover {
  color: var(--dark-color);
}

.profile-about {
  grid-area: about;
  text-align: center;
}

.profile-about .skills {
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
}

.profile-exp {
  grid-area: exp;
}

.profile-edu {
  grid-area: edu;
}

.profile-exp h2,
.profile-edu h2 {
  margin-bottom: 1rem;
}

.profile-exp > div,
.profile-edu > div {
  margin-bottom: 1rem;
  padding-bottom: 1rem;
  border-bottom: #ccc 1px dotted;
}

.profile-exp > div:last-child,
.profile-edu > div:last-child {
  border: 0;
}

.profile-exp p,
.profile-edu p {
  margin: 0.5rem 0;
}

.profile-github {
  grid-area: github;
}

.profile-github .repo {
  display: flex;
}

.profile-github .repo > div:first-child {
  flex: 7;
  flex-basis: 70%;
}

.profile-github > div:last-child {
  flex: 3;
  flex-basis: 20%;
}

/* Posts Page */
.post-form .post-form-header {
  background: var(--primary-color);
  padding: 0.5rem;
}

.post {
  display: grid;
  grid-template-columns: 1fr 4fr;
  grid-gap: 2rem;
  align-items: center;
}

.post > div:first-child {
  text-align: center;
}

.post img {
  width: 100px;
}

.post .comment-count {
  background: var(--light-color);
  color: var(--primary-color);
  padding: 0.1rem 0.2rem;
  border-radius: 5px;
  font-size: 0.8rem;
}

.post .post-date {
  color: #aaa;
  font-size: 0.8rem;
  margin-bottom: 0.5rem;
}

/* Mobile Styles */
@media (max-width: 700px) {
  .container {
    margin-top: 8rem;
  }

  .hide-sm {
    display: none;
  }

  /* Text Styles */
  .x-large {
    font-size: 3rem;
  }

  .large {
    font-size: 2rem;
  }

  .lead {
    font-size: 1rem;
  }

  /* Navbar */
  .navbar {
    display: block;
    text-align: center;
  }

  .navbar ul {
    text-align: center;
    justify-content: center;
  }

  .navbar h1 {
    margin-bottom: 1rem;
  }

  .navbar .welcome {
    display: none;
  }

  /* Profiles Page */
  .profile {
    grid-template-columns: 1fr;
    text-align: center;
  }

  .profile ul {
    display: none;
  }

  /* Profile Page */

  .profile-top img,
  .profile img {
    width: 200px;
    margin: auto;
  }

  .profile-grid {
    grid-template-areas:
      'top'
      'about'
      'exp'
      'edu'
      'github';
  }

  .profile-about .skills {
    flex-direction: column;
  }

  .dash-buttons a {
    display: block;
    width: 100%;
    margin-bottom: 0.2rem;
  }

  .post {
    grid-template-columns: 1fr;
  }
  .post a,
  .post button {
    padding: 0.3rem 0.4rem;
  }
}

.alert-wrapper {
  position: fixed;
  top: 4rem;
  right: 2rem;
  display: inline-block;
}
```

## Detalhes dos Componentes (Servidor)

O backend da aplicação é construído com Node.js, Express.js e MongoDB.

### `config\db.js`

Este arquivo contém a configuração da conexão com o banco de dados MongoDB.

```javascript
const mongoose = require('mongoose');
const config = require('config');
const db = config.get('mongoURI');

const connectDB = async () => {
  try {
    await mongoose.connect(db, {
      useNewUrlParser: true,
      useCreateIndex: true,
      useFindAndModify: false,
      useUnifiedTopology: true
    });

    console.log('MongoDB Connected...');
  } catch (err) {
    console.error(err.message);
    // Exit process with failure
    process.exit(1);
  }
};

module.exports = connectDB;
```

### `middleware`

Este diretório contém middlewares para a aplicação Express.

*   **`auth.js`**: Middleware para autenticação de rotas.

```javascript
const jwt = require('jsonwebtoken');
const config = require('config');

module.exports = function (req, res, next) {
  // Get token from header
  const token = req.header('x-auth-token');

  // Check if not token
  if (!token) {
    return res.status(401).json({ msg: 'No token, authorization denied' });
  }

  // Verify token
  try {
    jwt.verify(token, config.get('jwtSecret'), (error, decoded) => {
      if (error) {
        return res.status(401).json({ msg: 'Token is not valid' });
      } else {
        req.user = decoded.user;
        next();
      }
    });
  } catch (err) {
    console.error('something wrong with auth middleware');
    res.status(500).json({ msg: 'Server Error' });
  }
};
```

**