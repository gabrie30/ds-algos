def merge_sort(arr)

  return arr if arr.length <= 1

  mid = arr.length/2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])

  merge(left, right)
end

def merge(left, right)
  answer = []
  until left.empty? || right.empty?
    if left.first > right.first
      answer << right.shift
    else
      answer << left.shift
    end
  end
    
  answer + left + right
end