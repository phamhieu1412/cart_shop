import {combineReducers} from 'redux';
import products from './Products';
import carts from './Carts';
import messages from './Messages';


//ket hop 2 hay nhieu reducer
const allReducers = combineReducers({
    allProduct: products,
    allCart: carts,
    allMessage : messages
});

export default allReducers;