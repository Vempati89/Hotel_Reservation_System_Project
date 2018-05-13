Then(/^Username is displayed on the screen$/) do
  username = data_for(:Hrp_username).values
  puts "#{on(Hrp_home).usrnme.inspect}"
  saveScreenShot
  expect(on(Hrp_home).usrnme). to eq username[0]
end


Then(/^System reports an error message$/) do
  messages = data_for(:Hrp_errors).values
  puts "#{on(Hrp_home).checkin_msg.inspect}"
  puts "#{on(Hrp_home).checkout_msg.inspect}"
  saveScreenShot
  expect(on(Hrp_home).checkin_msg). to eq messages[0]
  expect(on(Hrp_home).checkout_msg). to eq messages[1]
end