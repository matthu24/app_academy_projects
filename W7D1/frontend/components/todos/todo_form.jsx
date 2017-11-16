import React from 'react';
import uniqueId from './utils';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    // this.state = { todo: {title: "",body:""} };
    this.state = {id : "", title: "",body:""};

    this.updateTodo = this.updateTodo.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    // this.state.todo =
  }


  //use this for setting state 
  update(field){
    const id = uniqueId();

    return (e) => {
      this.setState({[id]: id,[field]: e.target.value});
    };
  }

  updateTodo(e) {
    // const todo = {title: e.target.value};
    // console.log(todo);
    // console.log(e.target.value);
    let id = uniqueId();
    const todo =  {id: id, title: e.target.value, body:"" };


    this.setState(todo);

    // console.log(this.state);

  }

  handleSubmit(e) {
    e.preventDefault();
    // console.log('this state todo:', this.state.todo);

    this.props.receiveTodo(this.state);
    console.log(this.props);
    //resets form
    this.setState({ id: "", title: "", body:"" });
  }

  render() {
    console.log(this.state);
    return (
      <div>
        <form>
          <label>Title
            <input
              className="form-title"
              type="text"
              onChange={this.update("title")}
              value={this.state.title}
            />
          </label>
          <button onClick={this.handleSubmit}>Add Todo!</button>
        </form>
      </div>
    );
  }
}
// value={this.state.todo.title}
// <label>Body
//   <input
//     className="form-body"
//     type="text"
//     onChange={this.updateTodo}
//     />
// </label>
// <input type="submit" value="submit" />


export default TodoForm;
