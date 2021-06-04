require "byebug"
module Slideable

    HORIZONTAL_DIRS = []
    DIAGONAL_DIRS = []

    def moves
        # dir = DIR
        # debugger
        pos = self.pos

        if self.class::DIR == "both" 
            answer = []
            answer += move_dir("horizontal",pos)
            answer += move_dir("diagonal",pos)
            answer.uniq
        else
            move_dir(self.class::DIR, pos)
        end
    end

    def hoirzontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def move_dir(dir, pos)
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

module Stepable
    AVAIL_POS = []

    def moves
        pos = self.pos
        row, col = pos 
        if self.class::DIR == "king"   
            AVAIL_POS << [row + 1, col] if @board[[row + 1, col]] == nil
            AVAIL_POS << [row - 1, col] if @board[[row - 1, col]] == nil
            AVAIL_POS << [row, col + 1] if @board[[row, col + 1]] == nil
            AVAIL_POS << [row, col - 1] if @board[[row, col - 1]] == nil
            AVAIL_POS << [row + 1, col + 1] if @board[[row + 1, col + 1]] == nil
            AVAIL_POS << [row + 1, col - 1] if @board[[row + 1, col - 1]] == nil
            AVAIL_POS << [row - 1, col - 1] if @board[[row - 1, col - 1]] == nil
            AVAIL_POS << [row + 1, col + 1] if @board[[row + 1, col + 1]] == nil
        elsif self.class::DIR == "knight"
            AVAIL_POS << [row + 2, col - 1] if @board[[row + 2, col - 1]] == nil
            AVAIL_POS << [row + 2, col + 1] if @board[[row + 2, col + 1]] == nil
            AVAIL_POS << [row - 2, col + 1] if @board[[row - 2, col + 1]] == nil
            AVAIL_POS << [row - 2, col - 1] if @board[[row - 2, col - 1]] == nil
            AVAIL_POS << [row + 1, col + 2] if @board[[row + 1, col + 2]] == nil
            AVAIL_POS << [row + 1, col - 2] if @board[[row + 1, col - 2]] == nil
            AVAIL_POS << [row - 1, col + 2] if @board[[row - 1, col + 2]] == nil
            AVAIL_POS << [row - 1, col - 2] if @board[[row - 1, col - 2]] == nil
        end
        AVAIL_POS
    end
end


class Piece

    attr_reader :color, :pos, :board

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        @board[pos] = self.symbol
    end

    def to_s
        @color.to_s
    end

    # def moves
    #     moves(self.dir, self.pos)
    # end

    def symbol
        "*"
    end
    def pos=(val)
        @pos = val
    end

end

