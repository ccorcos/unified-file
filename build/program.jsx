
var Counter = React.createClass({
  getInitialState: function() {
    return {count: 0}
  },
  inc: function() {
    this.setState({count:this.state.count+1})
  },
  render: function() {
    return (
      <div className='counter'>
        <div className='count'>{this.state.count}</div>
        <button onClick={this.inc}>inc</button>
      </div>
    )
  }
})


var App = React.createClass({
  render: function() {
    return (
      <div className='counters'>
        <Counter/>
        <Counter/>
        <Counter/>
        <Counter/>
      </div>
    )
  }
})


React.render(<App/>, document.body)
