require 'selenium-webdriver'
class HomePage

  HOMEPAGE_HEADING= { xpath: '/html/body/div[2]/h2'}


  attr_reader :driver

  def initialize(driver)
    @driver = driver

  end

  def verify_heading()
    if driver.find_element(HOMEPAGE_HEADING).displayed?
      return true
    else
      return false
    end

  end

  end
