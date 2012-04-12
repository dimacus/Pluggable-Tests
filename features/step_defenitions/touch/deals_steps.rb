require 'rubygems'
require 'selenium-webdriver'
require 'hpricot'

Given /^I am viewing all deals for San Francisco$/ do
  @driver = Selenium::WebDriver.for :firefox

  @driver.navigate.to "http://touch.groupon.com"
  @driver.navigate.to "http://touch.groupon.com/san-francisco"

end

Then /^I should see a list of deals related to San Francisco$/ do

  @driver.title.should == "Groupon Deal of the Day"

  page_source = Hpricot(@driver.page_source)

  page_source.search("ul.ranked_deals li").size.should > 0
  page_source.at("a.city").inner_text.should == "San Francisco"

  sleep 5
  @driver.close
end
