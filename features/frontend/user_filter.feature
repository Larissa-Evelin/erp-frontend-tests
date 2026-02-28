Feature: User Search - Filter Fields Validation

  As a system user
  I want to filter registered users
  So that I can easily find specific records

  Background:
    Given the user is on the User Search screen
    And all filter fields are blank

  # ===============================
  # Happy Paths
  # ===============================

  Scenario: Filter users by Person Type only
    When the user selects a valid option in "Person Type"
    And clicks the "Filter" button
    Then the system should display only users with the selected Person Type

  Scenario: Filter users by Name only
    When the user enters a valid name in the "Name" field
    And clicks the "Filter" button
    Then the system should display users whose names match the entered value

  Scenario: Filter users by Email only
    When the user enters a valid email in the "Email" field
    And clicks the "Filter" button
    Then the system should display users whose email matches the entered value

  # ===============================
  # Unhappy Paths
  # ===============================

  Scenario: Attempt to filter using an invalid email format
    When the user enters an invalid email format in the "Email" field
    And clicks the "Filter" button
    Then the system should display a validation message for invalid email
    And the filter should not be applied

  Scenario: Clear all filters
    Given at least one filter field is filled
    When the user clicks the "Clear Filter" button
    Then all filter fields should be reset to blank
    And the user list should return to the default state