*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    ../libraries/BreedsLibrary.py

*** Keywords ***
Create API Session
    [Documentation]    Creates the base session for the API
    Create Session    catapi    ${BASE_URL}    disable_warnings=1

a GET request is sent to "${endpoint}"
    [Documentation]    Sends a GET request and stores the response
    ${response}=    GET On Session    catapi    ${endpoint}    expected_status=any
    Set Suite Variable    ${response}

the response status code should be ${status}
    [Documentation]    Validates the HTTP status code
    Should Be Equal As Integers    ${response.status_code}    ${status}

the response body should contain a "${field}" array
    [Documentation]    Checks if the main field (like 'data') exists
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    ${field}

validate breed structure
    [Documentation]    Calls the Python library to validate the JSON contract
    ${json}=    Set Variable    ${response.json()}
    # Chamada da função Python passando a lista 'data' como argumento
    Validate Breed Contract    ${json["data"]}