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
  
  holiday_hash.each do |season, data|
    data.each do |holiday, array|
      if holiday == :fourth_of_july
        return array[1]
      end
    end
  end
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash.each do |season, data|
    data.each do |holiday, array|
      if holiday == :christmas || holiday == :new_years
        array.push(supply)
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

  holiday_hash.each do |season, data|
    data.each do |holiday, array|
      if holiday == :memorial_day
        array.push(supply)
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash.each do |current_season, data|
    if current_season == season
      data[holiday_name] = supply_array
    end
  end
  
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season

  output = []

  holiday_hash.each do |season, data|
    if season == :winter
      data.each do |holiday, array|
        output.push(array)
      end
    end
  end
  
  output.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season, data|
    season_string = season.to_s.capitalize
    puts "#{season_string}:"
    
    data.each do |holiday, array|
      holiday_strings = holiday.to_s.split("_")
      
      for word in holiday_strings do
        word.capitalize!
      end
      
      puts "  #{holiday_strings.join(" ")}: #{array.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  output = []

  holiday_hash.each do |season, data|
    data.each do |holiday, array|
      if array.include? "BBQ"
        output.push(holiday)
      end
    end
  end
  
  output
end







