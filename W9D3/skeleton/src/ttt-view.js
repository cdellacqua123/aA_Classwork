class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard();
    this.handleClick = this.handleClick.bind(this);
    this.bindEvents();
  }

  setupBoard() {
    const ul = document.createElement("ul")

    for (let rowIdx = 0 ; rowIdx < 3 ; rowIdx++){
      for(let colIdx = 0 ; colIdx < 3 ; colIdx++){
        const li = document.createElement("li");
        li.dataset.pos = JSON.stringify([rowIdx,colIdx]);
        ul.append(li);
      }
    }
    this.el.append(ul);
  }
  
  bindEvents() {
    this.el.addEventListener("click", this.handleClick);
  }

  handleClick(e) {
    const el = e.target;
    if (el.nodeName === 'LI') {
      this.makeMove(el);
    }
  }

  makeMove(square) {
    const pos = JSON.parse(square.dataset.pos);
    const currentPlayer = this.game.currentPlayer;
    try {
      this.game.playMove(pos)
    } catch (e) {
      alert("This" + e.msg.toLowerCase())
    }
    square.classList.add(currentPlayer);

    if (this.game.isOver()) this.handleGameOver();
  }
  
}

module.exports = View;
