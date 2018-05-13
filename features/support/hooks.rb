require 'watir'
require 'data_magic'
include DataMagic

Before do |scenario|

  puts "Running: #{scenario.name}" + ", " + "Scenario started at: " + fngetcurrenttimestamp
  # DataMagic.load_for_scenario(scenario)
  @datafolder = "qa"
  @browser = Watir::Browser.new :firefox
  @browser.window.maximize
  @browser.goto'http://adactin.com/HotelApp/'
end


After do |scenario|
  if scenario.failed?
    saveScreenShot
    puts "Scenario failed"
    @browser.close
    @browser.alert.ok if @browser.alert.present?
    end
  hrp_customer_logout
  @browser.close
end