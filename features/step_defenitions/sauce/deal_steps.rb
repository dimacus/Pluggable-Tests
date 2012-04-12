require 'rubygems'
require "selenium-webdriver"
require 'sauce'
require 'hpricot'


Given /^I am viewing all deals for San Francisco$/ do

  sauce_params = Hash.new

  sauce_params[:browser] = "iexplore"
  sauce_params[:browser_version] = "9."
  sauce_params[:job_name] = "Job with timestamp: #{Time.now.strftime('%s')}"
  sauce_params[:os] = "Windows 2008"
  sauce_params[:username] = ENV['SAUCE_USERNAME']
  sauce_params[:access_key] = ENV['SAUCE_KEY']

  @driver = Sauce::Selenium2.new(sauce_params)
  @driver.navigate.to "http://www.groupon.com/san-francisco/all"
end

Then /^I should see a list of deals related to San Francisco$/ do
  @driver.title.should == "All San Francisco Deals | Groupon"

  page_source = Hpricot(@driver.page_source)
  page_source.search("div.deal").size.should > 0
  page_source.at("h2#new_drawer_anchor a").inner_text.should == "San Francisco"

  sleep 5
  @driver.stop
end
