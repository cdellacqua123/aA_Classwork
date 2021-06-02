require_relative "./Piece.rb"

class Knight < Piece
    DIR = "knight"
    attr_reader :dir, :pos

    include Stepable
    
    def symbol
        "H"
    end

    def move_dirs
        self.moves(DIR,pos)
    end
    
end