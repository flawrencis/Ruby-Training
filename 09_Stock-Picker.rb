#def stock_picker(price_array)
#    profit_array=Array.new
#    price_array.each do |buy_day| 
#        price_array.each do |sell_day|
#            profit_value=sell_day-buy_day
##            profit_array << profit_value
##            end
##        end
#        profit_array[(price_array.index buy_day).to_s] = profit_value 
#        end
#    end
#end

##No bugs, but it returns values where you sell on a day before you buy.
#def stock_picker(price_array_buying)
#    price_array_buying=Array.new([17,3,6,9,15,8,6,1,10])
#    profit_array=Array.new
#    profit_hash = Hash.new
#    price_array_selling=Array.new(price_array_buying)
#    price_array_buying.each_with_index do |buy_value, buy_index|
#        price_array_selling.each_with_index do |sell_value,sell_index|
#            day_combo_array = Array.new
#            day_combo_array[0]=buy_index
#            day_combo_array[1]=sell_index
#            
#            profit_value=sell_value-buy_value
##            profit_array << day_combo_array profit_value
##            Would be so much easier with a hash
#            profit_hash[day_combo_array]=profit_value
#            end
#        end
#    sorted_profit_array = Array.new(profit_hash.sort_by {|_key,value| value})
#    puts (sorted_profit_array[-1])[0]
#    end

def stock_picker(price_array_buying)
#    price_array_buying=Array.new([17,3,6,9,15,8,6,1,10])
    profit_array=Array.new
    profit_hash = Hash.new
    price_array_selling=Array.new(price_array_buying)
    price_array_buying.each_with_index do |buy_value, buy_index|
        price_array_selling.each_with_index do |sell_value,sell_index| 
            unless sell_index < buy_index
                day_combo_array = Array.new
                day_combo_array[0]=buy_index
                day_combo_array[1]=sell_index
                profit_value=sell_value-buy_value
                profit_hash[day_combo_array]=profit_value
                end
            end
        end
    sorted_profit_array = Array.new(profit_hash.sort_by {|_key,value| value})
    return (sorted_profit_array[-1])[0]
    end