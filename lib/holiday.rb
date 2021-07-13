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
  winter_holidays = holiday_hash[:winter]
  winter_holidays.each do |holiday, supplies|
    supplies << supply
  end
  holiday_hash
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    puts sym_to_s(season)
    all_supplies_in_season(holidays)
  end
end

def sym_to_s(symbol)
  array = symbol.to_s.split("_")
  array.each.with_index do |word, index|
    array[index] = "#{word[0].upcase}#{word[1..-1]}"
  end
  "#{array.join(" ")}:"
end

def all_supplies_in_season(holidays)
  holidays.each do |holiday, supplies|
    puts "  #{sym_to_s(holiday)} #{supplies.join(", ")}"
  end
end

def all_holidays_with_bbq(holiday_hash)
  result = []
  holiday_hash.each do |season, holidays|
    result = add_season_holidays_with_bbq(result, holidays)
  end
  result
end

def add_season_holidays_with_bbq(result, holidays)
  holidays.each do |holiday, supplies|
    result << holiday if supplies.include?("BBQ")
  end
  result
end





