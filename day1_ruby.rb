arr1 = []
arr2 = []

while (line=gets&.strip) && !line.empty?
  a, b = line.split.map(&:to_i)
  arr1 << a 
  arr2 << b
end

sorted_array_1 = arr1.sort()
sorted_array_2 = arr2.sort()

puts "Sorted Array 1: #{sorted_array_1.inspect()}"
puts "Sorted Array 2: #{sorted_array_2.inspect()}"

sum_of_distance = 0
size_of_array = sorted_array_1.length

size_of_array.times do |index|
  sum_of_distance += (sorted_array_1[index]-sorted_array_2[index]).abs  
end

puts "Sum of Distance: #{sum_of_distance}"

#-----Part Two-----#
similarity_score = 0
size_of_array.times do |i|
  occurance = 0 
  current_value = sorted_array_1[i]
  size_of_array.times do |j|
    if current_value == sorted_array_2[j]
      occurance+=1
    end
  end
  similarity_score += (current_value*occurance)
end

puts "Similarity Score is #{similarity_score}"