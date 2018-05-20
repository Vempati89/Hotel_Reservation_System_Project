module Access

  def hrp_customer_login
    obj = on(Hrp_login)
    obj.populate_page_with data_for(:Hrp_login)
    expectedpassword = data_for(:Hrp_login).values
    obj.password = Base64.decode64(expectedpassword[1])
    saveScreenShot
    obj.login
  end

  def hrp_customer_logout
    on(Hrp_home).logout
  end
end