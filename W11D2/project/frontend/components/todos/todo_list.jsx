import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

const TodoList = (props) => {
  const todos = props.todos;
  return (
    <div>
      <h3>All the Todos</h3>
      <ul>
        {todos.map(todo => TodoListItem(todo))}
      </ul>
      <TodoForm todos = {todos}/>
    </div>
  )
}


export default TodoList;