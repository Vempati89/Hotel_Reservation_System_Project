class Hrp_bookhotel
  include PageObject

  text_field(:name_hotel, id:'hotel_name_dis')
  text_field(:location_hotel, id:'location_dis')
  text_field(:room_type, id:'room_type_dis')
  text_field(:gst, id:'gst_dis')
  text_field(:total_days, id:'total_days_dis')
  text_field(:room_number, id:'room_num_dis')
  text_field(:final_bill, id:'final_price_dis')
  text_field(:night_price, id:'price_night_dis')
  text_field(:price_total, id:'total_price_dis')
  text_field(:first_name, id:'first_name')
  text_field(:last_name, id:'last_name')
  text_area(:billing_address, id:'address')
  text_field(:credit_card, id: 'cc_num')
  select_list(:select_card, id:'cc_type')
  select_list(:select_month, id: 'cc_exp_month')
  select_list(:select_year, id:'cc_exp_year')
  text_field(:cvv, id:'cc_cvv')
  button(:book_now, id: 'book_now')
  button(:cancel, id: 'cancel')

  def total_price
    price_total.gsub("AUD", "").gsub("$","").to_i
  end

  def bill
    final_bill.gsub("AUD","").gsub("$","").to_i
  end

  def tax
    gst.gsub("AUD","").gsub("$","").to_i
  end
  end