require 'rspec'
require 'page-object'
require 'data_magic'
require 'cucumber'
require 'watir'
require 'rubygems'
require 'date'
require 'selenium-webdriver'
require_relative 'credentials'
include Access

World(PageObject::PageFactory)

# Grid Setup

def browser_name
#  (ENV['BROWSER'] ||= 'chrome').downcase.to_sym
  (ENV['BROWSER'] ||= 'IE').downcase.to_sym
end

def environment
  (ENV['ENVI'] ||= 'int').downcase.to_sym
end

def saveScreenShot
  encoded_img = @browser.driver.screenshot_as(:base64)
  embed("data:image/png;base64,#{encoded_img}",'image/png')
end

def fngetcurrenttimestamp
  time = Time.new
  return time.inspect
end