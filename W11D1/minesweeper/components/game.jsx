import React from 'react';
import * as Minesweeper from "../minesweeper"
import Board from "./board"

class Game extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            board: new Minesweeper.Board(10, 15)
        };
    };

    updateGame(){

    };

    render(){
        return (
            <div>
                <Board board={this.state.board} updateGame={this.updateGame}/>
            </div>
        );
    }
};

export default Game;