import React from 'react';

class Tabs extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      index: 1
    };
    this.setIndex = this.setIndex.bind(this);
  }

  setIndex(e){
    const index = parseInt(e.target.className);
    this.setState({index}, () => (
      console.log(this.state)

    ));
  }

  render () {
    const currentTab = this.props.panes[this.state.index];
    return(
      <div>
        <ul className="tabs">
          <li><h1 className="1" onClick = {this.setIndex}>1</h1></li>
          <li><h1 className="2" onClick = {this.setIndex}>2</h1></li>
          <li><h1 className="3" onClick = {this.setIndex}>3</h1></li>
        </ul>
        <article>{currentTab.content}</article>
      </div>
    );
  }
}

export default Tabs;
