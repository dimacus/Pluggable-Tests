require 'rubygems'
require 'sinatra'
require "selenium-webdriver"
require 'hpricot'

require 'sim_launcher'


Given /^I am viewing all deals for San Francisco$/ do
    simulator = SimLauncher::DirectClient.for_iphone_app( ENV['IPHONE_SYM_PATH'], '4.3' )
  simulator.relaunch()

  # see if iWebDriver is loaded(contact the host)
  # retry a few times just incase
  connected = false
  (0..2).each do
    begin
      Net::HTTP.new("localhost", 3005).start
      connected = true
      break
    rescue
      # sleep for two seconds
      sleep(2)
    end
  end

  unless connected
    raise 'Could not launch iPhone webdriver'
  end


  @driver = Selenium::WebDriver.for :remote, :url => "http://localhost:3005/hub", :desired_capabilities => :iphone

  @driver.navigate.to "http://groupon.com"
  @driver.find_element(:link, "No thanks, continue to site.").click
  @driver.navigate.to "http://touch.groupon.com/san-francisco"

end

Then /^I should see a list of deals related to San Francisco$/ do


  @driver.title.should == "Groupon Deal of the Day"

  page_source = Hpricot(@driver.page_source)

  page_source.search("ul.ranked_deals li").size.should > 0
  page_source.at("a.city").inner_text.should == "San Francisco"

  sleep 5
  @driver.quit
  `/usr/bin/osascript -e 'application "iPhone Simulator" quit'`
end

