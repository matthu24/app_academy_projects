import React from 'react';

class Clock extends React.Component {
  constructor () {
    super();
    this.handle = 0;
    this.state = {
      time: new Date()
    };
  }

  // tick() {
  //   const time = new Date();
  //   this.setState({time});
  // }

  tick() {
    const newTime = new Date();
    this.setState({time: newTime});
  }

  componentDidMount() {
    this.handle = setInterval(() => {
      this.tick();
    }, 1000);
    return this.handle;
  }

  componentWillUnmount(){
    clearInterval(this.handle);
    this.handle = 0;
  }

  render () {

    return (
      <div className = "clock">
        <h1>Clock</h1>
        <section className = "clock-container">
          <div className = "title-container">
          <p>Time:</p>
          <p>Date:</p>
          </div>
          <div>
            <p className = "time">{this.state.time.toTimeString()}</p>
          <p className = "date">{this.state.time.toDateString()}</p>
          </div>
        </section>


      </div>
    );
  }
}


export default Clock;
