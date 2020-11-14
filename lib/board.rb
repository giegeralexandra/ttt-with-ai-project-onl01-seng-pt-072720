class Board
    
    attr_accessor :cells 

    def initialize
        reset!
    end

    def reset! 
        @cells = [" "," "," "," "," "," "," "," "," "] 
    end

    def display 
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} " 
        puts " ------------------------------------------ "
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} " 
        puts " ------------------------------------------ "
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} " 
    end

    def position(user_input)
        @cells[(user_input.to_i)-1]
    end

    def update(user_input, player)
        valid_move?(user_input) 
        @cells[(user_input.to_i-1)] = player.token 
    end

    def full?
        if @cells.find{|cell| cell == " "} == nil
            true 
        else 
            false 
        end
    end

    def turn_count
        cell_count = []
        @cells.each do |cell| 
            if cell == "X" || cell == "O"
                cell_count << cell 
            end 
        end 
        cell_count.length 
    end

    def taken?(user_input)
        self.position(user_input) != " "
    end 

    def valid_move?(user_input)
        (self.taken?(user_input) == false) && (user_input.to_i >= 1) && (user_input.to_i <= 9)
    end

end
