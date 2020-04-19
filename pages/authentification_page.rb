require 'selenium-webdriver'
require_relative '../utility/excelreader'
class LoginPage

  USER_NAME = {name:'uid'}
  PASSWORD = {name:'password'}
  LOGIN_BUTTON = {name:'btnLogin'}

  attr_reader :driver

  def initialize(driver)
    @driver = driver

  end

  def login_site()
    driver.find_element(USER_NAME).send_keys read_excel( "./Data/data.xlsx", "Sheet1",2,2)
    driver.find_element(PASSWORD).send_keys read_excel("./Data/data.xlsx", "Sheet1",2,3)
    driver.find_element(LOGIN_BUTTON).click
  end

end