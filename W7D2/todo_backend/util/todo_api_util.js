export const requestTodos = () => (
  $.ajax({
    method: 'GET',
    url: '/api/todos'
  })
);

export const postTodo = (todo) => {
  console.log(todo);
  return $.ajax({
    method: 'POST',
    url: '/api/todos',
    data: todo
    // error:((res) => {console.log(res)})
    // data: {"todo":{'title':"bye","body":"asdf","done":"false"}}
  });
};

// console.log('here');
// const x = 5;
// export default request;
// console.log('sdf');
