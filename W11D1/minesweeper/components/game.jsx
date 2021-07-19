import React from 'react';

class Game extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            board: new Minesweeper.Board
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
