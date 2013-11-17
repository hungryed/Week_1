array = []
File.read('testgrades.txt').each_line do |x|
  array << x.to_i
end

p array.min
p array.max
p array.inject(:+) / array.length