require 'rubygems'
require 'selenium-webdriver'
require 'hpricot'

Given /^I am viewing all deals for San Francisco$/ do
  @driver = Selenium::WebDriver.for :firefox
  @driver.navigate.to "http://www.groupon.com/san-francisco/all"
end

Then /^I should see a list of deals related to San Francisco$/ do

  @driver.title.should == "All San Francisco Deals | Groupon"

  page_source = Hpricot(@driver.page_source)
  page_source.search("div.deal").size.should > 0
  page_source.at("h2#new_drawer_anchor a").inner_text.should == "San Francisco"

  @driver.close
end
