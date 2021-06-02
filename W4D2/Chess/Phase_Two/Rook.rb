require_relative "./Piece.rb"

class Rook < Piece

    attr_reader :dir, :pos

    include Slideable

    def initialize(color, board, pos, dir = "horizontal")
        super(color, board, pos, dir)
        @dir = dir
    end
    
    def symbol
        "R"
    end

    def move_dirs
        self.moves(@dir,pos)
    end
end