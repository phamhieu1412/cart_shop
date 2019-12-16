import React, {Component} from 'react';
import Header from './components/Header';
import ProductsContainer from './containers/ProductsContainer';
import CartsContainer from './containers/CartsContainer';
import MessagesContainer from './containers/MessagesContainer';
import Footer from './components/Footer';

class App extends Component {
  render(){
    return (
      <div>
          <Header />

          {/* Main */}
          <main id="mainContainer">
              <div className="container">
                <ProductsContainer />

                <MessagesContainer />

                <CartsContainer />
              </div>
          </main>
     
          {/* <!-- Footer --> */}
          <Footer />    
      </div>
    );
  }
}

export default App;
