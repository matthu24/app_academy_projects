// export const ADD_ITEM = "ADD_ITEM";
import { requestTodos, postTodo } from '../util/todo_api_util';
import { receiveErrors } from './error_actions';
export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';

//action creators
export const receiveTodos = (todos) => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = (todo) => ({
  type: RECEIVE_TODO,
  todo
});

//thunk creators
export const fetchTodos = () => (dispatch) => (
  requestTodos().then((res) => {
    dispatch(receiveTodos(res));
  })
);

export const createTodo = (todo) => (dispatch) => (
  postTodo(todo).then(
    res => dispatch(receiveTodo(todo)),
    err => dispatch(receiveErrors(err.responseJSON))
  )
);
