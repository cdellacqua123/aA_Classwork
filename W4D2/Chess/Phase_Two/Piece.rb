class Piece

    attr_reader :color, :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos 
    end

    def to_s
        @color.to_s
    end

    def moves
        avail_moves = []
    end

    def pos=(val)
        @pos = val
    end
end

# Slideable Module
# Stepable Module
#  Each checks type of "self" & says where each "self" can move
# Each piece