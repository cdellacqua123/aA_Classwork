require_relative "./Piece.rb"

class Knight < Piece

    DIR = "knight"

    attr_reader :pos

    include Stepable
    
    def symbol
        "H"
    end
    
end