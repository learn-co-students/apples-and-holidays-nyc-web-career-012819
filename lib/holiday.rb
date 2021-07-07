require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].collect do |key, value|
    value << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name]= supply_array

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # holiday_hash.collect do |key, value|
  #   new_key = key.to_s.capitalize!
  #   arr = []
  #   c = ""
  #   d = ""
  #   value.collect do |a, b|
  #     arr = (a.to_s.split("_")).collect {|x| x.capitalize!}
  #     c = arr.join(" ")
  #     d = b.join(", ")
  #     #puts " #{c}: #{d}"
  #   end
  #   puts "#{new_key}:"
  #   puts " #{c}: #{d}"
  # end
  holiday_hash.each do |season, holidays|
    puts season.to_s.capitalize!+":"
    holidays.each do |holiday_name, items|
      puts "  " + holiday_name.to_s.split("_").map {|holiday| holiday.capitalize!}.join(" ")+": " + items.join(", ")
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  arr = []
  holiday_hash.collect {|seasons, holidays|
    holidays.collect { |holiday_name, items|
       items.collect {|item| arr << holiday_name if item == "BBQ"}}}
       arr
end
