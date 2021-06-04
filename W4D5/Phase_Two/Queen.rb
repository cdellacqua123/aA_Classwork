require_relative "./Piece.rb"

class Queen < Piece

    DIR = "both"

    attr_reader :pos

    include Slideable

    
    def symbol
        "Q"
    end

end