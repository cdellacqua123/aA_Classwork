require_relative "./Piece.rb"

class Bishop < Piece

    attr_reader :dir, :pos

    include Slideable

    def initialize(color, board, pos, dir = "diagonal")
        super(color, board, pos, dir)
        @dir = dir
    end
    
    def symbol
        "B"
    end

    def move_dirs
        self.moves(@dir,pos)
    end
end

