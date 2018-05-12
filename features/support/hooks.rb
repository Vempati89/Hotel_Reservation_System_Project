require 'watir'

Before do |scenario|
  # DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :firefox
  @browser.window.maximize
  @browser.goto'http://adactin.com/HotelApp/'
end


After do
  @browser.close
end