def twoSum(arr)
    answer = []
    i = 0
    while i < (arr.length - 1)
        y = i + 1
        while y < arr.length
            if arr[i] + arr[y] == 0
                answer << [i, y]
                y += 1
            else
                y += 1
            end
        end
        i += 1
    end
    answer
end



def transpose(arr)
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

def myEach(arr,proc)
    (0...arr.length) do |i| 
        prc.call(arr[i])
    end
end