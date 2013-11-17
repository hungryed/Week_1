user_guess = 0
winning_number = rand(1000)
while user_guess != winning_number
  print "Guess a number between 1 and 1000: " 
  user_guess = gets.chomp.to_i
  puts "Guess a number between 0 and 1000" if user_guess.between?(1, 1000)== false 
  puts "You win!" if user_guess == winning_number 
  puts "Too low guess again." if user_guess < winning_number 
  puts "Too high guess again." if user_guess > winning_number
end