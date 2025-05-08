
# Documentação Técnica do Projeto DevConnector 2.0

Este documento fornece uma visão geral da arquitetura e implementação do projeto DevConnector 2.0, uma rede social para desenvolvedores.

## Sumário

*   [Visão Geral](#visão-geral)
*   [Arquitetura](#arquitetura)
*   [Configuração](#configuração)
*   [Estrutura do Projeto](#estrutura-do-projeto)
*   [Detalhes dos Arquivos](#detalhes-dos-arquivos)
    *   [client/package.json](#clientpackagejson)
    *   [client/public/index.html](#clientpublicindexhtml)
    *   [client/public/manifest.json](#clientpublicmanifestjson)
    *   [client/src/actions/alert.js](#clientsrcactionsalertjs)
    *   [client/src/actions/auth.js](#clientsrcactionsauthjs)
    *   [client/src/actions/post.js](#clientsrcactionspostjs)
    *   [client/src/actions/profile.js](#clientsrcactionsprofilejs)
    *   [client/src/actions/types.js](#clientsrcactionstypesjs)
    *   [client/src/App.css](#clientsrcappcss)
    *   [client/src/App.js](#clientsrcappjs)
    *   [client/src/components/auth/Login.js](#clientsrccomponentsauthloginjs)
    *   [client/src/components/auth/Register.js](#clientsrccomponentsauthregisterjs)
    *   [client/src/components/dashboard/Dashboard.js](#clientsrccomponentsdashboarddashboardjs)
    *   [client/src/components/dashboard/DashboardActions.js](#clientsrccomponentsdashboarddashboardactionsjs)
    *   [client/src/components/dashboard/Education.js](#clientsrccomponentsdashboardeducationjs)
    *   [client/src/components/dashboard/Experience.js](#clientsrccomponentsdashboardexperiencejs)
    *   [client/src/components/layout/Alert.js](#clientsrccomponentslayoutalertjs)
    *   [client/src/components/layout/Landing.js](#clientsrccomponentslayoutlandingjs)
    *   [client/src/components/layout/Navbar.js](#clientsrccomponentslayoutnavbarjs)
    *   [client/src/components/layout/NotFound.js](#clientsrccomponentslayoutnotfoundjs)
    *   [client/src/components/layout/Spinner.js](#clientsrccomponentslayoutspinnerjs)
    *   [client/src/components/post/CommentForm.js](#clientsrccomponentspostcommentformjs)
    *   [client/src/components/post/CommentItem.js](#clientsrccomponentspostcommentitemjs)
    *   [client/src/components/post/Post.js](#clientsrccomponentspostpostjs)
    *   [client/src/components/posts/PostForm.js](#clientsrccomponentspostspostformjs)
    *   [client/src/components/posts/PostItem.js](#clientsrccomponentspostspostitemjs)
    *   [client/src/components/posts/Posts.js](#clientsrccomponentspostspostsjs)
    *   [client/src/components/profile/Profile.js](#clientsrccomponentsprofileprofilejs)
    *   [client/src/components/profile/ProfileAbout.js](#clientsrccomponentsprofileprofileaboutjs)
    *   [client/src/components/profile/ProfileEducation.js](#clientsrccomponentsprofileprofileeducationjs)
    *   [client/src/components/profile/ProfileExperience.js](#clientsrccomponentsprofileprofileexperiencejs)
    *   [client/src/components/profile/ProfileGithub.js](#clientsrccomponentsprofileprofilegithubjs)
    *   [client/src/components/profile/ProfileTop.js](#clientsrccomponentsprofileprofiletopjs)
    *   [client/src/components/profile-forms/AddEducation.js](#clientsrccomponentsprofile-formsaddeducationjs)
    *   [client/src/components/profile-forms/AddExperience.js](#clientsrccomponentsprofile-formsaddexperiencejs)
    *   [client/src/components/profile-forms/ProfileForm.js](#clientsrccomponentsprofile-formsprofileformjs)
    *   [client/src/components/profiles/ProfileItem.js](#clientsrccomponentsprofilesprofileitemjs)
    *   [client/src/components/profiles/Profiles.js](#clientsrccomponentsprofilesprofilesjs)
    *   [client/src/components/routing/PrivateRoute.js](#clientsrccomponentsroutingprivateRoutejs)
    *   [client/src/index.js](#clientsrcindexjs)
    *   [client/src/reducers/alert.js](#clientsrcreducersalertjs)
    *   [client/src/reducers/auth.js](#clientsrcreducersauthjs)
    *   [client/src/reducers/index.js](#clientsrcreducersindexjs)
    *   [client/src/reducers/post.js](#clientsrcreducerspostjs)
    *   [client/src/reducers/profile.js](#clientsrcreducersprofilejs)
    *   [client/src/store.js](#clientsrcstorejs)
    *   [client/src/utils/api.js](#clientsrcutilsapi.js)
    *   [client/src/utils/formatDate.js](#clientsrcutilsformatDate.js)
    *   [client/src/utils/setAuthToken.js](#clientsrcutilssetAuthToken.js)
    *   [config/db.js](#configdb.js)
    *   [jsconfig.json](#jsconfigjson)
    *   [middleware/auth.js](#middlewareauth.js)
    *   [middleware/checkObjectId.js](#middlewarecheckObjectId.js)
    *   [models/Post.js](#modelspost.js)
    *   [models/Profile.js](#modelsprofile.js)
    *   [models/User.js](#modelsuser.js)
    *   [package.json](#packagejson)
    *   [README.md](#readmemd)
    *   [routes/api/auth.js](#routesapiauth.js)
    *   [routes/api/posts.js](#routesapiposts.js)
    *   [routes/api/profile.js](#routesapiprofile.js)
    *   [routes/api/users.js](#routesapiusers.js)
    *   [server.js](#server.js)

*   [Recursos HTML/CSS (Theme)](#recursos-htmlcsstheme)
    *   [add-education.html](#add-educationhtml)
    *   [add-experience.html](#add-experiencehtml)
    *   [create-profile.html](#create-profilehtml)
    *   [css/style.css](#cssstylecss)
    *   [dashboard.html](#dashboardhtml)
    *   [index.html](#indexhtml)
    *   [login.html](#loginhtml)
    *   [post.html](#posthtml)
    *   [posts.html](#postshtml)
    *   [profile.html](#profilehtml)
    *   [profiles.html](#profileshtml)
    *   [register.html](#registerhtml)

## Visão Geral

O DevConnector 2.0 é uma aplicação web completa construída utilizando a stack MERN (MongoDB, Express, React, Node.js). Ela permite que desenvolvedores criem perfis, compartilhem posts e interajam com outros membros da comunidade. O projeto foi criado a partir do curso "MERN Stack Front To Back" na Udemy.

## Arquitetura

O projeto segue uma arquitetura de front-end separado do back-end. O front-end, construído com React e Redux, comunica-se com o back-end através de requisições HTTP. O back-end, construído com Node.js, Express e MongoDB, fornece APIs RESTful para manipulação de dados e autenticação.

*   **Front-end (client):**  Responsável pela interface do usuário e interação com o usuário.
*   **Back-end:** Responsável pela lógica de negócios, acesso a dados e autenticação.
*   **Banco de Dados (MongoDB):** Utilizado para armazenar dados persistentes.

## Configuração

Para executar o projeto, é necessário configurar o banco de dados MongoDB e as variáveis de ambiente.

1.  **MongoDB:** Instale o MongoDB e crie um banco de dados.
2.  **Variáveis de Ambiente:** Crie um arquivo `config/default.json` com as seguintes variáveis:

```json
{
  "mongoURI": "<sua_uri_mongodb>",
  "jwtSecret": "<sua_chave_jwt>",
  "githubToken": "<seu_token_github>"
}
```

Substitua `<sua_uri_mongodb>`, `<sua_chave_jwt>`, e `<seu_token_github>` com as informações apropriadas.

## Estrutura do Projeto

A estrutura do projeto é organizada da seguinte forma:

```
devconnector/
├── client/          # Código do front-end (React)
├── config/          # Arquivos de configuração
├── middleware/      # Middlewares do Express
├── models/          # Modelos do Mongoose
├── routes/          # Rotas da API
├── server.js        # Arquivo principal do servidor
├── package.json     # Arquivo de dependências do back-end
└── README.md        # Arquivo de documentação
```

## Detalhes dos Arquivos

Esta seção detalha o propósito e o conteúdo dos principais arquivos do projeto.

### `client/package.json`

Este arquivo contém informações sobre o projeto front-end, incluindo dependências, scripts e configurações.

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

*   **Dependencies:** Lista as bibliotecas e frameworks utilizados no front-end.
*   **Scripts:** Define comandos para executar o projeto, construir a aplicação e executar testes.
*   **Proxy:** Configura o proxy para direcionar as requisições da API para o servidor back-end.

### `client/public/index.html`

Este é o arquivo HTML principal do projeto front-end.

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

*   **Meta Tags:** Define metadados sobre a página HTML.
*   **Links:**  Importa a biblioteca Font Awesome para ícones e o arquivo `manifest.json` para Progressive Web App (PWA).
*   **`div#root`:**  É o ponto de montagem para a aplicação React.

### `client/public/manifest.json`

Este arquivo define os metadados para transformar a aplicação em uma PWA.

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

### `client/src/actions/alert.js`

Este arquivo define as ações relacionadas aos alertas na aplicação.

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

*   **`setAlert`:** Cria e despacha um alerta para o Redux store.
    *   `msg`: Mensagem do alerta.
    *   `alertType`: Tipo do alerta (ex: 'success', 'danger').
    *   `timeout`: Tempo (em ms) antes do alerta desaparecer.

### `client/src/actions/auth.js`

Este arquivo define as ações relacionadas à autenticação do usuário.

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

*   **`loadUser`:** Carrega as informações do usuário autenticado a partir da API.
*   **`register`:** Registra um novo usuário na API.
*   **`login`:** Autentica um usuário existente na API.
*   **`logout`:** Desloga o usuário, limpando o token e as informações do usuário.

### `client/src/actions/post.js`

Este arquivo define as ações relacionadas aos posts da aplicação.

```javascript
import api from '../utils/api';
import { setAlert } from './alert';
import {
  GET_POSTS,
  POST_ERROR,
  UPDATE_LIKES,
  DELETE_POST,
  ADD_POST,
  GET_POST,
  ADD_COMMENT,
  REMOVE_COMMENT
} from './types';

// Get posts
export const getPosts = () => async (dispatch) => {
  try {
    const res = await api.get('/posts');

    dispatch({
      type: GET_POSTS,
      payload: res.data
    });
  } catch (err) {
    dispatch({
      type: POST_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Add like
export const addLike = (id) => async (dispatch) => {
  try {
    const res = await api.put(`/posts/like/${id}`);

    dispatch({
      type: UPDATE_LIKES,
      payload: { id, likes: res.data }
    });
  } catch (err) {
    dispatch({
      type: POST_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Remove like
export const removeLike = (id) => async (dispatch) => {
  try {
    const res = await api.put(`/posts/unlike/${id}`);

    dispatch({
      type: UPDATE_LIKES,
      payload: { id, likes: res.data }
    });
  } catch (err) {
    dispatch({
      type: POST_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Delete post
export const deletePost = (id) => async (dispatch) => {
  try {
    await api.delete(`/posts/${id}`);

    dispatch({
      type: DELETE_POST,
      payload: id
    });

    dispatch(setAlert('Post Removed', 'success'));
  } catch (err) {
    dispatch({
      type: POST_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Add post
export const addPost = (formData) => async (dispatch) => {
  try {
    const res = await api.post('/posts', formData);

    dispatch({
      type: ADD_POST,
      payload: res.data
    });

    dispatch(setAlert('Post Created', 'success'));
  } catch (err) {
    dispatch({
      type: POST_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Get post
export const getPost = (id) => async (dispatch) => {
  try {
    const res = await api.get(`/posts/${id}`);

    dispatch({
      type: GET_POST,
      payload: res.data
    });
  } catch (err) {
    dispatch({
      type: POST_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Add comment
export const addComment = (postId, formData) => async (dispatch) => {
  try {
    const res = await api.post(`/posts/comment/${postId}`, formData);

    dispatch({
      type: ADD_COMMENT,
      payload: res.data
    });

    dispatch(setAlert('Comment Added', 'success'));
  } catch (err) {
    dispatch({
      type: POST_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Delete comment
export const deleteComment = (postId, commentId) => async (dispatch) => {
  try {
    await api.delete(`/posts/comment/${postId}/${commentId}`);

    dispatch({
      type: REMOVE_COMMENT,
      payload: commentId
    });

    dispatch(setAlert('Comment Removed', 'success'));
  } catch (err) {
    dispatch({
      type: POST_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};
```

*   **`getPosts`:** Busca todos os posts da API.
*   **`addLike`:** Adiciona um "like" a um post na API.
*   **`removeLike`:** Remove um "like" de um post na API.
*   **`deletePost`:** Deleta um post da API.
*   **`addPost`:** Adiciona um novo post na API.
*   **`getPost`:** Busca um post específico da API.
*   **`addComment`:** Adiciona um comentário a um post na API.
*   **`deleteComment`:** Deleta um comentário de um post na API.

### `client/src/actions/profile.js`

Este arquivo define as ações relacionadas ao perfil do usuário.

```javascript
import api from '../utils/api';
import { setAlert } from './alert';

import {
  GET_PROFILE,
  GET_PROFILES,
  PROFILE_ERROR,
  UPDATE_PROFILE,
  CLEAR_PROFILE,
  ACCOUNT_DELETED,
  GET_REPOS,
  NO_REPOS
} from './types';

// Get current users profile
export const getCurrentProfile = () => async (dispatch) => {
  try {
    const res = await api.get('/profile/me');

    dispatch({
      type: GET_PROFILE,
      payload: res.data
    });
  } catch (err) {
    dispatch({
      type: PROFILE_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Get all profiles
export const getProfiles = () => async (dispatch) => {
  dispatch({ type: CLEAR_PROFILE });

  try {
    const res = await api.get('/profile');

    dispatch({
      type: GET_PROFILES,
      payload: res.data
    });
  } catch (err) {
    dispatch({
      type: PROFILE_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Get profile by ID
export const getProfileById = (userId) => async (dispatch) => {
  try {
    const res = await api.get(`/profile/user/${userId}`);

    dispatch({
      type: GET_PROFILE,
      payload: res.data
    });
  } catch (err) {
    dispatch({
      type: PROFILE_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Get Github repos
export const getGithubRepos = (username) => async (dispatch) => {
  try {
    const res = await api.get(`/profile/github/${username}`);

    dispatch({
      type: GET_REPOS,
      payload: res.data
    });
  } catch (err) {
    dispatch({
      type: NO_REPOS
    });
  }
};

// Create or update profile
export const createProfile =
  (formData, edit = false) =>
  async (dispatch) => {
    try {
      const res = await api.post('/profile', formData);

      dispatch({
        type: GET_PROFILE,
        payload: res.data
      });

      dispatch(
        setAlert(edit ? 'Profile Updated' : 'Profile Created', 'success')
      );
    } catch (err) {
      const errors = err.response.data.errors;

      if (errors) {
        errors.forEach((error) => dispatch(setAlert(error.msg, 'danger')));
      }

      dispatch({
        type: PROFILE_ERROR,
        payload: { msg: err.response.statusText, status: err.response.status }
      });
    }
  };

// Add Experience
export const addExperience = (formData) => async (dispatch) => {
  try {
    const res = await api.put('/profile/experience', formData);

    dispatch({
      type: UPDATE_PROFILE,
      payload: res.data
    });

    dispatch(setAlert('Experience Added', 'success'));
    return res.data;
  } catch (err) {
    const errors = err.response.data.errors;

    if (errors) {
      errors.forEach((error) => dispatch(setAlert(error.msg, 'danger')));
    }

    dispatch({
      type: PROFILE_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Add Education
export const addEducation = (formData) => async (dispatch) => {
  try {
    const res = await api.put('/profile/education', formData);

    dispatch({
      type: UPDATE_PROFILE,
      payload: res.data
    });

    dispatch(setAlert('Education Added', 'success'));
    return res.data;
  } catch (err) {
    const errors = err.response.data.errors;

    if (errors) {
      errors.forEach((error) => dispatch(setAlert(error.msg, 'danger')));
    }

    dispatch({
      type: PROFILE_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Delete experience
export const deleteExperience = (id) => async (dispatch) => {
  try {
    const res = await api.delete(`/profile/experience/${id}`);

    dispatch({
      type: UPDATE_PROFILE,
      payload: res.data
    });

    dispatch(setAlert('Experience Removed', 'success'));
  } catch (err) {
    dispatch({
      type: PROFILE_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Delete education
export const deleteEducation = (id) => async (dispatch) => {
  try {
    const res = await api.delete(`/profile/education/${id}`);

    dispatch({
      type: UPDATE_PROFILE,
      payload: res.data
    });

    dispatch(setAlert('Education Removed', 'success'));
  } catch (err) {
    dispatch({
      type: PROFILE_ERROR,
      payload: { msg: err.response.statusText, status: err.response.status }
    });
  }
};

// Delete account & profile
export const deleteAccount = () => async (dispatch) => {
  if (window.confirm('Are you sure? This can NOT be undone!')) {
    try {
      await api.delete('/profile');

      dispatch({ type: CLEAR_PROFILE });
      dispatch({ type: ACCOUNT_DELETED });

      dispatch(setAlert('Your account has been permanently deleted'));
    } catch (err) {
      dispatch({
        type: PROFILE_ERROR,
        payload: { msg: err.response.statusText, status: err.response.status }
      });
    }
  }
};
```

*   **`getCurrentProfile`:** Busca o perfil do usuário logado.
*   **`getProfiles`:** Busca todos os perfis dos usuários.
*   **`getProfileById`:** Busca um perfil específico pelo ID do usuário.
*   **`getGithubRepos`:** Busca os repositórios do Github de um usuário.
*   **`createProfile`:** Cria ou atualiza um perfil.
*   **`addExperience`:** Adiciona uma experiência ao perfil.
*   **`addEducation`:** Adiciona uma educação ao perfil.
*   **`deleteExperience`:** Deleta uma experiência do perfil.
*   **`deleteEducation`:** Deleta uma educação do perfil.
*   **`deleteAccount`:** Deleta a conta do usuário e o perfil associado.

### `client/src/actions/types.js`

Este arquivo define as constantes para os tipos de ação do Redux.

```javascript
export const SET_ALERT = 'SET_ALERT';
export const REMOVE_ALERT = 'REMOVE_ALERT';
export const REGISTER_SUCCESS = 'REGISTER_SUCCESS';
export const REGISTER_FAIL = 'REGISTER_FAIL';
export const USER_LOADED = 'USER_LOADED';
export const AUTH_ERROR = 'AUTH_ERROR';
export const LOGIN_SUCCESS = 'LOGIN_SUCCESS';
export const LOGIN_FAIL = 'LOGIN_FAIL';
export const LOGOUT = 'LOGOUT';
export const GET_PROFILE = 'GET_PROFILE';
export const GET_PROFILES = 'GET_PROFILES';
export const GET_REPOS = 'GET_REPOS';
export const NO_REPOS = 'NO_REPOS';
export const UPDATE_PROFILE = 'UPDATE_PROFILE';
export const CLEAR_PROFILE = 'CLEAR_PROFILE';
export const PROFILE_ERROR = 'PROFILE_ERROR';
export const ACCOUNT_DELETED = 'ACCOUNT_DELETED';
export const GET_POSTS = 'GET_POSTS';
export const GET_POST = 'GET_POST';
export const POST_ERROR = 'POST_ERROR';
export const UPDATE_LIKES = 'UPDATE_LIKES';
export const DELETE_POST = 'DELETE_POST';
export const ADD_POST = 'ADD_POST';
export const ADD_COMMENT = 'ADD_COMMENT';
export const REMOVE_COMMENT = 'REMOVE_COMMENT';
```

### `client/src/App.css`

Este arquivo contém os estilos CSS globais da aplicação.

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

/* ... (rest of the CSS) ... */
```

### `client/src/App.js`

Este é o componente raiz da aplicação React. Ele define as rotas e a estrutura da aplicação.

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
          