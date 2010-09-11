Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes

  Background:
    Given there is an admin with the email address "admin@ticketee.com" and password "password"
    And I am signed in as them
    
    And there is a user with the email address "user@ticketee.com" and password "password"
    And there is a project called "TextMate 2"
    And "user@ticketee.com" has created a ticket for this project:
      | title  | description       |
      | Shiny! | Eye-blindingly so |
    Given there is a state called "Open"
 
    And there is a project called "Internet Explorer"
 
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@ticketee.com"
    And I follow "Permissions"

  Scenario: Viewing a project
    When I check "Read" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    
    Given I am signed in as "user@ticketee.com"
    Then I should see "TextMate 2"     
    And I should not see "Internet Explorer"

  Scenario: Creating tickets for a project
    When I check "Read" for "TextMate 2"
    When I check "Create tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "New Ticket"
    And I fill in "Title" with "Shiny!"
    And I fill in "Description" with "Make it so!"
    And I press "Create"
    Then I should see "Ticket has been created."


  Scenario: Updating a ticket for a project
    When I check "Read" for "TextMate 2"
    And I check "Edit tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    
    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    And I follow "Edit"
    And I fill in "Title" with "Really shiny!"
    And I press "Update Ticket"
    Then I should see "Ticket has been updated"

  Scenario: Deleting a ticket for a project
    When I check "Read" for "TextMate 2"
    And I check "Delete tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    
    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    And I follow "Delete"
    Then I should see "Ticket has been deleted."
    
  Scenario: Changing states for a ticket 
    When I check "Read" for "TextMate 2"
    And I check "Change States" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    
    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should see "" within "#ticket #state"
    When I fill in "Text" with "Opening this ticket."
    And I select "Open" from "State"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    And I should see "Open" within "#ticket #state"

    
