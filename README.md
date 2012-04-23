Pluggable Tests example
=====================================

Given by Dima Kovalenko and Jeff Rogers at Selenium Conference 2012
http://www.seleniumconf.org/

### Getting Started

You will need ruby, git for starters.

```bash
git clone git://github.com/dimacus/Pluggable-Tests.git
cd Pluggable-Tests
gem install bundler
bundle install
```
You might need to execute these commands with sudo on your local machine.

### To execute full demo

```bash
rake all
```


### To run the iPhone example
You will need iPhone SDK installed on your computer. The pre-compiled iWebdriver is included, but it is older version so it might be buggy.


### To run Sauce example

You will need to have a valid saucelabs username and API key for that account.

You can get a free account here http://saucelabs.com

Once you created the account, and found your username and API key, provide that info like this

```bash
export SAUCE_USERNAME=username
export SAUCE_KEY=api_key
```


### Different Rake tasks

rake all       # Run all tests
rake api       # API tests
rake iphone    # iPhone tests
rake sauce     # Sauce tests
rake selenium  # Selenium tests
rake touch     # Touch tests




