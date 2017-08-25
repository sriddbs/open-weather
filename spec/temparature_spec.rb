require_relative "../lib/temparature.rb"

RSpec.describe "temparature" do
  context "kelvin to celsius" do
    it "converts a given temparature from kelvin to celsius" do
      temp_in_celsius = Temparature.in_celsius("kelvin", 293)
      expect(temp_in_celsius).to eq("20C")
    end
  end
end
