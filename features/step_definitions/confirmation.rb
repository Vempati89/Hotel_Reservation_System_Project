And(/^User completes the booking confirmation$/) do
  on(Hrp_bookhotel).populate_page_with data_for(:Hrp_booking )
  on(Hrp_bookhotel).select_card= 'VISA'
  on(Hrp_bookhotel).select_month= 'April'
  on(Hrp_bookhotel).select_year= '2020'
  saveScreenShot
  on(Hrp_bookhotel).book_now
end