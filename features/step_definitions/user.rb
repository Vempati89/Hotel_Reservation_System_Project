Given(/^User enters data from (.*)$/) do |datafile|
  envvariable = "#{@datafolder}/#{datafile}.yml"
  DataMagic.load(envvariable)
  hrp_customer_login
end

When(/^User logs into application$/) do
  visit(Hrp_home)
  saveScreenShot
end

And(/^User selects (.*)$/) do |buildtype|
  on(Hrp_login).send("#{buildtype}")
  saveScreenShot
end