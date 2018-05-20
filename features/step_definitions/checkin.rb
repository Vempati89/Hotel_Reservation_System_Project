When(/^User enters a check in date later than the check out date field$/) do
  on(Hrp_home).populate_page_with data_for(:Hrp_checkindetails )
  on(Hrp_home).checkin= ((Time.now+(60*60*24*7)).strftime("%d/%m/%Y"))
  on(Hrp_home).checkout= ((Time.now+(60*60*24*5)).strftime("%d/%m/%Y"))
  saveScreenShot
  on(Hrp_home).search
end

When(/^User enters dates as past dates$/) do
  on(Hrp_home).populate_page_with data_for(:Hrp_checkindetails )
  on(Hrp_home).checkin= ((Time.now+(60*60*24*-7)).strftime("%d/%m/%Y"))
  on(Hrp_home).checkout= ((Time.now+(60*60*24*-5)).strftime("%d/%m/%Y"))
  saveScreenShot
  on(Hrp_home).search
end

When(/^User enters search hotel data$/) do
  on(Hrp_home).populate_page_with data_for(:Hrp_checkindetails )
  on(Hrp_home).checkin= ((Time.now).strftime("%d/%m/%Y"))
  on(Hrp_home).checkout= ((Time.now+(60*60*24*1)).strftime("%d/%m/%Y"))
  saveScreenShot
  on(Hrp_home).search
end