Then(/^Username is displayed on the screen$/) do
  username = data_for(:Hrp_username).values
  puts "#{on(Hrp_home).usrnme.inspect}"
  saveScreenShot
  expect(on(Hrp_home).usrnme). to eq username[0]
end


Then(/^System reports an error message for checkin$/) do
  messages = data_for(:Hrp_error).values
  puts "#{on(Hrp_home).checkin_msg.inspect}"
  saveScreenShot
  expect(on(Hrp_home).checkin_msg). to eq messages[0]

end

Then(/^System reports an error message for checkout$/) do
  message = data_for(:Hrp_error).values
  puts "#{on(Hrp_home).checkout_msg.inspect}"
  saveScreenShot
  expect(on(Hrp_home).checkout_msg). to eq message[0]
end

Then(/^(.*) is displayed in Select Hotel should be the same as selected in search hotel form$/) do |field|
  city = data_for(:Hrp_validation).values
  puts "#{on(Hrp_selecthotel).send("#{field}").inspect}"
  saveScreenShot
  expect(on(Hrp_selecthotel).send("#{field}")). to eq city[0]
end

Then(/^check in and check out dates are displayed in select Hotel page according to the dates selected in Search Hotel$/) do
  puts "#{on(Hrp_selecthotel).arrival_date.inspect}"
  puts "#{on(Hrp_selecthotel).departure_date.inspect}"
  saveScreenShot
  expect(on(Hrp_selecthotel).arrival_date). to eq "#{(Time.now).strftime("%d/%m/%Y")}"
  expect(on(Hrp_selecthotel).departure_date). to eq "#{(Time.now+(60*60*24*1)).strftime("%d/%m/%Y")}"
end

Then(/^total price is calculated as price per night and no of nights and no of rooms$/) do
  @room = on(Hrp_selecthotel).numrooms
  @price = on(Hrp_selecthotel).price_per_night
  @days = on(Hrp_selecthotel).number_of_days
  puts "#{on(Hrp_selecthotel).total_price.inspect}"
  @final_price = on(Hrp_selecthotel).final_price
  saveScreenShot
  puts "#{(@room*@price*@days)}"
  expect(on(Hrp_selecthotel).final_price).to eq (@room*@price*@days)

end

Then(/^Itinerary on confirmation page matches the data entered$/) do
booking = data_for(:Hrp_validations).values
  expect(on(Hrp_bookhotel).name_hotel).to eq booking[0]
  expect(on(Hrp_bookhotel).location_hotel).to eq booking[1]
  expect(on(Hrp_bookhotel).room_type).to eq booking[2]
  expect(on(Hrp_bookhotel).total_days).to eq booking[-2]
  expect(on(Hrp_bookhotel).night_price).to eq booking[-1]

end

Then(/^final billed price is sum of total price and tax$/) do
  @tax = on(Hrp_bookhotel).tax
  @total = on(Hrp_bookhotel).total_price
  puts "#{on(Hrp_bookhotel).final_bill.inspect}"
 expect(on(Hrp_bookhotel).bill).to eq (@tax + @total)
end

Then(/^Order number is generated$/) do
  saveScreenShot
  $price = on(Hrp_confirmation).ppn
  $final_Price = on(Hrp_confirmation).final_price
  puts "#{on(Hrp_confirmation).order_no.inspect}"
  $order = on(Hrp_confirmation).order_no
end

Then(/^displayed data is same as the selected data in book hotel page$/) do
  booking = data_for(:Hrp_validation).values
  expect(on(Hrp_bookhotel).room_number).to eq booking[0]
end

Then(/^relevant details are displayed$/) do
  fields = data_for(:Hrp_bookingfields).values
  validate = data_for(:Hrp_validatefields).values
  expect(on(Hrp_itinerary).field(fields[0])).to eq validate[0]
  expect(on(Hrp_itinerary).field(fields[1])).to eq $order
  expect(on(Hrp_itinerary).field(fields[2])).to eq validate[1]
  expect(on(Hrp_itinerary).field(fields[3])).to eq validate[2]
  expect(on(Hrp_itinerary).field(fields[4])).to eq validate[3]
  expect(on(Hrp_itinerary).field(fields[5])).to eq validate[4]
  expect(on(Hrp_itinerary).field(fields[6])).to eq ((Time.now).strftime("%d/%m/%Y"))
  expect(on(Hrp_itinerary).field(fields[7])).to eq ((Time.now+(60*60*24*1)).strftime("%d/%m/%Y"))
  expect(on(Hrp_itinerary).field(fields[8])).to eq validate[6]
  expect(on(Hrp_itinerary).field(fields[9])).to eq validate[5]
  expect(on(Hrp_itinerary).field(fields[10])).to eq $price
  expect(on(Hrp_itinerary).field(fields[11])).to eq $final_Price
end

Then(/^Order number is cancelled and no longer exists$/) do
  expect(on(Hrp_itinerary).message).to eq 'Selected booking Are cancelled.'
end

Then(/^title of the login page is displayed$/) do
  expect(on(Hrp_home).title).to eq "AdactIn.com - Search Hotel"
end

Then(/^title of the booking page is displayed$/) do
  expect(on(Hrp_itinerary).title).to eq "AdactIn.com - Select Hotel"
end

Then(/^title of the select hotel page is displayed$/) do
  expect(on(Hrp_selecthotel).title).to eq "AdactIn.com - Select Hotel"
end

Then(/^title of the confirmation page is displayed$/) do
  expect(on(Hrp_selecthotel).title).to eq "AdactIn.com - Book A Hotel"
end

Then(/^all fields are non editable$/) do
  fields = data_for(:Hrp_bookingfields).values
  expect(on(Hrp_itinerary).enable(fields[0])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[1])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[2])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[3])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[4])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[5])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[6])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[7])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[8])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[9])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[10])).to eq 'false'
  expect(on(Hrp_itinerary).enable(fields[11])).to eq 'false'
end