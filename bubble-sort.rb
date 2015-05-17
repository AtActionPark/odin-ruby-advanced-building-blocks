def bubble_sort arr
	size = arr.size() -1
	while size > 0
		i = 0
		while i < size
			if arr[i] > arr[i+1]
				arr[i], arr[i+1] = arr[i+1], arr[i]
			end
			i+=1
		end
		size -=1
	end
	return arr
end

def bubble_sort_by arr
	size = arr.size() -1
	while size > 0
		i = 0
		while i < size
			if yield(arr[i], arr[i+1]) > 0
				arr[i], arr[i+1] = arr[i+1], arr[i]
			end
			i+=1
		end
		size -=1
	end
	return arr
end


puts bubble_sort([4,3,78,2,0,2])
puts ""
puts bubble_sort_by(["hi","hello","hey"]) {|right, left| right.length - left.length}