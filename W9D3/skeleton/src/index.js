const View = require("./ttt-view.js")
const Game = require("../ttt_node/game.js")




document.addEventListener("DOMContentLoaded", () => {
  // Your code here
  const rootEl = document.querySelector('.ttt');
  board = new Game();
  new View(board, rootEl);
  
});