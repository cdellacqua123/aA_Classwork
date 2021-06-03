class Game

    attr_reader :stacks

    def initialize
        @stacks = [[3, 2, 1], [], []]
    end

    def move(choice_a, choice_b)
        from_choice = stacks[choice_a].pop
        stacks[choice_b] << from_choice
        stacks
    end

    def win?
        stacks.each do |substack|
            if substack.length == 3
                if (substack[0] > substack[1]) && (substack[1] > substack[2])
                    return true
                end
            end
        end
        false
    end

    def play
        check = false
        until check
            p stacks
            puts "Please enter a stack to pull from"
            choice_a = gets.chomp.to_i
            puts "Please enter a stack to move to"
            choice_b = gets.chomp.to_i
            move(choice_a, choice_b)
            check = win?
        end
        puts "You win!"
    end
end