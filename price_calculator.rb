require_relative 'helpers.rb'

# storing the prices in a hash makes it easy to update them.
# to avoid floating point errors, prices should be stored as 
# integers and then converted to USD when presented to the user
unit_prices = {
    milk:   397,
    bread:  217,
    banana: 99,
    apple:  89
}

# same logic.  storing the sales details here makes it easy to
# update
sales = {
    milk:   { quantity: 2, price: 500 },
    bread:  { quantity: 3, price: 600 },
    banana: { quantity: 0, price: 0   },
    apple:  { quantity: 0, price: 0   }
}

puts "Please enter all the items purchased separated by a comma"

# remove all whitespaces from the inputted line, lowercase everything,
# split it by commas, and then transform each string into a symbol.
# converting to a symbol saves memory and allows for easier searching
input = gets.gsub(/\s+/, "").downcase.split(",").map { |e| e.to_sym  } 

items = Hash.new(0) 

# calculate the quantity of each item in the order
input.each do |item|
    items[item] += 1    
end

# iterate through each item in the order and calculate the total price
# for the item.  #calculate_total_price_for_item will do all the calculation
# for the item given the sales and price details defined above
total_price = items.reduce(0) do |sum, (item, quantity)| 
    sum +=calculate_total_price_for_item(item, quantity, sales, unit_prices)
end

puts "Total price : #{total_price / 100.0}"

