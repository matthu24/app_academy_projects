// let result = [];
// todos.forEach(function(el) {
//   result.push(todos[el]);
// });
// return result;
//grabs and formats the data (slice of state)
//does not modify anything, just grabs and returns in specific way
//useful for iterating through your objects
export const getAllTodos = (state) => {
  const todos = Object.keys(state.todos);
  return todos.map(function(id) {
    return state.todos[id];
  });
};

//identical approach:
// export const getAllTodos = ({ todos }) => (
// 	Object.keys(todos).map(id => todos[id])
// );
