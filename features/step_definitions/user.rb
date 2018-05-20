Given(/^User enters data from (.*)$/) do |datafile|
  envvariable = "#{@datafolder}/#{datafile}.yml"
  DataMagic.load(envvariable)
  hrp_customer_login
end

When(/^User logs into application$/) do
  visit(Hrp_home)
  saveScreenShot
end

And(/^User selects (.*)$/) do |buildtype|
  on(Hrp_login).send("#{buildtype}")
  saveScreenShot
end

And(/^User is on booking confirmation page$/) do
  on(Hrp_selecthotel).select_hotel_select
  saveScreenShot
  on(Hrp_selecthotel).continue
end

And(/^User clicks booked itinerary$/) do
  on(Hrp_selecthotel).booking
  saveScreenShot

end

And(/^user searches with order id$/) do
  on(Hrp_itinerary).order_id= $order
  saveScreenShot
  on(Hrp_itinerary).go
end

And(/^User completes cancellation$/) do
  valid_button = data_for(:Hrp_options).values
  on(Hrp_itinerary).check_cancel_box
  saveScreenShot
  on(Hrp_itinerary).select_buttons(valid_button[0])
  sleep(5)
  @browser.alert.ok if @browser.alert.present?
  sleep (5)
end