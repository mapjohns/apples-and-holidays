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
  holiday_hash.each do |season, holiday|
    holiday.each do |hol ,day|
      if hol == :fourth_of_july
        return day[1]
      end
    end
  end

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holiday|
    holiday.each do |hol ,day|
      if hol == :christmas || hol == :new_years
        day << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday|
    holiday.each do |hol ,day|
      if hol == :memorial_day 
        day << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  if holiday_hash.include?(season)
    testvar = holiday_hash[season][holiday_name] = []
    supply_array.each do |supply|
      testvar << supply
    end
  end
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |hol, day|
        day.each do |supply|
          winter_supplies << supply
        end
      end
    end
  end
  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  # all_supplies = []
  holiday_hash.each do |season, holiday|
    puts "#{season.to_s.capitalize}:"
    holiday.each do |hol, day|
      if hol.to_s.include?("_")
        new_array = hol.to_s.split("_")
        counter = 0
        new_array.each do |word|
          new_array[counter] = word.capitalize
          counter += 1
        end
        new_word = new_array.join(" ")
        puts "  #{new_word}: #{day.join(", ")}"

      else
        puts "  #{hol.to_s.capitalize}: #{day.join(", ")}"
      end
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_array = []
  holiday_hash.each do |season, holiday|
    holiday.each do |hol, day|
      if day.include?("BBQ")
        bbq_array << hol
      end
    end
  end
  bbq_array
end







