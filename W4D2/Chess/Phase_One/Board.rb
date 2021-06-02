class Board

    attr_reader :board

    def initialize
        @board = Array.new(8){Array.new(8)}
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos,val)
        row, col = pos
        @board[row][col] = val
    end

    def move_piece(color,start_pos,end_pos)
        start_rows, start_cols = start_pos
        end_rows, end_cols = end_pos
        raise "no piece at start" if @board[start_rows][start_cols] == nil
        raise "invalid position" if end_rows > @board.length || end_cols > @board.length
        raise "invalid position" if end_rows < 0 || end_cols < 0
        @board[start_rows][start_cols], @board[end_rows][end_cols] = nil, @board[start_rows][start_cols]
    end

end