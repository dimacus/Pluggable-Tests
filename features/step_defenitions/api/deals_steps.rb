require 'hpricot'
require 'net/http'
require 'test/unit'

Given /^I am viewing all deals for San Francisco$/ do
  @xml = Hpricot(Net::HTTP.get URI.parse("http://api.groupon.com/v2/deals/metropark.xml?client_id=191c12944d06901822006221e6c44db67ed61803"))
end

Then /^I should see a list of deals related to San Francisco$/ do
  @xml.search("//deal").each do |deal|
    deal.at("//division/name").inner_text.should == "San Francisco"
  end
end
