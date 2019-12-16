import React, { Component } from 'react';


class Message extends Component {

    render() {
        var {messages} = this.props;

        return (
            <div>
                <h3>
                    <span className="badge amber darken-2">{messages}</span>
                </h3>
            </div>
        );
    }
}


export default Message;