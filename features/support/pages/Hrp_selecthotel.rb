class Hrp_selecthotel
  include PageObject

  text_field(:hotel_name, id:'hotel_name_0')
  text_field(:location, id:'location_0')
  text_field(:no_of_rooms, id:'rooms_0')
  text_field(:arrival_date, id:'arr_date_0')
  text_field(:departure_date, id:'dep_date_0')
  text_field(:no_of_days, id:'no_days_0')
  text_field(:room_type, id:'room_type_0')
  text_field(:price_night, id:'price_night_0')
  text_field(:total_price, id:'total_price_0')
  table(:select_hotel, xpath: '//*[@id="select_form"]/table/tbody/tr[2]/td/table')
  button(:continue, id: 'continue')
  button(:cancel, id:'cancel')
  radio_button(:hotel_select, id:'radiobutton_0')
  link(:booking, href:'BookedItinerary.php')

  def numrooms
    no_of_rooms.gsub("Room", "").to_i
  end

  def number_of_days
    no_of_days.gsub("Days", "").to_i
  end

  def price_per_night
    price_night.gsub("AUD","").gsub("$","").to_i
  end

  def final_price
    total_price.gsub("AUD","").gsub("$","").to_i
  end

end

