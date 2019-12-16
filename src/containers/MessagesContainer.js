import React, {Component} from 'react';
import {connect} from 'react-redux';
import Message from '../components/Message.js';

class MessagesContainer extends Component {
  
  render(){
    var {messages} = this.props
    return (
      <Message messages={messages}/>
    );
    
  }
}

//allProduct from reducers/index
const mapStateToProps = (state) => {
  return {
    messages: state.allMessage
  }
}

export default connect(mapStateToProps, null)(MessagesContainer);