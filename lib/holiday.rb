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
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each {|holiday, decorations|
    decorations << supply
  }
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each {|season, holiday| puts "#{season.capitalize}:"
    holiday.each {|holiday, supply|
      puts "  #{holiday.to_s.split("_").map {|w| w.capitalize}.join(" ")}: #{supply.join(", ")}"
    }
  }
end

def all_holidays_with_bbq(holiday_hash)
  bbq_holiday = []
  holiday_hash.each {|season, holiday|
    holiday.each {|holiday, supply|
      if supply.include?("BBQ")
        bbq_holiday << holiday
      end
    }
  }
  bbq_holiday
end
