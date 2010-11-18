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

  Scenario: View a Post
    Given a post titled "Testing timez" with body "Awww yeah!"
    When I go to the list of posts
    And I follow "Testing timez"
    Then I should see "Testing timez"
    And I should see "Awww yeah!"

  Scenario: Create Post
    When I create a new post titled "Hello, World" with body "How are you?"
    And I go to the list of posts
    Then I should see "Hello, World"
    And I should see "How are you?"

  Scenario: Edit a Post
    Given a post titled "Can editz?" with body "Pleeaseeeeee?"
    When I go to the list of posts
    And I follow "Can editz?"
    And I follow "Edit"
    And I fill in "Title" with "Of course!"
    And I fill in "Body" with ":)"
    And I press "Save"
    And I go to the list of posts
    Then I should see "Of course!"
    And I should see ":)"

  @wip
  Scenario: Delete a Post
    Given a post titled "Still here" with body "Or am I?"
    When I go to the list of posts
    And I follow "Still here"
    And I delete the post
    Then I should not see "Still here"
    And I should not see "Or am I?"
