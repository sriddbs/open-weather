module Temparature
  def self.in_celsius from_unit, value
    if from_unit == "kelvin"
      (value - 273.15).ceil.to_s + "C"
    end
  end
end
