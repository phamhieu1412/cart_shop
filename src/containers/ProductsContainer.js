import React, {Component} from 'react';
import {connect} from 'react-redux';
import Products from '../components/Products';
import Product from '../components/Product';
import {actAddToCart, actMessageChange} from '../actions/Index';


class ProductsContainer extends Component {

  showProduct = (products) => {
    var result  = null;
    if(products.length > 0){
      result = products.map( (product, index) => {
        return <Product product={product} 
                        key={index} 
                        onAddToCart={this.props.onAddToCart}
                        onChangeMessage={this.props.onChangeMessage}
                />
      });
    }
    return result;
  }

  render(){
    var {products} = this.props;

    return (
      <Products >
        {this.showProduct(products)}
      </Products>
    );
    
  }
}

//allProduct from reducers/index
const mapStateToProps = (state) => {
  return {
    products: state.allProduct
  }
}
const mapDispatchToProps = (dispatch) => {
  return {
    onAddToCart: (product)=>{
      dispatch(actAddToCart(product, 1));
    },
    onChangeMessage: (message)=> {
      dispatch(actMessageChange(message));
    }
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(ProductsContainer);