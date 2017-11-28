Feature: Wikipedia Search
As a user
I want to search articles
So I can find relevant information

@javascript
Scenario: User search "Cucumber"
Given I go to the homepage
And I fill in "Search Wikipedia" with "Cucumber (software)"
When I press "Go to a page with this exact name if it exists"
Then I should see "Cucumber is a software tool used by computer programmers for testing other software"
