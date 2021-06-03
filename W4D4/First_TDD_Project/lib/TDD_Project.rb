def my_unique(arr)
    answer = []
    arr.each do |ele|
        answer << ele if arr.count(ele) == 1
    end
    answer
end

def two_sum(arr)
    answer = []
    (0...arr.length - 1).each do |i|
        (i + 1...arr.length).each do |y|
            answer << [i, y] if (arr[i] + arr[y] == 0)
        end
    end
    answer
end

def my_transpose(arr)
    answer = []
    (0...arr[0].length).each do |i|
        temp = []
        (0...arr.length).each do |y|
            temp << arr[y][i]
        end
        answer << temp
    end
    answer
end

def pick_stocks(arr)
    answer = []
    profit = 0
    (0...arr.length - 1).each do |i|
        next if arr[i] > arr[i + 1]
        (i + 1...arr.length).each do |y|
            if (arr[y] - arr[i]) > profit
                profit = arr[y] - arr[i]
                answer = [arr[i], arr[y]]
            end
        end
    end
    answer
end