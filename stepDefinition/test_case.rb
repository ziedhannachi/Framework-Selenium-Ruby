require_relative '../pages/login_page_elements'
require_relative '../report'
require_relative '../utility/excelreader'
require_relative '../pages/home_page'
require 'selenium-webdriver'
options = Selenium::WebDriver::Chrome::Options.new(args: ['headless'])
if read_excel("/data.xlsx", "Sheet1",2,4) == 'Yes'
  @driver = Selenium::WebDriver.for(:chrome, options: options)
else
  @driver= Selenium::WebDriver.for(:chrome)
end
create_report
insert_head_title ("Report for the Ruby Selenium Automation Framework - Kushan Amarasiri")
insert_reportname_date("My Test Report",$result_date )
start_table

@driver.navigate.to(read_excel("./Data/data.xlsx", "Sheet1",2,1))

report_row("Navigated to the login page","Navigated to the login page","Chrome","PASS", @driver.title)

login = LoginPage.new(@driver)
login.login_site
report_row("Logged into the site successfully","Logged into the site successfully","Chrome","PASS", "Verified login")
homepage = HomePage.new(@driver)

if homepage.verify_heading == true
  report_row("Navigated to home page","Navigated to home page","Chrome","PASS", "Home page navigation")
else
  report_row("Navigated to home page","Navigated to home page","Chrome","FAIL", "Login Failed")
end

close_table

