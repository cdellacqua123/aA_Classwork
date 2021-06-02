require_relative "./Piece.rb"

class Bishop < Piece

    include Slideable

    def initialize(color, board, pos, dir = "diagonal")
        super(color, board, pos, dir)
    end
    
    def symbol
        "B"
    end

    def move_dirs
        moves
    end
end

