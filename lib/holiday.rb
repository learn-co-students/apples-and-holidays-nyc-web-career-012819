require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  {
    :winter => {
      :christmas => ["Lights", "Wreath"],
      :new_years => ["Party Hats"]
    },
    :summer => {
      :fourth_of_july => ["Fireworks", "BBQ"]
    },
    :fall => {
      :thanksgiving => ["Turkey"]
    },
    :spring => {
      :memorial_day => ["BBQ"]
    }
  }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |key, value|
    if(key == :winter)
      value.each do |holiday, supplies|
        supplies << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
    holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  arr = holiday_hash[:winter].values.flatten
  winter_array = arr.flatten
  winter_array
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |key, value|
    capitalize_season = key.to_s.split(" ")
    for word in capitalize_season
      word.capitalize!
    end
    puts capitalize_season.join + ":"

    value.each do |holiday, supplies|
      capitalize_holiday = holiday.to_s.split("_")
      for word in capitalize_holiday
        word.capitalize!
      end
      puts "  " + capitalize_holiday.join(" ") +": " + supplies.join(", ")
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  includes_bbq = []
  holiday_hash.each do |key, value|
    value.each do |holiday, supplies|
      supplies.each do |i|
        if (i == "BBQ")
          includes_bbq << holiday
        end
      end
    end
  end
  includes_bbq
end
