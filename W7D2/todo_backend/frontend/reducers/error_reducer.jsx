import { RECEIVE_ERRORS, CLEAR_ERRORS } from '../error_actions';
const _defaultState = [];
const errorReducer = (oldState = _defaultState, action) => {
  switch(action.type) {
    case RECEIVE_ERRORS:
      let nextState = action.errors;
      return nextState;
    case CLEAR_ERRORS:
      let newState = [];
      return newState;
    default:
      return oldState;
  }
};

export default errorReducer;
