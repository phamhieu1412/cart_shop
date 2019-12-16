import * as types from '../constants/ActionType';


export const actAddToCart = (product, quantity) => {
    return {
        type: types.Add_To_Cart,
        product,
        quantity
    }    
}
export const actMessageChange = (message) => {
    return {
        type: types.Mess_Change,
        message
    }
}
export const actDeleteToCart = (product) => {
    return {
        type: types.Delete_To_Cart,
        product
    }
}
export const actUpdateProductInCart = (product, quantity) => {
    return {
        type: types.Update_Product_In_Cart,
        product,
        quantity
    }
}