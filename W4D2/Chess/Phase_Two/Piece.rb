module Slideable

    HORIZONTAL_DIRS = []
    DIAGONAL_DIRS = []

    def moves(dir,pos)
        if dir == "both" 
            answer = []
            answer += move_dirs("horizontal",pos)
            answer += move_dirs("diagonal",pos)
            answer.uniq
        else
            move_dirs(dir,pos)
        end
    end

    def hoirzontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def move_dirs(dir,pos)
        if dir == "horizontal"
            row, col = pos
            i = row - 1
            while i >= 0
                if @board[[i,col]] == nil
                    HORIZONTAL_DIRS << [i,col]
                    i -= 1
                else 
                    break
                end
            end

            i = row + 1
            while i < @board.length
                if @board[[i,col]] == nil
                    HORIZONTAL_DIRS << [i,col]
                    i += 1
                else 
                    break
                end
            end

            i = col + 1
            while i < @board.length
                if @board[[row,i]] == nil
                    HORIZONTAL_DIRS << [row,i]
                    i += 1
                else 
                    break
                end
            end

            i = col - 1
            while i >= 0
                if @board[[row,i]] == nil
                    HORIZONTAL_DIRS << [row,i]
                    i -= 1
                else 
                    break
                end
            end

        elsif dir == "diagonal"

            row, col = pos
            i = row - 1
            y = col - 1
            while i >= 0 && y >= 0
                if @board[[i,y]] == nil
                    DIAGONAL_DIRS << [i,y]
                    i -= 1
                    y -= 1
                else 
                    break
                end
            end

            i = row + 1
            y = col - 1
            while i < @board.length && y >= 0
                if @board[[i,y]] == nil
                    DIAGONAL_DIRS << [i,y]
                    i += 1
                    y -= 1
                else 
                    break
                end
            end

            i = row - 1
            y = col + 1
            while y < @board.length && i >= 0
                if @board[[i,y]] == nil
                    DIAGONAL_DIRS << [i,y]
                    i -= 1
                    y += 1
                else 
                    break
                end
            end

            i = row + 1
            y = col + 1
            while y < @board.length && i < @board.length
                if @board[[i,y]] == nil
                    DIAGONAL_DIRS << [i,y]
                    i += 1
                    y += 1
                else 
                    break
                end
            end
        end
        return DIAGONAL_DIRS if dir == "diagonal"
        return HORIZONTAL_DIRS if dir == "horizontal"
    end
end

# module Stepable


# end


class Piece

    include Slideable
    attr_reader :color, :pos, :board, :dir

    def initialize(color, board, pos,dir)
        @color = color
        @board = board
        @pos = pos 
        @dir = dir
    end

    def to_s
        @color.to_s
    end

    # def moves
    #     avail_moves = []
    # end

    def pos=(val)
        @pos = val
    end

end

# Slideable Module
# Stepable Module
#  Each checks type of "self" & says where each "self" can move
# Each piece