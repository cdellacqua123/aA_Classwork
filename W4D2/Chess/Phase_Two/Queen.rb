require_relative "./Piece.rb"

class Queen < Piece

    attr_reader :dir, :pos

    include Slideable

    def initialize(color, board, pos, dir = "both")
        super(color, board, pos, dir)
        @dir = dir
    end
    
    def symbol
        "Q"
    end

    def move_dirs
        self.moves(@dir,pos)
    end
end