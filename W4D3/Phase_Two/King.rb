require_relative "./Piece.rb"

class King < Piece

    DIR = "king"

    attr_reader :pos

    include Stepable
    
    def symbol
        "K"
    end
    
end