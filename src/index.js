import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import * as serviceWorker from './serviceWorker';


import {createStore} from 'redux';
import allReducers from './reducers/Index';
import { Provider } from 'react-redux';

const storeApp = createStore(
    allReducers
);

ReactDOM.render(
    <Provider store={storeApp} >
        <App />
    </Provider>,
     document.getElementById('root')
);




serviceWorker.unregister();
