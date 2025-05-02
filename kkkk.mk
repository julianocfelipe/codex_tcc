
# Documentação Técnica do Projeto DevConnector 2.0

Este documento fornece uma visão geral e documentação técnica do projeto DevConnector 2.0, uma rede social para desenvolvedores construída com a stack MERN (MongoDB, Express, React, Node.js).

## Sumário

*   [Visão Geral](#visão-geral)
*   [Estrutura do Projeto](#estrutura-do-projeto)
*   [Client (Frontend)](#client-frontend)+*
    *   [package.json](#packagejson)
    *   [public/index.html](#publicindexhtml)
    *   [public/manifest.json](#publicmanifestjson)
    *   [src/actions](#srcactions)
    *   [src/components](#srccomponents)
    *   [src/App.js](#srcappjs)
    *   [src/App.css](#srcappcss)
    *   [src/reducers](#srcreducers)
    *   [src/utils](#srcutils)
*   [Server (Backend)](#server-backend)
    *   [config/db.js](#configdbjs)
    *   [middleware](#middleware)
    *   [models](#models)
    *   [routes/api](#routesapi)
    *   [server.js](#serverjs)
*   [Outros Arquivos](#outros-arquivos)
    *   [package.json (raiz)](#packagejson-raiz)
    *   [README.md](#readmemd)
*   [Considerações Finais](#considerações-finais)

## Visão Geral

O DevConnector 2.0 é uma plataforma projetada para conectar desenvolvedores, permitindo que eles criem perfis, compartilhem posts e obtenham ajuda de outros membros da comunidade. Este projeto utiliza a stack MERN para oferecer uma solução full-stack robusta e escalável.

## Estrutura do Projeto

A estrutura do projeto é dividida em duas partes principais:

*   **Client:** O frontend da aplicação, construído com React e Redux.
*   **Server:** O backend da aplicação, construído com Node.js, Express e MongoDB.

## Client (Frontend)

A pasta `client` contém todo o código relacionado ao frontend da aplicação.

### `client/package.json`

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

**Dependências Notáveis:**

*   `react`, `react-dom`: Biblioteca React para construção da interface do usuário.
*   `react-redux`, `redux`, `redux-thunk`: Para gerenciamento de estado.
*   `react-router-dom`: Para roteamento no frontend.
*   `uuid`: Para gerar IDs únicos (usado para alertas).

### `client/public/index.html`

Este é o arquivo HTML principal do projeto React. Ele define a estrutura básica da página e carrega o código JavaScript.

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

### `client/public/manifest.json`

Este arquivo define metadados sobre a aplicação web, como nome, ícones e tema. Ele é usado para tornar a aplicação instalável como um Progressive Web App (PWA).

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

### `client/src/actions`

Esta pasta contém as actions do Redux, responsáveis por disparar eventos que modificam o estado da aplicação.

*   **`alert.js`:** Lida com a exibição de alertas na interface do usuário.

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

    Esta action cria um alerta com uma mensagem, tipo e ID único, e o remove após um tempo limite.

*   **`auth.js`:** Lida com a autenticação do usuário (registro, login, logout).

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

    // ... (login, logout)
    ```

    As actions de autenticação interagem com a API do backend para registrar, logar e carregar informações do usuário.

*   **`post.js`:** Lida com a criação, leitura, atualização e exclusão de posts.

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

    // ... (addLike, removeLike, deletePost, addPost, getPost, addComment, deleteComment)
    ```

    As actions de postagem interagem com a API do backend para gerenciar as postagens dos usuários, incluindo likes, comentários e exclusão.

*   **`profile.js`:** Lida com a criação, leitura, atualização e exclusão de perfis de usuário.

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

    // ... (getProfiles, getProfileById, getGithubRepos, createProfile, addExperience, addEducation, deleteExperience, deleteEducation, deleteAccount)
    ```

    As actions de perfil interagem com a API do backend para gerenciar os perfis dos usuários, incluindo experiências, educação e informações do GitHub.

*   **`types.js`:** Define as constantes de tipos de action do Redux.

    ```javascript
    export const SET_ALERT = 'SET_ALERT';
    export const REMOVE_ALERT = 'REMOVE_ALERT';
    export const REGISTER_SUCCESS = 'REGISTER_SUCCESS';
    export const REGISTER_FAIL = 'REGISTER_FAIL';
    export const USER_LOADED = 'USER_LOADED';
    // ...
    ```

    Este arquivo centraliza as strings que representam os tipos de actions, facilitando a manutenção e evitando erros de digitação.

### `client/src/components`

Esta pasta contém os componentes React que formam a interface do usuário. A estrutura de pastas geralmente segue a funcionalidade ou página que o componente representa.

**Exemplo:**

*   **`auth`:** Componentes relacionados à autenticação (Login, Register).
*   **`dashboard`:** Componentes relacionados ao painel do usuário (Dashboard, DashboardActions).
*   **`layout`:** Componentes de layout (Navbar, Landing, Alert).
*   **`posts`:** Componentes para exibir e criar posts (PostItem, Posts, PostForm).
*   **`profile`:** Componentes relacionados a perfis (Profile, ProfileAbout, ProfileExperience).
*   **`profile-forms`:** Componentes para criar e editar perfis (ProfileForm, AddExperience, AddEducation).
*   **`routing`:** Componentes para roteamento (PrivateRoute).

### `client/src/App.js`

Este é o componente raiz da aplicação React. Ele define o roteamento e renderiza os componentes principais.

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

**Funcionalidades Chave:**

*   Define as rotas da aplicação usando `react-router-dom`.
*   Conecta a aplicação ao store do Redux usando `<Provider store={store}>`.
*   Carrega o usuário ao iniciar a aplicação (`loadUser`).
*   Configura um listener para o evento `storage` para detectar logout em outras abas.

### `client/src/App.css`

Este arquivo contém os estilos globais da aplicação.

```css
/* Global Styles */
:root {
  --primary-color: #17a2b8;
  --dark-color: #343a40;
  --light-color: #f4f4f4;
  --danger-color: #dc3545;
  --success-color: #28a745;
}

/* ... (outros estilos) */
```

Define variáveis de cores e estilos básicos para a aplicação, utilizando uma abordagem mobile-first com media queries.

### `client/src/reducers`

Esta pasta contém os reducers do Redux, responsáveis por atualizar o estado da aplicação com base nas actions disparadas.

*   **`alert.js`:** Lida com o estado dos alertas.

    ```javascript
    import { SET_ALERT, REMOVE_ALERT } from '../actions/types';

    const initialState = [];

    function alertReducer(state = initialState, action) {
      const { type, payload } = action;

      switch (type) {
        case SET_ALERT:
          return [...state, payload];
        case REMOVE_ALERT:
          return state.filter((alert) => alert.id !== payload);
        default:
          return state;
      }
    }

    export default alertReducer;
    ```

    Adiciona e remove alertas do estado.

*   **`auth.js`:** Lida com o estado de autenticação do usuário.

    ```javascript
    import {
      REGISTER_SUCCESS,
      //REGISTER_FAIL,
      USER_LOADED,
      AUTH_ERROR,
      LOGIN_SUCCESS,
      //LOGIN_FAIL,
      LOGOUT,
      ACCOUNT_DELETED
    } from '../actions/types';

    const initialState = {
      token: localStorage.getItem('token'),
      isAuthenticated: null,
      loading: true,
      user: null
    };

    function authReducer(state = initialState, action) {
      const { type, payload } = action;

      switch (type) {
        case USER_LOADED:
          return {
            ...state,
            isAuthenticated: true,
            loading: false,
            user: payload
          };
        case REGISTER_SUCCESS:
        case LOGIN_SUCCESS:
          return {
            ...state,
            ...payload,
            isAuthenticated: true,
            loading: false
          };
        case ACCOUNT_DELETED:
        case AUTH_ERROR:
        case LOGOUT:
          return {
            ...state,
            token: null,
            isAuthenticated: false,
            loading: false,
            user: null
          };
        default:
          return state;
      }
    }

    export default authReducer;
    ```

    Atualiza o estado com base nas actions de autenticação, como login, registro, carregamento do usuário e logout.

*   **`profile.js`:** Lida com o estado do perfil do usuário.

    ```javascript
    import {
      GET_PROFILE,
      PROFILE_ERROR,
      CLEAR_PROFILE,
      UPDATE_PROFILE,
      GET_PROFILES,
      GET_REPOS,
      NO_REPOS
    } from '../actions/types';

    const initialState = {
      profile: null,
      profiles: [],
      repos: [],
      loading: true,
      error: {}
    };

    function profileReducer(state = initialState, action) {
      const { type, payload } = action;

      switch (type) {
        case GET_PROFILE:
        case UPDATE_PROFILE:
          return {
            ...state,
            profile: payload,
            loading: false
          };
        case GET_PROFILES:
          return {
            ...state,
            profiles: payload,
            loading: false
          };
        case PROFILE_ERROR:
          return {
            ...state,
            error: payload,
            loading: false,
            profile: null
          };
        case CLEAR_PROFILE:
          return {
            ...state,
            profile: null,
            repos: []
          };
        case GET_REPOS:
          return {
            ...state,
            repos: payload,
            loading: false
          };
        case NO_REPOS:
          return {
            ...state,
            repos: []
          };
        default:
          return state;
      }
    }

    export default profileReducer;
    ```

    Gerencia o estado do perfil do usuário, incluindo informações do perfil, repositórios do GitHub e erros.

*   **`post.js`:** Lida com o estado dos posts.

     ```javascript
    import {
      GET_POSTS,
      POST_ERROR,
      UPDATE_LIKES,
      DELETE_POST,
      ADD_POST,
      GET_POST,
      ADD_COMMENT,
      REMOVE_COMMENT
    } from '../actions/types';

    const initialState = {
      posts: [],
      post: null,
      loading: true,
      error: {}
    };

    function postReducer(state = initialState, action) {
      const { type, payload } = action;

      switch (type) {
        case GET_POSTS:
          return {
            ...state,
            posts: payload,
            loading: false
          };
        case GET_POST:
          return {
            ...state,
            post: payload,
            loading: false
          };
        case ADD_POST:
          return {
            ...state,
            posts: [payload, ...state.posts],
            loading: false
          };
        case DELETE_POST:
          return {
            ...state,
            posts: state.posts.filter((post) => post._id !== payload),
            loading: false
          };
        case POST_ERROR:
          return {
            ...state,
            error: payload,
            loading: false
          };
        case UPDATE_LIKES:
          return {
            ...state,
            posts: state.posts.map((post) =>
              post._id === payload.id ? { ...post, likes: payload.likes } : post
            ),
            loading: false
          };
        case ADD_COMMENT:
          return {
            ...state,
            post: { ...state.post, comments: payload },
            loading: false
          };
        case REMOVE_COMMENT:
          return {
            ...state,
            post: {
              ...state.post,
              comments: state.post.comments.filter(
                (comment) => comment._id !== payload
              )
            },
            loading: false
          };
        default:
          return state;
      }
    }

    export default postReducer;
    ```

    Gerencia o estado das postagens, incluindo a lista de postagens, a postagem atual, comentários e erros.

*   **`index.js`:** Combina todos os reducers em um único reducer raiz.

    ```javascript
    import { combineReducers } from 'redux';
    import alert from './alert';
    import auth from './auth';
    import profile from './profile';
    import post from './post';

    export default combineReducers({
      alert,
      auth,
      profile,
      post
    });
    ```

    Utiliza a função `combineReducers` do Redux para combinar todos os reducers em um único objeto, que é exportado como o reducer raiz da aplicação.

### `client/src/utils`

Esta pasta contém utilitários usados em toda a aplicação.

*   **`api.js`:** Configura uma instância do Axios para fazer requisições à API do backend. Inclui um interceptor para lidar com erros de autenticação (token expirado).

    ```javascript
    import axios from 'axios';
    import store from '../store';
    import { LOGOUT } from '../actions/types';

    // Create an instance of axios
    const api = axios.create({
      baseURL: '/api',
      headers: {
        'Content-Type': 'application/json'
      }
    });
    /*
      NOTE: intercept any error responses from the api
    and check if the token is no longer valid.
    ie. Token has expired or user is no longer
    authenticated.
    logout the user if the token has expired
    */

    api.interceptors.response.use(
      (res) => res,
      (err) => {
        if (err.response.status === 401) {
          store.dispatch({ type: LOGOUT });
        }
        return Promise.reject(err);
      }
    );

    export default api;
    ```
*   **`formatDate.js`:** Formata datas para exibição.
    ```javascript
    function formatDate(date) {
    return new Intl.DateTimeFormat().format(new Date(date));
    }

    export default formatDate;
    ```

*   **`setAuthToken.js`:** Define o token de autenticação no cabeçalho das requisições Axios e no localStorage.

    ```javascript
    import api from './api';

    // store our JWT in LS and set axios headers if we do have a token

    const setAuthToken = (token) => {
      if (token) {
        api.defaults.headers.common['x-auth-token'] = token;
        localStorage.setItem('token', token);
      } else {
        delete api.defaults.headers.common['x-auth-token'];
        localStorage.removeItem('token');
      }
    };

    export default setAuthToken;
    ```

## Server (Backend)

A raiz do projeto contém todo o código relacionado ao backend da aplicação.

### `config/db.js`

Este arquivo configura a conexão com o banco de dados MongoDB.

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

Esta pasta contém middlewares utilizados nas rotas da API.

*   **`auth.js`:** Middleware para autenticação de rotas protegidas.

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

    Verifica se o token JWT é válido e adiciona as informações do usuário ao objeto de requisição.

*   **`checkObjectId.js`:** Middleware para validar IDs de objetos MongoDB.

    ```javascript
    const mongoose = require('mongoose');
    // middleware to check for a valid object id
    const checkObjectId = (idToCheck) => (req, res, next) => {
      if (!mongoose.Types.ObjectId.isValid(req.params[idToCheck]))
        return res.status(400).json({ msg: 'Invalid ID' });
      next();
    };

    module.exports = checkObjectId;
    ```

    Garante que o ID fornecido como parâmetro na rota é um ID de objeto MongoDB válido.

### `models`

Esta pasta contém os modelos de dados do MongoDB.

*   **`Post.js`:** Define o modelo para posts.

    ```javascript
    const mongoose = require('mongoose');
    const Schema = mongoose.Schema;

    const PostSchema = new Schema({
      user: {
        type: Schema.Types.ObjectId
      },
      text: {
        type: String,
        required: true
      },
      name: {
        type: String
      },
      avatar: {
        type: String
      },
      likes: [
        {
          user: {
            type: Schema.Types.ObjectId
          }
        }
      ],
      comments: [
        {
          user: {
            type: Schema.Types.ObjectId
          },
          text: {
            type: String,
            required: true
          },
          name: {
            type: String
          },
          avatar: {
            type: String
          },
          date: {
            type: Date,
            default: Date.now
          }
        }
      ],
      date: {
        type: Date,
        default: Date.now
      }
    });

    module.exports = mongoose.model('post', PostSchema);
    ```

*   **`Profile.js`:** Define o modelo para perfis de usuário.

    ```javascript
    const mongoose = require('mongoose');

    const ProfileSchema = new mongoose.Schema({
      user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'user'
      },
      company: {
        type: String
      },
      website: {
        type: String
      },
      location: {
        type: String
      },
      status: {
        type: String,
        required: true
      },
      skills: {
        type: [String],
        required: true
      },
      bio: {
        type: String
      },
      githubusername: {
        type: String
      },
      experience: [
        {
          title: {
            type: String,
            required: true
          },
          company: {
            type: String,
            required: true
          },
          location: {
            type: String
          },
          from: {
            type: Date,
            required: true
          },
          to: {
            type: Date
          },
          current: {
            type: Boolean,
            default: false
          },
          description: {
            type: String
          }
        }
      ],
      education: [
        {
          school: {
            type: String,
            required: true
          },
          degree: {
            type: String,
            required: true
          },
          fieldofstudy: {
            type: String,
            required: true
          },
          from: {
            type: Date,
            required: true
          },
          to: {
            type: Date
          },
          current: {
            type: Boolean,
            default: false
          },
          description: {
            type: String
          }
        }
      ],
      social: {
        youtube: {
          type: String
        },
        twitter: {
          type: String
        },
        facebook: {
          type: String
        },
        linkedin: {
          type: String
        },
        instagram: {
          type: String
        }
      },
      date: {
        type: Date,
        default: Date.now
      }
    });

    module.exports = mongoose.model('profile', ProfileSchema);
    ```

*   **`User.js`:** Define o modelo para usuários.

    ```javascript
    const mongoose = require('mongoose');

    const UserSchema = new mongoose.Schema({
      name: {
        type: String,
        required: true
      },
      email: {
        type: String,
        required: true,
        unique: true
      },
      password: {
        type: String,
        required: true
      },
      avatar: {
        type: String
      },
      date: {
        type: Date,
        default: Date.now
      }
    });

    module.exports = mongoose.model('user', UserSchema);
    ```

### `routes/api`

Esta pasta contém as rotas da API.

*   **`auth.js`:** Rotas para autenticação (login, obter usuário).

    ```javascript
    const express = require('express');
    const router = express.Router();
    const bcrypt = require('bcryptjs');
    const auth = require('../../middleware/auth');
    const jwt = require('jsonwebtoken');
    const config = require('config');
    const { check, validationResult } = require('express-validator');

    const User = require('../../models/User');

    // @route    GET api/auth
    // @desc     Get user by token
    // @access   Private
    router.get('/', auth, async (req, res) => {
      try {
        const user = await User.findById(req.user.id).select('-password');
        res.json(user);
      } catch (err) {
        console.error(err.message);
        res.status(500).send('Server Error');
      }
    });

    // @route    POST api/auth
    // @desc     Authenticate user & get token
    // @access   Public
    router.post(
      '/',
      check('email', 'Please include a valid email').isEmail(),
      check('password', 'Password is required').exists(),
      async (req, res) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
          return res.status(400).json({ errors: errors.array() });
        }

        const { email, password } = req.body;

        try {
          let user = await User.findOne({ email });

          if (!user) {
            return res
              .status(400)
              .json({ errors: [{ msg: 'Invalid Credentials' }] });
          }

          const isMatch = await bcrypt.compare(password, user.password);

          if (!isMatch) {
            return res
              .status(400)
              .json({ errors: [{ msg: 'Invalid Credentials' }] });
          }

          const payload = {
            user: {
              id: user.id
            }
          };

          jwt.sign(
            payload,
            config.get('jwtSecret'),
            { expiresIn: '5 days' },
            (err, token) => {
              if (err) throw err;
              res.json({ token });
            }
          );
        } catch (err) {
          console.error(err.