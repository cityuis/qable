Feature: Search
As a user
I want to search web pages
So I can find relevant information

@javascript
Scenario: User search "Able.co"
Given I go to the homepage
And I fill in "q" with "Able.co"
When I press "Google Search"
Then I should see "Able owns, operates, and invests in a portfolio of technology companies"
