
# Documentação Técnica do Projeto DevConnector 2.0

Este documento fornece uma visão geral da arquitetura e implementação do projeto DevConnector 2.0, uma rede social para desenvolvedores.  Ele cobre a estrutura do projeto, os principais componentes e arquivos, e o fluxo de dados.

## Sumário

*   [Estrutura do Projeto](#estrutura-do-projeto)
*   [Client](#client)
    *   [package.json](#clientpackagejson)
    *   [public/index.html](#clientpublicindexhtml)
    *   [public/manifest.json](#clientpublicmanifestjson)
    *   [src/actions](#srcactions)
        *   [alert.js](#srcactionsalertjs)
        *   [auth.js](#srcactionsauthjs)
        *   [post.js](#srcactionspostjs)
        *   [profile.js](#srcactionsprofilejs)
        *   [types.js](#srcactionstypesjs)
    *   [src/App.js](#srcappjs)
    *   [src/App.css](#srcappcss)
    *   [src/components](#srccomponents)
        *   [auth](#srccomponentsauth)
            *   [Login.js](#srccomponentsauthloginjs)
            *   [Register.js](#srccomponentsauthregisterjs)
        *   [dashboard](#srccomponentsdashboard)
            *   [Dashboard.js](#srccomponentsdashboarddashboardjs)
            *   [DashboardActions.js](#srccomponentsdashboarddashboardactionsjs)
            *   [Education.js](#srccomponentsdashboardeducationjs)
            *   [Experience.js](#srccomponentsdashboardexperiencejs)
        *   [layout](#srccomponentslayout)
            *   [Alert.js](#srccomponentslayoutalertjs)
            *   [Landing.js](#srccomponentslayoutlandingjs)
            *   [Navbar.js](#srccomponentslayoutnavbarjs)
            *   [NotFound.js](#srccomponentslayoutnotfoundjs)
            *   [Spinner.js](#srccomponentslayoutspinnerjs)
        *   [post](#srccomponentspost)
            *   [CommentForm.js](#srccomponentspostcommentformjs)
            *   [CommentItem.js](#srccomponentspostcommentitemjs)
            *   [Post.js](#srccomponentspostpostjs)
        *   [posts](#srccomponentsposts)
            *   [PostForm.js](#srccomponentspostspostformjs)
            *   [PostItem.js](#srccomponentspostspostitemjs)
            *   [Posts.js](#srccomponentspostspostsjs)
        *   [profile](#srccomponentsprofile)
            *   [Profile.js](#srccomponentsprofileprofilejs)
            *   [ProfileAbout.js](#srccomponentsprofileprofileaboutjs)
            *   [ProfileEducation.js](#srccomponentsprofileprofileeducationjs)
            *   [ProfileExperience.js](#srccomponentsprofileprofileexperiencejs)
            *   [ProfileGithub.js](#srccomponentsprofileprofilegithubjs)
            *   [ProfileTop.js](#srccomponentsprofileprofiletopjs)
        *   [profile-forms](#srccomponentsprofile-forms)
            *   [AddEducation.js](#srccomponentsprofile-formsaddeducationjs)
            *   [AddExperience.js](#srccomponentsprofile-formsaddexperiencejs)
            *   [ProfileForm.js](#srccomponentsprofile-formsprofileformjs)
        *   [profiles](#srccomponentsprofiles)
            *   [ProfileItem.js](#srccomponentsprofilesprofileitemjs)
            *   [Profiles.js](#srccomponentsprofilesprofilesjs)
        *   [routing](#srccomponentsrouting)
            *   [PrivateRoute.js](#srccomponentsroutingprivateRoutejs)
    *   [src/index.js](#srcindexjs)
    *   [src/reducers](#srcreducers)
        *   [alert.js](#srcreducersalertjs)
        *   [auth.js](#srcreducersauthjs)
        *   [index.js](#srcreducersindexjs)
        *   [post.js](#srcreducerspostjs)
        *   [profile.js](#srcreducersprofilejs)
    *   [src/store.js](#srcstorejs)
    *   [src/utils](#srcutils)
        *   [api.js](#srcutilsapijs)
        *   [formatDate.js](#srcutilsformatDatejs)
        *   [setAuthToken.js](#srcutilssetAuthTokenjs)
*   [Backend](#backend)
    *   [config/db.js](#configdbjs)
    *   [jsconfig.json](#jsconfigjson)
    *   [middleware](#middleware)
        *   [auth.js](#middlewareauthjs)
        *   [checkObjectId.js](#middlewarecheckobjectidjs)
    *   [models](#models)
        *   [Post.js](#modelspostjs)
        *   [Profile.js](#modelsprofilejs)
        *   [User.js](#modelsuserjs)
    *   [package.json](#packagejson)
    *   [README.md](#readmemd)
    *   [routes/api](#routesapi)
        *   [auth.js](#routesapiauthjs)
        *   [posts.js](#routesapipostsjs)
        *   [profile.js](#routesapiprofilejs)
        *   [users.js](#routesapiusersjs)
    *   [server.js](#serverjs)
*   [_resources/html\_css\_theme](#_resourceshtml_css_theme)
    *   [add-education.html](#_resourceshtml_css_themeadd-educationhtml)
    *   [add-experience.html](#_resourceshtml_css_themeadd-experiencehtml-1)
    *   [create-profile.html](#_resourceshtml_css_themecreate-profilehtml)
    *   [css/style.css](#_resourceshtml_css_themecssstylecss)
    *   [dashboard.html](#_resourceshtml_css_themedashboardhtml)
    *   [index.html](#_resourceshtml_css_themeindexhtml)
    *   [login.html](#_resourceshtml_css_themeloginhtml)
    *   [post.html](#_resourceshtml_css_themeposthtml)
    *   [posts.html](#_resourceshtml_css_themepostshtml)
    *   [profile.html](#_resourceshtml_css_themeprofilehtml)
    *   [profiles.html](#_resourceshtml_css_themeprofileshtml)
    *   [register.html](#_resourceshtml_css_themeregisterhtml)

## Estrutura do Projeto

O projeto segue uma arquitetura MERN (MongoDB, Express, React, Node.js):

*   **client:** Contém o código frontend React.
*   **config:** Contém arquivos de configuração, como a string de conexão ao banco de dados.
*   **middleware:** Contém funções middleware para autenticação e validação.
*   **models:** Define os esquemas de dados para o MongoDB.
*   **routes:** Define as rotas da API para o backend.
*   **server.js:** O ponto de entrada do servidor Node.js.

## Client

### client\package.json

Este arquivo define as dependências, scripts e informações gerais sobre o frontend do projeto.

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

*   **react:** A biblioteca principal do React.
*   **react-dom:** Fornece métodos específicos do DOM que são usados no nível superior para ativar seu modelo React.
*   **react-redux:** Integração do Redux com o React.
*   **react-router-dom:** Roteamento para aplicações React.
*   **redux:** Gerenciamento de estado para o frontend.
*   **redux-thunk:** Middleware para Redux que permite escrever action creators que retornam uma função em vez de uma ação.

**Scripts:**

*   **start:** Inicia o servidor de desenvolvimento.
*   **build:** Constrói a aplicação para produção.
*   **test:** Executa os testes.

### client\public\index.html

Este é o arquivo HTML principal do frontend. Ele define a estrutura básica da página e inclui os arquivos JavaScript.

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

### client\public\manifest.json

Este arquivo define metadados sobre a aplicação web para permitir que ela seja instalada como um aplicativo progressivo (PWA).

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

### src/actions

Esta pasta contém os arquivos que definem as actions do Redux. As actions são objetos que descrevem um evento que ocorreu na aplicação.

#### src\actions\alert.js

Este arquivo define as actions relacionadas a alertas na aplicação.

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

**Função `setAlert`:**

*   Cria um ID único para o alerta usando a biblioteca `uuid`.
*   Dispara uma action do tipo `SET_ALERT` com a mensagem, tipo e ID do alerta.
*   Define um timeout para remover o alerta após um determinado período.

#### src\actions\auth.js

Este arquivo define as actions relacionadas à autenticação do usuário.

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

**Principais Funções:**

*   **loadUser:** Carrega as informações do usuário autenticado.
*   **register:** Registra um novo usuário.
*   **login:** Autentica um usuário existente.
*   **logout:** Desloga o usuário.

**Fluxo de Dados (Exemplo: Registro):**

1.  O componente de registro chama a action `register` com os dados do formulário.
2.  A action `register` faz uma requisição POST para a API `/users`.
3.  Se o registro for bem-sucedido, a action dispara `REGISTER_SUCCESS` e carrega as informações do usuário.
4.  Se ocorrer um erro, a action dispara `REGISTER_FAIL` e exibe alertas com as mensagens de erro.

#### src\actions\post.js

Este arquivo define as actions relacionadas aos posts da aplicação.

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

**Principais Funções:**

*   **getPosts:** Busca todos os posts.
*   **addLike:** Adiciona um like a um post.
*   **removeLike:** Remove um like de um post.
*   **deletePost:** Deleta um post.
*   **addPost:** Adiciona um novo post.
*   **getPost:** Busca um post específico.
*   **addComment:** Adiciona um comentário a um post.
*   **deleteComment:** Deleta um comentário de um post.

#### src\actions\profile.js

Este arquivo define as actions relacionadas ao perfil do usuário.

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

**Principais Funções:**

*   **getCurrentProfile:** Busca o perfil do usuário atual.
*   **getProfiles:** Busca todos os perfis.
*   **getProfileById:** Busca um perfil específico por ID.
*   **getGithubRepos:** Busca os repositórios do Github de um usuário.
*   **createProfile:** Cria ou atualiza um perfil.
*   **addExperience:** Adiciona uma experiência ao perfil.
*   **addEducation:** Adiciona uma educação ao perfil.
*   **deleteExperience:** Deleta uma experiência do perfil.
*   **deleteEducation:** Deleta uma educação do perfil.
*   **deleteAccount:** Deleta a conta e o perfil do usuário.

#### src\actions\types.js

Este arquivo define as constantes para os tipos de actions do Redux.

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

### src\App.js

Este é o componente principal da aplicação React. Ele define o roteamento e inclui outros componentes importantes.

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

**Principais Características:**

*   **useEffect:** Hook do React que é executado após a renderização do componente. Ele carrega o usuário autenticado e configura um listener para o evento `storage` para detectar o logout em outras abas.
*   **Routes e Route:** Componentes do `react-router-dom` que definem as rotas da aplicação.
*   **PrivateRoute:** Componente que protege as rotas que exigem autenticação.
*   **Provider:** Componente do `react-redux` que fornece o store do Redux para todos os componentes da aplicação.

### src\App.css

Este arquivo define os estilos globais da aplicação.

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
  padding: 3