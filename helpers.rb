def calculate_number_of_sales_bundles(item, quantity, sales)
	# division of integers will always return an integer,
	# so this gives us a quick way to find the number of sales
	# bundles in the order
    return quantity / sales.dig(item, :quantity)

    # if there are no sales for the given item, we want to
    # return 0 instead of throwing an error
    rescue ZeroDivisionError
        0
end

def calculate_number_of_units(item, quantity, sales)
	# similar to the logic above, the modulo gives us
	# the remainder, e.g. it gives us the leftover amount
	# that don't get the sales price
    return quantity % sales.dig(item, :quantity)
    
    # if there are no sales for the given item, 
    # then just return the quantity instead of throwing 
    # an error
    rescue ZeroDivisionError
        quantity
end

def calculate_total_price_for_item(item, quantity, sales, unit_prices)
    bundles = calculate_number_of_sales_bundles(item, quantity, sales)
    units = calculate_number_of_units(item, quantity, sales)

    total_sales_price = bundles * sales.dig(item, :price)
    total_units_price = units * unit_prices[item]

    total_price = total_sales_price + total_units_price
end