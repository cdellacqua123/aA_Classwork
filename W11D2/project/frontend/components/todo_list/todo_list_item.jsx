import React from 'react';

const TodoListItem = (todo) => {
    return (
        <li key={todo.id}>
            Title: {todo.title}
            <br />
            Body: {todo.body}
            <br />
            Done? {todo.done ? '✅' : '❌'}
        </li>
    )
}

export default TodoListItem;