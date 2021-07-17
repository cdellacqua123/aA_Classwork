import React from 'react'

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      date: new Date()
    };
    this.tick = this.tick.bind(this);
  };

  componentDidMount() {
    this.clockId = setInterval(this.tick, 1000)
  };

  componentWillUnmount() {
    clearInterval(this.clockId)
  };

  tick() {
    this.setState = { date: new Date()}
  };

  render(){
    let hours = this.state.date.getHours()
    let min = this.state.date.getMinutes()
    let sec = this.state.date.getSeconds()
    return (
    <div>
      <h1>Clock</h1>
      <h2>{this.state.date.toDateString()}</h2>
        <h3>{hours}:{min}:{sec}</h3>
    </div>)
  }
};

export default Clock
