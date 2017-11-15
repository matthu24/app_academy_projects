import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';
import errorReducer from './error_reducer';
// import usersReducer from
//slices of state
//keys: names of slice of state
export default combineReducers ({
  todos: todosReducer,
  errors: errorReducer
});
