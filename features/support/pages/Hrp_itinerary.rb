class Hrp_itinerary
  include PageObject

  text_field(:order_id, id:'order_id_text')
  button(:go, id: 'search_hotel_id')
  # text_field(:order_id_number, xpath:'//[contains(@id, 'order_id-')]')
  button(:cancel, text: /Cancel$/)
  buttons(:options, class:'reg_button')
  text_field(:hotel_Name, id:'hotel_name_253365')
  text_field(:loc, id: 'location_253365')
  text_field(:rom, id: 'rooms_253365')
  text_field(:fir_name, id:'first_name_253365')
  text_field(:las_name, id:'last_name_253365')
  text_field(:arr_date, id:'arr_date_253365')
  text_field(:dep_date, id:'dep_date_253365')
  text_field(:days_number, id:'no_days_253365')
  text_field(:rooms_Type, id:'room_type_253365')
  text_field(:night_Price, id:'price_night_253365')
  text_field(:total_Price, id:'total_price_253365')
  button(:logoff, id:'logout')
  button(:search_hotel, id:'search_hotel')
  text_fields(:all_values, class:'select_text')
  table(:values, xpath:'//*[@id="booked_form"]/table/tbody/tr[2]/td/table/tbody/tr[2]')
  checkbox(:cancel_box, name: 'ids[]')
  button(:cancel_selected, name:'cancelall')
  label(:message, id:'search_result_error')

  def field(name)
    index = all_values_elements.find_index {|text_field| text_field.name.match? /#{name}/}
    all_values_elements[index.to_i].value
  end

  def select_buttons(name)
    index = options_elements.find_index {|button| button.name.match? /#{name}/}
   options_elements[index.to_i].click
  end

  def enable(name)
    index = all_values_elements.find_index {|text_field| text_field.name.match? /#{name}/}
    all_values_elements[index.to_i].enabled?
  end

end