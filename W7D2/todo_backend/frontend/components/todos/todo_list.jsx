import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

// <button onClick={receiveTodo}>Add todo</button>
class TodoList extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount(){
    this.props.receiveTodos();
  }

  render(){
    return(
      <div>
          <ul>
            {
              this.props.todos.map((todo, idx) => (
                //passing in todo,key, and idx as props
                <TodoListItem todo={todo} key={idx} idx={idx} />
              ))
            }
          </ul>
          <TodoForm receiveTodo={this.props.receiveTodo}/>
      </div>
    );
  }
}

//
// const TodoList = ( {todos, receiveTodos, receiveTodo} ) => (
//   <div>
//       <ul>
//         {
//           todos.map((todo, idx) => (
//             //passing in todo,key, and idx as props
//             <TodoListItem todo={todo} key={idx} idx={idx} />
//           ))
//         }
//       </ul>
//       <TodoForm receiveTodo={receiveTodo}/>
//   </div>
//
// );

// const componentDidMount = (() => {
//
// });

export default TodoList;

//equivalent to:
// class TodoList extends React.Component {
//   constructor(props) {
//     super(props);
//     console.log(props);
//   }
//   render() {
//     return (
//       <div>
//         <ul>
//           {
//             this.props.todos.map((todo, idx) => (
//               //passing in todo,key, and idx as props
//               <TodoListItem todo={todo} key={idx} idx={idx} />
//             ))
//           }
//         </ul>
//         <TodoForm receiveTodo={this.props.receiveTodo}/>
//     </div>
//   );
//   }
// }
