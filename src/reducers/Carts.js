import * as types from '../constants/ActionType';


var data = JSON.parse(localStorage.getItem('CART'));

var initState =data ? data : [];

const carts = (state = initState, action) => {
    var {product, quantity} = action;
    var index = -1;
    // -1 la mac dinh sp khong co trong gio hang
    switch (action.type) {
        case types.Add_To_Cart:
            index = findToIndex(state, product);
            if(index !== -1){
                state[index].quantity += quantity;
            }
            else{
                state.push({
                    product,
                    quantity
                });
            }    
            localStorage.setItem('CART', JSON.stringify(state));
            return[...state];
        case types.Delete_To_Cart:
            index = findToIndex(state, product);
            if (index !== -1) {
                state.splice(index, 1)
            }
            localStorage.setItem('CART', JSON.stringify(state));
            return [...state]; 
        case types.Update_Product_In_Cart:
            index=findToIndex(state, product);
            if (index !== -1) {
                state[index].quantity = quantity;
            }
            localStorage.setItem('CART', JSON.stringify(state));
            return [...state];
        default:
            return [...state];
    }
}

var findToIndex = (carts, product) =>{
    var index = -1;
    if (carts.length > 0) {
        for (var i = 0; i < carts.length; i++) {
            if(carts[i].product.id === product.id) {
                index = i;
                break;
            }
        }  
    }
    return index;
}

export default carts;