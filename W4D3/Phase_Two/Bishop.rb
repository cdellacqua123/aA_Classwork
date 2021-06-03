require_relative "./Piece.rb"

class Bishop < Piece
    
    DIR = "diagonal"
    
    include Slideable

    attr_reader :pos

    
    def symbol
        "B"
    end
end

