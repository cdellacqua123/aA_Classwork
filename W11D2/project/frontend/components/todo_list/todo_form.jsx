import React from 'react';
import { allTodos } from '../../reducers/selectors';
const test = (allTodos.length);
// console.log(allTodos());
// const testing = allTodos();
// console.log(testing)
// const test = allTodos();

class TodoForm extends React.Component{
    
    constructor(props) {
        super(props);
        console.log(todos)
        
        
    }
    
    render() { 
        return(<h1>{todos}</h1>)
    }
}

export default TodoForm;