import * as Message from '../constants/Message';
import * as types from '../constants/ActionType';

var initState = Message.Mess_Welcome;

const messages = (state = initState, action) => {
    switch (action.type) {
        case types.Mess_Change: 
            return action.message;
        default:
            return [...state];
    }
}


export default messages;