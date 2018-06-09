require 'watir'
require 'data_magic'
include DataMagic

Before do |scenario|

  puts "Running: #{scenario.name}" + ", " + "Scenario started at: " + fngetcurrenttimestamp

  case ENV['URL']
    when "QA"
      @datafolder = "qa"
      @website = 'http://adactin.com/HotelAppBuild2/'
    when "DEV"
      @datafolder = "dev"
      @website = 'http://adactin.com/HotelApp/'
    else
      @datafolder = "qa"
      @website = 'http://adactin.com/HotelAppBuild2/'
    end

  case ENV['GRID']

    when "SAM"
      capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(
          unexpectedAlertBehaviour: 'accept',
          native_events: false
      )
      @browser = Watir::Browser.new(:remote, :url=>"http://192.168.0.16:4444/wd/hub", :desired_capabilities=> capabilities)
      @browser.goto @website
      @browser.window.maximize

     when "ARJUN"

      capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
          unexpectedAlertBehaviour: 'accept',
          native_events: false
      )

      @browser = Watir::Browser.new(:remote,:url=>"http://localhost:4444/wd/hub", :desired_capabilities=> capabilities)
      @browser.window.maximize

    else
      capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
          unexpectedAlertBehaviour: 'accept',
          native_events: false
      )

      @browser = Watir::Browser.start @website,  :chrome, :desired_capabilities=> capabilities
      @browser.window.maximize
  end

  # DataMagic.load_for_scenario(scenario)
  # @datafolder = "qa"
  # @browser = Watir::Browser.new :firefox
  # @browser.window.maximize
  # @browser.goto'http://adactin.com/HotelApp/'
end


AfterStep do
  encoded_img = @browser.driver.screenshot_as(:base64)
  embed("data:image/png;base64,#{encoded_img}",'image/png')
end

After do |scenario|
  if scenario.failed?
    saveScreenShot
    puts "Scenario failed"
    @browser.close
    @browser.alert.ok if @browser.alert.present?
    end
  hrp_customer_logout
  saveScreenShot
  @browser.close
end
