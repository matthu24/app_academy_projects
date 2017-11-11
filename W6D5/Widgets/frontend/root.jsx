import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

const panes = [
  {title: "hi", content: "hello"},
  {},
  {}
];

class Root extends React.Component{



  render () {
    return (
      <div>
        <Clock />

        <Tabs panes={panes}/>

      </div>
    );
  }
}

export default Root;
