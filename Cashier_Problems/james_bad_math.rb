class Register

  def check_input(input)
    puts "WARNING: Invalid currency detected! Exiting..." if input !~ /\A\$?\d+(\.\d{1,2})?\z/
    exit if input !~ /\A\$?\d+(\.\d{1,2})?\z/
  end

  def transform(input)
    input.gsub(/\$/, "").to_f
  end

  def amounts(desired_word)
    puts "What is the amount #{desired_word}?"
    output = gets.chomp
    check_input(output)
    transform(output)
  end

end

james = Register.new
amount_due = james.amounts("due")
amount_tendered = james.amounts("tendered")
difference = amount_tendered - amount_due
puts difference >= 0 ? "    ===Thank You!=== \n
  The total change due is $#{sprintf( "%0.02f", difference)} \n \n 
  #{Time.now.strftime("%m/%d/%Y   %l:%M")}\n
  ================" :  "WARNING: Customer still owes $#{sprintf( "%0.02f", difference.abs)}! Exiting.."


