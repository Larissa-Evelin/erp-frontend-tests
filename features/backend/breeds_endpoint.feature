Feature: GET /breeds Endpoint - Cat Breeds Retrieval

  # ----------------------------------------------------------
  # This feature validates the GET /breeds endpoint from
  # https://catfact.ninja/
  #
  # Validation of API contract includes:

  # - The existence of the main response fields, such as "current_page" and "data"
  # - Verification that the "data" field is an array
  # - Verification that each object inside the array contains the required fields:
  #   "breed", "country", "origin", "coat", and "pattern"
  # - Verification that the data types are correct
  #   (for example, string type for breed-related fields)
  # ----------------------------------------------------------

  As an API consumer
  I want to retrieve cat breeds information
  So that I can use breed data in my application

  # ==========================================
  # Happy Paths
  # ==========================================

  Scenario: Retrieve breeds successfully
    When a GET request is sent to "/breeds"
    Then the response status code should be 200
    And the response body should contain a "data" array

  Scenario: Retrieve breeds using limit parameter
    When a GET request is sent to "/breeds?limit=7"
    Then the response status code should be 200
    And the response field "per_page" should be equal to 7
    And the "data" array size should be less than or equal to 7

  Scenario: Validate breed object structure
    When a GET request is sent to "/breeds"
    Then each item inside "data" should contain:
        | breed   |
        | country |
        | origin  |
        | coat    |
        | pattern |

  # ==========================================
  # Unhappy Paths
  # ==========================================

  Scenario: Send invalid limit parameter
    When a GET request is sent to "/breeds?limit=abc"
    Then the API should return a validation error

  Scenario: Send negative limit parameter
    When a GET request is sent to "/breeds?limit=-1"
    Then the API should return a validation error