import React from 'react';
import { receiveTodo, receiveTodos } from '../../actions/todo_actions';
// const test = receiveTodo;

class TodoForm extends React.Component{
    
    constructor(props) {
        super(props);
        this.state = {
            id: new Date().getTime(),
            body: '',
            title: '',
            done: false
        }
        this.handleSubmit = this.handleSubmit.bind(this);
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.updateDone = this.updateDone.bind(this);
    }

    updateBody(e) {
        this.setState({ body: e.target.value})
    }

    updateTitle(e) {
        this.setState({ title: e.target.value })
    }

    updateDone(e) {
        this.setState({ done: e.target.value })
    }

    handleSubmit(e) {
        debugger
        e.preventDefault();
        this.props.receiveTodo(this.state);

        this.setState({
            id: new Date().getTime(),
            body: '',
            title: '',
            done: false
        })
    }
    
    render() { 
        return(
        <form onSubmit={this.handleSubmit}>
        <h1>Add stuff to do</h1>

        <label>Title
            <input
                type='text' name='title' value={this.state.title}
                onChange={this.updateTitle} />
        </label>

        <label>Body
            <input 
            type='text' name='body' value={this.state.body} 
            onChange={this.updateBody}/>
        </label>

        <label>Done
            <input
                type='radio' id="true" name='done' value={true}
                onChange={this.updateDone} />
                <label>True</label>
            <input
                type='radio' id="false" name='done' value={false}
                onChange={this.updateDone} />
                    <label>False</label>
        </label>
        <input type='submit' value='Add Todo' />
        </form>)
    }
}

export default TodoForm;