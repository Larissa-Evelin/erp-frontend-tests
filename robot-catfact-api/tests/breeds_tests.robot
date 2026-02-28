*** Settings ***
Documentation     Tests for the GET /breeds endpoint of the Cat Facts API.
Resource          ../resources/keywords.robot
Resource          ../resources/variables.robot

Suite Setup       Create API Session

*** Test Cases ***
Happy Path - Retrieve cat breeds list
    [Tags]    smoke
    When a GET request is sent to "/breeds"
    Then the response status code should be 200
    And the response body should contain a "data" array
    And validate breed structure

Unhappy Path - Invalid limit parameter
    [Documentation]    Verifies behavior when a string is passed to the limit parameter.
    When a GET request is sent to "/breeds?limit=abc"
    Then the response status code should be 200

Unhappy Path - Negative limit parameter
    [Documentation]    Verifies behavior with a negative limit.
    When a GET request is sent to "/breeds?limit=-1"
    Then the response status code should be 404