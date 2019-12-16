import React, {Component} from 'react';
import {connect} from 'react-redux';
import Cart from '../components/Cart';
import * as Message from '../constants/Message';
import CartItems from '../components/CartItems';
import Result from '../components/Result';
import { actDeleteToCart, actMessageChange, actUpdateProductInCart } from '../actions/Index';


class CartsContainer extends Component {
  showCartItem = (carts) => {
    var result = <tbody><tr><td>{Message.Mess_Empty}</td></tr></tbody>;
    if (carts.length > 0) {
      result = carts.map( (item, index)=>{
        return <CartItems 
                  key={index} 
                  item={item}
                  onDeleteToCart={this.props.onDeleteToCart}
                  onChangeMessage={this.props.onChangeMessage}
                  onUpdateProductInCart={this.props.onUpdateProductInCart}
                />
      });
    }
    return result;
  }

  showTotalItem = (carts) => {
    var result = null;
    if (carts.length > 0) {
      result =  <Result carts={carts}/>
    }
    return result;
  }

  render(){
    var {carts} = this.props;
    return (
      <Cart >
        {this.showCartItem(carts)}
        {this.showTotalItem(carts)}
      </Cart>
    );
    
  }
}

//allProduct from reducers/index
const mapStateToProps = (state) => {
  return {
    carts: state.allCart
  }
}
const mapDispatchToProps = (dispatch) => {
  return {
    onDeleteToCart: (product) => {
      dispatch(actDeleteToCart(product))
    },
    onChangeMessage: (message) => {
      dispatch(actMessageChange(message))
    },
    onUpdateProductInCart: (product, quantity) => {
      dispatch(actUpdateProductInCart(product, quantity))
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(CartsContainer);