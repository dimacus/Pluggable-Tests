require 'cucumber/rake/task'



  Cucumber::Rake::Task.new(:api, 'API tests') do |t|
    t.profile = 'api'
  end

  Cucumber::Rake::Task.new(:selenium, 'Selenium tests') do |t|
    t.profile = 'selenium'
  end

  Cucumber::Rake::Task.new(:touch, 'Touch tests') do |t|
    t.profile = 'touch'
  end


  desc "iPhone tests"
  task :iphone do
    unless ENV['IPHONE_SYM_PATH']
      puts "\n\nCan't run iPhone tests unless you provide the path to the iPhone webdriver"
      puts "Example: "
      puts "export IPHONE_SYM_PATH=/path/to/iPhone/webdriver\n\n"
      puts "Skipping iPhone...\n\n"
    end

    Rake::Task[:iphone_runner].invoke

  end

  Cucumber::Rake::Task.new(:iphone_runner) do |t|
    t.profile = 'iphone'
  end
