require_relative '../Pages/LoginPage'
require_relative '../Pages/HomePage'
require_relative '../Utility/report'
require 'json'
require 'selenium-webdriver'

@driver = Selenium::WebDriver.for(:chrome)
@file = File.read( "../Data/data.json")
@data_hash = JSON.parse(@file)
url_site = @data_hash['URL']
create_report
insert_head_title ("Report for the Ruby Selenium Automation Framework - Zied Hannachi")
insert_reportname_date("My Test Report",$result_date )
start_table
@driver.navigate.to(url_site)
report_row("Navigated to the login page","Navigated to the login page","Chrome","PASS", @driver.title)
login = LoginPage.new(@driver)
login.login_site
homepage = HomePage.new(@driver)
homepage.verify_heading
if homepage.verify_heading == true
  report_row("Navigated to home page","Navigated to home page","Chrome","PASS", "Home page navigation")
else
  report_row("Navigated to home page","Navigated to home page","Chrome","FAIL", "Login Failed")
end

close_table
