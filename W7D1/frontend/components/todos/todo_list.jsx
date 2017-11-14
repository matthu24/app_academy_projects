import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

// <button onClick={receiveTodo}>Add todo</button>
const TodoList = ( {todos, receiveTodos, receiveTodo} ) => (
  <div>
      <ul>
        {
          todos.map((todo, idx) => (
            //passing in todo,key, and idx as props
            <TodoListItem todo={todo} key={idx} idx={idx} />
          ))
        }
      </ul>
      <TodoForm receiveTodo={receiveTodo}/>
  </div>

);

export default TodoList;
