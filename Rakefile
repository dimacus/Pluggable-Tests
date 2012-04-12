require 'cucumber/rake/task'

namespace :cucumber do


  Cucumber::Rake::Task.new(:api, 'API tests') do |t|
    t.profile = 'api'
  end

  Cucumber::Rake::Task.new(:selenium, 'Selenium tests') do |t|
    t.profile = 'selenium'
  end

  Cucumber::Rake::Task.new(:touch, 'Touch tests') do |t|
    t.profile = 'touch'
  end

  Cucumber::Rake::Task.new(:iphone, 'iPhone tests') do |t|
    t.profile = 'iphone'
  end

end