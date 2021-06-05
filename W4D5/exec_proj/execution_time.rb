#Phase 1

# def my_min(arr)
#     arr.each do |n|
#         return n if arr.none? {|i| n > i}
#     end
# end

# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])

#time complexity = O(n ^ 2)


#Phase 2 

# def my_min(arr)
#     min = arr.first 
#     (1...arr.length).each do |i|
#         if arr[i] < min 
#             min = arr[i]
#         end
#     end
#     min
# end
# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])

# #time complexity = O(n)


# def sub_sum(arr)
#     sum_arr = []
#     arr.each.with_index do |el, i|
#         sum_arr << [el]
#         arr.each.with_index do |el2, i2|
#             if i < i2
#                 sum_arr << (sum_arr[-1].dup << el2)
#             end
#         end
#     end
#     max = 0
#     sum_arr.each do |sub|
#         if sub.sum > max
#             max = sub.sum
#         end
#     end
#     max
# end

# time complexity = O(n ^ 2)



def sub_sum(arr)
    max = arr[0]
    current = arr[0]
    (1...arr.length).each do |i|
        if current < 0
            current = 0 
        end
        current += arr[i]
        if current > max
            max = current
        end
    end
    max
end

# Time complexity O(n)...hopefully

list = [2, 3, -6, 7, -6, 7]
p sub_sum(list)