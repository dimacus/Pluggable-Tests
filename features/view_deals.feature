
Feature: User should be able to view all deals for a given city

  Scenario: User views all deals for the city of Chicago
     Given I am viewing all deals for San Francisco
     Then I should see a list of deals related to San Francisco
