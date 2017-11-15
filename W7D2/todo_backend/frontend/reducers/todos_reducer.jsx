import { RECEIVE_TODO, RECEIVE_TODOS } from '../todo_actions';
import merge from 'lodash/merge';
const _defaultState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  }
};

const todosReducer = (oldState = _defaultState, action) => {
  Object.freeze(oldState);
  switch(action.type){
    case RECEIVE_TODOS:
      //use selector to receive array and output object of objects
      //transforms state
      let nextState = {};
      action.todos.forEach(function(el){
        nextState[el.id] = el;
      });
      return nextState;
    case RECEIVE_TODO:
      //deep dup the oldState
      console.log('Receive Todo action');
      let newState = merge({},oldState);
      const newTodo = action.todo;
      newState[newTodo.id] = newTodo;
      return newState;
    default:
      return oldState;
  }
};



export default todosReducer;
