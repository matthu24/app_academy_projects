import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';
// import usersReducer from
//slices of state
//keys: names of slice of state
export default combineReducers ({
  todos: todosReducer
});
