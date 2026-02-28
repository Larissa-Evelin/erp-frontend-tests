*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    ../libraries/BreedsLibrary.py

*** Keywords ***
Create API Session
    Create Session    catapi    ${BASE_URL}    disable_warnings=1

Que envio GET para "${endpoint}"
    ${response}=    GET On Session    catapi    ${endpoint}    expected_status=any
    Set Suite Variable    ${response}

O status code deve ser ${status}
    Should Be Equal As Integers    ${response.status_code}    ${status}

O campo "${campo}" deve existir
    Dictionary Should Contain Key    ${response.json()}    ${campo}

Validar contrato das raças
    ${json}=    Set Variable    ${response.json()}
    # Chamada da nossa biblioteca Python customizada
    Validate Breed Contract    ${json["data"]}