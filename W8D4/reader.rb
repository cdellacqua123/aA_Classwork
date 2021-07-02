def bubble_sort(arr)
  answer = arr.dup
  i = 0
  while i < arr.length - 1
    if answer[i] > answer[i+1]
      answer[i], answer[i+1] = answer[i+1], answer[i]
      i = 0
    else
      i += 1
    end
  end
  answer
end

p(bubble_sort([9, 0, 15, 2, 13]))


def bub_sort(arr)
  sorted = false
  until sorted
    sorted = true
    (0...arr.length).each do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorted = false
      end
    end
  end
  arr
end
