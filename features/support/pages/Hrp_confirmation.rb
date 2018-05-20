class Hrp_confirmation
  include PageObject

  text_field(:order_no, id:'order_no')
  text_field(:ppn, id: 'price_night')
  text_field(:fp, id:'final_price')
  button(:itinerary, id:'my_itinerary')
  button(:logout, id:'logout')
  button(:search_hotel, id:'search_hotel')

  def final_price
    ffp = fp.gsub("AUD","").gsub("$","").to_f.round(0)
    "AUD $ #{ffp}"
  end
end