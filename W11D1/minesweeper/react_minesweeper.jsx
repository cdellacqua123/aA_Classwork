import Board from "./components/board"
import Game from "./components/game"
import Tile from "./components/tile"

import React from "react";
import ReactDOM from "react-dom";

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<Game />, document.getElementById("main"))
})