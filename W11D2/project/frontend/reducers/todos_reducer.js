import { RECEIVE_TODO, RECEIVE_TODOS } from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (oldState = initialState, action) => {
  Object.freeze(oldState); // protects prev state
  const nextState = Object.assign({}, oldState); // creates a new object to be returned

  switch (action.type) {
    case RECEIVE_TODOS:
    // return the todos from the action
      for (let i = 0; i < action.todo.length; i++){
        nextState[action.todo[i].id] = action.todo[i];
      }
      return nextState;
    case RECEIVE_TODO:
    // Make a new object setting a single key value pair for action.todo
    // Return a new state object by merging your previous state and your
    // new object
      nextState[action.todo.id] = action.todo;
      return nextState;
    default:
      return oldState;
  }
};

export default todosReducer;