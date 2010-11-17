Feature: Manage Posts
  In order to have an awesome blog
  As an author
  I want to be able to view and manage posts

  @wip
  Scenario: List of Posts
    Given posts titled Hello, Ohai, Y hello thar
    When I go to the list of posts
    Then I should see "Hello"
    And I should see "Ohai"
    And I should see "Y hello thar"
