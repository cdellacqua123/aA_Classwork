import React from 'react';
import { allTodos } from '../../reducers/selectors';

const TodoList = (props) => {
  const todos = props.todos;
  
  return (
    <div>
      <h1>All the Todos</h1>
      <ul>
        {todos.map(todo => 
          <li key={todo.id}>
            Title: {todo.title}
            <br />
            Body: {todo.body}
            <br />
            Done? {todo.done ? '✅' : '❌'}
          </li>)}
      </ul>
    </div>
  )
}


export default TodoList;