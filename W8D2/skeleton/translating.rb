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



