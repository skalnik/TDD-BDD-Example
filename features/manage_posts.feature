Feature: Manage Posts
  In order to have an awesome blog
  As an author
  I want to be able to view and manage posts

  Scenario: List of Posts
    Given posts titled Hello, Ohai, Y hello thar
    When I go to the list of posts
    Then I should see "Hello"
    And I should see "Ohai"
    And I should see "Y hello thar"

  @wip
  Scenario: Create Post
    When I create a new post titled "Hello, World" with body "How are you?"
    And I go to the list of posts
    Then I should see "Hello, World"
    And I should see "How are you?"
