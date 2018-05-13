class Hrp_home
  include PageObject
  text_field(:usrnme, id:'username_show')
  link(:logout, href:'Logout.php')
  select_list(:location, id:'location')
  select_list(:hotels, id:'hotels')
  select_list(:roomtype, id:'room_type')
  select_list(:roomnos, id:'room_nos')
  select_list(:adults, id:'adult_room')
  select_list(:children, id:'child_room')
  text_field(:checkin, id: 'datepick_in')
  text_field(:checkout, id:'datepick_out')
  span(:checkin_msg, id:'checkin_span')
  span(:checkout_msg, id:'checkout_span')
  button(:search, id:'Submit')

end