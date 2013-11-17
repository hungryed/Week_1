class Register

  def check_input(input)
    pattern = /\A\$?\d+(\.\d{1,2})?\z/
    
    if input !~ pattern
      puts "WARNING: Invalid currency detected!"
      return 0 
    end
  end

  def transform(input)
    input.gsub(/\$/, "").to_f
  end

  def question(input_string)
    puts "What is the amount #{input_string}"
    output = gets.chomp
    output
  end

  def amounts_due
    item = []
    while true
      output = question("due")
      break if output == "" || output == "done"
      check_input(output)
      transform(output)
      item << output.to_f
      subtotal = item.inject(:+)
      puts "Subtotal: $#{sprintf( "%0.02f", subtotal)}"
    end
    subtotal
  end

  def amounts_tendered
    output = question("tendered")
    check_input(output)
    transform(output)
  end

  def format_money(amount)
    sprintf("%0.02f", amount)
  end

end

james = Register.new
amount_due = james.amounts_due
amount_tendered = james.amounts_tendered
difference = amount_tendered - amount_due
puts difference >= 0 ? "    ===Thank You!=== \n
  The total change due is $#{james.format_money(difference)} \n \n 
  #{Time.now.strftime("%m/%d/%Y   %l:%M")}\n
  ================" :  
  "WARNING: Customer still owes $#{james.format_money(difference.abs)}! Exiting.."


