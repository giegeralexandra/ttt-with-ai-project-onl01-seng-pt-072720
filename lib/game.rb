class Game 

    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1 
        @player_2 = player_2
        @board = board 
    end

    def play 
        while !over?
            turn
        end
        if won?
            puts "Congratulations #{self.winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

    def turn
        user_input = current_player.move(board)
        if !board.valid_move?(user_input) 
            turn
        else
            board.update(user_input, current_player)
        end 
    end

    def current_player
        if @board.turn_count.odd?
            @player_2
        else 
            @player_1
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board.taken?(combo[0]+1) && (@board.cells[combo[0]] == @board.cells[combo[1]]) && (@board.cells[combo[1]] == @board.cells[combo[2]])  
        end
    end

    def winner
        if won?
            board.cells[won?.last]
        end  
    end

    def over?
        won? || draw?
    end

    def draw?
        @board.full? && !won?
    end


end
