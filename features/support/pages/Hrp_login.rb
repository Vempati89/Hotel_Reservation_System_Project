class Hrp_login
  include PageObject

  text_field(:username, name: 'username')
  text_field(:password,name: 'password')
  button(:login, name: 'login')
  link(:new_user, href:'Register.php')
  link(:forgot_pwd, href:'ForgotPassword.php')
  link(:build_2, xpath:'/html/body/table[2]/tbody/tr/td[2]/table/tbody/tr[2]/td/ul/li[2]/a')
  link(:build_1,xpath: '/html/body/table[2]/tbody/tr/td[2]/table/tbody/tr[2]/td/ul/li[1]/a')

 end

