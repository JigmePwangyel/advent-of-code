def determine_order(arr)
  arr.each_cons(2) do |a, b|
    return b > a if a != b  
  end
  true  
end

def check_level_sequence(arr)
  return false if arr.size < 2  

  increasing_sequence = determine_order(arr)  

  arr.each_cons(2) do |a, b|
    diff = (a - b).abs
    return false if increasing_sequence && a > b  
    return false if !increasing_sequence && a < b 
    return false unless diff.between?(1, 3)       
  end

  true
end

def check_dampener_condition(arr)
  return false if arr.size < 3  

  arr.each_index do |index|
    modified_arr = arr.dup
    modified_arr.delete_at(index)  
    return true if check_level_sequence(modified_arr)  
  end

  false
end

count = 0
while line = gets
  arr = line.split.map(&:to_i)
  break if arr.empty? || arr.size < 2  

  sequence_condition = check_level_sequence(arr)
  dampener_condition = !sequence_condition && check_dampener_condition(arr)

  count += 1 if sequence_condition || dampener_condition
end

puts "The count of safe reports is #{count}"
