require_relative "./Piece.rb"

class Rook < Piece

    DIR = "horizontal"

    attr_reader :pos

    include Slideable

    
    def symbol
        "R"
    end

end